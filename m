Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3653C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 19:46:39 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.4647.1724269591516848894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 12:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Az9OssU5;
 spf=pass (domain: baylibre.com, ip: 209.85.160.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-44fe9cf83c7so630691cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724269590; x=1724874390; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gHWv8p+wL7uxkgs1ibJSSg0ky6UHTBZ/rIbgauZ3WpE=;
        b=Az9OssU5oRfB5y4dPAU9KOfAaiFG/UkycpYyQD6RelN0xz1Im1e6IJYe4XHIRq1O5z
         9EFo3yzzLJshEUJKgkCvZUjCMvjA8RaO3krwwWUTSsNZNyvJzWub3azUoVFNXSy/tYRt
         aINwPk271kFo4zZ4ne51CnbSYtYOFH6jJmhZ/QsK7JElSr7RHO4BV2jzbLzq8kixneSn
         FBrttAbuNIENWQSpFxOI+c8Gn+ZVtpy8Oo8NDzufV4VR2BvQGV0xhafBX3E0Su6B4ne1
         wPqIqgRczR6yPJWKFhXdlKHHyzY9yXi6c4aZmDYesGCUpwTdjDMAL81ibGS4HZ5htBCO
         dn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724269590; x=1724874390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gHWv8p+wL7uxkgs1ibJSSg0ky6UHTBZ/rIbgauZ3WpE=;
        b=wZtu1yWqRZhpwK35LxWjFPiDOBnvBuLS2kAX29VmhBcmaTvTw/C1lG9PDJm4mlqbDH
         30Opyv6JDRuGYATdG8dzIVhs4+fj1e9ywc3xnYatUNFvlrSN5kjsmdItqXDndogK5X4z
         MJZ6SiNxJ5+0DhF8GnLz339s76etxAKvoYB8msFauk/qZSyGoRQPdhSmlcCFt6IMM9tI
         DBuDTZtB62QDulsI0L3MzQEPcfQJxlU3mAoPBPjBY2D/TyJj2Z/zUCSWj/A7zU0XSKV8
         csdYAjkAphBFTEgvkARm6UJj9sXUfKH9KD6FuxOAG6fcqwVF4hmawbqJs2vqeZMek76P
         Gjgw==
X-Gm-Message-State: AOJu0Yw2+MFik1kD+XVjqNByCM2zAoOjr2B416qDd3lZjILS5TKp+xjv
	h7jLSrTxuoBURR4l8ICq+ofTthxajKSsmJnWWJ3XLn1TRlbZB9usWK/H6aeIyjIrz0ZQBRLdaak
	lm9M=
X-Google-Smtp-Source: AGHT+IFJqnzxGlsPvyHdLyMeZuHRGAwl2fxM8rAJzwG35NsNjeDiGVAJEqeX1/OdNhxWqV5SmT2UXQ==
X-Received: by 2002:a05:622a:6181:b0:451:d5bf:7b03 with SMTP id d75a77b69052e-454f21c3d64mr28619471cf.7.1724269590140;
        Wed, 21 Aug 2024 12:46:30 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45369fd7a4esm62414901cf.19.2024.08.21.12.46.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 12:46:29 -0700 (PDT)
Message-ID: <3e53c001-7c60-427d-be5a-ae01bdc4a7ba@baylibre.com>
Date: Wed, 21 Aug 2024 15:46:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v3] piglit: upgrade 22eaf6a91c -> c11c9374c1
To: openembedded-core@lists.openembedded.org
References: <17EDD5FCB55B6698.29323@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <17EDD5FCB55B6698.29323@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 19:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203611


On 2024-08-21 3:45 p.m., Trevor Gamblin via lists.openembedded.org wrote:
> Commit 766669895d fixes builds with numpy 2.x.
>
> Patch '0001-utils-Include-libgen.h-on-musl-linux-systems.patch' dropped
> because it is now upstream in commit 9c941dfc36.
>
> Add wayland and wayland-protocols to DEPENDS to avoid errors during
> build.
>
> Adjust the x11 PACKAGECONFIG flags so that piglit builds without x11
> available.

