Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA60E7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:29:13 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.66274.1735579744928541009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FMHu4EFR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241230172902b791dcdd6f08add39f-tvxhn1@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241230172902b791dcdd6f08add39f
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:29:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=39Fji4S+cRNTo3wVyvwEb2GwbxmdmLUSDOnsKapdGjQ=;
 b=FMHu4EFRPEkurPsrx0okiAzwy7JO3tKZKGhiWdu1Xwi302SzmWRRG50mBoY8jAe3iwzZNG
 8V9++KnRE08f9ed87HKtZRXb0CZc9PcWwuEQCLabcvf9tR7f93sJobvVmJdYvM5y/J9nq6+Y
 K8xFJODrSh0FEh3x+BZfX8UC8YpIxAm9YbpLt23J9oRwoEb9f2aeiE1Qo+l/4GyDCmF6ZBcC
 rCfFBgnvs2y57NPGFCYCoKVemW7Pir8u2ylTSLsLAUGod0nYK7rtVhJz1RmWx2rHiqpCvc68
 THEmzr8OiXNmmpUUHrfTZD9B5s2n9jF4L24y+2vWd6BreuPqIPDiGYzA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 11/16] gstreamer1.0-plugins-good: patch CVE-2024-47606
Date: Mon, 30 Dec 2024 18:27:18 +0100
Message-Id: <20241230172723.3644270-11-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209175

From: Peter Marko <peter.marko@siemens.com>

Pick commit related to plugins-good from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...teger-overflow-when-parsing-Theora-e.patch | 44 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch
new file mode 100644
index 00000000000..37f133a493b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch
@@ -0,0 +1,44 @@
+From f8e398c46fc074f266edb3f20479c0ca31b52448 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 22:16:06 +0300
+Subject: [PATCH] qtdemux: Avoid integer overflow when parsing Theora extension
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-166
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3851
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032>
+
+CVE: CVE-2024-47606
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f8e398c46fc074f266edb3f20479c0ca31b52448]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/isomp4/qtdemux.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
+index 5e3cb1b9e6..c2d8b5e0f1 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -8279,7 +8279,7 @@ qtdemux_parse_theora_extension (GstQTDemux * qtdemux, QtDemuxStream * stream,
+   end -= 8;
+ 
+   while (buf < end) {
+-    gint size;
++    guint32 size;
+     guint32 type;
+ 
+     size = QT_UINT32 (buf);
+@@ -8287,7 +8287,7 @@ qtdemux_parse_theora_extension (GstQTDemux * qtdemux, QtDemuxStream * stream,
+ 
+     GST_LOG_OBJECT (qtdemux, "%p %p", buf, end);
+ 
+-    if (buf + size > end || size <= 0)
++    if (end - buf < size || size < 8)
+       break;
+ 
+     buf += 8;
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index 85c9a20a2de..7f8cd7c96c7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0020-matroskademux-Skip-over-zero-sized-Xiph-stream-heade.patch \
            file://0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch \
            file://0022-jpegdec-Directly-error-out-on-negotiation-failures.patch \
+           file://0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch \
           "
 
 SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
-- 
2.30.2


