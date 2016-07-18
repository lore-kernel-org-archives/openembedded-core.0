Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 88FA8731C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:35:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jul 2016 06:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,384,1464678000"; d="scan'208";a="848345538"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 18 Jul 2016 06:34:40 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 16:34:28 +0300
Message-Id: <a4d5478826261191bb24fa07905565da87bc5830.1468848064.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
References: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468848064.git.jussi.kukkonen@intel.com>
References: <cover.1468848064.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 5/9] weston: Upgrade 1.10.0 -> 1.11.0
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
X-List-Received-Date: Mon, 18 Jul 2016 13:35:18 -0000

Remove now unnecessary patch, rebase others.
Add musl build fix patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...1-configure.ac-Fix-wayland-protocols-path.patch |  4 +-
 .../0001-shared-include-stdint.h-for-int32_t.patch | 28 +++++++++
 ...ch-Provide-a-default-version-that-doesn-t.patch | 68 +++++++++++-----------
 .../make-libwebp-explicitly-configurable.patch     | 37 ------------
 .../wayland/{weston_1.10.0.bb => weston_1.11.0.bb} |  8 +--
 5 files changed, 69 insertions(+), 76 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
 rename meta/recipes-graphics/wayland/{weston_1.10.0.bb => weston_1.11.0.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch b/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
index 7e00038..00118d7 100644
--- a/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
@@ -20,10 +20,10 @@ diff --git a/configure.ac b/configure.ac
 index bc7c329..15a05d3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -184,7 +184,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [libinput >= 0.8.0])
+@@ -187,7 +187,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [libinput >= 0.8.0])
  PKG_CHECK_MODULES(COMPOSITOR, [$COMPOSITOR_MODULES])
  
- PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >= 1.0],
+ PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >= 1.2],
 -		  [ac_wayland_protocols_pkgdatadir=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`])
 +		  [ac_wayland_protocols_pkgdatadir=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`])
  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, $ac_wayland_protocols_pkgdatadir)
