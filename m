Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 77578783A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 09:01:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id 042E4265A55
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 10:51:16 +0200
Message-Id: <20170922085118.12000-2-fabien.lahoudere@collabora.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170922085118.12000-1-fabien.lahoudere@collabora.co.uk>
References: <20170922085118.12000-1-fabien.lahoudere@collabora.co.uk>
Subject: [PATCH 2/4] wayland-protocols: Fix installation patch issue
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
X-List-Received-Date: Fri, 22 Sep 2017 09:01:08 -0000

This patch also remove workaround to find wayland-protocols:

WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}

in:

- gtk+3
- libsdl2
- xserver-xorg
- gstreamer1.0-plugins-bad

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  1 -
 meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |  2 +-
 .../usesysrootprefixforpkgdatadirvariable.patch    | 27 ++++++++++++++++++++++
 .../wayland/wayland-protocols_1.10.bb              |  1 +
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  1 -
 .../gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb   |  1 -
 6 files changed, 29 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch

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
 
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
index 12d3aaf6f0..6bfa13200b 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
@@ -35,7 +35,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --enable-pthreads \
                 --enable-sdl-dlopen \
                 --disable-rpath \
-                WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
+                "
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
diff --git a/meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch b/meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch
new file mode 100644
index 0000000000..e0d63448d6
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
+Reviewed-by: Daniel Stone <daniels@collabora.com>
+
+Upstream-status: Backport [https://cgit.freedesktop.org/wayland/wayland-protocols/commit/?id=875130ee3cbcf62266901ef4b91b9a0fb6adad43]
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


