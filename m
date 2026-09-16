Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B72C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:13:17 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13334.1789560785946635924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=IbufvioT;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3187; q=dns/txt;
  s=NAESA-Selector1; t=1789560789; x=1821096789;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=f+6bROkHb0h/BlxA6L27znqTG13mfgDBMFLZfgNGuMs=;
  b=IbufvioTyZWIix2jH9S/7/fpOfLMD0QwFvLhqbFs5oaoHppts4H/IA7L
   5pR6cJbcyrfTSs3GTSPoUzHfuLjbko1a6KJeI8qL2ZSspKekeXWkpaXtD
   Q1jRpOzhPpOOrEnvUUQQef4UMSbfuSUXwBb1Bn96T8ekdsQZh8Xh+2SYe
   25eFe7FEAAzqeinTeoMdecMISl8/ev69pep0ClKolArQs5fYVj49/P71n
   LTMFI8fpwIT91WHcqW4NWij8XpGABN0DP5pmj+hl8dd5aAMARujCy/sr3
   xzqSVieTDvzVprVrQD+WmTdIiuykTdKIIOahlV/YwUfIIsM5bevr5b3z2
   g==;
X-CSE-ConnectionGUID: 0IfROtZzTlKg+pulRLGBLA==
X-CSE-MsgGUID: fGaFQ6jVTBGvKZS/d8pjqQ==
X-IronPort-AV: E=Sophos;i="6.27,103,1787032800"; 
   d="scan'208";a="63580017"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 16 Sep 2026 06:13:08 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose,v2][oe-core][PATCH 03/10] ffmpeg: Fix for CVE-2026-64832
Date: Wed, 16 Sep 2026 17:39:26 +0530
Message-ID: <20260916121258.1699611-3-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
References: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245957

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/4c6217477fc64305055b37d9d1d0d76d30e37f97
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64832

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
changes in v2:
- previously CVE_STATUS was set, created new patch with proper fix
---
 .../ffmpeg/ffmpeg/CVE-2026-64832.patch        | 47 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64832.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64832.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64832.patch
new file mode 100644
index 0000000000..28d6c0343f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64832.patch
@@ -0,0 +1,47 @@
+From 55645f03fa9dc2e5ef5f79b875950391e920506b Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 30 Jun 2026 00:24:07 +0200
+Subject: [PATCH] avcodec/nvdec: don't double free the fdd-owned context on the
+ sep_ref error path
+
+Fixes: double free
+Fixes: rpSz7v3yq2u8
+Fixes: 72982f8cb5dad6252a14226d28128313eed4a5ff (avcodec/nvdec: add support for separate reference frame)
+Found-by: Pavel Kohout (Aisle Research)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-64832
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/4c6217477fc64305055b37d9d1d0d76d30e37f97]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/nvdec.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/libavcodec/nvdec.c b/libavcodec/nvdec.c
+index 7c29f25718..787a9d7c28 100644
+--- a/libavcodec/nvdec.c
++++ b/libavcodec/nvdec.c
+@@ -628,8 +628,7 @@ int ff_nvdec_start_frame_sep_ref(AVCodecContext *avctx, AVFrame *frame, int has_
+             cf->ref_idx_ref = av_refstruct_pool_get(ctx->decoder_pool);
+             if (!cf->ref_idx_ref) {
+                 av_log(avctx, AV_LOG_ERROR, "No decoder surfaces left\n");
+-                ret = AVERROR(ENOMEM);
+-                goto fail;
++                return AVERROR(ENOMEM);
+             }
+         }
+         cf->ref_idx = *cf->ref_idx_ref;
+@@ -639,9 +638,6 @@ int ff_nvdec_start_frame_sep_ref(AVCodecContext *avctx, AVFrame *frame, int has_
+     }
+ 
+     return 0;
+-fail:
+-    nvdec_fdd_priv_free(cf);
+-    return ret;
+ }
+ 
+ int ff_nvdec_end_frame(AVCodecContext *avctx)
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 02b9cf65a5..4192b1a5c9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            file://CVE-2026-64830.patch \
            file://CVE-2026-64831.patch \
+           file://CVE-2026-64832.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


