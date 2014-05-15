Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 484AA6A359
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 02:04:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4F245Zp024757
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 19:04:05 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 14 May 2014 19:04:04 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 10:03:51 +0800
Message-ID: <98a143164c6ea5690ab55288e0cedc3330e5a639.1400118419.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400118419.git.rongqing.li@windriver.com>
References: <cover.1400118419.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/12] Security Advisory - ffmpeg - CVE-2014-2263
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
X-List-Received-Date: Thu, 15 May 2014 02:04:10 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The mpegts_write_pmt function in the MPEG2 transport stream (aka DVB)
muxer (libavformat/mpegtsenc.c) in FFmpeg, possibly 2.1 and earlier,
allows remote attackers to have unspecified impact and vectors, which
trigger an out-of-bounds write.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2263

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...egtsenc-Check-data-array-size-in-mpegts_w.patch |   67 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch
new file mode 100644
index 0000000..0e00355
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch
@@ -0,0 +1,67 @@
+From 12770701856a05b6b3cd706f708f8e9a4e8a1336 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Thu, 13 Feb 2014 13:59:51 +0100
+Subject: [PATCH] avformat/mpegtsenc: Check data array size in
+ mpegts_write_pmt()
+
+COmmit 12770701856a05b6b3cd706f708f8e9a4e8a1336 release/0.11
+
+Prevents out of array writes
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit 842b6c14bcfc1c5da1a2d288fd65386eb8c158ad)
+
+Conflicts:
+
+	libavformat/mpegtsenc.c
+(cherry picked from commit e87de3f50b765134588d0b048c32ed4b8acc16fb)
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavformat/mpegtsenc.c |    9 +++++++--
+ 1 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libavformat/mpegtsenc.c b/libavformat/mpegtsenc.c
+index 793e205..a12d19f 100644
+--- a/gst-libs/ext/libav/libavformat/mpegtsenc.c
++++ b/gst-libs/ext/libav/libavformat/mpegtsenc.c
+@@ -240,7 +240,7 @@ static void mpegts_write_pat(AVFormatContext *s)
+                           data, q - data);
+ }
+ 
+-static void mpegts_write_pmt(AVFormatContext *s, MpegTSService *service)
++static int mpegts_write_pmt(AVFormatContext *s, MpegTSService *service)
+ {
+     //    MpegTSWrite *ts = s->priv_data;
+     uint8_t data[1012], *q, *desc_length_ptr, *program_info_length_ptr;
+@@ -293,6 +293,10 @@ static void mpegts_write_pmt(AVFormatContext *s, MpegTSService *service)
+             stream_type = STREAM_TYPE_PRIVATE_DATA;
+             break;
+         }
++
++        if (q - data > sizeof(data) - 32)
++            return AVERROR(EINVAL);
++
+         *q++ = stream_type;
+         put16(&q, 0xe000 | ts_st->pid);
+         desc_length_ptr = q;
+@@ -324,7 +328,7 @@ static void mpegts_write_pmt(AVFormatContext *s, MpegTSService *service)
+                 len_ptr = q++;
+                 *len_ptr = 0;
+ 
+-                for (p = lang->value; next && *len_ptr < 255 / 4 * 4; p = next + 1) {
++                for (p = lang->value; next && *len_ptr < 255 / 4 * 4 && q - data < sizeof(data) - 4; p = next + 1) {
+                     next = strchr(p, ',');
+                     if (strlen(p) != 3 && (!next || next != p + 3))
+                         continue; /* not a 3-letter code */
+@@ -386,6 +390,7 @@ static void mpegts_write_pmt(AVFormatContext *s, MpegTSService *service)
+     }
+     mpegts_write_section1(&service->pmt, PMT_TID, service->sid, 0, 0, 0,
+                           data, q - data);
++    return 0;
+ }
+ 
+ /* NOTE: str == NULL is accepted for an empty string */
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index e1257a2..4913539 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libav_e500mc.patch \
            file://libav_e5500.patch \
            file://gst-ffmpeg-CVE-2013-3674.patch \
+           file://0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


