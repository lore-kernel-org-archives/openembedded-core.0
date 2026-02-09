Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8691E78D74
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:36 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44206.1770629374444558371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2OO2AnrV;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806bf39419so32109305e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629372; x=1771234172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1XlL+e33BYB1zaaSHh1xUBcHYopPJfWBCRJ9+pZksU=;
        b=2OO2AnrVAWHicPWrlvRY/VUyuKfSxizcfVh6sXcLSw/46dN5wFm6o8V/dgMkdIzFQi
         xBH0Y4Fz8Ucs/iiU89BQNlFNZ0wqsIJjFD6AGTkAm5DXoddP+JbO0HVrRT3grRJPNQ3U
         bMdm9VUAO01Wbp6izZ4p4TSOwg68epVKr/69A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629373; x=1771234173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m1XlL+e33BYB1zaaSHh1xUBcHYopPJfWBCRJ9+pZksU=;
        b=Q4HGVJGE859/VR92hi+qiyllfc2bImZ/DNexr717Xu7phQF8o8plnufNA6OFgWAqfU
         gPaw35wyZZoSJF701Axn1SGrEw0W7v9765szy9UQxGPkCYfRXY65I51ctzuZPNUSW84K
         vmVb245JzPVOD21Rf/GSELHVLlSvlvLhLe8/HR5wCYC8zY7mKJaGieM6DRpd6UuhA/pb
         fpyTc5TB8UrNPvSq8CA7tvf9HaFIHL4UT/j5kHQmltIZV+M9Lt0Urs4PxShKr1wLXPBy
         neInTUoE0+kvSurfdJn/z7ZgPhwpJvKHCJSLFbJYUsKvAnAr4JXq1pAHltIvZsiFPt3j
         XT2Q==
X-Gm-Message-State: AOJu0YwXwCNtthCr98aDwvSlIUEaE6Y4/jf5ygJNoqP5DfwfVfqy9KQB
	M/9CFvMGFwLW3rMInQy8s9Lqpn1r+qxVdQrh9jWQw4BW632pHRB4kGEL+zkiPK5BFILct+ZleE9
	nQe9ZAPI=
X-Gm-Gg: AZuq6aIdwRbxEH2k2GYbN9vuSue7X2FyboZRnpmMHBjj0+Rx5LlEGindjVVngHNO1qm
	NM9ucknYDruVDkrYMoYHTSC9ZK0dnQId3ujRKhK4disfOq0SC9FwysF7GlHWVuSEG39IT61l+E6
	IezjCu+9Ghg7ymLbQvulK2RgHIHIjMoEbzE4VnizpVhMrVCFj9k3jhFQaS+TThNoWVzeqlGLao7
	AqprMU2v0zySsn09mPsy4qsBHU3l4BuHFqvWDk8GBfie7Y986rl4dNj36NyGG9j2OUtVSPqsdvv
	MFQrsOBru+ZfJpYE8Krm36WL/A6FLRUQzpg76nGU1I9AhKia4TJK590aqwpLuj291FGPDe9Yk2+
	8b/vshLVUYdB18xl06+k53nwvswruohVj4IJutMyV6m/66MOprQ9Qbaen4WInTnqbB6q2IVUDlj
	M2YR/gtqxuN5FzABvegYtKAHEA1GIIzFB+br1MrYUTFZhcud5tuyNs2EyXtSVHO4eotlmcEcRaW
	xB3vbDtaCqXw5w=
X-Received: by 2002:a05:600c:8505:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-483203d5affmr154835785e9.14.1770629372400;
        Mon, 09 Feb 2026 01:29:32 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/25] ffmpeg: upgrade 6.1.3 -> 6.1.4
Date: Mon,  9 Feb 2026 10:29:00 +0100
Message-ID: <ad383df94f1aec091af8f6c969d54c354f2c5a32.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230768

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches that are part of the upstream version.

Changelog:
https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/34277e12e80031c7f89494ba543684bc1dd0be8f:/Changelog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2024-35365.patch        |  62 -----------
 .../ffmpeg/ffmpeg/CVE-2024-36618.patch        |  36 ------
 .../ffmpeg/ffmpeg/CVE-2025-1594.patch         | 105 ------------------
 .../{ffmpeg_6.1.3.bb => ffmpeg_6.1.4.bb}      |   5 +-
 4 files changed, 1 insertion(+), 207 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.3.bb => ffmpeg_6.1.4.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
