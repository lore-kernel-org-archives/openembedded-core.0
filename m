Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 23793730A3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 16:51:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2017 08:51:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,209,1484035200"; d="scan'208";a="938297131"
Received: from dgpeters-mobl5.ger.corp.intel.com (HELO
	heimdall.ger.corp.intel.com) ([10.252.1.186])
	by orsmga003.jf.intel.com with ESMTP; 26 Feb 2017 08:51:01 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2017 18:50:53 +0200
Message-Id: <dd7a26db70cf0ed10bd0c83d69acdf0c7d2e3c66.1488125460.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1488125460.git.jussi.kukkonen@intel.com>
References: <cover.1488125460.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/6] weston: Upgrade 1.11.1 -> 2.0.0, separate libweston
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
X-List-Received-Date: Sun, 26 Feb 2017 16:51:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Drop two patches that are upstream. Rebase other patches.
* Separate libweston into its own package, modify the recipe
  as needed because files have changed location.
* Remove "--disable-rpi-compositor": the backend does not exist
  anymore.

Libweston is already at version 2 and is likely to have new major
versions. The versions should be parallel installable (but weston
itself will not be).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...-configuration-option-for-no-input-device.patch | 112 ---------------------
 ...1-configure.ac-Fix-wayland-protocols-path.patch |   2 +-
 .../wayland/weston/0001-make-error-portable.patch  |  12 +--
 .../0001-shared-include-stdint.h-for-int32_t.patch |  23 -----
 ...ch-Provide-a-default-version-that-doesn-t.patch |  52 ++++++----
 .../wayland/{weston_1.11.1.bb => weston_2.0.0.bb}  |  20 ++--
 6 files changed, 47 insertions(+), 174 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
 rename meta/recipes-graphics/wayland/{weston_1.11.1.bb => weston_2.0.0.bb} (88%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch b/meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch
deleted file mode 100644
index c45f3addfcd..00000000000
--- a/meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 75b7197f4e072a4e2de124ddbe93b85cffb1c0f8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
-Date: Fri, 21 Oct 2016 14:03:13 -0500
-Subject: [PATCH] Add configuration option for no input device.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-As it has been discussed in the past [1], running Weston
-without any input device at launch might be beneficial for
-some use cases.
-
-Certainly, it's best for the vast majority of users (and
-the project) to require an input device to be present, as
-to avoid frustration and hassle, but for those brave souls
-that so prefer, this patch lets them run without any input
-device at all.
-
-This introduces a simple configuration in weston.ini:
-  [core]
-  require-input=true
-
-True is the default, so no behavioral change is introduced.
-
-[1] https://lists.freedesktop.org/archives/wayland-devel/2015-November/025193.html
-
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Reviewed-by: Daniel Stone <daniels@collabora.com>
-
-Upstream-Status: backport from
-https://cgit.freedesktop.org/wayland/weston/commit/?id=75b7197f
----
- man/weston.ini.man  |    5 +++++
- src/compositor.h    |    3 +++
- src/libinput-seat.c |    6 ++++++
- src/main.c          |    5 +++++
- weston.ini.in       |    1 +
- 5 files changed, 20 insertions(+)
-
---- a/src/main.c
-+++ b/src/main.c
-@@ -1298,6 +1298,7 @@ int main(int argc, char *argv[])
- 	struct wl_client *primary_client;
- 	struct wl_listener primary_client_destroyed;
- 	struct weston_seat *seat;
-+      int require_input;
- 
- 	const struct weston_option core_options[] = {
- 		{ WESTON_OPTION_STRING, "backend", 'B', &backend },
-@@ -1373,6 +1374,10 @@ int main(int argc, char *argv[])
- 	if (weston_compositor_init_config(ec, config) < 0)
- 		goto out;
- 
-+	weston_config_section_get_bool(section, "require-input",
-+				       &require_input, true);
-+	ec->require_input = require_input;
-+
- 	if (load_backend(ec, backend, &argc, argv, config) < 0) {
- 		weston_log("fatal: failed to create compositor backend\n");
- 		goto out;
---- a/src/compositor.h
-+++ b/src/compositor.h
-@@ -803,6 +803,9 @@ struct weston_compositor {
- 
- 	void *user_data;
- 	void (*exit)(struct weston_compositor *c);
-+
-+	/* Whether to let the compositor run without any input device. */
-+	bool require_input;
- };
- 
- struct weston_buffer {
---- a/src/libinput-seat.c
-+++ b/src/libinput-seat.c
-@@ -255,6 +255,12 @@ udev_input_enable(struct udev_input *inp
- 			devices_found = 1;
- 	}
- 
-+	if (devices_found == 0 && !c->require_input) {
-+		weston_log("warning: no input devices found, but none required "
-+			   "as per configuration.\n");
-+		return 0;
-+	}
-+
- 	if (devices_found == 0) {
- 		weston_log(
- 			"warning: no input devices on entering Weston. "
---- a/man/weston.ini.man
-+++ b/man/weston.ini.man
-@@ -169,6 +169,11 @@ time, the one specified in the command-l
- hand, if none of these sets the value, default idle timeout will be
- set to 300 seconds.
- .RS
-+.PP
-+.RE
-+.TP 7
-+.BI "require-input=" true
-+require an input device for launch
- 
- .SH "LIBINPUT SECTION"
- The
---- a/weston.ini.in
-+++ b/weston.ini.in
-@@ -2,6 +2,7 @@
- #modules=xwayland.so,cms-colord.so
- #shell=desktop-shell.so
- #gbm-format=xrgb2101010
-+#require-input=true
- 
- [shell]
- background-image=/usr/share/backgrounds/gnome/Aqua.jpg
diff --git a/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch b/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
index edd3b918f6f..5f4d79c38c2 100644
--- a/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
@@ -21,7 +21,7 @@ Upstream-Status: Inappropriate [embedded specific]
 @@ -187,7 +187,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [lib
  PKG_CHECK_MODULES(COMPOSITOR, [$COMPOSITOR_MODULES])
  
- PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >= 1.2],
+ PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >= 1.7],
 -		  [ac_wayland_protocols_pkgdatadir=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`])
 +		  [ac_wayland_protocols_pkgdatadir=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`])
  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, $ac_wayland_protocols_pkgdatadir)
diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
index f7b52843d99..e2213aca60c 100644
--- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
@@ -10,9 +10,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
 Upstream-Status: Submitted
 
- configure.ac        |    2 ++
- src/weston-error.h  |   20 ++++++++++++++++++++
- src/weston-launch.c |    2 +-
+ configure.ac              |    2 ++
+ libweston/weston-error.h  |   20 ++++++++++++++++++++
+ libweston/weston-launch.c |    2 +-
  3 files changed, 23 insertions(+), 1 deletion(-)
  create mode 100644 src/weston-error.h
 
@@ -28,7 +28,7 @@ Upstream-Status: Submitted
  
  COMPOSITOR_MODULES="wayland-server >= $WAYLAND_PREREQ_VERSION pixman-1 >= 0.25.2"
 --- /dev/null
-+++ b/src/weston-error.h
++++ b/libweston/weston-error.h
 @@ -0,0 +1,20 @@
 +#ifndef _WESTON_ERROR_H
 +#define _WESTON_ERROR_H
@@ -50,8 +50,8 @@ Upstream-Status: Submitted
 +
 +#endif
 +
---- a/src/weston-launch.c
-+++ b/src/weston-launch.c
+--- a/libweston/weston-launch.c
++++ b/libweston/weston-launch.c
 @@ -33,7 +33,6 @@
  #include <poll.h>
  #include <errno.h>
diff --git a/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch b/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
deleted file mode 100644
index ee66c20aa8f..00000000000
--- a/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From ba02b8abe4e2afac2bfbf2559972d5059d75a041 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Sat, 16 Jul 2016 22:50:19 +0300
-Subject: [PATCH weston] shared: include stdint.h for int32_t
-
-This fixes build on musl.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted
----
- shared/xalloc.h |    1 +
- 1 file changed, 1 insertion(+)
-
---- a/shared/xalloc.h
-+++ b/shared/xalloc.h
-@@ -30,6 +30,7 @@
- extern "C" {
- #endif
- 
-+#include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
- 
diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index d684b1c1bc5..70b988898cc 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -1,6 +1,6 @@
-From d02226b3d5872b184c1d50c7f4706ac9467ffb81 Mon Sep 17 00:00:00 2001
+From 8ff6ed03ec4079f32e9b34085414e57be4730e04 Mon Sep 17 00:00:00 2001
 From: Tom Hochstein <tom.hochstein@nxp.com>
-Date: Fri, 15 Jul 2016 11:00:15 +0300
+Date: Wed, 22 Feb 2017 15:53:30 +0200
 Subject: [PATCH] weston-launch: Provide a default version that doesn't require
  PAM
 
@@ -13,14 +13,17 @@ without non-root-user support.
 Upstream-Status: Pending
 
 Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
- configure.ac        |    9 +++++++--
- src/weston-launch.c |   20 ++++++++++++++++++++
+ configure.ac              |  9 +++++++--
+ libweston/weston-launch.c | 20 ++++++++++++++++++++
  2 files changed, 27 insertions(+), 2 deletions(-)
 
+diff --git a/configure.ac b/configure.ac
+index 46cb2c7..bb45f46 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -416,13 +416,17 @@ AC_ARG_ENABLE(resize-optimization,
+@@ -435,13 +435,17 @@ AC_ARG_ENABLE(resize-optimization,
  AS_IF([test "x$enable_resize_optimization" = "xyes"],
        [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
  
@@ -28,11 +31,11 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
 +            AS_HELP_STRING([--with-pam], [Use PAM]),
 +            [use_pam=$withval], [use_pam=yes])
  AC_ARG_ENABLE(weston-launch, [  --enable-weston-launch],, enable_weston_launch=yes)
- AM_CONDITIONAL(BUILD_WESTON_LAUNCH, test x$enable_weston_launch == xyes)
--if test x$enable_weston_launch == xyes; then
+ AM_CONDITIONAL(BUILD_WESTON_LAUNCH, test x$enable_weston_launch = xyes)
+-if test x$enable_weston_launch = xyes; then
 +if test x$enable_weston_launch = xyes -a x$use_pam = xyes; then
    WESTON_SEARCH_LIBS([PAM], [pam], [pam_open_session], [have_pam=yes], [have_pam=no])
-   if test x$have_pam == xno; then
+   if test x$have_pam = xno; then
 -    AC_ERROR([weston-launch requires pam])
 +    AC_ERROR([PAM support is explicitly requested, but libpam couldn't be found])
    fi
@@ -40,7 +43,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  fi
  
  AM_CONDITIONAL(HAVE_PANGO, test "x$have_pango" = "xyes")
-@@ -673,6 +677,7 @@ AC_MSG_RESULT([
+@@ -701,6 +705,7 @@ AC_MSG_RESULT([
  	Enable developer documentation	${enable_devdocs}
  
  	weston-launch utility		${enable_weston_launch}
@@ -48,8 +51,10 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  	systemd-login support		${have_systemd_login}
  	systemd notify support		${enable_systemd_notify}
  
---- a/src/weston-launch.c
-+++ b/src/weston-launch.c
+diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
+index 0491896..07e7469 100644
+--- a/libweston/weston-launch.c
++++ b/libweston/weston-launch.c
 @@ -51,7 +51,9 @@
  
  #include <pwd.h>
@@ -71,7 +76,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  	int tty;
  	int ttynr;
  	int sock[2];
-@@ -181,6 +185,7 @@ weston_launch_allowed(struct weston_laun
+@@ -181,6 +185,7 @@ weston_launch_allowed(struct weston_launch *wl)
  	return false;
  }
  
@@ -87,7 +92,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  
  static int
  setup_launcher_socket(struct weston_launch *wl)
-@@ -414,6 +420,7 @@ quit(struct weston_launch *wl, int statu
+@@ -414,6 +420,7 @@ quit(struct weston_launch *wl, int status)
  	close(wl->signalfd);
  	close(wl->sock[0]);
  
@@ -95,7 +100,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  	if (wl->new_user) {
  		err = pam_close_session(wl->ph, 0);
  		if (err)
-@@ -421,6 +428,7 @@ quit(struct weston_launch *wl, int statu
+@@ -421,6 +428,7 @@ quit(struct weston_launch *wl, int status)
  				err, pam_strerror(wl->ph, err));
  		pam_end(wl->ph, err);
  	}
@@ -103,7 +108,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  
  	if (ioctl(wl->tty, KDSKBMUTE, 0) &&
  	    ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
-@@ -600,6 +608,7 @@ setup_session(struct weston_launch *wl)
+@@ -600,6 +608,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  	setenv("HOME", wl->pw->pw_dir, 1);
  	setenv("SHELL", wl->pw->pw_shell, 1);
  
@@ -111,15 +116,15 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  	env = pam_getenvlist(wl->ph);
  	if (env) {
  		for (i = 0; env[i]; ++i) {
-@@ -608,6 +617,7 @@ setup_session(struct weston_launch *wl)
+@@ -608,6 +617,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  		}
  		free(env);
  	}
 +#endif
- }
  
- static void
-@@ -665,7 +675,9 @@ static void
+ 	/*
+ 	 * We open a new session, so it makes sense
+@@ -675,7 +685,9 @@ static void
  help(const char *name)
  {
  	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
@@ -129,7 +134,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  	fprintf(stderr, "  -t, --tty       Start session on alternative tty\n");
  	fprintf(stderr, "  -v, --verbose   Be verbose\n");
  	fprintf(stderr, "  -h, --help      Display this help message\n");
-@@ -678,7 +690,9 @@ main(int argc, char *argv[])
+@@ -688,7 +700,9 @@ main(int argc, char *argv[])
  	int i, c;
  	char *tty = NULL;
  	struct option opts[] = {
@@ -139,7 +144,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  		{ "tty",     required_argument, NULL, 't' },
  		{ "verbose", no_argument,       NULL, 'v' },
  		{ "help",    no_argument,       NULL, 'h' },
-@@ -690,9 +704,13 @@ main(int argc, char *argv[])
+@@ -700,9 +714,13 @@ main(int argc, char *argv[])
  	while ((c = getopt_long(argc, argv, "u:t::vh", opts, &i)) != -1) {
  		switch (c) {
  		case 'u':
@@ -153,7 +158,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  			break;
  		case 't':
  			tty = optarg;
-@@ -732,8 +750,10 @@ main(int argc, char *argv[])
+@@ -740,8 +758,10 @@ main(int argc, char *argv[])
  	if (setup_tty(&wl, tty) < 0)
  		exit(EXIT_FAILURE);
  
@@ -164,3 +169,6 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  
  	if (setup_launcher_socket(&wl) < 0)
  		exit(EXIT_FAILURE);
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/wayland/weston_1.11.1.bb b/meta/recipes-graphics/wayland/weston_2.0.0.bb
similarity index 88%
rename from meta/recipes-graphics/wayland/weston_1.11.1.bb
rename to meta/recipes-graphics/wayland/weston_2.0.0.bb
index cdfac70ed14..4aceda7d99f 100644
--- a/meta/recipes-graphics/wayland/weston_1.11.1.bb
+++ b/meta/recipes-graphics/wayland/weston_2.0.0.bb
@@ -3,20 +3,18 @@ DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
 HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
-                    file://src/compositor.c;endline=26;md5=e342df749174a8ee11065583157c7a38"
+                    file://libweston/compositor.c;endline=26;md5=e342df749174a8ee11065583157c7a38"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://0001-make-error-portable.patch \
            file://0001-configure.ac-Fix-wayland-protocols-path.patch \
-           file://0001-shared-include-stdint.h-for-int32_t.patch \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
-           file://0001-Add-configuration-option-for-no-input-device.patch \
 "
-SRC_URI[md5sum] = "c5fdc02ab67d33c0fca8f72d341facdf"
-SRC_URI[sha256sum] = "548973496a5c8613d6690f9120f21066946a544df65ce4fe0ef153a8dc0bf6de"
+SRC_URI[md5sum] = "15f38945942bf2a91fe2687145fb4c7d"
+SRC_URI[sha256sum] = "b4e446ac27f118196f1609dab89bb3cb3e81652d981414ad860e733b355365d8"
 
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
@@ -26,7 +24,6 @@ DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
 EXTRA_OECONF = "--enable-setuid-install \
-                --disable-rpi-compositor \
                 --disable-rdp-compositor \
                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
                 "
@@ -82,7 +79,7 @@ PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-	rm -f ${D}/${libdir}/weston/*.la
+	rm -f ${D}/${libdir}/libweston-2/*.la
 
 	# If X11, ship a desktop file to launch it
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11" ]; then
@@ -98,13 +95,16 @@ do_install_append() {
 	fi
 }
 
-PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)}"
-PACKAGES += "${PN}-examples"
+PACKAGES += "${PN}-xwayland libweston-2 ${PN}-examples"
 
 FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
+
+FILES_libweston-2 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-2/*.so"
+SUMMARY_libweston-2 = "Helper library for implementing 'wayland window managers'."
+
 FILES_${PN}-examples = "${bindir}/*"
 
-FILES_${PN}-xwayland = "${libdir}/${BPN}/xwayland.so"
+FILES_${PN}-xwayland = "${libdir}/libweston-2/xwayland.so"
 RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
 
 RDEPENDS_${PN} += "xkeyboard-config"
-- 
2.11.0


