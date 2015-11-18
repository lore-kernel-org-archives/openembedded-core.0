Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1C66E5CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:52:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 Nov 2015 01:51:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,312,1444719600"; d="scan'208";a="853512417"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 18 Nov 2015 01:51:54 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 11:52:30 +0200
Message-Id: <6d3732fbc9c3ddd892ec8cdbd4b730d93214d006.1447840091.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
References: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
References: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/8] package_regex.inc: split entries with odd-even versioning into their own recipes
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
X-List-Received-Date: Wed, 18 Nov 2015 09:52:00 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/upstream-version-is-even.bbclass      |  5 +++
 meta/conf/distro/include/package_regex.inc         | 50 ----------------------
 meta/recipes-core/dbus/dbus-test_1.8.20.bb         |  2 +-
 meta/recipes-core/dbus/dbus.inc                    |  2 +-
 meta/recipes-core/glib-2.0/glib.inc                |  2 +-
 .../glib-networking/glib-networking_2.44.0.bb      |  2 +-
 meta/recipes-devtools/perl/perl.inc                |  2 +
 meta/recipes-devtools/vala/vala.inc                |  2 +-
 meta/recipes-gnome/epiphany/epiphany_3.16.3.bb     |  2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |  2 +-
 .../gnome-desktop/gnome-desktop3_3.16.2.bb         |  2 +-
 .../gnome/adwaita-icon-theme_3.16.2.1.bb           |  2 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |  4 ++
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  2 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |  4 ++
 meta/recipes-gnome/librsvg/librsvg_2.40.10.bb      |  2 +-
 meta/recipes-graphics/clutter/clutter-1.0.inc      |  2 +-
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |  2 +-
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  |  2 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |  2 +-
 meta/recipes-graphics/pango/pango.inc              |  2 +-
 .../gstreamer/gstreamer1.0-libav.inc               |  2 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |  2 +-
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |  2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  2 +-
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        |  2 +-
 meta/recipes-support/atk/at-spi2-atk_2.16.0.bb     |  2 +-
 meta/recipes-support/atk/at-spi2-core_2.16.0.bb    |  2 +-
 meta/recipes-support/atk/atk_2.16.0.bb             |  2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb |  2 +-
 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb     |  2 +-
 meta/recipes-support/vte/vte.inc                   |  2 +-
 32 files changed, 42 insertions(+), 77 deletions(-)
 create mode 100644 meta/classes/upstream-version-is-even.bbclass

diff --git a/meta/classes/upstream-version-is-even.bbclass b/meta/classes/upstream-version-is-even.bbclass
new file mode 100644
index 0000000..21d844e
--- /dev/null
+++ b/meta/classes/upstream-version-is-even.bbclass
@@ -0,0 +1,5 @@
+# This class ensures that the upstream version check only 
+# accepts even minor versions (i.e. 3.0.x, 3.2.x, 3.4.x, etc.)
+# This scheme is used by Gnome and a number of other projects
+# to signify stable releases vs development releases.
+REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index 0035586..2216b41 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -208,56 +208,6 @@ GITTAGREGEX_pn-xinetd = "xinetd-(?P<pver>(?!20030122).+)"
 # Blacklist debian-specific tags
 GITTAGREGEX_pn-xf86-video-omapfb = "(?P<pver>\d+(\.\d+)+)(?!-)"
 
