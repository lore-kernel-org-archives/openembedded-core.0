Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10C1C0219E
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 15:41:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.72350.1738942889857966697
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 07:41:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4133c6c9d8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517FYhXg008987
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Feb 2025 15:41:29 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8erre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 15:41:28 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 7 Feb 2025 07:41:27 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 7 Feb 2025 07:41:26 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 7/8] ffmpeg: fix CVE-2024-35369
Date: Fri, 7 Feb 2025 15:41:12 +0000
Message-ID: <20250207154113.281835-7-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250207154113.281835-1-archana.polampalli@windriver.com>
References: <20250207154113.281835-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ecXHf6EH c=1 sm=1 tr=0 ts=67a629a9 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=8SoALjWpfi_AlCRMZEkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CO1Vw430eypYmLHnmRMvZIXfn4gCzzqU
X-Proofpoint-GUID: CO1Vw430eypYmLHnmRMvZIXfn4gCzzqU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502070119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 15:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210990

From: Archana Polampalli <archana.polampalli@windriver.com>

In FFmpeg version n6.1.1, specifically within the avcodec/speexdec.c module,
a potential security vulnerability exists due to insufficient validation
of certain parameters when parsing Speex codec extradata. This vulnerability
could lead to integer overflow conditions, potentially resulting in undefined
behavior or crashes during the decoding process.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35369.patch        | 37 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
new file mode 100644
index 0000000000..72dc8d14a7
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
@@ -0,0 +1,37 @@
+From 0895ef0d6d6406ee6cd158fc4d47d80f201b8e9c Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Sat, 17 Feb 2024 09:45:57 -0300
+Subject: [PATCH] avcodec/speexdec: further check for sane frame_size values
+
+Prevent potential integer overflows.
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2024-35369
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/0895ef0d6d6406ee6cd158fc4d47d80f201b8e9c]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/speexdec.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/speexdec.c b/libavcodec/speexdec.c
+index 23b8605..a034009 100644
+--- a/libavcodec/speexdec.c
++++ b/libavcodec/speexdec.c
+@@ -1420,9 +1420,10 @@ static int parse_speex_extradata(AVCodecContext *avctx,
+         return AVERROR_INVALIDDATA;
+     s->bitrate = bytestream_get_le32(&buf);
+     s->frame_size = bytestream_get_le32(&buf);
+-    if (s->frame_size < NB_FRAME_SIZE << s->mode)
++    if (s->frame_size < NB_FRAME_SIZE << (s->mode > 0) ||
++        s->frame_size >     INT32_MAX >> (s->mode > 0))
+         return AVERROR_INVALIDDATA;
+-    s->frame_size *= 1 + (s->mode > 0);
++    s->frame_size <<= (s->mode > 0);
+     s->vbr = bytestream_get_le32(&buf);
+     s->frames_per_packet = bytestream_get_le32(&buf);
+     if (s->frames_per_packet <= 0 ||
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index dff78ccc53..91ee6c6b0d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -46,6 +46,7 @@ SRC_URI = " \
     file://CVE-2024-36617.patch \
     file://CVE-2024-36618.patch \
     file://CVE-2024-36619.patch \
+    file://CVE-2024-35369.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


