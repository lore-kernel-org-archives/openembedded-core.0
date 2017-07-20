Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 420B27823F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:56:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6K8uonv019233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jul 2017 01:56:50 -0700 (PDT)
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Jul 2017 01:56:50 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1499775981-13801-1-git-send-email-jussi.kukkonen@intel.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <c238e3a3-1fde-a5e7-f499-c0cfd4d84521@windriver.com>
Date: Thu, 20 Jul 2017 17:01:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499775981-13801-1-git-send-email-jussi.kukkonen@intel.com>
Subject: Re: [PATCHv3] vulkan-demos: Add recipe
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
X-List-Received-Date: Thu, 20 Jul 2017 08:56:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年07月11日 20:26, Jussi Kukkonen wrote:
> Sascha Willems collection of Vulkan demos is useful as a smoke testing
> tool.
>
> * Add patch to install binaries and data.
> * Add patch to fix build on X86
> * Use a combination of patch and do_install_append to avoid some 3D
> models with unclear licensing.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

Hi Jussi,

Did you meet build failure:

| CMake Error at 
/buildarea3/kkang/WRLX/builds/vulkan-amr64/tmp/work/aarch64-wrs-linux/vulkan-demos/git-r0/recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:137 
(message):
|   Could NOT find ASSIMP (missing: ASSIMP_LIBRARIES)
| Call Stack (most recent call first):
| 
/buildarea3/kkang/WRLX/builds/vulkan-amr64/tmp/work/aarch64-wrs-linux/vulkan-demos/git-r0/recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:377 
(_FPHSA_FAILURE_MESSAGE)
|   cmake/FindASSIMP.cmake:50 (find_package_handle_standard_args)
|   CMakeLists.txt:45 (find_package)

If not, would you please to tell me where or which recipe is module 
ASSIMP from?

Thanks.

--Kai