diff --git a/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch b/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
new file mode 100644
index 0000000..91ef727
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
@@ -0,0 +1,28 @@
+From ba02b8abe4e2afac2bfbf2559972d5059d75a041 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Sat, 16 Jul 2016 22:50:19 +0300
+Subject: [PATCH weston] shared: include stdint.h for int32_t
+
+This fixes build on musl.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted
+---
+ shared/xalloc.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/shared/xalloc.h b/shared/xalloc.h
+index 85fccb4..484de2d 100644
+--- a/shared/xalloc.h
++++ b/shared/xalloc.h
+@@ -30,6 +30,7 @@
+ extern "C" {
+ #endif
+ 
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index 9a401ee..5542036 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -1,8 +1,8 @@
-From 228349e796e9baa86f2ba8232c730c18ac41283d Mon Sep 17 00:00:00 2001
+From d02226b3d5872b184c1d50c7f4706ac9467ffb81 Mon Sep 17 00:00:00 2001
 From: Tom Hochstein <tom.hochstein@nxp.com>
-Date: Fri, 13 May 2016 09:31:55 -0500
-Subject: [PATCH weston] weston-launch: Provide a default version that doesn't
- require PAM
+Date: Fri, 15 Jul 2016 11:00:15 +0300
+Subject: [PATCH] weston-launch: Provide a default version that doesn't require
+ PAM
 
 weston-launch requires PAM for starting weston as a non-root user.
 
@@ -14,18 +14,17 @@ Upstream-Status: Pending
 
 Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
 ---
- Makefile.am         |  3 ---
- configure.ac        | 12 +++++++-----
+ configure.ac        |  9 +++++++--
  src/weston-launch.c | 20 ++++++++++++++++++++
- 3 files changed, 27 insertions(+), 8 deletions(-)
+ 2 files changed, 27 insertions(+), 2 deletions(-)
 
-Index: weston-1.10.0/configure.ac
-===================================================================
---- weston-1.10.0.orig/configure.ac	2016-05-13 11:02:05.711817559 -0500
-+++ weston-1.10.0/configure.ac	2016-05-13 13:30:28.000000000 -0500
-@@ -445,13 +445,17 @@
- AS_IF([test "x$have_systemd_login_209" = "xyes"],
-       [AC_DEFINE([HAVE_SYSTEMD_LOGIN_209], [1], [Have systemd-login >= 209])])
+diff --git a/configure.ac b/configure.ac
+index 32fdde7..240966f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -416,13 +416,17 @@ AC_ARG_ENABLE(resize-optimization,
+ AS_IF([test "x$enable_resize_optimization" = "xyes"],
+       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
  
 +AC_ARG_WITH(pam,
 +            AS_HELP_STRING([--with-pam], [Use PAM]),
@@ -34,16 +33,16 @@ Index: weston-1.10.0/configure.ac
  AM_CONDITIONAL(BUILD_WESTON_LAUNCH, test x$enable_weston_launch == xyes)
 -if test x$enable_weston_launch == xyes; then
 +if test x$enable_weston_launch = xyes -a x$use_pam = xyes; then
-   AC_CHECK_LIB([pam], [pam_open_session], [have_pam=yes], [have_pam=no])
+   WESTON_SEARCH_LIBS([PAM], [pam], [pam_open_session], [have_pam=yes], [have_pam=no])
    if test x$have_pam == xno; then
 -    AC_ERROR([weston-launch requires pam])
 +    AC_ERROR([PAM support is explicitly requested, but libpam couldn't be found])
    fi
 +  AC_DEFINE([HAVE_PAM], [1], [Define if PAM is available])
-   PAM_LIBS=-lpam
-   AC_SUBST(PAM_LIBS)
  fi
-@@ -667,6 +671,7 @@
+ 
+ AM_CONDITIONAL(HAVE_PANGO, test "x$have_pango" = "xyes")
+@@ -673,6 +677,7 @@ AC_MSG_RESULT([
  	Enable developer documentation	${enable_devdocs}
  
  	weston-launch utility		${enable_weston_launch}
@@ -51,10 +50,10 @@ Index: weston-1.10.0/configure.ac
  	systemd-login support		${have_systemd_login}
  	systemd notify support		${enable_systemd_notify}
  
-Index: weston-1.10.0/src/weston-launch.c
-===================================================================
---- weston-1.10.0.orig/src/weston-launch.c	2016-05-13 11:02:05.779817896 -0500
-+++ weston-1.10.0/src/weston-launch.c	2016-05-13 11:02:05.851818253 -0500
+diff --git a/src/weston-launch.c b/src/weston-launch.c
+index b8b2ba0..a865061 100644
+--- a/src/weston-launch.c
++++ b/src/weston-launch.c
 @@ -51,7 +51,9 @@
  
  #include <pwd.h>
@@ -65,7 +64,7 @@ Index: weston-1.10.0/src/weston-launch.c
  
  #ifdef HAVE_SYSTEMD_LOGIN
  #include <systemd/sd-login.h>
-@@ -93,8 +95,10 @@
+@@ -93,8 +95,10 @@ drmSetMaster(int drm_fd)
  #endif
  
  struct weston_launch {
@@ -76,7 +75,7 @@ Index: weston-1.10.0/src/weston-launch.c
  	int tty;
  	int ttynr;
  	int sock[2];
-@@ -181,6 +185,7 @@
+@@ -181,6 +185,7 @@ weston_launch_allowed(struct weston_launch *wl)
  	return false;
  }
  
@@ -84,7 +83,7 @@ Index: weston-1.10.0/src/weston-launch.c
  static int
  pam_conversation_fn(int msg_count,
  		    const struct pam_message **messages,
-@@ -221,6 +226,7 @@
+@@ -221,6 +226,7 @@ setup_pam(struct weston_launch *wl)
  
  	return 0;
  }
@@ -92,7 +91,7 @@ Index: weston-1.10.0/src/weston-launch.c
  
  static int
  setup_launcher_socket(struct weston_launch *wl)
-@@ -414,6 +420,7 @@
+@@ -414,6 +420,7 @@ quit(struct weston_launch *wl, int status)
  	close(wl->signalfd);
  	close(wl->sock[0]);
  
@@ -100,7 +99,7 @@ Index: weston-1.10.0/src/weston-launch.c
  	if (wl->new_user) {
  		err = pam_close_session(wl->ph, 0);
  		if (err)
-@@ -421,6 +428,7 @@
+@@ -421,6 +428,7 @@ quit(struct weston_launch *wl, int status)
  				err, pam_strerror(wl->ph, err));
  		pam_end(wl->ph, err);
  	}
@@ -108,7 +107,7 @@ Index: weston-1.10.0/src/weston-launch.c
  
  	if (ioctl(wl->tty, KDSKBMUTE, 0) &&
  	    ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
-@@ -600,6 +608,7 @@
+@@ -600,6 +608,7 @@ setup_session(struct weston_launch *wl)
  	setenv("HOME", wl->pw->pw_dir, 1);
  	setenv("SHELL", wl->pw->pw_shell, 1);
  
@@ -116,7 +115,7 @@ Index: weston-1.10.0/src/weston-launch.c
  	env = pam_getenvlist(wl->ph);
  	if (env) {
  		for (i = 0; env[i]; ++i) {
-@@ -608,6 +617,7 @@
+@@ -608,6 +617,7 @@ setup_session(struct weston_launch *wl)
  		}
  		free(env);
  	}
@@ -124,7 +123,7 @@ Index: weston-1.10.0/src/weston-launch.c
  }
  
  static void
-@@ -665,7 +675,9 @@
+@@ -665,7 +675,9 @@ static void
  help(const char *name)
  {
  	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
@@ -134,7 +133,7 @@ Index: weston-1.10.0/src/weston-launch.c
  	fprintf(stderr, "  -t, --tty       Start session on alternative tty\n");
  	fprintf(stderr, "  -v, --verbose   Be verbose\n");
  	fprintf(stderr, "  -h, --help      Display this help message\n");
-@@ -678,7 +690,9 @@
+@@ -678,7 +690,9 @@ main(int argc, char *argv[])
  	int i, c;
  	char *tty = NULL;
  	struct option opts[] = {
@@ -144,7 +143,7 @@ Index: weston-1.10.0/src/weston-launch.c
  		{ "tty",     required_argument, NULL, 't' },
  		{ "verbose", no_argument,       NULL, 'v' },
  		{ "help",    no_argument,       NULL, 'h' },
-@@ -690,9 +704,13 @@
+@@ -690,9 +704,13 @@ main(int argc, char *argv[])
  	while ((c = getopt_long(argc, argv, "u:t::vh", opts, &i)) != -1) {
  		switch (c) {
  		case 'u':
@@ -158,7 +157,7 @@ Index: weston-1.10.0/src/weston-launch.c
  			break;
  		case 't':
  			tty = optarg;
-@@ -730,8 +748,10 @@
+@@ -730,8 +748,10 @@ main(int argc, char *argv[])
  	if (setup_tty(&wl, tty) < 0)
  		exit(EXIT_FAILURE);
  
@@ -169,3 +168,6 @@ Index: weston-1.10.0/src/weston-launch.c
  
  	if (setup_launcher_socket(&wl) < 0)
  		exit(EXIT_FAILURE);
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch b/meta/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
deleted file mode 100644
index ad07d4f..0000000
--- a/meta/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-
-The libwebp package is outside of openembedded-core, so make it
-explicitly configurable. Make it deterministic, so that if libwebp 
-dependencies are missing, autoconf throws a fatal error.
-
-Upstream-Status: Pending
-
-Index: weston-1.5.0/configure.ac
-===================================================================
---- weston-1.5.0.orig/configure.ac
-+++ weston-1.5.0/configure.ac
-@@ -268,9 +268,22 @@ fi
- 
- PKG_CHECK_MODULES(PIXMAN, [pixman-1])
- PKG_CHECK_MODULES(PNG, [libpng])
--PKG_CHECK_MODULES(WEBP, [libwebp], [have_webp=yes], [have_webp=no])
--AS_IF([test "x$have_webp" = "xyes"],
--      [AC_DEFINE([HAVE_WEBP], [1], [Have webp])])
-+AC_ARG_ENABLE(webp,
-+              AS_HELP_STRING([--disable-webp],
-+                             [Disable libwebp support]),,
-+              enable_webp=auto)
-+AM_CONDITIONAL(HAVE_WEBP, [test "x$enable_webp" = xyes])
-+AS_IF([test "x$enable_webp" != "xno"],
-+    PKG_CHECK_MODULES(WEBP,
-+                     [libwebp],
-+                     [have_webp=yes],
-+                     [have_webp=no])
-+    AS_IF([test "x$have_webp" = "xno" -a "x$enable_webp" = "xyes"],
-+        AC_MSG_ERROR([libwebp support explicitly request, but lipwebp could not be found]))
-+    AS_IF([test "x$have_webp" = "xyes"],
-+        [enable_webp=yes]
-+        [AC_DEFINE([HAVE_WEBP], [1], [Have webp])])
-+)
- 
- AC_ARG_ENABLE(vaapi-recorder, [  --enable-vaapi-recorder],,
- 	      enable_vaapi_recorder=auto)
diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.11.0.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/weston_1.10.0.bb
rename to meta/recipes-graphics/wayland/weston_1.11.0.bb
index 6b934e2..3ad309d 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.11.0.bb
@@ -8,15 +8,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
-           file://make-libwebp-explicitly-configurable.patch \
            file://0001-make-error-portable.patch \
            file://0001-configure.ac-Fix-wayland-protocols-path.patch \
+           file://0001-shared-include-stdint.h-for-int32_t.patch \
            file://xwayland.weston-start \
            file://make-weston-launch-exit-for-unrecognized-option.patch \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
-SRC_URI[md5sum] = "1cd17c54ecac6d9a3cd90bf12eaa3e20"
-SRC_URI[sha256sum] = "e0b2004d00d8293ddf7903ca283c1746afa9ccb5919ab50fd04397ff472aa5c1"
+SRC_URI[md5sum] = "bc6f90a2039163804aecfa663b69c4c2"
+SRC_URI[sha256sum] = "05e086e9f186a06843b9f7a5e1abf19347b1a6e4be26d7e74927abc17b6b7125"
 
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
@@ -68,7 +68,7 @@ PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
 # Weston with lcms support
 PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
 # Weston with webp support
-PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
+PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
 # Weston with unwinding support
 PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 # Weston with systemd-login support
-- 
2.1.4


