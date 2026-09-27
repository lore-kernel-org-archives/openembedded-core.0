Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56A5CA5FB1
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:57 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32861.1790495036418867910
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qMHBFznn;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f2baso246991f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495035; x=1791099835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=irBSgGgri+SNGsEWYroJCrgTc014m8hzqrx0a/YQjMA=;
        b=qMHBFznnR/G/7Ahr9yjGDTaK6ODIlvnRNlFvAB+fKX68JqzKGSetpM84RFIE7eIQLM
         eHgFoHQJ2zvWoECwE5JKScW7ySEp0w2zaEk1X4Rkm1cIhkg+CjFEgoFiHfAL/syoTSM8
         Qnx69XRFV6wfbfyzJDtg1kR6E5gpH2SE/Qvho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495035; x=1791099835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=irBSgGgri+SNGsEWYroJCrgTc014m8hzqrx0a/YQjMA=;
        b=03qOrDJJ9UUbHdYlgZGcExol25hKBBQCev76wB/rfvG4kZo/aa2ZNzWykrReFPQIjj
         RmCDbPAjcx6ihxwnnPevTgZWoRkKX+vzTbnCHy6EqTb2IC/PqTdJRVkuVk1aU8tPaXy0
         A2Z+GQHZ81iSyU6OS1SU1pWmXu1CMsR9woUTuqlLymNpcGJUG5wuzlrBUozgXx0SnMnA
         gw8P1AL73ce8ZjgfkLWPDagXfllVgJzazybjC9+Zn5Y+bWs4A7htR/kqcFkmJbqG6C9z
         O96Mpl8ZnAcs/p8CSKaVhP2i7WMuWfm7kjICh/xBStKuX3bho022R8KrMkSrK9ykH1wD
         QZww==
X-Gm-Message-State: AFq9FYLL69TL5aRU23M254JV6zmEUMS3KgOaveu0a2TAHeYc88A/h4/p
	+am/h5BnfcCFWr/BfVkP4kMHzZcR563jxonvLCqqLMCxIQ7pFlW4SYjsojvpDLq/e4HpCkD0LFj
	1+LxkIPE=
X-Gm-Gg: AYBFou1ynrpLpOU9u+SimlgRXGYu130dHOEiXkgdVppD5qZNusco8UKSCMc5m9onkAv
	ouJvL38zmPeIgTRBnpXlJrOUYEOaq9d3fUoddyxUaeodOOMJgYTPf2FjX4laTBAnDvDh8koL6ZK
	ZWGuU/S0Nam3MfI4Ilr1MLrruCXPxoONAJmsbaNbWg8fiXj2lalcukLYnT2Gxkfs/GW4SrCkxsL
	Sol8B3e8e7fQoBh9EODy506eH2RO2oaYt4srA9bfXo0whUldwch330wSbulxMP2PeBcYjhLyNiw
	sijgWAM0yEaulCf1QZzrLmToRw6jVc4/N+UWhyHi7R2VcCtkn+R+lhd9BgAAAUlCJVnlA1EOIBD
	JF8Cw2nOQLrA+bdis4aDm2ejq+UdxLexpAYNJ4RLqrq6/JtFlKWeQOWSdUjuB+yX8LhExLWyHFQ
	awEv7la1cHi+gs23bSuDZAfRwl3KhVWezrbaXygcYlbXT+mHtN9gh+c2QvHL6qmWI4dDWWBh3J6
	6daam7H1odZivoen9li0oQ0+87d6pwJzd6wuO8Af1yPoVgb7elbaRQ2sPtPOeLMX7lQw8+yWf3W
	gyYoVYGq
X-Received: by 2002:a05:6000:290e:b0:487:27f9:837 with SMTP id ffacd0b85a97d-4887170f426mr18936334f8f.44.1790495034605;
        Sun, 27 Sep 2026 00:43:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/28] ffmpeg: Fix for CVE-2026-66039
Date: Sun, 27 Sep 2026 09:43:13 +0200
Message-ID: <eba86cae1179073e25d453de3fbbdbea22f2f3da.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246672

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/aafb5c655edc76a753275c383ebb139feb032718
[2] https://nvd.nist.gov/vuln/detail/cve-2026-66039

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-66039.patch        | 38 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66039.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66039.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66039.patch
new file mode 100644
index 00000000000..2e34923eda5
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66039.patch
@@ -0,0 +1,38 @@
+From b3562273e37397669fdb3f4ec933e2fa57e28dbd Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 29 Jun 2026 01:16:44 +0200
+Subject: [PATCH] avcodec/mace: reject sample counts that overflow int
+
+Fixes: heap buffer overflow
+Fixes: FmXBI2dbgvgD
+Fixes: 0eea212943544d40f99b05571aa7159d78667154 (Add avcodec_decode_audio4().)
+Found-by: Adrian Junge (vurlo)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-66039
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/aafb5c655edc76a753275c383ebb139feb032718]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/mace.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/mace.c b/libavcodec/mace.c
+index 2aa54fb548..716dd0c00a 100644
+--- a/libavcodec/mace.c
++++ b/libavcodec/mace.c
+@@ -252,7 +252,10 @@ static int mace_decode_frame(AVCodecContext *avctx, AVFrame *frame,
+     }
+ 
+     /* get output buffer */
+-    frame->nb_samples = 3 * (buf_size << (1 - is_mace3)) / channels;
++    int64_t nb_samples = 3 * ((int64_t)buf_size << (1 - is_mace3)) / channels;
++    if (nb_samples > INT_MAX)
++        return AVERROR_INVALIDDATA;
++    frame->nb_samples = nb_samples;
+     if ((ret = ff_get_buffer(avctx, frame, 0)) < 0)
+         return ret;
+     samples = (int16_t **)frame->extended_data;
+-- 
+2.53.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 57805f17095..06c6e402c97 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-65706.patch \
            file://CVE-2026-66037.patch \
            file://CVE-2026-66038.patch \
+           file://CVE-2026-66039.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

