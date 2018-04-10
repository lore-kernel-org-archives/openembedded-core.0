Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id BCDE1747CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 41B3F20BB8;
	Tue, 10 Apr 2018 19:06:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id i2B92q_V8U_r; Tue, 10 Apr 2018 19:06:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0BD2620B53;
	Tue, 10 Apr 2018 19:06:20 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8A17616342E;
	Tue, 10 Apr 2018 15:06:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 15:06:10 -0400
Message-Id: <1523387170-30191-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523387170-30191-1-git-send-email-denis@denix.org>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] weston: upgrade to 4.0.0
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
X-List-Received-Date: Tue, 10 Apr 2018 19:06:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Denys Dmytriyenko <denys@ti.com>

Official announcement:
https://lists.freedesktop.org/archives/wayland-devel/2018-April/037768.html

Dropped previously backported fix-missing-header.patch and
weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch

Refresh remaining local patches.

Modify 0001-weston-launch-Provide-a-default-version-that-doesn-t.patch with
changes to apply against the new code base.

Support for libunwind was dropped in bb707dc0fe331c9af112a0552b7aa6fde755dd83:
https://cgit.freedesktop.org/wayland/weston/commit/?id=bb707dc0fe331c9af112a0552b7aa6fde755dd83

Extract major version for referring to libweston-4 helper libraries.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/weston/0001-make-error-portable.patch  | 42 ++++++++---------
 ...ch-Provide-a-default-version-that-doesn-t.patch | 47 +++++++++---------
 .../wayland/weston/fix-missing-header.patch        | 30 ------------
 ...t-pitch-correctly-for-subsampled-textures.patch | 55 ----------------------
 .../wayland/{weston_3.0.0.bb => weston_4.0.0.bb}   | 20 ++++----
 5 files changed, 54 insertions(+), 140 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/fix-missing-header.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
 rename meta/recipes-graphics/wayland/{weston_3.0.0.bb => weston_4.0.0.bb} (87%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
index 0671a45..6799254 100644
--- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
@@ -1,26 +1,25 @@
-From c22e90365d89346258394833cbcad03ff32b2e27 Mon Sep 17 00:00:00 2001
+From ad1d2161c811cff25d1684c33611f300adb753bc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 May 2015 20:56:00 -0700
-Subject: [PATCH weston] make error() portable
+Subject: [PATCH] make error() portable
 
 error() is not posix but gnu extension so may not be available on all
 kind of systemsi e.g. musl.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
 
- configure.ac              |    2 ++
- libweston/weston-error.h  |   20 ++++++++++++++++++++
- libweston/weston-launch.c |    2 +-
+---
+ configure.ac              |  2 ++
+ libweston/weston-error.h  | 20 ++++++++++++++++++++
+ libweston/weston-launch.c |  2 +-
  3 files changed, 23 insertions(+), 1 deletion(-)
- create mode 100644 src/weston-error.h
+ create mode 100644 libweston/weston-error.h
 
-Index: weston-3.0.0/configure.ac
-===================================================================
---- weston-3.0.0.orig/configure.ac
-+++ weston-3.0.0/configure.ac
-@@ -103,6 +103,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+diff --git a/configure.ac b/configure.ac
+index 7aebbdb..dc9c802 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -109,6 +109,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
  	      [[#include <time.h>]])
  AC_CHECK_HEADERS([execinfo.h])
  
@@ -29,10 +28,11 @@ Index: weston-3.0.0/configure.ac
  AC_CHECK_FUNCS([mkostemp strchrnul initgroups posix_fallocate])
  
  # check for libdrm as a build-time dependency only
-Index: weston-3.0.0/libweston/weston-error.h
-===================================================================
+diff --git a/libweston/weston-error.h b/libweston/weston-error.h
+new file mode 100644
+index 0000000..2089d02
 --- /dev/null
-+++ weston-3.0.0/libweston/weston-error.h
++++ b/libweston/weston-error.h
 @@ -0,0 +1,20 @@
 +#ifndef _WESTON_ERROR_H
 +#define _WESTON_ERROR_H
@@ -54,10 +54,10 @@ Index: weston-3.0.0/libweston/weston-error.h
 +
 +#endif
 +
-Index: weston-3.0.0/libweston/weston-launch.c
-===================================================================
---- weston-3.0.0.orig/libweston/weston-launch.c
-+++ weston-3.0.0/libweston/weston-launch.c
+diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
+index 1adcf21..166bf3b 100644
+--- a/libweston/weston-launch.c
++++ b/libweston/weston-launch.c
 @@ -33,7 +33,6 @@
  #include <poll.h>
  #include <errno.h>
@@ -66,7 +66,7 @@ Index: weston-3.0.0/libweston/weston-launch.c
  #include <getopt.h>
  
  #include <sys/types.h>
-@@ -60,6 +59,7 @@
+@@ -59,6 +58,7 @@
  #endif
  
  #include "weston-launch.h"
diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index 70b9888..52eac61 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -1,7 +1,8 @@
-From 8ff6ed03ec4079f32e9b34085414e57be4730e04 Mon Sep 17 00:00:00 2001
+From b98b9dbda902225cdd972b5bff6a641c36cc7e90 Mon Sep 17 00:00:00 2001
 From: Tom Hochstein <tom.hochstein@nxp.com>
 Date: Wed, 22 Feb 2017 15:53:30 +0200
 Subject: [PATCH] weston-launch: Provide a default version that doesn't require
+
  PAM
 
 weston-launch requires PAM for starting weston as a non-root user.
@@ -14,16 +15,18 @@ Upstream-Status: Pending
 
 Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+
 ---
  configure.ac              |  9 +++++++--
  libweston/weston-launch.c | 20 ++++++++++++++++++++
  2 files changed, 27 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 46cb2c7..bb45f46 100644
+index dc9c802..48cf5cb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -435,13 +435,17 @@ AC_ARG_ENABLE(resize-optimization,
+@@ -451,13 +451,17 @@ AC_ARG_ENABLE(resize-optimization,
  AS_IF([test "x$enable_resize_optimization" = "xyes"],
        [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
  
@@ -43,7 +46,7 @@ index 46cb2c7..bb45f46 100644
  fi
  
  AM_CONDITIONAL(HAVE_PANGO, test "x$have_pango" = "xyes")
-@@ -701,6 +705,7 @@ AC_MSG_RESULT([
+@@ -702,6 +706,7 @@ AC_MSG_RESULT([
  	Enable developer documentation	${enable_devdocs}
  
  	weston-launch utility		${enable_weston_launch}
@@ -52,7 +55,7 @@ index 46cb2c7..bb45f46 100644
  	systemd notify support		${enable_systemd_notify}
  
 diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
-index 0491896..07e7469 100644
+index 166bf3b..6fb9232 100644
 --- a/libweston/weston-launch.c
 +++ b/libweston/weston-launch.c
 @@ -51,7 +51,9 @@
@@ -65,7 +68,7 @@ index 0491896..07e7469 100644
  
  #ifdef HAVE_SYSTEMD_LOGIN
  #include <systemd/sd-login.h>
-@@ -93,8 +95,10 @@ drmSetMaster(int drm_fd)
+@@ -101,8 +103,10 @@ drmSetMaster(int drm_fd)
  #endif
  
  struct weston_launch {
@@ -76,7 +79,7 @@ index 0491896..07e7469 100644
  	int tty;
  	int ttynr;
  	int sock[2];
-@@ -181,6 +185,7 @@ weston_launch_allowed(struct weston_launch *wl)
+@@ -189,6 +193,7 @@ weston_launch_allowed(struct weston_launch *wl)
  	return false;
  }
  
@@ -84,7 +87,7 @@ index 0491896..07e7469 100644
  static int
  pam_conversation_fn(int msg_count,
  		    const struct pam_message **messages,
-@@ -221,6 +226,7 @@ setup_pam(struct weston_launch *wl)
+@@ -229,6 +234,7 @@ setup_pam(struct weston_launch *wl)
  
  	return 0;
  }
@@ -92,7 +95,7 @@ index 0491896..07e7469 100644
  
  static int
  setup_launcher_socket(struct weston_launch *wl)
-@@ -414,6 +420,7 @@ quit(struct weston_launch *wl, int status)
+@@ -422,6 +428,7 @@ quit(struct weston_launch *wl, int status)
  	close(wl->signalfd);
  	close(wl->sock[0]);
  
@@ -100,7 +103,7 @@ index 0491896..07e7469 100644
  	if (wl->new_user) {
  		err = pam_close_session(wl->ph, 0);
  		if (err)
-@@ -421,6 +428,7 @@ quit(struct weston_launch *wl, int status)
+@@ -429,6 +436,7 @@ quit(struct weston_launch *wl, int status)
  				err, pam_strerror(wl->ph, err));
  		pam_end(wl->ph, err);
  	}
@@ -108,7 +111,7 @@ index 0491896..07e7469 100644
  
  	if (ioctl(wl->tty, KDSKBMUTE, 0) &&
  	    ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
-@@ -600,6 +608,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+@@ -608,6 +616,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  	setenv("HOME", wl->pw->pw_dir, 1);
  	setenv("SHELL", wl->pw->pw_shell, 1);
  
@@ -116,7 +119,7 @@ index 0491896..07e7469 100644
  	env = pam_getenvlist(wl->ph);
  	if (env) {
  		for (i = 0; env[i]; ++i) {
-@@ -608,6 +617,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+@@ -616,6 +625,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  		}
  		free(env);
  	}
@@ -124,17 +127,18 @@ index 0491896..07e7469 100644
  
  	/*
  	 * We open a new session, so it makes sense
-@@ -675,7 +685,9 @@ static void
+@@ -683,8 +693,10 @@ static void
  help(const char *name)
  {
  	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
 +#ifdef HAVE_PAM
- 	fprintf(stderr, "  -u, --user      Start session as specified username\n");
+ 	fprintf(stderr, "  -u, --user      Start session as specified username,\n"
+ 			"                  e.g. -u joe, requires root.\n");
 +#endif
- 	fprintf(stderr, "  -t, --tty       Start session on alternative tty\n");
+ 	fprintf(stderr, "  -t, --tty       Start session on alternative tty,\n"
+ 			"                  e.g. -t /dev/tty4, requires -u option.\n");
  	fprintf(stderr, "  -v, --verbose   Be verbose\n");
- 	fprintf(stderr, "  -h, --help      Display this help message\n");
-@@ -688,7 +700,9 @@ main(int argc, char *argv[])
+@@ -698,7 +710,9 @@ main(int argc, char *argv[])
  	int i, c;
  	char *tty = NULL;
  	struct option opts[] = {
@@ -144,8 +148,8 @@ index 0491896..07e7469 100644
  		{ "tty",     required_argument, NULL, 't' },
  		{ "verbose", no_argument,       NULL, 'v' },
  		{ "help",    no_argument,       NULL, 'h' },
-@@ -700,9 +714,13 @@ main(int argc, char *argv[])
- 	while ((c = getopt_long(argc, argv, "u:t::vh", opts, &i)) != -1) {
+@@ -710,9 +724,13 @@ main(int argc, char *argv[])
+ 	while ((c = getopt_long(argc, argv, "u:t:vh", opts, &i)) != -1) {
  		switch (c) {
  		case 'u':
 +#ifdef HAVE_PAM
@@ -158,7 +162,7 @@ index 0491896..07e7469 100644
  			break;
  		case 't':
  			tty = optarg;
-@@ -740,8 +758,10 @@ main(int argc, char *argv[])
+@@ -753,8 +771,10 @@ main(int argc, char *argv[])
  	if (setup_tty(&wl, tty) < 0)
  		exit(EXIT_FAILURE);
  
@@ -169,6 +173,3 @@ index 0491896..07e7469 100644
  
  	if (setup_launcher_socket(&wl) < 0)
  		exit(EXIT_FAILURE);
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/wayland/weston/fix-missing-header.patch b/meta/recipes-graphics/wayland/weston/fix-missing-header.patch
deleted file mode 100644
index 55c0d4f..0000000
--- a/meta/recipes-graphics/wayland/weston/fix-missing-header.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-On the musl C library, tests/timespec-text.c does not build, with the
-following error:
-
-    In file included from tests/timespec-test.c:36:0:
-    ./shared/timespec-util.h:41:21: warning: ‘struct timespec’ declared
-    inside parameter list will not be visible outside of this definition
-    or declaration
-     timespec_sub(struct timespec *r,
-                         ^~~~~~~~
-   [...]
-
-Indeed, struct timespec is defined in time.h, so we must include it.
-
-Upstream-Status: Backport [fa41bdfbc0b962fd73b89f01aab1a5370c9c28eb]
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
-
-Index: weston-3.0.0/shared/timespec-util.h
-===================================================================
---- weston-3.0.0.orig/shared/timespec-util.h
-+++ weston-3.0.0/shared/timespec-util.h
-@@ -28,6 +28,7 @@
- 
- #include <stdint.h>
- #include <assert.h>
-+#include <time.h>
- 
- #define NSEC_PER_SEC 1000000000
- 
diff --git a/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch b/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
deleted file mode 100644
index b3e1d06..0000000
--- a/meta/recipes-graphics/wayland/weston/weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Multi-plane sub-sampled textures have partial width/height, e.g.
-YUV420/I420 has a full-size Y plane, followed by a half-width/height U
-plane, and a half-width/height V plane.
-
-zwp_linux_dmabuf_v1 allows clients to pass an explicit pitch for each
-plane, but for wl_shm this must be inferred. gl-renderer was correctly
-accounting for the width and height when subsampling, but the pitch was
-being taken as the pitch for the first plane.
-
-This does not match the requirements for GStreamer's waylandsink, in
-particular, as well as other clients. Fix the SHM upload path to
-correctly set the pitch for each plane, according to subsampling.
-
-Tested with:
-  $ gst-launch-1.0 videotestsrc ! waylandsink
-
-Upstream-Status: Backport [https://patchwork.freedesktop.org/patch/180767/]
-
-Signed-off-by: Daniel Stone <daniels@collabora.com>
-Fixes: fdeefe42418 ("gl-renderer: add support of WL_SHM_FORMAT_YUV420")
-Reported-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
-Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=103063
-
----
- libweston/gl-renderer.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libweston/gl-renderer.c b/libweston/gl-renderer.c
-index 244ce309..40bf0bb6 100644
---- a/libweston/gl-renderer.c
-+++ b/libweston/gl-renderer.c
-@@ -1445,14 +1445,13 @@ gl_renderer_flush_damage(struct weston_surface *surface)
- 		goto done;
- 	}
- 
--	glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch);
--
- 	if (gs->needs_full_upload) {
- 		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
- 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
- 		wl_shm_buffer_begin_access(buffer->shm_buffer);
- 		for (j = 0; j < gs->num_textures; j++) {
- 			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
-+			glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch / gs->hsub[j]);
- 			glTexImage2D(GL_TEXTURE_2D, 0,
- 				     gs->gl_format[j],
- 				     gs->pitch / gs->hsub[j],
-@@ -1477,6 +1476,7 @@ gl_renderer_flush_damage(struct weston_surface *surface)
- 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, r.y1);
- 		for (j = 0; j < gs->num_textures; j++) {
- 			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
-+			glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT, gs->pitch / gs->hsub[j]);
- 			glTexSubImage2D(GL_TEXTURE_2D, 0,
- 					r.x1 / gs->hsub[j],
- 					r.y1 / gs->vsub[j],
diff --git a/meta/recipes-graphics/wayland/weston_3.0.0.bb b/meta/recipes-graphics/wayland/weston_4.0.0.bb
similarity index 87%
rename from meta/recipes-graphics/wayland/weston_3.0.0.bb
rename to meta/recipes-graphics/wayland/weston_4.0.0.bb
index ad0cdc2..7dfca7f 100644
--- a/meta/recipes-graphics/wayland/weston_3.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_4.0.0.bb
@@ -11,11 +11,9 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-make-error-portable.patch \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
-	   file://weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch \
-	   file://fix-missing-header.patch \
 "
-SRC_URI[md5sum] = "9c42a4c51a1b9f35d040fa9d45ada36d"
-SRC_URI[sha256sum] = "cde1d55e8dd70c3cbb3d1ec72f60e60000041579caa1d6a262bd9c35e93723a5"
+SRC_URI[md5sum] = "33709aa4d5916f89643fca0fc0064b39"
+SRC_URI[sha256sum] = "a0fc0ae7ef83dfbed12abfe9b8096a24a7dd00705e86fa0db1e619ded18b4b58"
 
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
@@ -24,6 +22,8 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
+WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
+
 EXTRA_OECONF = "--enable-setuid-install \
                 --disable-rdp-compositor \
                 "
@@ -62,8 +62,6 @@ PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
 PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
 # Weston with webp support
 PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
-# Weston with unwinding support
-PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 # Weston with systemd-login support
 PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
@@ -77,7 +75,7 @@ PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-	rm -f ${D}/${libdir}/libweston-3/*.la
+	rm -f ${D}/${libdir}/libweston-${WESTON_MAJOR_VERSION}/*.la
 
 	# If X11, ship a desktop file to launch it
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
@@ -94,16 +92,16 @@ do_install_append() {
 }
 
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)} \
-             libweston-3 ${PN}-examples"
+             libweston-${WESTON_MAJOR_VERSION} ${PN}-examples"
 
 FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
 
-FILES_libweston-3 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-3/*.so"
-SUMMARY_libweston-3 = "Helper library for implementing 'wayland window managers'."
+FILES_libweston-${WESTON_MAJOR_VERSION} = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-${WESTON_MAJOR_VERSION}/*.so"
+SUMMARY_libweston-${WESTON_MAJOR_VERSION} = "Helper library for implementing 'wayland window managers'."
 
 FILES_${PN}-examples = "${bindir}/*"
 
-FILES_${PN}-xwayland = "${libdir}/libweston-3/xwayland.so"
+FILES_${PN}-xwayland = "${libdir}/libweston-${WESTON_MAJOR_VERSION}/xwayland.so"
 RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
 
 RDEPENDS_${PN} += "xkeyboard-config"
-- 
2.7.4


