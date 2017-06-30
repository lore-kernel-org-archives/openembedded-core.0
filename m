Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD7D78284
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 14:56:11 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 07:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,286,1496127600"; d="scan'208";a="119424673"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 30 Jun 2017 07:56:13 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 9589D5801BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:56:12 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 17:56:14 +0300
Message-Id: <1498834581-12279-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
References: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 04/11] gstreamer1.0-plugins-base: upgrade 1.10.4 -> 1.12.1
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
X-List-Received-Date: Fri, 30 Jun 2017 14:56:12 -0000

Remove upstreamed patch:
        1. encodebin-Need-more-buffers-in-output-queue-for-bett.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...eed-more-buffers-in-output-queue-for-bett.patch | 32 ----------------------
 ...10.4.bb => gstreamer1.0-plugins-base_1.12.1.bb} |  5 ++--
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.10.4.bb => gstreamer1.0-plugins-base_1.12.1.bb} (78%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
deleted file mode 100644
index 5341e3c..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 540e02c92c75e08b90326863dc787fa5cadf9da6 Mon Sep 17 00:00:00 2001
-From: Song Bing <b06498@freescale.com>
-Date: Fri, 13 Mar 2015 18:04:31 +0800
-Subject: [PATCH] encodebin: Need more buffers in output queue for better
- performance
-
-Need more buffers in output queue for better performance
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=744191]
-
-Signed-off-by: Song Bing <b06498@freescale.com>
----
- gst/encoding/gstencodebin.c |    3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/gst/encoding/gstencodebin.c b/gst/encoding/gstencodebin.c
-index 6728e58..32daae4 100644
---- a/gst/encoding/gstencodebin.c
-+++ b/gst/encoding/gstencodebin.c
-@@ -1228,8 +1228,7 @@ _create_stream_group (GstEncodeBin * ebin, GstEncodingProfile * sprof,
-    * We only use a 1buffer long queue here, the actual queueing will be done
-    * in the input queue */
-   last = sgroup->outqueue = gst_element_factory_make ("queue", NULL);
--  g_object_set (sgroup->outqueue, "max-size-buffers", (guint32) 1,
--      "max-size-bytes", (guint32) 0, "max-size-time", (guint64) 0,
-+  g_object_set (sgroup->outqueue, "max-size-time", (guint64) 0,
-       "silent", TRUE, NULL);
- 
-   gst_bin_add (GST_BIN (ebin), sgroup->outqueue);
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.1.bb
similarity index 78%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.1.bb
index 7c81670..0b2b588 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.1.bb
@@ -9,11 +9,10 @@ SRC_URI = " \
     file://get-caps-from-src-pad-when-query-caps.patch \
     file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
-    file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
     file://make-gio_unix_2_0-dependency-configurable.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "f6b46f8fac01eb773d556e3efc369e86"
-SRC_URI[sha256sum] = "f6d245b6b3d4cb733f81ebb021074c525ece83db0c10e932794b339b8d935eb7"
+SRC_URI[md5sum] = "77d67208ff3750ea6417f0365f655a90"
+SRC_URI[sha256sum] = "0cce9fadb574a840b3c9d31b69faf57aad6c5543c3b134a7b935de866c9e0465"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
2.4.0


