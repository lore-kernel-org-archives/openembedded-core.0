Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7fK-0007V8-FJ
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916473"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:37:08 -0700
Message-Id: <9d006ef0b313473e7293659501b44ed32b5d239f.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 15/18] mesa-demos: Update to 8.1.0
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
X-List-Received-Date: Wed, 24 Apr 2013 21:56:15 -0000

Removed patches that now appear in the upstream.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...glgears-Make-EGL_KHR_image-usage-portable.patch | 95 ----------------------
 .../mesa-demos/dso_linking_change_build_fix.patch  | 24 ------
 .../mesa/mesa-demos/gles2-info.patch               | 21 -----
 .../{mesa-demos_8.0.1.bb => mesa-demos_8.1.0.bb}   | 11 +--
 4 files changed, 3 insertions(+), 148 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0001-xeglgears-Make-EGL_KHR_image-usage-portable.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
 rename meta/recipes-graphics/mesa/{mesa-demos_8.0.1.bb => mesa-demos_8.1.0.bb} (69%)

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0001-xeglgears-Make-EGL_KHR_image-usage-portable.patch b/meta/recipes-graphics/mesa/mesa-demos/0001-xeglgears-Make-EGL_KHR_image-usage-portable.patch
deleted file mode 100644
index 43d4fb1..0000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0001-xeglgears-Make-EGL_KHR_image-usage-portable.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 43c2122af1caa750531f29bf734c03d1f50801d1 Mon Sep 17 00:00:00 2001
-Message-Id: <43c2122af1caa750531f29bf734c03d1f50801d1.1365283761.git.tom.zanussi@linux.intel.com>
-From: Frank Binns <frank.binns@imgtec.com>
-Date: Fri, 29 Jun 2012 14:06:27 +0100
-Subject: [PATCH] xeglgears: Make EGL_KHR_image usage portable
-
-EGL extension functions don't have to be exported which means
-xeglgears was failing to link against implementations that
-support EGL_KHR_image but were not exporting its related functions.
-
-This has been fixed by using eglGetProcAddress to get a function
-pointer instead of using the functions prototype. This is portable.
-
-Signed-off-by: Frank Binns <frank.binns@imgtec.com>
-
-Integrated-by: Tom Zanussi <tom.zanussi@linux.intel.com>
-
-Upstream-Status: Backport
----
- src/egl/opengl/xeglgears.c | 37 +++++++++++++++++++++++++++++++------
- 1 file changed, 31 insertions(+), 6 deletions(-)
-
-diff --git a/src/egl/opengl/xeglgears.c b/src/egl/opengl/xeglgears.c
-index 513c587..866b89a 100644
---- a/src/egl/opengl/xeglgears.c
-+++ b/src/egl/opengl/xeglgears.c
-@@ -51,6 +51,10 @@
- static PFNGLEGLIMAGETARGETTEXTURE2DOESPROC glEGLImageTargetTexture2DOES_func;
- #endif
- 
-+#ifdef EGL_KHR_image
-+static PFNEGLCREATEIMAGEKHRPROC eglCreateImageKHR_func;
-+#endif
-+
- 
- #define BENCHMARK
- 
-@@ -405,6 +409,17 @@ egl_manager_new(EGLNativeDisplayType xdpy, const EGLint *attrib_list,
-       eglGetProcAddress("glEGLImageTargetTexture2DOES");
- #endif
- 
-+#ifdef EGL_KHR_image
-+   eglCreateImageKHR_func = (PFNEGLCREATEIMAGEKHRPROC)
-+      eglGetProcAddress("eglCreateImageKHR");
-+   if (eglCreateImageKHR_func == NULL) {
-+      printf("failed to get eglCreateImageKHR\n");
-+      eglTerminate(eman->dpy);
-+      free(eman);
-+      return NULL;
-+   }
-+#endif
-+
-    return eman;
- }
- 
-@@ -850,10 +865,16 @@ main(int argc, char *argv[])
-    case GEARS_PIXMAP:
-    case GEARS_PIXMAP_TEXTURE:
-       ret = egl_manager_create_pixmap(eman, eman->xwin, EGL_TRUE, NULL);
-+
-+#ifdef EGL_KHR_image
-       if (surface_type == GEARS_PIXMAP_TEXTURE)
--	 eman->image = eglCreateImageKHR (eman->dpy, eman->ctx,
--					  EGL_NATIVE_PIXMAP_KHR,
--					  (EGLClientBuffer) eman->xpix, NULL);
-+	 eman->image = eglCreateImageKHR_func(eman->dpy, eman->ctx,
-+					      EGL_NATIVE_PIXMAP_KHR,
-+					      (EGLClientBuffer) eman->xpix, NULL);
-+#else
-+      fprintf(stderr, "EGL_KHR_image not found at compile time.\n");
-+#endif
-+
-       if (ret)
-          ret = eglMakeCurrent(eman->dpy, eman->pix, eman->pix, eman->ctx);
-       break;
-@@ -892,9 +913,13 @@ main(int argc, char *argv[])
- 				   GL_RENDERBUFFER_EXT,
- 				   color_rb);
- 
--      eman->image = eglCreateImageKHR(eman->dpy, eman->ctx,
--				      EGL_GL_RENDERBUFFER_KHR,
--				      (EGLClientBuffer) color_rb, NULL);
-+#ifdef EGL_KHR_image
-+      eman->image = eglCreateImageKHR_func(eman->dpy, eman->ctx,
-+					   EGL_GL_RENDERBUFFER_KHR,
-+					   (EGLClientBuffer) color_rb, NULL);
-+#else
-+      fprintf(stderr, "EGL_KHR_image not found at compile time.\n");
-+#endif
- 
-       glGenRenderbuffers(1, &depth_rb);
-       glBindRenderbuffer(GL_RENDERBUFFER_EXT, depth_rb);
--- 
-1.7.11.4
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos/dso_linking_change_build_fix.patch b/meta/recipes-graphics/mesa/mesa-demos/dso_linking_change_build_fix.patch
deleted file mode 100644
index 9b5e952..0000000
--- a/meta/recipes-graphics/mesa/mesa-demos/dso_linking_change_build_fix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-after gcc linking has changed, all the libraries must be explicitely specified 
-This patch avoids these linking errors:
-
-|   CCLD   xeglgears
-| /build_disk/poky_build/build0/tmp/sysroots/x86_64-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.5.1/ld: xeglthreads.o: undefined reference to symbol 'pthread_join@@GLIBC_2.4'
-| /build_disk/poky_build/build0/tmp/sysroots/x86_64-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.5.1/ld: note: 'pthread_join@@GLIBC_2.4' is defined in DSO /build_disk/poky_build/build0/tmp/sysroots/qemuarm/lib/libpthread.so.0 so try adding it to the linker command line
-| /build_disk/poky_build/build0/tmp/sysroots/qemuarm/lib/libpthread.so.0: could not read symbols: Invalid operation
-| collect2: ld returned 1 exit status
-
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/02/03
-
-Upstream-Status: Pending
-
-Index: mesa-demos-8.0.1/src/egl/opengl/Makefile.am
-===================================================================
---- mesa-demos-8.0.1.orig/src/egl/opengl/Makefile.am	2010-07-07 10:57:15.000000000 -0700
-+++ mesa-demos-8.0.1/src/egl/opengl/Makefile.am	2011-02-03 14:30:13.928486381 -0800
-@@ -67,3 +67,4 @@
- 
- eglgears_x11_LDADD = ../eglut/libeglut_x11.la
- egltri_x11_LDADD = ../eglut/libeglut_x11.la
-+xeglthreads_LDADD = -lpthread
diff --git a/meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch b/meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
deleted file mode 100644
index 849c974..0000000
--- a/meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Fix to enable gles2 to build.
-
-Ross Burton <ross.burton@intel.com>
-
-Upstream-Status: Pending
-
-Index: mesa-demos-8.0.1/src/egl/opengles2/es2_info.c
-===================================================================
---- mesa-demos-8.0.1.orig/src/egl/opengles2/es2_info.c	2010-07-07 18:57:15.000000000 +0100
-+++ mesa-demos-8.0.1/src/egl/opengles2/es2_info.c	2012-08-01 13:14:59.000104115 +0100
-@@ -18,8 +18,8 @@
- #include <X11/Xlib.h>
- #include <X11/Xutil.h>
- #include <X11/keysym.h>
--#include <GLES/gl.h>
--#include <GLES/glext.h>
-+#include <GLES2/gl2.h>
-+#include <GLES2/gl2ext.h>
- #include <EGL/egl.h>
- 
- 
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
similarity index 69%
rename from meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
index 94db7f7..055f73d 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
@@ -11,18 +11,13 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=9142
 
 DEPENDS = "virtual/libx11 virtual/libgl glew"
 
-PR = "r4"
-
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
-	file://dso_linking_change_build_fix.patch \
-	file://gles2-info.patch \
         file://glut.patch \
         file://egl-mesa-screen-surface-build-fix.patch \
-        file://egl-mesa-screen-surface-query.patch \
-        file://0001-xeglgears-Make-EGL_KHR_image-usage-portable.patch"
+        file://egl-mesa-screen-surface-query.patch"
 
-SRC_URI[md5sum] = "320c2a4b6edc6faba35d9cb1e2a30bf4"
-SRC_URI[sha256sum] = "4bc7f2b20d17e3eebfec288f2367a435cd2db71fc5ac9ece2c14827e290d77d1"
+SRC_URI[md5sum] = "9df33ba69a26bbfbc7c8148602e59542"
+SRC_URI[sha256sum] = "9703fa0646b32a1e68d2abf5628f936f77bf97c69ffcaac90de380820a87a828"
 
 inherit autotools pkgconfig
 
-- 
1.8.0.2



