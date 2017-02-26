Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B594D730A4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 16:51:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2017 08:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,209,1484035200"; d="scan'208";a="938297167"
Received: from dgpeters-mobl5.ger.corp.intel.com (HELO
	heimdall.ger.corp.intel.com) ([10.252.1.186])
	by orsmga003.jf.intel.com with ESMTP; 26 Feb 2017 08:51:05 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2017 18:50:56 +0200
Message-Id: <6f1f12f8c74f3f4cce52df3a9a7a984f2559fa4e.1488125460.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1488125460.git.jussi.kukkonen@intel.com>
References: <cover.1488125460.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/6] vulkan: Add recipe for Vulkan common loader
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
X-List-Received-Date: Sun, 26 Feb 2017 16:51:05 -0000

Add a recipe for vulkan loader library and the vulkaninfo binary.

Vulkan can be built to support X11 or wayland or both. There is
currently no support for building tests, validation layers or even
the demos as that would require a bunch of otherwise unnecessary
dependencies.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../vulkan/demos-Don-t-build-tri-or-cube.patch     | 105 +++++++++++++++++++++
 meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb    |  33 +++++++
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb

diff --git a/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch b/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
new file mode 100644
index 00000000000..a732c76c767
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
@@ -0,0 +1,105 @@
+commit f63cbe944107b5cd8f150ceaaec43b26099d5688
+Author: Adam Jackson <ajax@redhat.com>
+Date:   Tue Feb 16 10:05:25 2016 -0500
+
+    demos: Don't build tri or cube
+    
+    There are more interesting demos, all we really want here is vulkaninfo.
+    This helps because we don't need to pre-build glslang/llvm/lunarglass
+    just to get the loader and layers.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+--- a/demos/CMakeLists.txt
++++ b/demos/CMakeLists.txt
+@@ -61,46 +61,6 @@
+ else()
+ endif()
+ 
+-if(WIN32)
+-    # For Windows, since 32-bit and 64-bit items can co-exist, we build each in its own build directory.
+-    # 32-bit target data goes in build32, and 64-bit target data goes into build.  So, include/link the
+-    # appropriate data at build time.
+-    if (CMAKE_CL_64)
+-        set (BUILDTGT_DIR build)
+-    else ()
+-        set (BUILDTGT_DIR build32)
+-    endif()
+-
+-    # Use static MSVCRT libraries
+-    foreach(configuration in CMAKE_C_FLAGS_DEBUG CMAKE_C_FLAGS_MINSIZEREL CMAKE_C_FLAGS_RELEASE CMAKE_C_FLAGS_RELWITHDEBINFO
+-                             CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELWITHDEBINFO)
+-        if(${configuration} MATCHES "/MD")
+-            string(REGEX REPLACE "/MD" "/MT" ${configuration} "${${configuration}}")
+-        endif()
+-    endforeach()
+-
+-    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/demos/cube-vert.spv
+-       COMMAND ${GLSLANG_VALIDATOR} -s -V -o ${CMAKE_BINARY_DIR}/demos/cube-vert.spv ${PROJECT_SOURCE_DIR}/demos/cube.vert
+-       DEPENDS cube.vert ${GLSLANG_VALIDATOR}
+-       )
+-    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/demos/cube-frag.spv
+-       COMMAND ${GLSLANG_VALIDATOR} -s -V -o ${CMAKE_BINARY_DIR}/demos/cube-frag.spv ${PROJECT_SOURCE_DIR}/demos/cube.frag
+-       DEPENDS cube.frag ${GLSLANG_VALIDATOR}
+-       )
+-   file(COPY cube.vcxproj.user DESTINATION ${CMAKE_BINARY_DIR}/demos)
+-   file(COPY vulkaninfo.vcxproj.user DESTINATION ${CMAKE_BINARY_DIR}/demos)
+-else()
+-    if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL ${CMAKE_HOST_SYSTEM_PROCESSOR})
+-        add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/demos/cube-vert.spv
+-            COMMAND ${GLSLANG_VALIDATOR} -s -V -o cube-vert.spv ${PROJECT_SOURCE_DIR}/demos/cube.vert
+-            DEPENDS cube.vert ${GLSLANG_VALIDATOR}
+-            )
+-        add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/demos/cube-frag.spv
+-            COMMAND ${GLSLANG_VALIDATOR} -s -V -o cube-frag.spv ${PROJECT_SOURCE_DIR}/demos/cube.frag
+-            DEPENDS cube.frag ${GLSLANG_VALIDATOR}
+-            )
+-    endif()         
+-endif()
+ 
+ if(WIN32)
+     include_directories (
+@@ -114,43 +74,6 @@
+ add_executable(${API_LOWERCASE}info vulkaninfo.c)
+ target_link_libraries(${API_LOWERCASE}info ${LIBRARIES})
+ 
+-if(NOT WIN32)
+-    if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL ${CMAKE_HOST_SYSTEM_PROCESSOR})
+-        add_executable(cube cube.c ${CMAKE_BINARY_DIR}/demos/cube-vert.spv ${CMAKE_BINARY_DIR}/demos/cube-frag.spv)
+-        target_link_libraries(cube ${LIBRARIES})
+-    endif()
+-else()
+-    if (CMAKE_CL_64)
+-        set (LIB_DIR "Win64")
+-    else()
+-        set (LIB_DIR "Win32")
+-    endif()
+-
+-    add_executable(cube WIN32 cube.c ${CMAKE_BINARY_DIR}/demos/cube-vert.spv ${CMAKE_BINARY_DIR}/demos/cube-frag.spv)
+-    target_link_libraries(cube ${LIBRARIES})
+-endif()
+-
+-if(NOT WIN32)
+-    if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL ${CMAKE_HOST_SYSTEM_PROCESSOR})
+-        add_executable(cubepp cube.cpp ${CMAKE_BINARY_DIR}/demos/cube-vert.spv ${CMAKE_BINARY_DIR}/demos/cube-frag.spv)
+-        target_link_libraries(cubepp ${LIBRARIES})
+-    endif()
+-else()
+-    if (CMAKE_CL_64)
+-        set (LIB_DIR "Win64")
+-    else()
+-        set (LIB_DIR "Win32")
+-    endif()
+-
+-    add_executable(cubepp WIN32 cube.cpp ${CMAKE_BINARY_DIR}/demos/cube-vert.spv ${CMAKE_BINARY_DIR}/demos/cube-frag.spv)
+-    target_link_libraries(cubepp ${LIBRARIES})
+-endif()
+-
+-if ((${CMAKE_SYSTEM_PROCESSOR} STREQUAL ${CMAKE_HOST_SYSTEM_PROCESSOR}))
+-    if  ((DEMOS_WSI_SELECTION STREQUAL "XCB") OR (DEMOS_WSI_SELECTION STREQUAL "WAYLAND") OR WIN32 OR (CMAKE_SYSTEM_NAME STREQUAL "Android"))
+-        add_subdirectory(smoke)
+-    endif()
+-endif()
+ 
+ if(UNIX)
+     install(TARGETS ${API_LOWERCASE}info DESTINATION ${CMAKE_INSTALL_BINDIR})
diff --git a/meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb b/meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb
new file mode 100644
index 00000000000..0f8defbe6a3
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb
@@ -0,0 +1,33 @@
+SUMMARY = "3D graphics and compute API common loader"
+DESCRIPTION = "Vulkan is a new generation graphics and compute API \
+that provides efficient access to modern GPUs. These packages \
+provide only the common vendor-agnostic library loader, headers and \
+the vulkaninfo utility."
+HOMEPAGE = "https://www.khronos.org/vulkan/"
+BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=99c647ca3d4f6a4b9d8628f757aad156 \
+                    "
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;branch=sdk-1.0.39 \
+           file://demos-Don-t-build-tri-or-cube.patch \
+"
+SRCREV = "9c21ed0fb275589c3af6118aec9ef4f1d1544dc1"
+
+S = "${WORKDIR}/git"
+
+
+inherit cmake python3native lib_package distro_features_check
+ANY_OF_DISTRO_FEATURES = "x11 wayland"
+
+EXTRA_OECMAKE = "-DBUILD_WSI_MIR_SUPPORT=OFF \
+                 -DBUILD_LAYERS=OFF \
+                 -DBUILD_TESTS=OFF"
+
+# must choose x11 or wayland or both
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '' ,d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '' ,d)}"
+PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -DDEMOS_WSI_SELECTION=XCB, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF -DDEMOS_WSI_SELECTION=WAYLAND, libxcb libx11 libxrandr"
+PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
+
-- 
2.11.0


