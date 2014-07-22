Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EC15265D34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:46:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M7kmPg025131
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:46:48 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 00:46:47 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 15:46:36 +0800
Message-ID: <bd622b4cfa4e223cdeafcc93fff72e42afe25ba9.1406015054.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406015054.git.rongqing.li@windriver.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0866
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
X-List-Received-Date: Tue, 22 Jul 2014 07:46:50 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The aac_decode_init function in libavcodec/aacdec.c in FFmpeg before
1.0.4 and 1.1.x before 1.1.2 allows remote attackers to have an
unspecified impact via a large number of channels in an AAC file, which
triggers an out-of-bounds array access.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0866

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-aacdec-check-channel-count.patch          |   34 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-aacdec-check-channel-count.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-aacdec-check-channel-count.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-aacdec-check-channel-count.patch
new file mode 100644
index 0000000..7da0e14
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-aacdec-check-channel-count.patch
@@ -0,0 +1,34 @@
+gst-ffmpeg: aacdec: check channel count
+
+Prevent out of array accesses
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit 96f452ac647dae33c53c242ef3266b65a9beafb6)
+
+Upstream-Status: Backport 
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ libavcodec/aacdec.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/libavcodec/aacdec.c b/libavcodec/aacdec.c
+index 239153a..6c17c33 100644
+--- a/gst-libs/ext/libav/libavcodec/aacdec.c
++++ b/gst-libs/ext/libav/libavcodec/aacdec.c
+@@ -914,6 +914,11 @@ static av_cold int aac_decode_init(AVCodecContext *avctx)
+         }
+     }
+ 
++    if (avctx->channels > MAX_CHANNELS) {
++        av_log(avctx, AV_LOG_ERROR, "Too many channels\n");
++        return AVERROR_INVALIDDATA;
++    }
++
+     AAC_INIT_VLC_STATIC( 0, 304);
+     AAC_INIT_VLC_STATIC( 1, 270);
+     AAC_INIT_VLC_STATIC( 2, 550);
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index a3b2f5c..b4fc8c7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-alac-fix-nb_samples-order-case.patch \
            file://0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch \
            file://0001-roqvideodec-check-dimensions-validity.patch \
+           file://0001-aacdec-check-channel-count.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


