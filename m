Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C1D716A937
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 01:52:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4K1qeBW024575
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 18:52:41 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 18:52:37 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 09:52:14 +0800
Message-ID: <6fddfc68160d3c7fc157c49c1c1f848a93dd93a1.1400550433.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400550433.git.rongqing.li@windriver.com>
References: <cover.1400550433.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/12] gst-ffmpeg: fix for Security Advisory CVE-2013-0854
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
X-List-Received-Date: Tue, 20 May 2014 01:52:40 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The mjpeg_decode_scan_progressive_ac function in libavcodec/mjpegdec.c
in FFmpeg before 1.1 allows remote attackers to have an unspecified
impact via crafted MJPEG data.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0854

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-mjpegdec-check-SE.patch                   |   32 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjpegdec-check-SE.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjpegdec-check-SE.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjpegdec-check-SE.patch
new file mode 100644
index 0000000..d90bafa
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjpegdec-check-SE.patch
@@ -0,0 +1,32 @@
+From 1f41cffe1e3e79620f587545bdfcbd7e6e68ed29 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Sun, 11 Nov 2012 00:01:24 +0100
+Subject: [PATCH] mjpegdec: check SE.
+
+Upstream-Status: Backport
+
+Commit 1f41cffe1e3e79620f587545bdfcbd7e6e68ed29 release/1.1
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/mjpegdec.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavcodec/mjpegdec.c b/libavcodec/mjpegdec.c
+index 6b5266d..0a71a6f 100644
+--- a/gst-libs/ext/libav/libavcodec/mjpegdec.c
++++ b/gst-libs/ext/libav/libavcodec/mjpegdec.c
+@@ -905,6 +905,11 @@ static int mjpeg_decode_scan_progressive
+     int16_t *quant_matrix = s->quant_matrixes[ s->quant_index[c] ];
+     GetBitContext mb_bitmask_gb;
+ 
++    if (se > 63) {
++        av_log(s->avctx, AV_LOG_ERROR, "SE %d is too large\n", se);
++        return AVERROR_INVALIDDATA;
++    }
++
+     if (mb_bitmask) {
+         init_get_bits(&mb_bitmask_gb, mb_bitmask, s->mb_width*s->mb_height);
+     }
+-- 
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 0d0ba9a..28ea29e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch \
            file://0001-atrac3dec-Check-coding-mode-against-channels.patch \
            file://0001-eamad-fix-out-of-array-accesses.patch \
+           file://0001-mjpegdec-check-SE.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


