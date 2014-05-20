Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8ADCD6AE14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 01:52:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4K1qjC0005690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 18:52:45 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 18:52:44 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 09:52:17 +0800
Message-ID: <29dbf2c7ae90c0b0de133f2c0c15f3af3f460148.1400550433.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400550433.git.rongqing.li@windriver.com>
References: <cover.1400550433.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/12] gst-ffmpeg: fix for Security Advisory CVE-2013-0849
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
X-List-Received-Date: Tue, 20 May 2014 01:52:45 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The roq_decode_init function in libavcodec/roqvideodec.c in FFmpeg
before 1.1 allows remote attackers to have an unspecified impact via a
crafted (1) width or (2) height dimension that is not a multiple of
sixteen in id RoQ video data.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0849

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...001-roqvideodec-check-dimensions-validity.patch |   36 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-roqvideodec-check-dimensions-validity.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-roqvideodec-check-dimensions-validity.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-roqvideodec-check-dimensions-validity.patch
new file mode 100644
index 0000000..7e58afc
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-roqvideodec-check-dimensions-validity.patch
@@ -0,0 +1,36 @@
+From 391e0fc6c90ced6656b74f50f3a487b6dc76ea63 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Thu, 29 Nov 2012 15:18:17 +0100
+Subject: [PATCH] roqvideodec: check dimensions validity
+
+Upstream-Status: Backport
+
+Commit 391e0fc6c90ced6656b74f50f3a487b6dc76ea63 release/0.7
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit 3ae610451170cd5a28b33950006ff0bd23036845)
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/roqvideodec.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libavcodec/roqvideodec.c b/libavcodec/roqvideodec.c
+index f0977f6..4e34231 100644
+--- a/gst-libs/ext/libav/libavcodec/roqvideodec.c
++++ b/gst-libs/ext/libav/libavcodec/roqvideodec.c
+@@ -157,6 +157,12 @@ static av_cold int roq_decode_init(AVCodecContext *avctx)
+     RoqContext *s = avctx->priv_data;
+ 
+     s->avctx = avctx;
++
++    if (avctx->width%16 || avctx->height%16) {
++         av_log_ask_for_sample(avctx, "dimensions not being a multiple of 16 are unsupported\n");
++         return AVERROR_PATCHWELCOME;
++    }
++
+     s->width = avctx->width;
+     s->height = avctx->height;
+     avcodec_get_frame_defaults(&s->frames[0]);
+-- 
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index ad85fa2..a3b2f5c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-mjpegdec-check-SE.patch \
            file://0001-alac-fix-nb_samples-order-case.patch \
            file://0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch \
+           file://0001-roqvideodec-check-dimensions-validity.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


