Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD826A53E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 02:12:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4G2CWas019627
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 19:12:32 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 19:12:31 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 10:12:13 +0800
Message-ID: <522af9d3d5d3b5be70a6c729f22f7c0fced83d3f.1400201782.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400201782.git.rongqing.li@windriver.com>
References: <cover.1400201782.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/12] ffmpeg: fix for Security Advisory CVE-2013-0845
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
X-List-Received-Date: Fri, 16 May 2014 02:12:31 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

libavcodec/alsdec.c in FFmpeg before 1.0.4 allows remote attackers to
have an unspecified impact via a crafted block length, which triggers an
out-of-bounds write.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0845

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-alsdec-check-block-length.patch           |   61 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alsdec-check-block-length.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alsdec-check-block-length.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alsdec-check-block-length.patch
new file mode 100644
index 0000000..73980f4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alsdec-check-block-length.patch
@@ -0,0 +1,61 @@
+From 6df0d3e2916c223dbe4262bf1b876dff1cb3f980 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Wed, 12 Dec 2012 12:28:45 +0100
+Subject: [PATCH] alsdec: check block length
+
+Upstream-Status: Backport
+
+Commit 6df0d3e2916c223dbe4262bf1b876dff1cb3f980 release/1.0
+
+Fix writing over the end
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit 0ceca269b66ec12a23bf0907bd2c220513cdbf16)
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/alsdec.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/alsdec.c b/libavcodec/alsdec.c
+index 46dd0b4..1095b01 100644
+--- a/gst-libs/ext/libav/libavcodec/alsdec.c
++++ b/gst-libs/ext/libav/libavcodec/alsdec.c
+@@ -552,12 +552,15 @@ static void get_block_sizes(ALSDecContext *ctx, unsigned int *div_blocks,
+ 
+ /** Read the block data for a constant block
+  */
+-static void read_const_block_data(ALSDecContext *ctx, ALSBlockData *bd)
++static int read_const_block_data(ALSDecContext *ctx, ALSBlockData *bd)
+ {
+     ALSSpecificConfig *sconf = &ctx->sconf;
+     AVCodecContext *avctx    = ctx->avctx;
+     GetBitContext *gb        = &ctx->gb;
+ 
++    if (bd->block_length <= 0)
++        return -1;
++
+     *bd->raw_samples = 0;
+     *bd->const_block = get_bits1(gb);    // 1 = constant value, 0 = zero block (silence)
+     bd->js_blocks    = get_bits1(gb);
+@@ -572,6 +575,8 @@ static void read_const_block_data(ALSDecContext *ctx, ALSBlockData *bd)
+ 
+     // ensure constant block decoding by reusing this field
+     *bd->const_block = 1;
++
++    return 0;
+ }
+ 
+ 
+@@ -971,7 +976,8 @@ static int read_block(ALSDecContext *ctx, ALSBlockData *bd)
+         if (read_var_block_data(ctx, bd))
+             return -1;
+     } else {
+-        read_const_block_data(ctx, bd);
++        if (read_const_block_data(ctx, bd) < 0)
++            return -1;
+     }
+ 
+     return 0;
+-- 
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 847b927..430bcc7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch \
            file://0001-huffyuvdec-Skip-len-0-cases.patch \
            file://0001-huffyuvdec-Check-init_vlc-return-codes.patch \
+           file://0001-alsdec-check-block-length.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


