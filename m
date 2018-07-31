Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5279A78DB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 10:52:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2018 03:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,427,1526367600"; d="scan'208";a="244775047"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 31 Jul 2018 03:52:19 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 4B4C75801C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 03:52:19 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 13:53:30 +0300
Message-Id: <1533034411-26881-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] vulkan: upgrade to version 1.1.73.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2018 10:52:23 -0000

Refresh the patch:
        demos-Don-t-build-tri-or-cube.patch

License-Update: Updates in copyright information.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../vulkan/demos-Don-t-build-tri-or-cube.patch     | 110 ++++++++++++---------
 .../{vulkan_1.0.65.2.bb => vulkan_1.1.73.0.bb}     |   7 +-
 2 files changed, 69 insertions(+), 48 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan_1.0.65.2.bb => vulkan_1.1.73.0.bb} (88%)

diff --git a/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch b/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
index bcf84a5..b0b9fc4 100644
--- a/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
+++ b/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
@@ -1,21 +1,30 @@
-commit f63cbe944107b5cd8f150ceaaec43b26099d5688
+From 9b13be109bc66f4d4a1ad53ce5c92c7c495e41d7 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Tue, 24 Jul 2018 17:40:52 +0300
+Subject: [PATCH] commit f63cbe944107b5cd8f150ceaaec43b26099d5688
+
 Author: Adam Jackson <ajax@redhat.com>
 Date:   Tue Feb 16 10:05:25 2016 -0500
 
-    demos: Don't build tri or cube
-    
-    There are more interesting demos, all we really want here is vulkaninfo.
-    This helps because we don't need to pre-build glslang/llvm/lunarglass
-    just to get the loader and layers.
+demos: Don't build tri or cube
+
+There are more interesting demos, all we really want here is vulkaninfo.
+This helps because we don't need to pre-build glslang/llvm/lunarglass
+just to get the loader and layers.
 
 Upstream-Status: Inappropriate [configuration]
+
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ demos/CMakeLists.txt | 88 ----------------------------------------------------
+ 1 file changed, 88 deletions(-)
 
-Index: git/demos/CMakeLists.txt
-===================================================================
---- git.orig/demos/CMakeLists.txt
-+++ git/demos/CMakeLists.txt
-@@ -63,46 +63,6 @@ elseif(UNIX)
+diff --git a/demos/CMakeLists.txt b/demos/CMakeLists.txt
+index 4f32679..26e4cdf 100644
+--- a/demos/CMakeLists.txt
++++ b/demos/CMakeLists.txt
+@@ -93,42 +93,6 @@ elseif(UNIX)
  else()
  endif()
  
@@ -37,38 +46,40 @@ Index: git/demos/CMakeLists.txt
 -        endif()
 -    endforeach()
 -
--    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/demos/cube-vert.spv
--       COMMAND ${GLSLANG_VALIDATOR} -s -V -o ${CMAKE_BINARY_DIR}/demos/cube-vert.spv ${PROJECT_SOURCE_DIR}/demos/cube.vert
--       DEPENDS cube.vert ${GLSLANG_VALIDATOR}
--       )
--    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/demos/cube-frag.spv
--       COMMAND ${GLSLANG_VALIDATOR} -s -V -o ${CMAKE_BINARY_DIR}/demos/cube-frag.spv ${PROJECT_SOURCE_DIR}/demos/cube.frag
--       DEPENDS cube.frag ${GLSLANG_VALIDATOR}
--       )
 -   file(COPY cube.vcxproj.user DESTINATION ${CMAKE_BINARY_DIR}/demos)
 -   file(COPY vulkaninfo.vcxproj.user DESTINATION ${CMAKE_BINARY_DIR}/demos)
--else()
--    if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL ${CMAKE_HOST_SYSTEM_PROCESSOR})
--        add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/demos/cube-vert.spv
--            COMMAND ${GLSLANG_VALIDATOR} -s -V -o cube-vert.spv ${PROJECT_SOURCE_DIR}/demos/cube.vert
--            DEPENDS cube.vert ${GLSLANG_VALIDATOR}
--            )
--        add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/demos/cube-frag.spv
--            COMMAND ${GLSLANG_VALIDATOR} -s -V -o cube-frag.spv ${PROJECT_SOURCE_DIR}/demos/cube.frag
--            DEPENDS cube.frag ${GLSLANG_VALIDATOR}
--            )
--    endif()         
 -endif()
+-
+-add_custom_command(
+-    COMMENT "Compiling cube demo vertex shader"
+-    OUTPUT cube.vert.inc
+-    COMMAND ${GLSLANG_VALIDATOR} -V -x -o ${CMAKE_CURRENT_BINARY_DIR}/cube.vert.inc ${PROJECT_SOURCE_DIR}/demos/cube.vert
+-    MAIN_DEPENDENCY ${PROJECT_SOURCE_DIR}/demos/cube.vert
+-    DEPENDS ${PROJECT_SOURCE_DIR}/demos/cube.vert ${GLSLANG_VALIDATOR}
+-)
+-add_custom_command(
+-    COMMENT "Compiling cube demo fragment shader"
+-    OUTPUT cube.frag.inc
+-    COMMAND ${GLSLANG_VALIDATOR} -V -x -o ${CMAKE_CURRENT_BINARY_DIR}/cube.frag.inc ${PROJECT_SOURCE_DIR}/demos/cube.frag
+-    MAIN_DEPENDENCY ${PROJECT_SOURCE_DIR}/demos/cube.frag
+-    DEPENDS ${PROJECT_SOURCE_DIR}/demos/cube.frag ${GLSLANG_VALIDATOR}
+-)
  
