Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADBFC88E6D
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:12:15 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5895.1789330326327355829
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DeaX63jZ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so537252f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330324; x=1789935124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6pxA5Hs1fzY9f+fXEpKb8IZhDB8TvnwX78BKKoTMWLU=;
        b=DeaX63jZXHZmQr560l/qaIRu/BCUmSJB0IisBbAWWYObA1aIFsvtUJPZao0tmaxxZL
         Qt4yLLqAvsusHcnDRSHHtS0KNT4OGSnvyqaBKmzzFq+GuFnOFgwX2fETc4HbQwUFJsVi
         9RNHMBInZR8+suy7ARoSZ+TLzoYrckqXEGNXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330324; x=1789935124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6pxA5Hs1fzY9f+fXEpKb8IZhDB8TvnwX78BKKoTMWLU=;
        b=pin5b2jXH+KR88jnq0glH4IOJyFel7uGbX5ugFYafpqzkZLuc7tCh8+jOWq2Ef1/6A
         aFL4Vs5St9awuy1PcmDkTm7FPRxQgXKrJJoMagiPEPHJVhxXlpkuXvoDu/xRpIXJ52AQ
         ToxHI2H2frU0OaaXtAB2XKqB+6EjsIelwV3FHmj46szB/9Xz4i/rwlsVAsDj+Z/Isx9x
         j8Eh48WK+lbIICiBbnnUpUUDrUKWGlL83wrtqRIp57bul6OMiCq3GVn6mMpYMM0JSYNq
         PQH0utxvo8qC6h7HIyLJrnhiBjt0ziGmwJa2WWvRF3Um9ce896hGJXKSLfVehXOQlePB
         WB6Q==
X-Gm-Message-State: AFuF++mvcAZJVRyx8iBfvmHJA/Kng60W7fhwE/a1MpO3Izv7DuwJhKK/
	YOEdzPq6eCcJH+rdxd/p3GgNgz1zDHGOhFEKScqncjQzOsmXL0ZWcOBYppDbZxA0V/LbnBbVM9+
	sZewQ5A4=
X-Gm-Gg: AYBFou289lY7sVhndpvZaUI3ZnnzlkzjDScz6j1neh4gwbJUO5VTDuvvBm/oM5XZ3Nd
	i0pI++2I4EOumZGr7PbdXkY9k1WJzV94LoAgI3pY9hiIhUCszy8RLTTp2+z+WCHtPBVagaINGJs
	6WSMLiodag3YwlxXzn5daBKfIOOOHd9zuh36pEyjrkw1sXXzRycLJLt5lygIVKSQ621rzeLkOdZ
	DTghS1SDP1vUDwAjKTDhMSPHV/mRvkGW9QQM2Y0XX7kTv8HFGn4abUAViXnLcGHivm+KhBOE8Jz
	4QpdQU2yucHsLoW2RWlQOEd8xmGu8tWHJeHTWYEI9ZqKmuNFXunHPvZNcja00KfPQR227yrM05i
	orj5H57PAaIN7243gZmymgj9MgOHfOeJ0gBYlRtTrjE0tWl5vyhftxgOxsrH3gp0lguRonutY8u
	TF7XVqkrWfbZsca0+y3s9y7+dzXqpof2ny4vRO/pCOWQ/n256U77aZ5MLEAWP/CBurqB3E7xmon
	RQi1oK8/M1rKWqlbRU/G/qglrpA
X-Received: by 2002:a05:6000:46c5:b0:485:8e70:fd40 with SMTP id ffacd0b85a97d-486eb1d9abbmr10613861f8f.11.1789330324378;
        Sun, 13 Sep 2026 13:12:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm21613916f8f.19.2026.09.13.13.12.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:12:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] piglit: upgrade to latest revision
Date: Sun, 13 Sep 2026 21:11:51 +0100
Message-ID: <20260913201158.687889-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
References: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245731

