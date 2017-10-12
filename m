Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA7A78244
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 14:54:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Oct 2017 07:54:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,366,1503385200"; d="scan'208";a="322496265"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2017 07:54:58 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 17:51:16 +0300
Message-Id: <74a8c0b54cb758a5efe17b8825c18e4ab45963cd.1507819701.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507819700.git.alexander.kanavin@linux.intel.com>
References: <cover.1507819700.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/7] gst-player: Upgrade, rename to gst-examples
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
X-List-Received-Date: Thu, 12 Oct 2017 14:54:57 -0000

From: Jussi Kukkonen <jussi.kukkonen@intel.com>

Switch to using current repository, switch to meson (following
upstream), rename the recipe like upstream.

Add a patch to install the player binaries.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../packagegroup-core-tools-testapps.bb            |  2 +-
 .../0001-Make-player-examples-installable.patch    | 39 ++++++++++++++++++++++
 .../gst-player.desktop                             |  0
 .../{gst-player_git.bb => gst-examples_git.bb}     | 18 +++++-----
 .../packagegroups/packagegroup-core-x11-sato.bb    |  2 +-
 5 files changed, 49 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
 rename meta/recipes-multimedia/gstreamer/{gst-player => gst-examples}/gst-player.desktop (100%)
 rename meta/recipes-multimedia/gstreamer/{gst-player_git.bb => gst-examples_git.bb} (65%)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 317097854f2..3cf84c56ed7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -25,7 +25,7 @@ X11GLTOOLS = "\
 
 X11TOOLS = "\
     fstests \
-    gst-player \
+    gst-examples \
     x11perf \
     xrestop \
     xwininfo \
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
new file mode 100644
index 00000000000..0338bad1c03
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -0,0 +1,39 @@
+From 755f6dab07565aca7b6aefacad8be65de364ff75 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 17 Aug 2017 11:07:02 +0300
+Subject: [PATCH] Make player examples installable
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Denied [Upstream considers these code examples, for now a least]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=777827
+---
+ playback/player/gst-play/meson.build | 1 +
+ playback/player/gtk/meson.build      | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/playback/player/gst-play/meson.build b/playback/player/gst-play/meson.build
+index 719b55b..a56fe13 100644
+--- a/playback/player/gst-play/meson.build
++++ b/playback/player/gst-play/meson.build
+@@ -8,5 +8,6 @@ executable('gst-play',
+     ['gst-play.c',
+      'gst-play-kb.c',
+      'gst-play-kb.h'],
++    install: true,
+     dependencies : [gst_dep, gstplayer_dep, m_dep])
+ 
+diff --git a/playback/player/gtk/meson.build b/playback/player/gtk/meson.build
+index 08aae4f..671a65d 100644
+--- a/playback/player/gtk/meson.build
++++ b/playback/player/gtk/meson.build
+@@ -18,5 +18,6 @@ executable('gtk-play',
+       gtk_play_resources,
+      'gtk-video-renderer.h',
+      'gtk-video-renderer.c'],
++    install: true,
+     dependencies : [glib_dep, gobject_dep, gmodule_dep, gst_dep, gsttag_dep, gstplayer_dep, gtk_dep, x11_dep])
+ 
+-- 
+2.13.3
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop b/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop
rename to meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
similarity index 65%
rename from meta/recipes-multimedia/gstreamer/gst-player_git.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_git.bb
index 4fe8fdef4a2..a3acf9cafa9 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
@@ -1,25 +1,23 @@
-SUMMARY = "GStreamer playback helper library and examples"
+SUMMARY = "GStreamer examples (including gtk-play, gst-play)"
 LICENSE = "LGPL-2.0+"
-LIC_FILES_CHKSUM = "file://gtk/gtk-play.c;beginline=1;endline=20;md5=f8c72dae3d36823ec716a9ebcae593b9"
+LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20;md5=f8c72dae3d36823ec716a9ebcae593b9"
 
 DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 glib-2.0-native"
 
-SRC_URI = "git://github.com/sdroege/gst-player.git \
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-examples \
+           file://0001-Make-player-examples-installable.patch \
            file://gst-player.desktop"
 
-SRCREV = "ee3c226c82767a089743e4e06058743e67f73cdb"
+SRCREV = "e88c04ff34cf56984e62a524a0bcc16ab51b282d"
 PV = "0.0.1+git${SRCPV}"
 UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig distro_features_check
+inherit meson pkgconfig distro_features_check
 
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-do_configure_prepend() {
-	touch ${S}/ChangeLog
-}
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 do_install_append() {
 	install -m 0644 -D ${WORKDIR}/gst-player.desktop ${D}${datadir}/applications/gst-player.desktop
@@ -31,4 +29,4 @@ RRECOMMENDS_${PN} = "gstreamer1.0-plugins-base-meta \
                      gstreamer1.0-plugins-bad-meta \
                       ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
                      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
-RPROVIDES_${PN} += "${PN}-bin"
+RPROVIDES_${PN} += "gst-player gst-player-bin"
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 97cced7cc34..224428ddda5 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -46,7 +46,7 @@ WEB ?= ""
 SUMMARY_${PN}-apps = "Sato desktop - applications"
 RDEPENDS_${PN}-apps = "\
     l3afpad \
-    gst-player \
+    gst-examples \
     matchbox-terminal \
     sato-screenshot \
     ${FILEMANAGER} \
-- 
2.14.1


