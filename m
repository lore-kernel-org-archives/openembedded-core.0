Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB886CA5FAC
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:56 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33592.1790495035710772337
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CH5RZpZg;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so1718375f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495034; x=1791099834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N03H/+ZvyWin99rx4HzNS+KuoiMwCOOJImbrdxzk1Dk=;
        b=CH5RZpZg9Mu2Efr7m5/xkEZwPU70oZ9kyP8DwZ3QODZqlVqA4tgUSZHkGal48NN93U
         gPRFzgIlROYGwE5/vdQ+N3n3+vmXQETqXd8GDBfNuLTi9BNEI6YVNh2OLOmYyxFx0L8d
         F3JZLfavQ7DUdz8AMaXIf+fANIt8dmjqBIU50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495034; x=1791099834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N03H/+ZvyWin99rx4HzNS+KuoiMwCOOJImbrdxzk1Dk=;
        b=uXt46pZzpAXpolrS98pRVQvBhKC8SX5wyttoX0pZqvJNsXDTn6OSslHEDJ/EVAf61r
         K5efQvZ5vlENFZ/A8I2ODKr2Fi2oizrBdG2KYtLw2sbEEliCrqReGU7UcZo0ME0vn6Lz
         dkKPPdWVyNhwQmCjyeztGrIYvUpoYfrGttBtNnepaqZdcwnH23dA4MYmlbyZ1FerpYCN
         ldDc5icBJP4JHcQg+IWTkmdyxv01oLPm70XR2lhVzvPQYaen6u5LtVr2BwyWdbotxB37
         aXiPrFwF5l/P49VrH2JOwNvstlIK0uGq0mqSqOnQMkwzvctFf3sOjIBNllZtKXrw9t2R
         xzAA==
X-Gm-Message-State: AFq9FYKtYBp3XWOr2Nnfn5vWHf7FDGJfK2ygo5nMzeQSMPt/CZ9GYyEG
	rrFUb0Y2agqFDgD9B0elBkCAd+0iVQ0FCkhSq/fTJr51NwcvoWt39B+HUNZk7U78XzdoBLnz08O
	DQ6QirRQ=
X-Gm-Gg: AYBFou2Ga3DA08xEx8i9nOTBz1gSg41NDBSlqp4bxMuMx349Sv3IDgV0wRpT758dO1A
	3f61BLFo432KRWx3iQDlHxO9ihsETBukd41TdyhE6eMoYj72ztLrHmh2rLQLBDdVFb222mrdkaH
	rLc8xmt/JLjNKul7YXQZp4Q4Q0Uukojza5QUy/4IPLo3YXd60DVD7SmQpltAGjCXUb7a8endktc
	+eRrwCApV7Iy/CvSvtIkEYHsmyTbEoc7GRgdsFRUYxdxU/40MyjRLPdo7ApOAxEBc6TlSBlLfGw
	gdlKNvWdVRg82erAL8Aaw2WYgxzsGRHsXl7Cv22WdFgUsSfZgsPbtRGcqyb6nSqvKM82SYtFgE0
	aHR3D3I4nIJelnYNElZFQh0CSGevYHVFsMZ4SJuiaN22qkLGWLqA4lent8XcRClsWZi7VLonzfQ
	1StFov7VTu/tZE8xYXB956IcdVT3X/BWYbctSVxPc0RXE3A9Ga05b/iyA0hRMKO2VXfnrD7QlaB
	kNmIIAn5OV8DtxwrmtgZkunMPsQhf3o7T+KGSl0KLEZX2hhu43j9feFtfc3ivPWEv2KdPii9w==
X-Received: by 2002:a05:6000:2404:b0:487:219e:5e20 with SMTP id ffacd0b85a97d-48872ad7816mr17943269f8f.51.1790495033957;
        Sun, 27 Sep 2026 00:43:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/28] ffmpeg: Fix for CVE-2026-66038
Date: Sun, 27 Sep 2026 09:43:12 +0200
Message-ID: <b808050b1c8ee478fd0b655de7a85cbb9ba7daee.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246671

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/e7cbfd1c507b57a806a5825b87d609963e862c8c
[2] https://nvd.nist.gov/vuln/detail/cve-2026-66038

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-66038.patch        | 50 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66038.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66038.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66038.patch
new file mode 100644
index 00000000000..4c2be955907
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66038.patch
@@ -0,0 +1,50 @@
+From 5fc1e9d8af5019a83a5683e30d92c41c7a606c2d Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sun, 28 Jun 2026 19:04:07 +0200
+Subject: [PATCH] avcodec/lcldec: zero the not-decoded tail to avoid heap
+ disclosure
+
+Fixes: use of uninitialized memory
+Fixes: CsNDKB1K1U0C
+Fixes: e2c3aa8e2b (avcodec/lcldec: More space for rgb24)
+Found-by: Adrian Junge (vurlo)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-66038
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/e7cbfd1c507b57a806a5825b87d609963e862c8c]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/lcldec.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/lcldec.c b/libavcodec/lcldec.c
+index e9d4283eef..71c6d070e2 100644
+--- a/libavcodec/lcldec.c
++++ b/libavcodec/lcldec.c
+@@ -119,6 +119,9 @@ static unsigned int mszh_decomp(const unsigned char * srcptr, int srclen, unsign
+         }
+     }
+ 
++    if (destptr < destptr_end)
++        memset(destptr, 0, destptr_end - destptr);
++
+     return destptr - destptr_bak;
+ }
+ 
+@@ -152,8 +155,11 @@ static int zlib_decomp(AVCodecContext *avctx, const uint8_t *src, int src_len, i
+     if (expected != (unsigned int)zstream->total_out) {
+         av_log(avctx, AV_LOG_ERROR, "Decoded size differs (%d != %lu)\n",
+                expected, zstream->total_out);
+-        if (expected > (unsigned int)zstream->total_out)
++        if (expected > (unsigned int)zstream->total_out) {
++            memset(c->decomp_buf + offset + zstream->total_out, 0,
++                   c->decomp_size - offset - zstream->total_out);
+             return (unsigned int)zstream->total_out;
++        }
+         return AVERROR_UNKNOWN;
+     }
+     return zstream->total_out;
+-- 
+2.53.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 4e278a5ac97..57805f17095 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-65705_p2.patch \
            file://CVE-2026-65706.patch \
            file://CVE-2026-66037.patch \
+           file://CVE-2026-66038.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

