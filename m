Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E65D609BF
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 09:24:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.68261.1732699483456706085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 01:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10610f3413=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR7s66v028160
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 09:24:42 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433491cd1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 09:24:42 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 27 Nov 2024 01:24:41 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 27 Nov 2024 01:24:39 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/5] ffmpeg: fix CVE-2023-51798
Date: Wed, 27 Nov 2024 09:24:34 +0000
Message-ID: <20241127092438.760275-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=W4ZqVgWk c=1 sm=1 tr=0 ts=6746e55a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=_uhYRToyLV2B5nqxZAwA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: I6kOOQe4um_Vv3LrsZCyukb5jQ8wO20v
X-Proofpoint-ORIG-GUID: I6kOOQe4um_Vv3LrsZCyukb5jQ8wO20v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-27_04,2024-11-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411270077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 09:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207918

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local attacker
to execute arbitrary code via a floating point exception (FPE) error at
libavfilter/vf_minterpolate.c:1078:60 in interpolate.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-51798.patch        | 45 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51798.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51798.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51798.patch
new file mode 100644
index 0000000000..6250486c05
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51798.patch
@@ -0,0 +1,45 @@
+From c9e6162554cc7d04a56e2edd1f6f1479c6f8b62f Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 30 Dec 2023 02:51:32 +0100
+Subject: [PATCH] avfilter/vf_minterpolate: Check pts before division
+
+Fixes: FPE
+Fixes: tickets/10758/poc20ffmpeg
+
+Discovered by Zeng Yunxiang
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 68146f06f852078866b3ef1564556e3a272920c7)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-51798
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/c9e6162554cc7d04a56e2edd1f6f1479c6f8b62f]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/vf_minterpolate.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libavfilter/vf_minterpolate.c b/libavfilter/vf_minterpolate.c
+index 97d0e96..9296e67 100644
+--- a/libavfilter/vf_minterpolate.c
++++ b/libavfilter/vf_minterpolate.c
+@@ -1078,8 +1078,13 @@ static void interpolate(AVFilterLink *inlink, AVFrame *avf_out)
+     pts = av_rescale(avf_out->pts, (int64_t) ALPHA_MAX * outlink->time_base.num * inlink->time_base.den,
+                                    (int64_t)             outlink->time_base.den * inlink->time_base.num);
+
+-    alpha = (pts - mi_ctx->frames[1].avf->pts * ALPHA_MAX) / (mi_ctx->frames[2].avf->pts - mi_ctx->frames[1].avf->pts);
+-    alpha = av_clip(alpha, 0, ALPHA_MAX);
++    if (mi_ctx->frames[2].avf->pts > mi_ctx->frames[1].avf->pts) {
++        alpha = (pts - mi_ctx->frames[1].avf->pts * ALPHA_MAX) / (mi_ctx->frames[2].avf->pts - mi_ctx->frames[1].avf->pts);
++        alpha = av_clip(alpha, 0, ALPHA_MAX);
++    } else {
++        av_log(ctx, AV_LOG_DEBUG, "duplicate input PTS detected\n");
++        alpha = 0;
++    }
+
+     if (alpha == 0 || alpha == ALPHA_MAX) {
+         av_frame_copy(avf_out, alpha ? mi_ctx->frames[2].avf : mi_ctx->frames[1].avf);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 80a4e5b96f..b8bd77972b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -35,6 +35,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-31582.patch \
            file://CVE-2024-31578.patch \
            file://CVE-2023-51794.patch \
+           file://CVE-2023-51798.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


