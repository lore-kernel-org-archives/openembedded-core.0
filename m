Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C5EC44502
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:33 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155310.1783358249764982469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sAQhEpPW;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c7902f47so19941715e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358248; x=1783963048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLc9Ri9+rQku+pmD/Y5ACzCuKet2/ZVWA3wFOmAEGM4=;
        b=sAQhEpPWnRVLKPlhe/Lp32LjnyvS4RWXumRYfOvirG4JEmSgzAuG8CKqs2EsOKg+W8
         /6zCZWc9zn+pEXnubslLky02JUwL4kWXyArnWkCCzPwVNA063M5m/PilyShAzcbsRaOi
         3pZGOa/udyoccqdK+apWkLqctrLCVLktuEFuKKPll23bJG08b6wBx/s+7H8/ICQzciBP
         ldVXDp/5SNRus15V2phIthRBVYcDcCbizrLPZm3VC6hyZUEAYkw9pwvRTbPvKTJs52LO
         CpZUdb3MdySSdjM7+TcsnoG/xk4QOxHbCqBp1w9E+0n4cVIVBCfoEfZbC39fD3Qn1Hb8
         nNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358248; x=1783963048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLc9Ri9+rQku+pmD/Y5ACzCuKet2/ZVWA3wFOmAEGM4=;
        b=OEfIOGy9PkBGjtL2q1JCtlhMcluoCzhOkH9aiY+wvAR1QtVsByTvNqrvhXXuwl+bXd
         aVzXH6V9Xdi7WLgfeJKxAIjVxQJem6u/KjGr1xjokbV3NoOf5M1QmeoIVVxa9awd34nK
         0w9Dvb4gJYlWYYGNdr0/wN35sJt+GOQZ1t+6AtPWLMpF+9ZfjHjIx61BVlT0JTkf9Qvm
         jbxJvYngm94RjZh8GLj8SzsSjhd7lDRkfZN71Jlog9PhzoP0Cil7WWANvGNotyFIZaJF
         g4lF/gUxAguaThkkimdWxj/MAfqrWKfQ4VHfNMcUvqO/9aKHH1mSzA5zqgT5o0ri0t30
         lwqw==
X-Gm-Message-State: AOJu0Ywkt9mZy0e6L0YRSivH6amfBmkWUUXbxDzvZyA9qKdfEg0F675S
	QjJxl4S8vt+QtLDeZPBW9VtnzWt6fziP1nUNUoVufcz+wUXmyAkJJZ06mvh6ng==
X-Gm-Gg: AfdE7ckyZnDL2Nu1QUB9RsnXJ2MAi1WQa3sl7oKIitHo9zEDlvGPiMAJDcTr2ptclhz
	dJB2QDF0l9Hy6PpyN1ZO+e39DGldRKx8DiXcJ74eO1yD7JjAGTbLSpVDayuEQQ9O7tbNAPMXQQX
	t5LDe9l+m944IbAjlwlhd7xBWPejlbFLs0GiA02ETZjBCxhFBYe9GRtU2b6LgWSFzj9fnIba3+V
	+Kqs7khkGSDxS8muE1/CVEcfnaBlEngVhkueH4sfWnoKmz9OSwyLXBTeYobYWS86WTpRIWPbT/O
	8SsShZDqKDOSkjkfylNzwAFieoyeRfzaYeamZMPl7lDQqt4Cfbp9hVrPD1Eoi8t4gn/fngDTUbY
	slBk/S/x0b8DsCdcUM4VlFwsYN8hK1JIUAtpwvT8NG+vJVoCMPuO7Rgk76Lu8p4mwAubHsPYLBU
	ykMj++22sVvyHw9GnrPad8pBgJxiPdkOF7qR+6YXVcgqehRNoDPbqhaADc2fQ=
X-Received: by 2002:a05:600c:8108:b0:492:6f9b:572e with SMTP id 5b1f17b1804b1-493df083a4amr17873145e9.37.1783358247766;
        Mon, 06 Jul 2026 10:17:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/45] piglit: upgrade to latest revision
Date: Mon,  6 Jul 2026 19:16:39 +0200
Message-ID: <20260706171701.70536-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240311

From: Alexander Kanavin <alex@linutronix.de>

