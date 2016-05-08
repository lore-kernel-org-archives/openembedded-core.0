Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9631A6E668
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 17:33:30 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 4B5F33948A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 19:33:30 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 May 2016 19:33:18 +0200
Message-Id: <1462728798-10477-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gst-player: Remove recipe: gstplayer is part of -bad package since 1.8
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
X-List-Received-Date: Sun, 08 May 2016 17:33:32 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-multimedia/gstreamer/gst-player_git.bb | 39 ----------------------
 1 file changed, 39 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player_git.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
deleted file mode 100644
index 8129169..0000000
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "GStreamer playback helper library and examples"
-LICENSE = "LGPL-2.0+"
-LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
-
-DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+"
-
-SRC_URI = "git://github.com/sdroege/gst-player.git \
-           file://filechooser.patch \
-           file://gtk2.patch \
-           file://Fix-pause-play.patch \
-           file://Add-error-signal-emission-for-missing-plugins.patch \
-           file://gst-player.desktop"
-
-SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
-
-S = "${WORKDIR}/git"
-
-inherit autotools gtk-doc lib_package pkgconfig distro_features_check gobject-introspection
-
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-do_configure_prepend() {
-	touch ${S}/ChangeLog
-}
-
-EXTRA_OECONF += "ac_cv_path_VALGRIND=no ac_cv_path_GDB=no"
-
-do_install_append() {
-	install -m 0644 -D ${WORKDIR}/gst-player.desktop ${D}${datadir}/applications/gst-player.desktop
-}
-
-FILES_${PN}-bin += "${datadir}/applications/*.desktop"
-
-RDEPENDS_${PN}-bin = "gstreamer1.0-plugins-base-playback"
-RRECOMMENDS_${PN}-bin = "gstreamer1.0-plugins-base-meta \
-                         gstreamer1.0-plugins-good-meta \
-                         gstreamer1.0-plugins-bad-meta \
-                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
-                         ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
-- 
2.7.4


