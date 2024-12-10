Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F82E77182
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:46 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.3944.1733864204176906093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aQmP2awj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee6c2d6db0so5333572a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864203; x=1734469003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuUHVQCswlzYbvobDYLhncBUImR62llYhq9rgUmg2P8=;
        b=aQmP2awj/o1UQbNfEkQ+RSWndbngGlWNZSPmecN8XR8mesxG6bGYeZmM5f6gvI1LJA
         15AvPvmpF0n19T6nfkrQ1fNfCIlCZKP8V5853Fo+aXVBK9gSfBeziykiqhl4UqG1tFbL
         RXaP0yGxsTUgVAISgkxxGfwTRxnA0u+GBYW7IUEoR41Drec6iqFpXP307TOkTErabaUM
         LjrkIsf4e7B9FZU+XFxDBTOH7xYRy/+wv1Keb5evYbD2P/mTGZvp8aiEl0YWK4ecODvO
         9vUVhTX9FB/So9e2+A7IZ7EhXQU2J61bPY9z1DiMhDgrIFwUI6zseM+E8k3gnAm5FsC3
         AJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864203; x=1734469003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuUHVQCswlzYbvobDYLhncBUImR62llYhq9rgUmg2P8=;
        b=Ot6UXtDraUfTlREf9YmjheE+ofR4eDdV2hU4DRmUBTEWIeSsSPysO5nacWUyAzXYiU
         Ksq/BG56GErjAJWHTO8PKPrYat1Y5zK6/w52veeOyxHtSS2Qz3k9iZu+5eBt8eWHDSw/
         WuWg+IJIrti0NQz8HkTsz+8tLOfJPbaAv4VPX4yA8dN9BUh9GjmfbYgFhHt3AnRNFiip
         jLGtq87Jmb4XOvYFbX2vdyEtQ7uPTbLAGq53wz75PMz3wiXdSstUEENdhSWVkrQHhbPK
         hpO0pKxxOZEjAhurLPltQPDnmnpZYiaaVQRLPr1cm8xxI9X4FGEbEV9mouhsOic7w4YQ
         LCLA==
X-Gm-Message-State: AOJu0YxTX0rh4oUS7VJ/K+i9eKloYGn/ZgkjLA3Qj9rIsiz/XftpS3Sm
	OvEt6PJY86xoQYGaDFHNXV5susax6gZYxw3OPyqLfylYGwuuEs51nvUAZF6rAznl0XTaPvdkbaE
	5
X-Gm-Gg: ASbGncuaUwfAjlpjrJkD310ZranAv6k81LZ3OC+q/g55kHjckX1ED2sHqj15Xv67Fsx
	ETP3vhBbVzI59R0fVUSP3KPS/QPn2HqdR4XtlOiCIFKBe78dmb2bZGWVK8T+PJu4gUTZt+4yJet
	Nu/Ak+uSBnN4viYky/6Txt+v/S//0PbFGT+yew/SjedXyDiKgk7FjwFi9ea2mM2J+J2bdT2xnU3
	v9brvrvhLPGqbbbRK/Zce3OOCTOUmz7WMBnK+vcZEc=
X-Google-Smtp-Source: AGHT+IFxhsxfpJwAIO/OdcA+0yumhy0SwexpNr/h18PYs70iZXnmSQVUL6XZ1ucaaXXUxBRQ7VRuDw==
X-Received: by 2002:a17:90b:230c:b0:2ee:b0f1:ba17 with SMTP id 98e67ed59e1d1-2f128048ebfmr620856a91.37.1733864203435;
        Tue, 10 Dec 2024 12:56:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/12] ffmpeg: fix CVE-2024-7055
Date: Tue, 10 Dec 2024 12:56:21 -0800
Message-Id: <71a9c2d01ad8ed83f9da6e6b9541fcf1d9baed48.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208548

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was found in FFmpeg up to 7.0.1. It has been classified as critical.
This affects the function pnm_decode_frame in the library /libavcodec/pnmdec.c.
The manipulation leads to heap-based buffer overflow. It is possible to initiate
the attack remotely. The exploit has been disclosed to the public and may be used.
Upgrading to version 7.0.2 is able to address this issue. It is recommended to
upgrade the affected component. The associated identifier of this vulnerability is VDB-273651.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-7055.patch         | 38 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
new file mode 100644
index 0000000000..afd857ceac
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
@@ -0,0 +1,38 @@
+From 587acd0d4020859e67d1f07aeff2c885797ebcce Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 18 Jul 2024 21:12:54 +0200
+Subject: [PATCH] avcodec/pnmdec: Use 64bit for input size check
+
+Fixes: out of array read
+Fixes: poc3
+
+Reported-by: VulDB CNA Team
+Found-by: CookedMelon
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 3faadbe2a27e74ff5bb5f7904ec27bb1f5287dc8)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-7055
+
+Upstream-Status: Backport [https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=587acd0d4020859e67d1f07aeff2c885797ebcce]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/pnmdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/pnmdec.c b/libavcodec/pnmdec.c
+index acd77ea..40cc2ae 100644
+--- a/libavcodec/pnmdec.c
++++ b/libavcodec/pnmdec.c
+@@ -264,7 +264,7 @@ static int pnm_decode_frame(AVCodecContext *avctx, AVFrame *p,
+         break;
+     case AV_PIX_FMT_GBRPF32:
+         if (!s->half) {
+-            if (avctx->width * avctx->height * 12 > s->bytestream_end - s->bytestream)
++            if (avctx->width * avctx->height * 12LL > s->bytestream_end - s->bytestream)
+                 return AVERROR_INVALIDDATA;
+             scale = 1.f / s->scale;
+             if (s->endian) {
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index a793817ec2..8f4a8d34c0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -36,6 +36,7 @@ SRC_URI = " \
     file://CVE-2024-28661.patch \
     file://CVE-2023-50007.patch \
     file://CVE-2023-49528.patch \
+    file://CVE-2024-7055.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


