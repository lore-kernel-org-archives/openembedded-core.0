Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C318C0219C
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 15:41:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.72348.1738942888012492030
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 07:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4133c6c9d8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517FZZxo030183
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Feb 2025 15:41:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44h8u16tjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 15:41:27 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 7 Feb 2025 07:41:25 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 7 Feb 2025 07:41:24 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 6/8] ffmpeg: fix CVE-2024-36619
Date: Fri, 7 Feb 2025 15:41:11 +0000
Message-ID: <20250207154113.281835-6-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250207154113.281835-1-archana.polampalli@windriver.com>
References: <20250207154113.281835-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Yb2I6GgpeXoyuULhAnAxawKYp9UTqm_z
X-Authority-Analysis: v=2.4 cv=HuqMG1TS c=1 sm=1 tr=0 ts=67a629a7 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=4UUNWYyMJp9rmnlkn0oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Yb2I6GgpeXoyuULhAnAxawKYp9UTqm_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=936 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502070119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 15:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210989

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has a vulnerability in the WAVARC decoder of the libavcodec
library which allows for an integer overflow when handling certain block types,
leading to a denial-of-service (DoS) condition.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36619.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
new file mode 100644
index 0000000000..63d08eabcc
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
@@ -0,0 +1,36 @@
+From 28c7094b25b689185155a6833caf2747b94774a4 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 4 Apr 2024 00:15:27 +0200
+Subject: [PATCH] avcodec/wavarc: fix signed integer overflow in block type
+ 6/19
+
+Fixes: signed integer overflow: -2088796289 + -91276551 cannot be represented in type 'int'
+Fixes: 67772/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_WAVARC_fuzzer-6533568953122816
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-36619
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/28c7094b25b689185155a6833caf2747b94774a4]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/wavarc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/wavarc.c b/libavcodec/wavarc.c
+index 09ed4d4..51d91a4 100644
+--- a/libavcodec/wavarc.c
++++ b/libavcodec/wavarc.c
+@@ -648,7 +648,7 @@ static int decode_5elp(AVCodecContext *avctx,
+                 for (int o = 0; o < order; o++)
+                     sum += s->filter[ch][o] * (unsigned)samples[n + 70 - o - 1];
+
+-                samples[n + 70] += ac_out[n] + (sum >> 4);
++                samples[n + 70] += ac_out[n] + (unsigned)(sum >> 4);
+             }
+
+             for (int n = 0; n < 70; n++)
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 37416ef01a..dff78ccc53 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -45,6 +45,7 @@ SRC_URI = " \
     file://CVE-2024-36616.patch \
     file://CVE-2024-36617.patch \
     file://CVE-2024-36618.patch \
+    file://CVE-2024-36619.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


