Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4E8E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 08:50:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11436.1734079839233336515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 00:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=207735f8c4=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD7sXgG029034
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 00:50:39 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx1u6w6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 00:50:38 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 13 Dec 2024 00:50:38 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 13 Dec 2024 00:50:36 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 2/3] ffmpeg: fix CVE-2024-35367
Date: Fri, 13 Dec 2024 08:50:32 +0000
Message-ID: <20241213085033.3004012-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241213085033.3004012-1-archana.polampalli@windriver.com>
References: <20241213085033.3004012-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=H/shw/Yi c=1 sm=1 tr=0 ts=675bf55e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=emhf11hzAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=UqCG9HQmAAAA:8 a=pGLkceISAAAA:8
 a=SPn09uKQ3WBzzkKdk0IA:9 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 523vInJpV-OmaacNy62asPxfSyz5Bar4
X-Proofpoint-GUID: 523vInJpV-OmaacNy62asPxfSyz5Bar4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-13_03,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412130059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 08:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208673

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has an Out-of-bounds Read via libavcodec/ppc/vp8dsp_altivec.c,
static const vec_s8 h_subpel_filters_outer

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35367.patch        | 48 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
new file mode 100644
index 0000000000..16fe0a50b7
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
@@ -0,0 +1,48 @@
+From 09e6840cf7a3ee07a73c3ae88a020bf27ca1a667 Mon Sep 17 00:00:00 2001
+From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Date: Wed, 13 Mar 2024 02:10:26 +0100
+Subject: [PATCH] avcodec/ppc/vp8dsp_altivec: Fix out-of-bounds access
+
+h_subpel_filters_inner[i] and h_subpel_filters_outer[i / 2]
+belong together and the former allows the range 0..6,
+so the latter needs to support 0..3. But it has only three
+elements. Add another one.
+The value for the last element has been guesstimated
+from subpel_filters in libavcodec/vp8dsp.c.
+
+This is also intended to fix FATE-failures with UBSan here:
+https://fate.ffmpeg.org/report.cgi?time=20240312011016&slot=ppc-linux-gcc-13.2-ubsan-altivec-qemu
+
+Tested-by: Sean McGovern <gseanmcg@gmail.com>
+Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+
+CVE: CVE-2024-35367
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/09e6840cf7a3ee07a73c3ae88a020bf27ca1a667]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/ppc/vp8dsp_altivec.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/ppc/vp8dsp_altivec.c b/libavcodec/ppc/vp8dsp_altivec.c
+index 12dac8b..061914f 100644
+--- a/libavcodec/ppc/vp8dsp_altivec.c
++++ b/libavcodec/ppc/vp8dsp_altivec.c
+@@ -50,11 +50,12 @@ static const vec_s8 h_subpel_filters_inner[7] =
+ // for 6tap filters, these are the outer two taps
+ // The zeros mask off pixels 4-7 when filtering 0-3
+ // and vice-versa
+-static const vec_s8 h_subpel_filters_outer[3] =
++static const vec_s8 h_subpel_filters_outer[4] =
+ {
+     REPT4(0, 0, 2, 1),
+     REPT4(0, 0, 3, 3),
+     REPT4(0, 0, 1, 2),
++    REPT4(0, 0, 0, 0),
+ };
+ 
+ #define LOAD_H_SUBPEL_FILTER(i) \
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index f94c75abe6..fdb8d55cc2 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -38,6 +38,7 @@ SRC_URI = " \
     file://CVE-2023-49528.patch \
     file://CVE-2024-7055.patch \
     file://CVE-2024-35366.patch \
+    file://CVE-2024-35367.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


