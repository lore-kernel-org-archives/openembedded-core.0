Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9784173D46
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 08:32:21 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id A8B45239A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 09:32:18 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 09:32:08 +0100
Message-Id: <1446712332-17113-3-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1446712332-17113-1-git-send-email-dv@pseudoterminal.org>
References: <1446712332-17113-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 3/7] gstreamer1.0-plugins-good: upgrade to version 1.6.1
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
X-List-Received-Date: Thu, 05 Nov 2015 08:32:23 -0000

decrease_asteriskh263_rank.patch no longer applies, and is obsolete, since
the asteriskh263 rank has been set to NONE in upstream.

Also, --enable-xshm is no longer part of the configure options.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-good.inc        | 13 +++++------
 .../decrease_asteriskh263_rank.patch               | 25 ----------------------
 ...1.4.5.bb => gstreamer1.0-plugins-good_1.6.1.bb} |  8 +++----
 3 files changed, 8 insertions(+), 38 deletions(-)
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.4.5.bb => gstreamer1.0-plugins-good_1.6.1.bb} (67%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 6e316de..1119e10 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -15,9 +15,7 @@ PACKAGECONFIG ??= " \
     "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
-X11ENABLEOPTS = "--enable-x --enable-xshm"
-X11DISABLEOPTS = "--disable-x --disable-xshm"
-PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
+PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
 PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
@@ -31,14 +29,13 @@ PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
-
-# the 1394 plugins require both libraw1394 and libiec61883
-# the former is included in meta-oe, the latter isn't
-# -> disabled
+PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
 
 EXTRA_OECONF += " \
     --enable-oss \
     --enable-gst_v4l2 \
+    --enable-zlib \
+    --enable-bz2 \
     --without-libv4l2 \
     --disable-directsound \
     --disable-waveform \
@@ -47,11 +44,11 @@ EXTRA_OECONF += " \
     --disable-osx_audio \
     --disable-osx_video \
     --disable-aalib \
+    --disable-aalibtest \
     --disable-libcaca \
     --disable-libdv \
     --disable-shout2 \
     --disable-examples \
-    --disable-dv1394 \
 "
 
 FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.1.bb
similarity index 67%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.1.bb
index 943ab60..2b7ec7a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.1.bb
@@ -4,10 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
-            file://decrease_asteriskh263_rank.patch \
-"
-SRC_URI[md5sum] = "eaf1a6daf73749bc423feac301d60038"
-SRC_URI[sha256sum] = "79b1b5f3f7bcaa8a615202eb5e176121eeb8336960f70687e536ad78dbc7e641"
+SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch"
+SRC_URI[md5sum] = "a930f5ff133f17baf39d2876628b7890"
+SRC_URI[sha256sum] = "86d4b814099f7b7b16be19d4b94fa41002ac01fdf1525b07c5764d54c0605935"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
-- 
2.5.0


