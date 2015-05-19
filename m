Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D33D46E6CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 01:13:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4J1DVsO021887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 18:13:31 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 18 May 2015 18:13:30 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 May 2015 09:08:14 +0800
Message-ID: <7dfa7bda72262c9e998f4b37e2fe69d80d930858.1431997609.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1431997609.git.kai.kang@windriver.com>
References: <cover.1431997609.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 4/4] gst-ffmpeg: fix CVEs
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
X-List-Received-Date: Tue, 19 May 2015 01:13:30 -0000
Content-Type: text/plain

Backport patches to fix CVEs: CVE-2014-7933, CVE-2014-9318 and
CVE-2014-9603.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gst-ffmpeg-fix-CVE-2014-7933.patch             | 38 ++++++++++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-9318.patch             | 37 +++++++++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-9603.patch             | 41 ++++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  3 ++
 4 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-7933.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9318.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9603.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-7933.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-7933.patch
new file mode 100644
index 0000000..3c537c7
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-7933.patch
@@ -0,0 +1,38 @@
+From 2266b8bc3370856d874334ba62b337ce4f1eb255 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 13 May 2015 16:46:06 +0800
+Subject: [PATCH 2/2] gst-ffmpeg: fix CVE-2014-7933
+
+Upstream-Status: Backport
+
+http://git.videolan.org/?p=ffmpeg.git;a=commit;h=33301f00
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ gst-libs/ext/libav/libavformat/matroskadec.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gst-libs/ext/libav/libavformat/matroskadec.c b/gst-libs/ext/libav/libavformat/matroskadec.c
+index 59dce4f..e5f5fc1 100644
+--- a/gst-libs/ext/libav/libavformat/matroskadec.c
++++ b/gst-libs/ext/libav/libavformat/matroskadec.c
+@@ -1916,7 +1916,7 @@ static int matroska_read_seek(AVFormatContext *s, int stream_index,
+                               int64_t timestamp, int flags)
+ {
+     MatroskaDemuxContext *matroska = s->priv_data;
+-    MatroskaTrack *tracks = matroska->tracks.elem;
++    MatroskaTrack *tracks = NULL;
+     AVStream *st = s->streams[stream_index];
+     int i, index, index_sub, index_min;
+ 
+@@ -1939,6 +1939,7 @@ static int matroska_read_seek(AVFormatContext *s, int stream_index,
+         return 0;
+ 
+     index_min = index;
++    tracks = matroska->tracks.elem;
+     for (i=0; i < matroska->tracks.nb_elem; i++) {
+         tracks[i].audio.pkt_cnt = 0;
+         tracks[i].audio.sub_packet_cnt = 0;
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9318.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9318.patch
new file mode 100644
index 0000000..0553cee
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9318.patch
@@ -0,0 +1,37 @@
+From 0d3a3b9f8907625b361420d48fe05716859620ff Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Wed, 26 Nov 2014 18:56:39 +0100
+Subject: [PATCH] avcodec/rawdec: Check the return code of
+ avpicture_get_size()
+
+(Upstream commit 1d3a3b9f8907625b361420d48fe05716859620ff)
+
+Fixes out of array access
+Fixes: asan_heap-oob_22388d0_3435_cov_3297128910_small_roll5_FlashCine1.cine
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+
+Upstream-Status: Backport
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ libavcodec/rawdec.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libavcodec/rawdec.c b/libavcodec/rawdec.c
+index 28792a1..647dfa9 100644
+--- a/gst-libs/ext/libav/libavcodec/rawdec.c
++++ b/gst-libs/ext/libav/libavcodec/rawdec.c
+@@ -87,6 +87,9 @@ static av_cold int raw_init_decoder(AVCodecContext *avctx)
+ 
+     ff_set_systematic_pal2(context->palette, avctx->pix_fmt);
+     context->length = avpicture_get_size(avctx->pix_fmt, avctx->width, avctx->height);
++    if (context->length < 0)
++        return context->length;
++
+     if((avctx->bits_per_coded_sample == 4 || avctx->bits_per_coded_sample == 2) &&
+        avctx->pix_fmt==PIX_FMT_PAL8 &&
+        (!avctx->codec_tag || avctx->codec_tag == MKTAG('r','a','w',' '))){
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9603.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9603.patch
new file mode 100644
index 0000000..5dda4cc
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9603.patch
@@ -0,0 +1,41 @@
+From dc68faf8339a885bc55fabe5b01f1de4f8f3782c Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 13 May 2015 16:30:53 +0800
+Subject: [PATCH 1/2] gst-ffmpeg: fix CVE-2014-9603
+
+Upstream-Status: Backport
+
+Upstream is version 2.x and vmdav.c is splitted into 2 files vmdaudio.c
+and vmdvideo.c. Becuase source code changes, just partly backport commit which
+is applicable to version 0.10.13 to fix CVE-2014-9603.
+
+http://git.videolan.org/?p=ffmpeg.git;a=commit;h=3030fb7e0d41836f8add6399e9a7c7b740b48bfd
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ gst-libs/ext/libav/libavcodec/vmdav.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/ext/libav/libavcodec/vmdav.c b/gst-libs/ext/libav/libavcodec/vmdav.c
+index d258252..ba88ad8 100644
+--- a/gst-libs/ext/libav/libavcodec/vmdav.c
++++ b/gst-libs/ext/libav/libavcodec/vmdav.c
+@@ -294,10 +294,13 @@ static void vmd_decode(VmdVideoContext *s)
+                     len = *pb++;
+                     if (len & 0x80) {
+                         len = (len & 0x7F) + 1;
+-                        if (*pb++ == 0xFF)
++                        if (*pb++ == 0xFF) {
+                             len = rle_unpack(pb, &dp[ofs], len, frame_width - ofs);
+-                        else
++                        } else {
++                            if (ofs + len > frame_width)
++                                return;
+                             memcpy(&dp[ofs], pb, len);
++                        }
+                         pb += len;
+                         ofs += len;
+                     } else {
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index b5c838f..b7d008e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -57,6 +57,9 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-avcodec-smc-fix-off-by-1-error.patch \
            file://0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch \
            file://libav-9.patch \
+           file://gst-ffmpeg-fix-CVE-2014-7933.patch \
+           file://gst-ffmpeg-fix-CVE-2014-9318.patch \
+           file://gst-ffmpeg-fix-CVE-2014-9603.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.9.1


