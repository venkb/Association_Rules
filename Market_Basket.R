#implementing association rules - market basked analysis

library(arules) #package for implementing association rules


#load the data
setwd('D:\\Venkat\\Villanova\\Data Science Projects\\Association_Rules')
dataset = read.csv('Market_Basket.csv',
                   header = FALSE)

#translate the dataset into sparse matrix
dataset_matrix = read.transactions('Market_Basket.csv',
                            sep = ',',
                            rm.duplicates = TRUE)

summary(dataset_matrix)
itemFrequencyPlot(x = dataset_matrix, topN = 10)

#training apriori on the dataset
rules = apriori(data = dataset_matrix,
                parameter =list(support = 0.004, confidence = 0.2) )

#visualizing the results
inspect(x = sort(rules,by = 'lift')[1:10])

        
        
