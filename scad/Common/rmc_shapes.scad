// ============================================================================
// Module: rmc_shapes.scad   
//                                                           
// Copyright (c) 2013 Bob Cousins                                                    
//                                                                           
// Description:                                                             
//   Useful shapes.
//
// ============================================================================

// ****************************************************************************

//       y2
//      +--+
//     /    \
// z  /      \
//   +--------+
//       y1
//     
// extruder in X

module trapezoid (x, y1, y2, z)
{
  translate ([-x/2,0,-z/2])
  
  polyhedron (
    points=[ 
        [0, y1/2,0], 
        [0, y2/2,z],
        [0,-y2/2,z], 
        [0,-y1/2,0],
        [0,-y2/2,0],
        [0, y2/2,0],
        
        [x, -y1/2,0], 
        [x, -y2/2,z],
        [x, y2/2,z], 
        [x, y1/2,0],
        [x, y2/2,0],
        [x, -y2/2,0],
    ],
  
    faces = [
        [0,1,5], [5,1,2], [2,3,4], [4,5,2], 
        [3,2,7], [7,6,3],
        [1,8,2], [2,8,7],
        [9,8,1], [1,0,9],
        [3,6,9], [9,0,3],
        [6,7,11], [7,8,11], [8,10,11], [8,9,10]
    ]); 
}

// ****************************************************************************

//
//      +
// z   / \
//    /   \
//   +-----+
//      y
//
// A triangle extruded in X

module prism (x, y, z)
{
  translate ([0,0,-z/2])
  polyhedron (points=[[0,-y/2,0], [0,0,z], [0,y/2,0], [x,-y/2,0], [x,0,z], [x,y/2,0]],
    faces = [[2,1,0], [1,2,4], [2,5,4], [3,4,5], [0,1,4], [4,3,0], [5,2,0], [3,5,0]]); 
}


// ****************************************************************************