FYI, I've tried the reproducible tests on piglit with and without 
TCLIBC=musl, and also with and without the numpy 2.0.1 upgrade, and I 
can't reproduce them. Hopefully this works on the AB now.

- Trevor

>
> Changelog:
>
> c11c9374c (HEAD -> main, origin/main, origin/HEAD) arb_bindless_texture: test image/sampler constructors
> f11abb664 Revert "arb_bindless_texture: add another function param bindless test"
> 045343687 arb_gpu_shader5: add linker version of function overloads test
> 4b1116f3a arb_bindless_texture: add another function param bindless test
> 4a62c2672 glsl: test function linking with implicit param conversions
> 9f280db77 arb_bindless_texture: add basic function param bindless tests
> 766669895 generated_tests: fix numpy overflow warnings that are errors in numpy 2.0
> 5214915dc generated_tests: print mako exceptions
> 41bd119f2 arb_texture_buffer_object: don't leak src strings
> 582f5490a gl-1.0: Add a test for glPushAttrib/glPopAttrib
> 647d07250 ext_texture_format_bgra8888: test GL_BGRA8_EXT as well
> dee2a233f perf: port glsl-compile-time perf-test from mesa demos
> 18333c568 perf: port vertexrate perf-test from mesa demos
> e932fa2f5 perf: port vbo perf-test from mesa demos
> f9cf4788a perf: port teximage perf-test from mesa demos
> 20ccc1c10 perf: port readpixels perf-test from mesa demos
> 556a9c96d perf: port genmipmap perf-test from mesa demos
> 225b6bfb6 perf: port fill perf-test from mesa demos
> dae4a13f9 perf: port fbobind perf-test from mesa demos
> cd0f812b3 perf: port copytex perf-test from mesa demos
> fdf3fc09d cl: add missing errors
> 01b64dd06 glsl-1.10: test a complex partial unroll scenario
> cf8daaf5b glsl-bug-110796: detect missing ES 3.2 support using EGL_BAD_MATCH
> 30d34daf7 glsl-bug-110796: distinguish which context creation failed
> 3ea14414a Sync .mailmap from Mesa
> 7accec34a glsl-bug-110796: check for GL ES 3.2 support
> 12ebd71c7 egl-terminate-then-unbind-context: simplify
> 69bc38a77 egl_khr_create_context: improve skip reporting
> 209becf6d arb_blend_func_extended: simplify MAX_DUAL_SOURCE_DRAW_BUFFERS detection
> 800abe232 arb_blend_func_extended: gles: follow the specification requirements
> 1cad6ee20 arb_texture_multisample: require geometry shaders
> 59bdc8c4e egl: missing EGLconfig isn't stderr material
> cee2190b5 ext_external_objects: avoid stderr when we skip the test
> 8cbefab52 util: remove handwritten defines and drop FIXME
> 11e7aa044 texsubimage: fix low bpp formats by expecting less than 8 bits of precision
> e180f9623 Use GBM_LDFLAGS to get all options
> 3bddb36e8 fix vk_vert_buf_reuse cleanup
> 8f6e71975 arb_texture_view: test for NaN in more cases
> 446c20f3e ext_direct_state_access: Fix deprecated-non-prototype warnings
> 8a6ce9c6f arb_fragment_layer_viewport: don't test out-of-range gl_Layer values
> 8d5af6c51 glsl-1.30: Test uint to float conversion of sign extended value
> 7aa7bc1b0 arb_draw_buffers_blend: Fix deprecated-non-prototype warnings
> 3d3a20a2b arb_sample_shading: do not actually run mask_in_one if it's not supported
> 759cc6454 clear-stencil: new test to check for problems clearing stencils
> 2c64a91bb read_depth_offset: new test to check depth offset calculation
> 869a1b6e8 replayer: create bin/ everytime
> 9be2db198 Reduce precision in depth clear precision check
> 7f40f35a3 Add float from half function
> f7ece74a1 tests/gbm: Add gbm_device_get_fd() test
> fd4a6c521 wayland: Add Wayland dmabuf driver-name test
> df0d0ae79 conversion-explicit: use a different value for normalized +/- min
> a482803ac cmake: if we specify PIGLIT_BUILD_GL_TESTS OPENGL_FOUND is always true
> 67b89b3e3 README: recommend Ninja by default and switch to cmake --build
> efd111853 cmake: build is compatible up to 3.28
> e84aca9b5 cmake: add workaround for CMP0148
> 2e70ca91e README: ccmake is not that common, regular cmake is enough to build
> e39ba99e5 README: update requirements
> d945707b9 cmake: WGL doesn't need Waffle, pass the definition without it
> 938a9dc9f cmake: remove this 12 years old workaround taking too many lines
> 7e5ca052d cmake: implement switch for the EGL tests and simplify test conditions
> cd9d15364 cmake: make PIGLIT_BUILD_DMA_BUF_TESTS aligned with GBM dependency
> 4af47af27 cmake: depend on WGL_TESTS being enabled to build WGL
> a222d50bb cmake: implement GBM and Wayland controls
> 4230c7e9f cmake: fix unusually formated statement
> d958b70d1 cmake: implement X11 option (required for GLX)
> 4319b9fc8 cmake: move GLX and WGL option to the beggining of the file
> 44e1c29bf cmake: move first batch of option() at the beggining of the file
> 96241ea22 cmake: rename default values with prefix DEFAULT_
> 21374d8d3 cmake: move defaults into the per-platform section
> 86d3f1132 cmake: predefine defaults depending on the system
> 381221a81 cmake: drop unused CMP0042 policy
> 99eade7cd cmake: respect indentation
> dd6f7eaf8 texturing: add a test for GPU/CPU sync when creating textures
> 025e462ae util: fix multisample_texture_fs_template
> f9e26b98b tests: add a test for GL_APPLE_sync
> b24c834d9 ci: codespell ignore list is lowercase
> 0a842edd0 more spelling fixes accross the whole codebase
> 2c473ea73 ci: bump distribution tag
> 7cd28b970 arb_multisample: Fix bitwise-instead-of-logical warning
> 19e58247e ext_texture_storage: Fix memory leak on error path
> d0b5d0c1f arb_internalformat_query2: fix internalformat selection for max_layers subtest
> 74064b1d4 arb_clear_texture: only test float depth textures when supported
> 9c941dfc3 properly check for libgen.h
> c55e22a5c arb_copy_image-formats: avoid undefined behavior
> 537831d48 intel/ppgtt: Use getpagesize fallback with MinGW
> b32186ee5 README: add Vulkan into the generic description
> 1e631479c fix arb_query_buffer_object-qbo to warn on invalid GS results instead of fail
> 62938a9bc tests: Fix cl test program@execute@builtin@builtin-float-degrees-1.0.generated issue about tolerance.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v3 adjusts the PACKAGECONFIG for x11 to handle builds without it.
> v2 added wayland and wayland-protocols to DEPENDS to solve build errors
> seen on the AB.
>
>   ...clude-libgen.h-on-musl-linux-systems.patch | 83 -------------------
>   meta/recipes-graphics/piglit/piglit_git.bb    |  7 +-
>   2 files changed, 3 insertions(+), 87 deletions(-)
>   delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
>
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch b/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
> deleted file mode 100644
> index 2875dd52ec8..00000000000
> --- a/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -From 6c852e6ac292008137a6f3a8aa908090bb5b4b11 Mon Sep 17 00:00:00 2001
> -From: Erik Faye-Lund <erik.faye-lund@collabora.com>
> -Date: Tue, 19 Mar 2024 16:34:02 +0100
> -Subject: [PATCH] properly check for libgen.h
> -
> -Some users are reporting that basename is not available when building on
> -Linux with musl libc. And since the POSIX spec[1] says that basename is
> -defined in libgen.h, we should include that when available.
> -
> -So let's properly detect the header, and include it if it exists. This
> -should hopefully make things a bit more robust.
> -
> -Since we're also including this from the CL program-tester, let's
> -rearrange the includes a bit so we know that config.h has been included.
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/888]
> -Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - CMakeLists.txt                    | 1 +
> - tests/cl/program/program-tester.c | 5 ++++-
> - tests/util/config.h.in            | 1 +
> - tests/util/piglit-util.h          | 4 ++--
> - 4 files changed, 8 insertions(+), 3 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index dd2bf67125..5563fe0e20 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -492,6 +492,7 @@ check_include_file(unistd.h    HAVE_UNISTD_H)
> - check_include_file(fcntl.h     HAVE_FCNTL_H)
> - check_include_file(linux/sync_file.h HAVE_LINUX_SYNC_FILE_H)
> - check_include_file(endian.h    HAVE_ENDIAN_H)
> -+check_include_file(libgen.h    HAVE_LIBGEN_H)
> -
> - if(DEFINED PIGLIT_INSTALL_VERSION)
> - 	set(PIGLIT_INSTALL_VERSION_SUFFIX
> -diff --git a/tests/cl/program/program-tester.c b/tests/cl/program/program-tester.c
> -index 97fe64906d..e47fb5aacc 100644
> ---- a/tests/cl/program/program-tester.c
> -+++ b/tests/cl/program/program-tester.c
> -@@ -31,10 +31,13 @@
> - #include <inttypes.h>
> - #include <math.h>
> - #include <regex.h>
> --#include <libgen.h>
> -
> - #include "piglit-framework-cl-program.h"
> -
> -+#ifdef HAVE_LIBGEN_H
> -+#include <libgen.h>
> -+#endif
> -+
> - /* Regexes */
> -
> - /*
> -diff --git a/tests/util/config.h.in b/tests/util/config.h.in
> -index 8ed5af1709..437eb91418 100644
> ---- a/tests/util/config.h.in
> -+++ b/tests/util/config.h.in
> -@@ -16,3 +16,4 @@
> - #cmakedefine HAVE_SYS_RESOURCE_H 1
> - #cmakedefine HAVE_UNISTD_H 1
> - #cmakedefine HAVE_ENDIAN_H 1
> -+#cmakedefine HAVE_LIBGEN_H 1
> -diff --git a/tests/util/piglit-util.h b/tests/util/piglit-util.h
> -index 4d3606c708..de999980b6 100644
> ---- a/tests/util/piglit-util.h
> -+++ b/tests/util/piglit-util.h
> -@@ -52,8 +52,8 @@ extern "C" {
> - #include <math.h>
> - #include <float.h>
> -
> --#if defined(__APPLE__) || defined(__MINGW32__)
> --#  include "libgen.h" // for basename
> -+#ifdef HAVE_LIBGEN_H
> -+#  include <libgen.h> // for basename
> - #elif defined(_MSC_VER)
> -
> - static inline char *
> ---
> -GitLab
> -
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> index 99d75e64f86..c7f2e17f20a 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -10,11 +10,10 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
>              file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
>              file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
>              file://0001-tests-Fix-narrowing-errors-seen-with-clang.patch \
> -           file://0001-utils-Include-libgen.h-on-musl-linux-systems.patch \
>              "
>   UPSTREAM_CHECK_COMMITS = "1"
>   
> -SRCREV = "22eaf6a91cfd57f7bb3df4e5068c2ac1472d4ec1"
> +SRCREV = "c11c9374c1448d01b31e7f724921cc1f4ee2c84c"
>   # (when PV goes above 1.0 remove the trailing r)
>   PV = "1.0+gitr"
>   
> @@ -23,7 +22,7 @@ S = "${WORKDIR}/git"
>   X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
>   X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
>   
> -DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl"
> +DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl wayland wayland-protocols"
>   
>   inherit cmake pkgconfig python3native features_check bash-completion
>   
> @@ -40,7 +39,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glx', '',
>   PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
>   PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
>   PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,virtual/opencl-icd"
> -PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
> +PACKAGECONFIG[x11] = "-DPIGLIT_USE_X11=1 -DPIGLIT_BUILD_GL_TESTS=ON -DPIGLIT_BUILD_DMA_BUF_TESTS=ON,-DPIGLIT_USE_X11=0 -DPIGLIT_BUILD_GL_TESTS=OFF -DPIGLIT_BUILD_DMA_BUF_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
>   PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,glslang-native vulkan-loader,glslang"
>   
>   export PIGLIT_BUILD_DIR = "../../../../git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203610): https://lists.openembedded.org/g/openembedded-core/message/203610
> Mute This Topic: https://lists.openembedded.org/mt/108025942/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

