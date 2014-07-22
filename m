Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C251701C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:46:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6M7knxa015086
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:46:49 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 00:46:48 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 15:46:37 +0800
Message-ID: <1d6d9c84fb43e88adecff2f3caa84e934f9e40c7.1406015054.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406015054.git.rongqing.li@windriver.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0875
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

The ff_add_png_paeth_prediction function in libavcodec/pngdec.c in
FFmpeg before 1.1.3 allows remote attackers to have an unspecified
impact via a crafted PNG image, related to an out-of-bounds array
access.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0875

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...er-dont-access-out-of-array-elements-at-t.patch |   44 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch
new file mode 100644
index 0000000..1e5fb7d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch
@@ -0,0 +1,44 @@
+gst-ffmpeg: pngdec/filter: dont access out of array elements at the end
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+
+Upstream-Status: Backport 
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ libavcodec/pngdec.c |   12 ++++--------
+ 1 files changed, 4 insertions(+), 8 deletions(-)
+
+diff --git a/libavcodec/pngdec.c b/libavcodec/pngdec.c
+index 97c0ad1..193e35e 100644
+--- a/gst-libs/ext/libav/libavcodec/pngdec.c
++++ b/gst-libs/ext/libav/libavcodec/pngdec.c
+@@ -190,7 +190,7 @@ void ff_add_png_paeth_prediction(uint8_t *dst, uint8_t *src, uint8_t *top, int w
+     if(bpp >= 2) g = dst[1];\
+     if(bpp >= 3) b = dst[2];\
+     if(bpp >= 4) a = dst[3];\
+-    for(; i < size; i+=bpp) {\
++    for(; i <= size - bpp; i+=bpp) {\
+         dst[i+0] = r = op(r, src[i+0], last[i+0]);\
+         if(bpp == 1) continue;\
+         dst[i+1] = g = op(g, src[i+1], last[i+1]);\
+@@ -206,13 +206,9 @@ void ff_add_png_paeth_prediction(uint8_t *dst, uint8_t *src, uint8_t *top, int w
+     else if(bpp == 2) UNROLL1(2, op)\
+     else if(bpp == 3) UNROLL1(3, op)\
+     else if(bpp == 4) UNROLL1(4, op)\
+-    else {\
+-        for (; i < size; i += bpp) {\
+-            int j;\
+-            for (j = 0; j < bpp; j++)\
+-                dst[i+j] = op(dst[i+j-bpp], src[i+j], last[i+j]);\
+-        }\
+-    }
++    for (; i < size; i++) {\
++        dst[i] = op(dst[i-bpp], src[i], last[i]);\
++    }\
+ 
+ /* NOTE: 'dst' can be equal to 'last' */
+ static void png_filter_row(PNGDSPContext *dsp, uint8_t *dst, int filter_type,
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index b4fc8c7..98f8103 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch \
            file://0001-roqvideodec-check-dimensions-validity.patch \
            file://0001-aacdec-check-channel-count.patch \
+           file://0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


