Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1CB6610F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 02:04:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4F24Iph024772
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 19:04:18 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 14 May 2014 19:04:17 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 10:04:00 +0800
Message-ID: <79b409ed5297503efa13ae002e5e8a33f29ab04a.1400118419.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400118419.git.rongqing.li@windriver.com>
References: <cover.1400118419.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/12] Security Advisory - ffmpeg - CVE-2013-0856
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
X-List-Received-Date: Thu, 15 May 2014 02:04:17 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The lpc_prediction function in libavcodec/alac.c in FFmpeg before 1.1
allows remote attackers to have an unspecified impact via crafted Apple
Lossless Audio Codec (ALAC) data, related to a large nb_samples value.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0856

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-alac-fix-nb_samples-order-case.patch      |   30 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alac-fix-nb_samples-order-case.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alac-fix-nb_samples-order-case.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alac-fix-nb_samples-order-case.patch
new file mode 100644
index 0000000..e004bff
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alac-fix-nb_samples-order-case.patch
@@ -0,0 +1,30 @@
+From e0884eadf6a15e93142131b695f48776f9a0ac31 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Sat, 10 Nov 2012 17:14:04 +0100
+Subject: [PATCH] alac: fix nb_samples < order case
+
+Commit e0884eadf6a15e93142131b695f48776f9a0ac31 release/1.0
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit fd4f4923cce6a2cbf4f48640b4ac706e614a1594)
+---
+ libavcodec/alac.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/alac.c b/libavcodec/alac.c
+index 9cd1737..e8e844a 100644
+--- a/gst-libs/ext/libav/libavcodec/alac.c
++++ b/gst-libs/ext/libav/libavcodec/alac.c
+@@ -278,7 +278,7 @@ static void predictor_decompress_fir_ada
+ 
+     /* read warm-up samples */
+     if (predictor_coef_num > 0)
+-        for (i = 0; i < predictor_coef_num; i++) {
++        for (i = 0; i < predictor_coef_num && i < output_size; i++) {
+             int32_t val;
+ 
+             val = buffer_out[i] + error_buffer[i+1];
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 28ea29e..a0673fd 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-atrac3dec-Check-coding-mode-against-channels.patch \
            file://0001-eamad-fix-out-of-array-accesses.patch \
            file://0001-mjpegdec-check-SE.patch \
+           file://0001-alac-fix-nb_samples-order-case.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