-# GNOME related.
-#
-# GNOME2_STABLE picks stable releases in the 2.x series (so not 2.90 onwards,
-# which were GNOME 3 betas.
-#
-# GNOME_STABLE picks the latest stable release.
-
-GNOME2_STABLE = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
-GNOME_STABLE = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
-
-REGEX_pn-glib-2.0 = "${GNOME_STABLE}"
-REGEX_pn-atk = "${GNOME_STABLE}"
-REGEX_pn-at-spi2-core = "${GNOME_STABLE}"
-REGEX_pn-at-spi2-atk = "${GNOME_STABLE}"
-REGEX_pn-gdk-pixbuf = "${GNOME_STABLE}"
-REGEX_pn-pango = "${GNOME_STABLE}"
-REGEX_pn-gtk+ = "${GNOME2_STABLE}"
-REGEX_pn-gtk+3 = "${GNOME_STABLE}"
-REGEX_pn-gtk-engines = "${GNOME2_STABLE}"
-REGEX_pn-glib-networking = "${GNOME_STABLE}"
-REGEX_pn-librsvg = "${GNOME_STABLE}"
-REGEX_pn-libsoup-2.4 = "${GNOME_STABLE}"
-REGEX_pn-vala = "${GNOME_STABLE}"
-REGEX_pn-clutter-1.0 = "${GNOME_STABLE}"
-REGEX_pn-clutter-gtk-1.0 = "${GNOME_STABLE}"
-REGEX_pn-clutter-gst-3.0 = "${GNOME_STABLE}"
-REGEX_pn-cogl-1.0 = "${GNOME_STABLE}"
-REGEX_pn-adwaita-icon-theme = "${GNOME_STABLE}"
-REGEX_pn-vte = "${GNOME_STABLE}"
-REGEX_pn-epiphany = "${GNOME_STABLE}"
-REGEX_pn-webkitgtk = "${GNOME_STABLE}"
-REGEX_pn-p11-kit = "${GNOME_STABLE}"
-REGEX_pn-gnome-desktop3 = "${GNOME_STABLE}"
-
-# not GNOME related but uses same even-minor-release-is-stable logic
-REGEX_pn-dbus = "${GNOME_STABLE}"
-REGEX_pn-dbus-test = "${GNOME_STABLE}"
-
-# same logic applies to gstreamer releases
-REGEX_pn-gstreamer1.0 = "${GNOME_STABLE}"
-REGEX_pn-gstreamer1.0-libav = "${GNOME_STABLE}"
-REGEX_pn-gstreamer1.0-plugins-bad = "${GNOME_STABLE}"
-REGEX_pn-gstreamer1.0-plugins-base = "${GNOME_STABLE}"
-REGEX_pn-gstreamer1.0-plugins-good = "${GNOME_STABLE}"
-REGEX_pn-gstreamer1.0-plugins-ugly = "${GNOME_STABLE}"
-REGEX_pn-gstreamer1.0-rtsp-server = "${GNOME_STABLE}"
-
-# and perl
-REGEX_pn-perl = "${GNOME_STABLE}"
-
 # Keep old gcc versions at their major versions
 REGEX_pn-gcc-source-4.9.3 = "gcc-(?P<pver>4\.9\.\d+).tar"
 REGEX_pn-gcc-source-4.8.4 = "gcc-(?P<pver>4\.8\.\d+).tar"
diff --git a/meta/recipes-core/dbus/dbus-test_1.8.20.bb b/meta/recipes-core/dbus/dbus-test_1.8.20.bb
index 704070b..f5400a0 100644
--- a/meta/recipes-core/dbus/dbus-test_1.8.20.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.8.20.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
 
-inherit autotools pkgconfig gettext ptest
+inherit autotools pkgconfig gettext ptest upstream-version-is-even
 
 EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
 EXTRA_OECONF_X_class-native = "--without-x"
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 3971081..afb5a71 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -19,7 +19,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-inherit useradd autotools pkgconfig gettext update-rc.d
+inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
 INITSCRIPT_NAME = "dbus-1"
 INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 072f790..ef08627 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -27,7 +27,7 @@ PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 LEAD_SONAME = "libglib-2.0.*"
 FILES_${PN}-utils = "${bindir}/* ${datadir}/glib-2.0/gettext"
 
-inherit autotools gettext gtk-doc pkgconfig ptest-gnome
+inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even
 
 S = "${WORKDIR}/glib-${PV}"
 
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb
index 4f91b76..269cb31 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG[pkcs11] = "--with-pkcs11,--without-pkcs11,p11-kit"
 
 EXTRA_OECONF = "--without-gnome-proxy"
 
-inherit gnomebase gettext
+inherit gnomebase gettext upstream-version-is-even
 
 FILES_${PN} += "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-1/services/"
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/"
diff --git a/meta/recipes-devtools/perl/perl.inc b/meta/recipes-devtools/perl/perl.inc
index 0d9716c..3313a94 100644
--- a/meta/recipes-devtools/perl/perl.inc
+++ b/meta/recipes-devtools/perl/perl.inc
@@ -6,3 +6,5 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
 		    file://Artistic;md5=2e6fd2475335af892494fe1f7327baf3"
 
 SRC_URI = "http://www.cpan.org/src/5.0/${BP}.tar.xz"
