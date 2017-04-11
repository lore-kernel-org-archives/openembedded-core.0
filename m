Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id BAEDA77CD8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:12:06 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 8D3D84533C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:12:07 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 10:11:55 +0200
Message-Id: <1491898315-7457-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491898315-7457-1-git-send-email-dv@pseudoterminal.org>
References: <1491898315-7457-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH] gstreamer1.0-plugins-good: Backport patch for v4l2object videometa
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
X-List-Received-Date: Tue, 11 Apr 2017 08:12:07 -0000

This patch ensures videometa is added to mem2mem decoder output in case
the output frames have padding rows/columns

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...Also-add-videometa-if-there-is-padding-to.patch | 31 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.10.4.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
new file mode 100644
index 0000000..c40c866
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
@@ -0,0 +1,31 @@
+From 22be02612adc757f6a43cefc6ee65ecaef68f0d9 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Thu, 23 Mar 2017 22:13:05 +0100
+Subject: [PATCH] v4l2object: Also add videometa if there is padding to the
+ right and bottom
+
+https://bugzilla.gnome.org/show_bug.cgi?id=780478
+---
+ sys/v4l2/gstv4l2object.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index 91c8ff0..ed4654e 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -3070,9 +3070,10 @@ store_info:
+   GST_DEBUG_OBJECT (v4l2object->element, "Got sizeimage %" G_GSIZE_FORMAT,
+       info->size);
+ 
+-  /* to avoid copies we need video meta if top or left padding */
++  /* to avoid copies we need video meta if there is padding */
+   v4l2object->need_video_meta =
+-      ((align->padding_top + align->padding_left) != 0);
++      ((align->padding_top + align->padding_left + align->padding_right +
++          align->padding_bottom) != 0);
+ 
+   /* ... or if stride is non "standard" */
+   if (!standard_stride)
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
index fd5369a..57447bf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+    file://0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch \
 "
 SRC_URI[md5sum] = "cc0cc13cdb07d4237600b6886b81f31d"
 SRC_URI[sha256sum] = "8a86c61434a8c44665365bd0b3557a040937d1f44bf69caee4e9ea816ce74d7e"
-- 
2.7.4


