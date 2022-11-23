Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1333DC4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 14:21:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21149.1669213306548810430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 06:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RtlYStSY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83266cb750=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ANCcAqc020955
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 14:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=CEunOVYND7QPDZHGPa/cm5s+tInUVmEhoKmORnRAlHk=;
 b=RtlYStSYw9PNtCnAG3g8qut1AWmEeeBwHh1RoYVKeDmBXFno9am7RZiTFVenHB6EnNVG
 4LujV6z6FXfIOSeYQ7OM4b0/2wDZVnNwzBVn8yEDXKCKIHprGJleIJAZc5tnJC5N0+mN
 FZpv2F4fgxWButT0AVFAjVSUWONgRP0KFsauxIf4QxpOYU7sIvj6GWlJV+HU/iDr1/6U
 6SQgPhw52lyM/UlF1rCaR5zRGouCElMGjf2a2Jh0T4hrEGgjcTW95Z0rgHiTDQJ5QsbB
 5Bll9Rg9valulo0d+eNm1h+MlNsvM7gPiQI3dyxez9CutgNkmRXxdVD3uS3fItMDZVuz lA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj3fb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 14:21:45 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 23 Nov 2022 06:21:43 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2308.27 via Frontend Transport; Wed, 23 Nov 2022 06:21:42 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [OE-core][PATCH 2/2] ffmpeg: fix for CVE-2022-3965
Date: Wed, 23 Nov 2022 14:21:38 +0000
Message-ID: <20221123142138.140200-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zTjvV3JGXOHCJUFMmF3fxe3HkCztsnGA
X-Proofpoint-ORIG-GUID: zTjvV3JGXOHCJUFMmF3fxe3HkCztsnGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 14:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173717

A vulnerability classified as problematic was found in ffmpeg. This vulnerability affects the function
smc_encode_stream of the file libavcodec/smcenc.c of the component QuickTime Graphics Video Encoder. The
manipulation of the argument y_size leads to out-of-bounds read. The attack can be initiated remotely.
The name of the patch is 13c13109759090b7f7182480d075e13b36ed8edd. It is recommended to apply a patch to
fix this issue. The identifier of this vulnerability is VDB-213544.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3965

Upstream Fix:
https://github.com/FFmpeg/FFmpeg/commit/13c13109759090b7f7182480d075e13b36ed8edd

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...c-stop-accessing-out-of-bounds-frame.patch | 108 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |   4 +-
 2 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
new file mode 100644
index 0000000000..923fc6a9c1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
@@ -0,0 +1,108 @@
+From 13c13109759090b7f7182480d075e13b36ed8edd Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Sat, 12 Nov 2022 15:19:21 +0100
+Subject: [PATCH] avcodec/smcenc: stop accessing out of bounds frame
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/13c13109759090b7f7182480d075e13b36ed8edd]
+
+Signed-off-by: <narpat.mali@windriver.com>
+
+---
+ libavcodec/smcenc.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/libavcodec/smcenc.c b/libavcodec/smcenc.c
+index f3d26a4e8d..33549b8ab4 100644
+--- a/libavcodec/smcenc.c
++++ b/libavcodec/smcenc.c
+@@ -61,6 +61,7 @@ typedef struct SMCContext {
+         { \
+             row_ptr += stride * 4; \
+             pixel_ptr = row_ptr; \
++            cur_y += 4; \
+         } \
+     } \
+ }
+@@ -117,6 +118,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+     const uint8_t *prev_pixels = (const uint8_t *)s->prev_frame->data[0];
+     uint8_t *distinct_values = s->distinct_values;
+     const uint8_t *pixel_ptr, *row_ptr;
++    const int height = frame->height;
+     const int width = frame->width;
+     uint8_t block_values[16];
+     int block_counter = 0;
+@@ -125,13 +127,14 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+     int color_octet_index = 0;
+     int color_table_index;  /* indexes to color pair, quad, or octet tables */
+     int total_blocks;
++    int cur_y = 0;
+ 
+     memset(s->color_pairs, 0, sizeof(s->color_pairs));
+     memset(s->color_quads, 0, sizeof(s->color_quads));
+     memset(s->color_octets, 0, sizeof(s->color_octets));
+ 
+     /* Number of 4x4 blocks in frame. */
+-    total_blocks = ((frame->width + 3) / 4) * ((frame->height + 3) / 4);
++    total_blocks = ((width + 3) / 4) * ((height + 3) / 4);
+ 
+     pixel_ptr = row_ptr = src_pixels;
+ 
+@@ -145,11 +148,13 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+         int cache_index;
+         int distinct = 0;
+         int blocks = 0;
++        int frame_y = cur_y;
+ 
+         while (prev_pixels && s->key_frame == 0 && block_counter + inter_skip_blocks < total_blocks) {
++            const int y_size = FFMIN(4, height - cur_y);
+             int compare = 0;
+ 
+-            for (int y = 0; y < 4; y++) {
++            for (int y = 0; y < y_size; y++) {
+                 const ptrdiff_t offset = pixel_ptr - src_pixels;
+                 const uint8_t *prev_pixel_ptr = prev_pixels + offset;
+ 
+@@ -170,8 +175,10 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+ 
+         pixel_ptr = xpixel_ptr;
+         row_ptr = xrow_ptr;
++        cur_y = frame_y;
+ 
+         while (block_counter > 0 && block_counter + intra_skip_blocks < total_blocks) {
++            const int y_size = FFMIN(4, height - cur_y);
+             const ptrdiff_t offset = pixel_ptr - src_pixels;
+             const int sy = offset / stride;
+             const int sx = offset % stride;
+@@ -180,7 +187,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+             const uint8_t *old_pixel_ptr = src_pixels + nx + ny * stride;
+             int compare = 0;
+ 
+-            for (int y = 0; y < 4; y++) {
++            for (int y = 0; y < y_size; y++) {
+                 compare |= memcmp(old_pixel_ptr + y * stride, pixel_ptr + y * stride, 4);
+                 if (compare)
+                     break;
+@@ -197,9 +204,11 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+ 
+         pixel_ptr = xpixel_ptr;
+         row_ptr = xrow_ptr;
++        cur_y = frame_y;
+ 
+         while (block_counter + coded_blocks < total_blocks && coded_blocks < 256) {
+-            for (int y = 0; y < 4; y++)
++            const int y_size = FFMIN(4, height - cur_y);
++            for (int y = 0; y < y_size; y++)
+                 memcpy(block_values + y * 4, pixel_ptr + y * stride, 4);
+ 
+             qsort(block_values, 16, sizeof(block_values[0]), smc_cmp_values);
+@@ -224,6 +233,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
+ 
+         pixel_ptr = xpixel_ptr;
+         row_ptr = xrow_ptr;
++        cur_y = frame_y;
+ 
+         blocks = coded_blocks;
+         distinct = coded_distinct;
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
index 43b858984b..06eca4fefe 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
@@ -23,7 +23,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch"
+           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
+           file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
+           "
 
 SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
 
-- 
2.34.1


