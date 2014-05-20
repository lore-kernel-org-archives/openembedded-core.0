Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6E45D6ADAE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 01:52:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4K1qhWZ024578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 18:52:43 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 18:52:42 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 09:52:16 +0800
Message-ID: <c5c37cc2cca2ffee0539e8aca8340cb621a75039.1400550433.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400550433.git.rongqing.li@windriver.com>
References: <cover.1400550433.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/12] gst-ffmpeg: fix for Security Advisory CVE-2013-0850
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
X-List-Received-Date: Tue, 20 May 2014 01:52:46 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The decode_slice_header function in libavcodec/h264.c in FFmpeg before
1.1 allows remote attackers to have an unspecified impact via crafted
H.264 data, which triggers an out-of-bounds array access.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0850

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...t-ref-count-check-and-limit-fix-out-of-ar.patch |   29 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch
new file mode 100644
index 0000000..d4f55b2
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch
@@ -0,0 +1,29 @@
+From d6c184880ee2e09fd68c0ae217173832cee5afc1 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Sun, 18 Nov 2012 16:29:04 +0100
+Subject: [PATCH] h264: correct ref count check and limit, fix out of array
+ accesses.
+
+Upstream-Status: Backport
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/h264.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/h264.c b/libavcodec/h264.c
+index da43f1e..32cede5 100644
+--- a/gst-libs/ext/libav/libavcodec/h264.c
++++ b/gst-libs/ext/libav/libavcodec/h264.c
+@@ -2870,6 +2870,9 @@ static int decode_slice_header(H264Conte
+             h->ref_count[0]= get_ue_golomb(&s->gb) + 1;
+             if(h->slice_type_nos==AV_PICTURE_TYPE_B)
+                 h->ref_count[1]= get_ue_golomb(&s->gb) + 1;
++            else
++                // full range is spec-ok in this case, even for frames
++                h->ref_count[1] = 1;
+ 
+             if(h->ref_count[0]-1 > 32-1 || h->ref_count[1]-1 > 32-1){
+                 av_log(h->s.avctx, AV_LOG_ERROR, "reference overflow\n");
+-- 
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index a0673fd..ad85fa2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-eamad-fix-out-of-array-accesses.patch \
            file://0001-mjpegdec-check-SE.patch \
            file://0001-alac-fix-nb_samples-order-case.patch \
+           file://0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


