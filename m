Return-Path: <ayaka@soulik.info>
X-Greylist: delayed 316 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 21 Apr 2019 15:28:09 UTC
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7086BF38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Apr 2019 15:28:09 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:c604:15ff:0:d51])
	by kozue.soulik.info (Postfix) with ESMTPA id 92EBA100C32;
	Mon, 22 Apr 2019 00:23:07 +0900 (JST)
From: ayaka <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Apr 2019 23:22:46 +0800
Message-Id: <20190421152246.5013-1-ayaka@soulik.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: adrian.ratiu@collabora.com
Subject: [PATCH] [TEST]: : weston: build for weston 7 git version
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
X-List-Received-Date: Sun, 21 Apr 2019 15:28:09 -0000
Content-Transfer-Encoding: 8bit

I didn't notice there is a build switch patch at mail list
before or I didn't notice when I did this patch for weston 6.

I try to make weston merge all the patch that OE required
before, but still one reminded, it should be merged in a short
time.

About the weston-launch, I talked to weston, they suggest us
use weston binary to start service instead of weston-launch
if you don't want PAM. I did so in my packageconf, but I
have no idea on how to make weston-init to check the packageconf
of the others.

Signed-off-by: ayaka <ayaka@soulik.info>
---
 .../weston/0001-make-error-portable-git.patch |  80 ++++++++++++
 meta/recipes-graphics/wayland/weston_git.bb   | 115 ++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-make-error-portable-git.patch
 create mode 100644 meta/recipes-graphics/wayland/weston_git.bb

diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable-git.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable-git.patch
new file mode 100644
index 0000000000..74d9876a9f
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable-git.patch
@@ -0,0 +1,80 @@
+From e8e2c5e615483eda5ed59c2c91e3b12e736f96f2 Mon Sep 17 00:00:00 2001
+From: Randy 'ayaka' Li <ayaka@soulik.info>
+Date: Thu, 28 Mar 2019 18:31:08 +0800
+Subject: [PATCH] make error() portable
+
+error() is not posix but gnu extension so may not be available on all
+kind of systemsi e.g. musl.
+
+Signed-off-by: Randy 'ayaka' Li <ayaka@soulik.info>
+---
+ libweston/weston-error.h  | 23 +++++++++++++++++++++++
+ libweston/weston-launch.c |  2 +-
+ meson.build               |  1 +
+ 3 files changed, 25 insertions(+), 1 deletion(-)
+ create mode 100644 libweston/weston-error.h
+
+diff --git a/libweston/weston-error.h b/libweston/weston-error.h
+new file mode 100644
+index 00000000..0ba373f7
+--- /dev/null
++++ b/libweston/weston-error.h
+@@ -0,0 +1,23 @@
++#ifndef _WESTON_ERROR_H
++#define _WESTON_ERROR_H
++
++#if defined(HAVE_ERROR_H)
++#include <error.h>
++#else
++#include <string.h>
++#define _weston_error(S, E, F, ...) do { \
++	if (E)  { \
++		printf("\n"); \
++		fprintf(stderr, "weston: " F ": %s", ##__VA_ARGS__, strerror(E)); \
++		exit(S); \
++	} else  { \
++		printf("\n"); \
++		fprintf(stderr, "weston: " F, ##__VA_ARGS__); \
++		exit(S); \
++	} \
++} while(0)
++
++#define error _weston_error
++#endif
++
++#endif
+diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
+index bf73e0d6..90644394 100644
+--- a/libweston/weston-launch.c
++++ b/libweston/weston-launch.c
+@@ -33,7 +33,6 @@
+ #include <poll.h>
+ #include <errno.h>
+ 
+-#include <error.h>
+ #include <getopt.h>
+ 
+ #include <sys/types.h>
+@@ -59,6 +58,7 @@
+ #endif
+ 
+ #include "weston-launch.h"
++#include "weston-error.h"
+ 
+ #define DRM_MAJOR 226
+ 
+diff --git a/meson.build b/meson.build
+index aae96261..2f6c53d0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -94,6 +94,7 @@ foreach func : optional_libc_funcs
+ endforeach
+ 
+ optional_system_headers = [
++	'error.h',
+ 	'linux/sync_file.h'
+ ]
+ foreach hdr : optional_system_headers
+-- 
+2.18.1
+
diff --git a/meta/recipes-graphics/wayland/weston_git.bb b/meta/recipes-graphics/wayland/weston_git.bb
new file mode 100644
index 0000000000..e0fe4f1674
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston_git.bb
@@ -0,0 +1,115 @@
+DEFAULT_PREFERENCE = "-1"
+
+SUMMARY = "Weston, a Wayland compositor"
+DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
+                    file://libweston/compositor.c;endline=27;md5=6c53bbbd99273f4f7c4affa855c33c0a"
+
+SRC_URI = "git://anongit.freedesktop.org/wayland/weston \
+           file://weston.png \
+           file://weston.desktop \
+           file://0001-make-error-portable-git.patch \
+           file://xwayland.weston-start \
+"
+
+SRC_URI[md5sum] = "9c42a4c51a1b9f35d040fa9d45ada36d"
+SRC_URI[sha256sum] = "cde1d55e8dd70c3cbb3d1ec72f60e60000041579caa1d6a262bd9c35e93723a5"
+SRCREV = "${AUTOREV}"
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig useradd distro_features_check
+# depends on virtual/egl
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
+DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
+
+EXTRA_OEMESON = "-Dbackend-rdp=false -Dsimple-dmabuf-drm= "
+
+EXTRA_OEMESON_append_qemux86 = "\
+		-Dbackend-default=fbdev \
+		"
+EXTRA_OEMESON_append_qemux86-64 = "\
+		-Dbackend-default=fbdev \
+		"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
+                   clients"
+
+SIMPLE_CLIENTS = "dmabuf-egl,egl"
+#
+# Compositor choices
+#
+# Weston on KMS
+PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/mesa mtdev"
+# Weston on Wayland (nested Weston)
+PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/mesa"
+# Weston on X11
+PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcb libxcursor cairo"
+# Headless Weston
+PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
+# Weston on framebuffer
+PACKAGECONFIG[fbdev] = "-Dbackend-fbdev=true,-Dbackend-fbdev=false,udev mtdev"
+# weston-launch
+PACKAGECONFIG[launch] = "-Dweston-launch=true,-Dweston-launch=false,drm libpam"
+# VA-API desktop recorder
+PACKAGECONFIG[vaapi] = "-Dbackend-drm-screencast-vaapi=true,-Dbackend-drm-screencast-vaapi=false,libva"
+# Weston with EGL support
+PACKAGECONFIG[egl] = "-Dsimple-clients=${SIMPLE_CLIENTS},-Dsimple-clients=,virtual/egl"
+# Weston with lcms support
+PACKAGECONFIG[lcms] = "-Dcolor-management-lcms=true,-Dcolor-management-lcms=false,lcms"
+# colord CMS support
+PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-colord=false,colord"
+# Weston with webp support
+PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
+# Weston with systemd-login support
+PACKAGECONFIG[systemd] = "-Dlauncher-logind=true,-Dsystemd=false -Dlauncher-logind=false,systemd dbus"
+# Weston with Xwayland support (requires X11 and Wayland)
+PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false"
+# Clients support
+PACKAGECONFIG[clients] = "-Ddemo-clients=true,-Ddemo-clients=false"
+# Remoting RTP supporting
+PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false, gstreamer1.0-plugins-base"
+
+do_install_append() {
+	# Weston doesn't need the .la files to load modules, so wipe them
+	rm -f ${D}/${libdir}/libweston-6/*.la
+
+	# If X11, ship a desktop file to launch it
+	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
+		install -d ${D}${datadir}/applications
+		install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
+
+		install -d ${D}${datadir}/icons/hicolor/48x48/apps
+		install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
+		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston-start/xwayland
+	fi
+}
+
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)} \
+             libweston-7 ${PN}-examples"
+
+FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
+
+#FILES_${PN}_[launch] = "${bindir}/weston-launch"
+FILES_libweston-7 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-7/*.so"
+SUMMARY_libweston-7 = "Helper library for implementing 'wayland window managers'."
+
+FILES_${PN}-examples = "${bindir}/*"
+
+FILES_${PN}-xwayland = "${libdir}/libweston-7/xwayland.so"
+RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
+
+RDEPENDS_${PN} += "xkeyboard-config"
+RRECOMMENDS_${PN} = "liberation-fonts"
+RRECOMMENDS_${PN}-dev += "wayland-protocols"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system weston-launch"
-- 
2.20.1


