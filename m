Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C673BC52CDC
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:06 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.55639.1722258779556031440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c7tmr6ZU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fed72d23a7so19695425ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258779; x=1722863579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYHRH7F9Mk9pIVxGt8QXeyNyD48BSHF8D6r1HEHLk5s=;
        b=c7tmr6ZU/RdC/RdmXimABEre6mF8wF6E9lFTPI0uGcrYNIPm4ktCu3gFnRsoz9LH/u
         QIA9td47WxKDCkxCmEh/bc7lLGpdaV7xZlg8fkyCXt2mt6P80OZ5hpeZ1eSjSCcSN4AY
         tUegFUvwrju01W/1yv2SSoJG+XeFYGUwp9PprVwzb6kH/iIfvQg8gVwWZ/H62JiDaJxo
         jJOSWaO689B3vvOZ+s+qMST1SAUcd26PJZheLMHvHQK5eZG6IaDMK09SgzOz9s76/BKk
         3tnZlpkyDJeKiZCBMcoKpK9cHzJUHG4EUNiLm1gc0Wm6imTNht5ha6Dcb1jC164FcPKY
         G2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258779; x=1722863579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYHRH7F9Mk9pIVxGt8QXeyNyD48BSHF8D6r1HEHLk5s=;
        b=kkGzYiBbTTvvJ3bQ2N/cn3gqTmmu49ELuKtFjxDID726diFnRrCdprJGZvLW54Wuyz
         oBXTQiMu3Tu7XLZTCzTmmLlP8RdRfA6vyPnGygf6tiD/xQNaIVPGNtu7Xi9NoKnYRv/K
         r39AtJc+8kUYw+N3JI6+t03LBHHF+dZTuAhkvujPJb/M5pbo6eL9WWUTBmMaVpWzoMvW
         gAStIKOFCFPUQ5/5xk4ylR6pjcA2mLqAcuJJ3urJu/On1Qa8/vWwZ3ViArsiqiOIzoBk
         7tAhea1TM6VnzUfJnLuEKdnAQSdPs9k4TY20Dkvwnt4Rx3G+L45I/ipgtnP48GS2CUAv
         x82w==
X-Gm-Message-State: AOJu0YxC7XgFwqmYoZzJBGO6NUmrr9fSRasOxC6X7lsjDdxzDhSmXVJJ
	A5whzg8FVQrjWtSnXD/mzhQPSAe8srBy5ta2L3YIw/OT0y5GFxZYCWCqdDjPIgsoBt6docmb6bl
	YfVOoDg==
X-Google-Smtp-Source: AGHT+IGN5tLBrjH6u8Zq5VUGToEwzwWTgqAYRyWEz7570+gp1kjg1znhRHRKTxDWSpdjby2vbB+I+A==
X-Received: by 2002:a17:90b:3793:b0:2c9:5c7c:815d with SMTP id 98e67ed59e1d1-2cf7e2275d2mr5566638a91.22.1722258778370;
        Mon, 29 Jul 2024 06:12:58 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.12.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:12:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/37] ffmpeg: fix CVE-2023-49502
