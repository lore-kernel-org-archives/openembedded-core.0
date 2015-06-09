Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD8F7570D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:51:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t59Eq0Tg015179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:52:00 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:52:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:51 -0700
Message-ID: <7189f3ea9eb20d08f73abf3af4715a43f73740c0.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/12] libav: 9.18 -> 11.4
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

* Remove the backport patch libav-fix-CVE-2014-9676.patch.
* Backport a patch from debain to fix the build for i586 with gcc.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-multimedia/libav/libav.inc            |    4 +-
 .../libav/libav/libav-fix-CVE-2014-9676.patch      |   98 --------------------
 ...rkaround-to-build-libav-for-i586-with-gcc.patch |   26 ++++++
 meta/recipes-multimedia/libav/libav_11.4.bb        |    4 +
 meta/recipes-multimedia/libav/libav_9.18.bb        |    6 --
 5 files changed, 33 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
 create mode 100644 meta/recipes-multimedia/libav/libav/workaround-to-build-libav-for-i586-with-gcc.patch
 create mode 100644 meta/recipes-multimedia/libav/libav_11.4.bb
 delete mode 100644 meta/recipes-multimedia/libav/libav_9.18.bb

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 6ef273b..6cd04c7 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -15,7 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
+SRC_URI = "http://libav.org/releases/${BP}.tar.xz \
+           file://workaround-to-build-libav-for-i586-with-gcc.patch \
+"
 
 # Provides ffmpeg compat, see http://libav.org/about.html
 PROVIDES = "ffmpeg"
