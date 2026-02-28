Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABEBFD0045
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 21:46:22 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127775.1772315174554878128
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Feb 2026 13:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=S9GwnEYr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202602282146121a1e8ff21d00020751-78qshx@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202602282146121a1e8ff21d00020751
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Feb 2026 22:46:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZNkrfunGtqZDS6uMSwIG/sw1lAWbUmk9cRtfGZ8QkZs=;
 b=S9GwnEYrWF/A+SLY0A7o0FtYrMaKVfAOIIHVzAWhQiGs8GuXwi1FlBd2LyUK5wkdSRS3Uv
 he8nVCZlG8LcZ1IqLOowN6vB0hBSMldQp+SeAutH0JMCtlpPl1of5PiNIevI138yWqyowu7X
 fNU2j3pNO2T8IXBmJPkl8KrX3u2T29hyebo4o6WzJ3pBl2hUAAx9LVhuH494nzCIQcbwBf79
 QHM/YfJlV2Wxe4JQ4gbgqZQZmXEK30OSlx+ZHKnh+vFhR7+SWlT7wf26hPanhetC8Qx2q1gk
 kdwqNDhGvWQglB6O2sefbr/lZfoYkFDVE6J/nT0/k2elLZPvy3TtJBQw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] ffmpeg: patch CVE-2025-10256
Date: Sat, 28 Feb 2026 22:45:33 +0100
Message-Id: <20260228214533.451825-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 21:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232132

From: Peter Marko <peter.marko@siemens.com>

Pick patch metioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-10256.patch        | 31 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-10256.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-10256.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-10256.patch
new file mode 100644
index 00000000000..6c5f98efe2f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-10256.patch
@@ -0,0 +1,31 @@
+From a25462482c02c004d685a8fcf2fa63955aaa0931 Mon Sep 17 00:00:00 2001
+From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
+Date: Wed, 6 Aug 2025 16:39:47 +0000
+Subject: [PATCH] libavfilter/af_firequalizer: Add check for av_malloc_array()
+
+Add check for the return value of av_malloc_array() to avoid potential NULL pointer dereference.
+
+Fixes: d3be186ed1 ("avfilter/firequalizer: add dumpfile and dumpscale option")
+Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2025-10256
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/a25462482c02c004d685a8fcf2fa63955aaa0931]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libavfilter/af_firequalizer.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libavfilter/af_firequalizer.c b/libavfilter/af_firequalizer.c
+index 38663200eb..f14983b431 100644
+--- a/libavfilter/af_firequalizer.c
++++ b/libavfilter/af_firequalizer.c
+@@ -793,6 +793,8 @@ static int config_input(AVFilterLink *inlink)
+     if (s->dumpfile) {
+         s->analysis_rdft = av_rdft_init(rdft_bits, DFT_R2C);
+         s->dump_buf = av_malloc_array(s->analysis_rdft_len, sizeof(*s->dump_buf));
++        if (!s->dump_buf)
++            return AVERROR(ENOMEM);
+     }
+ 
+     s->analysis_buf = av_malloc_array(s->analysis_rdft_len, sizeof(*s->analysis_buf));
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 4793035eb72..f89fb2d0d78 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -53,6 +53,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch \
            file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch \
            file://CVE-2025-1594.patch \
+           file://CVE-2025-10256.patch \
           "
 
 SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"