4950babfd khr_texture_compression_astc: check for full NPOT support
81f9eac8c cl/api: initialize 'vec3' and 's_arg' in clSetKernelArg test
fa4992cbe tests/egl_ext_surface_compression: make create test wayland-only
4d23b8c62 tests/egl_ext_surface_compression: stop using egl_utils
ac0863746 egl_khr_surfaceless_context: request proper surface
007ef311b glsl: only check line interior for clipvertex/clipdistance tests
23a87ff87 gl-3.2-compat: fix loop for GS gl_ClipVertex test
04da05647 ext_yuv_target: add BlitFramebuffer YUV-restriction tests
136db767d arb_texture_barrier: skip blending-in-shader if too few color attachments
0b1ebdeb7 arb_transform_feedback2/draw-auto: test a non-zero buffer offset
6cd2a7617 vulkan: Rename cmat-uniform-ctor test to .vk_shader_test
a84614b9c egl-terminate-then-unbind-context: allow config with any surface
e7c693381 arb_shader_storage_buffer_object: convert atomicMin-swizzle
8e28eb429 cmake: serialize vulkan.xml after generating Vulkan tests
021d398d7 arb_texture_barrier: pass real vertex index bounds to glDrawRangeElements
a8b696b24 opengl.py: register ext_yuv_target compiled tests
1521e9a5b tests/ext_frame_buffer_multisample: add message when tests is skipped due samples > max_samples
372590d39 gs-output-array-vec4-index-wr: Avoid exceeding GS output limits.
48597869c ext_external_objects: skip Vulkan timeline wait without GL timeline support
c12502949 general: test rendering with a maximum-sized viewport
a705d674d ext_image_dma_buf_import: add NV12 dual-fd vs single-fd sample test
6f4d25e3b glsl: enable PROGRAM_TWO_SIDE in glsl-packed-back-color
2216e438f arb_texture_view: use GL 3.0 functions
107825905 vulkan: Add test for divergent GS cut bits
06169021f ext_yuv_target: require GL_EXT_YUV_target for shader_runner tests
65f44948b fs-uint-to-float-of-extract-int*: Also support the alternative rounding.
2ba21df4b *-packHalf2x16.shader_test: Allow values to round to zero.
250cb0ce6 *-packHalf2x16.shader_test: Allow subnormals to flush to zero.
6cf48cf8e glx: fix visual test resource teardown order
ab113c4f1 glx-multithread-clearbuffer: synchronize version check
7cd2aa213 gl-1.0: test fixed-function fog on a floor straddling the eye
fee8b84aa arb_framebuffer_object: add test for oblong blits
cae34b151 ext_yuv_target: add NV12 sampling and rendering execution tests
2f480240d Tests for GL_EXT_YUV_target and EGL_EXT_YUV_surface
cbbb8f183 ext_texture_storage: test GLES2 NPOT level restrictions
110102701 ext_texture_storage: factor storage checks into a helper
7b1335738 ext_texture_storage: register formats test in the GPU profile
e41f57633 s3tc-errors: test level-zero NPOT images on GLES2
bf5d1cbdc generated_tests: fix incompatible pointer types in global address space CL kernels
fa1953546 glsl-1.50: test gl_PrimitiveID together with a user varying and no GS
9771f3e92 cl/api: adapt set-kernel-arg test for OpenCL 3.1 platform
c65972281 cl/api: skip CL_QUEUE_SIZE query on host command-queues
d690a61a0 cl/api: fix CL_DEVICE_MAX_MEM_ALLOC_SIZE minimum value check
e5c87380a cl/api: downgrade CL_KERNEL_ARG_INFO_NOT_AVAILABLE check from fail to warn
08ac49ecc glsl-1.10: test functions called only from global variable initializers
74fa6fb44 vulkan: Add test for cmat with non-constant uniform initializer
f5d95dbfe Add test for GL_POINT_SMOOTH
ee1b1e6fa gl-2.1/pbo: Allow subtest selection.
4fc59b500 gl-2.1/pbo: Add missing present_results.
7abe0a22d gl-2.1/pbo: Correct the location of bitmap/drawpixels's present_results().
b613ff666 piglit: Use the subtest name when the subtest option is NULL.
c92f1a6e8 ext_framebuffer_multisample/accuracy: widen full-pixel error threshold
a853ae0a8 ext_framebuffer_multisample/accuracy: accept sRGB-space MSAA resolve
9a0eab5e1 pixel-local-tests: use unsigned int instead of uint
6ae53fc12 glsl-fs-loop-unroll-mul-fp64.shader_test: Remove invalid equality tests.
7ad0f92c3 util/piglit_ktx: fix format specifier mismatch in error message
f505280a3 egl_khr_gl_image: fix memleak by terminating the context properly
29af1e16d waffle: fix leaking the EGL/DRI2 display when tests are skipped
48eb7c782 cl/program/build: fix double types to require cl_khr_fp64 or __opencl_c_fp64
d6234f3e4 ext_image_dma_buf_import: fix memleaks in case of failures
b079b2a58 glx: destroy resources properly to fix memleaks
547422968 Disable strict-aliasing analysis.
5e608d80c gl-3.2/layered-rendering: fix a memleak
8227c2795 arb_compute_shader: fix a memleak
97ab5eaf0 arb_pipeline_statistics_query: fix a memleak
64176e7bc ext_direct_state_access: fix memleaks
6d99a37fa arb_shader_storage_buffer: fix a memleak
4048186f9 arb_vertex_attrib_64bit: fix a memleak
2e61de997 shaders: fix a memleak in glsl-fs-fogscale.c
17351332f arb_gpu_shader5: fix a memleak
5f20df614 arb_viewport_array: fix a memleak
05b036f98 ext_transform_feedback: fix a memleak
0e21e79cb arb_compute_variable_group_size: fix a memleak
ddd7a9537 AMD_pinned_memory: fix a memleak
f02981b3e gl-2.0: fix a memleak with GS shaders in vertex-program-two-side
c4da96345 shader_draw_parameters: fix memleaks with shaders
a2624e664 tests/cl: add required optional int64 feature
25e68c2a7 cl: check for optional features required by tests
14d18f6a8 ext_image_dma_buf_import/transcode-nv12-as-r8-gr88: fix null checks in create_textures
e8ec6eaff llvmpipe/randomshader: use std::unique_ptr for mProgram
d3863e949 glsl-1.10: test shadow2D() across two consecutive draws
e06969f81 egl-configless-context: zero-init 'state' in main

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...o-not-obtain-wayland-scanner-path-fr.patch |  4 +-
 ...sts-use-unsigned-int-instead-of-uint.patch | 27 ----------
 ...ake-egl_ext_surface_compression-cond.patch | 52 -------------------
 ...r.py-modify-_command-and-not-command.patch |  2 +-
 ...proper-WAYLAND_INCLUDE_DIRS-variable.patch |  2 +-
 ...t-shader.c-do-not-hardcode-build-pat.patch |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |  4 +-
 7 files changed, 6 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 46e5a6d83f0..5ae8d4a4998 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From abccc17819ad208c0df3edbc8bbcd134e45864f9 Mon Sep 17 00:00:00 2001
