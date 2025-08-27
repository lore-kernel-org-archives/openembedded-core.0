Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CBDCA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:29:59 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.6592.1756330196681439893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WXwxtB+E;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3256986ca60so329342a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330196; x=1756934996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GPhHYSk804inPQj14PxLXhTaFKRcNoL+Wp55BzPH5E=;
        b=WXwxtB+EAjAwuANrxiOt97DLyeIQutLGWDTs0JL6X1MuH2SmNa3tG/Iznxygwu19Gy
         j7hnLIngHfY4D6NuYXleG91RrXWDdhSXsJRH0iz4QCdbfrr4M1sW6KwJwojZNstjDYBh
         p2812p9eQYH9B9JB+umUd3WNMBYfPni0XVufYaFjW+kKzKSQxpdrs7zS528r7cCxWeCk
         neMwSbfTMqklANFPIOI5WGuGdvHKjpeREZ6tHOtX/9iYV+S16WR1jhFsFFDoc6TKeFRL
         CD3fYHEoJh8OMXvAa9P+TEGlPZsIUpgClv58gwH3i7oVUJT3QnkISgp5ceCeDwb0kA2q
         s4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330196; x=1756934996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GPhHYSk804inPQj14PxLXhTaFKRcNoL+Wp55BzPH5E=;
        b=awHfaJkdwCTeM+iI9+zWpGkjRsmMKGSOSyQDkft4/NLXD7wqThts9mpQAlncYGy/Wc
         P30BnwFpLGaLLsWOuSB9rmTqALHkpNH94ntWY4tPSHZl8HlPJBY7v/UJsKNAmh9huj5K
         nIegJNuztG3Uh39KG8OsS8kieZCYV6IFFRBuLyy4uf9InY914GT0fHrAn33nNEvBtrud
         eEqKHSvekeyyIYib38uNHhMyQ4DREajqD6726dCq67iOlDOw9SlZE8AUasuesobEEOSU
         LTmLn02wiSG/I6p5gAZ89lB3FCnwxdqbEAj+zyGLOIIQ9YDo2Vn3QXgOn3CZXj1EG2iJ
         W0LQ==
X-Gm-Message-State: AOJu0Yw5Le6gdG4Y/prIsG2Orc6P+sPjYKOeQoaiplK+vMkhQLjeCDV5
	JuUfFrtSFgYsFNG6RlD5mhS/eWCnal8O9hI6kpAQUf2EyAghZMyWWM18N2ddppVdbfX2gumdfh9
	k1/AP
X-Gm-Gg: ASbGncsa00sgEW1S9WGDr9ei+sae8EqlsxY24TVba+micMEQ8PSL4t/2AFm60LkfMMd
	lglNM7hvne8zB+zdwtS2Xf1DKhyPLXA9yx0HURDnKpRs+uCFJIuTjtUG6QbVdIEKiGPgpTJ7q8x
	pGnwoNsEsyadd88PgKOFcL6jSQO586aEMbe0tUKyGYFNeOoUowWYVdDMlOX6qQol4YfnmNL0dW6
	xFRcx3lUF9HBW59PCLyzV/GxtLefV59UKFCzrOYTTwfCik7JtRU2OBTK8wPj4osq0qlngwTaEU3
	z08WSwvxcuG2GlaSKIJjVkIKa0U1PgEP+EGHzOHMp3u/8y/GGe9JriJjTjL3B2V6yPcRZkV1l6/
	HUl4Yh1EwuyBlZA==
X-Google-Smtp-Source: AGHT+IHej/IwPwLBv6HcWDnugvnR45628TUToAq35YlB/u95Hc+m5M+WkAvfHUgzyzS/IiJYx/Ep0A==
X-Received: by 2002:a17:90b:4c81:b0:31f:210d:2e56 with SMTP id 98e67ed59e1d1-32515ec8d19mr23490025a91.28.1756330195901;
        Wed, 27 Aug 2025 14:29:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.29.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:29:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/33] ffmpeg: fix CVE-2025-1594
