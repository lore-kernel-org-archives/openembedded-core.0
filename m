Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E526C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 10:24:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43205.1723458249238074034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 03:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89547dcf27=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C5Bxh8002218
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 10:24:08 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40wxcuhnta-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 10:24:08 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 03:24:06 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/1] ffmpeg: fix CVE-2023-50008
Date: Mon, 12 Aug 2024 10:23:52 +0000
Message-ID: <20240812102352.2530499-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ciVNWsCGuwc30N-EnY4xNwZEKfvRfne6
X-Proofpoint-ORIG-GUID: ciVNWsCGuwc30N-EnY4xNwZEKfvRfne6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_01,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408120078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 10:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203217

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.n6.1-3-g466799d4f5 allows a local attacker
to execute arbitrary code via the av_malloc function in libavutil/mem.c:105:9 component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-50008.patch        | 29 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch
new file mode 100644
index 0000000000..4b8935628f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch
@@ -0,0 +1,29 @@
+From 5f87a68cf70dafeab2fb89b42e41a4c29053b89b Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Mon, 27 Nov 2023 12:08:20 +0100
+Subject: [PATCH] avfilter/vf_colorcorrect: fix memory leaks
+
+CVE: CVE-2023-50008
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/5f87a68cf70dafeab2fb89b42e41a4c29053b89b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/vf_colorcorrect.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libavfilter/vf_colorcorrect.c b/libavfilter/vf_colorcorrect.c
+index 1c4dea5..6bdec2c 100644
+--- a/libavfilter/vf_colorcorrect.c
++++ b/libavfilter/vf_colorcorrect.c
+@@ -497,6 +497,8 @@ static av_cold void uninit(AVFilterContext *ctx)
+     ColorCorrectContext *s = ctx->priv;
+
+     av_freep(&s->analyzeret);
++    av_freep(&s->uhistogram);
++    av_freep(&s->vhistogram);
+ }
+
+ static const AVFilterPad colorcorrect_inputs[] = {
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 05919e6ffd..9b74d78fb1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -30,6 +30,7 @@ SRC_URI = " \
     file://CVE-2023-49502.patch \
     file://CVE-2024-31578.patch \
     file://CVE-2024-31582.patch \
+    file://CVE-2023-50008.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


