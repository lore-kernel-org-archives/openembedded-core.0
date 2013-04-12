Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQf8A-0003Fr-KB
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 16:39:13 +0200
Received: by mail-wi0-f170.google.com with SMTP id hm11so1713185wib.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 07:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=JFI/iG89B/9SIgLSlPwrzdTyj5zn2oz54IBsNK1rUhQ=;
	b=CDiYScursaszsb9z14NuqCvjdgKNxU/ZQhOpG9un4H4qzyTlz3O7g6lzKofc1UtT61
	UAki/pX8K9aKY4XVxbEISVytAfziY2VW4PuqbDBaJ2Mn3M0EIEGcSVhgD705nY/GFHqJ
	iy79B2RNkK7D86pZ4jZ/IszpJbUhRxyTVzqcjeVg6YP9rnnGHLYaFz0ljnlnNMhc0rFR
	+D4d8DZEdgSq47dlfK5jENcx+QED/ssRwr3yt6QU1WA8AVr8Oo3t3LTvzT5ruDUcFvKt
	s/r6DLZQcnv1GQFH24t1njHhmDlwW5uLWL5d+tv1mt1+c0Fmdqe4hwDmAMWAjn87ut+U
	2JVQ==
X-Received: by 10.180.79.227 with SMTP id m3mr4443265wix.12.1365776506020;
	Fri, 12 Apr 2013 07:21:46 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h10sm3959756wic.8.2013.04.12.07.21.44
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 07:21:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2013 15:18:57 +0100
Message-Id: <1365776338-25536-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmeaCaIYt07p3j9J65BvpH1AGwachmiC22M5QIEM3wXgHA0ixVT04/smNXy2VjZ3e8XjSQf
Subject: [PATCH] mesa-demos: fix build with non-Mesa GL stacks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 14:39:14 -0000

These patches from upstream allow mesa-demos to build and run against a non-Mesa
GL stack.  Thanks to Tom Zanussi for doing this work for EMGD in meta-intel, and
Otavio Salvador for confirming it also works for Freescale.