+
+inherit upstream-version-is-even
diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 63056fd..c98244b 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
-inherit autotools pkgconfig
+inherit autotools pkgconfig upstream-version-is-even
 
 FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
 FILES_${PN}-doc += "${datadir}/devhelp"
diff --git a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
index c3745c0..3ff35fc 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \
 	   gsettings-desktop-schemas gnome-desktop3"
 
-inherit gnomebase gsettings distro_features_check
+inherit gnomebase gsettings distro_features_check upstream-version-is-even
 # libwnck3 is x11 only
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
index 68f3850..4895d5d 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "4fed0d54432f1b69fc6e66e608bd5542"
 SRC_URI[sha256sum] = "4853830616113db4435837992c0aebd94cbb993c44dc55063cee7f72a7bef8be"
 
-inherit autotools pkgconfig gettext pixbufcache ptest-gnome
+inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even
 
 LIBV = "2.10.0"
 
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
index 3765697..43546ce 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 BPN = "gnome-desktop"
 
-inherit gnome pkgconfig
+inherit gnome pkgconfig upstream-version-is-even
 SRC_URI[archive.md5sum] = "ab5bf4cc94ad63639f42adcc1542b1f0"
 SRC_URI[archive.sha256sum] = "3a8f196b46eb9dbd3ba2afb8fb5fef6a8825539d449a02181311242e22227bd0"
 
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb
index 0d7fa0c..265aabc 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb
@@ -6,7 +6,7 @@ SECTION = "x11/gnome"
 LICENSE = "LGPL-3.0 | CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c"
 
-inherit allarch autotools pkgconfig gettext gtk-icon-cache
+inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even
 
 DEPENDS += "intltool-native"
 
diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index a197b9d..35aa10f 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -13,6 +13,10 @@ SECTION = "libs"
 inherit distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
+# This picks stable releases in the 2.x series (but not 2.90 onwards,
+# which were GNOME 3 betas).
+REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
+
 X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
  cairo gdk-pixbuf"
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index e0c4ccb..7f3916b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
-inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check
+inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check upstream-version-is-even
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # This should be in autotools.bbclass, but until something elses uses it putting
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 7c3a87e..8c265da 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -37,6 +37,10 @@ GNOME_COMPRESS_TYPE="bz2"
 inherit distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
