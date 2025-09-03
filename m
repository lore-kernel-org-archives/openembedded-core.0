Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBC7CA1015
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:15:13 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.17051.1756916111842782633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DTAj5UkW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77238cb3cbbso109622b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 09:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756916111; x=1757520911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzusLF5KRzOIiSICLfMotGe5/zppbSFgG8QRO3SZZEI=;
        b=DTAj5UkWm9rnU28YQHKDstdIQW6DgcoGKDZlJLnLF0QGu4EKIE4uN+n3tsBmkd+wP8
         3gi2kWR+IG7JKvKAUPzMM3BlRYcB/11T+7nVSsBZuq3PGEBEOniG6/+7vKpbZ669J1FU
         1Sj1k8DjXLqTUdcQVQ9vimte7aVd1aW+fMXySdE78SDbsP2HpDbjbmbliwQhKKTn1w2D
         ymgywSz97B4bBGIjR/goQTCnToTx+pgXQEglQPrkyv0mO6/zG7lr65lvzMVCSA7lBl3R
         DlJ9uHc5HLPwJBQXJOExPH/GRQKVqW52Ld0vlNuz8CcD3QoEkqjq920CtQgJk2Tk8eUm
         fc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916111; x=1757520911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzusLF5KRzOIiSICLfMotGe5/zppbSFgG8QRO3SZZEI=;
        b=bWNyFMyYs4DPkrEwiG01Gu4CUaxkrIq5vV281PJIAVTVpf5WwT17Op0Zri6x49m4US
         MhnFhTpAbi1swSzWgqv8cUdXSFKcL7REtmfUYNP6r3H12JFLSqts/955AREaGTSk1Dvs
         3pI9bdbHpFb7zUbnxzV/cBxusaOJNQ33LLaBSLmokfXFcq/CbvG2swdaSfqDLX0gXqfI
         LyARP58M4qnUolvWIcOGCkjcc4y0pIuRioDAwz1eE8HJ5fvIPNbv9GdV/c30dXAkKiRW
         L0rSI+1PdSEl3XVlB9tjN029nIauE8XZFbEKHODgcP0ewKBTa5NkXtlsYknjRyeyF7JC
         Aixw==
X-Gm-Message-State: AOJu0Yx7lnZ5LMG6StrxN8giTjNBxwQf1luM2Sva+WfdY1cC+Akcuky7
	Hn+YJsWTOhKUsG7J5z5P51HLmaK3YYjHjhCaqGMjKBPg8UUJ5zoWz9bU1adu4Pt9Sx1E2934FKL
	CSasG
X-Gm-Gg: ASbGncsLxmSG/WQRGk+728Yr6KiKRSGh1vtEBP6pT5momTHpHh6rwxLtpSVdPDY3DYg
	z/oEZ7yMo8frtbuHWgfoFhaWWAWx69gvX7vdGsfJPgWKwYBkMfNCGinGvkSZS6QumcB/m2aqGGq
	73Psi6807bnHk07S8CJlPcaJjpkN5how4zs8lo8NPIS7PezoBhQ+kLwHv6NR+gzc+4oOQHjij/S
	Hrz4Di8enHgX+i+h6yWwJpjUUVx3SyJBJ3RRVWecP/bRfTKWQ1xZpkADA68Cv6VVCc7MtLpgfAx
	LUpbpgJsUg0Cb//jtq6eIRNZIUsvxPWeTokbJWPmUFahj8Jej5n+Qnh2lo2veTDIu8tqz1xvphm
	PMGxtsp/LYB/uGVXfqtkR7o4E
X-Google-Smtp-Source: AGHT+IG9FpWyPZJeXFvKrX0pmkfYeNlZydywuKHSc1KEE6lpS9eSG0vqQKpZtgZ7pvvxaYfo11UYnQ==
X-Received: by 2002:a05:6a00:1810:b0:771:ef79:9338 with SMTP id d2e1a72fcca58-7723e376dacmr18879509b3a.21.1756916110945;
        Wed, 03 Sep 2025 09:15:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:9ffe:4bb4:e2b3:4b1c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm11027602b3a.40.2025.09.03.09.15.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:15:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] tiff: fix CVE-2025-8851
