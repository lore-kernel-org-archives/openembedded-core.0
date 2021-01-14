Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3701.1610640599644781266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 4ljQHEyHQt+UhZZcscGGdbnQM5Gdt3Mdxi6UT6soOCfa82xyrVZP3HUHFN0/2kCe1yOQRXcjsw
 W0VbIm6TMVrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166062693"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="166062693"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:10 -0800
IronPort-SDR: VvAnAD+WZ8ZdSal3PtnA8Wxo1Uinj0UtYOJInZBo7zKMSniNKIsy9LF7LI+GHbilFxQxldPdhj
 FQLhvlkBWTCQ==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986649"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:08 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/14] ffmpeg: Fix CVE-2020-35964, CVE-2020-35965
Date: Fri, 15 Jan 2021 00:09:45 +0800
Message-Id: <efe5a17b8ffca9f8a0f4d4b75cd3383f2491017d.1610639458.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610639458.git.anuj.mittal@intel.com>
References: <cover.1610639458.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

Backport the CVE patches from upstream:
https://github.com/FFmpeg/FFmpeg/commit/27a99e2c7d450fef15594671eef4465c8a166bd7
https://github.com/FFmpeg/FFmpeg/commit/3e5959b3457f7f1856d997261e6ac672bba49e8b

CVE:
CVE-2020-35964
CVE-2020-35965

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 526ee4ca2c493de1ac494b69e5ce9a9e55835c3a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ffmpeg/ffmpeg/CVE-2020-35964.patch        | 75 +++++++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2020-35965.patch        | 35 +++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb |  2 +
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch
new file mode 100644
index 0000000000..6b96bd674f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch
@@ -0,0 +1,75 @@
+From 27a99e2c7d450fef15594671eef4465c8a166bd7 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Wed, 28 Oct 2020 20:11:54 +0100
+Subject: [PATCH] avformat/vividas: improve extradata packing checks in
+ track_header()
+
+Fixes: out of array accesses
+Fixes: 26622/clusterfuzz-testcase-minimized-ffmpeg_dem_VIVIDAS_fuzzer-6581200338288640
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/27a99e2c7d450fef15594671eef4465c8a166bd7]
+
+CVE: CVE-2020-35964
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
+---
+ libavformat/vividas.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/libavformat/vividas.c b/libavformat/vividas.c
+index 83d0ed116787..46c66bf9a0ae 100644
+--- a/libavformat/vividas.c
++++ b/libavformat/vividas.c
+@@ -28,6 +28,7 @@
+  * @sa http://wiki.multimedia.cx/index.php?title=Vividas_VIV
+  */
+ 
++#include "libavutil/avassert.h"
+ #include "libavutil/intreadwrite.h"
+ #include "avio_internal.h"
+ #include "avformat.h"
+@@ -379,7 +380,7 @@ static int track_header(VividasDemuxContext *viv, AVFormatContext *s,  uint8_t *
+ 
+         if (avio_tell(pb) < off) {
+             int num_data;
+-            int xd_size = 0;
++            int xd_size = 1;
+             int data_len[256];
+             int offset = 1;
+             uint8_t *p;
+@@ -393,10 +394,10 @@ static int track_header(VividasDemuxContext *viv, AVFormatContext *s,  uint8_t *
+                     return AVERROR_INVALIDDATA;
+                 }
+                 data_len[j] = len;
+-                xd_size += len;
++                xd_size += len + 1 + len/255;
+             }
+ 
+-            ret = ff_alloc_extradata(st->codecpar, 64 + xd_size + xd_size / 255);
++            ret = ff_alloc_extradata(st->codecpar, xd_size);
+             if (ret < 0)
+                 return ret;
+ 
+@@ -405,9 +406,7 @@ static int track_header(VividasDemuxContext *viv, AVFormatContext *s,  uint8_t *
+ 
+             for (j = 0; j < num_data - 1; j++) {
+                 unsigned delta = av_xiphlacing(&p[offset], data_len[j]);
+-                if (delta > data_len[j]) {
+-                    return AVERROR_INVALIDDATA;
+-                }
++                av_assert0(delta <= xd_size - offset);
+                 offset += delta;
+             }
+ 
+@@ -418,6 +417,7 @@ static int track_header(VividasDemuxContext *viv, AVFormatContext *s,  uint8_t *
+                     av_freep(&st->codecpar->extradata);
+                     break;
+                 }
++                av_assert0(data_len[j] <= xd_size - offset);
+                 offset += data_len[j];
+             }
+ 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch
new file mode 100644
index 0000000000..ddab8e9aca
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch
@@ -0,0 +1,35 @@
+From 3e5959b3457f7f1856d997261e6ac672bba49e8b Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 24 Oct 2020 22:21:48 +0200
+Subject: [PATCH] avcodec/exr: Check ymin vs. h
+
+Fixes: out of array access
+Fixes: 26532/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_EXR_fuzzer-5613925708857344
+Fixes: 27443/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_EXR_fuzzer-5631239813595136
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/3e5959b3457f7f1856d997261e6ac672bba49e8b]
+
+CVE: CVE-2020-35965
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
+---
+ libavcodec/exr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/exr.c b/libavcodec/exr.c
+index e907c5c46401..8b701d1cd298 100644
+--- a/libavcodec/exr.c
++++ b/libavcodec/exr.c
+@@ -1830,7 +1830,7 @@ static int decode_frame(AVCodecContext *avctx, void *data,
+     // Zero out the start if ymin is not 0
+     for (i = 0; i < planes; i++) {
+         ptr = picture->data[i];
+-        for (y = 0; y < s->ymin; y++) {
++        for (y = 0; y < FFMIN(s->ymin, s->h); y++) {
+             memset(ptr, 0, out_line_size);
+             ptr += picture->linesize[i];
+         }
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
index 37647e8ec5..f902b08811 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
@@ -26,6 +26,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
+           file://CVE-2020-35964.patch \
+           file://CVE-2020-35965.patch \
            "
 SRC_URI[sha256sum] = "ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda2a9212b34d2ffb"
 
-- 
2.29.2

