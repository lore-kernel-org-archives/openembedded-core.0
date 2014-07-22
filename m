Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 115B965E47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:46:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6M7kuhX015107
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:46:56 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 00:46:56 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 15:46:43 +0800
Message-ID: <054ec7611a31608bdaaa2a394d700f336830215e.1406015054.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406015054.git.rongqing.li@windriver.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0855
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
X-List-Received-Date: Tue, 22 Jul 2014 07:46:55 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Integer overflow in the alac_decode_close function in libavcodec/alac.c
in FFmpeg before 1.1 allows remote attackers to have an unspecified
impact via a large number of samples per frame in Apple Lossless Audio
Codec (ALAC) data, which triggers an out-of-bounds array access.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0855

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../gst-ffmpeg-CVE-2013-0855.patch                 |  100 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-0855.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-0855.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-0855.patch
new file mode 100644
index 0000000..3c8d8e3
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-0855.patch
@@ -0,0 +1,100 @@
+gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0855
+
+Upstream-Status: Backport 
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+diff --git a/gst-libs/ext/libav/libavcodec/alac.c.old b/gst-libs/ext/libav/libavcodec/alac.c
+index 2a0df8c..bcbd56d 100644
+--- a/gst-libs/ext/libav/libavcodec/alac.c.old
++++ b/gst-libs/ext/libav/libavcodec/alac.c
+@@ -87,18 +87,44 @@ typedef struct {
+     int wasted_bits;
+ } ALACContext;
+ 
+-static void allocate_buffers(ALACContext *alac)
++static av_cold int alac_decode_close(AVCodecContext *avctx)
++{
++    ALACContext *alac = avctx->priv_data;
++
++    int chan;
++    for (chan = 0; chan < MAX_CHANNELS; chan++) {
++        av_freep(&alac->predicterror_buffer[chan]);
++        av_freep(&alac->outputsamples_buffer[chan]);
++        av_freep(&alac->wasted_bits_buffer[chan]);
++    }
++
++    return 0;
++}
++
++static int allocate_buffers(ALACContext *alac)
+ {
+     int chan;
++    int buf_size;
++
++    if (alac->setinfo_max_samples_per_frame > INT_MAX / sizeof(int32_t))
++        goto buf_alloc_fail;
++    buf_size = alac->setinfo_max_samples_per_frame * sizeof(int32_t);
++
+     for (chan = 0; chan < MAX_CHANNELS; chan++) {
+-        alac->predicterror_buffer[chan] =
+-            av_malloc(alac->setinfo_max_samples_per_frame * 4);
+ 
+-        alac->outputsamples_buffer[chan] =
+-            av_malloc(alac->setinfo_max_samples_per_frame * 4);
++        FF_ALLOC_OR_GOTO(alac->avctx, alac->predicterror_buffer[chan],
++                         buf_size, buf_alloc_fail);
+ 
+-        alac->wasted_bits_buffer[chan] = av_malloc(alac->setinfo_max_samples_per_frame * 4);
++        FF_ALLOC_OR_GOTO(alac->avctx, alac->outputsamples_buffer[chan],
++                         buf_size, buf_alloc_fail);
++
++        FF_ALLOC_OR_GOTO(alac->avctx, alac->wasted_bits_buffer[chan],
++                         buf_size, buf_alloc_fail);
+     }
++    return 0;
++buf_alloc_fail:
++    alac_decode_close(alac->avctx);
++    return AVERROR(ENOMEM);
+ }
+ 
+ static int alac_set_info(ALACContext *alac)
+@@ -131,8 +157,6 @@ static int alac_set_info(ALACContext *alac)
+     bytestream_get_be32(&ptr);      /* bitrate ? */
+     bytestream_get_be32(&ptr);      /* samplerate */
+ 
+-    allocate_buffers(alac);
+-
+     return 0;
+ }
+ 
+@@ -659,6 +683,7 @@ static int alac_decode_frame(AVCodecContext *avctx,
+ 
+ static av_cold int alac_decode_init(AVCodecContext * avctx)
+ {
++    int ret;
+     ALACContext *alac = avctx->priv_data;
+     alac->avctx = avctx;
+     alac->numchannels = alac->avctx->channels;
+@@ -674,18 +699,9 @@ static av_cold int alac_decode_init(AVCodecContext * avctx)
+         return -1;
+     }
+ 
+-    return 0;
+-}
+-
+-static av_cold int alac_decode_close(AVCodecContext *avctx)
+-{
+-    ALACContext *alac = avctx->priv_data;
+-
+-    int chan;
+-    for (chan = 0; chan < MAX_CHANNELS; chan++) {
+-        av_freep(&alac->predicterror_buffer[chan]);
+-        av_freep(&alac->outputsamples_buffer[chan]);
+-        av_freep(&alac->wasted_bits_buffer[chan]);
++    if ((ret = allocate_buffers(alac)) < 0) {
++        av_log(avctx, AV_LOG_ERROR, "Error allocating buffers\n");
++        return ret;
+     }
+ 
+     return 0;
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 42878e6..c276184 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-h264_sei-Fix-infinite-loop.patch \
            file://0001-avcodec-parser-reset-indexes-on-realloc-failure.patch \
            file://0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch \
+           file://gst-ffmpeg-CVE-2013-0855.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


