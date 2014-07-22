Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48C1C7021B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 06:16:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6M6GXsm003784
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 23:16:33 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 21 Jul 2014 23:16:33 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 14:16:14 +0800
Message-ID: <fce2cb84e73acadcdfac1c4df8ea73319192bd3a.1406006666.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406006666.git.rongqing.li@windriver.com>
References: <cover.1406006666.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3941
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
X-List-Received-Date: Tue, 22 Jul 2014 06:16:32 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The decode_mb function in libavcodec/error_resilience.c in FFmpeg before
0.10 allows remote attackers to have an unspecified impact via vectors
related to an uninitialized block index, which triggers an out-of-bound
write.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3941

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...-error-concealment-initialize-block-index.patch |   29 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error-concealment-initialize-block-index.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error-concealment-initialize-block-index.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error-concealment-initialize-block-index.patch
new file mode 100644
index 0000000..bd11c88
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error-concealment-initialize-block-index.patch
@@ -0,0 +1,29 @@
+gst-ffmpeg: error concealment: initialize block index.
+
+Fixes CVE-2011-3941 (out of bounds write)
+
+Upstream-Status: Pending
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/error_resilience.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/libavcodec/error_resilience.c b/libavcodec/error_resilience.c
+index 8bb5d0c..d55c000 100644
+--- a/gst-libs/ext/libav/libavcodec/error_resilience.c
++++ b/gst-libs/ext/libav/libavcodec/error_resilience.c
+@@ -45,6 +45,9 @@ static void decode_mb(MpegEncContext *s, int ref){
+     s->dest[1] = s->current_picture.data[1] + (s->mb_y * (16>>s->chroma_y_shift) * s->uvlinesize) + s->mb_x * (16>>s->chroma_x_shift);
+     s->dest[2] = s->current_picture.data[2] + (s->mb_y * (16>>s->chroma_y_shift) * s->uvlinesize) + s->mb_x * (16>>s->chroma_x_shift);
+ 
++    ff_init_block_index(s);
++    ff_update_block_index(s);
++
+     if(CONFIG_H264_DECODER && s->codec_id == CODEC_ID_H264){
+         H264Context *h= (void*)s;
+         h->mb_xy= s->mb_x + s->mb_y*s->mb_stride;
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index c3681b6..dd07435 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -49,6 +49,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch \
            file://0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch \
            file://0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch \
+           file://0001-error-concealment-initialize-block-index.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


