Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C202704FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 06:16:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6M6GPiG003777
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 23:16:25 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 21 Jul 2014 23:16:25 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 14:16:10 +0800
Message-ID: <1ab4e3a922b0b3cad9f2715ded61f95d63de5b9b.1406006666.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406006666.git.rongqing.li@windriver.com>
References: <cover.1406006666.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-4351
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
X-List-Received-Date: Tue, 22 Jul 2014 06:16:24 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Buffer overflow in FFmpeg before 0.5.6, 0.6.x before 0.6.4, 0.7.x before
0.7.8, and 0.8.x before 0.8.8 allows remote attackers to execute
arbitrary code via unspecified vectors.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4351

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-qdm2dec-fix-buffer-overflow.patch         |   58 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2dec-fix-buffer-overflow.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2dec-fix-buffer-overflow.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2dec-fix-buffer-overflow.patch
new file mode 100644
index 0000000..d1e370d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2dec-fix-buffer-overflow.patch
@@ -0,0 +1,58 @@
+gst-ffmpeg: qdm2dec: fix buffer overflow. Fixes NGS00144
+
+This also adds a few lines of code from master that are needed for this fix.
+
+Thanks to Phillip for suggestions to improve the patch.
+Found-by: Phillip Langlois
+
+Upstream-Status: Pending
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/qdm2.c |    9 +++++++--
+ 1 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/qdm2.c b/libavcodec/qdm2.c
+index 3aa9e5b..e000df8 100644
+--- a/gst-libs/ext/libav/libavcodec/qdm2.c
++++ b/gst-libs/ext/libav/libavcodec/qdm2.c
+@@ -76,6 +76,7 @@ do { \
+ #define SAMPLES_NEEDED_2(why) \
+      av_log (NULL,AV_LOG_INFO,"This file triggers some missing code. Please contact the developers.\nPosition: %s\n",why);
+ 
++#define QDM2_MAX_FRAME_SIZE 512
+ 
+ typedef int8_t sb_int8_array[2][30][64];
+ 
+@@ -168,7 +169,7 @@ typedef struct {
+     /// I/O data
+     const uint8_t *compressed_data;
+     int compressed_size;
+-    float output_buffer[1024];
++    float output_buffer[QDM2_MAX_FRAME_SIZE * MPA_MAX_CHANNELS * 2];
+ 
+     /// Synthesis filter
+     MPADSPContext mpadsp;
+@@ -1819,6 +1820,9 @@ static av_cold int qdm2_decode_init(AVCodecContext *avctx)
+     s->group_order = av_log2(s->group_size) + 1;
+     s->frame_size = s->group_size / 16; // 16 iterations per super block
+ 
++    if (s->frame_size > QDM2_MAX_FRAME_SIZE)
++        return AVERROR_INVALIDDATA;
++
+     s->sub_sampling = s->fft_order - 7;
+     s->frequency_range = 255 / (1 << (2 - s->sub_sampling));
+ 
+@@ -1887,6 +1891,9 @@ static int qdm2_decode (QDM2Context *q, const uint8_t *in, int16_t *out)
+     int ch, i;
+     const int frame_size = (q->frame_size * q->channels);
+ 
++    if((unsigned)frame_size > FF_ARRAY_ELEMS(q->output_buffer)/2)
++        return -1;
++
+     /* select input buffer */
+     q->compressed_data = in;
+     q->compressed_size = q->checksum_size;
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index c276184..345086e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-avcodec-parser-reset-indexes-on-realloc-failure.patch \
            file://0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch \
            file://gst-ffmpeg-CVE-2013-0855.patch \
+           file://0001-qdm2dec-fix-buffer-overflow.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


