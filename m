Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.6989.1610444254311755214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 01:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: cLpLsxw6l5Z8rn7TpK3geU+16m3N6v+MVHhvPsISxAwc1d3FITuffgBTempeR/dGhUEj3A7aLa
 ME0lU+nufM0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="157191544"
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; 
   d="scan'208";a="157191544"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 01:37:33 -0800
IronPort-SDR: dYIJjsECWv2L9iJahk+tl+wM7K1NZ4W+eXwFc1fEDQ5iEo1Lj04MNBVYc0mQjrgGTeKEqtOJId
 8wEs33+Ft8zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; 
   d="scan'208";a="352958069"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jan 2021 01:37:32 -0800
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH] ffmpeg: Fix CVE-2020-35964, CVE-2020-35965
Date: Tue, 12 Jan 2021 17:37:31 +0800
Message-Id: <1610444251-28618-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

Backport the CVE patches from upstream:
https://github.com/FFmpeg/FFmpeg/commit/27a99e2c7d450fef15594671eef4465c8a166bd7
https://github.com/FFmpeg/FFmpeg/commit/3e5959b3457f7f1856d997261e6ac672bba49e8b

CVE:
CVE-2020-35964
CVE-2020-35965

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 .../ffmpeg/ffmpeg/CVE-2020-35964.patch             | 75 ++++++++++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2020-35965.patch             | 35 ++++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb     |  2 +
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch
new file mode 100644
index 0000000..6b96bd6
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
index 0000000..ddab8e9
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
index 97b2d21..ded8232 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
@@ -27,6 +27,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
+           file://CVE-2020-35964.patch \
+           file://CVE-2020-35965.patch \
            "
 SRC_URI[sha256sum] = "ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda2a9212b34d2ffb"
 
-- 
2.7.4

