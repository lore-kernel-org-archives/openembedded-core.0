Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A8026607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 12:42:49 +0000 (UTC)
Received: by wghq2 with SMTP id q2so84364529wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=3asYKgGLk3EJGmHo6hMrF+urH8+FaaDKPoEIGGIwvaQ=;
	b=eBwrU/p8ccdVGn2t7ONTr/hzMT0A7XHNV84jS700lJrVxsPrhyr4kFGMHdDByzAfO1
	eg5keDmqp90Rgh2W0uxmK9UyB4TJjkiqy9jdLVqZABum+ZNcimsDKykf8QZZkMkenLPK
	FeOKUHGXLdYanrb6O+OjZJ+NNaM2uMUFg/8n1o8m04ts2CHpbdWHVMJvn1eD+m4fh5lf
	porwSVsXCsWRDTSlA7ykEfPXZjGvQ52nvJ372QqnomnCtkFAz0UfuhKc59Hzkc2uFzFf
	KKYL597GmpiMUusa6qObByYcXaFsc6Z7Sw304/BVzGH06L9ptYtn265DbdokiPchAXL+
	mqwA==
X-Received: by 10.180.104.197 with SMTP id gg5mr52305855wib.27.1432212169819; 
	Thu, 21 May 2015 05:42:49 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id n8sm2469028wiy.19.2015.05.21.05.42.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 May 2015 05:42:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 14:42:16 +0200
