Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F178B6A53C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 02:04:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4F24EmR024766
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 19:04:14 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 14 May 2014 19:04:13 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 10:03:57 +0800
Message-ID: <4fd4d579d8af4b4c0cdaf925784c51a87d4df377.1400118419.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400118419.git.rongqing.li@windriver.com>
References: <cover.1400118419.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] Security Advisory - ffmpeg - CVE-2013-0858
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
X-List-Received-Date: Thu, 15 May 2014 02:04:13 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The atrac3_decode_init function in libavcodec/atrac3.c in FFmpeg before
1.0.4 allows remote attackers to have an unspecified impact via ATRAC3
data with the joint stereo coding mode set and fewer than two channels.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0858

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...ac3dec-Check-coding-mode-against-channels.patch |   37 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atrac3dec-Check-coding-mode-against-channels.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atrac3dec-Check-coding-mode-against-channels.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atrac3dec-Check-coding-mode-against-channels.patch
new file mode 100644
index 0000000..c269481
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atrac3dec-Check-coding-mode-against-channels.patch
@@ -0,0 +1,37 @@
+From 2502914c5f8eb77659d7c0868396862557a63245 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Fri, 9 Nov 2012 13:26:20 +0100
+Subject: [PATCH] atrac3dec: Check coding mode against channels.
+
+Commit 2502914c5f8eb77659d7c0868396862557a63245 release/1.0
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit 13451f5520ce6b0afde861b2285dda659f8d4fb4)
+
+Conflicts:
+
+	libavcodec/atrac3.c
+---
+ libavcodec/atrac3.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavcodec/atrac3.c b/libavcodec/atrac3.c
+index 7d076be..1da4c78 100644
+--- a/gst-libs/ext/libav/libavcodec/atrac3.c
++++ b/gst-libs/ext/libav/libavcodec/atrac3.c
+@@ -955,6 +955,11 @@ static av_cold int atrac3_decode_init(AVCodecContext *avctx)
+     }
+     /* Check the extradata. */
+ 
++    if (q->codingMode == JOINT_STEREO && avctx->channels < 2) {
++        av_log(avctx, AV_LOG_ERROR, "Invalid coding mode\n");
++        return AVERROR_INVALIDDATA;
++    }
++
+     if (q->atrac3version != 4) {
+         av_log(avctx,AV_LOG_ERROR,"Version %d != 4.\n",q->atrac3version);
+         return AVERROR_INVALIDDATA;
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index eded98b..a603ff5 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-huffyuvdec-Check-init_vlc-return-codes.patch \
            file://0001-alsdec-check-block-length.patch \
            file://0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch \
+           file://0001-atrac3dec-Check-coding-mode-against-channels.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


