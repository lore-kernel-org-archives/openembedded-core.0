Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9408C3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 06:35:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1358.1722926153593772754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 23:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=894872e6a1=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4764e2to010413
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Aug 2024 06:35:52 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40sbh62e9g-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 06:35:52 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 23:35:49 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/1] ffmpeg: fix CVE-2024-31582
Date: Tue, 6 Aug 2024 06:35:37 +0000
Message-ID: <20240806063537.771496-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: nCdewaiI0NsXrhh-E4w92ZA7timYP8xl
X-Proofpoint-GUID: nCdewaiI0NsXrhh-E4w92ZA7timYP8xl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_05,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408060046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 06:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203012

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-31582.patch        | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
new file mode 100644
index 0000000000..2ade3ab6b1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
@@ -0,0 +1,34 @@
+From 1d1a05b393ece9fa3df825bfef3724b7370aefdc Mon Sep 17 00:00:00 2001
+From: Zhao Zhili <zhilizhao@tencent.com>
+Date: Fri, 29 Dec 2023 05:56:43 +0800
+Subject: [PATCH] avfilter/vf_codecview: fix heap buffer overflow
+
+And improve the performance by a little bit.
+
+Signed-off-by: Zhao Zhili <zhilizhao@tencent.com>
+
+CVE: CVE-2024-31582
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/99debe5f823f45a482e1dc08de35879aa9c74bd2]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/vf_codecview.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/libavfilter/vf_codecview.c b/libavfilter/vf_codecview.c
+index 55d9c8c..f65ccbd 100644
+--- a/libavfilter/vf_codecview.c
++++ b/libavfilter/vf_codecview.c
+@@ -216,9 +216,6 @@ static void draw_block_rectangle(uint8_t *buf, int sx, int sy, int w, int h, ptr
+         buf[sx + w - 1] = color;
+         buf += stride;
+     }
+-
+-    for (int x = sx; x < sx + w; x++)
+-        buf[x] = color;
+ }
+
+ static int filter_frame(AVFilterLink *inlink, AVFrame *frame)
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 06bd36e2e2..05919e6ffd 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://vulkan_fix_gcc14.patch \
     file://CVE-2023-49502.patch \
     file://CVE-2024-31578.patch \
+    file://CVE-2024-31582.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


