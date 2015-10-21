Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7783E76AE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 08:24:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9L8Nw7g001757
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 01:24:00 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 21 Oct 2015 01:23:57 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Oct 2015 04:23:55 -0400
Message-ID: <1445415835-108738-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] recipes: add distro_features_check for some packages
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
X-List-Received-Date: Wed, 21 Oct 2015 08:24:01 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* The packages that depends on gtk+3 require any of distro features
  from ${GTK3DISTROFEATURES}

* The packages that depends on virtual/egl, virtual/libgl ... require
  distro feature 'opengl'

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-gnome/gcr/gcr_3.16.0.bb                             | 4 +++-
 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb                  | 4 +++-
 meta/recipes-graphics/clutter/clutter-1.0.inc                    | 4 +++-
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc                | 4 +++-
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc                | 6 +++++-
 meta/recipes-graphics/cogl/cogl-1.0.inc                          | 4 +++-
 meta/recipes-graphics/eglinfo/eglinfo.inc                        | 4 +++-
 meta/recipes-graphics/libepoxy/libepoxy_git.bb                   | 4 +++-
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb                   | 4 +++-
 meta/recipes-graphics/mx/mx.inc                                  | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb | 4 +++-
 meta/recipes-graphics/wayland/weston-init.bb                     | 4 +++-
 meta/recipes-graphics/wayland/weston_1.8.0.bb                    | 4 +++-
 13 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.16.0.bb b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
index 4c9fe2e..057c815 100644
--- a/meta/recipes-gnome/gcr/gcr_3.16.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt vala"
 
-inherit autotools gnomebase gtk-icon-cache gtk-doc
+inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check
+# depends on gtk+3
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[archive.md5sum] = "d5835680be0b6a838e02a528d5378d9c"
 SRC_URI[archive.sha256sum] = "ecfe8df41cc88158364bb15addc670b11e539fe844742983629ba2323888d075"
diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
index 41d188c..1a24c10 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "dbus gtk+3 dbus-glib"
 
-inherit gnomebase gtk-doc
+inherit gnomebase gtk-doc distro_features_check
+# depends on gtk+3
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[archive.md5sum] = "a4997019d08f46f3bf57b78e6f795a59"
 SRC_URI[archive.sha256sum] = "0ef61ca400d30e28217979bfa0e73a7406b19c32dd76150654ec5b2bdf47d837"
diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index da21cee..5d0f55c 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -2,7 +2,9 @@ SUMMARY = "Graphics library for creating hardware-accelerated user interfaces"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1+"
 
-inherit clutter ptest-gnome
+inherit clutter ptest-gnome distro_features_check
+# depends on cogl-1.0 which needs opengl
+REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 DEPENDS = "pango glib-2.0 json-glib atk udev cogl-1.0"
 PACKAGE_BEFORE_PN += "${PN}-examples"
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index d4fed71..67c7590 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -2,7 +2,9 @@ SUMMARY = "GStreamer integration library for Clutter"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-inherit clutter
+inherit clutter distro_features_check
+# depends on clutter-1.0 which depends on cogl-1.0
+REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
 
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
index 45898b4..688eed2 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -2,7 +2,11 @@ SUMMARY = "Library for embedding a Clutter canvas in a GTK+ application"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-inherit clutter
+inherit clutter distro_features_check
+# depends on clutter-1.0 which depends on cogl-1.0
+REQUIRED_DISTRO_FEATURES ?= "opengl"
+# depends on gtk+3
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 DEPENDS = "clutter-1.0 gtk+3"
 PACKAGES  =+ "${PN}-examples"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 3da31c8..88d84ea 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -2,7 +2,9 @@ SUMMARY = "Modern 3D graphics API with associated utility APIs"
 HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
 LICENSE = "MIT"
 
-inherit clutter
+inherit clutter distro_features_check
+# cogl-1.0 needs opengl to build
+REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 DEPENDS = "glib-2.0 gdk-pixbuf"
 PACKAGES =+ "${PN}-examples \
diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
index b87688a..fb89175 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo.inc
+++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
@@ -11,7 +11,9 @@ SRCREV = "4b317648ec6cf39556a9e5d8078f605bc0edd5de"
 
 S = "${WORKDIR}/git"
 
-inherit waf
+inherit waf distro_features_check
+# depends on virtual/egl
+REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 # BSP layers should add .bbappend files for the -x11 and -fb .bb recipes, which
 # append the respective EGL/OpenGLES/OpenVG libraries to DEPENDS and set
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_git.bb b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
index ad17293..6c247cc 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
@@ -17,7 +17,9 @@ PV = "1.3.1"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/egl
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS = "util-macros virtual/egl"
 
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
index e451642..2af1c9e 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
@@ -23,7 +23,9 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "72613a2c8c013716db02e3ff59d29061"
 SRC_URI[sha256sum] = "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f90ba92"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/egl, virtual/libgl ...
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glew glu', '', d)}"
diff --git a/meta/recipes-graphics/mx/mx.inc b/meta/recipes-graphics/mx/mx.inc
index ee7f186..aa4915d 100644
--- a/meta/recipes-graphics/mx/mx.inc
+++ b/meta/recipes-graphics/mx/mx.inc
@@ -1,7 +1,9 @@
 SUMMARY = "Clutter based UI widget library"
 LICENSE = "LGPLv2.1"
 
-inherit clutter autotools-brokensep
+inherit clutter autotools-brokensep distro_features_check
+# depends on clutter-1.0 which depends on cogl-1.0
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS = "clutter-1.0 dbus-glib gdk-pixbuf"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index 9d67e5f..5734b27 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -7,7 +7,9 @@ LICENSE = "MIT"
 
 PR = "r6"
 
-inherit packagegroup
+inherit packagegroup distro_features_check
+# rdepends on clutter-*
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 PACKAGES = "\
     ${PN}-core \
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 38b78bc..fc2e4f8 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -11,7 +11,9 @@ do_install() {
 	install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 }
 
-inherit allarch update-rc.d
+inherit allarch update-rc.d distro_features_check
+# rdepends on weston which depends on virtual/egl
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 RDEPENDS_${PN} = "weston kbd"
 
diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index 342c604..95cf495 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -16,7 +16,9 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "24cb8a7ed0535b4fc3642643988dab36"
 SRC_URI[sha256sum] = "8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada5ad312"
 
-inherit autotools pkgconfig useradd
+inherit autotools pkgconfig useradd distro_features_check
+# depends on virtual/egl
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland libinput virtual/egl pango"
-- 
1.9.1


