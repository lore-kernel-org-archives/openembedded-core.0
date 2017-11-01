Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id CDC8277DCC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 23:23:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id 6BDD626E233
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Nov 2017 00:22:54 +0100
Message-Id: <20171101232255.9320-2-fabien.lahoudere@collabora.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171101232255.9320-1-fabien.lahoudere@collabora.co.uk>
References: <20171101232255.9320-1-fabien.lahoudere@collabora.co.uk>
MIME-Version: 1.0
Subject: [PATCH v7 2/3] wayland: Fix installation patch issue
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
X-List-Received-Date: Wed, 01 Nov 2017 23:23:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch modify the way we manage wayland path issues.
Instead of patching each recipe to make it work with wayland and its protocols,
it is better to patch wayland to fix its path issues.

So wayland-scanner.pc, wayland-client.pc and wayland-protocols.pc are patched to change paths.

Then we can drop the following workaround:

WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}

in:

- gtk+3
- libsdl2
- xserver-xorg
- gstreamer1.0-plugins-bad
- weston-2.0.0

We also dropped libsdl2 patches which fix wayland paths.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  1 -
 ...-sysroot-path-so-that-make-finds-our-wayl.patch | 34 ----------------------
 ...void-finding-build-host-s-wayland-scanner.patch | 31 --------------------
 meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |  4 +--
 .../usesysrootprefixforpkgdatadirvariable.patch    | 27 +++++++++++++++++
 .../wayland/wayland-protocols_1.10.bb              |  1 +
 .../wayland/wayland/fixpathinpcfiles.patch         | 33 +++++++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.14.0.bb    |  1 +
 meta/recipes-graphics/wayland/weston_2.0.0.bb      |  1 -
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  1 -
 .../gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb   |  1 -
 11 files changed, 63 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch
 create mode 100644 meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch
 create mode 100644 meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 0a357db049..420ead2ca2 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -35,7 +35,6 @@ EXTRA_OECONF += " \
                  --enable-modules \
                  --disable-cups \
                  --disable-colord \
-                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
                  ${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "--disable-gtk-doc", d)} \
                  "
 
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
deleted file mode 100644
index efc84188f3..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b44808e43130dcd13b43e5b978b9b24aeb4c134c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 20 Oct 2016 14:57:51 +0200
-Subject: [PATCH] prepend our sysroot path so that make finds our
- wayland-protocol files
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.in | 4 +-
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 726ded3..3376600 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1206,7 +1206,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], [QtWayland server support for
-                 WAYLAND_CFLAGS=`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor xkbcommon`
-                 WAYLAND_LIBS=`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`
-                 WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
--                WAYLAND_CORE_PROTOCOL_DIR=`$PKG_CONFIG --variable=pkgdatadir wayland-client`
--                WAYLAND_PROTOCOLS_DIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
-+                WAYLAND_CORE_PROTOCOL_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-client`
-+                WAYLAND_PROTOCOLS_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
-                 video_wayland=yes
-             fi
-         fi
--- 
-2.5.5
-
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch b/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch
deleted file mode 100644
index 7837315f1c..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ae879091cf65cb70293b375ec7e61ed12a96d8a7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 2 Dec 2016 09:39:25 +0100
-Subject: [PATCH] Avoid finding build host's wayland-scanner
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index 3376600..2aa6ed4 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1204,7 +1204,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], [QtWayland server support for
-             if $PKG_CONFIG --exists wayland-client wayland-scanner wayland-protocols wayland-egl wayland-cursor egl xkbcommon ; then
-                 WAYLAND_CFLAGS=`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor xkbcommon`
-                 WAYLAND_LIBS=`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`
--                WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
-+                AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
-                 WAYLAND_CORE_PROTOCOL_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-client`
-                 WAYLAND_PROTOCOLS_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
-                 video_wayland=yes
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
index 12d3aaf6f0..032f45bb20 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
@@ -17,8 +17,6 @@ DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtu
 SRC_URI = " \
     http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
     file://linkage.patch \
-    file://0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch \
-    file://0002-Avoid-finding-build-host-s-wayland-scanner.patch \
     file://fix-build-failure-on-ppc.patch \
 "
 
@@ -35,7 +33,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --enable-pthreads \
                 --enable-sdl-dlopen \
                 --disable-rpath \
-                WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
+                "
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
diff --git a/meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch b/meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch
new file mode 100644
index 0000000000..0922a4d2c2
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch
@@ -0,0 +1,27 @@
+From 875130ee3cbcf62266901ef4b91b9a0fb6adad43 Mon Sep 17 00:00:00 2001
+From: Tomek Bury <tomek.bury@broadcom.com>
+Date: Fri, 4 Aug 2017 16:16:38 +0100
+Subject: Use sysroot prefix for pkgdatadir variable
+
+The pc_sysroot is automatically added to cflags and libs but not
+to 'pkg-config --variable'
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/wayland/wayland-protocols/commit/?id=875130ee3cbcf62266901ef4b91b9a0fb6adad43]
+
+Reviewed-by: Daniel Stone <daniels@collabora.com>
+
+diff --git a/wayland-protocols.pc.in b/wayland-protocols.pc.in
+index a26744c..379be06 100644
+--- a/wayland-protocols.pc.in
++++ b/wayland-protocols.pc.in
+@@ -1,6 +1,6 @@
+ prefix=@prefix@
+ datarootdir=@datarootdir@
+-pkgdatadir=@datadir@/@PACKAGE@
++pkgdatadir=${pc_sysrootdir}@datadir@/@PACKAGE@
+ 
+ Name: Wayland Protocols
+ Description: Wayland protocol files
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
index 4f9e9f32bf..1ff12c607b 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+	   file://usesysrootprefixforpkgdatadirvariable.patch \
            "
 SRC_URI[md5sum] = "84a7846c2b6a6a3e265fc9be36453e60"
 SRC_URI[sha256sum] = "5719c51d7354864983171c5083e93a72ac99229e2b460c4bb10513de08839c0a"
