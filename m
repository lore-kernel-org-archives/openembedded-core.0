Return-Path: <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Received: from mailhost.eurogiciel.fr (mailhost.eurogiciel.fr [86.64.47.76])
	by mail.openembedded.org (Postfix) with ESMTP id DDCFB6D01A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 12:23:47 +0000 (UTC)
Received: from (unknown [172.16.88.4]) by mailhost.eurogiciel.fr with smtp
	id 1717_7123_b0edabe8_31a7_11e3_b3fa_a4badbe01a3a;
	Thu, 10 Oct 2013 14:30:04 +0200
Received: from intel13.vannes ([172.16.100.253]) by 31l-syracuse.eurogiciel.fr
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 10 Oct 2013 14:23:31 +0200
From: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2013 14:23:22 +0200
Message-Id: <1381407802-16852-2-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381407802-16852-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
References: <1381407802-16852-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
X-OriginalArrivalTime: 10 Oct 2013 12:23:31.0925 (UTC)
	FILETIME=[88710850:01CEC5B3]
Subject: [PATCH v3 2/2] weston : Bump to 1.2.0 version
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
X-List-Received-Date: Thu, 10 Oct 2013 12:23:48 -0000

Signed-off-by: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
---
 meta/recipes-graphics/wayland/weston/groups.patch  |   47 ------
 .../wayland/weston/weston-launch-shell.patch       |   74 ---------
 .../wayland/{weston_1.1.0.bb => weston_1.2.0.bb}   |  162 ++++++++++----------
 3 files changed, 79 insertions(+), 204 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/groups.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/weston-launch-shell.patch
 rename meta/recipes-graphics/wayland/{weston_1.1.0.bb => weston_1.2.0.bb} (83%)

