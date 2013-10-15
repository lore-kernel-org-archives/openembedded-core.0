Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 64E4F6CE77
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 13:15:03 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so8614741wes.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 06:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pRNWNQSKQtImOZKLVYKDCg9UMRYpc7M11uku8CRVP1o=;
	b=ePmSHpPdAjtMYMidK0T/XHmNWTnuk4sOxOGbACxR3I9WhcUxL9b2w4/HY3a8T7Nd+h
	bBt+BG1xzoDAIKz+kZq7zoPSKQFJPjex4oCecj6AZFCi9dxK9PPAOV4fuAlm/sm3cP2C
	6VDfcBZLZgdn6w5XmmoqtVvDnXDV0Gh+wCgE6uzT5pSygtYcCbZFJt5O2mbuEpTfzgNd
	h+1WTCmMMffeiCk7+I4Nh6PTrENqg2Pky6qZ0i3Nf7vMuxLkigF2JL52WFRxezHniDXA
	UAWfDQId5GM2VVf0/AC3iYY8WqMjl1b1WerGBz+vmUMeqPdhEeqp9HaZzWO+Gpl9U+N+
	JDlA==
X-Gm-Message-State: ALoCoQnQNPII+ztTo8Ap35h/4i6j7utRolYrMPvKg+o8SXnyQKXcvfcDdWWmQVcQlgW/CMN6oFu5
X-Received: by 10.194.216.225 with SMTP id ot1mr38024wjc.80.1381842904832;
	Tue, 15 Oct 2013 06:15:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id pi6sm6138230wic.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 06:15:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 14:15:00 +0100
Message-Id: <1381842900-13728-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] weston: upgrade to 1.3.0
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
X-List-Received-Date: Tue, 15 Oct 2013 13:15:04 -0000

Remove backported patches that are now integrated.

No need to patch build to install examples with --enable-demo-clients, update
FILES now that all examples are being installed.

Remove cairo-gl option as our cairo doesn't support GL (yet), remove --disable-android-compositor as it was dropped upstream, and add PACKAGECONFIG for the VA-API-based recorder as otherwise it's a floating dependency (libva is in meta-intel).

Based on work by Ewan Le Bideau-Canevet <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston/groups.patch  |   47 -----------
 .../wayland/weston/install-examples.patch          |   18 -----
 .../wayland/weston/weston-launch-shell.patch       |   74 -----------------
 meta/recipes-graphics/wayland/weston_1.1.0.bb      |   83 --------------------
 meta/recipes-graphics/wayland/weston_1.3.0.bb      |   80 +++++++++++++++++++
 5 files changed, 80 insertions(+), 222 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/groups.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/install-examples.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/weston-launch-shell.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston_1.1.0.bb
 create mode 100644 meta/recipes-graphics/wayland/weston_1.3.0.bb

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
diff --git a/meta/recipes-graphics/wayland/weston/install-examples.patch b/meta/recipes-graphics/wayland/weston/install-examples.patch
deleted file mode 100644
index 3e2852c..0000000
--- a/meta/recipes-graphics/wayland/weston/install-examples.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Install the examples so we can package them.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/clients/Makefile.am b/clients/Makefile.am
-index 621c7c3..749ef20 100644
---- a/clients/Makefile.am
-+++ b/clients/Makefile.am
-@@ -2,7 +2,7 @@ bin_PROGRAMS =					\
- 	weston-info				\
- 	$(terminal)
- 
--noinst_PROGRAMS =				\
-+bin_PROGRAMS +=				\
- 	$(clients_programs)			\
- 	$(poppler_programs)			\
- 	$(simple_clients_programs)		\
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
diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes-graphics/wayland/weston_1.1.0.bb
deleted file mode 100644
index 8280bf2..0000000
--- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
+++ /dev/null
@@ -1,83 +0,0 @@
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
diff --git a/meta/recipes-graphics/wayland/weston_1.3.0.bb b/meta/recipes-graphics/wayland/weston_1.3.0.bb
new file mode 100644
index 0000000..eb38ce1
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston_1.3.0.bb
@@ -0,0 +1,80 @@
+SUMMARY = "Weston, a Wayland compositor"
+DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
+                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://weston.png \
+           file://weston.desktop"
+SRC_URI[md5sum] = "29ad994dd5ea07f52d7bffb24c25d9f7"
+SRC_URI[sha256sum] = "8e4f5b4736358b63d83c3252567ba7aa49cc0da9e2e2c30f59ddf635159702a0"
+
+
+inherit autotools pkgconfig useradd
+
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
+DEPENDS += "wayland virtual/mesa virtual/egl pango"
+
+EXTRA_OECONF = "--enable-setuid-install \
+                --disable-tablet-shell \
+                --disable-xwayland \
+                --enable-simple-clients \
+                --enable-clients \
+                --enable-demo-clients \
+                --disable-simple-egl-clients \
+                --disable-libunwind \
+                --disable-rpi-compositor \
+                --disable-rdp-compositor"
+
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
+                  "
+#
+# Compositor choices
+#
+# Weston on KMS
+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev mesa mtdev"
+# Weston on Wayland (nested Weston)
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
+# Weston on X11
+PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
+# Headless Weston
+PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
+# Weston on framebuffer
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
+# weston-launch
+PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam"
+# VA-API desktop recorder
+PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
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
+FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${datadir}"
+FILES_${PN}-examples = "${bindir}/*"
+
+RDEPENDS_${PN} += "xkeyboard-config"
+RRECOMMENDS_${PN} = "liberation-fonts"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system weston-launch"
-- 
1.7.10.4