[ YOCTO #3469 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...glgears-Make-EGL_KHR_image-usage-portable.patch |   95 ++++++++
 .../egl-mesa-screen-surface-build-fix.patch        |  257 ++++++++++++++++++++
 .../mesa-demos/egl-mesa-screen-surface-query.patch |   35 +++
 meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    6 +-
 4 files changed, 392 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0001-xeglgears-Make-EGL_KHR_image-usage-portable.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-build-fix.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-query.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0001-xeglgears-Make-EGL_KHR_image-usage-portable.patch b/meta/recipes-graphics/mesa/mesa-demos/0001-xeglgears-Make-EGL_KHR_image-usage-portable.patch
new file mode 100644
index 0000000..43d4fb1
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0001-xeglgears-Make-EGL_KHR_image-usage-portable.patch
@@ -0,0 +1,95 @@
+From 43c2122af1caa750531f29bf734c03d1f50801d1 Mon Sep 17 00:00:00 2001
+Message-Id: <43c2122af1caa750531f29bf734c03d1f50801d1.1365283761.git.tom.zanussi@linux.intel.com>
+From: Frank Binns <frank.binns@imgtec.com>
+Date: Fri, 29 Jun 2012 14:06:27 +0100
+Subject: [PATCH] xeglgears: Make EGL_KHR_image usage portable
+
+EGL extension functions don't have to be exported which means
+xeglgears was failing to link against implementations that
+support EGL_KHR_image but were not exporting its related functions.
+
+This has been fixed by using eglGetProcAddress to get a function
+pointer instead of using the functions prototype. This is portable.
+
+Signed-off-by: Frank Binns <frank.binns@imgtec.com>
+
+Integrated-by: Tom Zanussi <tom.zanussi@linux.intel.com>
+
+Upstream-Status: Backport
+---
+ src/egl/opengl/xeglgears.c | 37 +++++++++++++++++++++++++++++++------
+ 1 file changed, 31 insertions(+), 6 deletions(-)
+
+diff --git a/src/egl/opengl/xeglgears.c b/src/egl/opengl/xeglgears.c
+index 513c587..866b89a 100644
+--- a/src/egl/opengl/xeglgears.c
++++ b/src/egl/opengl/xeglgears.c
+@@ -51,6 +51,10 @@
+ static PFNGLEGLIMAGETARGETTEXTURE2DOESPROC glEGLImageTargetTexture2DOES_func;
+ #endif
+ 
++#ifdef EGL_KHR_image
++static PFNEGLCREATEIMAGEKHRPROC eglCreateImageKHR_func;
++#endif
++
+ 
+ #define BENCHMARK
+ 
+@@ -405,6 +409,17 @@ egl_manager_new(EGLNativeDisplayType xdpy, const EGLint *attrib_list,
+       eglGetProcAddress("glEGLImageTargetTexture2DOES");
+ #endif
+ 
++#ifdef EGL_KHR_image
++   eglCreateImageKHR_func = (PFNEGLCREATEIMAGEKHRPROC)
++      eglGetProcAddress("eglCreateImageKHR");
++   if (eglCreateImageKHR_func == NULL) {
++      printf("failed to get eglCreateImageKHR\n");
++      eglTerminate(eman->dpy);
++      free(eman);
++      return NULL;
++   }
++#endif
++
+    return eman;
+ }
+ 
+@@ -850,10 +865,16 @@ main(int argc, char *argv[])
+    case GEARS_PIXMAP:
+    case GEARS_PIXMAP_TEXTURE:
+       ret = egl_manager_create_pixmap(eman, eman->xwin, EGL_TRUE, NULL);
++
++#ifdef EGL_KHR_image
+       if (surface_type == GEARS_PIXMAP_TEXTURE)
+-	 eman->image = eglCreateImageKHR (eman->dpy, eman->ctx,
+-					  EGL_NATIVE_PIXMAP_KHR,
+-					  (EGLClientBuffer) eman->xpix, NULL);
++	 eman->image = eglCreateImageKHR_func(eman->dpy, eman->ctx,
++					      EGL_NATIVE_PIXMAP_KHR,
++					      (EGLClientBuffer) eman->xpix, NULL);
++#else
++      fprintf(stderr, "EGL_KHR_image not found at compile time.\n");
++#endif
++
+       if (ret)
+          ret = eglMakeCurrent(eman->dpy, eman->pix, eman->pix, eman->ctx);
+       break;
+@@ -892,9 +913,13 @@ main(int argc, char *argv[])
+ 				   GL_RENDERBUFFER_EXT,
+ 				   color_rb);
+ 
+-      eman->image = eglCreateImageKHR(eman->dpy, eman->ctx,
+-				      EGL_GL_RENDERBUFFER_KHR,
+-				      (EGLClientBuffer) color_rb, NULL);
++#ifdef EGL_KHR_image
++      eman->image = eglCreateImageKHR_func(eman->dpy, eman->ctx,
++					   EGL_GL_RENDERBUFFER_KHR,
++					   (EGLClientBuffer) color_rb, NULL);
++#else
++      fprintf(stderr, "EGL_KHR_image not found at compile time.\n");
++#endif
+ 
+       glGenRenderbuffers(1, &depth_rb);
+       glBindRenderbuffer(GL_RENDERBUFFER_EXT, depth_rb);
+-- 
+1.7.11.4
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-build-fix.patch b/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-build-fix.patch
new file mode 100644
index 0000000..46a3e98
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-build-fix.patch
@@ -0,0 +1,257 @@
+From ab76f645e29b0a603ff95d88f976bc35ab6301ee Mon Sep 17 00:00:00 2001
+From: Frank Binns <frank.binns@imgtec.com>
+Date: Fri, 29 Jun 2012 11:26:04 +0100
+Subject: [PATCH 1/2] mesa-demos: Fix build when EGL_MESA_screen_surface
+ extension isn't present
+
+The EGL demos won't build against EGL implementations that don't support 
+the EGL_MESA_screen_surface extension. Fix this, in most cases, by 
+wrapping relevant bits of code in #ifdef EGL_MESA_screen_surface.
+
+Signed-off-by: Frank Binns <frank.binns@imgtec.com>
+
+Applied and fixed up in Yocto by...
+
+Integrated-by: Tom Zanussi <tom.zanussi@linux.intel.com>
+
+Upstream-Status: Pending
+
+Index: mesa-demos-8.0.1/src/egl/eglut/eglut.c
+===================================================================
+--- mesa-demos-8.0.1.orig/src/egl/eglut/eglut.c
++++ mesa-demos-8.0.1/src/egl/eglut/eglut.c
+@@ -51,8 +51,9 @@ _eglutNow(void)
+ static void
+ _eglutDestroyWindow(struct eglut_window *win)
+ {
+-   if (_eglut->surface_type != EGL_PBUFFER_BIT &&
+-       _eglut->surface_type != EGL_SCREEN_BIT_MESA)
++
++   if (_eglut->surface_type == EGL_WINDOW_BIT ||
++       _eglut->surface_type == EGL_PIXMAP_BIT)
+       eglDestroySurface(_eglut->dpy, win->surface);
+ 
+    _eglutNativeFiniWindow(win);
+@@ -150,7 +151,9 @@ _eglutCreateWindow(const char *title, in
+             win->config, win->native.u.pixmap, NULL);
+       break;
+    case EGL_PBUFFER_BIT:
++#ifdef EGL_MESA_screen_surface
+    case EGL_SCREEN_BIT_MESA:
++#endif
+       win->surface = win->native.u.surface;
+       break;
+    default:
+@@ -264,8 +267,10 @@ eglutDestroyWindow(int win)
+    if (window->index != win)
+       return;
+ 
++#ifdef EGL_MESA_screen_surface
+    /* XXX it causes some bug in st/egl KMS backend */
+    if ( _eglut->surface_type != EGL_SCREEN_BIT_MESA)
++#endif
+       eglMakeCurrent(_eglut->dpy, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
+ 
+    _eglutDestroyWindow(_eglut->current);
+Index: mesa-demos-8.0.1/src/egl/eglut/eglut_screen.c
+===================================================================
+--- mesa-demos-8.0.1.orig/src/egl/eglut/eglut_screen.c
++++ mesa-demos-8.0.1/src/egl/eglut/eglut_screen.c
+@@ -10,26 +10,33 @@
+ 
+ #define MAX_MODES 100
+ 
++#ifdef EGL_MESA_screen_surface
+ static EGLScreenMESA kms_screen;
+ static EGLModeMESA kms_mode;
+ static EGLint kms_width, kms_height;
++#endif
+ 
+ void
+ _eglutNativeInitDisplay(void)
+ {
++#ifdef EGL_MESA_screen_surface
+    _eglut->native_dpy = EGL_DEFAULT_DISPLAY;
+    _eglut->surface_type = EGL_SCREEN_BIT_MESA;
++#endif
+ }
+ 
+ void
+ _eglutNativeFiniDisplay(void)
+ {
++#ifdef EGL_MESA_screen_surface
+    kms_screen = 0;
+    kms_mode = 0;
+    kms_width = 0;
+    kms_height = 0;
++#endif
+ }
+ 
++#ifdef EGL_MESA_screen_surface
+ static void
+ init_kms(void)
+ {
+@@ -69,19 +76,23 @@ init_kms(void)
+    kms_width = width;
+    kms_height = height;
+ }
++#endif
+ 
+ void
+ _eglutNativeInitWindow(struct eglut_window *win, const char *title,
+                        int x, int y, int w, int h)
+ {
++#ifdef EGL_MESA_screen_surface
+    EGLint surf_attribs[16];
+    EGLint i;
++#endif
+    const char *exts;
+ 
+    exts = eglQueryString(_eglut->dpy, EGL_EXTENSIONS);
+    if (!exts || !strstr(exts, "EGL_MESA_screen_surface"))
+       _eglutFatal("EGL_MESA_screen_surface is not supported\n");
+ 
++#ifdef EGL_MESA_screen_surface
+    init_kms();
+ 
+    i = 0;
+@@ -103,14 +114,17 @@ _eglutNativeInitWindow(struct eglut_wind
+ 
+    win->native.width = kms_width;
+    win->native.height = kms_height;
++#endif
+ }
+ 
+ void
+ _eglutNativeFiniWindow(struct eglut_window *win)
+ {
++#ifdef EGL_MESA_screen_surface
+    eglShowScreenSurfaceMESA(_eglut->dpy,
+          kms_screen, EGL_NO_SURFACE, 0);
+    eglDestroySurface(_eglut->dpy, win->native.u.surface);
++#endif
+ }
+ 
+ void
+Index: mesa-demos-8.0.1/src/egl/opengl/demo1.c
+===================================================================
+--- mesa-demos-8.0.1.orig/src/egl/opengl/demo1.c
++++ mesa-demos-8.0.1/src/egl/opengl/demo1.c
+@@ -18,6 +18,7 @@
+ static void
+ TestScreens(EGLDisplay dpy)
+ {
++#ifdef EGL_MESA_screen_surface
+ #define MAX 8
+    EGLScreenMESA screens[MAX];
+    EGLint numScreens;
+@@ -28,6 +29,7 @@ TestScreens(EGLDisplay dpy)
+    for (i = 0; i < numScreens; i++) {
+       printf(" Screen %d handle: %d\n", i, (int) screens[i]);
+    }
++#endif
+ }
+ 
+ /**
+Index: mesa-demos-8.0.1/src/egl/opengl/demo2.c
+===================================================================
+--- mesa-demos-8.0.1.orig/src/egl/opengl/demo2.c
++++ mesa-demos-8.0.1/src/egl/opengl/demo2.c
+@@ -16,6 +16,7 @@
+ 
+ /*#define FRONTBUFFER*/
+ 
++#ifdef EGL_MESA_screen_surface
+ static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2,
+                           GLfloat r, GLfloat g, GLfloat b)
+ {
+@@ -95,12 +96,13 @@ TestScreens(EGLDisplay dpy)
+       printf(" Screen %d handle: %d\n", i, (int) screens[i]);
+    }
+ }
+-
++#endif
+ 
+ int
+ main(int argc, char *argv[])
+ {
+    int maj, min;
++#ifdef EGL_MESA_screen_surface
+    EGLContext ctx;
+    EGLSurface pbuffer, screen_surf;
+    EGLConfig configs[10];
+@@ -115,6 +117,7 @@ main(int argc, char *argv[])
+    EGLModeMESA mode;
+    EGLScreenMESA screen;
+    EGLint count;
++#endif
+ 
+    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
+    assert(d);
+@@ -132,6 +135,7 @@ main(int argc, char *argv[])
+       exit(1);
+    }
+ 
++#ifdef EGL_MESA_screen_surface
+    eglGetConfigs(d, configs, 10, &numConfigs);
+    printf("Got %d EGL configs:\n", numConfigs);
+    for (i = 0; i < numConfigs; i++) {
+@@ -211,6 +215,7 @@ main(int argc, char *argv[])
+    eglDestroySurface(d, pbuffer);
+    eglDestroyContext(d, ctx);
+    eglTerminate(d);
++#endif
+ 
+    return 0;
+ }
+Index: mesa-demos-8.0.1/src/egl/opengl/demo3.c
+===================================================================
+--- mesa-demos-8.0.1.orig/src/egl/opengl/demo3.c
++++ mesa-demos-8.0.1/src/egl/opengl/demo3.c
+@@ -46,7 +46,7 @@ GLubyte OpenGL_bits[] = {
+    0x3e, 0x00, 0x00, 0xf8, 0x0c, 0x00, 
+ };
+ 
+-
++#ifdef EGL_MESA_screen_surface
+ static void Init(void)
+ {
+ 
+@@ -551,11 +551,13 @@ write_ppm(const char *filename, const GL
+       fclose(f);
+    }
+ }
++#endif
+ 
+ int
+ main(int argc, char *argv[])
+ {
+    int maj, min;
++#ifdef EGL_MESA_screen_surface
+    EGLContext ctx;
+    EGLSurface screen_surf;
+    EGLConfig configs[10];
+@@ -566,6 +568,7 @@ main(int argc, char *argv[])
+    const GLubyte *bitmap;
+    EGLint screenAttribs[32];
+    EGLint i;
++#endif
+ 
+    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
+    assert(d);
+@@ -583,6 +586,7 @@ main(int argc, char *argv[])
+       exit(1);
+    }
+ 
++#ifdef EGL_MESA_screen_surface
+    eglGetConfigs(d, configs, 10, &numConfigs);
+    eglGetScreensMESA(d, &screen, 1, &count);
+    eglGetModesMESA(d, screen, &mode, 1, &count);
+@@ -642,6 +646,7 @@ main(int argc, char *argv[])
+    eglDestroySurface(d, screen_surf);
+    eglDestroyContext(d, ctx);
+    eglTerminate(d);
++#endif
+ 
+    return 0;
+ }
diff --git a/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-query.patch b/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-query.patch
new file mode 100644
index 0000000..7953708
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-query.patch
@@ -0,0 +1,35 @@
+From cf90a5c0c173d017a80cde057da57c365b3b1a40 Mon Sep 17 00:00:00 2001
+From: Frank Binns <frank.binns@imgtec.com>
+Date: Fri, 29 Jun 2012 12:00:26 +0100
+Subject: [PATCH 2/2] mesa-demos: Query display for EGL_MESA_screen_surface
+ extension before using it
+
+This code makes heavy use of the EGL_MESA_screen_surface extension so 
+check the display to determine if it's supported by the underlying EGL 
+implementation. If it doesn't then bail.
+
+Signed-off-by: Frank Binns <frank.binns@imgtec.com>
+
+Applied and fixed up in Yocto by...
+
+Integrated-by: Tom Zanussi <tom.zanussi@linux.intel.com>
+
+Upstream-Status: Pending
+
+Index: mesa-demos-8.0.1/src/egl/opengl/demo1.c
+===================================================================
+--- mesa-demos-8.0.1.orig/src/egl/opengl/demo1.c
++++ mesa-demos-8.0.1/src/egl/opengl/demo1.c
+@@ -110,6 +110,12 @@ main(int argc, char *argv[])
+    printf("EGL version = %d.%d\n", maj, min);
+    printf("EGL_VENDOR = %s\n", eglQueryString(d, EGL_VENDOR));
+ 
++   if (!strstr(eglQueryString(d, EGL_EXTENSIONS),
++               "EGL_MESA_screen_surface")) {
++      printf("EGL_MESA_screen_surface is not supported\n");
++      exit(1);
++   }
++
+    eglGetConfigs(d, NULL, 0, &numConfigs);
+    configs = malloc(sizeof(*configs) *numConfigs);
+    eglGetConfigs(d, configs, numConfigs, &numConfigs);
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb b/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
index 0511734..94db7f7 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
@@ -16,7 +16,11 @@ PR = "r4"
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
 	file://dso_linking_change_build_fix.patch \
 	file://gles2-info.patch \
-        file://glut.patch"
+        file://glut.patch \
+        file://egl-mesa-screen-surface-build-fix.patch \
+        file://egl-mesa-screen-surface-query.patch \
+        file://0001-xeglgears-Make-EGL_KHR_image-usage-portable.patch"
+
 SRC_URI[md5sum] = "320c2a4b6edc6faba35d9cb1e2a30bf4"
 SRC_URI[sha256sum] = "4bc7f2b20d17e3eebfec288f2367a435cd2db71fc5ac9ece2c14827e290d77d1"
 
-- 
1.7.10.4



