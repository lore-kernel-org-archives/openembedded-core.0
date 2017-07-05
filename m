Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BA05B7782F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 12:28:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 05:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,311,1496127600"; d="scan'208";a="1190750457"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2017 05:28:43 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id B0AC45801CF;
	Wed,  5 Jul 2017 05:28:42 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 15:28:35 +0300
Message-Id: <b1872664bf7b98ab1634415bbade4f25a25f0bfb.1499256752.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499256752.git.jussi.kukkonen@intel.com>
References: <cover.1499256752.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/6] vulkan-demos: Add recipe
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
X-List-Received-Date: Wed, 05 Jul 2017 12:28:41 -0000

Sascha Willems collection of Vulkan demos is useful as a smoke testing
tool.

Add patch to install binaries and data. Use a combination of patch and
do_install_append to avoid some 3D models with unclear licensing.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...ild-demos-with-questionably-licensed-data.patch | 91 ++++++++++++++++++++++
 ...stalling-demos-support-out-of-tree-builds.patch | 85 ++++++++++++++++++++
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb   | 33 ++++++++
 3 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos_git.bb

diff --git a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
new file mode 100644
index 0000000..e4a6241
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
@@ -0,0 +1,91 @@
+From 55770fb07c42fe410cf8d09f8f5976babc89b9ef Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 4 Jul 2017 17:13:45 +0300
+Subject: [PATCH] Don't build demos with questionably licensed data
+
+Some of the models don't have open source compatible licenses:
+don't build demos using those. Also don't build demos that need
+resources that are not included.
+
+ssao:
+scenerendering:
+	Sibenik model, no license found
+
+deferred:
+deferredmultisampling:
+deferredshadows:
+	armor model, CC-BY-3.0
+
+vulkanscene:
+imgui:
+shadowmapping:
+	vulkanscene model, no license found
+
+indirectdraw:
+	plant model, no license found
+
+hdr:
+pbribl:
+pbrtexture:
+	Require external Vulkan Asset Pack
+
+Upstream-Status: Inppropriate [configuration]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ CMakeLists.txt | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4958fff..0f9d3e4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -150,17 +150,11 @@ set(EXAMPLES
+ 	computeparticles
+ 	computeshader
+ 	debugmarker
+-	deferred
+-	deferredmultisampling
+-	deferredshadows
+ 	displacement
+ 	distancefieldfonts
+ 	dynamicuniformbuffer
+ 	gears
+ 	geometryshader
+-	hdr
+-	imgui
+-	indirectdraw	
+ 	instancing
+ 	mesh
+ 	multisampling
+@@ -170,20 +164,14 @@ set(EXAMPLES
+ 	parallaxmapping
+ 	particlefire
+ 	pbrbasic
+-	pbribl
+-	pbrtexture
+ 	pipelines
+ 	pushconstants
+ 	radialblur
+ 	raytracing
+-	scenerendering
+ 	screenshot
+-	shadowmapping
+-	shadowmappingomni
+ 	skeletalanimation
+ 	specializationconstants
+ 	sphericalenvmapping
+-	ssao
+ 	subpasses
+ 	terraintessellation
+ 	tessellation
+@@ -196,7 +184,6 @@ set(EXAMPLES
+ 	texturesparseresidency
+ 	triangle
+ 	viewportarray
+-	vulkanscene
+ )
+ 
+ buildExamples()
+-- 
+2.13.2
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch
new file mode 100644
index 0000000..4addea3
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch
@@ -0,0 +1,85 @@
+From edca667684764cfcc0460e448e834fadf623a887 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 3 Jul 2017 14:49:18 +0300
+Subject: [PATCH] Support installing demos, support out-of-tree builds
+
+This is especially useful for cross-compile situation where testing
+happens on target.
+
+-DRESOURCE_INSTALL_DIR=<path> decides where data is installed (and
+where the binaries will load the data from): if it's left empty,
+then nothing will be installed and binaries will load the data from
+CMAKE_SOURCE_DIR.
+
+Binaries are now correctly built in CMAKE_BINARY_DIR.
+
+Upstream-Status: Submitted [https://github.com/SaschaWillems/Vulkan/pull/352]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ CMakeLists.txt             | 15 ++++++++++++++-
+ base/vulkanexamplebase.cpp |  2 +-
+ 2 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b9886bc..4958fff 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -16,6 +16,8 @@ include_directories(base)
+ OPTION(USE_D2D_WSI "Build the project using Direct to Display swapchain" OFF)
+ OPTION(USE_WAYLAND_WSI "Build the project using Wayland swapchain" OFF)
+ 
++set(RESOURCE_INSTALL_DIR "" CACHE PATH "Path to install resources to (leave empty for running uninstalled)")
++
+ # Use FindVulkan module added with CMAKE 3.7
+ if (NOT CMAKE_VERSION VERSION_LESS 3.7.0)
+ 	message(STATUS "Using module to find Vulkan")
+@@ -108,6 +110,10 @@ function(buildExample EXAMPLE_NAME)
+ 		add_executable(${EXAMPLE_NAME} ${MAIN_CPP} ${SOURCE} ${SHADERS})
+ 		target_link_libraries(${EXAMPLE_NAME} ${Vulkan_LIBRARY} ${ASSIMP_LIBRARIES} ${WAYLAND_CLIENT_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
+ 	endif(WIN32)
++
++	if(RESOURCE_INSTALL_DIR)
++		install(TARGETS ${EXAMPLE_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR})
++	endif()
+ endfunction(buildExample)
+ 
+ # Build all examples
+@@ -117,6 +123,13 @@ function(buildExamples)
+ 	endforeach(EXAMPLE)
+ endfunction(buildExamples)
+ 
++if(RESOURCE_INSTALL_DIR)
++	add_definitions(-DVK_EXAMPLE_DATA_DIR=\"${RESOURCE_INSTALL_DIR}/\")
++	install(DIRECTORY data/ DESTINATION ${RESOURCE_INSTALL_DIR}/)
++else()
++	add_definitions(-DVK_EXAMPLE_DATA_DIR=\"${CMAKE_SOURCE_DIR}/data/\")
++endif()
++
+ # Compiler specific stuff
+ IF(MSVC)
+ 	SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc")
+@@ -128,7 +141,7 @@ ELSE(WIN32)
+ 	link_libraries(${XCB_LIBRARIES} ${Vulkan_LIBRARY})
+ ENDIF(WIN32)
+ 
+-set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/")
++set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/")
+ 
+ set(EXAMPLES 
+ 	bloom
+diff --git a/base/vulkanexamplebase.cpp b/base/vulkanexamplebase.cpp
+index 647368a..a0f28a5 100644
+--- a/base/vulkanexamplebase.cpp
++++ b/base/vulkanexamplebase.cpp
+@@ -84,7 +84,7 @@ const std::string VulkanExampleBase::getAssetPath()
+ #if defined(__ANDROID__)
+ 	return "";
+ #else
+-	return "./../data/";
++	return VK_EXAMPLE_DATA_DIR;
+ #endif
+ }
+ #endif
+-- 
+2.13.2
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
new file mode 100644
index 0000000..4ec33a2
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Collection of Vulkan examples"
+LICENSE = "MIT"
+DEPENDS = "zlib"
+
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dcf473723faabf17baa9b5f2207599d0 \
+                    file://triangle/triangle.cpp;endline=12;md5=bccd1bf9cadd9e10086cf7872157e4fa"
+
+SRC_URI = "git://github.com/SaschaWillems/Vulkan.git \
+           file://0001-Support-installing-demos-support-out-of-tree-builds.patch \
+           file://0001-Don-t-build-demos-with-questionably-licensed-data.patch \
+"
+SRCREV = "18df00c7b4677b0889486e16977857aa987947e2"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+DEPENDS = "vulkan assimp"
+
+do_install_append () {
+    # Remove assets that have uncertain licenses
+    rm ${D}${datadir}/vulkan-demos/models/armor/* \
+       ${D}${datadir}/vulkan-demos/models/sibenik/* \
+       ${D}${datadir}/vulkan-demos/models/vulkanscene* \
+       ${D}${datadir}/vulkan-demos/models/plants.dae \
+       ${D}${datadir}/vulkan-demos/textures/texturearray_plants*
+}
+
+EXTRA_OECMAKE = "-DRESOURCE_INSTALL_DIR=${datadir}/vulkan-demos"
+
+# Can only pick one of [wayland,xcb]
+PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'xcb' ,d)}"
+PACKAGECONFIG[wayland] = "-DUSE_WAYLAND_WSI=ON, -DUSE_WAYLAND_WSI=OFF, wayland"
+PACKAGECONFIG[xcb] = ",,libxcb"
-- 
2.1.4