diff --git a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
new file mode 100644
index 0000000000..9fb1252284
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
@@ -0,0 +1,33 @@
+Fix wayland-client and wayland-scanner pc files
+
+Upstream-Status: Pending
+
+Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
+
+Index: wayland-1.14.0/src/wayland-client.pc.in
+===================================================================
+--- wayland-1.14.0.orig/src/wayland-client.pc.in
++++ wayland-1.14.0/src/wayland-client.pc.in
+@@ -1,7 +1,7 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ datarootdir=@datarootdir@
+-pkgdatadir=@datadir@/@PACKAGE@
++pkgdatadir=${pc_sysrootdir}@datadir@/@PACKAGE@
+ libdir=@libdir@
+ includedir=@includedir@
+ 
+Index: wayland-1.14.0/src/wayland-scanner.pc.in
+===================================================================
+--- wayland-1.14.0.orig/src/wayland-scanner.pc.in
++++ wayland-1.14.0/src/wayland-scanner.pc.in
+@@ -1,8 +1,8 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ datarootdir=@datarootdir@
+ pkgdatadir=@datadir@/@PACKAGE@
+-wayland_scanner=@bindir@/wayland-scanner
++wayland_scanner=wayland-scanner
+ 
+ Name: Wayland Scanner
+ Description: Wayland scanner
diff --git a/meta/recipes-graphics/wayland/wayland_1.14.0.bb b/meta/recipes-graphics/wayland/wayland_1.14.0.bb
index 2a2489d658..1a9ff9807b 100644
--- a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.14.0.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
 DEPENDS = "expat libxml2 libffi wayland-native"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+	   file://fixpathinpcfiles.patch \
            "
 SRC_URI[md5sum] = "0235f6075c32c3be61cff94fa0b9f108"
 SRC_URI[sha256sum] = "ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe2b812f008da27ab8"
diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb b/meta/recipes-graphics/wayland/weston_2.0.0.bb
index 54b07bd6b9..8160f5556d 100644
--- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_2.0.0.bb
@@ -25,7 +25,6 @@ DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
 EXTRA_OECONF = "--enable-setuid-install \
                 --disable-rdp-compositor \
-                WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
                 "
 EXTRA_OECONF_append_qemux86 = "\
 		WESTON_NATIVE_BACKEND=fbdev-backend.so \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 863d80ce43..e8025de55f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -117,7 +117,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --sysconfdir=/etc/X11 \
                  --localstatedir=/var \
                  --with-xkb-output=/var/lib/xkb \
-                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
 "
 
 OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
index 8321da0c27..a83a5bab21 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
@@ -22,5 +22,4 @@ SRC_URI[sha256sum] = "9c2c7edde4f59d74eb414e0701c55131f562e5c605a3ce9b091754f106
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-EXTRA_OECONF += "WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
 
-- 
2.11.0