Drop patches merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...o-not-obtain-wayland-scanner-path-fr.patch |   4 +-
 ...h-rename-local-lerp-to-linear_interp.patch |  46 --------
 ...use-shape-in-place-of-newshape-on-nu.patch | 105 ------------------
 ...sts-use-unsigned-int-instead-of-uint.patch |  27 +++++
 ...Fix-narrowing-errors-seen-with-clang.patch |  50 ---------
 ...ake-egl_ext_surface_compression-cond.patch |   4 +-
 ...r.py-modify-_command-and-not-command.patch |   5 +-
 ...proper-WAYLAND_INCLUDE_DIRS-variable.patch |   4 +-
 ...t-shader.c-do-not-hardcode-build-pat.patch |   2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |   6 +-
 10 files changed, 37 insertions(+), 216 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 6ce2348a71..46e5a6d83f 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 9ffd24add3263e24975318e693309881eadd99a2 Mon Sep 17 00:00:00 2001
+From abccc17819ad208c0df3edbc8bbcd134e45864f9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 99ae07a4a..d5ee9cc22 100644
+index 95f40ebfe..4c7da07b4 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch b/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
deleted file mode 100644
index 05f1dd687a..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ec0fc2fef0755b1595c3799ab25129174a4b2007 Mon Sep 17 00:00:00 2001
-From: Vinson Lee <vlee@freedesktop.org>
-Date: Sat, 7 Feb 2026 18:39:39 -0800
-Subject: [PATCH] fbo-blit-stretch: rename local lerp to linear_interp
-
-Avoid conflict with C++20 std::lerp from <cmath>, which
-causes redefinition and ambiguous call errors with newer
-toolchains.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/piglit/-/commit/ec0fc2fef0755b1595c3799ab25129174a4b2007]
-
-Signed-off-by: Vinson Lee <vlee@freedesktop.org>
-Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
----
- tests/fbo/fbo-blit-stretch.cpp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tests/fbo/fbo-blit-stretch.cpp b/tests/fbo/fbo-blit-stretch.cpp
-index a83288c0f..b0d362ecd 100644
---- a/tests/fbo/fbo-blit-stretch.cpp
-+++ b/tests/fbo/fbo-blit-stretch.cpp
-@@ -173,7 +173,7 @@ clamp(GLint &x, GLint xmin, GLint xmax)
- }
- 
- static float
--lerp(float x0, float x1, float w)
-+linear_interp(float x0, float x1, float w)
- {
- 	return x0 + (x1 - x0) * w;
- }
-@@ -181,9 +181,9 @@ lerp(float x0, float x1, float w)
- static float
- lerp2d(float xy00, float xy01, float xy10, float xy11, float wx, float wy)
- {
--	float y0 = lerp(xy00, xy01, wx);
--	float y1 = lerp(xy10, xy11, wx);
--	return lerp(y0, y1, wy);
-+	float y0 = linear_interp(xy00, xy01, wx);
-+	float y1 = linear_interp(xy10, xy11, wx);
-+	return linear_interp(y0, y1, wy);
- }
- 
- static float clearColor[4] = {
--- 
-2.49.0
-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch
deleted file mode 100644
index acf2671262..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From ad6ee4d7c4d3b882ef6196832ed2bbc78b7cb10a Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Wed, 11 Feb 2026 03:42:24 +0000
-Subject: [PATCH] generated_tests: use 'shape' in place of 'newshape' on
- numpy>=2.1
-
-The 'newshape' parameter was deprecated upstream but kept for backwards
-compatibility reasons. It was finally removed as of numpy 2.4.0, so
-transition to using 'shape' in its place when available.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/piglit/-/commit/c1dd58ff61fe6b713af795e2680c16371c1cb98c]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- generated_tests/builtin_function.py      | 17 +++++++++++++++--
- generated_tests/builtin_function_fp64.py | 17 +++++++++++++++--
- 2 files changed, 30 insertions(+), 4 deletions(-)
-
-diff --git a/generated_tests/builtin_function.py b/generated_tests/builtin_function.py
-index eb7e078..f87236f 100644
---- a/generated_tests/builtin_function.py
-+++ b/generated_tests/builtin_function.py
-@@ -58,6 +58,11 @@ import numpy as np
- if np.lib.NumpyVersion(np.__version__) >= '2.0.0b1':
-     np.set_printoptions(legacy = "1.25")
- 
-+if np.lib.NumpyVersion(np.__version__) >= '2.1.0':
-+    np_reshape_shape = 'shape'
-+else:
-+    np_reshape_shape = 'newshape'
-+
- # Floating point types used by Python and numpy
- FLOATING_TYPES = (float, np.float64, np.float32)
- 
-@@ -293,7 +298,11 @@ def column_major_values(value):
-     """Given a native numpy value, return a list of the scalar values
-     comprising it, in column-major order."""
-     if isinstance(value, np.ndarray):
--        return list(np.reshape(value, newshape=-1, order='F'))
-+        reshape_args = {
-+            np_reshape_shape: -1,
-+            'order': 'F',
-+        }
-+        return list(np.reshape(value, **reshape_args))
-     else:
-         return [value]
- 
-@@ -301,7 +310,11 @@ def column_major_values(value):
- def glsl_constant(value):
-     """Given a native numpy value, return GLSL code that constructs
-     it."""
--    column_major = np.reshape(np.array(value), newshape=-1, order='F')
-+    reshape_args = {
-+        np_reshape_shape: -1,
-+        'order': 'F',
-+    }
-+    column_major = np.reshape(np.array(value), **reshape_args)
-     if column_major.dtype == bool:
-         values = ['true' if x else 'false' for x in column_major]
-     elif column_major.dtype == np.int64:
-diff --git a/generated_tests/builtin_function_fp64.py b/generated_tests/builtin_function_fp64.py
-index 84d939c..06fe987 100644
---- a/generated_tests/builtin_function_fp64.py
-+++ b/generated_tests/builtin_function_fp64.py
-@@ -57,6 +57,11 @@ import numpy as np
- if np.lib.NumpyVersion(np.__version__) >= '2.0.0b1':
-     np.set_printoptions(legacy = "1.25")
- 
-+if np.lib.NumpyVersion(np.__version__) >= '2.1.0':
-+    np_reshape_shape = 'shape'
-+else:
-+    np_reshape_shape = 'newshape'
-+
- # Floating point types used by Python and numpy
- DOUBLE_TYPES = (float, np.float64, np.float32)
- 
-@@ -254,7 +259,11 @@ def column_major_values(value):
-     """Given a native numpy value, return a list of the scalar values
-     comprising it, in column-major order."""
-     if isinstance(value, np.ndarray):
--        return list(np.reshape(value, newshape=-1, order='F'))
-+        reshape_args = {
-+            np_reshape_shape: -1,
-+            'order': 'F',
-+        }
-+        return list(np.reshape(value, **reshape_args))
-     else:
-         return [value]
- 
-@@ -262,7 +271,11 @@ def column_major_values(value):
- def glsl_constant(value):
-     """Given a native numpy value, return GLSL code that constructs
-     it."""
--    column_major = np.reshape(np.array(value), newshape=-1, order='F')
-+    reshape_args = {
-+        np_reshape_shape: -1,
-+        'order': 'F',
-+    }
-+    column_major = np.reshape(np.array(value), **reshape_args)
-     if column_major.dtype == bool:
-         values = ['true' if x else 'false' for x in column_major]
-     else:
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch b/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch
new file mode 100644
index 0000000000..2c01fe7029
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch
@@ -0,0 +1,27 @@
+From 8b98674fedc0ac31e768ccd16165bcb585e413e2 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 2 Jul 2026 13:56:17 +0200
+Subject: [PATCH] pixel-local-tests: use unsigned int instead of uint
+
+uint is not a valid integer type in C, and this fails
+to compile under musl libc library.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1170]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c b/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
+index 4776193f2..1ac669d11 100644
+--- a/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
++++ b/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
+@@ -851,7 +851,7 @@ make_test_main_str(char *dst, struct pls_format_data *format_data,
+ 		case GL_RGBA8UI:
+ 		case GL_RG16UI:
+ 		case GL_R32UI: {
+-			uint expected[4];
++			unsigned int expected[4];
+ 			for (int comp = 0; comp < 4; comp++) {
+ 				if (comp < format_data[member].num_components)
+ 					expected[comp] = format_data[member].u[comp];
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
deleted file mode 100644
index 9751b20673..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0ba2f908f2a2a897e8e06e34f99893d11ee4734c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 3 May 2023 21:59:43 -0700
-Subject: [PATCH] tests: Fix narrowing errors seen with clang
-
-Fixes
-piglit-test-pattern.cpp:656:26: error: type 'float' cannot be narrowed to 'int' in initiali
-zer list [-Wc++11-narrowing]
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/807]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../spec/ext_framebuffer_multisample/draw-buffers-common.cpp  | 4 ++--
- tests/util/piglit-test-pattern.cpp                            | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tests/spec/ext_framebuffer_multisample/draw-buffers-common.cpp b/tests/spec/ext_framebuffer_multisample/draw-buffers-common.cpp
-index 48e1ad4a5..b36830c45 100644
---- a/tests/spec/ext_framebuffer_multisample/draw-buffers-common.cpp
-+++ b/tests/spec/ext_framebuffer_multisample/draw-buffers-common.cpp
-@@ -353,8 +353,8 @@ draw_pattern(bool sample_alpha_to_coverage,
- 		float vertices[4][2] = {
- 		{ 0.0f, 0.0f + i * (pattern_height / num_rects) },
- 		{ 0.0f, (i + 1.0f) * (pattern_height / num_rects) },
--		{ pattern_width, (i + 1.0f) * (pattern_height / num_rects) },
--		{ pattern_width, 0.0f + i * (pattern_height / num_rects) } };
-+		{ static_cast<float>(pattern_width), (i + 1.0f) * (pattern_height / num_rects) },
-+		{ static_cast<float>(pattern_width), 0.0f + i * (pattern_height / num_rects) } };
- 
- 		glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE,
- 				      sizeof(vertices[0]),
-diff --git a/tests/util/piglit-test-pattern.cpp b/tests/util/piglit-test-pattern.cpp
-index 43d451d6a..52ee94457 100644
---- a/tests/util/piglit-test-pattern.cpp
-+++ b/tests/util/piglit-test-pattern.cpp
-@@ -653,12 +653,12 @@ ColorGradientSunburst::draw_with_scale_and_offset(const float (*proj)[4],
- {
- 	switch (out_type) {
- 	case GL_INT: {
--		int clear_color[4] = { offset, offset, offset, offset };
-+		int clear_color[4] = { static_cast<int>(offset), static_cast<int>(offset), static_cast<int>(offset), static_cast<int>(offset) };
- 		glClearBufferiv(GL_COLOR, 0, clear_color);
- 		break;
- 	}
- 	case GL_UNSIGNED_INT: {
--		unsigned clear_color[4] = { offset, offset, offset, offset };
-+		unsigned clear_color[4] = { static_cast<unsigned>(offset), static_cast<unsigned>(offset), static_cast<unsigned>(offset), static_cast<unsigned>(offset) };
- 		glClearBufferuiv(GL_COLOR, 0, clear_color);
- 		break;
- 	}
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index c6c072c7e0..c71bf4c8bc 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From d6ed4c477f22309c09accd4fee68486d7714f205 Mon Sep 17 00:00:00 2001
+From 3e7ec165c718234e1afcdf730bdf20942976e25c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
@@ -39,7 +39,7 @@ index d9540bcfd..01a70164f 100644
  
  # vim: ft=cmake:
 diff --git a/tests/egl/spec/egl_ext_surface_compression/create_surface.c b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
-index e3d55d433..35f13fd00 100644
+index 71b043b54..09e87dee4 100644
 --- a/tests/egl/spec/egl_ext_surface_compression/create_surface.c
 +++ b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
 @@ -25,7 +25,6 @@
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
index f8600556e5..035e7a4d5a 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
@@ -1,4 +1,4 @@
-From 846efe923932d66810305b228fa09f83a172296d Mon Sep 17 00:00:00 2001
+From 14e56a6336f36d1112964ce1ff0900ea4b37b483 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 22 May 2025 17:34:15 +0200
 Subject: [PATCH] tests/no_error.py: modify _command and not command
@@ -27,6 +27,3 @@ index 4ecaa9a01..c64eec0a1 100644
          profile.test_list['{} khr_no_error'.format(name)] = test
 -        test.command += ['-khr_no_error']
 +        test._command += ['-khr_no_error']
--- 
-2.39.5
-
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 6cb561c3f2..329fd75975 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From deb0c15890fb9d0f4fc7074dde2a51c89cb5bf6d Mon Sep 17 00:00:00 2001
+From 4444dd748b9324508e3168f64cf0b5adc31b5ebd Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
@@ -15,7 +15,7 @@ Upstream-Status: Submitted [piglit@lists.freedesktop.org]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
-index 1714ab41f..3b67aa7da 100644
+index f9bfec555..07b821375 100644
 --- a/tests/util/CMakeLists.txt
 +++ b/tests/util/CMakeLists.txt
 @@ -97,7 +97,7 @@ if(PIGLIT_USE_WAFFLE)
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 7706d88086..9c05e639b3 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 66d1d86ff8be33df265d0dda717be385fe8637cd Mon Sep 17 00:00:00 2001
+From f9bfdb8d32c2113c39c3be1bd6fd0934f693ab03 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 0dd9c58714..a020d67bbf 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -9,16 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main \
            file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
-           file://0001-tests-Fix-narrowing-errors-seen-with-clang.patch \
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
            file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
-           file://0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch \
-           file://0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch \
+           file://0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "a0a27e528f643dfeb785350a1213bfff09681950"
+SRCREV = "56f237be32ed66820eb05ea3cb04cb8b957ccd8d"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.3


