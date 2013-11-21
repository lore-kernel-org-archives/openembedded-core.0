Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 063156DBDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:05:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL75MIa023856
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:05:22 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:05:21 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:05:05 -0600
Message-ID: <1385017505-22630-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385017505-22630-1-git-send-email-mark.hatle@windriver.com>
References: <1385017505-22630-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [dora][master][PATCH 2/2] gst-ffmpeg: fix CVE-2013-3674
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
X-List-Received-Date: Thu, 21 Nov 2013 07:05:23 -0000
Content-Type: text/plain

From: Ming Liu <ming.liu@windriver.com>

The cdg_decode_frame function in cdgraphics.c in libavcodec in FFmpeg before
1.2.1 does not validate the presence of non-header data in a buffer, which
allows remote attackers to cause a denial of service (out-of-bounds array
access and application crash) via crafted CD Graphics Video data.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-3674

Signed-off-by: Ming Liu <ming.liu@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 .../gst-ffmpeg-CVE-2013-3674.patch                 | 26 ++++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-3674.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-3674.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-3674.patch
new file mode 100644
index 0000000..a28404b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-3674.patch
@@ -0,0 +1,26 @@
+avcodec/cdgraphics: check buffer size before use
+
+Fixes out of array accesses
+
+Backported from:http://git.videolan.org/?p=ffmpeg.git;a=commit;h=ad002e1a13a8df934bd6cb2c84175a4780ab8942
+
+Upstream-status: Backport
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+
+diff -urpN a/gst-libs/ext/libav/libavcodec/cdgraphics.c b/gst-libs/ext/libav/libavcodec/cdgraphics.c
+--- a/gst-libs/ext/libav/libavcodec/cdgraphics.c	2013-07-18 13:17:08.399876575 +0800
++++ b/gst-libs/ext/libav/libavcodec/cdgraphics.c	2013-07-18 13:18:05.880502267 +0800
+@@ -291,7 +291,9 @@ static int cdg_decode_frame(AVCodecConte
+     inst    = bytestream_get_byte(&buf);
+     inst    &= CDG_MASK;
+     buf += 2;  /// skipping 2 unneeded bytes
+-    bytestream_get_buffer(&buf, cdg_data, buf_size - CDG_HEADER_SIZE);
++
++    if (buf_size > CDG_HEADER_SIZE)
++        bytestream_get_buffer(&buf, cdg_data, buf_size - CDG_HEADER_SIZE);
+ 
+     if ((command & CDG_MASK) == CDG_COMMAND) {
+         switch (inst) {
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 8873105..e1257a2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -22,12 +22,13 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://h264_qpel_mmx.patch \
            file://libav_e500mc.patch \
            file://libav_e5500.patch \
+           file://gst-ffmpeg-CVE-2013-3674.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
 SRC_URI[sha256sum] = "76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def187fbb62"
 
-PR = "r7"
+PR = "r8"
 
 GSTREAMER_DEBUG ?= "--disable-debug"
 
-- 
1.8.1.2.545.g2f19ada


