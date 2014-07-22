Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB7607029A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:46:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6M7kxZ1015116
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:46:59 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 00:46:59 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 15:46:45 +0800
Message-ID: <8e5d3962a2de0d5fd60e527ec478bc3f1a755cc2.1406015054.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406015054.git.rongqing.li@windriver.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0848
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
X-List-Received-Date: Tue, 22 Jul 2014 07:46:58 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The decode_init function in libavcodec/huffyuv.c in FFmpeg before 1.1
allows remote attackers to have an unspecified impact via a crafted
width in huffyuv data with the predictor set to median and the
colorspace set to YUV422P, which triggers an out-of-bounds array access.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0848

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...check-width-more-completely-avoid-out-of-.patch |   30 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch
new file mode 100644
index 0000000..6b60d16
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch
@@ -0,0 +1,30 @@
+gst-ffmpeg: huffyuvdec: check width more completely, avoid out of array
+ accesses
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+
+Upstream-Status: Backport 
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/huffyuv.c |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/libavcodec/huffyuv.c b/libavcodec/huffyuv.c
+index 6e88114..ca5bcd8 100644
+--- a/gst-libs/ext/libav/libavcodec/huffyuv.c
++++ b/gst-libs/ext/libav/libavcodec/huffyuv.c
+@@ -526,6 +526,10 @@ s->bgr32=1;
+         assert(0);
+     }
+ 
++    if (s->predictor == MEDIAN && avctx->pix_fmt == AV_PIX_FMT_YUV422P && avctx->width%4) {
++        av_log(avctx, AV_LOG_ERROR, "width must be a multiple of 4 this colorspace and predictor\n");
++        return AVERROR_INVALIDDATA;
++    }
+     alloc_temp(s);
+ 
+ //    av_log(NULL, AV_LOG_DEBUG, "pred:%d bpp:%d hbpp:%d il:%d\n", s->predictor, s->bitstream_bpp, avctx->bits_per_coded_sample, s->interlaced);
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 345086e..7e3d7d6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch \
            file://gst-ffmpeg-CVE-2013-0855.patch \
            file://0001-qdm2dec-fix-buffer-overflow.patch \
+           file://0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


