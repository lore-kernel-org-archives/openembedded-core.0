Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E83C5701DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 06:16:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6M6GIMw003756
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 23:16:18 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 21 Jul 2014 23:16:17 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 14:16:04 +0800
Message-ID: <ea31d5d45ba2096e58c16f0a40449a6f822aa96e.1406006666.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406006666.git.rongqing.li@windriver.com>
References: <cover.1406006666.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0860
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
X-List-Received-Date: Tue, 22 Jul 2014 06:16:18 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The ff_er_frame_end function in libavcodec/error_resilience.c in FFmpeg
before 1.0.4 and 1.1.x before 1.1.1 does not properly verify that a
frame is fully initialized, which allows remote attackers to trigger a
NULL pointer dereference via crafted picture data.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0860

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...alment-Check-that-the-picture-is-not-in-a.patch |   37 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error_concealment-Check-that-the-picture-is-not-in-a.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error_concealment-Check-that-the-picture-is-not-in-a.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error_concealment-Check-that-the-picture-is-not-in-a.patch
new file mode 100644
index 0000000..062acf6
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error_concealment-Check-that-the-picture-is-not-in-a.patch
@@ -0,0 +1,37 @@
+gst-ffmpeg: error_concealment: Check that the picture is not in a half
+
+Fixes state becoming inconsistent
+Fixes a null pointer dereference
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit 23318a57358358e7a4dc551e830e4503f0638cfe)
+
+Upstream-Status: Pending
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+---
+ libavcodec/error_resilience.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/libavcodec/error_resilience.c b/libavcodec/error_resilience.c
+index 01f7424..2b6bc42 100644
+--- a/gst-libs/ext/libav/libavcodec/error_resilience.c
++++ b/gst-libs/ext/libav/libavcodec/error_resilience.c
+@@ -793,6 +793,12 @@ void ff_er_frame_end(MpegEncContext *s){
+        s->picture_structure != PICT_FRAME || // we dont support ER of field pictures yet, though it should not crash if enabled
+        s->error_count==3*s->mb_width*(s->avctx->skip_top + s->avctx->skip_bottom)) return;
+ 
++    if (   s->picture_structure == PICT_FRAME
++        && s->current_picture.linesize[0] != s->current_picture_ptr->linesize[0]) {
++        av_log(s->avctx, AV_LOG_ERROR, "Error concealment not possible, frame not fully initialized\n");
++        return;
++    }
++
+     if(s->current_picture.motion_val[0] == NULL){
+         av_log(s->avctx, AV_LOG_ERROR, "Warning MVs not available\n");
+ 
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 98f8103..98d12ea 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -38,6 +38,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-roqvideodec-check-dimensions-validity.patch \
            file://0001-aacdec-check-channel-count.patch \
            file://0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch \
+           file://0001-error_concealment-Check-that-the-picture-is-not-in-a.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


