Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCFEE7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:29:23 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.66278.1735579755325320872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:29:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=oFNJUvhF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202412301729130dbbd23247498ac4b8-bhkqcp@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202412301729130dbbd23247498ac4b8
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:29:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NTJM6aLGkUgtG0J4yPdpJy8WSwQf42umwLHzC5AqXmo=;
 b=oFNJUvhFZMe+m9fWTNelYqZK0zabRt7horYC7xBxowuarRYFFS05cIqGB3wgfbWgTveF/1
 hX+dP4NzAWuB71GFEG7l6ZNpjTPKlmwZhI4SsbK8W1T+SBZt2fuOweZRPJxBieD30Mt+zA1x
 6m/mJuMV9ZoH5AS2hLefgW2gQCqhW2vAYTy4GTAtYyquevA05vN0pYwbJoyKmILyp/nlL1eL
 iv3pDNn5jYPAuFJIVkX7ctD9fyxp6k3Lhjdxm8JV8TBfdB/YFk4/2CX+zUuZhewBoZ46MwFv
 UeRxB/64zqKLEXJnPXf3HWJ/WDSscz+fMtK0l8W1XKKDnTx9npE+oLlw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 13/16] gstreamer1.0-plugins-good: patch CVE-2024-47774
Date: Mon, 30 Dec 2024 18:27:20 +0100
Message-Id: <20241230172723.3644270-13-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209177

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8043

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...size-checks-and-avoid-overflows-when.patch | 46 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch
new file mode 100644
index 00000000000..33af003535f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch
@@ -0,0 +1,46 @@
+From 0870e87c7c02e28e22a09a7de0c5b1e5bed68c14 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 14:04:03 +0300
+Subject: [PATCH] avisubtitle: Fix size checks and avoid overflows when
+ checking sizes
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-262
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3890
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8043>
+
+CVE: CVE-2024-47774
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/0870e87c7c02e28e22a09a7de0c5b1e5bed68c14]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/avi/gstavisubtitle.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gst/avi/gstavisubtitle.c b/gst/avi/gstavisubtitle.c
+index efc5f04051..c816934da6 100644
+--- a/gst/avi/gstavisubtitle.c
++++ b/gst/avi/gstavisubtitle.c
+@@ -196,7 +196,7 @@ gst_avi_subtitle_parse_gab2_chunk (GstAviSubtitle * sub, GstBuffer * buf)
+   /* read 'name' of subtitle */
+   name_length = GST_READ_UINT32_LE (map.data + 5 + 2);
+   GST_LOG_OBJECT (sub, "length of name: %u", name_length);
+-  if (map.size <= 17 + name_length)
++  if (G_MAXUINT32 - 17 < name_length || map.size < 17 + name_length)
+     goto wrong_name_length;
+ 
+   name_utf8 =
+@@ -216,7 +216,8 @@ gst_avi_subtitle_parse_gab2_chunk (GstAviSubtitle * sub, GstBuffer * buf)
+   file_length = GST_READ_UINT32_LE (map.data + 13 + name_length);
+   GST_LOG_OBJECT (sub, "length srt/ssa file: %u", file_length);
+ 
+-  if (map.size < (17 + name_length + file_length))
++  if (G_MAXUINT32 - 17 - name_length < file_length
++      || map.size < 17 + name_length + file_length)
+     goto wrong_total_length;
+ 
+   /* store this, so we can send it again after a seek; note that we shouldn't
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index 7f8cd7c96c7..247fda7f9c7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch \
            file://0022-jpegdec-Directly-error-out-on-negotiation-failures.patch \
            file://0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch \
+           file://0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch \
           "
 
 SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
-- 
2.30.2