Message-Id: <1432212136-26396-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] libepoxy: make buildable for x11-less environments / update to latest version
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
X-List-Received-Date: Thu, 21 May 2015 12:42:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Make glx part configurable by PACKAGECONFIG enabled by 'x11' distro feature
* Major upstream enhancement is using pkgconfig for egl. This should make
  those egl implementations happy that require compiler extra options for their
  egl headers.
  Example: meta-fsl-arm/imx-gpu-viv sets -DLINUX (and others) in egl.pc. These
  are mandatory for proper builds.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-platforms-based-on-configuration-results.patch | 128 +++++++++++++++++++++
 ...0002-add-an-option-to-disable-glx-support.patch |  42 +++++++
 .../libepoxy/{libepoxy_1.2.bb => libepoxy_git.bb}  |  17 ++-
 3 files changed, 181 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.2.bb => libepoxy_git.bb} (33%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch b/meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch
new file mode 100644
index 0000000..674c8e8
--- /dev/null
+++ b/meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch
@@ -0,0 +1,128 @@
+From 3a93150bc0aec86afdb7d053247dc2448925e09a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 6 May 2015 10:45:22 +0200
+Subject: [PATCH 1/2] select platforms based on configuration results
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/anholt/libepoxy/pull/52
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac          | 13 +++++--------
+ src/dispatch_common.c |  9 ++++++---
+ src/dispatch_common.h |  9 +++++----
+ 3 files changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a52fc58..bdd70da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -58,6 +58,10 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
+ # uintptr_t to a void *") by default.  Kill that.
+ XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
+ 
++PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
++
++AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
++
+ has_znow=yes
+ 
+ case $host_os in
+@@ -86,7 +90,7 @@ case $host_os in
+         ;;
+     *)
+         build_egl=yes
+-        build_glx=yes
++        build_glx=$x11
+         build_wgl=no
+         # On platforms with dlopen, we load everything dynamically and
+         # don't link against a specific window system or GL implementation.
+@@ -144,13 +148,6 @@ esac
+ 
+ AC_SUBST([VISIBILITY_CFLAGS])
+ 
+-PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
+-if test x$x11 = xno -a x$build_glx = xyes; then
+-    AC_MSG_ERROR([libX11 headers (libx11-dev) required to build with GLX support])
+-fi
+-
+-AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
+-
+ PKG_CHECK_MODULES(GL, [gl], [gl=yes], [gl=no])
+ 
+ AC_CONFIG_FILES([
+diff --git a/src/dispatch_common.c b/src/dispatch_common.c
+index 4e34d6e..2ab84ed 100644
+--- a/src/dispatch_common.c
++++ b/src/dispatch_common.c
+@@ -615,10 +615,13 @@ epoxy_get_proc_address(const char *name)
+ #elif defined(__APPLE__)
+     return epoxy_gl_dlsym(name);
+ #else
++#if PLATFORM_HAS_GLX
+     if (epoxy_current_context_is_glx()) {
+         return glXGetProcAddressARB((const GLubyte *)name);
+-    } else {
++    } else
++#endif /* PLATFORM_HAS_GLX */
+ #if PLATFORM_HAS_EGL
++    {
+         GLenum egl_api = epoxy_egl_get_current_gl_context_api();
+ 
+         switch (egl_api) {
+@@ -628,10 +631,10 @@ epoxy_get_proc_address(const char *name)
+         case EGL_NONE:
+             break;
+         }
+-#endif
+     }
++#endif /* PLATFORM_HAS_EGL */
+     errx(1, "Couldn't find current GLX or EGL context.\n");
+-#endif
++#endif /* _WIN32 | __APPLE__*/
+ }
+ 
+ void
+diff --git a/src/dispatch_common.h b/src/dispatch_common.h
+index 6b8503a..82681e4 100644
+--- a/src/dispatch_common.h
++++ b/src/dispatch_common.h
+@@ -21,12 +21,13 @@
+  * IN THE SOFTWARE.
+  */
+ 
++#include <config.h>
+ #include <stdbool.h>
+ 
+ #ifdef _WIN32
+ #define PLATFORM_HAS_EGL 0
+ #define PLATFORM_HAS_GLX 0
+-#define PLATFORM_HAS_WGL 1
++#define PLATFORM_HAS_WGL BUILD_WGL
+ #define EPOXY_IMPORTEXPORT __declspec(dllexport)
+ #elif defined(__APPLE__)
+ #define PLATFORM_HAS_EGL 0
+@@ -34,13 +35,13 @@
+ #define PLATFORM_HAS_WGL 0
+ #define EPOXY_IMPORTEXPORT
+ #elif defined(ANDROID)
+-#define PLATFORM_HAS_EGL 1
++#define PLATFORM_HAS_EGL BUILD_EGL
+ #define PLATFORM_HAS_GLX 0
+ #define PLATFORM_HAS_WGL 0
+ #define EPOXY_IMPORTEXPORT
+ #else
+-#define PLATFORM_HAS_EGL 1
+-#define PLATFORM_HAS_GLX 1
++#define PLATFORM_HAS_EGL BUILD_EGL
++#define PLATFORM_HAS_GLX BUILD_GLX
+ #define PLATFORM_HAS_WGL 0
+ #define EPOXY_IMPORTEXPORT
+ #endif
+-- 
+1.9.3
+
diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch b/meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch
new file mode 100644
index 0000000..262d684
--- /dev/null
+++ b/meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch
@@ -0,0 +1,42 @@
+From 24868cbfb9dda5f6929dd277c47d35df016e8754 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 6 May 2015 11:05:48 +0200
+Subject: [PATCH 2/2] add an option to disable glx support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+this option would help us in yocto to get deterministic build results
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/anholt/libepoxy/pull/52
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index bdd70da..6c7153d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -58,7 +58,14 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
+ # uintptr_t to a void *") by default.  Kill that.
+ XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
+ 
+-PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
++AC_ARG_ENABLE([glx],
++                [AS_HELP_STRING([--disable-glx],
++				[disable if you don't want x11/glx support])],
++                [],
++                [enable_glx=yes]
++             )
++
++PKG_CHECK_MODULES(X11, [x11], [x11=$enable_glx], [x11=no])
+ 
+ AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
+ 
+-- 
+1.9.3
+
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
similarity index 33%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_git.bb
index 1934fae..9816257 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
@@ -6,14 +6,19 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 
-SRC_URI = "git://github.com/anholt/libepoxy.git"
-SRCREV="7422de5b4be7b19d789136b3bb5f932de42db27c"
+SRC_URI = " \
+    git://github.com/anholt/libepoxy.git \
+    file://0001-select-platforms-based-on-configuration-results.patch \
+    file://0002-add-an-option-to-disable-glx-support.patch \
+"
+SRCREV="20062c25e7612cab023cdef44d3277ba1bd0b2de"
+PV = "1.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig distro_features_check
+inherit autotools pkgconfig
 
-# The virtual/libx11 requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
+DEPENDS = "util-macros virtual/egl"
 
-DEPENDS = "util-macros virtual/egl virtual/libx11"
+PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-- 
1.9.3


