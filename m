Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 477116969A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 02:04:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4F248AD024760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 19:04:08 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 14 May 2014 19:04:07 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 10:03:53 +0800
Message-ID: <34e07b16aaa02184126d95942d778292ec07377e.1400118419.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400118419.git.rongqing.li@windriver.com>
References: <cover.1400118419.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/12] Security Advisory - ffmpeg - CVE-2014-2099
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
X-List-Received-Date: Thu, 15 May 2014 02:04:10 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The msrle_decode_frame function in libavcodec/msrle.c in FFmpeg before
2.1.4 does not properly calculate line sizes, which allows remote
attackers to cause a denial of service (out-of-bounds array access) or
possibly have unspecified other impact via crafted Microsoft RLE video
data.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2099

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...le-use-av_image_get_linesize-to-calculate.patch |   48 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch
new file mode 100644
index 0000000..1d5bba4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch
@@ -0,0 +1,48 @@
+From 573d5fdedae72bf59d8c0b0766fdee171063d36f Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Sun, 16 Feb 2014 23:08:52 +0100
+Subject: [PATCH] avcodec/msrle: use av_image_get_linesize() to calculate the
+ linesize
+
+Commit 573d5fdedae72bf59d8c0b0766fdee171063d36f release/0.9
+
+Fixes out of array access
+Fixes: 14a74a0a2dc67ede543f0e35d834fbbe-asan_heap-oob_49572c_556_cov_215466444_44_001_engine_room.mov
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit c919e1ca2ecfc47d796382973ba0e48b8f6f92a2)
+
+Conflicts:
+
+	libavcodec/msrle.c
+(cherry picked from commit bc1c8ec5e65098fd2ccd8456f667151dfc9cda42)
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/msrle.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/libavcodec/msrle.c b/libavcodec/msrle.c
+index 30159bb..c39ae7b 100644
+--- a/gst-libs/ext/libav/libavcodec/msrle.c
++++ b/gst-libs/ext/libav/libavcodec/msrle.c
+@@ -35,6 +35,7 @@
+ #include "avcodec.h"
+ #include "dsputil.h"
+ #include "msrledec.h"
++#include "libavutil/imgutils.h"
+ 
+ typedef struct MsrleContext {
+     AVCodecContext *avctx;
+@@ -107,7 +108,7 @@ static int msrle_decode_frame(AVCodecContext *avctx,
+ 
+     /* FIXME how to correctly detect RLE ??? */
+     if (avctx->height * istride == avpkt->size) { /* assume uncompressed */
+-        int linesize = avctx->width * avctx->bits_per_coded_sample / 8;
++        int linesize = av_image_get_linesize(avctx->pix_fmt, avctx->width, 0);
+         uint8_t *ptr = s->frame.data[0];
+         uint8_t *buf = avpkt->data + (avctx->height-1)*istride;
+         int i, j;
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 3d1f207..05cc404 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://gst-ffmpeg-CVE-2013-3674.patch \
            file://0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch \
            file://0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch \
+           file://0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