+# This picks stable releases in the 2.x series (but not 2.90 onwards,
+# which were GNOME 3 betas).
+REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
+
 python populate_packages_prepend() {
     engines_root = os.path.join(d.getVar('libdir', True), "gtk-2.0/2.10.0/engines")
     themes_root = os.path.join(d.getVar('datadir', True), "themes")
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
index 06552c2..c04ef3e 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
@@ -10,7 +10,7 @@ SECTION = "x11/utils"
 DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
 BBCLASSEXTEND = "native"
 
-inherit autotools pkgconfig gnomebase gtk-doc pixbufcache
+inherit autotools pkgconfig gnomebase gtk-doc pixbufcache upstream-version-is-even
 
 SRC_URI += "file://gtk-option.patch"
 
diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 5d0f55c..7b115aa 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Graphics library for creating hardware-accelerated user interfaces"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1+"
 
-inherit clutter ptest-gnome distro_features_check
+inherit clutter ptest-gnome distro_features_check upstream-version-is-even
 # depends on cogl-1.0 which needs opengl
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index 67c7590..5aeeac6 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "GStreamer integration library for Clutter"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-inherit clutter distro_features_check
+inherit clutter distro_features_check upstream-version-is-even
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
index 688eed2..b07d3b9 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Library for embedding a Clutter canvas in a GTK+ application"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-inherit clutter distro_features_check
+inherit clutter distro_features_check upstream-version-is-even
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 # depends on gtk+3
diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 88d84ea..b56bfec 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -2,7 +2,7 @@ SUMMARY = "Modern 3D graphics API with associated utility APIs"
 HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
 LICENSE = "MIT"
 
-inherit clutter distro_features_check
+inherit clutter distro_features_check upstream-version-is-even
 # cogl-1.0 needs opengl to build
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index df0fdf6..d40ee98 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -25,7 +25,7 @@ PACKAGES_DYNAMIC += "^pango-module-.*"
 
 RRECOMMENDS_${PN} = "pango-module-basic-fc"
 
-inherit gnomebase gtk-doc qemu ptest
+inherit gnomebase gtk-doc qemu ptest upstream-version-is-even
 
 # Create a pango-modules package
 ALLOW_EMPTY_${BPN}-modules = "1"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index 5d86205..664c5d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -5,7 +5,7 @@ LICENSE_FLAGS = "commercial"
 HOMEPAGE = "http://www.gstreamer.net/"
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2 xz"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig upstream-version-is-even
 
 # CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
 # compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index f1783b7..58c0bbb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -4,7 +4,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 DEPENDS = "gstreamer1.0"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig upstream-version-is-even
 
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
 GSTREAMER_1_0_GIT_BRANCH ?= "master"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 28a9420..65b4876 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -10,5 +10,5 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-inherit autotools pkgconfig 
+inherit autotools pkgconfig upstream-version-is-even
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index aa95d57..ee8c696 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -7,7 +7,7 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2+"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native libcap"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext upstream-version-is-even
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[check] = "--enable-check,--disable-check"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index 68634a9..221ba17 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -19,7 +19,7 @@ SRC_URI = "\
 SRC_URI[md5sum] = "df79991848a5096d3a75289ebce547ae"
 SRC_URI[sha256sum] = "3d1f0c534935f43fd74df90f2648fcee672d60f1f57a30fa557a77891ae04d20"
 
-inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check
+inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check upstream-version-is-even
 
 # depends on libxt
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb
index 7d95fdb..29b83d7 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "78efc45ec36383bf785f8636e64a8d866defeb020e00a08f92978f1fc3
 
 DEPENDS = "dbus glib-2.0 atk at-spi2-core"
 
-inherit autotools pkgconfig distro_features_check
+inherit autotools pkgconfig distro_features_check upstream-version-is-even
 
 # The at-spi2-core requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-support/atk/at-spi2-core_2.16.0.bb b/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
index 7c12b54..624d154 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "1c0b77fb8ce81abbf1d80c0afee9858b3f9229f673b7881995fe0fc16b
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native gettext-native"
 
-inherit autotools gtk-doc pkgconfig distro_features_check
+inherit autotools gtk-doc pkgconfig distro_features_check upstream-version-is-even
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta/recipes-support/atk/atk_2.16.0.bb b/meta/recipes-support/atk/atk_2.16.0.bb
index 0f8f9b5..a60a200 100644
--- a/meta/recipes-support/atk/atk_2.16.0.bb
+++ b/meta/recipes-support/atk/atk_2.16.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 DEPENDS = "glib-2.0"
 
-inherit gnomebase gtk-doc
+inherit gnomebase gtk-doc upstream-version-is-even
 
 SRC_URI[archive.md5sum] = "c7c5002bd6e58b4723a165f1bf312116"
 SRC_URI[archive.sha256sum] = "095f986060a6a0b22eb15eef84ae9f14a1cf8082488faa6886d94c37438ae562"
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb
index 044db31..4eb07ac 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "1e01365ac4af3817187ea847f9d3588c27eee01fc519a5a7cb212bb78b
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig upstream-version-is-even
 
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS_${PN} = "glib-networking"
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
index ee77951..8f15894 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig upstream-version-is-even
 
 DEPENDS = "libtasn1 libffi"
 
diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 07b9e10..94f9587 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.0"
 DEPENDS = " glib-2.0 gtk+ intltool-native ncurses gobject-introspection-stub"
 RDEPENDS_libvte = "vte-termcap"
 
-inherit gnome gtk-doc distro_features_check
+inherit gnome gtk-doc distro_features_check upstream-version-is-even
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
 EXTRA_OECONF = "--disable-python --disable-introspection"
-- 
2.1.4


