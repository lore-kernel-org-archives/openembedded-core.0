Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EE9C5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 13:57:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53448.1724680614002665182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 06:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8968701cd6=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q3qJFk011326
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 06:56:53 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1k9k0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 06:56:53 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 06:56:52 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 06:56:51 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/1] ffmpeg: fix CVE-2024-32230
Date: Mon, 26 Aug 2024 13:56:50 +0000
Message-ID: <20240826135650.3956156-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: o3f2fbDodEfKHmnMH3wSzNUvfkPXVhxv
X-Authority-Analysis: v=2.4 cv=McQ+uI/f c=1 sm=1 tr=0 ts=66cc89a5 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=NIfUrUhfAAAA:8 a=X-cdneaDRLyUZ8XqXu4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: o3f2fbDodEfKHmnMH3wSzNUvfkPXVhxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_10,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408260107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 13:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203752

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg 7.0 is vulnerable to Buffer Overflow. There is a negative-size-param bug at
libavcodec/mpegvideo_enc.c:1216:21 in load_input_picture in FFmpeg7.0

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-32230.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
new file mode 100644
index 0000000000..0f30c9ecf5
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
@@ -0,0 +1,36 @@
+From 96449cfeaeb95fcfd7a2b8d9ccf7719e97471ed1 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 8 Apr 2024 18:38:42 +0200
+Subject: [PATCH]  avcodec/mpegvideo_enc: Fix 1 line and one column images
+
+Fixes: Ticket10952
+Fixes: poc21ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-32230
+
+Upstream-Status: Backport [https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=96449cfeaeb95fcfd7a2b8d9ccf7719e97471ed1]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/mpegvideo_enc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/mpegvideo_enc.c b/libavcodec/mpegvideo_enc.c
+index e460ca4..fb4aaa2 100644
+--- a/libavcodec/mpegvideo_enc.c
++++ b/libavcodec/mpegvideo_enc.c
+@@ -1198,8 +1198,8 @@ static int load_input_picture(MpegEncContext *s, const AVFrame *pic_arg)
+                 int dst_stride = i ? s->uvlinesize : s->linesize;
+                 int h_shift = i ? s->chroma_x_shift : 0;
+                 int v_shift = i ? s->chroma_y_shift : 0;
+-                int w = s->width  >> h_shift;
+-                int h = s->height >> v_shift;
++                int w = AV_CEIL_RSHIFT(s->width , h_shift);
++                int h = AV_CEIL_RSHIFT(s->height, v_shift);
+                 const uint8_t *src = pic_arg->data[i];
+                 uint8_t *dst = pic->f->data[i];
+                 int vpad = 16;
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 9b74d78fb1..13051f4e36 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -31,6 +31,7 @@ SRC_URI = " \
     file://CVE-2024-31578.patch \
     file://CVE-2024-31582.patch \
     file://CVE-2023-50008.patch \
+    file://CVE-2024-32230.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


