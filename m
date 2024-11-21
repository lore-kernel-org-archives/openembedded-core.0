Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067B8D75BCB
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 06:46:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5288.1732171563411787007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 22:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10557af3af=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL5hJOP015973
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 22:46:03 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7w61g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 22:46:03 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 20 Nov 2024 22:46:02 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 20 Nov 2024 22:46:01 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 5/5] ffmpeg: fix CVE-2024-31578
Date: Thu, 21 Nov 2024 06:45:52 +0000
Message-ID: <20241121064552.1847413-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241121064552.1847413-1-archana.polampalli@windriver.com>
References: <20241121064552.1847413-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XPHCFwmW1EoboSWtICWACFXfFMIRdmwt
X-Proofpoint-GUID: XPHCFwmW1EoboSWtICWACFXfFMIRdmwt
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673ed72b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=GvQkQWPkAAAA:8 a=mFYRlH3aK-uszRQaGb0A:9
 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_05,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=896 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207516

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg version n6.1.1 was discovered to contain a heap use-after-free via
the av_hwframe_ctx_init function.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-31578.patch        | 49 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
new file mode 100644
index 0000000000..e67f4777f7
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
@@ -0,0 +1,49 @@
+From 3bb00c0a420c3ce83c6fafee30270d69622ccad7 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/3bb00c0a420c3ce83c6fafee30270d69622ccad7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavutil/hwcontext.c | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/libavutil/hwcontext.c b/libavutil/hwcontext.c
+index 31c7840..2a4d9ed 100644
+--- a/libavutil/hwcontext.c
++++ b/libavutil/hwcontext.c
+@@ -362,7 +362,7 @@ int av_hwframe_ctx_init(AVBufferRef *ref)
+     if (ctx->internal->hw_type->frames_init) {
+         ret = ctx->internal->hw_type->frames_init(ctx);
+         if (ret < 0)
+-            goto fail;
++            return ret;
+     }
+
+     if (ctx->internal->pool_internal && !ctx->pool)
+@@ -372,14 +372,10 @@ int av_hwframe_ctx_init(AVBufferRef *ref)
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 4a743c6dd7..ae02310af8 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-51793.patch \
            file://CVE-2023-50008.patch \
            file://CVE-2024-31582.patch \
+           file://CVE-2024-31578.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


