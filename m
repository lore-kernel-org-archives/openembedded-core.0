Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [PATCH 24/33] ffmpeg: update 4.4 -> 4.4.1
Date: Tue,  2 Nov 2021 09:42:54 +0100
Message-Id: <20211102084303.2974802-24-alex@linutronix.de>
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Michael Niedermayer <michael@niedermayer.cc>, Tony Tascioglu <tony.tascioglu@windriver.com>, =?UTF-8?q?Burak=20=C3=87ar=C4=B1k=C3=A7=C4=B1?= <burakcarikci@crypttech.com>, Kiran Surendran <kiran.surendran@windriver.com>, Paul B Mahol <onemda@gmail.com>, James Almer <jamrial@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ffmpeg/ffmpeg/fix-CVE-2020-20446.patch    | 35 --------
 .../ffmpeg/ffmpeg/fix-CVE-2020-20453.patch    | 42 ---------
 .../ffmpeg/ffmpeg/fix-CVE-2020-22015.patch    | 44 ----------
 .../ffmpeg/ffmpeg/fix-CVE-2020-22021.patch    | 87 -------------------
 .../fix-CVE-2020-22033-CVE-2020-22019.patch   | 40 ---------
 .../ffmpeg/ffmpeg/fix-CVE-2021-33815.patch    | 44 ----------
 .../ffmpeg/ffmpeg/fix-CVE-2021-38114.patch    | 67 --------------
 .../ffmpeg/ffmpeg/fix-CVE-2021-38171.patch    | 42 ---------
 .../ffmpeg/{ffmpeg_4.4.bb => ffmpeg_4.4.1.bb} | 12 +--
 9 files changed, 2 insertions(+), 411 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20446.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22021.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-33815.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.4.bb => ffmpeg_4.4.1.bb} (94%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20446.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20446.patch
deleted file mode 100644
index f048c2e715..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20446.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 223b5e8ac9f6461bb13ed365419ec485c5b2b002 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Fri, 28 May 2021 20:18:25 +0200
-Subject: [PATCH] avcodec/aacpsy: Avoid floating point division by 0 of
- norm_fac
-
-Fixes: Ticket7995
-Fixes: CVE-2020-20446
-
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2020-20446
-Upstream-Status: Backport [223b5e8ac9f6461bb13ed365419ec485c5b2b002]
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
----
- libavcodec/aacpsy.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavcodec/aacpsy.c b/libavcodec/aacpsy.c
-index 482113d427..e51d29750b 100644
---- a/libavcodec/aacpsy.c
-+++ b/libavcodec/aacpsy.c
-@@ -794,7 +794,7 @@ static void psy_3gpp_analyze_channel(FFPsyContext *ctx, int channel,
- 
-         if (pe < 1.15f * desired_pe) {
-             /* 6.6.1.3.6 "Final threshold modification by linearization" */
--            norm_fac = 1.0f / norm_fac;
-+            norm_fac = norm_fac ? 1.0f / norm_fac : 0;
-             for (w = 0; w < wi->num_windows*16; w += 16) {
-                 for (g = 0; g < num_bands; g++) {
-                     AacPsyBand *band = &pch->band[w+g];
--- 
-2.32.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch
deleted file mode 100644
index b1c94057a3..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a7a7f32c8ad0179a1a85d0a8cff35924e6d90be8 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Fri, 28 May 2021 21:37:26 +0200
-Subject: [PATCH] avcodec/aacenc: Avoid 0 lambda
-
-Fixes: Ticket8003
-Fixes: CVE-2020-20453
-
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2020-20453
-Upstream-Status: Backport [a7a7f32c8ad0179a1a85d0a8cff35924e6d90be8]
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
----
- libavcodec/aacenc.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libavcodec/aacenc.c b/libavcodec/aacenc.c
-index aa223cf25f..e80591ba86 100644
---- a/libavcodec/aacenc.c
-+++ b/libavcodec/aacenc.c
-@@ -28,6 +28,7 @@
-  *              TODOs:
-  * add sane pulse detection
-  ***********************************/
-+#include <float.h>
- 
- #include "libavutil/libm.h"
- #include "libavutil/float_dsp.h"
-@@ -852,7 +853,7 @@ static int aac_encode_frame(AVCodecContext *avctx, AVPacket *avpkt,
-                 /* Not so fast though */
-                 ratio = sqrtf(ratio);
-             }
--            s->lambda = FFMIN(s->lambda * ratio, 65536.f);
-+            s->lambda = av_clipf(s->lambda * ratio, FLT_MIN, 65536.f);
- 
-             /* Keep iterating if we must reduce and lambda is in the sky */
-             if (ratio > 0.9f && ratio < 1.1f) {
--- 
-2.32.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch
deleted file mode 100644
index 5c911299cb..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4c1afa292520329eecd1cc7631bc59a8cca95c46 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 29 May 2021 09:22:27 +0200
-Subject: [PATCH] avformat/movenc: Check pal_size before use
-
-Fixes: assertion failure
-Fixes: out of array read
-Fixes: Ticket8190
-Fixes: CVE-2020-22015
-
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-
-CVE: CVE-2020-22015
-Upstream-Status: Backport [4c1afa292520329eecd1cc7631bc59a8cca95c46]
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
----
- libavformat/movenc.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/libavformat/movenc.c b/libavformat/movenc.c
-index 2ab507df15..7d839f447b 100644
---- a/libavformat/movenc.c
-+++ b/libavformat/movenc.c
-@@ -2160,11 +2160,13 @@ static int mov_write_video_tag(AVFormatContext *s, AVIOContext *pb, MOVMuxContex
-         avio_wb16(pb, 0x18); /* Reserved */
- 
-     if (track->mode == MODE_MOV && track->par->format == AV_PIX_FMT_PAL8) {
--        int pal_size = 1 << track->par->bits_per_coded_sample;
--        int i;
-+        int pal_size, i;
-         avio_wb16(pb, 0);             /* Color table ID */
-         avio_wb32(pb, 0);             /* Color table seed */
-         avio_wb16(pb, 0x8000);        /* Color table flags */
-+        if (track->par->bits_per_coded_sample < 0 || track->par->bits_per_coded_sample > 8)
-+            return AVERROR(EINVAL);
-+        pal_size = 1 << track->par->bits_per_coded_sample;
-         avio_wb16(pb, pal_size - 1);  /* Color table size (zero-relative) */
-         for (i = 0; i < pal_size; i++) {
-             uint32_t rgb = track->palette[i];
--- 
-2.32.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22021.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22021.patch
deleted file mode 100644
index 6f7fce0e4c..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22021.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 7971f62120a55c141ec437aa3f0bacc1c1a3526b Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 29 May 2021 11:17:35 +0200
-Subject: [PATCH] avfilter/vf_yadif: Fix handing of tiny images
-
-Fixes: out of array access
-Fixes: Ticket8240
-Fixes: CVE-2020-22021
-
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2020-22021
-Upstream-Status: Backport [7971f62120a55c141ec437aa3f0bacc1c1a3526b]
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
----
- libavfilter/vf_yadif.c | 32 ++++++++++++++++++--------------
- 1 file changed, 18 insertions(+), 14 deletions(-)
-
-diff --git a/libavfilter/vf_yadif.c b/libavfilter/vf_yadif.c
-index 91cc79ecc3..b0d9fbaf1f 100644
---- a/libavfilter/vf_yadif.c
-+++ b/libavfilter/vf_yadif.c
-@@ -123,20 +123,22 @@ static void filter_edges(void *dst1, void *prev1, void *cur1, void *next1,
-     uint8_t *next2 = parity ? cur  : next;
- 
-     const int edge = MAX_ALIGN - 1;
-+    int offset = FFMAX(w - edge, 3);
- 
-     /* Only edge pixels need to be processed here.  A constant value of false
-      * for is_not_edge should let the compiler ignore the whole branch. */
--    FILTER(0, 3, 0)
-+    FILTER(0, FFMIN(3, w), 0)
- 
--    dst  = (uint8_t*)dst1  + w - edge;
--    prev = (uint8_t*)prev1 + w - edge;
--    cur  = (uint8_t*)cur1  + w - edge;
--    next = (uint8_t*)next1 + w - edge;
-+    dst  = (uint8_t*)dst1  + offset;
-+    prev = (uint8_t*)prev1 + offset;
-+    cur  = (uint8_t*)cur1  + offset;
-+    next = (uint8_t*)next1 + offset;
-     prev2 = (uint8_t*)(parity ? prev : cur);
-     next2 = (uint8_t*)(parity ? cur  : next);
- 
--    FILTER(w - edge, w - 3, 1)
--    FILTER(w - 3, w, 0)
-+    FILTER(offset, w - 3, 1)
-+    offset = FFMAX(offset, w - 3);
-+    FILTER(offset, w, 0)
- }
- 
- 
-@@ -170,21 +172,23 @@ static void filter_edges_16bit(void *dst1, void *prev1, void *cur1, void *next1,
-     uint16_t *next2 = parity ? cur  : next;
- 
-     const int edge = MAX_ALIGN / 2 - 1;
-+    int offset = FFMAX(w - edge, 3);
- 
-     mrefs /= 2;
-     prefs /= 2;
- 
--    FILTER(0, 3, 0)
-+    FILTER(0,  FFMIN(3, w), 0)
- 
--    dst   = (uint16_t*)dst1  + w - edge;
--    prev  = (uint16_t*)prev1 + w - edge;
--    cur   = (uint16_t*)cur1  + w - edge;
--    next  = (uint16_t*)next1 + w - edge;
-+    dst   = (uint16_t*)dst1  + offset;
-+    prev  = (uint16_t*)prev1 + offset;
-+    cur   = (uint16_t*)cur1  + offset;
-+    next  = (uint16_t*)next1 + offset;
-     prev2 = (uint16_t*)(parity ? prev : cur);
-     next2 = (uint16_t*)(parity ? cur  : next);
- 
--    FILTER(w - edge, w - 3, 1)
--    FILTER(w - 3, w, 0)
-+    FILTER(offset, w - 3, 1)
-+    offset = FFMAX(offset, w - 3);
-+    FILTER(offset, w, 0)
- }
- 
- static int filter_slice(AVFilterContext *ctx, void *arg, int jobnr, int nb_jobs)
--- 
-2.32.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch
deleted file mode 100644
index 5d979ca3f2..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 82ad1b76751bcfad5005440db48c46a4de5d6f02 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 29 May 2021 09:58:31 +0200
-Subject: [PATCH] avfilter/vf_vmafmotion: Check dimensions
-
-Fixes: out of array access
-Fixes: Ticket8241
-Fixes: Ticket8246
-Fixes: CVE-2020-22019
-Fixes: CVE-2020-22033
-
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-
-CVE: CVE-2020-22033
-CVE: CVE-2020-22019
-Upstream-Status: Backport [82ad1b76751bcfad5005440db48c46a4de5d6f02]
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
----
- libavfilter/vf_vmafmotion.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/libavfilter/vf_vmafmotion.c b/libavfilter/vf_vmafmotion.c
-index 2db4783d8d..454ebb8afa 100644
---- a/libavfilter/vf_vmafmotion.c
-+++ b/libavfilter/vf_vmafmotion.c
-@@ -238,6 +238,9 @@ int ff_vmafmotion_init(VMAFMotionData *s,
-     int i;
-     const AVPixFmtDescriptor *desc = av_pix_fmt_desc_get(fmt);
- 
-+    if (w < 3 || h < 3)
-+        return AVERROR(EINVAL);
-+
-     s->width = w;
-     s->height = h;
-     s->stride = FFALIGN(w * sizeof(uint16_t), 32);
--- 
-2.32.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-33815.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-33815.patch
deleted file mode 100644
index 51edb76389..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-33815.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 26d3c81bc5ef2f8c3f09d45eaeacfb4b1139a777 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Tue, 25 May 2021 19:29:18 +0200
-Subject: [PATCH] avcodec/exr: More strictly check dc_count
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes: out of array access
-Fixes: exr/deneme
-
-Found-by: Burak Çarıkçı <burakcarikci@crypttech.com>
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-
-CVE: CVE-2021-33815
-Upstream-Status: Backport [26d3c81bc5ef2f8c3f09d45eaeacfb4b1139a777]
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
----
- libavcodec/exr.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libavcodec/exr.c b/libavcodec/exr.c
-index 9377a89169..4648ed7d62 100644
---- a/libavcodec/exr.c
-+++ b/libavcodec/exr.c
-@@ -1059,11 +1059,11 @@ static int dwa_uncompress(EXRContext *s, const uint8_t *src, int compressed_size
-         bytestream2_skip(&gb, ac_size);
-     }
- 
--    if (dc_size > 0) {
-+    {
-         unsigned long dest_len = dc_count * 2LL;
-         GetByteContext agb = gb;
- 
--        if (dc_count > (6LL * td->xsize * td->ysize + 63) / 64)
-+        if (dc_count != dc_w * dc_h * 3)
-             return AVERROR_INVALIDDATA;
- 
-         av_fast_padded_malloc(&td->dc_data, &td->dc_size, FFALIGN(dest_len, 64) * 2);
--- 
-2.32.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch
deleted file mode 100644
index ab3ecfecbb..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-CVE: CVE-2021-38114
-Upstream-Status: Backport
-Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
-
-From 463dbe4e78cc560ca5b09f23a07add0eb78ccee8 Mon Sep 17 00:00:00 2001
-From: maryam ebr <me22bee@outlook.com>
-Date: Tue, 3 Aug 2021 01:05:47 -0400
-Subject: [PATCH] avcodec/dnxhddec: check and propagate function return value
-
-Similar to CVE-2013-0868, here return value check for 'init_vlc' is needed.
-crafted DNxHD data can cause unspecified impact.
-
-Reviewed-by: Paul B Mahol <onemda@gmail.com>
-Signed-off-by: James Almer <jamrial@gmail.com>
----
- libavcodec/dnxhddec.c | 22 +++++++++++++++-------
- 1 file changed, 15 insertions(+), 7 deletions(-)
-
-diff --git a/libavcodec/dnxhddec.c b/libavcodec/dnxhddec.c
-index c78d55aee5..9b475a6979 100644
---- a/libavcodec/dnxhddec.c
-+++ b/libavcodec/dnxhddec.c
-@@ -112,6 +112,7 @@ static av_cold int dnxhd_decode_init(AVCodecContext *avctx)
- 
- static int dnxhd_init_vlc(DNXHDContext *ctx, uint32_t cid, int bitdepth)
- {
-+    int ret;
-     if (cid != ctx->cid) {
-         const CIDEntry *cid_table = ff_dnxhd_get_cid_table(cid);
- 
-@@ -132,19 +133,26 @@ static int dnxhd_init_vlc(DNXHDContext *ctx, uint32_t cid, int bitdepth)
-         ff_free_vlc(&ctx->dc_vlc);
-         ff_free_vlc(&ctx->run_vlc);
- 
--        init_vlc(&ctx->ac_vlc, DNXHD_VLC_BITS, 257,
-+        if ((ret = init_vlc(&ctx->ac_vlc, DNXHD_VLC_BITS, 257,
-                  ctx->cid_table->ac_bits, 1, 1,
--                 ctx->cid_table->ac_codes, 2, 2, 0);
--        init_vlc(&ctx->dc_vlc, DNXHD_DC_VLC_BITS, bitdepth > 8 ? 14 : 12,
-+                 ctx->cid_table->ac_codes, 2, 2, 0)) < 0)
-+            goto out;
-+        if ((ret = init_vlc(&ctx->dc_vlc, DNXHD_DC_VLC_BITS, bitdepth > 8 ? 14 : 12,
-                  ctx->cid_table->dc_bits, 1, 1,
--                 ctx->cid_table->dc_codes, 1, 1, 0);
--        init_vlc(&ctx->run_vlc, DNXHD_VLC_BITS, 62,
-+                 ctx->cid_table->dc_codes, 1, 1, 0)) < 0)
-+            goto out;
-+        if ((ret = init_vlc(&ctx->run_vlc, DNXHD_VLC_BITS, 62,
-                  ctx->cid_table->run_bits, 1, 1,
--                 ctx->cid_table->run_codes, 2, 2, 0);
-+                 ctx->cid_table->run_codes, 2, 2, 0)) < 0)
-+            goto out;
- 
-         ctx->cid = cid;
-     }
--    return 0;
-+    ret = 0;
-+out:
-+    if (ret < 0)
-+        av_log(ctx->avctx, AV_LOG_ERROR, "init_vlc failed\n");
-+    return ret;
- }
- 
- static int dnxhd_get_profile(int cid)
--- 
-2.31.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch
deleted file mode 100644
index d82f3a4b63..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-CVE: CVE-2021-38171
-Upstream-Status: Backport
-Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
-
-From fb993619d1035fa9646506925ea70fb122038999 Mon Sep 17 00:00:00 2001
-From: maryam ebrahimzadeh <me22bee@outlook.com>
-Date: Wed, 4 Aug 2021 16:15:18 -0400
-Subject: [PATCH] avformat/adtsenc: return value check for init_get_bits in
- adts_decode_extradata
-
-As the second argument for init_get_bits (buf) can be crafted, a return value check for this function call is necessary.
-'buf' is  part of  'AVPacket pkt'.
-replace init_get_bits with init_get_bits8.
-
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-(cherry picked from commit 9ffa49496d1aae4cbbb387aac28a9e061a6ab0a6)
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
----
- libavformat/adtsenc.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/libavformat/adtsenc.c b/libavformat/adtsenc.c
-index 3595cb3bb2..c35a12a628 100644
---- a/libavformat/adtsenc.c
-+++ b/libavformat/adtsenc.c
-@@ -51,9 +51,11 @@ static int adts_decode_extradata(AVFormatContext *s, ADTSContext *adts, const ui
-     GetBitContext gb;
-     PutBitContext pb;
-     MPEG4AudioConfig m4ac;
--    int off;
-+    int off, ret;
- 
--    init_get_bits(&gb, buf, size * 8);
-+    ret = init_get_bits8(&gb, buf, size);
-+    if (ret < 0)
-+        return ret;
-     off = avpriv_mpeg4audio_get_config2(&m4ac, buf, size, 1, s);
-     if (off < 0)
-         return off;
--- 
-2.31.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
similarity index 94%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
index c0318ef01d..685214a751 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
@@ -25,16 +25,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
-           file://fix-CVE-2020-20446.patch \
-           file://fix-CVE-2020-20453.patch \
-           file://fix-CVE-2020-22015.patch \
-           file://fix-CVE-2020-22021.patch \
-           file://fix-CVE-2020-22033-CVE-2020-22019.patch \
-           file://fix-CVE-2021-33815.patch \
-           file://fix-CVE-2021-38171.patch \
-	   file://fix-CVE-2021-38114.patch \ 
-          "
-SRC_URI[sha256sum] = "06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909"
+           "
+SRC_URI[sha256sum] = "eadbad9e9ab30b25f5520fbfde99fae4a92a1ae3c0257a8d68569a4651e30e02"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.20.1