- if(WIN32)
-     include_directories (
-@@ -116,43 +76,6 @@ endif()
- add_executable(${API_LOWERCASE}info vulkaninfo.c)
- target_link_libraries(${API_LOWERCASE}info ${LIBRARIES})
+ include_directories(${CMAKE_CURRENT_BINARY_DIR})
  
--if(NOT WIN32)
+@@ -172,55 +136,3 @@ if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
+         install(TARGETS ${API_LOWERCASE}info DESTINATION ${CMAKE_INSTALL_BINDIR})
+     endif()
+ endif()
+-
+-######################################################################################
+-# cube
+-
+-if(APPLE)
+-    include(macOS/cube/cube.cmake)
+-elseif(NOT WIN32)
 -    if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL ${CMAKE_HOST_SYSTEM_PROCESSOR})
--        add_executable(cube cube.c ${CMAKE_BINARY_DIR}/demos/cube-vert.spv ${CMAKE_BINARY_DIR}/demos/cube-frag.spv)
+-        add_executable(cube cube.c ${PROJECT_SOURCE_DIR}/demos/cube.vert ${PROJECT_SOURCE_DIR}/demos/cube.frag cube.vert.inc cube.frag.inc)
 -        target_link_libraries(cube ${LIBRARIES})
 -    endif()
 -else()
@@ -78,13 +89,18 @@ Index: git/demos/CMakeLists.txt
 -        set (LIB_DIR "Win32")
 -    endif()
 -
--    add_executable(cube WIN32 cube.c ${CMAKE_BINARY_DIR}/demos/cube-vert.spv ${CMAKE_BINARY_DIR}/demos/cube-frag.spv)
+-    add_executable(cube WIN32 cube.c ${PROJECT_SOURCE_DIR}/demos/cube.vert ${PROJECT_SOURCE_DIR}/demos/cube.frag cube.vert.inc cube.frag.inc)
 -    target_link_libraries(cube ${LIBRARIES})
 -endif()
 -
--if(NOT WIN32)
+-######################################################################################
+-# cubepp
+-
+-if(APPLE)
+-    include(macOS/cubepp/cubepp.cmake)
+-elseif(NOT WIN32)
 -    if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL ${CMAKE_HOST_SYSTEM_PROCESSOR})
--        add_executable(cubepp cube.cpp ${CMAKE_BINARY_DIR}/demos/cube-vert.spv ${CMAKE_BINARY_DIR}/demos/cube-frag.spv)
+-        add_executable(cubepp cube.cpp ${PROJECT_SOURCE_DIR}/demos/cube.vert ${PROJECT_SOURCE_DIR}/demos/cube.frag cube.vert.inc cube.frag.inc)
 -        target_link_libraries(cubepp ${LIBRARIES})
 -    endif()
 -else()
@@ -94,15 +110,19 @@ Index: git/demos/CMakeLists.txt
 -        set (LIB_DIR "Win32")
 -    endif()
 -
--    add_executable(cubepp WIN32 cube.cpp ${CMAKE_BINARY_DIR}/demos/cube-vert.spv ${CMAKE_BINARY_DIR}/demos/cube-frag.spv)
+-    add_executable(cubepp WIN32 cube.cpp ${PROJECT_SOURCE_DIR}/demos/cube.vert ${PROJECT_SOURCE_DIR}/demos/cube.frag cube.vert.inc cube.frag.inc)
 -    target_link_libraries(cubepp ${LIBRARIES})
 -endif()
 -
+-######################################################################################
+-# smoke
+-
 -if ((${CMAKE_SYSTEM_PROCESSOR} STREQUAL ${CMAKE_HOST_SYSTEM_PROCESSOR}))
--    if  ((DEMOS_WSI_SELECTION STREQUAL "XCB") OR (DEMOS_WSI_SELECTION STREQUAL "WAYLAND") OR WIN32 OR (CMAKE_SYSTEM_NAME STREQUAL "Android"))
+-    if ((DEMOS_WSI_SELECTION STREQUAL "XCB") OR (DEMOS_WSI_SELECTION STREQUAL "WAYLAND") OR WIN32 OR
+-        (CMAKE_SYSTEM_NAME STREQUAL "Android") OR (CMAKE_SYSTEM_NAME STREQUAL "Darwin"))
 -        add_subdirectory(smoke)
 -    endif()
 -endif()
- 
- if(UNIX)
-     if(INSTALL_LVL_FILES)
+-- 
+2.4.0
+
diff --git a/meta/recipes-graphics/vulkan/vulkan_1.0.65.2.bb b/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb
similarity index 88%
rename from meta/recipes-graphics/vulkan/vulkan_1.0.65.2.bb
rename to meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb
index 1c8a895..5496f53 100644
--- a/meta/recipes-graphics/vulkan/vulkan_1.0.65.2.bb
+++ b/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb
@@ -9,11 +9,11 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=99c647ca3d4f6a4b9d8628f757aad156 \
-                    file://loader/loader.c;endline=25;md5=a87cd5442291c23d1fce4eece4cfde9d"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;branch=sdk-1.0.65 \
+                    file://loader/loader.c;endline=25;md5=151b392f46568aaedb4ad22b246237ec"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;branch=sdk-1.1.73 \
            file://demos-Don-t-build-tri-or-cube.patch \
            "
-SRCREV = "73486a1a169d862d5210e2ad520d95319a2383fa"
+SRCREV = "5998d6f444a85e6381b7a089ebf3f9e86482a31d"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
@@ -34,3 +34,4 @@ PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -DD
 PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
 
 RRECOMMENDS_${PN} = "mesa-vulkan-drivers"
+INSANE_SKIP_${PN}-dev += "dev-elf"
-- 
2.4.0


