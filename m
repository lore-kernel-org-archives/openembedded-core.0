Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A40CC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 09:56:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7236.1721815008504786660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 02:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79355a251e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46O3kuE9008539
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 02:56:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40he0vtcef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 02:56:47 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 02:56:46 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 3/3] ffmpeg: fix CVE-2024-31578
Date: Wed, 24 Jul 2024 09:56:25 +0000
Message-ID: <20240724095625.3846889-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240724095625.3846889-1-archana.polampalli@windriver.com>
References: <20240724095625.3846889-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: CEkDPU4pzc9RaowaUb5HmQcH--UD1HHS
X-Proofpoint-ORIG-GUID: CEkDPU4pzc9RaowaUb5HmQcH--UD1HHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_07,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=903 impostorscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407240073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202437

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg version n6.1.1 was discovered to contain a heap use-after-free via the av_hwframe_ctx_init function.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-31578.patch        | 49 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
new file mode 100644
index 0000000000..f8e7e1283b
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
@@ -0,0 +1,49 @@
+From edeeb35cecb5bc0d433b14dd0e544ae826b7ece5 Mon Sep 17 00:00:00 2001
+From: Zhao Zhili <zhilizhao@tencent.com>
+Date: Tue, 20 Feb 2024 20:08:55 +0800
+Subject: [PATCH] avutil/hwcontext: Don't assume frames_uninit is reentrant
+
+Fix heap use after free when vulkan_frames_init failed.
+
+Signed-off-by: Zhao Zhili <zhilizhao@tencent.com>
+
+CVE: CVE-2024-31578
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/3bb00c0a420c3ce83]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavutil/hwcontext.c | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/libavutil/hwcontext.c b/libavutil/hwcontext.c
+index 3650d46..0ef3479 100644
+--- a/libavutil/hwcontext.c
++++ b/libavutil/hwcontext.c
+@@ -363,7 +363,7 @@ int av_hwframe_ctx_init(AVBufferRef *ref)
+     if (ctx->internal->hw_type->frames_init) {
+         ret = ctx->internal->hw_type->frames_init(ctx);
+         if (ret < 0)
+-            goto fail;
++            return ret;
+     }
+
+     if (ctx->internal->pool_internal && !ctx->pool)
+@@ -373,14 +373,10 @@ int av_hwframe_ctx_init(AVBufferRef *ref)
+     if (ctx->initial_pool_size > 0) {
+         ret = hwframe_pool_prealloc(ref);
+         if (ret < 0)
+-            goto fail;
++            return ret;
+     }
+
+     return 0;
+-fail:
+-    if (ctx->internal->hw_type->frames_uninit)
+-        ctx->internal->hw_type->frames_uninit(ctx);
+-    return ret;
+ }
+
+ int av_hwframe_transfer_get_formats(AVBufferRef *hwframe_ref,
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 90c15782d1..06bd36e2e2 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://vulkan_av1_stable_API.patch \
     file://vulkan_fix_gcc14.patch \
     file://CVE-2023-49502.patch \
+    file://CVE-2024-31578.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


