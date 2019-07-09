Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD2F7E3BC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 02:04:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jul 2019 19:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,468,1557212400"; d="scan'208";a="159308152"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Jul 2019 19:03:47 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 10:03:38 +0800
Message-Id: <1562637818-76884-6-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562637818-76884-1-git-send-email-anuj.mittal@intel.com>
References: <1562637818-76884-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH v2 6/6] vulkan: remove
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
X-List-Received-Date: Tue, 09 Jul 2019 02:04:47 -0000

This has been split in multiple components which are now being packaged
separately following the repository split upstream.

https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/wiki/Repository-Split

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/maintainers.inc           |   1 -
 .../vulkan/demos-Don-t-build-tri-or-cube.patch     | 128 ---------------------
 meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb    |  40 -------
 3 files changed, 169 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4556c79..60a4fcd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -717,7 +717,6 @@ RECIPE_MAINTAINER_pn-vim-tiny = "Tom Rini <trini@konsulko.com>"
 RECIPE_MAINTAINER_pn-virglrenderer = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-volatile-binds = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-vte = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-vulkan = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan-demos = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan-headers = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan-loader = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch b/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
deleted file mode 100644
index b0b9fc4..0000000
--- a/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 9b13be109bc66f4d4a1ad53ce5c92c7c495e41d7 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Tue, 24 Jul 2018 17:40:52 +0300
-Subject: [PATCH] commit f63cbe944107b5cd8f150ceaaec43b26099d5688
-
-Author: Adam Jackson <ajax@redhat.com>
-Date:   Tue Feb 16 10:05:25 2016 -0500
-
-demos: Don't build tri or cube
-
-There are more interesting demos, all we really want here is vulkaninfo.
-This helps because we don't need to pre-build glslang/llvm/lunarglass
-just to get the loader and layers.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- demos/CMakeLists.txt | 88 ----------------------------------------------------
- 1 file changed, 88 deletions(-)
-
-diff --git a/demos/CMakeLists.txt b/demos/CMakeLists.txt
-index 4f32679..26e4cdf 100644
---- a/demos/CMakeLists.txt
-+++ b/demos/CMakeLists.txt
-@@ -93,42 +93,6 @@ elseif(UNIX)
- else()
- endif()
- 
--if(WIN32)
--    # For Windows, since 32-bit and 64-bit items can co-exist, we build each in its own build directory.
--    # 32-bit target data goes in build32, and 64-bit target data goes into build.  So, include/link the
--    # appropriate data at build time.
--    if (CMAKE_CL_64)
--        set (BUILDTGT_DIR build)
--    else ()
--        set (BUILDTGT_DIR build32)
--    endif()
--
--    # Use static MSVCRT libraries
--    foreach(configuration in CMAKE_C_FLAGS_DEBUG CMAKE_C_FLAGS_MINSIZEREL CMAKE_C_FLAGS_RELEASE CMAKE_C_FLAGS_RELWITHDEBINFO
--                             CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELWITHDEBINFO)
--        if(${configuration} MATCHES "/MD")
--            string(REGEX REPLACE "/MD" "/MT" ${configuration} "${${configuration}}")
--        endif()
--    endforeach()
--
--   file(COPY cube.vcxproj.user DESTINATION ${CMAKE_BINARY_DIR}/demos)
--   file(COPY vulkaninfo.vcxproj.user DESTINATION ${CMAKE_BINARY_DIR}/demos)
--endif()
--
--add_custom_command(
--    COMMENT "Compiling cube demo vertex shader"
--    OUTPUT cube.vert.inc
--    COMMAND ${GLSLANG_VALIDATOR} -V -x -o ${CMAKE_CURRENT_BINARY_DIR}/cube.vert.inc ${PROJECT_SOURCE_DIR}/demos/cube.vert
--    MAIN_DEPENDENCY ${PROJECT_SOURCE_DIR}/demos/cube.vert
--    DEPENDS ${PROJECT_SOURCE_DIR}/demos/cube.vert ${GLSLANG_VALIDATOR}
--)
--add_custom_command(
--    COMMENT "Compiling cube demo fragment shader"
--    OUTPUT cube.frag.inc
--    COMMAND ${GLSLANG_VALIDATOR} -V -x -o ${CMAKE_CURRENT_BINARY_DIR}/cube.frag.inc ${PROJECT_SOURCE_DIR}/demos/cube.frag
--    MAIN_DEPENDENCY ${PROJECT_SOURCE_DIR}/demos/cube.frag
--    DEPENDS ${PROJECT_SOURCE_DIR}/demos/cube.frag ${GLSLANG_VALIDATOR}
--)
- 
- include_directories(${CMAKE_CURRENT_BINARY_DIR})
- 
-@@ -172,55 +136,3 @@ if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
-         install(TARGETS ${API_LOWERCASE}info DESTINATION ${CMAKE_INSTALL_BINDIR})
-     endif()
- endif()
--
--######################################################################################
--# cube
--
--if(APPLE)
--    include(macOS/cube/cube.cmake)
--elseif(NOT WIN32)
--    if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL ${CMAKE_HOST_SYSTEM_PROCESSOR})
--        add_executable(cube cube.c ${PROJECT_SOURCE_DIR}/demos/cube.vert ${PROJECT_SOURCE_DIR}/demos/cube.frag cube.vert.inc cube.frag.inc)
--        target_link_libraries(cube ${LIBRARIES})
--    endif()
--else()
--    if (CMAKE_CL_64)
--        set (LIB_DIR "Win64")
--    else()
--        set (LIB_DIR "Win32")
--    endif()
--
--    add_executable(cube WIN32 cube.c ${PROJECT_SOURCE_DIR}/demos/cube.vert ${PROJECT_SOURCE_DIR}/demos/cube.frag cube.vert.inc cube.frag.inc)
--    target_link_libraries(cube ${LIBRARIES})
--endif()
--
--######################################################################################
--# cubepp
--
--if(APPLE)
--    include(macOS/cubepp/cubepp.cmake)
--elseif(NOT WIN32)
--    if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL ${CMAKE_HOST_SYSTEM_PROCESSOR})
--        add_executable(cubepp cube.cpp ${PROJECT_SOURCE_DIR}/demos/cube.vert ${PROJECT_SOURCE_DIR}/demos/cube.frag cube.vert.inc cube.frag.inc)
--        target_link_libraries(cubepp ${LIBRARIES})
--    endif()
--else()
--    if (CMAKE_CL_64)
--        set (LIB_DIR "Win64")
--    else()
--        set (LIB_DIR "Win32")
--    endif()
--
--    add_executable(cubepp WIN32 cube.cpp ${PROJECT_SOURCE_DIR}/demos/cube.vert ${PROJECT_SOURCE_DIR}/demos/cube.frag cube.vert.inc cube.frag.inc)
--    target_link_libraries(cubepp ${LIBRARIES})
--endif()
--
--######################################################################################
--# smoke
--
--if ((${CMAKE_SYSTEM_PROCESSOR} STREQUAL ${CMAKE_HOST_SYSTEM_PROCESSOR}))
--    if ((DEMOS_WSI_SELECTION STREQUAL "XCB") OR (DEMOS_WSI_SELECTION STREQUAL "WAYLAND") OR WIN32 OR
--        (CMAKE_SYSTEM_NAME STREQUAL "Android") OR (CMAKE_SYSTEM_NAME STREQUAL "Darwin"))
--        add_subdirectory(smoke)
--    endif()
--endif()
--- 
-2.4.0
-
diff --git a/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb b/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb
deleted file mode 100644
index 02e4330..0000000
--- a/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "3D graphics and compute API common loader"
-DESCRIPTION = "Vulkan is a new generation graphics and compute API \
-that provides efficient access to modern GPUs. These packages \
-provide only the common vendor-agnostic library loader, headers and \
-the vulkaninfo utility."
-HOMEPAGE = "https://www.khronos.org/vulkan/"
-BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Loader"
-SECTION = "libs"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=99c647ca3d4f6a4b9d8628f757aad156 \
-                    file://loader/loader.c;endline=25;md5=151b392f46568aaedb4ad22b246237ec"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;nobranch=1 \
-           file://demos-Don-t-build-tri-or-cube.patch \
-           "
-SRCREV = "5998d6f444a85e6381b7a089ebf3f9e86482a31d"
-UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-
-S = "${WORKDIR}/git"
-
-REQUIRED_DISTRO_FEATURES = "vulkan"
-
-inherit cmake python3native lib_package distro_features_check
-ANY_OF_DISTRO_FEATURES = "x11 wayland"
-
-EXTRA_OECMAKE = "-DBUILD_WSI_MIR_SUPPORT=OFF \
-                 -DBUILD_LAYERS=OFF \
-                 -DBUILD_TESTS=OFF"
-
-# must choose x11 or wayland or both
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '' ,d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '' ,d)}"
-PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -DDEMOS_WSI_SELECTION=XCB, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF -DDEMOS_WSI_SELECTION=WAYLAND, libxcb libx11 libxrandr"
-PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
-
-RRECOMMENDS_${PN} = "mesa-vulkan-drivers"
-INSANE_SKIP_${PN}-dev += "dev-elf"
-
-# Can't be built with ccache
-CCACHE_DISABLE = "1"
-- 
2.7.4


