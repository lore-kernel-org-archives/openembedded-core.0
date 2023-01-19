Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4A4C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 17:20:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.51613.1674148840491689621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 09:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q/MXDqkn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=038351a438=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30JDDn0j026945
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=LsaQi28GfTrOqixNTuYVIgKjQH1ARsP2cwhdyQl7yOo=;
 b=Q/MXDqknMqpKBH3oVSra2WgRlVufXVG3REHQCgysCCZfPNQopXYfZ653qwYAjJaDXye0
 fsI0f2Rf76gG8Awt1hDUHhY1vixEGCuwsfDMlTTMU/+Pe/pspDfWtbu4EhjSoRtJq+k8
 asX1Sezmgwd/RyqIELVQrnvRk0XaQAF4hWnMquE7fYq6ldX1ur9yToHj6Iki0SjNaJpq
 TZk8ql6wLEQVhGo6Kx1zeMsE9RHM0WA7Q4Nv9lB9IkmcfGAvid1mEaYdFRb60dNeEVEc
 wMZW57a+gjtDyY3AP8+x4n+Xdb3q+IyhgW7pxI5A3s2kkfzqGhzyxiPld4EfjAW9/w+H WA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6nh3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:20:39 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 19 Jan 2023 09:20:38 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 09:20:36 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] ffmpeg: fix for CVE-2022-3341
Date: Thu, 19 Jan 2023 17:16:57 +0000
Message-ID: <20230119171657.656875-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Ymvqc3PQPM6y4jqvofb3LhKMpm0Qa6Ak
X-Proofpoint-ORIG-GUID: Ymvqc3PQPM6y4jqvofb3LhKMpm0Qa6Ak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_11,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176153

avformat/nutdec: Add check for avformat_new_stream
Check for failure of avformat_new_stream() and propagate
the error code.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...ec-Add-check-for-avformat_new_stream.patch | 67 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
new file mode 100644
index 00000000000..41d5884f880
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
@@ -0,0 +1,67 @@
+From 9cf652cef49d74afe3d454f27d49eb1a1394951e Mon Sep 17 00:00:00 2001
+From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
+Date: Wed, 23 Feb 2022 10:31:59 +0800
+Subject: [PATCH] avformat/nutdec: Add check for avformat_new_stream
+
+Check for failure of avformat_new_stream() and propagate
+the error code.
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2022-3341
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/9cf652cef49d74afe3d454f27d49eb1a1394951e]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ libavformat/nutdec.c | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/libavformat/nutdec.c b/libavformat/nutdec.c
+index 0a8a700acf..f9ad2c0af1 100644
+--- a/libavformat/nutdec.c
++++ b/libavformat/nutdec.c
+@@ -351,8 +351,12 @@ static int decode_main_header(NUTContext *nut)
+         ret = AVERROR(ENOMEM);
+         goto fail;
+     }
+-    for (i = 0; i < stream_count; i++)
+-        avformat_new_stream(s, NULL);
++    for (i = 0; i < stream_count; i++) {
++        if (!avformat_new_stream(s, NULL)) {
++            ret = AVERROR(ENOMEM);
++            goto fail;
++        }
++    }
+ 
+     return 0;
+ fail:
+@@ -800,19 +804,23 @@ static int nut_read_header(AVFormatContext *s)
+     NUTContext *nut = s->priv_data;
+     AVIOContext *bc = s->pb;
+     int64_t pos;
+-    int initialized_stream_count;
++    int initialized_stream_count, ret;
+ 
+     nut->avf = s;
+ 
+     /* main header */
+     pos = 0;
++    ret = 0;
+     do {
++        if (ret == AVERROR(ENOMEM))
++            return ret;
++
+         pos = find_startcode(bc, MAIN_STARTCODE, pos) + 1;
+         if (pos < 0 + 1) {
+             av_log(s, AV_LOG_ERROR, "No main startcode found.\n");
+             return AVERROR_INVALIDDATA;
+         }
+-    } while (decode_main_header(nut) < 0);
++    } while ((ret = decode_main_header(nut)) < 0);
+ 
+     /* stream headers */
+     pos = 0;
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 95b4bf50ace..57990331487 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
            file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
+           file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
            "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