diff --git a/meta/recipes-graphics/wayland/weston/groups.patch b/meta/recipes-graphics/wayland/weston/groups.patch
deleted file mode 100644
index 9dc043a..0000000
--- a/meta/recipes-graphics/wayland/weston/groups.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status: Submitted (https://bugs.freedesktop.org/show_bug.cgi?id=65933)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 42821739a228a85ce3432be1796858e5cc31688b Mon Sep 17 00:00:00 2001
-From: Quentin Glidic <sardemff7+git@sardemff7.net>
-Date: Wed, 19 Jun 2013 15:27:11 +0200
-Subject: [PATCH weston] weston-launch: Set all groups for user
-
-Signed-off-by: Quentin Glidic <sardemff7+git@sardemff7.net>
----
- configure.ac        | 2 +-
- src/weston-launch.c | 4 ++++
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b625221..db3feb0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -52,7 +52,7 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
- 	      [[#include <time.h>]])
- AC_CHECK_HEADERS([execinfo.h])
- 
--AC_CHECK_FUNCS([mkostemp strchrnul])
-+AC_CHECK_FUNCS([mkostemp strchrnul initgroups])
- 
- COMPOSITOR_MODULES="wayland-server >= 1.1.90 xkbcommon pixman-1"
- 
-diff --git a/src/weston-launch.c b/src/weston-launch.c
-index 76dcede..7d7b556 100644
---- a/src/weston-launch.c
-+++ b/src/weston-launch.c
-@@ -631,9 +631,13 @@ main(int argc, char *argv[])
- 		}
- 
- 		if (setgid(wl.pw->pw_gid) < 0 ||
-+#ifdef HAVE_INITGROUPS
-+                    initgroups(wl.pw->pw_name, wl.pw->pw_gid) < 0 ||
-+#endif
- 		    setuid(wl.pw->pw_uid) < 0)
- 			error(1, errno, "dropping privilidges failed");
- 
-+
- 		if (sleep_fork) {
- 			if (wl.verbose)
- 				printf("weston-launch: waiting %d seconds\n", sleep_fork);
--- 
-1.8.3
diff --git a/meta/recipes-graphics/wayland/weston/weston-launch-shell.patch b/meta/recipes-graphics/wayland/weston/weston-launch-shell.patch
deleted file mode 100644
index ffe0608..0000000
--- a/meta/recipes-graphics/wayland/weston/weston-launch-shell.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From ff3230952a68077669e0ea0ac3ceb234273556fc Mon Sep 17 00:00:00 2001
-From: Quentin Glidic <sardemff7+git@sardemff7.net>
-Date: Fri, 17 May 2013 16:20:37 +0200
-Subject: [PATCH] weston-launch: Run weston in the user login shell
-
-This patch brings back the user environment from the shell.
-In the future, weston-launch could create the Wayland socket earlier, in
-which case the user's shell could be used to run Wayland-specific tools
-in the new Weston session.
-
-Signed-off-by: Quentin Glidic <sardemff7+git@sardemff7.net>
----
- src/weston-launch.c |   19 ++++++++++++++++---
- 1 file changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/src/weston-launch.c b/src/weston-launch.c
-index 64d4a8a..89c3c5a 100644
---- a/src/weston-launch.c
-+++ b/src/weston-launch.c
-@@ -60,6 +60,8 @@
- 
- #include "weston-launch.h"
- 
-+#define MAX_ARGV_SIZE 256
-+
- struct weston_launch {
- 	struct pam_conv pc;
- 	pam_handle_t *ph;
-@@ -523,8 +525,9 @@ main(int argc, char *argv[])
- 	struct weston_launch wl;
- 	char **env;
- 	int i, c;
--	char **child_argv;
-+	char *child_argv[MAX_ARGV_SIZE];
- 	char *tty = NULL, *new_user = NULL;
-+	char *term;
- 	int sleep_fork = 0;
- 	struct option opts[] = {
- 		{ "user",    required_argument, NULL, 'u' },
-@@ -562,8 +565,8 @@ main(int argc, char *argv[])
- 		}
- 	}
- 
--	child_argv = &argv[optind-1];
--	child_argv[0] = BINDIR "/weston";
-+	if ((argc - optind) > (MAX_ARGV_SIZE - 5))
-+		error(1, E2BIG, "Too many arguments to pass to weston");
- 
- 	if (new_user)
- 		wl.pw = getpwnam(new_user);
-@@ -572,7 +575,17 @@ main(int argc, char *argv[])
- 	if (wl.pw == NULL)
- 		error(1, errno, "failed to get username");
- 
-+	child_argv[0] = wl.pw->pw_shell;
-+	child_argv[1] = "-l";
-+	child_argv[2] = "-c";
-+	child_argv[3] = BINDIR "/weston \"$@\"";
-+	child_argv[4] = "weston";
-+	for (i = 0; i < (argc - optind); ++i)
-+		child_argv[5+i] = argv[optind+i];
-+
-+	term = getenv("TERM");
- 	clearenv();
-+	setenv("TERM", term, 1);
- 	setenv("USER", wl.pw->pw_name, 1);
- 	setenv("LOGNAME", wl.pw->pw_name, 1);
- 	setenv("HOME", wl.pw->pw_dir, 1);
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes-graphics/wayland/weston_1.2.0.bb
similarity index 83%
rename from meta/recipes-graphics/wayland/weston_1.1.0.bb
rename to meta/recipes-graphics/wayland/weston_1.2.0.bb
index 8280bf2..d320f88 100644
--- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.2.0.bb
@@ -1,83 +1,79 @@
-SUMMARY = "Weston, a Wayland compositor"
-DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
-HOMEPAGE = "http://wayland.freedesktop.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
-                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
-
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-           file://install-examples.patch \
-           file://weston-launch-shell.patch \
-           file://groups.patch \
-           file://weston.png \
-           file://weston.desktop"
-SRC_URI[md5sum] = "dd9f3043fc5228c6bc4e99873fae2254"
-SRC_URI[sha256sum] = "e7715d2c731f77a729c994a599ffdaebac1307b2dd9336136706869fa53618b4"
-
-
-inherit autotools pkgconfig useradd
-
-DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-DEPENDS += "wayland virtual/mesa virtual/egl pango"
-
-EXTRA_OECONF = "--disable-android-compositor \
-                --enable-setuid-install \
-                --disable-tablet-shell \
-                --disable-xwayland \
-                --enable-simple-clients \
-                --enable-clients \
-                --disable-simple-egl-clients \
-                --disable-libunwind \
-                --disable-rpi-compositor \
-                --disable-rdp-compositor"
-
-
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
-                  "
-#
-# Compositor choices
-#
-# Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev mesa mtdev"
-# Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
-# Weston on X11
-PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
-# Headless Weston
-PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
-# Weston on framebuffer
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
-# weston-launch
-PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam"
-# Use cairo-gl or cairo-glesv2
-PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
-
-do_install_append() {
-	# Weston doesn't need the .la files to load modules, so wipe them
-	rm -f ${D}/${libdir}/weston/*.la
-
-	for feature in ${DISTRO_FEATURES}; do
-		# If X11, ship a desktop file to launch it
-		if [ "$feature" = "x11" ]; then
-			install -d ${D}${datadir}/applications
-			install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
-
-			install -d ${D}${datadir}/icons/hicolor/48x48/apps
-			install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
-                fi
-	done
-}
-
-PACKAGES += "${PN}-examples"
-
-FILES_${PN} = "${bindir}/weston* ${bindir}/wcap-decode ${libexecdir} ${datadir}"
-FILES_${PN}-examples = "${bindir}/*"
-
-RDEPENDS_${PN} += "xkeyboard-config"
-RRECOMMENDS_${PN} = "liberation-fonts"
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "--system weston-launch"
+SUMMARY = "Weston, a Wayland compositor"
+DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
+                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://install-examples.patch \
+           file://weston.png \
+           file://weston.desktop"
+SRC_URI[md5sum] = "86f8c9e865923e138ce44ee41d951500"
+SRC_URI[sha256sum] = "122e12ae8e4ec4618780465c0cc31d70d67054900a2aac458f82ed6eb5d397b7"
+
+
+inherit autotools pkgconfig useradd
+
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
+DEPENDS += "wayland mesa virtual/egl pango"
+BBCLASSEXTEND = "native"
+EXTRA_OECONF = "--disable-android-compositor \
+                --enable-setuid-install \
+                --disable-tablet-shell \
+                --disable-xwayland \
+                --enable-simple-clients \
+                --enable-clients \
+                --disable-simple-egl-clients \
+                --disable-libunwind \
+                --disable-rpi-compositor \
+                --disable-rdp-compositor"
+
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
+                  "
+#
+# Compositor choices
+#
+# Weston on KMS
+PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa mtdev libpam"
+# Weston on Wayland (nested Weston)
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
+# Weston on X11
+PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
+# Headless Weston
+PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
+# Weston on framebuffer
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
+
+# Use cairo-gl or cairo-glesv2
+PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
+
+do_install_append() {
+	# Weston doesn't need the .la files to load modules, so wipe them
+	rm -f ${D}/${libdir}/weston/*.la
+
+	for feature in ${DISTRO_FEATURES}; do
+		# If X11, ship a desktop file to launch it
+		if [ "$feature" = "x11" ]; then
+			install -d ${D}${datadir}/applications
+			install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
+
+			install -d ${D}${datadir}/icons/hicolor/48x48/apps
+			install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
+                fi
+	done
+}
+
+PACKAGES += "${PN}-examples"
+
+FILES_${PN} = "${bindir}/weston* ${bindir}/wcap-decode ${libexecdir} ${datadir}"
+FILES_${PN}-examples = "${bindir}/*"
+
+RDEPENDS_${PN} += "xkeyboard-config"
+RRECOMMENDS_${PN} = "liberation-fonts"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system weston-launch"
-- 
1.7.10.4


