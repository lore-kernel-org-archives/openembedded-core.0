Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 12D9B781AD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:51:58 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id k4so8266740otd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 07:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/IcL302nhDCBnSj+SB809veek5f2yD6GEZ0mCJSXWmU=;
	b=Vx9MHdKbLgn7wDADoNFXV4e5J5CMthbf0y3Dv5/8ZzEj6I8vSyV1164c3Km4xt/gMT
	P6S4NUaV+BNtmoY2Ei/40qbdtB8z7GS/a0OGhCrz7dROpN9hgNrR5dzetkq5C6PLXEBF
	c+QfO7mpIYDZx/WXyDAb933jd0zRdeQWxaEBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/IcL302nhDCBnSj+SB809veek5f2yD6GEZ0mCJSXWmU=;
	b=euACWWESURHHZetKKu+pnOWBmjAiFmcdQAgFAE+zsPrstpSnzqqzhnts74sDDitv+a
	mSoN5nKH5bJe82MV5/64t5hRyQDCgPptVz5rcUg9wirtTm2Sfko+zC9t7L1oW276O2ug
	4VrUUQAI0LqOg/UbpbcICKlv2Sczmgw05nSSrFYjxlKGDtZQn8EAfa7qfkC4CSh9j9wl
	+NINB4T8bRtFg3p+AfGT9D3nuhsncztnP4ysn3QARehqa4Kan6f0OrWGYueriqPzflgK
	loJa/+ql4gskSuMzH5q5sJt1AtSwXGBAOVk5MpRDakmI9YOtYd1I+jYFvcsPqCmSB11u
	425g==
X-Gm-Message-State: AODbwcASJbSG7oLfJzkP2zCJ3KDl7wxZA1x9i2jlZ3KlqJF9zBWxGAeF
	vfe//XBkjEmsMZtx+c4kew==
X-Received: by 10.157.73.143 with SMTP id g15mr9005563otf.59.1496847119678;
	Wed, 07 Jun 2017 07:51:59 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	f35sm986880otd.15.2017.06.07.07.51.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jun 2017 07:51:59 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 09:51:21 -0500
Message-Id: <1496847081-30528-3-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1496847081-30528-1-git-send-email-daniel.diaz@linaro.org>
References: <1496847081-30528-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [PATCH 3/3 v2][pyro] piglit: add patches for unbuildable surfaceless Mesa test
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
X-List-Received-Date: Wed, 07 Jun 2017 14:51:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[Backported from master.]

Some EGL implementations do not actually ship all Khronos-
extensions. As it turns out, the Mali 450 driver does not
include any of the following symbols, used by the
egl_mesa_platform_surfaceless.c spec test:
* eglGetPlatformDisplay
* eglCreatePlatformPixmapSurface
* eglCreatePlatformWindowSurface

The Right Thing To Do was to obtain the implementation of
these functions (via eglGetProcAddress), as is provided
by their EXT counterparts. These are guaranteed to exist
since they are required by EGL_EXT_platform_base.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
v2: Embed upstream status into patches; add patch into recipe.

 ...nour-Surfaceless-MESA-in-get_default_disp.patch | 54 +++++++++++++++
 ...atform_surfaceless-Don-t-use-eglGetPlatfo.patch | 36 ++++++++++
 ...atform_surfaceless-Use-EXT-functions-for-.patch | 78 ++++++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         |  3 +
 4 files changed, 171 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch b/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
