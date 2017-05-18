Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 16D427809B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 18:22:52 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id h4so64969194oib.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0WjNzfrnfKS+I0xhE6IJZh10Fa8UYubJPqrM/FeGeVk=;
	b=IZ0W9fK1v0NJbMwLRdoHvnUV4MN43kR0wOwm0QLTiOZEv96imjpdARr/3WHRWRbbUe
	wImb45g7cdgrbu3FZMom0Opz84i0ya6M9FjsNZUQZ5VZAqaBhwh0aXC5hB+03E3qcBEu
	0Uf8r2z9w0gYMj62irfMg8CKzFdIaGWToL1eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0WjNzfrnfKS+I0xhE6IJZh10Fa8UYubJPqrM/FeGeVk=;
	b=s9Jk/fSDoWko4XNLeKQliqLT4EzNifv48jakSdURgrgoo6rg7uRDTmaRXs88x5XcV3
	OS3YtAl1c1jhDNKVJ8zwQGgKtlvqrEDjYx0kzL1czAZY8R1cbjxrLCvkuOBBqNQCy/nW
	T/ff7k9txr6KSWlNReyFdP+eDF6vOe/2PjhMjTP/4yPMWYDoz/VNh5dTL6VvdoUxbfDo
	dOneEfXql7ZUFZIXhelKxckA3ai/jo1l98Cp5bJnJyY/byelW6TatFkdNJamLVH7Ba91
	nlfMSbVMXqnoff33qDjKQLlnxA8Eh+/9WSxS0CBpEND25Obb/xJE9c6yO3BnbVttbDtl
	srsg==
X-Gm-Message-State: AODbwcByptJ+WMT7i9o1tGNpBKlhFfEgArvRna7263UFS22c7b9mxgV9
	Abl61r9fPVqoIgfX
X-Received: by 10.202.98.68 with SMTP id w65mr3072292oib.173.1495131774045;
	Thu, 18 May 2017 11:22:54 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	c10sm2863501otb.38.2017.05.18.11.22.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 May 2017 11:22:53 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 13:22:37 -0500
Message-Id: <1495131757-7261-3-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495131757-7261-1-git-send-email-daniel.diaz@linaro.org>
References: <1495131757-7261-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] piglit: add patches for unbuildable surfaceless Mesa test
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
X-List-Received-Date: Thu, 18 May 2017 18:22:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

Upstream-Status: Submitted [piglit@lists.freedesktop.org]

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 ...nour-Surfaceless-MESA-in-get_default_disp.patch | 48 ++++++++++++++
 ...atform_surfaceless-Don-t-use-eglGetPlatfo.patch | 30 +++++++++
 ...atform_surfaceless-Use-EXT-functions-for-.patch | 75 ++++++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch b/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
new file mode 100644
index 0000000..734de2b
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
@@ -0,0 +1,48 @@
+From aa6728cc4941a87e3933c2aa770ab8ae3080b870 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
+Date: Tue, 16 May 2017 12:37:07 -0500
+Subject: [PATCH 2/4] util/egl: Honour Surfaceless MESA in get_default_display
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
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
index 0000000..7ec71dd
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch
@@ -0,0 +1,30 @@
+From b02bdbfdba3464ce47f87c04bcd1d35a8fef3f54 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
+Date: Wed, 17 May 2017 17:53:10 -0500
+Subject: [PATCH 3/4] egl_mesa_platform_surfaceless: Don't use
+ eglGetPlatformDisplay directly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
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
index 0000000..b3931dd
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch
@@ -0,0 +1,75 @@
+From f3bb10947a87cc3a59619847f53d47708e10fbb7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
+Date: Wed, 17 May 2017 10:51:48 -0500
+Subject: [PATCH 4/4] egl_mesa_platform_surfaceless: Use EXT functions for
+ surfaces
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+These EXT symbols are guaranteed to exist since they require
+EGL_EXT_platform_base.
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
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
-- 
1.9.1