deleted file mode 100644
index 2b5646e07ca..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From ced5c5fdb8634d39ca9472a2026b2d2fea16c4e5 Mon Sep 17 00:00:00 2001
-From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-Date: Mon, 25 Mar 2024 16:54:25 +0100
-Subject: [PATCH] fftools/ffmpeg_mux_init: Fix double-free on error
-
-MATCH_PER_STREAM_OPT iterates over all options of a given
-OptionDef and tests whether they apply to the current stream;
-if so, they are set to ost->apad, otherwise, the code errors
-out. If no error happens, ost->apad is av_strdup'ed in order
-to take ownership of this pointer.
-
-But this means that setting it originally was premature,
-as it leads to double-frees when an error happens lateron.
-This can simply be reproduced with
-ffmpeg -filter_complex anullsrc  -apad bar -apad:n baz -f null -
-This is a regression since 83ace80bfd80fcdba2c65fa1d554923ea931d5bd.
-
-Fix this by using a temporary variable instead of directly
-setting ost->apad. Also only strdup the string if it actually
-is != NULL.
-
-Reviewed-by: Marth64 <marth64@proxyid.net>
-Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-
-CVE: CVE-2024-35365
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/ced5c5fdb8634d39ca9472a2026b2d2fea16c4e5]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- fftools/ffmpeg_mux_init.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/fftools/ffmpeg_mux_init.c b/fftools/ffmpeg_mux_init.c
-index 63a25a3..685c064 100644
---- a/fftools/ffmpeg_mux_init.c
-+++ b/fftools/ffmpeg_mux_init.c
-@@ -845,6 +845,7 @@ static int new_stream_audio(Muxer *mux, const OptionsContext *o,
-         int channels = 0;
-         char *layout = NULL;
-         char *sample_fmt = NULL;
-+        const char *apad = NULL;
-
-         MATCH_PER_STREAM_OPT(audio_channels, i, channels, oc, st);
-         if (channels) {
-@@ -882,8 +883,12 @@ static int new_stream_audio(Muxer *mux, const OptionsContext *o,
-
-         MATCH_PER_STREAM_OPT(audio_sample_rate, i, audio_enc->sample_rate, oc, st);
-
--        MATCH_PER_STREAM_OPT(apad, str, ost->apad, oc, st);
--        ost->apad = av_strdup(ost->apad);
-+        MATCH_PER_STREAM_OPT(apad, str, apad, oc, st);
-+        if (apad) {
-+            ost->apad = av_strdup(apad);
-+            if (!ost->apad)
-+                return AVERROR(ENOMEM);
-+        }
-
- #if FFMPEG_OPT_MAP_CHANNEL
-         /* check for channel mapping for this audio stream */
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
deleted file mode 100644
index 5caca2da7c6..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 7a089ed8e049e3bfcb22de1250b86f2106060857 Mon Sep 17 00:00:00 2001
-From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-Date: Tue, 12 Mar 2024 23:23:17 +0100
-Subject: [PATCH] avformat/avidec: Fix integer overflow iff ULONG_MAX <
- INT64_MAX
-
-Affects many FATE-tests, see
-https://fate.ffmpeg.org/report.cgi?time=20240312011016&slot=ppc-linux-gcc-13.2-ubsan-altivec-qemu
-
-Reviewed-by: James Almer <jamrial@gmail.com>
-Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-
-CVE: CVE-2024-36618
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/7a089ed8e049e3bfcb22de1250b86f2106060857]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavformat/avidec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/avidec.c b/libavformat/avidec.c
-index 00bd7a9..bc95466 100644
---- a/libavformat/avidec.c
-+++ b/libavformat/avidec.c
-@@ -1696,7 +1696,7 @@ static int check_stream_max_drift(AVFormatContext *s)
-     int *idx = av_calloc(s->nb_streams, sizeof(*idx));
-     if (!idx)
-         return AVERROR(ENOMEM);
--    for (min_pos = pos = 0; min_pos != INT64_MAX; pos = min_pos + 1LU) {
-+    for (min_pos = pos = 0; min_pos != INT64_MAX; pos = min_pos + 1ULL) {
-         int64_t max_dts = INT64_MIN / 2;
-         int64_t min_dts = INT64_MAX / 2;
-         int64_t max_buffer = 0;
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
deleted file mode 100644
index af71055c02b..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From bedfb6eca402037f5cbb115fa767d106b8c14f1c Mon Sep 17 00:00:00 2001
-From: Lynne <dev@lynne.ee>
-Date: Sat, 8 Feb 2025 04:35:31 +0100
-Subject: [PATCH] aacenc_tns: clamp filter direction energy measurement
-
-The issue is that:
-
-float en[2];
-...
-tns->n_filt[w] = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
-for (g = 0; g < tns->n_filt[w]; g++) {
-    tns->direction[w][g] = slant != 2 ? slant : en[g] < en[!g];
-
-When using the AAC Main profile, n_filt = 3, and slant is by
-default 2 (normal long frames), g can go above 1.
-
-en is the evolution of energy in the frequency domain for every
-band at the given window. E.g. whether the energy is concentrated
-at the top of each band, or the bottom.
-
-For 2-pole filters, its straightforward.
-For 3-pole filters, we need more than 2 measurements.
-
-This commit properly implements support for 3-pole filters, by measuring
-the band energy across three areas.
-
-Do note that even xHE-AAC caps n_filt to 2, and only AAC Main allows
-n_filt == 3.
-
-Fixes https://trac.ffmpeg.org/ticket/11418
-
-CVE: CVE-2025-1594
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/bedfb6eca402037f5cbb115fa767d106b8c14f1c]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/aacenc_tns.c | 33 ++++++++++++++++++++++++---------
- 1 file changed, 24 insertions(+), 9 deletions(-)
-
-diff --git a/libavcodec/aacenc_tns.c b/libavcodec/aacenc_tns.c
-index 8dc6dfc..9ea3506 100644
---- a/libavcodec/aacenc_tns.c
-+++ b/libavcodec/aacenc_tns.c
-@@ -172,6 +172,7 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
-                       sce->ics.window_sequence[0] == LONG_START_SEQUENCE ? 0 : 2;
-     const int sfb_len = sfb_end - sfb_start;
-     const int coef_len = sce->ics.swb_offset[sfb_end] - sce->ics.swb_offset[sfb_start];
-+    const int n_filt = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
- 
-     if (coef_len <= 0 || sfb_len <= 0) {
-         sce->tns.present = 0;
-@@ -179,16 +180,30 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
-     }
- 
-     for (w = 0; w < sce->ics.num_windows; w++) {
--        float en[2] = {0.0f, 0.0f};
-+	float en[4] = {0.0f, 0.0f, 0.0f, 0.0f};
-         int oc_start = 0, os_start = 0;
-         int coef_start = sce->ics.swb_offset[sfb_start];
- 
--        for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
--            FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
--            if (g > sfb_start + (sfb_len/2))
--                en[1] += band->energy;
--            else
--                en[0] += band->energy;
-+	if (n_filt == 2) {
-+            for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
-+                FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
-+                    if (g > sfb_start + (sfb_len/2))
-+                        en[1] += band->energy; /* End */
-+                    else
-+                        en[0] += band->energy; /* Start */
-+            }
-+            en[2] = en[0];
-+        } else {
-+            for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
-+                FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
-+                    if (g > sfb_start + (sfb_len/2) + (sfb_len/4))
-+                        en[2] += band->energy; /* End */
-+                    else if (g > sfb_start + (sfb_len/2) - (sfb_len/4))
-+                        en[1] += band->energy; /* Middle */
-+                    else
-+                        en[0] += band->energy; /* Start */
-+            }
-+            en[3] = en[0];
-         }
- 
-         /* LPC */
-@@ -198,9 +213,9 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
-         if (!order || !isfinite(gain) || gain < TNS_GAIN_THRESHOLD_LOW || gain > TNS_GAIN_THRESHOLD_HIGH)
-             continue;
- 
--        tns->n_filt[w] = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
-+	tns->n_filt[w] = n_filt;
-         for (g = 0; g < tns->n_filt[w]; g++) {
--            tns->direction[w][g] = slant != 2 ? slant : en[g] < en[!g];
-+	    tns->direction[w][g] = slant != 2 ? slant : en[g] < en[g + 1];
-             tns->order[w][g] = g < tns->n_filt[w] ? order/tns->n_filt[w] : order - oc_start;
-             tns->length[w][g] = g < tns->n_filt[w] ? sfb_len/tns->n_filt[w] : sfb_len - os_start;
-             quantize_coefs(&coefs[oc_start], tns->coef_idx[w][g], tns->coef[w][g],
--- 
-2.40.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 38c6d1f2b7d..8b0b7cfd6e9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -29,15 +29,12 @@ SRC_URI = " \
     file://vulkan_fix_gcc14.patch \
     file://CVE-2024-28661.patch \
     file://CVE-2023-49528.patch \
-    file://CVE-2024-35365.patch \
-    file://CVE-2024-36618.patch \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
     file://CVE-2025-22921.patch \
-    file://CVE-2025-1594.patch \
 "
 
-SRC_URI[sha256sum] = "bc5f1e4a4d283a6492354684ee1124129c52293bcfc6a9169193539fbece3487"
+SRC_URI[sha256sum] = "a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291

