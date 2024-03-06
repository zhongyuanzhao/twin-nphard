#!/bin/bash

setval="GCNSTGRP"
echo "NWST training starts"
python3 steiner_gcn_train_twin.py --training_set=${setval} --epsilon=1.0 --epsilon_min=0.002 --gamma=0.99 --feature_size=1 --diver_num=1 --datapath=./data/ --test_datapath=./data/ER_Graph_Uniform_GEN21_test1 --max_degree=1 --predict=mpy --learning_rate=0.0001 --learning_decay=1.0 --hidden1=32 --num_layer=5 --epochs=20 --ntrain=1 --gtype='grp'  > ./output/nwst_training_trace.out ;
echo "NWST test starts"
python3 steiner_gcn_test.py --training_set=${setval} --epsilon=1.0 --epsilon_min=0.002 --gamma=0.99 --feature_size=1 --diver_num=1 --datapath=./data/ --test_datapath=./data/WS_Graph_Uniform_GEN21_test1 --max_degree=1 --predict=mpy --learning_rate=0.0001 --learning_decay=1.0 --hidden1=32 --num_layer=5 --epochs=20 --ntrain=1 --gtype='ws' &
python3 steiner_gcn_test.py --training_set=${setval} --epsilon=1.0 --epsilon_min=0.002 --gamma=0.99 --feature_size=1 --diver_num=1 --datapath=./data/ --test_datapath=./data/BA_Graph_Uniform_GEN21_test1 --max_degree=1 --predict=mpy --learning_rate=0.0001 --learning_decay=1.0 --hidden1=32 --num_layer=5 --epochs=20 --ntrain=1 --gtype='ba' &
python3 steiner_gcn_test.py --training_set=${setval} --epsilon=1.0 --epsilon_min=0.002 --gamma=0.99 --feature_size=1 --diver_num=1 --datapath=./data/ --test_datapath=./data/ER_Graph_Uniform_GEN21_test1 --max_degree=1 --predict=mpy --learning_rate=0.0001 --learning_decay=1.0 --hidden1=32 --num_layer=5 --epochs=20 --ntrain=1 --gtype='er' &
python3 steiner_gcn_test.py --training_set=${setval} --epsilon=1.0 --epsilon_min=0.002 --gamma=0.99 --feature_size=1 --diver_num=1 --datapath=./data/ --test_datapath=./data/GRP_Graph_Uniform_GEN21_test1 --max_degree=1 --predict=mpy --learning_rate=0.0001 --learning_decay=1.0 --hidden1=32 --num_layer=5 --epochs=20 --ntrain=1 --gtype='grp' &
echo "NWST test jobs submitted"
