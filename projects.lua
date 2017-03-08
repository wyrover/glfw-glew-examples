includeexternal ("premake-vs-include.lua")

workspace "glfw-glew-examples"
    language "C++"
    location "build/%{_ACTION}/%{wks.name}"    
    if _ACTION == "vs2015" then
        toolset "v140_xp"
    end




    function create_sdl_project(name, dir)        
        create_console_project(name, dir)
            includedirs
            {
                "SDL2-2.0.5/include",
                "SDL2_image-2.0.1/include",
                "SDL2_ttf-2.0.14/include",
                --"SDL2_mixer-2.0.1/include"

            }
            links
            {
                "SDL2-2.0.5/lib/x86/SDL2.lib",
                "SDL2_ttf-2.0.14/lib/x86/SDL2_ttf.lib",
                "SDL2_image-2.0.1/lib/x86/SDL2_image.lib",
                --"SDL2_mixer-2.0.1/lib/x86/SDL2_mixer.lib"

            }
    end


    project "glfw"               
        kind "StaticLib"
        removeconfigurations "TRACE*"   
        defines { "_GLFW_WIN32" }
        files
        {
            
            "3rdparty/glfw/include/GLFW/*.h",
            "3rdparty/glfw/src/*.h",
            "3rdparty/glfw/src/*.c",
               
            
        } 
        removefiles
        {
            "3rdparty/glfw/src/nsgl_*",
            "3rdparty/glfw/src/glx_*",
            "3rdparty/glfw/src/x11*",
            "3rdparty/glfw/src/posix*",
            "3rdparty/glfw/src/wl_*",
            "3rdparty/glfw/src/xkb_*",
            "3rdparty/glfw/src/null_*",
            "3rdparty/glfw/src/mir_*",
            "3rdparty/glfw/src/linux_*",
            "3rdparty/glfw/src/cocoa_*",

        }     
        includedirs
        {               
            --"3rdparty/glew/include"     
           
        }  
        vpaths 
        { 
            ["Header Files"] = "**.h",
            ["Source Files"] = "**.c"

        }

        links
        {
            
        }
        buildoptions
        {
            --"/wd4244",                     
            
        }

    
    project "glm"               
        kind "StaticLib"
        removeconfigurations "TRACE*"           
        files
        {            
            "3rdparty/glm/glm/**.cpp",                  
        } 
    
        includedirs
        {               
            "3rdparty/glm"     
           
        }  
        vpaths 
        { 
            ["Header Files"] = "**.h",
            ["Source Files"] = "**.c"

        }

        links
        {
            
        }
        buildoptions
        {
            --"/wd4244",                     
            
        }


        

    group "glew"        

        project "glew"               
            kind "StaticLib"
            removeconfigurations "TRACE*"   
            defines { "VC_EXTRALEAN", "GLEW_STATIC" }
            files
            {
                "3rdparty/glew/include/GL/glew.h",
                "3rdparty/glew/include/GL/wglew.h",
                "3rdparty/glew/src/glew.c",
                "3rdparty/glew/build/glew.rc"           
                
            } 
            removefiles
            {
                

            }     
            includedirs
            {               
                "3rdparty/glew/include"     
               
            }                
            links
            {
                
            }
            buildoptions
            {
                "/wd4244",                     
                
            }

        project "glew_shared"          
            kind "SharedLib"
            targetname "glew"
            removeconfigurations "TRACE*"   
            defines { "VC_EXTRALEAN", "GLEW_BUILD" }
            files
            {
                "3rdparty/glew/include/GL/glew.h",
                "3rdparty/glew/include/GL/wglew.h",
                "3rdparty/glew/src/glew.c",
                "3rdparty/glew/build/glew.rc"           
                
            } 
            removefiles
            {
                

            }     
            includedirs
            {               
                "3rdparty/glew/include"     
               
            }                
            links
            {
                "opengl32.lib"
            }
            buildoptions
            {
                "/wd4244",                     
                
            }


        project "glewinfo"          
            kind "ConsoleApp"     
            characterset "MBCS"
            removeconfigurations "TRACE*"   
            defines { "VC_EXTRA_LEAN", "GLEW_STATIC" }
            files
            {          
                "3rdparty/glew/src/glewinfo.c",
                "3rdparty/glew/build/glewinfo.rc"           
                
            } 
            removefiles
            {
                

            }     
            includedirs
            {               
                "3rdparty/glew/include"     
               
            }                
            links
            {
                "glew",
                "opengl32.lib"
                
            }
            buildoptions
            {
                "/wd4244",                     
                
            }


        project "visualinfo"          
            kind "ConsoleApp"   
            characterset "MBCS"
            removeconfigurations "TRACE*"   
            defines { "VC_EXTRA_LEAN", "GLEW_STATIC" }
            files
            {          
                "3rdparty/glew/src/visualinfo.c",
                "3rdparty/glew/build/visualinfo.rc"           
                
            } 
            removefiles
            {
                

            }     
            includedirs
            {               
                "3rdparty/glew/include"     
               
            }                
            links
            {
                "glew",
                "opengl32.lib",
                "glu32.lib"
            }
            buildoptions
            {
                "/wd4244",                     
                
            }

--    group "glfw-glew-examples"    
--
--        matches = os.matchdirs("src/sdl2*")
--        for i = #matches, 1, -1 do           
--            create_sdl_project(path.getname(matches[i]), "src")
--        end


            


    group "Tutorial1"
        create_glfw_console_project("hello", "src/glfw/Tutorial1")
        create_glfw2_console_project("hellowindow2", "src/glfw/Tutorial1")

    group "Tutorial2"
        create_glfw_console_project("ecg", "src/glfw/Tutorial2")
        create_glfw_console_project("gaussian", "src/glfw/Tutorial2")
        create_glfw_console_project("line", "src/glfw/Tutorial2")
        create_glfw_console_project("point", "src/glfw/Tutorial2")
        create_glfw_console_project("sinusoid", "src/glfw/Tutorial2")
        create_glfw_console_project("triangle", "src/glfw/Tutorial2")       
    group "Tutorial3"
        create_glfw_console_project("mcml", "src/glfw/Tutorial3")
        create_glfw_console_project("gaussian2", "src/glfw/Tutorial3")
    group "Tutorial4"
        create_glfw2_console_project("code_image", "src/glfw/Tutorial4")