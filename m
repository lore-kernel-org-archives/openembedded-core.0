Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D53DE77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:28:33 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.66634.1735579706113672512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:28:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lIai1FKQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202412301728230d4e0af18c4fb8f10e-amakhe@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202412301728230d4e0af18c4fb8f10e
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:28:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=PP891yqHZfpZwT+lyzsGEGbXMYkHWXncNO0L6K/QvKg=;
 b=lIai1FKQzy3Ex/xW46oEM3Wo8lraOAKRQ+wQZeSqwUaFBWt0VCgnJ8QsAJL1qVFwH0Vhx7
 zzQDiTELk3lduIe2BbZYT+G6gg8ummbfOEre8ALXxRywVaWvAeGQ+V1PdK6RFEdZcul1+Y/+
 3yOBMCNiw2K0pk11wyO524TVi1V2Is8b+Z7j3094qjvu95nq1EMSmQNj+67qemJWXczufbk0
 uYj2F/YU75NK3KFBJQB4L3AvzHnfB/48hWs7H8YQKcZc4vSTroBvZevF/L1B5oM8kcTmNAzX
 iCKS5MvAF6tXNWzCvGf/5B4sDY/ikoiiGk0PyN5hgFkLBaKHnEa6U1UQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 03/16] gstreamer1.0-plugins-base: patch CVE-2024-47607
Date: Mon, 30 Dec 2024 18:27:10 +0100
Message-Id: <20241230172723.3644270-3-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209167

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8037

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...at-most-64-channels-to-NONE-position.patch | 41 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch
new file mode 100644
index 00000000000..7a27af12910
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch
@@ -0,0 +1,41 @@
+From 2838374d6ee4a0c9c4c4221ac46d5c1688f26e59 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 1 Oct 2024 13:22:50 +0300
+Subject: [PATCH] opusdec: Set at most 64 channels to NONE position
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-116
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3871
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8037>
+
+CVE: CVE-2024-47607
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/2838374d6ee4a0c9c4c4221ac46d5c1688f26e59]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ext/opus/gstopusdec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ext/opus/gstopusdec.c b/ext/opus/gstopusdec.c
+index 99289fa7d2..d3f461d9a8 100644
+--- a/ext/opus/gstopusdec.c
++++ b/ext/opus/gstopusdec.c
+@@ -440,12 +440,12 @@ gst_opus_dec_parse_header (GstOpusDec * dec, GstBuffer * buf)
+         posn = gst_opus_channel_positions[dec->n_channels - 1];
+         break;
+       default:{
+-        gint i;
++        guint i, max_pos = MIN (dec->n_channels, 64);
+ 
+         GST_ELEMENT_WARNING (GST_ELEMENT (dec), STREAM, DECODE,
+             (NULL), ("Using NONE channel layout for more than 8 channels"));
+ 
+-        for (i = 0; i < dec->n_channels; i++)
++        for (i = 0; i < max_pos; i++)
+           pos[i] = GST_AUDIO_CHANNEL_POSITION_NONE;
+ 
+         posn = pos;
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index fbdd599eb93..ffae2271541 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch \
+           file://0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.30.2


