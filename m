Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0642660F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 01:52:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4K1qPQx005669
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 18:52:25 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 18:52:25 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 09:52:09 +0800
Message-ID: <8f9b4f67e3d5e7acddbfea9583cfefaab379b854.1400550433.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400550433.git.rongqing.li@windriver.com>
References: <cover.1400550433.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/12] gst-ffmpeg: fix for Security Advisory CVE-2013-0868
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
X-List-Received-Date: Tue, 20 May 2014 01:52:25 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

libavcodec/huffyuvdec.c in FFmpeg before 1.1.2 allows remote attackers
to have an unspecified impact via crafted Huffyuv data, related to an
out-of-bounds write and (1) unchecked return codes from the init_vlc
function and (2) len==0 cases.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0868

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...01-huffyuvdec-Check-init_vlc-return-codes.patch |   87 ++++++++++++++++++++
 .../0001-huffyuvdec-Skip-len-0-cases.patch         |   61 ++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    2 +
 3 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Check-init_vlc-return-codes.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Skip-len-0-cases.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Check-init_vlc-return-codes.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Check-init_vlc-return-codes.patch
new file mode 100644
index 0000000..e859e44
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Check-init_vlc-return-codes.patch
@@ -0,0 +1,87 @@
+From b666debffec1fcbb19ef377635a53b9a58bca8a4 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Tue, 29 Jan 2013 18:29:41 +0100
+Subject: [PATCH] huffyuvdec: Check init_vlc() return codes.
+
+Upstream-Status: Backport
+
+Commit b666debffec1fcbb19ef377635a53b9a58bca8a4 release/1.0
+
+Prevents out of array writes
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit f67a0d115254461649470452058fa3c28c0df294)
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/huffyuv.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/libavcodec/huffyuv.c b/libavcodec/huffyuv.c
+index 58da789..993e524 100644
+--- a/gst-libs/ext/libav/libavcodec/huffyuv.c
++++ b/gst-libs/ext/libav/libavcodec/huffyuv.c
+@@ -33,6 +33,7 @@
+ #include "put_bits.h"
+ #include "dsputil.h"
+ #include "thread.h"
++#include "libavutil/avassert.h"
+ 
+ #define VLC_BITS 11
+ 
+@@ -287,6 +287,7 @@ static void generate_joint_tables(HYuvCo
+                     int len1 = s->len[p][u];
+                     if (len1 > limit || !len1)
+                         continue;
++                    av_assert0(i < (1 << VLC_BITS));
+                     len[i] = len0 + len1;
+                     bits[i] = (s->bits[0][y] << len1) + s->bits[p][u];
+                     symbols[i] = (y<<8) + u;
+@@ -320,6 +321,7 @@ static void generate_joint_tables(HYuvCo
+                     int len2 = s->len[2][r&255];
+                     if (len2 > limit1 || !len2)
+                         continue;
++                    av_assert0(i < (1 << VLC_BITS));
+                     len[i] = len0 + len1 + len2;
+                     bits[i] = (code << len2) + s->bits[2][r&255];
+                     if(s->decorrelate){
+@@ -343,6 +345,7 @@ static void generate_joint_tables(HYuvCo
+ static int read_huffman_tables(HYuvContext *s, const uint8_t *src, int length){
+     GetBitContext gb;
+     int i;
++    int ret;
+ 
+     init_get_bits(&gb, src, length*8);
+ 
+@@ -353,7 +356,9 @@ static int read_huffman_tables(HYuvConte
+             return -1;
+         }
+         free_vlc(&s->vlc[i]);
+-        init_vlc(&s->vlc[i], VLC_BITS, 256, s->len[i], 1, 1, s->bits[i], 4, 4, 0);
++        if ((ret = init_vlc(&s->vlc[i], VLC_BITS, 256, s->len[i], 1, 1,
++                           s->bits[i], 4, 4, 0)) < 0)
++            return ret;
+     }
+ 
+     generate_joint_tables(s);
+@@ -365,6 +370,7 @@ static int read_old_huffman_tables(HYuvC
+ #if 1
+     GetBitContext gb;
+     int i;
++    int ret;
+ 
+     init_get_bits(&gb, classic_shift_luma, sizeof(classic_shift_luma)*8);
+     if(read_len_table(s->len[0], &gb)<0)
+@@ -385,7 +391,9 @@ static int read_old_huffman_tables(HYuvC
+ 
+     for(i=0; i<3; i++){
+         free_vlc(&s->vlc[i]);
+-        init_vlc(&s->vlc[i], VLC_BITS, 256, s->len[i], 1, 1, s->bits[i], 4, 4, 0);
++        if ((ret = init_vlc(&s->vlc[i], VLC_BITS, 256, s->len[i], 1, 1,
++                            s->bits[i], 4, 4, 0)) < 0)
++            return ret;
+     }
+ 
+     generate_joint_tables(s);
+-- 
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Skip-len-0-cases.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Skip-len-0-cases.patch
new file mode 100644
index 0000000..94bf4b6
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Skip-len-0-cases.patch
@@ -0,0 +1,61 @@
+From db0f7f7394e1f994ed38db043f78ed0f10bde0da Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Tue, 29 Jan 2013 19:22:33 +0100
+Subject: [PATCH] huffyuvdec: Skip len==0 cases
+
+Upstream-Status: Backport
+
+Commit db0f7f7394e1f994ed38db043f78ed0f10bde0da release/1.0
+
+Fixes vlc decoding for hypothetical files that would contain such cases.
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit 0dfc01c2bbf4b71bb56201bc4a393321e15d1b31)
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/huffyuv.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/libavcodec/huffyuv.c b/libavcodec/huffyuv.c
+index 993e524..72ed351 100644
+--- a/gst-libs/ext/libav/libavcodec/huffyuv.c
++++ b/gst-libs/ext/libav/libavcodec/huffyuv.c
+@@ -281,11 +281,11 @@ static void generate_joint_tables(HYuvCo
+             for(i=y=0; y<256; y++){
+                 int len0 = s->len[0][y];
+                 int limit = VLC_BITS - len0;
+-                if(limit <= 0)
++                if(limit <= 0 || !len0)
+                     continue;
+                 for(u=0; u<256; u++){
+                     int len1 = s->len[p][u];
+-                    if(len1 > limit)
++                    if (len1 > limit || !len1)
+                         continue;
+                     len[i] = len0 + len1;
+                     bits[i] = (s->bits[0][y] << len1) + s->bits[p][u];
+@@ -308,17 +308,17 @@ static void generate_joint_tables(HYuvCo
+         for(i=0, g=-16; g<16; g++){
+             int len0 = s->len[p0][g&255];
+             int limit0 = VLC_BITS - len0;
+-            if(limit0 < 2)
++            if (limit0 < 2 || !len0)
+                 continue;
+             for(b=-16; b<16; b++){
+                 int len1 = s->len[p1][b&255];
+                 int limit1 = limit0 - len1;
+-                if(limit1 < 1)
++                if (limit1 < 1 || !len1)
+                     continue;
+                 code = (s->bits[p0][g&255] << len1) + s->bits[p1][b&255];
+                 for(r=-16; r<16; r++){
+                     int len2 = s->len[2][r&255];
+-                    if(len2 > limit1)
++                    if (len2 > limit1 || !len2)
+                         continue;
+                     len[i] = len0 + len1 + len2;
+                     bits[i] = (code << len2) + s->bits[2][r&255];
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 05cc404..847b927 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -26,6 +26,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch \
            file://0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch \
            file://0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch \
+           file://0001-huffyuvdec-Skip-len-0-cases.patch \
+           file://0001-huffyuvdec-Check-init_vlc-return-codes.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


