Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2B28D600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 13:21:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2017 05:22:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,264,1486454400"; d="scan'208";a="233701964"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2017 05:22:00 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 02D746A4080;
	Wed,  8 Mar 2017 05:21:56 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 15:21:52 +0200
Message-Id: <1488979312-11892-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a89026c4b38641650e5c14e231e452e842220238.1488272553.git.jussi.kukkonen@intel.com>
References: <a89026c4b38641650e5c14e231e452e842220238.1488272553.git.jussi.kukkonen@intel.com>
Subject: [PATCH v3 5/6] vulkan: Add recipe for Vulkan common loader
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
X-List-Received-Date: Wed, 08 Mar 2017 13:22:01 -0000

Add a recipe for vulkan loader library and the vulkaninfo binary.

Vulkan can be built to support X11 or wayland or both. There is
currently no support for building tests, validation layers or even
the demos as that would require a bunch of otherwise unnecessary
dependencies.

Fix the build on musl by defaulting to getenv() if secure_getenv()
is not available.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Changes since v2:
* Add patch to fix build on musl

I'm sending only this one changed patch but I've fixed the branch (and
rebased to current master, just the 3 vulkan-related patches left):

  git://git.yoctoproject.org/poky-contrib jku/vulkan
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/vulkan




 meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb    |  34 +++++++
 3 files changed, 174 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan/0001-Use-getenv-if-secure_getenv-does-not-exist.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb

diff --git a/meta/recipes-graphics/vulkan/vulkan/0001-Use-getenv-if-secure_getenv-does-not-exist.patch b/meta/recipes-graphics/vulkan/vulkan/0001-Use-getenv-if-secure_getenv-does-not-exist.patch
new file mode 100644
index 0000000..694922c
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan/0001-Use-getenv-if-secure_getenv-does-not-exist.patch
@@ -0,0 +1,34 @@
+From 20525add1df8e1fb13fef90ac068f982def8b958 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 8 Mar 2017 13:23:58 +0200
+Subject: [PATCH] Use getenv() if secure_getenv() does not exist
+
+musl does not implement secure version: default to getenv() in that
+case.
+
+https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/issues/1538
+
+Upstream-Status: Pending
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ loader/loader.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/loader/loader.c b/loader/loader.c
+index 24758f4..bff79c1 100644
+--- a/loader/loader.c
++++ b/loader/loader.c
+@@ -54,6 +54,10 @@
+ #endif
+ #endif
+ 
++#if !defined(__secure_getenv)
++#define __secure_getenv getenv
++#endif
++
+ struct loader_struct loader = {0};
+ // TLS for instance for alloc/free callbacks
+ THREAD_LOCAL_DECL struct loader_instance *tls_instance;
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch b/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
new file mode 100644
index 0000000..3cf241d
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
@@ -0,0 +1,106 @@
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
+Upstream-Status: Inappropriate [configuration]
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
index 0000000..45d1c49
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb
@@ -0,0 +1,34 @@
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
+                    file://loader/loader.c;endline=25;md5=a87cd5442291c23d1fce4eece4cfde9d"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;branch=sdk-1.0.39 \
+           file://demos-Don-t-build-tri-or-cube.patch \
+           file://0001-Use-getenv-if-secure_getenv-does-not-exist.patch \
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
2.1.4


