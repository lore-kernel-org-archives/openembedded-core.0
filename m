Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 47383785D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:28:28 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id C4E5A4CB57
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 23:28:29 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 23:28:13 +0200
Message-Id: <1502486900-16180-4-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502486900-16180-1-git-send-email-dv@pseudoterminal.org>
References: <1502486900-16180-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 03/10] gstreamer1.0-plugins-good: upgrade to version 1.12.2
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
X-List-Received-Date: Fri, 11 Aug 2017 21:28:29 -0000

From: Maxin John <maxin.john@intel.com>

* Remove backported patch:
  1. 0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch

* Added RPROVIDES to handle the renamed plugins (oss4 is not enabled):
  1. libgstpulse -> libgstpulseaudio
  2. libgstsouphttpsrc -> libgstsoup

* Updated gstreamer1.0-meta-base to include this change:
  1.gstsouphttpsrc plugin was renamed to gstsoup

Signed-off-by: Maxin B. John <maxin.john@intel.com>
Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-meta-base.bb            |  2 +-
 ...Also-add-videometa-if-there-is-padding-to.patch | 35 ----------------------
 ...10.4.bb => gstreamer1.0-plugins-good_1.12.2.bb} |  8 +++--
 3 files changed, 6 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.10.4.bb => gstreamer1.0-plugins-good_1.12.2.bb} (77%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
index c542b13..016e176 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -37,7 +37,7 @@ RDEPENDS_gstreamer1.0-meta-base = "\
     gstreamer1.0-plugins-base-videoscale \
     gstreamer1.0-plugins-base-videoconvert \
     gstreamer1.0-plugins-good-autodetect \
-    gstreamer1.0-plugins-good-souphttpsrc"
+    gstreamer1.0-plugins-good-soup"
 
 RRECOMMENDS_gstreamer1.0-meta-x11-base = "\
     gstreamer1.0-plugins-base-ximagesink \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
deleted file mode 100644
index 2a9a23e..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 22be02612adc757f6a43cefc6ee65ecaef68f0d9 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Thu, 23 Mar 2017 22:13:05 +0100
-Subject: [PATCH] v4l2object: Also add videometa if there is padding to the
- right and bottom
-
-https://bugzilla.gnome.org/show_bug.cgi?id=780478
-
-Upstream-Status: Backport [1.10.5]
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- sys/v4l2/gstv4l2object.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
-index 91c8ff0..ed4654e 100644
---- a/sys/v4l2/gstv4l2object.c
-+++ b/sys/v4l2/gstv4l2object.c
-@@ -3070,9 +3070,10 @@ store_info:
-   GST_DEBUG_OBJECT (v4l2object->element, "Got sizeimage %" G_GSIZE_FORMAT,
-       info->size);
- 
--  /* to avoid copies we need video meta if top or left padding */
-+  /* to avoid copies we need video meta if there is padding */
-   v4l2object->need_video_meta =
--      ((align->padding_top + align->padding_left) != 0);
-+      ((align->padding_top + align->padding_left + align->padding_right +
-+          align->padding_bottom) != 0);
- 
-   /* ... or if stride is non "standard" */
-   if (!standard_stride)
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bb
similarity index 77%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bb
index 57447bf..3d38f00 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bb
@@ -10,9 +10,11 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-    file://0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch \
 "
-SRC_URI[md5sum] = "cc0cc13cdb07d4237600b6886b81f31d"
-SRC_URI[sha256sum] = "8a86c61434a8c44665365bd0b3557a040937d1f44bf69caee4e9ea816ce74d7e"
+SRC_URI[md5sum] = "20254217d9805484532e08ff1c3aa296"
+SRC_URI[sha256sum] = "5591ee7208ab30289a30658a82b76bf87169c927572d9b794f3a41ed48e1ee96"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
+
+RPROVIDES_${PN}-pulseaudio += "${PN}-pulse"
+RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
-- 
2.7.4


