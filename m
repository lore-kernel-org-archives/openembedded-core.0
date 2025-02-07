Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F45C0219D
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 15:41:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.72484.1738942886038269744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 07:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4133c6c9d8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517FZZxn030183
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Feb 2025 15:41:25 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44h8u16tj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 15:41:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 7 Feb 2025 07:41:24 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 7 Feb 2025 07:41:22 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 5/8] ffmpeg: fix CVE-2024-36618
Date: Fri, 7 Feb 2025 15:41:10 +0000
Message-ID: <20250207154113.281835-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250207154113.281835-1-archana.polampalli@windriver.com>
References: <20250207154113.281835-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: r4_qGgzruEOiPxOO1LWihviiR8SZJri4
X-Authority-Analysis: v=2.4 cv=HuqMG1TS c=1 sm=1 tr=0 ts=67a629a5 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=emhf11hzAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=UqCG9HQmAAAA:8 a=pGLkceISAAAA:8
 a=9wfn_qWQEZF2Y-pX74EA:9 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: r4_qGgzruEOiPxOO1LWihviiR8SZJri4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502070119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 15:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210988

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has a vulnerability in the AVI demuxer of the libavformat library
which allows for an integer overflow, potentially resulting in a denial-of-service
(DoS) condition.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36618.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
new file mode 100644
index 0000000000..5caca2da7c
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
@@ -0,0 +1,36 @@
+From 7a089ed8e049e3bfcb22de1250b86f2106060857 Mon Sep 17 00:00:00 2001
+From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Date: Tue, 12 Mar 2024 23:23:17 +0100
+Subject: [PATCH] avformat/avidec: Fix integer overflow iff ULONG_MAX <
+ INT64_MAX
+
+Affects many FATE-tests, see
+https://fate.ffmpeg.org/report.cgi?time=20240312011016&slot=ppc-linux-gcc-13.2-ubsan-altivec-qemu
+
+Reviewed-by: James Almer <jamrial@gmail.com>
+Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+
+CVE: CVE-2024-36618
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/7a089ed8e049e3bfcb22de1250b86f2106060857]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/avidec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/avidec.c b/libavformat/avidec.c
+index 00bd7a9..bc95466 100644
+--- a/libavformat/avidec.c
++++ b/libavformat/avidec.c
+@@ -1696,7 +1696,7 @@ static int check_stream_max_drift(AVFormatContext *s)
+     int *idx = av_calloc(s->nb_streams, sizeof(*idx));
+     if (!idx)
+         return AVERROR(ENOMEM);
+-    for (min_pos = pos = 0; min_pos != INT64_MAX; pos = min_pos + 1LU) {
++    for (min_pos = pos = 0; min_pos != INT64_MAX; pos = min_pos + 1ULL) {
+         int64_t max_dts = INT64_MIN / 2;
+         int64_t min_dts = INT64_MAX / 2;
+         int64_t max_buffer = 0;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 3ef2d9099d..37416ef01a 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -44,6 +44,7 @@ SRC_URI = " \
     file://CVE-2024-36613.patch \
     file://CVE-2024-36616.patch \
     file://CVE-2024-36617.patch \
+    file://CVE-2024-36618.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


