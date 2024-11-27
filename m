Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B163D609C0
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 09:24:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.67973.1732699490969758252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 01:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10610f3413=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR80Ppe023954
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 09:24:50 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618cb0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 09:24:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 27 Nov 2024 01:24:48 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 27 Nov 2024 01:24:47 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 5/5] ffmpeg: fix CVE-2024-7055
Date: Wed, 27 Nov 2024 09:24:38 +0000
Message-ID: <20241127092438.760275-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241127092438.760275-1-archana.polampalli@windriver.com>
References: <20241127092438.760275-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: C6ewsrGcgq6X5hpZjoBA8pHoTZug6Hed
X-Proofpoint-GUID: C6ewsrGcgq6X5hpZjoBA8pHoTZug6Hed
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=6746e561 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NIfUrUhfAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=xEbhLbR42Mu_ZiyaIJsA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-27_04,2024-11-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411270077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 09:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207922

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was found in FFmpeg up to 7.0.1. It has been classified as critical.
This affects the function pnm_decode_frame in the library /libavcodec/pnmdec.c.
The manipulation leads to heap-based buffer overflow. It is possible to initiate
the attack remotely. The exploit has been disclosed to the public and may be used.
Upgrading to version 7.0.2 is able to address this issue. It is recommended to upgrade
the affected component. The associated identifier of this vulnerability is VDB-273651.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-7055.patch         | 38 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
new file mode 100644
index 0000000000..0a573330a2
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
@@ -0,0 +1,38 @@
+From 5372bfe01e4a04357ab4465c1426cf8c6412dfd5 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 18 Jul 2024 21:12:54 +0200
+Subject: [PATCH 4/4] avcodec/pnmdec: Use 64bit for input size check
+
+Fixes: out of array read
+Fixes: poc3
+
+Reported-by: VulDB CNA Team
+Found-by: CookedMelon
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 3faadbe2a27e74ff5bb5f7904ec27bb1f5287dc8)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-7055
+
+Upstream-Status: Backport [https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=5372bfe01e4a04357ab4465c1426cf8c6412dfd5]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/pnmdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/pnmdec.c b/libavcodec/pnmdec.c
+index 01f9dad..1b3f20a 100644
+--- a/libavcodec/pnmdec.c
++++ b/libavcodec/pnmdec.c
+@@ -256,7 +256,7 @@ static int pnm_decode_frame(AVCodecContext *avctx, void *data,
+         }
+         break;
+     case AV_PIX_FMT_GBRPF32:
+-        if (avctx->width * avctx->height * 12 > s->bytestream_end - s->bytestream)
++        if (avctx->width * avctx->height * 12LL > s->bytestream_end - s->bytestream)
+             return AVERROR_INVALIDDATA;
+         scale = 1.f / s->scale;
+         if (s->endian) {
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 8e0fc090ac..7b03b7cbc0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-47342.patch \
            file://CVE-2023-50007.patch \
            file://CVE-2023-51796.patch \
+           file://CVE-2024-7055.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


