Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA498CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 19:30:20 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.4459.1757446214909521937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 12:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GiYj0ZAA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b5229007f31so2197160a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 12:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757446214; x=1758051014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apm8suS0IiM2vWcve0tFaNPYoFzOsw8tyZ+P3ehYFz4=;
        b=GiYj0ZAAAJDsoouAH3hPgNZUR/yJVM1RKBZimxu+cphr0Q+giKLdX9jdMYr4nU8Rdl
         yA55hU6d1zTR0DnoD3nOeQZl6ZxsG6L4Z/WNoe8CQtDSldxpgNRymuY4D+dX5cPkREGL
         gFXKHuG9wpVmuanhCG71nwCOiP7xzg+Dn01f6VH1MHNkKnnvoDnOYcHE0k1ha4UwoHhk
         BjS7u/CnqFlIVZquk68ZcmFm3+O8vkm8EfbDvf+9oSmy4vPieURNXk8/neqyZpj/ssI/
         9da89J9xmraJO+GT5OZDOCOQXhehMCdAE5RQqokLJ3314CSVpIpX4lOCmVWyUg1jwrea
         rsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757446214; x=1758051014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apm8suS0IiM2vWcve0tFaNPYoFzOsw8tyZ+P3ehYFz4=;
        b=uX7DCTQLUC/vL8wxX6GCMPdXzEgPdNruD7wjBDH/wR03NxiBDp1ifAwdCW9xJtM4l8
         SkcfsHfrqWZt8zBuye0InvurU4jkm3b3RDkif1zX+4kwJV4zgaUXM1/YgWytgLgpzybM
         hcH7wwRgT1G8ywU1SPgLGYf8rzFNCpwZUGqh0fr5r2ecSUY9X5PJ6Wsa5BhG5VtX3VU9
         5cMTqreWJRqukwMut+xzfmiG/tjcKJnGyi673Ifrlk9tYu95RtieygOwQdKm6+b+BlJR
         9uvk0dzkW9H8DSYCNM9dGsWSTHooR48511aVpOrgXlDQuJg6exUzj3BpNqpcm+Za5laQ
         4pMw==
X-Gm-Message-State: AOJu0Yzc6ZUOZlmhaWF4RRXn8YpiFo+E9Bsn/eR9QJDycEC71pQOo6V1
	UxI339FkyAVOCDkgU1P1ll+bcSOpWlghoFmjhE/uyTVC01zq/df3wUcgOtxXsTovzt9FEk6K4T0
	qRpGM
X-Gm-Gg: ASbGncsSTXnDvnbhap9nH3vb3Xzw61ZqwgUyzNHJTx4/zufjaqHBxd9L1ZjNWS9YiXk
	X4nyXcpetCcY4CdSCej8Aqi+ePLadUyjwFf5NiVnzpVu1/TleQH1zynsM5MN8rzJuuAv8XotJnR
	LFKVHwPd77xi0xQ4QHjbeNoUEuWONHrJgjQIN71wJ03UAZxlYbI3tIZciXwthXSQdPZCzYr5M3f
	SbDeR6Ypvpq70Jz/+ecyTFc+GhoR4LjKmgbkVrPgfoCh8meGScdYCyvradc/x/8A2taGcZkpC4s
	F9IRGWvyEr9HtEOtiVk6/osmPC/bvcLRfBQTxirV58QWypHhGWy4X8aALfm3njtSmYpUsBFjV1Y
	QORwGhP8Nwn2brrQhs3paVzEx
X-Google-Smtp-Source: AGHT+IG+L15Niq9fWGs9wkyy/xeYVrwyXqdJX/tANOHjB9p9zhQUiCfInOp8sxQp91bbmSpwujOGnQ==
X-Received: by 2002:a17:903:2450:b0:246:a543:199 with SMTP id d9443c01a7336-25173301e63mr196716825ad.54.1757446213831;
        Tue, 09 Sep 2025 12:30:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c560:31a3:4ee8:6083])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2b0e5965sm5093855ad.143.2025.09.09.12.30.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:30:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/5] ffmpeg: fix CVE-2025-1594
Date: Tue,  9 Sep 2025 12:30:01 -0700
Message-ID: <5a922eb95da7d373ee2bc3018065448fa128e69a.1757446071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757446071.git.steve@sakoman.com>
References: <cover.1757446071.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 19:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223135

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability, which was classified as critical, was found in FFmpeg up to 7.1.
This affects the function ff_aac_search_for_tns of the file libavcodec/aacenc_tns.c
of the component AAC Encoder. The manipulation leads to stack-based buffer overflow.
It is possible to initiate the attack remotely. The exploit has been disclosed to
the public and may be used.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-1594.patch         | 104 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
new file mode 100644
index 0000000000..b8f0bc5781
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
@@ -0,0 +1,104 @@
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 27a9a80e8c..a46cb3480a 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch \
            file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch \
            file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch \
+           file://CVE-2025-1594.patch \
           "
 
 SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"
-- 
2.43.0