Date: Wed,  3 Sep 2025 09:14:53 -0700
Message-ID: <1ced84bbd4ab15f0f16176e367744b496a0ea97c.1756915922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756915922.git.steve@sakoman.com>
References: <cover.1756915922.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222868

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability was determined in LibTIFF up to 4.5.1. Affected
by this issue is the function readSeparateStripsetoBuffer of the
file tools/tiffcrop.c of the component tiffcrop. The manipulation
leads to stack-based buffer overflow. Local access is required to
approach this attack. The patch is identified as
8a7a48d7a645992ca83062b3a1873c951661e2b3. It is recommended to
apply a patch to fix this issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8851

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/8a7a48d7a645992ca83062b3a1873c951661e2b3

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2025-8851.patch          | 71 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8851.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8851.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8851.patch
new file mode 100644
index 0000000000..29089ab833
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8851.patch
@@ -0,0 +1,71 @@
+From 8a7a48d7a645992ca83062b3a1873c951661e2b3 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sun, 11 Aug 2024 16:01:07 +0000
+Subject: [PATCH] Attempt to address tiffcrop Coverity scan issues 1605444, 
+ 1605445, and 1605449.
+
+CVE: CVE-2025-8851
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/8a7a48d7a645992ca83062b3a1873c951661e2b3]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffcrop.c | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 1b072d4..e16bc2d 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5024,7 +5024,14 @@ static int readSeparateStripsIntoBuffer (TIFF *in, uint8_t *obuf, uint32_t lengt
+       buff = srcbuffs[s];
+       strip = (s * strips_per_sample) + j; 
+       bytes_read = TIFFReadEncodedStrip (in, strip, buff, stripsize);
+-      rows_this_strip = (uint32_t)(bytes_read / src_rowsize);
++      if (bytes_read < 0)
++      {
++         rows_this_strip = 0;
++      }
++      else
++      {
++         rows_this_strip = (uint32_t)(bytes_read / src_rowsize);
++      }
+       if (bytes_read < 0 && !ignore)
+         {
+         TIFFError(TIFFFileName(in),
+@@ -5434,14 +5441,14 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+       rmargin = _TIFFClampDoubleToUInt32(crop->margins[3] * scale * xres);
+       }
+ 
+-    if ((lmargin + rmargin) > image->width)
++    if (lmargin == 0xFFFFFFFFU || rmargin == 0xFFFFFFFFU || (lmargin + rmargin) > image->width)
+       {
+       TIFFError("computeInputPixelOffsets", "Combined left and right margins exceed image width");
+       lmargin = (uint32_t) 0;
+       rmargin = (uint32_t) 0;
+       return (-1);
+       }
+-    if ((tmargin + bmargin) > image->length)
++    if (tmargin == 0xFFFFFFFFU || bmargin == 0xFFFFFFFFU || (tmargin + bmargin) > image->length)
+       {
+       TIFFError("computeInputPixelOffsets", "Combined top and bottom margins exceed image length"); 
+       tmargin = (uint32_t) 0;
+@@ -5977,14 +5984,14 @@ computeOutputPixelOffsets (struct crop_mask *crop, struct image_data *image,
+       vmargin = _TIFFClampDoubleToUInt32(page->vmargin * scale * ((image->bps + 7) / 8));
+       }
+ 
+-    if ((hmargin * 2.0) > (pwidth * page->hres))
++    if (hmargin == 0xFFFFFFFFU || (hmargin * 2.0) > (pwidth * page->hres))
+       {
+       TIFFError("computeOutputPixelOffsets", 
+                 "Combined left and right margins exceed page width");
+       hmargin = (uint32_t) 0;
+       return (-1);
+       }
+-    if ((vmargin * 2.0) > (plength * page->vres))
++    if (vmargin == 0xFFFFFFFFU || (vmargin * 2.0) > (plength * page->vres))
+       {
+       TIFFError("computeOutputPixelOffsets", 
+                 "Combined top and bottom margins exceed page length"); 
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 137dc7f478..6db4d80cdf 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -61,6 +61,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8177.patch \
            file://CVE-2024-13978.patch \
            file://CVE-2025-8534.patch \
+           file://CVE-2025-8851.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.43.0


