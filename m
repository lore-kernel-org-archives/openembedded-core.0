Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E9F86AC93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 03:02:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAJ32Dcl006084
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 19:02:13 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Nov 2014 19:02:13 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Nov 2014 21:02:11 -0600
Message-ID: <1416366131-226029-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] gst-ffmpeg: fixes for CVE-2014-8548 and CVE-2014-8541
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
X-List-Received-Date: Wed, 19 Nov 2014 03:02:15 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Issue: LIN7-1755
Issue: LIN7-1739

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8541

libavcodec/mjpegdec.c in FFmpeg before 2.4.2 considers only dimension
differences, and not bits-per-pixel differences, when determining whether an
image size has changed, which allows remote attackers to cause a denial of
service (out-of-bounds access) or possibly have unspecified other impact via
crafted MJPEG data.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8548

Off-by-one error in libavcodec/smc.c in FFmpeg before 2.4.2 allows remote
attackers to cause a denial of service (out-of-bounds access) or possibly
have unspecified other impact via crafted Quicktime Graphics (aka SMC) video
data.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../0001-avcodec-smc-fix-off-by-1-error.patch      | 32 ++++++++++
 ...egdec-check-bits-per-pixel-for-changes-si.patch | 68 ++++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  2 +
 3 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-smc-fix-off-by-1-error.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-smc-fix-off-by-1-error.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-smc-fix-off-by-1-error.patch
new file mode 100644
index 0000000..3ca6fc4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-smc-fix-off-by-1-error.patch
@@ -0,0 +1,32 @@
+From c17a0ad1df15a94d0b1239adc2afb593bdf0a153 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Fri, 3 Oct 2014 22:50:45 +0200
+Subject: [PATCH 1/2] avcodec/smc: fix off by 1 error
+
+Upstream-Status: Backport
+
+Fixes out of array access
+Fixes: asan_heap-oob_1685bf0_5_asan_heap-oob_1f35116_430_smc.mov
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/smc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/ext/libav/libavcodec/smc.c b/gst-libs/ext/libav/libavcodec/smc.c
+index 3cd5e53..dec9f71 100644
+--- a/gst-libs/ext/libav/libavcodec/smc.c
++++ b/gst-libs/ext/libav/libavcodec/smc.c
+@@ -69,7 +69,7 @@ typedef struct SmcContext {
+         row_ptr += stride * 4; \
+     } \
+     total_blocks--; \
+-    if (total_blocks < 0) \
++    if (total_blocks < 0 + !!n_blocks) \
+     { \
+         av_log(s->avctx, AV_LOG_INFO, "warning: block counter just went negative (this should not happen)\n"); \
+         return; \
+-- 
+2.1.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch
new file mode 100644
index 0000000..c8bafd5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch
@@ -0,0 +1,68 @@
+From 6043c431c97d55173f339fafbd033d3c0642e2e9 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Fri, 3 Oct 2014 01:50:27 +0200
+Subject: [PATCH 2/2] avcodec/mjpegdec: check bits per pixel for changes
+ similar to dimensions
+
+Upstream-Status: Backport
+
+Fixes out of array accesses
+Fixes: asan_heap-oob_16668e9_2_asan_heap-oob_16668e9_346_miss_congeniality_pegasus_mjpg.avi
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+
+Conflicts:
+	libavcodec/mjpegdec.c
+---
+ libavcodec/mjpegdec.c | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/gst-libs/ext/libav/libavcodec/mjpegdec.c b/gst-libs/ext/libav/libavcodec/mjpegdec.c
+index 84343c0..c0137d8 100644
+--- a/gst-libs/ext/libav/libavcodec/mjpegdec.c
++++ b/gst-libs/ext/libav/libavcodec/mjpegdec.c
+@@ -210,16 +210,16 @@ int ff_mjpeg_decode_dht(MJpegDecodeContext *s)
+ 
+ int ff_mjpeg_decode_sof(MJpegDecodeContext *s)
+ {
+-    int len, nb_components, i, width, height, pix_fmt_id;
++    int len, nb_components, i, bits, width, height, pix_fmt_id;
+ 
+     /* XXX: verify len field validity */
+     len = get_bits(&s->gb, 16);
+-    s->bits= get_bits(&s->gb, 8);
++    bits= get_bits(&s->gb, 8);
+ 
+-    if(s->pegasus_rct) s->bits=9;
+-    if(s->bits==9 && !s->pegasus_rct) s->rct=1;    //FIXME ugly
++    if(s->pegasus_rct) bits=9;
++    if(bits==9 && !s->pegasus_rct) s->rct=1;    //FIXME ugly
+ 
+-    if (s->bits != 8 && !s->lossless){
++    if (bits != 8 && !s->lossless){
+         av_log(s->avctx, AV_LOG_ERROR, "only 8 bits/component accepted\n");
+         return -1;
+     }
+@@ -239,7 +239,7 @@ int ff_mjpeg_decode_sof(MJpegDecodeContext *s)
+     if (nb_components <= 0 ||
+         nb_components > MAX_COMPONENTS)
+         return -1;
+-    if (s->ls && !(s->bits <= 8 || nb_components == 1)){
++    if (s->ls && !(bits <= 8 || nb_components == 1)){
+         av_log(s->avctx, AV_LOG_ERROR, "only <= 8 bits/component or 16-bit gray accepted for JPEG-LS\n");
+         return -1;
+     }
+@@ -272,10 +272,11 @@ int ff_mjpeg_decode_sof(MJpegDecodeContext *s)
+ 
+     /* if different size, realloc/alloc picture */
+     /* XXX: also check h_count and v_count */
+-    if (width != s->width || height != s->height) {
++    if (width != s->width || height != s->height || bits != s->bits) {
+         av_freep(&s->qscale_table);
+ 
+         s->width = width;
++        s->bits= bits;
+         s->height = height;
+         s->interlaced = 0;
+ 
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 395054d..30e5deb 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -55,6 +55,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-ffserver-set-oformat.patch \
            file://0001-h264-set-parameters-from-SPS-whenever-it-changes.patch \
            file://0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch \
+           file://0001-avcodec-smc-fix-off-by-1-error.patch \
+           file://0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'libav9', 'file://libav-9.patch', '', d)} \ 
 "
 
-- 
1.9.3


