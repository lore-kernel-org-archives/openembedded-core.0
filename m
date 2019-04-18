Return-Path: <adrian.ratiu@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id DF0287C752
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 15:46:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aratiu) with ESMTPSA id C3404260667
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2019 18:46:48 +0300
Message-Id: <20190418154648.8019-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] weston: switch build from autotools to meson
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
X-List-Received-Date: Thu, 18 Apr 2019 15:46:39 -0000
Content-Transfer-Encoding: 8bit

Weston 6.0 is the last version which supports autotools builds, hidden
behind an --enable-autotools deprecation flag. We must convert the recipe
to meson to be able to upgrade to future versions.

The difficulty in doing this is that there is not always a 1-on-1
correspondence between the autotools and meson build configurations, for
example the --with-cairo= flag doesn't exist anymore and --with-cairo=image
is assumed.

This is based on work done by Jean-Francois Dagenais at
https://patchwork.openembedded.org/patch/160370/

Changes since v1:
- Merged the weston_git.bb v5.0.94 recipe with the oe-core's *_6.0.bb
- Renamed the 5.0.94 drm PACKAGECONFIG to kms to preserve compatibility
- Added a missing virtual/egl dependency to 5.0.94 egl PACKAGECONFIGS

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 meta/recipes-graphics/wayland/weston_6.0.0.bb | 70 ++++++++++++-------
 1 file changed, 45 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_6.0.0.bb b/meta/recipes-graphics/wayland/weston_6.0.0.bb
index fa08dac91d..552e90ce27 100644
--- a/meta/recipes-graphics/wayland/weston_6.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_6.0.0.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a8
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-inherit autotools pkgconfig useradd distro_features_check
+inherit meson pkgconfig useradd distro_features_check
 # depends on virtual/egl
 REQUIRED_DISTRO_FEATURES = "opengl"
 
@@ -26,49 +26,69 @@ DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
 WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
 
-EXTRA_OECONF = "--enable-setuid-install \
-                --disable-rdp-compositor \
-                --enable-autotools \
+EXTRA_OEMESON = " \
+                -Dbackend-default=auto \
+                -Dimage-jpeg=true \
+                -Dsimple-dmabuf-drm= \
                 "
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd x11', d)} \
-                   clients launch"
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
+                   simple-clients demo-clients launch"
+
+# Additional weston tools to build and install
+WESTON_TOOLS ?= "calibrator,debug,info,terminal,touch-calibrator"
+
 #
 # Compositor choices
+# see https://github.com/wayland-project/weston/raw/master/meson_options.txt
 #
 # Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa virtual/libgbm mtdev"
+PACKAGECONFIG[kms] = "-Ddrm-compositor=true,-Ddrm-compositor=false,drm udev virtual/mesa virtual/libgbm mtdev"
 # Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
+PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/mesa"
 # Weston on X11
-PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
+PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,libxcb"
 # Headless Weston
-PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
+PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false,"
 # Weston on framebuffer
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
+PACKAGECONFIG[fbdev] = "-Dbackend-fbdev=true,-Dbackend-fbdev=false,libinput mtdev udev (>=136)"
 # weston-launch
-PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,drm"
+PACKAGECONFIG[launch] = "-Dweston-launch=true,-Dweston-launch=false,drm libpam"
 # VA-API desktop recorder
-PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
+PACKAGECONFIG[vaapi] = "-Dbackend-drm-screencast-vaapir=true,-Dbackend-drm-screencast-vaapi=false,libva drm"
 # Weston with EGL support
-PACKAGECONFIG[egl] = "--enable-egl --enable-simple-egl-clients,--disable-egl --disable-simple-egl-clients,virtual/egl"
-# Weston with cairo glesv2 support
-PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
+PACKAGECONFIG[egl] = "-Drender-gl=true,-Drender-gl=false,virtual/egl"
 # Weston with lcms support
-PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
+PACKAGECONFIG[lcms] = "-Dcolor-management-lcms=true,-Dcolor-management-lcms=false,lcms"
 # Weston with webp support
-PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
+PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
 # Weston with systemd-login support
-PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd dbus"
+PACKAGECONFIG[systemd] = "-Dlauncher-logind=true,-Dlauncher-logind=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
-PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland"
+PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor"
 # colord CMS support
-PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
-# Clients support
-PACKAGECONFIG[clients] = "--enable-clients --enable-simple-clients --enable-demo-clients-install,--disable-clients --disable-simple-clients"
-# Weston with PAM support
-PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
+PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-colord=false,lcms"
+# Client support
+PACKAGECONFIG[demo-clients] = "-Ddemo-clients=true,-Ddemo-clients=false"
+PACKAGECONFIG[simple-clients] = "-Dsimple-clients=all,-Dsimple-clients="
+# RDP remote screensharing
+PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp"
+PACKAGECONFIG[screenshare] = "-Dscreenshare=true -Dshell-fullscreen=true,-Dscreenshare=false"
+# Virtual remote output with GStreamer on DRM backend
+PACKAGECONFIG[remote] = "-Dremoting=true,-Dremoting=false, gstreamer"
+# Traditional desktop UI
+PACKAGECONFIG[shell-desktop] = "-Dshell-desktop=true,-Dshell-desktop=false"
+# Fullscreen/kiosk UI
+PACKAGECONFIG[shell-fullscreen] = "-Dshell-fullscreen=true,-Dshell-fullscreen=false"
+# IVI (automotive) UI
+PACKAGECONFIG[shell-ivi] = "-Dshell-ivi=true,-Dshell-ivi=false"
+# List of accessory clients to build and install
+PACKAGECONFIG[tools] = "-Dtools=${WESTON_TOOLS},-Dtools=,"
+# Screen recording decoder tool
+PACKAGECONFIG[wcap-decode] = "-Dwcap-decode=true,-Dwcap-decode=false"
+# Output JUnit XML results
+PACKAGECONFIG[test-junit-xml] = "-Dtest-junit-xml=true,-Dtest-junit-xml=false,libxml"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.21.0


