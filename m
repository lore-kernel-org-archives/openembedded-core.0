Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1875.1615402499808382994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 10:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12AIsq2w025105
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 10:54:58 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Mar 2021 10:54:52 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Wed, 10 Mar 2021 10:54:52 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ffmpeg: upgrade 4.3.1 -> 4.3.2
Date: Wed, 10 Mar 2021 13:54:51 -0500
Message-ID: <20210310185451.320608-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove 2 patches that are included in the n4.3.2 tag.
The commits were cherry-picked back to the 4.3 branch so they
have different commit ids than in the patches:

6d886b6586 lavf/srt: fix build fail when used the libsrt 1.4.1
a53ffb15d8 avcodec/exr: Check ymin vs. h
4f0bdff292 avformat/vividas: improve extradata packing checks in track_header()

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...uild-fail-when-used-the-libsrt-1.4.1.patch | 52 -------------
 .../ffmpeg/ffmpeg/CVE-2020-35964.patch        | 75 -------------------
 .../ffmpeg/ffmpeg/CVE-2020-35965.patch        | 35 ---------
 .../{ffmpeg_4.3.1.bb => ffmpeg_4.3.2.bb}      |  5 +-
 4 files changed, 1 insertion(+), 166 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.3.1.bb => ffmpeg_4.3.2.bb} (96%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch
deleted file mode 100644
index 7635c9196a..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From aebb72e025cbfbd4a6765354f6f565ad4ac89789 Mon Sep 17 00:00:00 2001
-From: Jun Zhao <barryjzhao@tencent.com>
-Date: Sun, 12 Jul 2020 05:48:48 +0800
-Subject: [PATCH] lavf/srt: fix build fail when used the libsrt 1.4.1
-
-lavf/srt: fix build fail when used the libsrt 1.4.1
-
-libsrt changed the:
-SRTO_SMOOTHER   -> SRTO_CONGESTION
-SRTO_STRICTENC  -> SRTO_ENFORCEDENCRYPTION
-and removed the front of deprecated options (SRTO_SMOOTHER/SRTO_STRICTENC)
-in the header, it's lead to build fail
-
-fix #8760
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/7c59e1b0f285cd7c7b35fcd71f49c5fd52cf9315]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-Signed-off-by: Jun Zhao <barryjzhao@tencent.com>
----
- libavformat/libsrt.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/libavformat/libsrt.c b/libavformat/libsrt.c
-index 4de575b..4719ce0 100644
---- a/libavformat/libsrt.c
-+++ b/libavformat/libsrt.c
-@@ -313,8 +313,12 @@ static int libsrt_set_options_pre(URLContext *h, int fd)
-         (s->pbkeylen >= 0 && libsrt_setsockopt(h, fd, SRTO_PBKEYLEN, "SRTO_PBKEYLEN", &s->pbkeylen, sizeof(s->pbkeylen)) < 0) ||
-         (s->passphrase && libsrt_setsockopt(h, fd, SRTO_PASSPHRASE, "SRTO_PASSPHRASE", s->passphrase, strlen(s->passphrase)) < 0) ||
- #if SRT_VERSION_VALUE >= 0x010302
-+#if SRT_VERSION_VALUE >= 0x010401
-+        (s->enforced_encryption >= 0 && libsrt_setsockopt(h, fd, SRTO_ENFORCEDENCRYPTION, "SRTO_ENFORCEDENCRYPTION", &s->enforced_encryption, sizeof(s->enforced_encryption)) < 0) ||
-+#else
-         /* SRTO_STRICTENC == SRTO_ENFORCEDENCRYPTION (53), but for compatibility, we used SRTO_STRICTENC */
-         (s->enforced_encryption >= 0 && libsrt_setsockopt(h, fd, SRTO_STRICTENC, "SRTO_STRICTENC", &s->enforced_encryption, sizeof(s->enforced_encryption)) < 0) ||
-+#endif
-         (s->kmrefreshrate >= 0 && libsrt_setsockopt(h, fd, SRTO_KMREFRESHRATE, "SRTO_KMREFRESHRATE", &s->kmrefreshrate, sizeof(s->kmrefreshrate)) < 0) ||
-         (s->kmpreannounce >= 0 && libsrt_setsockopt(h, fd, SRTO_KMPREANNOUNCE, "SRTO_KMPREANNOUNCE", &s->kmpreannounce, sizeof(s->kmpreannounce)) < 0) ||
- #endif
-@@ -333,7 +337,11 @@ static int libsrt_set_options_pre(URLContext *h, int fd)
-         (s->lossmaxttl >= 0 && libsrt_setsockopt(h, fd, SRTO_LOSSMAXTTL, "SRTO_LOSSMAXTTL", &s->lossmaxttl, sizeof(s->lossmaxttl)) < 0) ||
-         (s->minversion >= 0 && libsrt_setsockopt(h, fd, SRTO_MINVERSION, "SRTO_MINVERSION", &s->minversion, sizeof(s->minversion)) < 0) ||
-         (s->streamid && libsrt_setsockopt(h, fd, SRTO_STREAMID, "SRTO_STREAMID", s->streamid, strlen(s->streamid)) < 0) ||
-+#if SRT_VERSION_VALUE >= 0x010401
-+        (s->smoother && libsrt_setsockopt(h, fd, SRTO_CONGESTION, "SRTO_CONGESTION", s->smoother, strlen(s->smoother)) < 0) ||
-+#else
-         (s->smoother && libsrt_setsockopt(h, fd, SRTO_SMOOTHER, "SRTO_SMOOTHER", s->smoother, strlen(s->smoother)) < 0) ||
-+#endif
-         (s->messageapi >= 0 && libsrt_setsockopt(h, fd, SRTO_MESSAGEAPI, "SRTO_MESSAGEAPI", &s->messageapi, sizeof(s->messageapi)) < 0) ||
-         (s->payload_size >= 0 && libsrt_setsockopt(h, fd, SRTO_PAYLOADSIZE, "SRTO_PAYLOADSIZE", &s->payload_size, sizeof(s->payload_size)) < 0) ||
-         ((h->flags & AVIO_FLAG_WRITE) && libsrt_setsockopt(h, fd, SRTO_SENDER, "SRTO_SENDER", &yes, sizeof(yes)) < 0)) {
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch
deleted file mode 100644
index 6b96bd674f..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 27a99e2c7d450fef15594671eef4465c8a166bd7 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Wed, 28 Oct 2020 20:11:54 +0100
-Subject: [PATCH] avformat/vividas: improve extradata packing checks in
- track_header()
-
-Fixes: out of array accesses
-Fixes: 26622/clusterfuzz-testcase-minimized-ffmpeg_dem_VIVIDAS_fuzzer-6581200338288640
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/27a99e2c7d450fef15594671eef4465c8a166bd7]
-
-CVE: CVE-2020-35964
-
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
----
- libavformat/vividas.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/libavformat/vividas.c b/libavformat/vividas.c
-index 83d0ed116787..46c66bf9a0ae 100644
---- a/libavformat/vividas.c
-+++ b/libavformat/vividas.c
-@@ -28,6 +28,7 @@
-  * @sa http://wiki.multimedia.cx/index.php?title=Vividas_VIV
-  */
- 
-+#include "libavutil/avassert.h"
- #include "libavutil/intreadwrite.h"
- #include "avio_internal.h"
- #include "avformat.h"
-@@ -379,7 +380,7 @@ static int track_header(VividasDemuxContext *viv, AVFormatContext *s,  uint8_t *
- 
-         if (avio_tell(pb) < off) {
-             int num_data;
--            int xd_size = 0;
-+            int xd_size = 1;
-             int data_len[256];
-             int offset = 1;
-             uint8_t *p;
-@@ -393,10 +394,10 @@ static int track_header(VividasDemuxContext *viv, AVFormatContext *s,  uint8_t *
-                     return AVERROR_INVALIDDATA;
-                 }
-                 data_len[j] = len;
--                xd_size += len;
-+                xd_size += len + 1 + len/255;
-             }
- 
--            ret = ff_alloc_extradata(st->codecpar, 64 + xd_size + xd_size / 255);
-+            ret = ff_alloc_extradata(st->codecpar, xd_size);
-             if (ret < 0)
-                 return ret;
- 
-@@ -405,9 +406,7 @@ static int track_header(VividasDemuxContext *viv, AVFormatContext *s,  uint8_t *
- 
-             for (j = 0; j < num_data - 1; j++) {
-                 unsigned delta = av_xiphlacing(&p[offset], data_len[j]);
--                if (delta > data_len[j]) {
--                    return AVERROR_INVALIDDATA;
--                }
-+                av_assert0(delta <= xd_size - offset);
-                 offset += delta;
-             }
- 
-@@ -418,6 +417,7 @@ static int track_header(VividasDemuxContext *viv, AVFormatContext *s,  uint8_t *
-                     av_freep(&st->codecpar->extradata);
-                     break;
-                 }
-+                av_assert0(data_len[j] <= xd_size - offset);
-                 offset += data_len[j];
-             }
- 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch
deleted file mode 100644
index ddab8e9aca..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3e5959b3457f7f1856d997261e6ac672bba49e8b Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 24 Oct 2020 22:21:48 +0200
-Subject: [PATCH] avcodec/exr: Check ymin vs. h
-
-Fixes: out of array access
-Fixes: 26532/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_EXR_fuzzer-5613925708857344
-Fixes: 27443/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_EXR_fuzzer-5631239813595136
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/3e5959b3457f7f1856d997261e6ac672bba49e8b]
-
-CVE: CVE-2020-35965
-
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
----
- libavcodec/exr.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavcodec/exr.c b/libavcodec/exr.c
-index e907c5c46401..8b701d1cd298 100644
---- a/libavcodec/exr.c
-+++ b/libavcodec/exr.c
-@@ -1830,7 +1830,7 @@ static int decode_frame(AVCodecContext *avctx, void *data,
-     // Zero out the start if ymin is not 0
-     for (i = 0; i < planes; i++) {
-         ptr = picture->data[i];
--        for (y = 0; y < s->ymin; y++) {
-+        for (y = 0; y < FFMIN(s->ymin, s->h); y++) {
-             memset(ptr, 0, out_line_size);
-             ptr += picture->linesize[i];
-         }
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
similarity index 96%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index bd21552332..9dd56fbba4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -25,12 +25,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
-           file://0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
-           file://CVE-2020-35964.patch \
-           file://CVE-2020-35965.patch \
            "
-SRC_URI[sha256sum] = "ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda2a9212b34d2ffb"
+SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.27.0

