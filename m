Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CFEE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 13:12:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.36300.1733490720131698975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=207081cc16=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6Ap5sv031774
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Dec 2024 05:12:00 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7y7b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 05:11:59 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 6 Dec 2024 05:11:58 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 6 Dec 2024 05:11:57 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 5/5] ffmpeg: fix CVE-2024-7055
Date: Fri, 6 Dec 2024 13:11:48 +0000
Message-ID: <20241206131148.1870788-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241206131148.1870788-1-archana.polampalli@windriver.com>
References: <20241206131148.1870788-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OhazeyyQsL8OzwGboIvOFptdjqo9tLmg
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=6752f81f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=NIfUrUhfAAAA:8 a=t7CeM3EgAAAA:8 a=OjagX9nxrhafTlK6S7UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OhazeyyQsL8OzwGboIvOFptdjqo9tLmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_09,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412060099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 13:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208426

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was found in FFmpeg up to 7.0.1. It has been classified as critical.
This affects the function pnm_decode_frame in the library /libavcodec/pnmdec.c.
The manipulation leads to heap-based buffer overflow. It is possible to initiate
the attack remotely. The exploit has been disclosed to the public and may be used.
Upgrading to version 7.0.2 is able to address this issue. It is recommended to
upgrade the affected component. The associated identifier of this vulnerability is VDB-273651.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-7055.patch         | 38 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
new file mode 100644
index 0000000000..afd857ceac
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
@@ -0,0 +1,38 @@
+From 587acd0d4020859e67d1f07aeff2c885797ebcce Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 18 Jul 2024 21:12:54 +0200
+Subject: [PATCH] avcodec/pnmdec: Use 64bit for input size check
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
+Upstream-Status: Backport [https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=587acd0d4020859e67d1f07aeff2c885797ebcce]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/pnmdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/pnmdec.c b/libavcodec/pnmdec.c
+index acd77ea..40cc2ae 100644
+--- a/libavcodec/pnmdec.c
++++ b/libavcodec/pnmdec.c
+@@ -264,7 +264,7 @@ static int pnm_decode_frame(AVCodecContext *avctx, AVFrame *p,
+         break;
+     case AV_PIX_FMT_GBRPF32:
+         if (!s->half) {
+-            if (avctx->width * avctx->height * 12 > s->bytestream_end - s->bytestream)
++            if (avctx->width * avctx->height * 12LL > s->bytestream_end - s->bytestream)
+                 return AVERROR_INVALIDDATA;
+             scale = 1.f / s->scale;
+             if (s->endian) {
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 20ad368594..0c18a4a7af 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -36,6 +36,7 @@ SRC_URI = " \
     file://CVE-2024-28661.patch \
     file://CVE-2023-50007.patch \
     file://CVE-2023-49528.patch \
+    file://CVE-2024-7055.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


