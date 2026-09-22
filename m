Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CD3C98305
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 07:02:27 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4480.1790060539506240679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 00:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=SkZUq0Nq;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2874; q=dns/txt;
  s=NAESA-Selector1; t=1790060544; x=1821596544;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+2XeG4CX+ED2/EzNtgZDpPUiAqD/v0nzET+Pwm+wGXk=;
  b=SkZUq0Nqy9vvDI/6VMXkX9YFzSGbam/Qb1yOtmaf1c5wVBFOYxueow07
   CeNjfSOjibssfZbBNPWfPT4f2snN+eUUls7AMNDfub76xYj+INbPzbiqF
   MctIePjQOkMC7dwIjGN/qpqFge3dELJJiHkyGOGF2vT9tNypM4g/fcXDw
   YYGZ6CpPkTmfEbjAdHd4bI4x+dR4CMUYF4SdMbBG0U5Qlcc2Hri5mL4wi
   /XhijUvkx+cjP2rLY72TjR2B8/w7YkF5ufzZBclDwRdgN5cjGssfVtbVz
   pGX+TJw26s+1RARDULHTtQzWEGd4zTqc7NDKQSU56w0uJqe0Lk8qGRFU/
   g==;
X-CSE-ConnectionGUID: loh7lX+YQVCkGH31lWL92w==
X-CSE-MsgGUID: TW/yEmPGSWeG31GI8XErKA==
X-IronPort-AV: E=Sophos;i="6.27,116,1787032800"; 
   d="scan'208";a="63995898"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 22 Sep 2026 01:02:22 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 4/5] ffmpeg: Fix for CVE-2026-66039
Date: Tue, 22 Sep 2026 12:31:28 +0530
Message-ID: <20260922070209.2770399-4-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
References: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 07:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246385

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/aafb5c655edc76a753275c383ebb139feb032718
[2] https://nvd.nist.gov/vuln/detail/cve-2026-66039

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-66039.patch        | 38 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66039.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66039.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66039.patch
new file mode 100644
index 0000000000..2e34923eda
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66039.patch
@@ -0,0 +1,38 @@
+From b3562273e37397669fdb3f4ec933e2fa57e28dbd Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 29 Jun 2026 01:16:44 +0200
+Subject: [PATCH] avcodec/mace: reject sample counts that overflow int
+
+Fixes: heap buffer overflow
+Fixes: FmXBI2dbgvgD
+Fixes: 0eea212943544d40f99b05571aa7159d78667154 (Add avcodec_decode_audio4().)
+Found-by: Adrian Junge (vurlo)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-66039
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/aafb5c655edc76a753275c383ebb139feb032718]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/mace.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/mace.c b/libavcodec/mace.c
+index 2aa54fb548..716dd0c00a 100644
+--- a/libavcodec/mace.c
++++ b/libavcodec/mace.c
+@@ -252,7 +252,10 @@ static int mace_decode_frame(AVCodecContext *avctx, AVFrame *frame,
+     }
+ 
+     /* get output buffer */
+-    frame->nb_samples = 3 * (buf_size << (1 - is_mace3)) / channels;
++    int64_t nb_samples = 3 * ((int64_t)buf_size << (1 - is_mace3)) / channels;
++    if (nb_samples > INT_MAX)
++        return AVERROR_INVALIDDATA;
++    frame->nb_samples = nb_samples;
+     if ((ret = ff_get_buffer(avctx, frame, 0)) < 0)
+         return ret;
+     samples = (int16_t **)frame->extended_data;
+-- 
+2.53.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index cbb436a9a1..3043cf638f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-66036_p2.patch \
            file://CVE-2026-66037.patch \
            file://CVE-2026-66038.patch \
+           file://CVE-2026-66039.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


