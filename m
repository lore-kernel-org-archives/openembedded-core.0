Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1D2C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 09:56:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7122.1721815008020333573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 02:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79355a251e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46O5cqTx023163
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:56:47 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40g2exuj6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:56:46 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 02:56:44 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 2/3] ffmpeg: fix CVE-2023-49502
Date: Wed, 24 Jul 2024 09:56:24 +0000
Message-ID: <20240724095625.3846889-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240724095625.3846889-1-archana.polampalli@windriver.com>
References: <20240724095625.3846889-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 2mxqXoHHLH4sdKqG-RV7GJ2L0lpPPC4h
X-Proofpoint-ORIG-GUID: 2mxqXoHHLH4sdKqG-RV7GJ2L0lpPPC4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_07,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407240073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202436

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.n6.1-3-g466799d4f5 allows a local attacker
to execute arbitrary code via the ff_bwdif_filter_intra_c function in the
libavfilter/bwdifdsp.c:125:5 component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
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
2.40.0


