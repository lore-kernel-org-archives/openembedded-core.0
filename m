Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937CBC982DB
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:39 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1713.1789682912391738162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=D1WGzo2U;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so22533f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682911; x=1790287711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rf1ALEyz0CZS7amM9t+zJ4Xbf3YTvYiYq4rMFw2CE7s=;
        b=D1WGzo2UrPrA/6TCKNDUZeBwKp0RCaBQfsmkViAd36W/9aJDjGspXkqmY1uFFHFur7
         OcdZ9+g7/SQUmLNZqAcYI29BmzrnLBKFyRBDiXHVX5ZUYLzMKkSsucoQlNyXLqlMEpMg
         I2KeJJgJv8OgjA3+63/qUEyGkq8hVlBvXG7QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682911; x=1790287711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rf1ALEyz0CZS7amM9t+zJ4Xbf3YTvYiYq4rMFw2CE7s=;
        b=0QSQ9Jy0t5YGPloYLPT82n4H0bGmnLl/FaryzY1vSX6ZqlcGZEX3St+rp06yWIGqY9
         sO08yIBuhMeEhk+MQw71wds0tAcegPQqDGQumuGX2tKFXlsXMUBOvHSvwKGYNysp9QBv
         5CDGEJM4SBZFcqWPGyYMMncbF8PfA5nGVtMzdQX6DQg5yXASXk+ARCg0GaPVMArCWyDD
         lplfTWezOgeMe+aPkI8RyN/3qLRj2sBQCTi1iLB5CNjh/yjYiJ+U090GWP201UoUHhog
         HHPUTJa2iJ8mKhEVjbmgVTYSzWU2X4M4DJ4SuCru7SEKRXVC1UFgDF8k9wpVhxL04Kit
         c4hA==
X-Gm-Message-State: AFuF++kKXFbkqO5S7Xeu6JP3w7jdiEcixZ/ZQZCLWbPHIEmMcdqkITuv
	4+YAKXJp+mviPLBk1no8v5Ovg2iU4ei5T/8ToBlzGdDqTvWp/cRdnqVGCNigEMubrCy0RN1HP35
	hUc2UtD8=
X-Gm-Gg: AYBFou2QwDRPdx3PQBjO0nvdzxho77YW9TFMFSPf5gbcseFbejmTQJGutR8K7raBkpX
	B4rEEQzBedGYoAi01lwSXgdq6fD3ewSpRKpX2GpkKhkmG7VFIEFIWp2dmTHz7tuDfoFuposFslC
	/ZrP6qg7DUR+z9DBH7gy8LxAZdPjLzz8pcKtbiDpTAXEzXQ0Hay8R5KIBj9eKsB6CIdgH4Jrci6
	buoDjHyY8IYSvrfGyCK4R/ha24MatTKckIqZbBSdHUjONuN2RHxQa1bRtbTjvI7xv7nOYS+JnsR
	6klud0M+ckV6PV87ky/MTH2earCtOfNpQD1G9n2BySoz6BnRYqxOo9dp+sF2/GWd82kZVdnVK/x
	vyp1TuLrFvwH1AaT2B2B7QayKBvGb7/+L6FaozkjpiEiGaDR3qxL4w7tl/IypsllKgLbncCMSpB
	+qIBqhDMqWBdA4s4XyRfLLE6QF7eI3wpf0M32VM6BUzBKIqblvvSpifgWJMLAWHXxXPJi+xcWtq
	T8Z7wqRhzTLHKyHqZrIFCTF6MW/r0rQ+oXw2K6tFlgOQUuBP2n2+PM9ENBey3mNqp40FY4GftI=
X-Received: by 2002:a05:600c:3b05:b0:49c:fa21:e746 with SMTP id 5b1f17b1804b1-49fc57570c8mr2823655e9.28.1789682910663;
        Thu, 17 Sep 2026 15:08:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 76/79] ffmpeg: Fix for CVE-2026-65704
Date: Fri, 18 Sep 2026 00:07:01 +0200
Message-ID: <830483e7652ca5954c5dfcd660c2e5cbcc565891.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246171

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/de771bd52774a52d45b0e2c82e56995a1ef40df7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-65704

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-65704.patch        | 35 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65704.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65704.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65704.patch
new file mode 100644
index 00000000000..223fd03c334
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65704.patch
@@ -0,0 +1,35 @@
+From e6f2209a3ab20ef0489395697a1882e97658b5b9 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Fri, 10 Jul 2026 04:07:35 +0200
+Subject: [PATCH 6/9] avformat/ty: don't let the Series2 AC3 trim underflow the
+ packet size
+
+Fixes: negative-size-param
+Fixes: ty-s2-ac3-negative-size-single-file.ffconcat / create_poc.py
+Fixes: g0qeE6KvrjZi
+Found-by: Adrian Junge (vurlo)
+
+CVE: CVE-2026-65704
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/de771bd52774a52d45b0e2c82e56995a1ef40df7]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavformat/ty.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/ty.c b/libavformat/ty.c
+index 596e4cc..1f2b6f8 100644
+--- a/libavformat/ty.c
++++ b/libavformat/ty.c
+@@ -577,7 +577,7 @@ static int demux_audio(AVFormatContext *s, TyRecHdr *rec_hdr, AVPacket *pkt)
+         if (ty->audio_type == TIVO_AUDIO_AC3 &&
+                 ty->tivo_series == TIVO_SERIES2) {
+             if (ty->ac3_pkt_size + pkt->size > AC3_PKT_LENGTH) {
+-                pkt->size -= 2;
++                pkt->size -= FFMIN(pkt->size, 2);
+                 ty->ac3_pkt_size = 0;
+             } else {
+                 ty->ac3_pkt_size += pkt->size;
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 8be6b423f75..82f4b221b75 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64834.patch \
            file://CVE-2026-64835.patch \
            file://CVE-2026-65703.patch \
+           file://CVE-2026-65704.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

