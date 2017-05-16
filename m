Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 19C2177D42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 11:26:24 +0000 (UTC)
Received: from soylentgreen.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 56FA146E5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:26:25 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 13:26:13 +0200
Message-Id: <1494933979-5139-3-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 3/9] gstreamer1.0-plugins-good: upgrade to version 1.12.0
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
X-List-Received-Date: Tue, 16 May 2017 11:26:25 -0000

* Removed backported v4l2object patch since it is no longer needed

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...Also-add-videometa-if-there-is-padding-to.patch | 35 ----------------------
 ...10.4.bb => gstreamer1.0-plugins-good_1.12.0.bb} |  5 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.10.4.bb => gstreamer1.0-plugins-good_1.12.0.bb} (78%)

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.0.bb
similarity index 78%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.0.bb
index 57447bf..42dd706 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.0.bb
@@ -10,9 +10,8 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-    file://0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch \
 "
-SRC_URI[md5sum] = "cc0cc13cdb07d4237600b6886b81f31d"
-SRC_URI[sha256sum] = "8a86c61434a8c44665365bd0b3557a040937d1f44bf69caee4e9ea816ce74d7e"
+SRC_URI[md5sum] = "9294b22ddab3bec373cbc5e84ff4c084"
+SRC_URI[sha256sum] = "8a1d734db7338e00c28b794a7f0a5a9e67d1c5c8b0074075b50638207d372ebc"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
-- 
2.7.4


