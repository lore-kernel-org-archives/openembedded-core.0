Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C99EF701CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:46:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M7ktmj025143
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:46:55 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 00:46:55 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 15:46:42 +0800
Message-ID: <fa727f4c377c7ad56a76157bbfa39a343e3349f5.1406015054.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406015054.git.rongqing.li@windriver.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7009
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
X-List-Received-Date: Tue, 22 Jul 2014 07:46:54 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The rpza_decode_stream function in libavcodec/rpza.c in FFmpeg before
2.1 does not properly maintain a pointer to pixel data, which allows
remote attackers to cause a denial of service (out-of-bounds array
access) or possibly have unspecified other impact via crafted Apple RPZA
data.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7009

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...a-Perform-pointer-advance-and-checks-befo.patch |   81 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch
new file mode 100644
index 0000000..7f6eb48
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch
@@ -0,0 +1,81 @@
+gst-ffmpeg: avcodec/rpza: Perform pointer advance and checks before
+ using the pointers
+
+Fixes out of array accesses
+Fixes Ticket2850
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit 3819db745da2ac7fb3faacb116788c32f4753f34)
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+
+Upstream-Status: Backport 
+
+Singed-off-by: Yue Tao <yue.tao@windriver.com>
+
+---
+ libavcodec/rpza.c |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libavcodec/rpza.c b/libavcodec/rpza.c
+index 635b406..f291a95 100644
+--- a/gst-libs/ext/libav/libavcodec/rpza.c
++++ b/gst-libs/ext/libav/libavcodec/rpza.c
+@@ -83,7 +83,7 @@ static void rpza_decode_stream(RpzaContext *s)
+     unsigned short *pixels = (unsigned short *)s->frame.data[0];
+ 
+     int row_ptr = 0;
+-    int pixel_ptr = 0;
++    int pixel_ptr = -4;
+     int block_ptr;
+     int pixel_x, pixel_y;
+     int total_blocks;
+@@ -139,6 +139,7 @@ static void rpza_decode_stream(RpzaContext *s)
+             colorA = AV_RB16 (&s->buf[stream_ptr]);
+             stream_ptr += 2;
+             while (n_blocks--) {
++                ADVANCE_BLOCK()
+                 block_ptr = row_ptr + pixel_ptr;
+                 for (pixel_y = 0; pixel_y < 4; pixel_y++) {
+                     for (pixel_x = 0; pixel_x < 4; pixel_x++){
+@@ -147,7 +148,6 @@ static void rpza_decode_stream(RpzaContext *s)
+                     }
+                     block_ptr += row_inc;
+                 }
+-                ADVANCE_BLOCK();
+             }
+             break;
+ 
+@@ -184,6 +184,7 @@ static void rpza_decode_stream(RpzaContext *s)
+             color4[2] |= ((21 * ta + 11 * tb) >> 5);
+ 
+             while (n_blocks--) {
++                ADVANCE_BLOCK();
+                 block_ptr = row_ptr + pixel_ptr;
+                 for (pixel_y = 0; pixel_y < 4; pixel_y++) {
+                     index = s->buf[stream_ptr++];
+@@ -194,12 +195,12 @@ static void rpza_decode_stream(RpzaContext *s)
+                     }
+                     block_ptr += row_inc;
+                 }
+-                ADVANCE_BLOCK();
+             }
+             break;
+ 
+         /* Fill block with 16 colors */
+         case 0x00:
++            ADVANCE_BLOCK();
+             block_ptr = row_ptr + pixel_ptr;
+             for (pixel_y = 0; pixel_y < 4; pixel_y++) {
+                 for (pixel_x = 0; pixel_x < 4; pixel_x++){
+@@ -213,7 +214,6 @@ static void rpza_decode_stream(RpzaContext *s)
+                 }
+                 block_ptr += row_inc;
+             }
+-            ADVANCE_BLOCK();
+             break;
+ 
+         /* Unknown opcode */
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 138b660..42878e6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-vp3-Copy-all-3-frames-for-thread-updates.patch \
            file://0001-h264_sei-Fix-infinite-loop.patch \
            file://0001-avcodec-parser-reset-indexes-on-realloc-failure.patch \
+           file://0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


