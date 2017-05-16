Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF8877D46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 11:26:24 +0000 (UTC)
Received: from soylentgreen.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 9109E46E59
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:26:24 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 13:26:12 +0200
Message-Id: <1494933979-5139-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 2/9] gstreamer1.0-plugins-base: upgrade to version 1.12.0
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

* Removed encodebin patch since it has been merged

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...eed-more-buffers-in-output-queue-for-bett.patch | 32 ----------------------
 ...10.4.bb => gstreamer1.0-plugins-base_1.12.0.bb} |  5 ++--
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.10.4.bb => gstreamer1.0-plugins-base_1.12.0.bb} (78%)

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.0.bb
similarity index 78%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.0.bb
index 7c81670..637ea3e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.0.bb
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
+SRC_URI[md5sum] = "f34fc5630f9db0db53172fcf3b955e01"
+SRC_URI[sha256sum] = "345fc6877f54b8b6e97aacf2996be37a51a0e369f53fc2cf83108af9f764364d"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
2.7.4


