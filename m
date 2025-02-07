Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4A8C0219C
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 15:41:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.72482.1738942882405781532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 07:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4133c6c9d8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517FYGJK008144
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Feb 2025 15:41:21 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8err3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 15:41:21 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 7 Feb 2025 07:41:20 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 7 Feb 2025 07:41:18 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 3/8] ffmpeg: fix CVE-2024-36616
Date: Fri, 7 Feb 2025 15:41:08 +0000
Message-ID: <20250207154113.281835-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250207154113.281835-1-archana.polampalli@windriver.com>
References: <20250207154113.281835-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ecXHf6EH c=1 sm=1 tr=0 ts=67a629a1 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=82Cr7RGH3xNVZYPddgwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: J_B2WsL4EtqTBOUdjuT3AeHlAJC6C0h1
X-Proofpoint-GUID: J_B2WsL4EtqTBOUdjuT3AeHlAJC6C0h1
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
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 15:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210986

From: Archana Polampalli <archana.polampalli@windriver.com>

An integer overflow in the component /libavformat/westwood_vqa.c of FFmpeg n6.1.1
allows attackers to cause a denial of service in the application via a crafted VQA file.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36616.patch        | 35 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
new file mode 100644
index 0000000000..3f02c45b33
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
@@ -0,0 +1,35 @@
+From 86f73277bf014e2ce36dd2594f1e0fb8b3bd6661 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 26 Mar 2024 01:00:13 +0100
+Subject: [PATCH] avformat/westwood_vqa: Fix 2g packets
+
+Fixes: signed integer overflow: 2147483424 * 2 cannot be represented in type 'int'
+Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_WSVQA_fuzzer-4576211411795968
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-36616
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/86f73277bf014e2ce36dd2594f1e0fb8b3bd6661]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/westwood_vqa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/westwood_vqa.c b/libavformat/westwood_vqa.c
+index 03b2d9e..024f5d3 100644
+--- a/libavformat/westwood_vqa.c
++++ b/libavformat/westwood_vqa.c
+@@ -262,7 +262,7 @@ static int wsvqa_read_packet(AVFormatContext *s,
+                     break;
+                 case SND2_TAG:
+                     /* 2 samples/byte, 1 or 2 samples per frame depending on stereo */
+-                    pkt->duration = (chunk_size * 2) / wsvqa->channels;
++                    pkt->duration = (chunk_size * 2LL) / wsvqa->channels;
+                     break;
+                 }
+                 break;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 5e22fd4080..3a18580e51 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -42,6 +42,7 @@ SRC_URI = " \
     file://CVE-2024-35368.patch \
     file://CVE-2024-35365.patch \
     file://CVE-2024-36613.patch \
+    file://CVE-2024-36616.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