> ---
>
> Changes since v2:
> * Add a fake UPSTREAM_CHECK_GITTAGREGEX to silence the relevant
>    oe-selftest: The tags in upstream git are not releases.
>
> Changes since v1:
> * Add patch to fix build on x86
>
>
>   ...ild-demos-with-questionably-licensed-data.patch | 91 ++++++++++++++++++++++
>   .../vulkan-demos/0001-Fix-build-on-x86.patch       | 41 ++++++++++
>   ...stalling-demos-support-out-of-tree-builds.patch | 85 ++++++++++++++++++++
>   meta/recipes-graphics/vulkan/vulkan-demos_git.bb   | 36 +++++++++
>   4 files changed, 253 insertions(+)
>   create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
>   create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Fix-build-on-x86.patch
>   create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch
>   create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos_git.bb
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
> new file mode 100644
> index 0000000..d32c8f2
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
> @@ -0,0 +1,91 @@
> +From 55770fb07c42fe410cf8d09f8f5976babc89b9ef Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Tue, 4 Jul 2017 17:13:45 +0300
> +Subject: [PATCH] Don't build demos with questionably licensed data
> +
> +Some of the models don't have open source compatible licenses:
> +don't build demos using those. Also don't build demos that need
> +resources that are not included.
> +
> +ssao:
> +scenerendering:
> +	Sibenik model, no license found
> +
> +deferred:
> +deferredmultisampling:
> +deferredshadows:
> +	armor model, CC-BY-3.0
> +
> +vulkanscene:
> +imgui:
> +shadowmapping:
> +	vulkanscene model, no license found
> +
> +indirectdraw:
> +	plant model, no license found
> +
> +hdr:
> +pbribl:
> +pbrtexture:
> +	Require external Vulkan Asset Pack
> +
> +Upstream-Status: Inappropriate [configuration]
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + CMakeLists.txt | 13 -------------
> + 1 file changed, 13 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 4958fff..0f9d3e4 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -150,17 +150,11 @@ set(EXAMPLES
> + 	computeparticles
> + 	computeshader
> + 	debugmarker
> +-	deferred
> +-	deferredmultisampling
> +-	deferredshadows
> + 	displacement
> + 	distancefieldfonts
> + 	dynamicuniformbuffer
> + 	gears
> + 	geometryshader
> +-	hdr
> +-	imgui
> +-	indirectdraw	
> + 	instancing
> + 	mesh
> + 	multisampling
> +@@ -170,20 +164,14 @@ set(EXAMPLES
> + 	parallaxmapping
> + 	particlefire
> + 	pbrbasic
> +-	pbribl
> +-	pbrtexture
> + 	pipelines
> + 	pushconstants
> + 	radialblur
> + 	raytracing
> +-	scenerendering
> + 	screenshot
> +-	shadowmapping
> +-	shadowmappingomni
> + 	skeletalanimation
> + 	specializationconstants
> + 	sphericalenvmapping
> +-	ssao
> + 	subpasses
> + 	terraintessellation
> + 	tessellation
> +@@ -196,7 +184,6 @@ set(EXAMPLES
> + 	texturesparseresidency
> + 	triangle
> + 	viewportarray
> +-	vulkanscene
> + )
> +
> + buildExamples()
> +--
> +2.13.2
> +
> diff --git a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Fix-build-on-x86.patch b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Fix-build-on-x86.patch
> new file mode 100644
> index 0000000..681b342
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Fix-build-on-x86.patch
> @@ -0,0 +1,41 @@
> +From b0495efb6c3ea3a530fcbaddac86da57ecce5a66 Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Mon, 10 Jul 2017 13:11:12 +0300
> +Subject: [PATCH] Fix build on x86
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +| func_common.inl:193:51: error: wrong number of template arguments
> +| (5, should be 6) struct compute_sign<T, P, vecType, false, Aligned>
> +
> +The fix is backported from the upstream glm project.
> +
> +Upstream-Status: Pending [https://github.com/SaschaWillems/Vulkan/issues/356]
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + external/glm/glm/detail/func_common.inl | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/external/glm/glm/detail/func_common.inl b/external/glm/glm/detail/func_common.inl
> +index cafaed5..2dd94e1 100644
> +--- a/external/glm/glm/detail/func_common.inl
> ++++ b/external/glm/glm/detail/func_common.inl
> +@@ -190,12 +190,12 @@ namespace detail
> +
> + #	if GLM_ARCH == GLM_ARCH_X86
> + 	template<length_t L, typename T, precision P, template<length_t, typename, precision> class vecType, bool Aligned>
> +-	struct compute_sign<T, P, vecType, false, Aligned>
> ++	struct compute_sign<L, T, P, vecType, false, Aligned>
> + 	{
> + 		GLM_FUNC_QUALIFIER static vecType<L, T, P> call(vecType<L, T, P> const & x)
> + 		{
> + 			T const Shift(static_cast<T>(sizeof(T) * 8 - 1));
> +-			vecType<L, T, P> const y(vecType<typename make_unsigned<T>::type, P>(-x) >> typename make_unsigned<T>::type(Shift));
> ++			vecType<L, T, P> const y(vecType<L, typename make_unsigned<T>::type, P>(-x) >> typename make_unsigned<T>::type(Shift));
> +
> + 			return (x >> Shift) | y;
> + 		}
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch
> new file mode 100644
> index 0000000..4addea3
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch
> @@ -0,0 +1,85 @@
> +From edca667684764cfcc0460e448e834fadf623a887 Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Mon, 3 Jul 2017 14:49:18 +0300
> +Subject: [PATCH] Support installing demos, support out-of-tree builds
> +
> +This is especially useful for cross-compile situation where testing
> +happens on target.
> +
> +-DRESOURCE_INSTALL_DIR=<path> decides where data is installed (and
> +where the binaries will load the data from): if it's left empty,
> +then nothing will be installed and binaries will load the data from
> +CMAKE_SOURCE_DIR.
> +
> +Binaries are now correctly built in CMAKE_BINARY_DIR.
> +
> +Upstream-Status: Submitted [https://github.com/SaschaWillems/Vulkan/pull/352]
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + CMakeLists.txt             | 15 ++++++++++++++-
> + base/vulkanexamplebase.cpp |  2 +-
> + 2 files changed, 15 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index b9886bc..4958fff 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -16,6 +16,8 @@ include_directories(base)
> + OPTION(USE_D2D_WSI "Build the project using Direct to Display swapchain" OFF)
> + OPTION(USE_WAYLAND_WSI "Build the project using Wayland swapchain" OFF)
> +
> ++set(RESOURCE_INSTALL_DIR "" CACHE PATH "Path to install resources to (leave empty for running uninstalled)")
> ++
> + # Use FindVulkan module added with CMAKE 3.7
> + if (NOT CMAKE_VERSION VERSION_LESS 3.7.0)
> + 	message(STATUS "Using module to find Vulkan")
> +@@ -108,6 +110,10 @@ function(buildExample EXAMPLE_NAME)
> + 		add_executable(${EXAMPLE_NAME} ${MAIN_CPP} ${SOURCE} ${SHADERS})
> + 		target_link_libraries(${EXAMPLE_NAME} ${Vulkan_LIBRARY} ${ASSIMP_LIBRARIES} ${WAYLAND_CLIENT_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
> + 	endif(WIN32)
> ++
> ++	if(RESOURCE_INSTALL_DIR)
> ++		install(TARGETS ${EXAMPLE_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR})
> ++	endif()
> + endfunction(buildExample)
> +
> + # Build all examples
> +@@ -117,6 +123,13 @@ function(buildExamples)
> + 	endforeach(EXAMPLE)
> + endfunction(buildExamples)
> +
> ++if(RESOURCE_INSTALL_DIR)
> ++	add_definitions(-DVK_EXAMPLE_DATA_DIR=\"${RESOURCE_INSTALL_DIR}/\")
> ++	install(DIRECTORY data/ DESTINATION ${RESOURCE_INSTALL_DIR}/)
> ++else()
> ++	add_definitions(-DVK_EXAMPLE_DATA_DIR=\"${CMAKE_SOURCE_DIR}/data/\")
> ++endif()
> ++
> + # Compiler specific stuff
> + IF(MSVC)
> + 	SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc")
> +@@ -128,7 +141,7 @@ ELSE(WIN32)
> + 	link_libraries(${XCB_LIBRARIES} ${Vulkan_LIBRARY})
> + ENDIF(WIN32)
> +
> +-set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/")
> ++set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/")
> +
> + set(EXAMPLES
> + 	bloom
> +diff --git a/base/vulkanexamplebase.cpp b/base/vulkanexamplebase.cpp
> +index 647368a..a0f28a5 100644
> +--- a/base/vulkanexamplebase.cpp
> ++++ b/base/vulkanexamplebase.cpp
> +@@ -84,7 +84,7 @@ const std::string VulkanExampleBase::getAssetPath()
> + #if defined(__ANDROID__)
> + 	return "";
> + #else
> +-	return "./../data/";
> ++	return VK_EXAMPLE_DATA_DIR;
> + #endif
> + }
> + #endif
> +--
> +2.13.2
> +
> diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
> new file mode 100644
> index 0000000..fcd9e7b
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "Collection of Vulkan examples"
> +LICENSE = "MIT"
> +DEPENDS = "zlib"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dcf473723faabf17baa9b5f2207599d0 \
> +                    file://triangle/triangle.cpp;endline=12;md5=bccd1bf9cadd9e10086cf7872157e4fa"
> +
> +SRC_URI = "git://github.com/SaschaWillems/Vulkan.git \
> +           file://0001-Support-installing-demos-support-out-of-tree-builds.patch \
> +           file://0001-Don-t-build-demos-with-questionably-licensed-data.patch \
> +           file://0001-Fix-build-on-x86.patch \
> +"
> +SRCREV = "18df00c7b4677b0889486e16977857aa987947e2"
> +UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
> +S = "${WORKDIR}/git"
> +
> +inherit cmake distro_features_check
> +DEPENDS = "vulkan assimp"
> +
> +do_install_append () {
> +    # Remove assets that have uncertain licenses
> +    rm ${D}${datadir}/vulkan-demos/models/armor/* \
> +       ${D}${datadir}/vulkan-demos/models/sibenik/* \
> +       ${D}${datadir}/vulkan-demos/models/vulkanscene* \
> +       ${D}${datadir}/vulkan-demos/models/plants.dae \
> +       ${D}${datadir}/vulkan-demos/textures/texturearray_plants*
> +}
> +
> +EXTRA_OECMAKE = "-DRESOURCE_INSTALL_DIR=${datadir}/vulkan-demos"
> +
> +ANY_OF_DISTRO_FEATURES = "x11 wayland"
> +
> +# Can only pick one of [wayland,xcb]
> +PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'xcb' ,d)}"
> +PACKAGECONFIG[wayland] = "-DUSE_WAYLAND_WSI=ON, -DUSE_WAYLAND_WSI=OFF, wayland"
> +PACKAGECONFIG[xcb] = ",,libxcb"


-- 
Regards,
Neil | Kai Kang


