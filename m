Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.1463.1611873516968831144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 14:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5B15BFF802;
	Thu, 28 Jan 2021 22:38:34 +0000 (UTC)
Date: Thu, 28 Jan 2021 23:38:34 +0100
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 4/4] shaderc: fix the build with glslang 11.1.0
Message-ID: <20210128223834.GA2544418@piout.net>
References: <20210124180758.1610301-1-quaresma.jose@gmail.com>
 <20210124180758.1610301-4-quaresma.jose@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210124180758.1610301-4-quaresma.jose@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Jose,

On 24/01/2021 18:07:58+0000, Jose Quaresma wrote:
> Drop patches:
>     * 0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
>       is rejected upstream and is not need when glslang as shared libs.
> 
> Update pacthes:
>     * 0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
>       renamed and refreshed from 0003-cmake-de-vendor-libs-and-disable-git-versioning.patch.
> 

It seems there is still a linking issue when building shaderc-native.
The full log is available here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2978/steps/11/logs/stdio


> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  ...link-order-of-libglslang-and-libHLSL.patch | 49 -------------------
>  ...dor-libs-and-disable-git-versioning.patch} |  4 +-
>  .../shaderc/shaderc_2020.4.bb                 | 10 ++--
>  3 files changed, 9 insertions(+), 54 deletions(-)
>  delete mode 100644 meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
>  rename meta/recipes-graphics/shaderc/files/{0003-cmake-de-vendor-libs-and-disable-git-versioning.patch => 0001-cmake-de-vendor-libs-and-disable-git-versioning.patch} (94%)
> 
> diff --git a/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch b/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
> deleted file mode 100644
> index 7102e25bcf..0000000000
> --- a/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 0b9468d4face34879214f500b15e810cdd1a81a1 Mon Sep 17 00:00:00 2001
> -From: Niklas Haas <git@haasn.xyz>
> -Date: Tue, 29 May 2018 07:34:00 +0200
> -Subject: [PATCH] Fix the link order of libglslang and libHLSL
> -
> -libglslang depends on libHLSL, so the latter needs to be specified last.
> -This fixes an issue when trying to build shaderc against system-wide
> -versions of libglslang/libHLSL, rather than the in-tree versions from
> -third_party.
> -
> -Additionally, libshaderc_util also depends on SPIRV-Tools
> -
> -Upstream-Status: Backport [21c8be385b3fab5edcb934a6d99f69fd389c4e67]
> -
> -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> -
> ----
> - glslc/CMakeLists.txt           | 2 +-
> - libshaderc_util/CMakeLists.txt | 4 ++--
> - 2 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
> -index 31664d1..35b3f19 100644
> ---- a/glslc/CMakeLists.txt
> -+++ b/glslc/CMakeLists.txt
> -@@ -43,7 +43,7 @@ if (SHADERC_ENABLE_WGSL_OUTPUT)
> - endif(SHADERC_ENABLE_WGSL_OUTPUT)
> - 
> - target_link_libraries(glslc PRIVATE
> --  glslang OSDependent OGLCompiler HLSL glslang SPIRV    # Glslang libraries
> -+  glslang OSDependent OGLCompiler glslang SPIRV HLSL    # Glslang libraries
> -   $<$<BOOL:${SHADERC_ENABLE_WGSL_OUTPUT}>:libtint>      # Tint libraries, optional
> -   shaderc_util shaderc                                  # internal Shaderc libraries
> -   ${CMAKE_THREAD_LIBS_INIT})
> -diff --git a/libshaderc_util/CMakeLists.txt b/libshaderc_util/CMakeLists.txt
> -index 48f9991..984cc06 100644
> ---- a/libshaderc_util/CMakeLists.txt
> -+++ b/libshaderc_util/CMakeLists.txt
> -@@ -46,8 +46,8 @@ add_definitions(-DENABLE_HLSL)
> - 
> - find_package(Threads)
> - target_link_libraries(shaderc_util PRIVATE
> --  glslang OSDependent OGLCompiler HLSL glslang SPIRV
> --  SPIRV-Tools-opt ${CMAKE_THREAD_LIBS_INIT})
> -+  glslang OSDependent OGLCompiler glslang HLSL SPIRV
> -+  SPIRV-Tools-opt SPIRV-Tools ${CMAKE_THREAD_LIBS_INIT})
> - 
> - shaderc_add_tests(
> -   TEST_PREFIX shaderc_util
> diff --git a/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
> similarity index 94%
> rename from meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
> rename to meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
> index e4e3f0be1e..40cc84df26 100644
> --- a/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
> +++ b/meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
> @@ -1,4 +1,4 @@
> -From 180250f098e0ab899eff0db3708d9693f3486ff4 Mon Sep 17 00:00:00 2001
> +From a07ac322a5a5fd4f0339913eb4456321ad1a69fd Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sat, 17 Oct 2020 12:51:50 +0100
>  Subject: [PATCH] cmake: de-vendor libs and disable git versioning
> @@ -32,7 +32,7 @@ index 5c74cd8..9451fbc 100644
>   add_custom_target(build-version
>     ${PYTHON_EXECUTABLE}
>  diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
> -index 35b3f19..52006b8 100644
> +index 31664d1..358d91b 100644
>  --- a/glslc/CMakeLists.txt
>  +++ b/glslc/CMakeLists.txt
>  @@ -53,7 +53,6 @@ shaderc_default_compile_options(glslc_exe)
> diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
> index e886e81d0e..18a08ee6c5 100644
> --- a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
> +++ b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
> @@ -8,16 +8,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>  
>  SRCREV = "0dbd899941a43ffd55df527d65128b3b66e75c9c"
>  SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
> -           file://0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch \
> -           file://0003-cmake-de-vendor-libs-and-disable-git-versioning.patch \
> +           file://0001-cmake-de-vendor-libs-and-disable-git-versioning.patch \
>             "
> +UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
>  S = "${WORKDIR}/git"
>  
>  inherit cmake python3native
>  
>  DEPENDS = "spirv-tools glslang"
>  
> -EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DSHADERC_SKIP_TESTS=ON"
> +EXTRA_OECMAKE = " \
> +    -DCMAKE_BUILD_TYPE=Release \
> +    -DSHADERC_SKIP_TESTS=ON \
> +    -Dglslang_SOURCE_DIR=${STAGING_INCDIR}/glslang \
> +"
>  
>  BBCLASSEXTEND = "native nativesdk"
>  
> -- 
> 2.30.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