+From 1b3d0741044c782731d22d7fed7e92ef409bb966 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 95f40ebfe..4c7da07b4 100644
+index 1a38c21f9..45c181e85 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch b/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch
deleted file mode 100644
index 2c01fe70296..00000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8b98674fedc0ac31e768ccd16165bcb585e413e2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 2 Jul 2026 13:56:17 +0200
-Subject: [PATCH] pixel-local-tests: use unsigned int instead of uint
-
-uint is not a valid integer type in C, and this fails
-to compile under musl libc library.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1170]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c b/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
-index 4776193f2..1ac669d11 100644
---- a/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
-+++ b/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
-@@ -851,7 +851,7 @@ make_test_main_str(char *dst, struct pls_format_data *format_data,
- 		case GL_RGBA8UI:
- 		case GL_RG16UI:
- 		case GL_R32UI: {
--			uint expected[4];
-+			unsigned int expected[4];
- 			for (int comp = 0; comp < 4; comp++) {
- 				if (comp < format_data[member].num_components)
- 					expected[comp] = format_data[member].u[comp];
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
deleted file mode 100644
index c71bf4c8bc8..00000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 3e7ec165c718234e1afcdf730bdf20942976e25c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 22 Nov 2024 22:52:31 +0100
-Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
- to X11
-
-Otherwise, this error occurs:
-| In file included from /srv/storage/alex/yocto/build-64/workspace/sources/piglit/tests/egl/spec/egl_ext_surface_compression/create_surface.c:28:
-| /srv/storage/alex/yocto/build-64/workspace/sources/piglit/tests/egl/spec/egl_ext_surface_compression/../../egl-util.h:12:10: fatal error: X11/Xlib.h: No such file or directory
-|    12 | #include <X11/Xlib.h>
-|       |          ^~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/974]
-Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- .../spec/egl_ext_surface_compression/CMakeLists.gles3.txt   | 6 ++++--
- tests/egl/spec/egl_ext_surface_compression/create_surface.c | 1 -
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
-index d9540bcfd..01a70164f 100644
---- a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
-+++ b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
-@@ -2,10 +2,12 @@ link_libraries(
- 	piglitutil_${piglit_target_api}
- )
- 
--piglit_add_executable(egl_ext_surface_compression-create ../../egl-util.c
-+if (PIGLIT_HAS_WAYLAND)
-+piglit_add_executable(egl_ext_surface_compression-create
- 	../../egl-wayland.c create_surface.c)
-+endif (PIGLIT_HAS_WAYLAND)
- 
--piglit_add_executable(egl_ext_surface_compression-image ../../egl-util.c
-+piglit_add_executable(egl_ext_surface_compression-image
- 	image_storage.c)
- 
- # vim: ft=cmake:
-diff --git a/tests/egl/spec/egl_ext_surface_compression/create_surface.c b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
-index 71b043b54..09e87dee4 100644
---- a/tests/egl/spec/egl_ext_surface_compression/create_surface.c
-+++ b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
-@@ -25,7 +25,6 @@
- #include "piglit-util.h"
- #include "piglit-util-egl.h"
- #include "piglit-util-gl.h"
--#include "../../egl-util.h"
- #include "../../egl-wayland.h"
- 
- static enum piglit_result
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
index 035e7a4d5a7..ee39d6df5a2 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
@@ -1,4 +1,4 @@
-From 14e56a6336f36d1112964ce1ff0900ea4b37b483 Mon Sep 17 00:00:00 2001
+From f4de80be6ed99bbade73281c0cac99bac7f5e2eb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 22 May 2025 17:34:15 +0200
 Subject: [PATCH] tests/no_error.py: modify _command and not command
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 329fd75975a..701c7076aec 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 4444dd748b9324508e3168f64cf0b5adc31b5ebd Mon Sep 17 00:00:00 2001
+From e02e95a4c3103a8223dc89b6dbad3747e641f203 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 9c05e639b3b..2f53abf4190 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From f9bfdb8d32c2113c39c3be1bd6fd0934f693ab03 Mon Sep 17 00:00:00 2001
+From d10663b34ce8606b82bc153638a2f89bda32d4c0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a3203464d1b..cd1ae5d6d28 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,13 +10,11 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
-           file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
-           file://0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "56f237be32ed66820eb05ea3cb04cb8b957ccd8d"
+SRCREV = "4950babfd2cd4408e4bfd103d935c6e5cff53d20"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 

