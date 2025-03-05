Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF68C282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 16:14:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17172.1741191293835149418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 08:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5159052c86=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525DxSC9007814
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 16:14:53 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux0wgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 16:14:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 5 Mar 2025 08:14:51 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 5 Mar 2025 08:14:50 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 3/5] ffmpeg: fix CVE-2025-25471
Date: Wed, 5 Mar 2025 16:14:41 +0000
Message-ID: <20250305161443.284930-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250305161443.284930-1-archana.polampalli@windriver.com>
References: <20250305161443.284930-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CUGXV2B3NkERG-7wRDo0SPH1hyh9o6Aj
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67c8787c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=TF2nC4Q-LnsVwOj9BvgA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CUGXV2B3NkERG-7wRDo0SPH1hyh9o6Aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_06,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=534 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 16:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212341

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg git master before commit fd1772 was discovered to contain a NULL pointer
dereference via the component libavformat/mov.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-25471.patch        | 39 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch
new file mode 100644
index 0000000000..6af01b298f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch
@@ -0,0 +1,39 @@
+From 1446e37d3d032e1452844778b3e6ba2c20f0c322 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Mon, 30 Dec 2024 00:25:41 -0300
+Subject: [PATCH] avfilter/buffersrc: check for valid sample rate
+
+A sample rate <= 0 is invalid.
+
+Fixes an assert in ffmpeg_enc.c that assumed a valid sample rate would be set.
+Fixes ticket #11385.
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2025-25471
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/1446e37d3d032e1452844778b3e6ba2c20f0c322]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/buffersrc.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavfilter/buffersrc.c b/libavfilter/buffersrc.c
+index 453fc0f..f49aa91 100644
+--- a/libavfilter/buffersrc.c
++++ b/libavfilter/buffersrc.c
+@@ -401,6 +401,11 @@ FF_ENABLE_DEPRECATION_WARNINGS
+         av_channel_layout_describe(&s->ch_layout, buf, sizeof(buf));
+     }
+
++    if (s->sample_rate <= 0) {
++        av_log(ctx, AV_LOG_ERROR, "Sample rate not set\n");
++        return AVERROR(EINVAL);
++    }
++
+     if (!s->time_base.num)
+         s->time_base = (AVRational){1, s->sample_rate};
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index cb6a50401b..6af43bcf37 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -48,6 +48,7 @@ SRC_URI = " \
     file://CVE-2024-36619.patch \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
+    file://CVE-2025-25471.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