Date: Wed, 27 Aug 2025 14:29:11 -0700
Message-ID: <c9a15206bae7f1e85dc3b8812eabb936a7e6d383.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222512

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability, which was classified as critical, was found in FFmpeg up to 7.1.
This affects the function ff_aac_search_for_tns of the file libavcodec/aacenc_tns.c
of the component AAC Encoder. The manipulation leads to stack-based buffer overflow.
It is possible to initiate the attack remotely. The exploit has been disclosed to the
public and may be used.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-1594.patch         | 105 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
new file mode 100644
index 0000000000..af71055c02
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
@@ -0,0 +1,105 @@
+From bedfb6eca402037f5cbb115fa767d106b8c14f1c Mon Sep 17 00:00:00 2001
+From: Lynne <dev@lynne.ee>
+Date: Sat, 8 Feb 2025 04:35:31 +0100
+Subject: [PATCH] aacenc_tns: clamp filter direction energy measurement
+
+The issue is that:
+
+float en[2];
+...
+tns->n_filt[w] = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
+for (g = 0; g < tns->n_filt[w]; g++) {
+    tns->direction[w][g] = slant != 2 ? slant : en[g] < en[!g];
+
+When using the AAC Main profile, n_filt = 3, and slant is by
+default 2 (normal long frames), g can go above 1.
+
+en is the evolution of energy in the frequency domain for every
+band at the given window. E.g. whether the energy is concentrated
+at the top of each band, or the bottom.
+
+For 2-pole filters, its straightforward.
+For 3-pole filters, we need more than 2 measurements.
+
+This commit properly implements support for 3-pole filters, by measuring
+the band energy across three areas.
+
+Do note that even xHE-AAC caps n_filt to 2, and only AAC Main allows
+n_filt == 3.
+
+Fixes https://trac.ffmpeg.org/ticket/11418
+
+CVE: CVE-2025-1594
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/bedfb6eca402037f5cbb115fa767d106b8c14f1c]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/aacenc_tns.c | 33 ++++++++++++++++++++++++---------
+ 1 file changed, 24 insertions(+), 9 deletions(-)
+
+diff --git a/libavcodec/aacenc_tns.c b/libavcodec/aacenc_tns.c
+index 8dc6dfc..9ea3506 100644
+--- a/libavcodec/aacenc_tns.c
++++ b/libavcodec/aacenc_tns.c
+@@ -172,6 +172,7 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
+                       sce->ics.window_sequence[0] == LONG_START_SEQUENCE ? 0 : 2;
+     const int sfb_len = sfb_end - sfb_start;
+     const int coef_len = sce->ics.swb_offset[sfb_end] - sce->ics.swb_offset[sfb_start];
++    const int n_filt = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
+ 
+     if (coef_len <= 0 || sfb_len <= 0) {
+         sce->tns.present = 0;
+@@ -179,16 +180,30 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
+     }
+ 
+     for (w = 0; w < sce->ics.num_windows; w++) {
+-        float en[2] = {0.0f, 0.0f};
++	float en[4] = {0.0f, 0.0f, 0.0f, 0.0f};
+         int oc_start = 0, os_start = 0;
+         int coef_start = sce->ics.swb_offset[sfb_start];
+ 
+-        for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
+-            FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
+-            if (g > sfb_start + (sfb_len/2))
+-                en[1] += band->energy;
+-            else
+-                en[0] += band->energy;
++	if (n_filt == 2) {
++            for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
++                FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
++                    if (g > sfb_start + (sfb_len/2))
++                        en[1] += band->energy; /* End */
++                    else
++                        en[0] += band->energy; /* Start */
++            }
++            en[2] = en[0];
++        } else {
++            for (g = sfb_start; g < sce->ics.num_swb && g <= sfb_end; g++) {
++                FFPsyBand *band = &s->psy.ch[s->cur_channel].psy_bands[w*16+g];
++                    if (g > sfb_start + (sfb_len/2) + (sfb_len/4))
++                        en[2] += band->energy; /* End */
++                    else if (g > sfb_start + (sfb_len/2) - (sfb_len/4))
++                        en[1] += band->energy; /* Middle */
++                    else
++                        en[0] += band->energy; /* Start */
++            }
++            en[3] = en[0];
+         }
+ 
+         /* LPC */
+@@ -198,9 +213,9 @@ void ff_aac_search_for_tns(AACEncContext *s, SingleChannelElement *sce)
+         if (!order || !isfinite(gain) || gain < TNS_GAIN_THRESHOLD_LOW || gain > TNS_GAIN_THRESHOLD_HIGH)
+             continue;
+ 
+-        tns->n_filt[w] = is8 ? 1 : order != TNS_MAX_ORDER ? 2 : 3;
++	tns->n_filt[w] = n_filt;
+         for (g = 0; g < tns->n_filt[w]; g++) {
+-            tns->direction[w][g] = slant != 2 ? slant : en[g] < en[!g];
++	    tns->direction[w][g] = slant != 2 ? slant : en[g] < en[g + 1];
+             tns->order[w][g] = g < tns->n_filt[w] ? order/tns->n_filt[w] : order - oc_start;
+             tns->length[w][g] = g < tns->n_filt[w] ? sfb_len/tns->n_filt[w] : sfb_len - os_start;
+             quantize_coefs(&coefs[oc_start], tns->coef_idx[w][g], tns->coef[w][g],
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
index c0112757f0..dbd0a3f270 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
     file://CVE-2025-22921.patch \
+    file://CVE-2025-1594.patch \
 "
 
 SRC_URI[sha256sum] = "bc5f1e4a4d283a6492354684ee1124129c52293bcfc6a9169193539fbece3487"
-- 
2.43.0


