Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A47CD75BC6
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 06:46:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5256.1732171556165900933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 22:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10557af3af=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL51giV022454
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 22:45:55 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7w61b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 22:45:55 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 20 Nov 2024 22:45:55 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 20 Nov 2024 22:45:53 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/5] ffmpeg: fix CVE-2024-32230
Date: Thu, 21 Nov 2024 06:45:48 +0000
Message-ID: <20241121064552.1847413-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kza1bYe4kwSGLCMwMkxB1LjjpZrX4NFd
X-Proofpoint-GUID: kza1bYe4kwSGLCMwMkxB1LjjpZrX4NFd
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673ed723 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=NIfUrUhfAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=U_SNzctGNJIZ9J2hwVYA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_05,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207512

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg 7.0 is vulnerable to Buffer Overflow. There is a negative-size-param
bug at libavcodec/mpegvideo_enc.c:1216:21 in load_input_picture in FFmpeg7.0

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-32230.patch        | 35 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
new file mode 100644
index 0000000000..0617b9b123
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
@@ -0,0 +1,35 @@
+From 96449cfeaeb95fcfd7a2b8d9ccf7719e97471ed1 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 8 Apr 2024 18:38:42 +0200
+Subject: [PATCH] avcodec/mpegvideo_enc: Fix 1 line and one column images
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
+index 128d1a3..3bd84cd 100644
+--- a/libavcodec/mpegvideo_enc.c
++++ b/libavcodec/mpegvideo_enc.c
+@@ -1130,8 +1130,8 @@ static int load_input_picture(MpegEncContext *s, const AVFrame *pic_arg)
+                     int dst_stride = i ? s->uvlinesize : s->linesize;
+                     int h_shift = i ? h_chroma_shift : 0;
+                     int v_shift = i ? v_chroma_shift : 0;
+-                    int w = s->width  >> h_shift;
+-                    int h = s->height >> v_shift;
++                    int w = AV_CEIL_RSHIFT(s->width , h_shift);
++                    int h = AV_CEIL_RSHIFT(s->height, v_shift);
+                     uint8_t *src = pic_arg->data[i];
+                     uint8_t *dst = pic->f->data[i];
+                     int vpad = 16;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 1295d5cdf1..40963d1254 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch \
            file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
            file://CVE-2022-48434.patch \
+           file://CVE-2024-32230.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.40.0


