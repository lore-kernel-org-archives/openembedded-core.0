Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F158E7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:28:53 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.66265.1735579731768551539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=m2FSfEZ9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202412301728491aaa4122c876ad3d79-yn98ew@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412301728491aaa4122c876ad3d79
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:28:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WFSXlf1yeffjp5rIPH86rw4pIRmXXWrONS8xdcNj/Kc=;
 b=m2FSfEZ9VZWU49mKQ+iT6asGnfOyLtnthAKtKaG55t9zyVylnq0UbIwRiIKbo32qbQNS1l
 SfUZ2yI/s3PaRudupkvnGIFH09gFevXWT3Frp2jqEsMSTdw1Uzxmesnba3W2raWx6+Syyyhz
 FyOnLF5FuO+HWNxUNgwQXR+A15JU7p5yAg5T8WjkmGcISc1IRPajOK4xDkcdTYUx6fte9dRg
 BgyKog5D3MQCUlscUcSLdC0V+9l7m/NvePnmdflU4PdmZcMNgldpsec32hsO9ejUDX+dAMIQ
 VZg+0z3ht9waQ/MsgQO/qbPzZOeOuiQ5Wi1geWBZ8EHYQ0PCnNupznEw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 08/16] gstreamer1.0-plugins-base: patch CVE-2024-47542
Date: Mon, 30 Dec 2024 18:27:15 +0100
Message-Id: <20241230172723.3644270-8-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209172

From: Peter Marko <peter.marko@siemens.com>

Pick commits from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8033

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...parsing-extended-header-if-not-enoug.patch | 64 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch
new file mode 100644
index 00000000000..4b514ff8752
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch
@@ -0,0 +1,64 @@
+From 537161868f36048571f400648ac7909f26c73d53 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 13:43:06 +0300
+Subject: [PATCH] id3v2: Don't try parsing extended header if not enough data
+ is available
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-235
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3842
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8033>
+
+CVE: CVE-2024-47542
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/537161868f36048571f400648ac7909f26c73d53]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst-libs/gst/tag/id3v2.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/gst-libs/gst/tag/id3v2.c b/gst-libs/gst/tag/id3v2.c
+index 7db2cb7e12..70f975d133 100644
+--- a/gst-libs/gst/tag/id3v2.c
++++ b/gst-libs/gst/tag/id3v2.c
+@@ -29,7 +29,7 @@
+ 
+ #define HANDLE_INVALID_SYNCSAFE
+ 
+-static gboolean id3v2_frames_to_tag_list (ID3TagsWorking * work, guint size);
++static gboolean id3v2_frames_to_tag_list (ID3TagsWorking * work);
+ 
+ #ifndef GST_DISABLE_GST_DEBUG
+ 
+@@ -258,7 +258,7 @@ gst_tag_list_from_id3v2_tag (GstBuffer * buffer)
+     GST_MEMDUMP ("ID3v2 tag (un-unsyced)", uu_data, work.hdr.frame_data_size);
+   }
+ 
+-  id3v2_frames_to_tag_list (&work, work.hdr.frame_data_size);
++  id3v2_frames_to_tag_list (&work);
+ 
+   g_free (uu_data);
+ 
+@@ -440,12 +440,17 @@ id3v2_add_id3v2_frame_blob_to_taglist (ID3TagsWorking * work,
+ }
+ 
+ static gboolean
+-id3v2_frames_to_tag_list (ID3TagsWorking * work, guint size)
++id3v2_frames_to_tag_list (ID3TagsWorking * work)
+ {
+   guint frame_hdr_size;
+ 
+   /* Extended header if present */
+   if (work->hdr.flags & ID3V2_HDR_FLAG_EXTHDR) {
++    if (work->hdr.frame_data_size < 4) {
++      GST_DEBUG ("Tag has no extended header data. Broken tag");
++      return FALSE;
++    }
++
+     work->hdr.ext_hdr_size = id3v2_read_synch_uint (work->hdr.frame_data, 4);
+ 
+     /* In id3v2.4.x the header size is the size of the *whole*
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index e65de0036d8..793b8afc3d7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0007-oggstream-review-and-fix-per-format-min_packet_size.patch \
            file://0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch \
            file://0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch \
+           file://0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.30.2


