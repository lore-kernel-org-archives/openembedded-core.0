Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 819156A487
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 02:04:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4F24CXL016385
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 19:04:12 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 14 May 2014 19:04:12 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 10:03:56 +0800
Message-ID: <314c1da66de15cffc08505a263cac07b728552fe.1400118419.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400118419.git.rongqing.li@windriver.com>
References: <cover.1400118419.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/12] Security Advisory - ffmpeg - CVE-2013-0852
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
X-List-Received-Date: Thu, 15 May 2014 02:04:11 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The parse_picture_segment function in libavcodec/pgssubdec.c in FFmpeg
before 1.1 allows remote attackers to have an unspecified impact via
crafted RLE data, which triggers an out-of-bounds array access.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0852

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...heck-RLE-size-before-copying.-Fix-out-of-.patch |   34 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch
new file mode 100644
index 0000000..3cf3a4c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch
@@ -0,0 +1,34 @@
+From 28bf685bfc6d0c744369cdf367f61a78d80d0b01 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Thu, 15 Nov 2012 16:41:28 +0100
+Subject: [PATCH] pgssubdec: check RLE size before copying. Fix out of array
+ accesses
+
+Commit 28bf685bfc6d0c744369cdf367f61a78d80d0b01 release/1.1
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit c0d68be555f5858703383040e04fcd6529777061)
+---
+ libavcodec/pgssubdec.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavcodec/pgssubdec.c b/libavcodec/pgssubdec.c
+index 728f178..26a3c2a 100644
+--- a/gst-libs/ext/libav/libavcodec/pgssubdec.c
++++ b/gst-libs/ext/libav/libavcodec/pgssubdec.c
+@@ -202,6 +202,11 @@ static int parse_picture_segment(AVCodec
+         return -1;
+     }
+ 
++    if (buf_size > rle_bitmap_len) {
++        av_log(avctx, AV_LOG_ERROR, "too much RLE data\n");
++        return AVERROR_INVALIDDATA;
++    }
++
+     ctx->picture.w = width;
+     ctx->picture.h = height;
+ 
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 430bcc7..eded98b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-huffyuvdec-Skip-len-0-cases.patch \
            file://0001-huffyuvdec-Check-init_vlc-return-codes.patch \
            file://0001-alsdec-check-block-length.patch \
+           file://0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


