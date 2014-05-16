Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 45CEF6A382
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 02:12:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4G2CNsf009575
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 19:12:23 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 19:12:21 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 10:12:10 +0800
Message-ID: <8756226078972a5286277cd6be420673479dd20d.1400201782.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400201782.git.rongqing.li@windriver.com>
References: <cover.1400201782.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] ffmpeg: fix for Security Advisory CVE-2013-0865
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
X-List-Received-Date: Fri, 16 May 2014 02:12:22 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The vqa_decode_chunk function in libavcodec/vqavideo.c in FFmpeg before
1.0.4 and 1.1.x before 1.1.2 allows remote attackers to have an
unspecified impact via a large (1) cbp0 or (2) cbpz chunk in Westwood
Studios VQA Video file, which triggers an out-of-bounds write.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0865

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...o-check-chunk-sizes-before-reading-chunks.patch |   51 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch
new file mode 100644
index 0000000..7e4f682
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch
@@ -0,0 +1,51 @@
+From 2cac35086c9e103fa98960c546d5017e7363803a Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Fri, 25 Jan 2013 06:11:59 +0100
+Subject: [PATCH] vqavideo: check chunk sizes before reading chunks
+
+Upstream-Status: Backport
+
+Commit 2cac35086c9e103fa98960c546d5017e7363803a release/0.7
+
+Fixes out of array writes
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit ab6c9332bfa1e20127a16392a0b85a4aa4840889)
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/vqavideo.c |   10 ++++++++++
+ 1 files changed, 10 insertions(+), 0 deletions(-)
+
+diff --git a/libavcodec/vqavideo.c b/libavcodec/vqavideo.c
+index d1eab5b..6e1ce6c 100644
+--- a/gst-libs/ext/libav/libavcodec/vqavideo.c
++++ b/gst-libs/ext/libav/libavcodec/vqavideo.c
+@@ -527,6 +527,11 @@ static void vqa_decode_chunk(VqaContext *s)
+         chunk_size = AV_RB32(&s->buf[cbp0_chunk + 4]);
+         cbp0_chunk += CHUNK_PREAMBLE_SIZE;
+ 
++        if (chunk_size > MAX_CODEBOOK_SIZE - s->next_codebook_buffer_index) {
++            av_log(s->avctx, AV_LOG_ERROR, "cbp0 chunk too large (0x%X bytes)\n", chunk_size);
++            return AVERROR_INVALIDDATA;
++        }
++
+         /* accumulate partial codebook */
+         memcpy(&s->next_codebook_buffer[s->next_codebook_buffer_index],
+             &s->buf[cbp0_chunk], chunk_size);
+@@ -550,6 +555,11 @@ static void vqa_decode_chunk(VqaContext *s)
+         chunk_size = AV_RB32(&s->buf[cbpz_chunk + 4]);
+         cbpz_chunk += CHUNK_PREAMBLE_SIZE;
+ 
++        if (chunk_size > MAX_CODEBOOK_SIZE - s->next_codebook_buffer_index) {
++            av_log(s->avctx, AV_LOG_ERROR, "cbpz chunk too large (0x%X bytes)\n", chunk_size);
++            return AVERROR_INVALIDDATA;
++        }
++
+         /* accumulate partial codebook */
+         memcpy(&s->next_codebook_buffer[s->next_codebook_buffer_index],
+             &s->buf[cbpz_chunk], chunk_size);
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 4913539..3d1f207 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libav_e5500.patch \
            file://gst-ffmpeg-CVE-2013-3674.patch \
            file://0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch \
+           file://0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