new file mode 100644
index 0000000..f3aa1ba
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
@@ -0,0 +1,54 @@
+From a6608f218b5023cef36b3de5ec3c5f00b0211d1c Mon Sep 17 00:00:00 2001
+From: Daniel Diaz <daniel.diaz@linaro.org>
+Date: Wed, 17 May 2017 18:00:15 -0500
+Subject: [PATCH 2/4] util/egl: Honour Surfaceless MESA in get_default_display
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The EGL_MESA_platform_surfaceless extension was introduced not too long
+ago. Add support for it our helper.
+
+Upstream-Status: Accepted, since git 7b74602.
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+---
+ tests/util/piglit-util-egl.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/tests/util/piglit-util-egl.c b/tests/util/piglit-util-egl.c
+index 106c735..389fe12 100644
+--- a/tests/util/piglit-util-egl.c
++++ b/tests/util/piglit-util-egl.c
+@@ -85,6 +85,7 @@ piglit_egl_get_default_display(EGLenum platform)
+ 	static bool has_x11 = false;
+ 	static bool has_wayland = false;
+ 	static bool has_gbm = false;
++	static bool has_surfaceless_mesa = false;
+ 
+ 	static EGLDisplay (*peglGetPlatformDisplayEXT)(EGLenum platform, void *native_display, const EGLint *attrib_list);
+ 
+@@ -99,6 +100,7 @@ piglit_egl_get_default_display(EGLenum platform)
+ 		has_x11 = piglit_is_egl_extension_supported(EGL_NO_DISPLAY, "EGL_EXT_platform_x11");
+ 		has_wayland = piglit_is_egl_extension_supported(EGL_NO_DISPLAY, "EGL_EXT_platform_wayland");
+ 		has_gbm = piglit_is_egl_extension_supported(EGL_NO_DISPLAY, "EGL_EXT_platform_gbm");
++		has_surfaceless_mesa = piglit_is_egl_extension_supported(EGL_NO_DISPLAY, "EGL_MESA_platform_surfaceless");
+ 
+ 		peglGetPlatformDisplayEXT = (void*) eglGetProcAddress("eglGetPlatformDisplayEXT");
+ 	}
+@@ -123,6 +125,11 @@ piglit_egl_get_default_display(EGLenum platform)
+ 			return EGL_NO_DISPLAY;
+ 		}
+ 		break;
++	case EGL_PLATFORM_SURFACELESS_MESA:
++		if (!has_surfaceless_mesa) {
++			return EGL_NO_DISPLAY;
++		}
++		break;
+ 	default:
+ 		fprintf(stderr, "%s: unrecognized platform %#x\n", __func__, platform);
+ 		return EGL_NO_DISPLAY;
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch b/meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch
new file mode 100644
index 0000000..0f24dc1
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch
@@ -0,0 +1,36 @@
+From c0dc430b8f5deeacdb11cd188195e16f512af233 Mon Sep 17 00:00:00 2001
+From: Daniel Diaz <daniel.diaz@linaro.org>
+Date: Wed, 17 May 2017 18:00:16 -0500
+Subject: [PATCH 3/4] egl_mesa_platform_surfaceless: Don't use
+ eglGetPlatformDisplay directly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The entry point is not guaranteed to exist, so use the
+piglit_egl_get_default_display() helper which does the correct thing.
+
+Upstream-Status: Accepted, since git 7b74602.
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+---
+ .../spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c  | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c b/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
+index 3bbd6aa..81a3919 100644
+--- a/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
++++ b/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
+@@ -31,7 +31,7 @@ test_setup(EGLDisplay *dpy)
+ 
+ 	piglit_require_egl_extension(EGL_NO_DISPLAY, "EGL_MESA_platform_surfaceless");
+ 
+-	*dpy = eglGetPlatformDisplay(EGL_PLATFORM_SURFACELESS_MESA, NULL, NULL);
++	*dpy = piglit_egl_get_default_display(EGL_PLATFORM_SURFACELESS_MESA);
+ 	if (*dpy == EGL_NO_DISPLAY) {
+ 		printf("failed to get EGLDisplay\n");
+ 		piglit_report_result(PIGLIT_SKIP);
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch b/meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch
new file mode 100644
index 0000000..0952af5
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch
@@ -0,0 +1,78 @@
+From 57de1ff6758ec5ea4a52637f233e3e3150086255 Mon Sep 17 00:00:00 2001
+From: Daniel Diaz <daniel.diaz@linaro.org>
+Date: Wed, 17 May 2017 18:00:17 -0500
+Subject: [PATCH 4/4] egl_mesa_platform_surfaceless: Use EXT functions for
+ surfaces
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+These EXT symbols are guaranteed to exist since they require
+EGL_EXT_platform_base.
+
+Upstream-Status: Accepted, since git 7b74602.
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+---
+ .../egl_mesa_platform_surfaceless.c                | 23 ++++++++++++++++++++--
+ 1 file changed, 21 insertions(+), 2 deletions(-)
+
+diff --git a/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c b/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
+index 81a3919..264ed71 100644
+--- a/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
++++ b/tests/egl/spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c
+@@ -24,6 +24,24 @@
+ #include "piglit-util.h"
+ #include "piglit-util-egl.h"
+ 
++/* Extension function pointers.
++ *
++ * Use prefix 'pegl' (piglit egl) instead of 'egl' to avoid collisions with
++ * prototypes in eglext.h. */
++EGLSurface (*peglCreatePlatformPixmapSurfaceEXT)(EGLDisplay display, EGLConfig config,
++	    NativePixmapType native_pixmap, const EGLint *attrib_list);
++EGLSurface (*peglCreatePlatformWindowSurfaceEXT)(EGLDisplay display, EGLConfig config,
++	    NativeWindowType native_window, const EGLint *attrib_list);
++
++static void
++init_egl_extension_funcs(void)
++{
++	peglCreatePlatformPixmapSurfaceEXT = (void*)
++		eglGetProcAddress("eglCreatePlatformPixmapSurfaceEXT");
++	peglCreatePlatformWindowSurfaceEXT = (void*)
++		eglGetProcAddress("eglCreatePlatformWindowSurfaceEXT");
++}
++
+ static void
+ test_setup(EGLDisplay *dpy)
+ {
+@@ -72,7 +90,7 @@ test_create_window(void *test_data)
+ 
+ 	test_setup(&dpy);
+ 
+-	surf = eglCreatePlatformWindowSurface(dpy, EGL_NO_CONFIG_KHR,
++	surf = peglCreatePlatformWindowSurfaceEXT(dpy, EGL_NO_CONFIG_KHR,
+ 					      /*native_window*/ NULL,
+ 					      /*attrib_list*/ NULL);
+ 	if (surf) {
+@@ -103,7 +121,7 @@ test_create_pixmap(void *test_data)
+ 
+ 	test_setup(&dpy);
+ 
+-	surf = eglCreatePlatformPixmapSurface(dpy, EGL_NO_CONFIG_KHR,
++	surf = peglCreatePlatformPixmapSurfaceEXT(dpy, EGL_NO_CONFIG_KHR,
+ 					      /*native_window*/ NULL,
+ 					      /*attrib_list*/ NULL);
+ 	if (surf) {
+@@ -205,6 +223,7 @@ main(int argc, char **argv)
+ 		piglit_report_result(PIGLIT_FAIL);
+ 	}
+ 
++	init_egl_extension_funcs();
+ 	result = piglit_run_selected_subtests(subtests, selected_names,
+ 					      num_selected, result);
+ 	piglit_report_result(result);
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 19db86c..2ea5779 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -6,6 +6,9 @@ SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
            file://0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch \
+           file://0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch \
+           file://0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch \
+           file://0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch \
            "
 
 # From 2017-02-06
-- 
1.9.1


