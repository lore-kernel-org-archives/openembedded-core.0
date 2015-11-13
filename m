Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1927716A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:03:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAD83UPJ015607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 00:03:30 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 00:03:30 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 16:03:26 +0800
Message-ID: <6b118d8881280d18c5e3f673e4b5cafd18e9d17b.1447401669.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447401669.git.jackie.huang@windriver.com>
References: <cover.1447401669.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] libav: fix CVE-2015-3395
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Nov 2015 08:03:31 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Cherry-pick patch from ffmpeg to fix CVE-2015-3395:
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=f7e1367f58263593e6cee3c282f7277d7ee9d553

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libav/libav/libav-fix-CVE-2015-3395.patch      | 113 +++++++++++++++++++++
 meta/recipes-multimedia/libav/libav_9.18.bb        |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-3395.patch

diff --git a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-3395.patch b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-3395.patch
new file mode 100644
index 0000000..9ee4288
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-3395.patch
@@ -0,0 +1,113 @@
+Upstream-Status: Pending
+
+https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-3395
+
+Cherry-pick from:
+http://git.videolan.org/?p=ffmpeg.git;a=commit;h=f7e1367f58263593e6cee3c282f7277d7ee9d553
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+From f7e1367f58263593e6cee3c282f7277d7ee9d553 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Tue, 24 Mar 2015 15:50:12 +0100
+Subject: [PATCH] avcodec/msrledec: restructure msrle_decode_pal4() based on
+ the line number instead of the pixel pointer
+
+Fixes out of array access
+Fixes: da14e86d8462be6493eab16bc2d40f88/asan_heap-oob_204cfd2_528_cov_340150052_COMPRESS.BMP
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/msrledec.c | 25 +++++++++++--------------
+ 1 file changed, 11 insertions(+), 14 deletions(-)
+
+diff --git a/libavcodec/msrledec.c b/libavcodec/msrledec.c
+index 4d3da5b..deb6f86 100644
+--- a/libavcodec/msrledec.c
++++ b/libavcodec/msrledec.c
+@@ -37,16 +37,14 @@ static int msrle_decode_pal4(AVCodecContext *avctx, AVPicture *pic,
+     unsigned char extra_byte, odd_pixel;
+     unsigned char stream_byte;
+     unsigned int pixel_ptr = 0;
+-    int row_dec = pic->linesize[0];
+-    int row_ptr = (avctx->height - 1) * row_dec;
+-    int frame_size = row_dec * avctx->height;
++    int line = avctx->height - 1;
+     int i;
+ 
+-    while (row_ptr >= 0) {
++    while (line >= 0 && pixel_ptr <= avctx->width) {
+         if (bytestream2_get_bytes_left(gb) <= 0) {
+             av_log(avctx, AV_LOG_ERROR,
+-                   "MS RLE: bytestream overrun, %d rows left\n",
+-                   row_ptr);
++                   "MS RLE: bytestream overrun, %dx%d left\n",
++                   avctx->width - pixel_ptr, line);
+             return AVERROR_INVALIDDATA;
+         }
+         rle_code = stream_byte = bytestream2_get_byteu(gb);
+@@ -55,7 +53,7 @@ static int msrle_decode_pal4(AVCodecContext *avctx, AVPicture *pic,
+             stream_byte = bytestream2_get_byte(gb);
+             if (stream_byte == 0) {
+                 /* line is done, goto the next one */
+-                row_ptr -= row_dec;
++                line--;
+                 pixel_ptr = 0;
+             } else if (stream_byte == 1) {
+                 /* decode is done */
+@@ -65,13 +63,12 @@ static int msrle_decode_pal4(AVCodecContext *avctx, AVPicture *pic,
+                 stream_byte = bytestream2_get_byte(gb);
+                 pixel_ptr += stream_byte;
+                 stream_byte = bytestream2_get_byte(gb);
+-                row_ptr -= stream_byte * row_dec;
+             } else {
+                 // copy pixels from encoded stream
+                 odd_pixel =  stream_byte & 1;
+                 rle_code = (stream_byte + 1) / 2;
+                 extra_byte = rle_code & 0x01;
+-                if (row_ptr + pixel_ptr + stream_byte > frame_size ||
++                if (pixel_ptr + 2*rle_code - odd_pixel > avctx->width ||
+                     bytestream2_get_bytes_left(gb) < rle_code) {
+                     av_log(avctx, AV_LOG_ERROR,
+                            "MS RLE: frame/stream ptr just went out of bounds (copy)\n");
+@@ -82,13 +79,13 @@ static int msrle_decode_pal4(AVCodecContext *avctx, AVPicture *pic,
+                     if (pixel_ptr >= avctx->width)
+                         break;
+                     stream_byte = bytestream2_get_byteu(gb);
+-                    pic->data[0][row_ptr + pixel_ptr] = stream_byte >> 4;
++                    pic->data[0][line * pic->linesize[0] + pixel_ptr] = stream_byte >> 4;
+                     pixel_ptr++;
+                     if (i + 1 == rle_code && odd_pixel)
+                         break;
+                     if (pixel_ptr >= avctx->width)
+                         break;
+-                    pic->data[0][row_ptr + pixel_ptr] = stream_byte & 0x0F;
++                    pic->data[0][line * pic->linesize[0] + pixel_ptr] = stream_byte & 0x0F;
+                     pixel_ptr++;
+                 }
+ 
+@@ -98,7 +95,7 @@ static int msrle_decode_pal4(AVCodecContext *avctx, AVPicture *pic,
+             }
+         } else {
+             // decode a run of data
+-            if (row_ptr + pixel_ptr + stream_byte > frame_size) {
++            if (pixel_ptr + rle_code > avctx->width + 1) {
+                 av_log(avctx, AV_LOG_ERROR,
+                        "MS RLE: frame ptr just went out of bounds (run)\n");
+                 return AVERROR_INVALIDDATA;
+@@ -108,9 +105,9 @@ static int msrle_decode_pal4(AVCodecContext *avctx, AVPicture *pic,
+                 if (pixel_ptr >= avctx->width)
+                     break;
+                 if ((i & 1) == 0)
+-                    pic->data[0][row_ptr + pixel_ptr] = stream_byte >> 4;
++                    pic->data[0][line * pic->linesize[0] + pixel_ptr] = stream_byte >> 4;
+                 else
+-                    pic->data[0][row_ptr + pixel_ptr] = stream_byte & 0x0F;
++                    pic->data[0][line * pic->linesize[0] + pixel_ptr] = stream_byte & 0x0F;
+                 pixel_ptr++;
+             }
+         }
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/libav/libav_9.18.bb b/meta/recipes-multimedia/libav/libav_9.18.bb
index c2dd02c..4564def 100644
--- a/meta/recipes-multimedia/libav/libav_9.18.bb
+++ b/meta/recipes-multimedia/libav/libav_9.18.bb
@@ -5,4 +5,5 @@ SRC_URI[sha256sum] = "0875e835da683eef1a7bac75e1884634194149d7479d1538ba9fbe1614
 
 SRC_URI += "file://libav-fix-CVE-2014-9676.patch \
             file://libav-fix-CVE-2015-1872.patch \
+            file://libav-fix-CVE-2015-3395.patch \
            "
-- 
1.9.1


