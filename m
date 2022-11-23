Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E488C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 14:27:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21469.1669213644749047605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 06:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LFhtqVE+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83266cb750=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ANCcAqs020955
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 14:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=QarEe7Gp1itN4hdT5V76n4jY0S1+yH1DIR0p9D94IzA=;
 b=LFhtqVE+FfbNQZ6NDCLF90BuyKhQMgb5OkG+VIIDcLdt/v6BqZDwFg4HbSaKS+ZINyS2
 +l3+PmSFEwaOVFxfoAD5tDFkowuu5qzMvPKu/e6JHn4Z5esc78ML9BY0QgXJTZuvFNd8
 NOPUkE9kc7Qow7UkUwNxt83vdJmrE9x6Vd7bFCBhjVc/Fk+nfuoYKXMTUV5LPEpmIvG7
 8oj/dlL6QVDM5A0vnwFflHPedDQcsr/nAwd6Tt1iFr8I8Hh+J0b5kbtwlmU4WpqxhLPz
 rU3uY9mRqzgiSoZT8sxTTQZKg97R1DPexs8C5kpqSnZHSTjr91wstAwgMkFvrEKKfybQ /w== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj3fey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 14:27:23 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 23 Nov 2022 06:27:10 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2308.27 via Frontend Transport; Wed, 23 Nov 2022 06:27:08 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/2] ffmpeg: fix for CVE-2022-3964
Date: Wed, 23 Nov 2022 14:27:04 +0000
Message-ID: <20221123142704.149658-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0aYn1ap0MX8dkPLChHc4vQltfwGPkoqM
X-Proofpoint-ORIG-GUID: 0aYn1ap0MX8dkPLChHc4vQltfwGPkoqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 14:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173718

A vulnerability classified as problematic has been found in ffmpeg. This affects an unknown part of the file
libavcodec/rpzaenc.c of the component QuickTime RPZA Video Encoder. The manipulation of the argument y_size
leads to out-of-bounds read. It is possible to initiate the attack remotely. The name of the patch is
92f9b28ed84a77138105475beba16c146bdaf984. It is recommended to apply a patch to fix this issue. The associated
identifier of this vulnerability is VDB-213543.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3964

Upstream Fix:
https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bdaf984

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...c-stop-accessing-out-of-bounds-frame.patch | 89 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  2 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
new file mode 100644
index 0000000000..2775a81cc8
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
@@ -0,0 +1,89 @@
+From 92f9b28ed84a77138105475beba16c146bdaf984 Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Sat, 12 Nov 2022 16:12:00 +0100
+Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bdaf984]
+
+Signed-off-by: <narpat.mali@windriver.com>
+
+---
+ libavcodec/rpzaenc.c | 22 +++++++++++++++-------
+ 1 file changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/libavcodec/rpzaenc.c b/libavcodec/rpzaenc.c
+index d710eb4f82..4ced9523e2 100644
+--- a/libavcodec/rpzaenc.c
++++ b/libavcodec/rpzaenc.c
+@@ -205,7 +205,7 @@ static void get_max_component_diff(const BlockInfo *bi, const uint16_t *block_pt
+ 
+     // loop thru and compare pixels
+     for (y = 0; y < bi->block_height; y++) {
+-        for (x = 0; x < bi->block_width; x++){
++        for (x = 0; x < bi->block_width; x++) {
+             // TODO:  optimize
+             min_r = FFMIN(R(block_ptr[x]), min_r);
+             min_g = FFMIN(G(block_ptr[x]), min_g);
+@@ -278,7 +278,7 @@ static int leastsquares(const uint16_t *block_ptr, const BlockInfo *bi,
+         return -1;
+ 
+     for (i = 0; i < bi->block_height; i++) {
+-        for (j = 0; j < bi->block_width; j++){
++        for (j = 0; j < bi->block_width; j++) {
+             x = GET_CHAN(block_ptr[j], xchannel);
+             y = GET_CHAN(block_ptr[j], ychannel);
+             sumx += x;
+@@ -325,7 +325,7 @@ static int calc_lsq_max_fit_error(const uint16_t *block_ptr, const BlockInfo *bi
+     int max_err = 0;
+ 
+     for (i = 0; i < bi->block_height; i++) {
+-        for (j = 0; j < bi->block_width; j++){
++        for (j = 0; j < bi->block_width; j++) {
+             int x_inc, lin_y, lin_x;
+             x = GET_CHAN(block_ptr[j], xchannel);
+             y = GET_CHAN(block_ptr[j], ychannel);
+@@ -420,7 +420,9 @@ static void update_block_in_prev_frame(const uint16_t *src_pixels,
+                                        uint16_t *dest_pixels,
+                                        const BlockInfo *bi, int block_counter)
+ {
+-    for (int y = 0; y < 4; y++) {
++    const int y_size = FFMIN(4, bi->image_height - bi->row * 4);
++
++    for (int y = 0; y < y_size; y++) {
+         memcpy(dest_pixels, src_pixels, 8);
+         dest_pixels += bi->rowstride;
+         src_pixels += bi->rowstride;
+@@ -730,14 +732,15 @@ post_skip :
+ 
+             if (err > s->sixteen_color_thresh) { // DO SIXTEEN COLOR BLOCK
+                 uint16_t *row_ptr;
+-                int rgb555;
++                int y_size, rgb555;
+ 
+                 block_offset = get_block_info(&bi, block_counter);
+ 
+                 row_ptr = &src_pixels[block_offset];
++                y_size = FFMIN(4, bi.image_height - bi.row * 4);
+ 
+-                for (int y = 0; y < 4; y++) {
+-                    for (int x = 0; x < 4; x++){
++                for (int y = 0; y < y_size; y++) {
++                    for (int x = 0; x < 4; x++) {
+                         rgb555 = row_ptr[x] & ~0x8000;
+ 
+                         put_bits(&s->pb, 16, rgb555);
+@@ -745,6 +748,11 @@ post_skip :
+                     row_ptr += bi.rowstride;
+                 }
+ 
++                for (int y = y_size; y < 4; y++) {
++                    for (int x = 0; x < 4; x++)
++                        put_bits(&s->pb, 16, 0);
++                }
++
+                 block_counter++;
+             } else { // FOUR COLOR BLOCK
+                 block_counter += encode_four_color_block(min_color, max_color,
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index dd14f8df6f..e8e3462098 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
+           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
            "
+
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
-- 
2.34.1


