Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB02660F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 01:52:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4K1qaKP005682
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 18:52:36 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 18:52:36 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 09:52:13 +0800
Message-ID: <f4d1dc69027250ddfe5c2d167b7b6122e606e391.1400550433.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400550433.git.rongqing.li@windriver.com>
References: <cover.1400550433.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/12] gst-ffmpeg: fix for Security Advisory CVE-2013-0851
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
X-List-Received-Date: Tue, 20 May 2014 01:52:35 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The decode_frame function in libavcodec/eamad.c in FFmpeg before 1.1
allows remote attackers to have an unspecified impact via crafted
Electronic Arts Madcow video data, which triggers an out-of-bounds array
access.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0851

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-eamad-fix-out-of-array-accesses.patch     |   29 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eamad-fix-out-of-array-accesses.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eamad-fix-out-of-array-accesses.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eamad-fix-out-of-array-accesses.patch
new file mode 100644
index 0000000..f45e3fd
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eamad-fix-out-of-array-accesses.patch
@@ -0,0 +1,29 @@
+From 63ac64864c6e0e84355aa3caa5b92208997a9a8d Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Sat, 17 Nov 2012 16:26:55 +0100
+Subject: [PATCH] eamad: fix out of array accesses
+
+Upstream-Status: Backport
+
+Commit 63ac64864c6e0e84355aa3caa5b92208997a9a8d release/1.1
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/eamad.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/eamad.c b/libavcodec/eamad.c
+index 2805195..e38650e 100644
+--- a/gst-libs/ext/libav/libavcodec/eamad.c
++++ b/gst-libs/ext/libav/libavcodec/eamad.c
+@@ -237,7 +237,7 @@ static int decode_frame(AVCodecContext *avctx,
+     int chunk_type;
+     int inter;
+ 
+-    if (buf_size < 17) {
++    if (buf_size < 26) {
+         av_log(avctx, AV_LOG_ERROR, "Input buffer too small\n");
+         *data_size = 0;
+         return -1;
+-- 
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index a603ff5..0d0ba9a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-alsdec-check-block-length.patch \
            file://0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch \
            file://0001-atrac3dec-Check-coding-mode-against-channels.patch \
+           file://0001-eamad-fix-out-of-array-accesses.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


