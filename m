Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0091978290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 14:56:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 07:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,286,1496127600"; d="scan'208";a="280669529"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 30 Jun 2017 07:56:14 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 8FD0B5801BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:56:13 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 17:56:15 +0300
Message-Id: <1498834581-12279-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
References: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 05/11] gstreamer1.0-plugins-good: upgrade 1.10.4 -> 1.12.1
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
X-List-Received-Date: Fri, 30 Jun 2017 14:56:13 -0000

Remove backported patch:
        1.0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...Also-add-videometa-if-there-is-padding-to.patch | 35 ----------------------
 ...10.4.bb => gstreamer1.0-plugins-good_1.12.1.bb} |  5 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.10.4.bb => gstreamer1.0-plugins-good_1.12.1.bb} (78%)

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.1.bb
similarity index 78%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.1.bb
index 57447bf..8665d7b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.1.bb
@@ -10,9 +10,8 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-    file://0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch \
 "
-SRC_URI[md5sum] = "cc0cc13cdb07d4237600b6886b81f31d"
-SRC_URI[sha256sum] = "8a86c61434a8c44665365bd0b3557a040937d1f44bf69caee4e9ea816ce74d7e"
+SRC_URI[md5sum] = "53647e9fe9446f2ad808d55fcdf85b6e"
+SRC_URI[sha256sum] = "121e8e46a7f0e622f09ec9be012607b89d737dd72d48b0f2f0680821ae2cf54b"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
-- 
2.4.0


