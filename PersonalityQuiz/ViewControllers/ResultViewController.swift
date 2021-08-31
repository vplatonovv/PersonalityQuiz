//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    private var currentType: Animal {
        let cat = answers.filter { $0.animal == .cat }.count
        let dog = answers.filter { $0.animal == .dog }.count
        let rabbit = answers.filter { $0.animal == .rabbit }.count
        let turtle = answers.filter { $0.animal == .turtle }.count
        
        var currentType = Animal.cat
        
        if cat > dog && cat > rabbit && cat > turtle {
            currentType = Animal.cat
        } else if dog > cat && dog > rabbit && dog > turtle {
            currentType = Animal.dog
        } else if rabbit > cat && rabbit > dog && rabbit > turtle {
            currentType = Animal.rabbit
        } else if turtle > cat && turtle > dog && turtle > rabbit {
            currentType = Animal.turtle
        }
        return currentType
    }
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        typeLabel.text = "Вы - \(currentType.rawValue)"
        descriptionLabel.text = "\(currentType.definition)"
        navigationItem.setHidesBackButton(true, animated: true)
    }
}
