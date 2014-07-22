Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 355467021B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 06:16:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M6GJTA024397
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 23:16:19 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 21 Jul 2014 23:16:19 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 14:16:05 +0800
Message-ID: <cce26c9da37b1c1bf1bed9e665ae1b6a1a7b661a.1406006666.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406006666.git.rongqing.li@windriver.com>
References: <cover.1406006666.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3934
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
X-List-Received-Date: Tue, 22 Jul 2014 06:16:20 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Double free vulnerability in the vp3_update_thread_context function in
libavcodec/vp3.c in FFmpeg before 0.10 allows remote attackers to have
an unspecified impact via crafted vp3 data.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3934

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...-vp3-Copy-all-3-frames-for-thread-updates.patch |   32 ++++
 ...-read-for-negative-tokens-and-memleaks-on.patch |  183 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    2 +
 3 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-Copy-all-3-frames-for-thread-updates.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-Copy-all-3-frames-for-thread-updates.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-Copy-all-3-frames-for-thread-updates.patch
new file mode 100644
index 0000000..b8f1bc1
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-Copy-all-3-frames-for-thread-updates.patch
@@ -0,0 +1,32 @@
+gst-ffmpeg: vp3: Copy all 3 frames for thread updates.
+
+This fixes a double release of the current frame on deinit.
+Fixes CVE-2011-3934
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+
+Upstream-Status: Pending
+
+Signed-off-by: Yue.Tao <yue.tao@windriver.com>
+
+---
+ libavcodec/vp3.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c
+index 738ae9f..b5daafc 100644
+--- a/gst-libs/ext/libav/libavcodec/vp3.c
++++ b/gst-libs/ext/libav/libavcodec/vp3.c
+@@ -1859,7 +1859,7 @@ static int vp3_update_thread_context(AVCodecContext *dst, const AVCodecContext *
+         ||s->width != s1->width
+         ||s->height!= s1->height) {
+         if (s != s1)
+-            copy_fields(s, s1, golden_frame, current_frame);
++            copy_fields(s, s1, golden_frame, keyframe);
+         return -1;
+     }
+ 
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch
new file mode 100644
index 0000000..29f3994
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch
@@ -0,0 +1,183 @@
+gst-ffmpeg: vp3: fix oob read for negative tokens and memleaks on error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yue.Tao <yue.tao@windriver.com>
+
+---
+ libavcodec/vp3.c |   59 +++++++++++++++++++++++++++++++++++++++++------------
+ 1 files changed, 45 insertions(+), 14 deletions(-)
+
+diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c
+index 36715bb..ce14e63 100644
+--- a/gst-libs/ext/libav/libavcodec/vp3.c
++++ b/gst-libs/ext/libav/libavcodec/vp3.c
+@@ -45,6 +45,7 @@
+ #define FRAGMENT_PIXELS 8
+ 
+ static av_cold int vp3_decode_end(AVCodecContext *avctx);
++static void vp3_decode_flush(AVCodecContext *avctx);
+ 
+ //FIXME split things out into their own arrays
+ typedef struct Vp3Fragment {
+@@ -890,7 +891,7 @@ static int unpack_vlcs(Vp3DecodeContext *s, GetBitContext *gb,
+             /* decode a VLC into a token */
+             token = get_vlc2(gb, vlc_table, 11, 3);
+             /* use the token to get a zero run, a coefficient, and an eob run */
+-            if (token <= 6) {
++            if ((unsigned) token <= 6U) {
+                 eob_run = eob_run_base[token];
+                 if (eob_run_get_bits[token])
+                     eob_run += get_bits(gb, eob_run_get_bits[token]);
+@@ -908,7 +909,7 @@ static int unpack_vlcs(Vp3DecodeContext *s, GetBitContext *gb,
+                     coeff_i        += eob_run;
+                     eob_run = 0;
+                 }
+-            } else {
++            } else if (token >= 0) {
+                 bits_to_get = coeff_get_bits[token];
+                 if (bits_to_get)
+                     bits_to_get = get_bits(gb, bits_to_get);
+@@ -942,6 +943,10 @@ static int unpack_vlcs(Vp3DecodeContext *s, GetBitContext *gb,
+                 for (i = coeff_index+1; i <= coeff_index+zero_run; i++)
+                     s->num_coded_frags[plane][i]--;
+                 coeff_i++;
++            } else {
++                av_log(s->avctx, AV_LOG_ERROR,
++                       "Invalid token %d\n", token);
++                return -1;
+             }
+     }
+ 
+@@ -991,6 +996,8 @@ static int unpack_dct_coeffs(Vp3DecodeContext *s, GetBitContext *gb)
+     /* unpack the Y plane DC coefficients */
+     residual_eob_run = unpack_vlcs(s, gb, &s->dc_vlc[dc_y_table], 0,
+         0, residual_eob_run);
++    if (residual_eob_run < 0)
++        return residual_eob_run;
+ 
+     /* reverse prediction of the Y-plane DC coefficients */
+     reverse_dc_prediction(s, 0, s->fragment_width[0], s->fragment_height[0]);
+@@ -998,8 +1005,12 @@ static int unpack_dct_coeffs(Vp3DecodeContext *s, GetBitContext *gb)
+     /* unpack the C plane DC coefficients */
+     residual_eob_run = unpack_vlcs(s, gb, &s->dc_vlc[dc_c_table], 0,
+         1, residual_eob_run);
++    if (residual_eob_run < 0)
++        return residual_eob_run;
+     residual_eob_run = unpack_vlcs(s, gb, &s->dc_vlc[dc_c_table], 0,
+         2, residual_eob_run);
++    if (residual_eob_run < 0)
++        return residual_eob_run;
+ 
+     /* reverse prediction of the C-plane DC coefficients */
+     if (!(s->avctx->flags & CODEC_FLAG_GRAY))
+@@ -1036,11 +1047,17 @@ static int unpack_dct_coeffs(Vp3DecodeContext *s, GetBitContext *gb)
+     for (i = 1; i <= 63; i++) {
+             residual_eob_run = unpack_vlcs(s, gb, y_tables[i], i,
+                 0, residual_eob_run);
++            if (residual_eob_run < 0)
++                return residual_eob_run;
+ 
+             residual_eob_run = unpack_vlcs(s, gb, c_tables[i], i,
+                 1, residual_eob_run);
++            if (residual_eob_run < 0)
++                return residual_eob_run;
+             residual_eob_run = unpack_vlcs(s, gb, c_tables[i], i,
+                 2, residual_eob_run);
++            if (residual_eob_run < 0)
++                return residual_eob_run;
+     }
+ 
+     return 0;
+@@ -1777,10 +1794,15 @@ static int vp3_update_thread_context(AVCodecContext *dst, const AVCodecContext *
+     Vp3DecodeContext *s = dst->priv_data, *s1 = src->priv_data;
+     int qps_changed = 0, i, err;
+ 
++#define copy_fields(to, from, start_field, end_field) memcpy(&to->start_field, &from->start_field, (char*)&to->end_field - (char*)&to->start_field)
++
+     if (!s1->current_frame.data[0]
+         ||s->width != s1->width
+-        ||s->height!= s1->height)
++        ||s->height!= s1->height) {
++        if (s != s1)
++            copy_fields(s, s1, golden_frame, current_frame);
+         return -1;
++    }
+ 
+     if (s != s1) {
+         // init tables if the first frame hasn't been decoded
+@@ -1796,8 +1818,6 @@ static int vp3_update_thread_context(AVCodecContext *dst, const AVCodecContext *
+             memcpy(s->motion_val[1], s1->motion_val[1], c_fragment_count * sizeof(*s->motion_val[1]));
+         }
+ 
+-#define copy_fields(to, from, start_field, end_field) memcpy(&to->start_field, &from->start_field, (char*)&to->end_field - (char*)&to->start_field)
+-
+         // copy previous frame data
+         copy_fields(s, s1, golden_frame, dsp);
+ 
+@@ -1987,9 +2007,6 @@ static av_cold int vp3_decode_end(AVCodecContext *avctx)
+     Vp3DecodeContext *s = avctx->priv_data;
+     int i;
+ 
+-    if (avctx->is_copy && !s->current_frame.data[0])
+-        return 0;
+-
+     av_free(s->superblock_coding);
+     av_free(s->all_fragments);
+     av_free(s->coded_fragment_list[0]);
+@@ -2016,12 +2033,7 @@ static av_cold int vp3_decode_end(AVCodecContext *avctx)
+     free_vlc(&s->motion_vector_vlc);
+ 
+     /* release all frames */
+-    if (s->golden_frame.data[0])
+-        ff_thread_release_buffer(avctx, &s->golden_frame);
+-    if (s->last_frame.data[0] && s->last_frame.type != FF_BUFFER_TYPE_COPY)
+-        ff_thread_release_buffer(avctx, &s->last_frame);
+-    /* no need to release the current_frame since it will always be pointing
+-     * to the same frame as either the golden or last frame */
++    vp3_decode_flush(avctx);
+ 
+     return 0;
+ }
+@@ -2341,6 +2353,23 @@ static void vp3_decode_flush(AVCodecContext *avctx)
+         ff_thread_release_buffer(avctx, &s->current_frame);
+ }
+ 
++static int vp3_init_thread_copy(AVCodecContext *avctx)
++{
++    Vp3DecodeContext *s = avctx->priv_data;
++
++    s->superblock_coding      = NULL;
++    s->all_fragments          = NULL;
++    s->coded_fragment_list[0] = NULL;
++    s->dct_tokens_base        = NULL;
++    s->superblock_fragments   = NULL;
++    s->macroblock_coding      = NULL;
++    s->motion_val[0]          = NULL;
++    s->motion_val[1]          = NULL;
++    s->edge_emu_buffer        = NULL;
++
++    return 0;
++}
++
+ AVCodec ff_theora_decoder = {
+     .name           = "theora",
+     .type           = AVMEDIA_TYPE_VIDEO,
+@@ -2352,6 +2381,7 @@ AVCodec ff_theora_decoder = {
+     .capabilities   = CODEC_CAP_DR1 | CODEC_CAP_DRAW_HORIZ_BAND | CODEC_CAP_FRAME_THREADS,
+     .flush = vp3_decode_flush,
+     .long_name = NULL_IF_CONFIG_SMALL("Theora"),
++    .init_thread_copy      = ONLY_IF_THREADS_ENABLED(vp3_init_thread_copy),
+     .update_thread_context = ONLY_IF_THREADS_ENABLED(vp3_update_thread_context)
+ };
+ #endif
+@@ -2367,5 +2397,6 @@ AVCodec ff_vp3_decoder = {
+     .capabilities   = CODEC_CAP_DR1 | CODEC_CAP_DRAW_HORIZ_BAND | CODEC_CAP_FRAME_THREADS,
+     .flush = vp3_decode_flush,
+     .long_name = NULL_IF_CONFIG_SMALL("On2 VP3"),
++    .init_thread_copy      = ONLY_IF_THREADS_ENABLED(vp3_init_thread_copy),
+     .update_thread_context = ONLY_IF_THREADS_ENABLED(vp3_update_thread_context)
+ };
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 98d12ea..c014fc2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -39,6 +39,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-aacdec-check-channel-count.patch \
            file://0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch \
            file://0001-error_concealment-Check-that-the-picture-is-not-in-a.patch \
+           file://0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch \
+           file://0001-vp3-Copy-all-3-frames-for-thread-updates.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


