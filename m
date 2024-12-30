Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3612CE7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:28:43 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.66641.1735579716533233180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=rGlkg3nI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2024123017283473b1ae162e7442c8b4-yyt7cp@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2024123017283473b1ae162e7442c8b4
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:28:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8yqNx4GJ/jY7eMs9jk7YCkBCXD1NHvozGMr5MurdWLc=;
 b=rGlkg3nIeJmhdP+XqY/N9xHPqJfGKiHqQTIP5B5N11f5G/INhMv6OFPqLQkqVQrQykjZ3T
 9h0FZ8hJZ3/AIUAJdl+NmZGGI2p16VJqecz23VhcheveC7iUxy7A/l/7wyCh/eIkJfOKSJUN
 wn8nfq06BWi/IRKM76UZl64L1x4OS0wmLKc8xtwqBgqcuRsIvSHar2bz2PAeLSBsqvbrG3xF
 WTXGbl3uprRdvnjRB0m1XMcMSfFTD1a4tCBoyY8h0sYyRQGnFSIl6O6Kdw6RC1iFOvpiXJWx
 iedkpBA2Jom65YZCTouNj4ql1Vq1LGuXHETZ8nT8oybltSwved1YQVHw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 05/16] gstreamer1.0-plugins-good: patch CVE-2024-47613
Date: Mon, 30 Dec 2024 18:27:12 +0100
Message-Id: <20241230172723.3644270-5-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209169

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8041

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ck-if-initializing-the-video-info-ac.patch | 53 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch
new file mode 100644
index 00000000000..502b26f9d50
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch
@@ -0,0 +1,53 @@
+From 1d1c9d63be51d85f9b80f0c227d4b3469fee2534 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Wed, 2 Oct 2024 14:44:21 +0300
+Subject: [PATCH] gdkpixbufdec: Check if initializing the video info actually
+ succeeded
+
+Otherwise a 0-byte buffer would be allocated, which gives NULL memory when
+mapped.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-118
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3876
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8041>
+
+CVE: CVE-2024-47613
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1d1c9d63be51d85f9b80f0c227d4b3469fee2534]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ext/gdk_pixbuf/gstgdkpixbufdec.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/ext/gdk_pixbuf/gstgdkpixbufdec.c b/ext/gdk_pixbuf/gstgdkpixbufdec.c
+index 5482998c0d..de5f054964 100644
+--- a/ext/gdk_pixbuf/gstgdkpixbufdec.c
++++ b/ext/gdk_pixbuf/gstgdkpixbufdec.c
+@@ -322,7 +322,8 @@ gst_gdk_pixbuf_dec_flush (GstGdkPixbufDec * filter)
+ 
+ 
+     gst_video_info_init (&info);
+-    gst_video_info_set_format (&info, fmt, width, height);
++    if (!gst_video_info_set_format (&info, fmt, width, height))
++      goto format_not_supported;
+     info.fps_n = filter->in_fps_n;
+     info.fps_d = filter->in_fps_d;
+     caps = gst_video_info_to_caps (&info);
+@@ -384,6 +385,12 @@ channels_not_supported:
+         ("%d channels not supported", n_channels));
+     return GST_FLOW_ERROR;
+   }
++format_not_supported:
++  {
++    GST_ELEMENT_ERROR (filter, STREAM, DECODE, (NULL),
++        ("%d channels with %dx%d not supported", n_channels, width, height));
++    return GST_FLOW_ERROR;
++  }
+ no_buffer:
+   {
+     GST_DEBUG ("Failed to create outbuffer - %s", gst_flow_get_name (ret));
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index 94c34cf9086..ca262903400 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0011-qtdemux-Actually-handle-errors-returns-from-various-.patch \
            file://0012-qtdemux-Check-for-invalid-atom-length-when-extractin.patch \
            file://0013-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.patch \
+           file://0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch \
           "
 
 SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
-- 
2.30.2