diff --git a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
deleted file mode 100644
index 1e31caa..0000000
--- a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-Upstream-Status: Backport
-
-Backport patch to fix CVE-2014-9676.
-
-https://security-tracker.debian.org/tracker/CVE-2014-9676
-https://git.libav.org/?p=libav.git;a=commit;h=b3f04657368a32a9903406395f865e230b1de348
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From b3f04657368a32a9903406395f865e230b1de348 Mon Sep 17 00:00:00 2001
-From: Luca Barbato <lu_zero@gentoo.org>
-Date: Mon, 5 Jan 2015 10:40:41 +0100
-Subject: [PATCH] segment: Fix the failure paths
-
-A failure in segment_end() or segment_start() would lead to freeing
-a dangling pointer and in general further calls to seg_write_packet()
-or to seg_write_trailer() would have the same faulty behaviour.
-
-CC: libav-stable@libav.org
-Reported-By: luodalongde@gmail.com
----
- libavformat/segment.c | 32 ++++++++++++++++++++------------
- 1 file changed, 20 insertions(+), 12 deletions(-)
-
-diff --git a/libavformat/segment.c b/libavformat/segment.c
-index 52da6b9..bcfd1f9 100644
---- a/libavformat/segment.c
-+++ b/libavformat/segment.c
-@@ -184,6 +184,13 @@ static void close_null_ctx(AVIOContext *pb)
-     av_free(pb);
- }
- 
-+static void seg_free_context(SegmentContext *seg)
-+{
-+    avio_closep(&seg->pb);
-+    avformat_free_context(seg->avf);
-+    seg->avf = NULL;
-+}
-+
- static int seg_write_header(AVFormatContext *s)
- {
-     SegmentContext *seg = s->priv_data;
-@@ -265,12 +272,9 @@ static int seg_write_header(AVFormatContext *s)
-     }
- 
- fail:
--    if (ret) {
--        if (seg->list)
--            avio_close(seg->pb);
--        if (seg->avf)
--            avformat_free_context(seg->avf);
--    }
-+    if (ret < 0)
-+        seg_free_context(seg);
-+
-     return ret;
- }
- 
-@@ -282,6 +286,9 @@ static int seg_write_packet(AVFormatContext *s, AVPacket *pkt)
-     int64_t end_pts = seg->recording_time * seg->number;
-     int ret, can_split = 1;
- 
-+    if (!oc)
-+        return AVERROR(EINVAL);
-+
-     if (seg->has_video) {
-         can_split = st->codec->codec_type == AVMEDIA_TYPE_VIDEO &&
-                     pkt->flags & AV_PKT_FLAG_KEY;
-@@ -322,11 +329,8 @@ static int seg_write_packet(AVFormatContext *s, AVPacket *pkt)
-     ret = ff_write_chained(oc, pkt->stream_index, pkt, s);
- 
- fail:
--    if (ret < 0) {
--        if (seg->list)
--            avio_close(seg->pb);
--        avformat_free_context(oc);
--    }
-+    if (ret < 0)
-+        seg_free_context(seg);
- 
-     return ret;
- }
-@@ -335,7 +339,11 @@ static int seg_write_trailer(struct AVFormatContext *s)
- {
-     SegmentContext *seg = s->priv_data;
-     AVFormatContext *oc = seg->avf;
--    int ret;
-+    int ret = 0;
-+
-+    if (!oc)
-+        goto fail;
-+
-     if (!seg->write_header_trailer) {
-         if ((ret = segment_end(oc, 0)) < 0)
-             goto fail;
--- 
-2.4.1.314.g9532ead
-
diff --git a/meta/recipes-multimedia/libav/libav/workaround-to-build-libav-for-i586-with-gcc.patch b/meta/recipes-multimedia/libav/libav/workaround-to-build-libav-for-i586-with-gcc.patch
new file mode 100644
index 0000000..36f6ded
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav/workaround-to-build-libav-for-i586-with-gcc.patch
@@ -0,0 +1,26 @@
+Description: Workaround to build libav for i586 with gcc 4.9.2 by avoiding memset
+Author: Bernhard Übelacker <bernhardu@vr-web.de>
+
+---
+Bug-Debian: https://bugs.debian.org/783082
+Last-Update: 2015-04-28
+
+Upstream-Status: Backport [debian]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+--- libav-11.3.orig/libavcodec/h264_cabac.c
++++ libav-11.3/libavcodec/h264_cabac.c
+@@ -2020,7 +2020,11 @@ decode_intra_mb:
+         // In deblocking, the quantizer is 0
+         h->cur_pic.qscale_table[mb_xy] = 0;
+         // All coeffs are present
+-        memset(h->non_zero_count[mb_xy], 16, 48);
++        /*memset(h->non_zero_count[mb_xy], 16, 48);*/
++            /* avoiding this memset because it leads at least with gcc4.9.2 to error: 'asm' operand has impossible constraints */
++        for (size_t i = 0; i < 48; i++) {
++            ( (unsigned char*)(h->non_zero_count[mb_xy]) ) [i] = 16;
++        }
+         h->cur_pic.mb_type[mb_xy] = mb_type;
+         h->last_qscale_diff = 0;
+         return 0;
diff --git a/meta/recipes-multimedia/libav/libav_11.4.bb b/meta/recipes-multimedia/libav/libav_11.4.bb
new file mode 100644
index 0000000..dde7094
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav_11.4.bb
@@ -0,0 +1,4 @@
+require libav.inc
+
+SRC_URI[md5sum] = "98c264530a3a5e569543f60b917c3daa"
+SRC_URI[sha256sum] = "0b7dabc2605f3a254ee410bb4b1a857945696aab495fe21b34c3b6544ff5d525"
diff --git a/meta/recipes-multimedia/libav/libav_9.18.bb b/meta/recipes-multimedia/libav/libav_9.18.bb
deleted file mode 100644
index 210a649..0000000
--- a/meta/recipes-multimedia/libav/libav_9.18.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libav.inc
-
-SRC_URI[md5sum] = "75e838068a75fb88e1b4ea0546bc16f0"
-SRC_URI[sha256sum] = "0875e835da683eef1a7bac75e1884634194149d7479d1538ba9fbe1614d066d7"
-
-SRC_URI += "file://libav-fix-CVE-2014-9676.patch"
-- 
1.7.9.5


