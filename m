Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id C3CC776FED
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 21:48:21 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id A1CA02079D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 23:48:21 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Sep 2015 23:48:07 +0200
Message-Id: <1443390491-23728-3-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 3/7] gstreamer1.0-plugins-good: upgrade to version 1.6.0
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
X-List-Received-Date: Sun, 27 Sep 2015 21:48:24 -0000

decrease_asteriskh263_rank.patch no longer applies, and is obsolete, since
the asteriskh263 rank has been set to NONE in upstream.

Also, --enable-xshm is no longer part of the configure options.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-good.inc        |  7 ++++--
 .../decrease_asteriskh263_rank.patch               | 25 ----------------------
 ...1.4.5.bb => gstreamer1.0-plugins-good_1.6.0.bb} |  8 +++----
 3 files changed, 8 insertions(+), 32 deletions(-)
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.4.5.bb => gstreamer1.0-plugins-good_1.6.0.bb} (67%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 6e316de..1dd750d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -15,8 +15,8 @@ PACKAGECONFIG ??= " \
     "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
-X11ENABLEOPTS = "--enable-x --enable-xshm"
-X11DISABLEOPTS = "--disable-x --disable-xshm"
+X11ENABLEOPTS = "--enable-x"
+X11DISABLEOPTS = "--disable-x"
 PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
@@ -39,6 +39,8 @@ PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
 EXTRA_OECONF += " \
     --enable-oss \
     --enable-gst_v4l2 \
+    --enable-zlib \
+    --enable-bz2 \
     --without-libv4l2 \
     --disable-directsound \
     --disable-waveform \
@@ -47,6 +49,7 @@ EXTRA_OECONF += " \
     --disable-osx_audio \
     --disable-osx_video \
     --disable-aalib \
+    --disable-aalibtest \
     --disable-libcaca \
     --disable-libdv \
     --disable-shout2 \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch
deleted file mode 100755
index 288631b..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-commit d71d74daac8ed54156ed103958ab455c63c72b0e
-Author: Song Bing <b06498@freescale.com>
-Date:   Mon Nov 10 11:25:47 2014 +0800
-
-[asteriskh263] decrease the rank as we havn't this kind of decoder.
-
-Decrease the rank as we havn't this kind of decoder.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=739935
-
-Upstream-Status: Pending
-
-Signed-off-by: Song Bing <b06498@freescale.com>
-
-diff --git a/gst/rtp/gstasteriskh263.c b/gst/rtp/gstasteriskh263.c
-index a01fbc8..8fa3194 100644
---- a/gst/rtp/gstasteriskh263.c
-+++ b/gst/rtp/gstasteriskh263.c
-@@ -226,5 +226,5 @@ gboolean
- gst_asteriskh263_plugin_init (GstPlugin * plugin)
- {
-   return gst_element_register (plugin, "asteriskh263",
--      GST_RANK_SECONDARY, GST_TYPE_ASTERISK_H263);
-+      GST_RANK_SECONDARY - 1, GST_TYPE_ASTERISK_H263);
- }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.0.bb
similarity index 67%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.0.bb
index 943ab60..d4943de 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.0.bb
@@ -4,10 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
-            file://decrease_asteriskh263_rank.patch \
-"
-SRC_URI[md5sum] = "eaf1a6daf73749bc423feac301d60038"
-SRC_URI[sha256sum] = "79b1b5f3f7bcaa8a615202eb5e176121eeb8336960f70687e536ad78dbc7e641"
+SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch"
+SRC_URI[md5sum] = "a28d0d46c929f0064432d2fd94c12ef1"
+SRC_URI[sha256sum] = "a0915639595305e48884656e22b16fda7c6892aa02cdb3eb43e23dab6e6b81fa"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
-- 
1.9.1


