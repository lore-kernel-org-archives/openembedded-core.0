Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1E7C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 16:15:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17176.1741191298742394780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 08:14:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5159052c86=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525BTu5j029988
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 16:14:58 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456ct88wqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 16:14:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 5 Mar 2025 08:14:56 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 5 Mar 2025 08:14:54 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 5/5] ffmpeg: fix CVE-2025-0518
Date: Wed, 5 Mar 2025 16:14:43 +0000
Message-ID: <20250305161443.284930-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250305161443.284930-1-archana.polampalli@windriver.com>
References: <20250305161443.284930-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vYcIu4vDqI9xlRX4Z2JLFAy2yZKnIl1o
X-Proofpoint-ORIG-GUID: vYcIu4vDqI9xlRX4Z2JLFAy2yZKnIl1o
X-Authority-Analysis: v=2.4 cv=D4W9KuRj c=1 sm=1 tr=0 ts=67c87881 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=-uYbXFN5AAAA:8 a=QS0dBJcK3MCYUucm6esA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=BgOh09bUvQbaRh_aUNoE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_06,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 16:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212343

From: Archana Polampalli <archana.polampalli@windriver.com>

Unchecked Return Value, Out-of-bounds Read vulnerability in FFmpeg allows
Read Sensitive Constants Within an Executable. This vulnerability is associated
with program files https://github.Com/FFmpeg/FFmpeg/blob/master/libavfilter/af_pan.C
This issue affects FFmpeg: 7.1.
Issue was fixed:  https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a
https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a
This issue was discovered by: Simcha Kosma

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-0518.patch         | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
new file mode 100644
index 0000000000..d3e02bebe6
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
@@ -0,0 +1,34 @@
+From b5b6391d64807578ab872dc58fb8aa621dcfc38a Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 6 Jan 2025 22:01:39 +0100
+Subject: [PATCH] avfilter/af_pan: Fix sscanf() use
+
+Fixes: Memory Data Leak
+
+Found-by: Simcha Kosman <simcha.kosman@cyberark.com>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2025-0518
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/af_pan.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavfilter/af_pan.c b/libavfilter/af_pan.c
+index cfed9f1..ffcd214 100644
+--- a/libavfilter/af_pan.c
++++ b/libavfilter/af_pan.c
+@@ -165,7 +165,7 @@ static av_cold int init(AVFilterContext *ctx)
+         sign = 1;
+         while (1) {
+             gain = 1;
+-            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len))
++            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len) >= 1)
+                 arg += len;
+             if (parse_channel_name(&arg, &in_ch_id, &named)){
+                 av_log(ctx, AV_LOG_ERROR,
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index bd1259d392..06ca65a480 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -50,6 +50,7 @@ SRC_URI = " \
     file://CVE-2025-25473.patch \
     file://CVE-2025-25471.patch \
     file://CVE-2025-22921.patch \
+    file://CVE-2025-0518.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