Date: Mon, 29 Jul 2024 06:12:12 -0700
Message-Id: <814a688d1dc3f22cf7d1b88bde6842b032c13d12.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202616

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.n6.1-3-g466799d4f5 allows a local attacker
to execute arbitrary code via the ff_bwdif_filter_intra_c function in the
libavfilter/bwdifdsp.c:125:5 component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-49502.patch        | 107 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49502.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49502.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49502.patch
new file mode 100644
index 0000000000..bc78a46d03
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49502.patch
@@ -0,0 +1,107 @@
+From 737ede405b11a37fdd61d19cf25df296a0cb0b75 Mon Sep 17 00:00:00 2001
+From: Cosmin Stejerean <cosmin@cosmin.at>
+Date: Wed, 6 Dec 2023 18:39:32 +0800
+Subject: [PATCH] avfilter/bwdif: account for chroma sub-sampling in min size
+ calculation
+
+The current logic for detecting frames that are too small for the
+algorithm does not account for chroma sub-sampling, and so a sample
+where the luma plane is large enough, but the chroma planes are not
+will not be rejected. In that event, a heap overflow will occur.
+
+This change adjusts the logic to consider the chroma planes and makes
+the change to all three bwdif implementations.
+
+Fixes #10688
+
+Signed-off-by: Cosmin Stejerean <cosmin@cosmin.at>
+Reviewed-by: Thomas Mundt <tmundt75@gmail.com>
+Signed-off-by: Philip Langdale <philipl@overt.org>
+
+CVE: CVE-2023-49502
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/737ede405b11a37f]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/vf_bwdif.c        |  9 +++++----
+ libavfilter/vf_bwdif_cuda.c   | 11 ++++++-----
+ libavfilter/vf_bwdif_vulkan.c | 11 +++++------
+ 3 files changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/libavfilter/vf_bwdif.c b/libavfilter/vf_bwdif.c
+index 137cd5e..353cd0b 100644
+--- a/libavfilter/vf_bwdif.c
++++ b/libavfilter/vf_bwdif.c
+@@ -191,13 +191,14 @@ static int config_props(AVFilterLink *link)
+         return ret;
+     }
+
+-    if (link->w < 3 || link->h < 4) {
+-        av_log(ctx, AV_LOG_ERROR, "Video of less than 3 columns or 4 lines is not supported\n");
++    yadif->csp = av_pix_fmt_desc_get(link->format);
++    yadif->filter = filter;
++
++    if (AV_CEIL_RSHIFT(link->w, yadif->csp->log2_chroma_w) < 3 || AV_CEIL_RSHIFT(link->h, yadif->csp->log2_chroma_h) < 4) {
++        av_log(ctx, AV_LOG_ERROR, "Video with planes less than 3 columns or 4 lines is not supported\n");
+         return AVERROR(EINVAL);
+     }
+
+-    yadif->csp = av_pix_fmt_desc_get(link->format);
+-    yadif->filter = filter;
+     ff_bwdif_init_filter_line(&s->dsp, yadif->csp->comp[0].depth);
+
+     return 0;
+diff --git a/libavfilter/vf_bwdif_cuda.c b/libavfilter/vf_bwdif_cuda.c
+index a5ecfba..418f15f 100644
+--- a/libavfilter/vf_bwdif_cuda.c
++++ b/libavfilter/vf_bwdif_cuda.c
+@@ -296,15 +296,16 @@ static int config_output(AVFilterLink *link)
+         link->frame_rate = av_mul_q(ctx->inputs[0]->frame_rate,
+                                     (AVRational){2, 1});
+
+-    if (link->w < 3 || link->h < 3) {
+-        av_log(ctx, AV_LOG_ERROR, "Video of less than 3 columns or lines is not supported\n");
+-        ret = AVERROR(EINVAL);
+-        goto exit;
+-    }
+
+     y->csp = av_pix_fmt_desc_get(output_frames->sw_format);
+     y->filter = filter;
+
++    if (AV_CEIL_RSHIFT(link->w, y->csp->log2_chroma_w) < 3 || AV_CEIL_RSHIFT(link->h, y->csp->log2_chroma_h) < 3) {
++        av_log(ctx, AV_LOG_ERROR, "Video with planes less than 3 columns or lines is not supported\n");
++        ret = AVERROR(EINVAL);
++        goto exit;
++    }
++
+     ret = CHECK_CU(cu->cuCtxPushCurrent(s->hwctx->cuda_ctx));
+     if (ret < 0)
+         goto exit;
+diff --git a/libavfilter/vf_bwdif_vulkan.c b/libavfilter/vf_bwdif_vulkan.c
+index 690a89c..c51df9a 100644
+--- a/libavfilter/vf_bwdif_vulkan.c
++++ b/libavfilter/vf_bwdif_vulkan.c
+@@ -362,15 +362,14 @@ static int bwdif_vulkan_config_output(AVFilterLink *outlink)
+         outlink->frame_rate = av_mul_q(avctx->inputs[0]->frame_rate,
+                                        (AVRational){2, 1});
+
+-    if (outlink->w < 4 || outlink->h < 4) {
+-        av_log(avctx, AV_LOG_ERROR, "Video of less than 4 columns or lines is not "
+-               "supported\n");
+-        return AVERROR(EINVAL);
+-    }
+-
+     y->csp = av_pix_fmt_desc_get(vkctx->frames->sw_format);
+     y->filter = bwdif_vulkan_filter_frame;
+
++    if (AV_CEIL_RSHIFT(outlink->w, y->csp->log2_chroma_w) < 4 || AV_CEIL_RSHIFT(outlink->h, y->csp->log2_chroma_h) < 4) {
++        av_log(avctx, AV_LOG_ERROR, "Video with planes less than 4 columns or lines is not supported\n");
++        return AVERROR(EINVAL);
++    }
++
+     return init_filter(avctx);
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index dea1f54580..90c15782d1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://av1_ordering_info.patch \
     file://vulkan_av1_stable_API.patch \
     file://vulkan_fix_gcc14.patch \
+    file://CVE-2023-49502.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


