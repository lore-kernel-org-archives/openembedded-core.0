Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37748CA5FAF
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:57 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33591.1790495034982485190
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=L2EI9RcB;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so1149009f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495033; x=1791099833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fcSQO4uFI+YRMVWF2TN8o7An+B7Ck6jYyYU4BHraQvE=;
        b=L2EI9RcByW74GWw9qe3FDbKw0gTvjooZjzlk3bggs8C3FEUGC4x7/BxVsXYqAc28My
         661Hcgo8K6IPWIRGcKgcQWI+TV65k5TYroWHrNAr3UEOOBsTnlE+iR8bex/Yf7AjVKWv
         ElfGZIE+EPvQ5sYUzFojs173L1F3kmgpPPXcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495033; x=1791099833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fcSQO4uFI+YRMVWF2TN8o7An+B7Ck6jYyYU4BHraQvE=;
        b=ZGmnxtdkZPKmH8JYrvq4tQTPjKslZLToMFVV0T9fjVUn/IIShBqTuyd2yRKutZrdRe
         +UiRPvi+bt0JE0Hc4owFjxELbOdRCVvPY7zflqfJscziZKWWao2D9SQGNpT2HbshsZ1I
         TrwfRlErJotgB1aOHgWxiCjgzsi3qa8ZbjdWKKr4uGPgEMl2Qnw8rrNTastCTMkjMJod
         EluaogfND78vGOkmMVEEpCpuTa5ShxgCxTAb1y3s7q3Qd0z8m41OspGBeXd77uuMak8w
         FyVKMtY++CDKSP3lGty+xwnJ/7TWkOoeFy0uuP0F3ys1ddPPWd/DVIVykeYNSD82oZdH
         WWaQ==
X-Gm-Message-State: AFq9FYK8U/79tPOd4pb5TeeaKevDCJneWW06pC8Rh2E3z9vCL8S9ByqV
	tyDn8mmHNT6QfGgjkgDG0c0MSU/8kMXOXgC28ifCZPm4iwnC490DCquw/8e9LBEHtarmpY+qJF5
	he2eCfiA=
X-Gm-Gg: AYBFou3C5MkbMIjtDqKWsgROxH2wB49eiPU9Eis/tZYdOl+XWLCXLiYCWy+m6TjwJaZ
	YU0mXMyF6Q2+63snNE0RIyZFd1SMx0MS53dC3PA5jz0CNQ4ulDb5guF+1bkRQSf6/Mwf4JcKhR8
	Sl3M+VrMWvmCl7kGiBfdGI+DgB90Is+IJOHEVmUmZVUGgGys0lP8yVvHVmf+02eRkDViGazzBTe
	3MnFmc6+AaTQLsnk1lsZzuBB2h8y4M6clnc1e/9f2R0LkuGyas7K6+5UBfgiNzHX6Ji5C9G3vfa
	y8oU+4ldHYyWQ9hOZV95wrJsoJaflFx5PuuvsO0Co5XvURxbTYE3dGw7QzO8Cd2gOhYxVqXBI6/
	ORGM5lkgLzgivfFZsL+A0STUt/2nwran54mBjzJ3oxWx4TRO5ChWl2iE42ieDrSucQ/GOip+oO+
	zB6iMJSaKyK+jdY9AFY118GwkOGl9teeZdHu3hbosyGdupjpadQkUOihFZmJ4bYTJIBbaXWjhVg
	A9OH3Nt0URyBDvKfpFCNEzqxGhwA8ckeeHnImZSLQyTY5tr8IIG3MoQiOlrYecKRt0pQRTNrA==
X-Received: by 2002:a05:6000:1863:b0:487:342:d142 with SMTP id ffacd0b85a97d-4887175ae72mr20315904f8f.44.1790495033191;
        Sun, 27 Sep 2026 00:43:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/28] ffmpeg: Fix for CVE-2026-66037
Date: Sun, 27 Sep 2026 09:43:11 +0200
Message-ID: <66194543cd579ef06d1fc5c34ac7716f9f82d8a0.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246670

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/86708357d126af84c16f80d9c57335d1e8c845c5
[2] https://nvd.nist.gov/vuln/detail/cve-2026-66037

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-66037.patch        | 39 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66037.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66037.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66037.patch
new file mode 100644
index 00000000000..1b93c0ca86b
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66037.patch
@@ -0,0 +1,39 @@
+From f02c8cd37dee2b333de229c6ac6834322f56e2c9 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sun, 28 Jun 2026 22:05:28 +0200
+Subject: [PATCH] avformat/iamf_parse: check count_label against the available
+ bytes
+
+Fixes: unbounded allocation / denial of service
+Fixes: tP59h4cpaFyg
+Fixes: 4ee05182b7 (avformat: Immersive Audio Model and Formats demuxer)
+Found-by: Adrian Junge (vurlo)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-66037
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/86708357d126af84c16f80d9c57335d1e8c845c5]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavformat/iamf_parse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavformat/iamf_parse.c b/libavformat/iamf_parse.c
+index 29b8acd351..a36759e282 100644
+--- a/libavformat/iamf_parse.c
++++ b/libavformat/iamf_parse.c
+@@ -969,6 +969,11 @@ static int mix_presentation_obu(void *s, IAMFContext *c, AVIOContext *pb, int le
+     mix_presentation->cmix = mix;
+ 
+     mix_presentation->count_label = ffio_read_leb(pbc);
++    if (mix_presentation->count_label > len - avio_tell(pbc)) {
++        mix_presentation->count_label = 0;
++        ret = AVERROR_INVALIDDATA;
++        goto fail;
++    }
+     mix_presentation->language_label = av_calloc(mix_presentation->count_label,
+                                                  sizeof(*mix_presentation->language_label));
+     if (!mix_presentation->language_label) {
+-- 
+2.53.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index b3b78a7936b..4e278a5ac97 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -37,6 +37,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-65705_p1.patch \
            file://CVE-2026-65705_p2.patch \
            file://CVE-2026-65706.patch \
+           file://CVE-2026-66037.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

