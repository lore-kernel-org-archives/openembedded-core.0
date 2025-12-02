Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FFBD1267F
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:20:02 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.996.1764713992336179575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 14:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aEGa5LT/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297e239baecso1871345ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 14:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764713991; x=1765318791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRG88o4UU9Pj/S0G23GaXeDzsDT3iq/07vTOY7w2umU=;
        b=aEGa5LT/eDWSDfmhvAiR6PRICVVyg/OTjBiBiuX7V9Ye/NQ7N9xF/RC2R7AiSoE82h
         55ETVWgoM0DbtzNSQ0f2G3fMoVNNZKZwISCfy8esab+xeU3ho02jFG+QPncftA2UAxby
         HOnGtXVz6WUhNUvZNiDHj7MeZaC8xLlneIbmUom6PSxM0Dm0lTZ/NUAltOaJPb7BBoWt
         jNq9MM/6JG3s+vG7/KxfLSCBV+zX5fr1HGgnoqu99DRZ3gAJBiG1VB8lKp9DxowGz5KO
         EzBZ3ujAarfs7bleaMX6tnI8ny3KNTkgjlmmjcLjTHwsJew950reyl6J7+Be1KgpWdkL
         lgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713991; x=1765318791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jRG88o4UU9Pj/S0G23GaXeDzsDT3iq/07vTOY7w2umU=;
        b=Jyv+X9f0z0aTynqAXgISi+DZ4Ht8O6E+7qqaonG7BhgmaUVeX9cqf7zjmd1su59cJP
         GaBuvvIIhFFTG0G5yJf/Z1hzVZZfMg20ljMZ1L5NKRLfrNhTFDtVaY3lUAPwsVGnPkRl
         dJTGzG3jtzOAbXm8qSfE7n1iHTKFTi+lf4BekoOH/Oa0pQw4uowfb6NTpJtZemBUoPTE
         LGX+iLS+eq+Q+ZcAiGggjpYEAfQuXLH8V8qbJzcw+z2CZf43FfQXePgOF21ldUR8Eykx
         znPaBeTwsBggRDd128Z3vbC2G1sPVO6LLBVVTZ0k/Ri+IJ+RyLoRdbg4CpdR2sJBRUax
         /Mgw==
X-Gm-Message-State: AOJu0YxQq7wBP9Unm98hCxaRmvmRsFnIYO7AwzGgfbnRXVF2IKweJ+sx
	NdDJDIzs1vg/eDZBRfD/eUxHkhZ0pybtOkQKQu9F8muj8hCY6fzQWGJKadxXIPtC1aVCxG5yJjR
	qWLwy
X-Gm-Gg: ASbGncuVA/TlXptDalVBLeMtEsRZoIG96GZkkhLZApSX4eQWvSniSy1vsOGeQmYQ8Ec
	xMd3q6KcoAo5qLFOtRCfvKNEJW1XtzKA3ruVs8jotLSx6VaX4qHf70EO/i3aXb/xkxKrm7XsFgi
	7xfnotGYQfEgXjcBi2dOxwR69jAmQYIyje3KhiIxlH7s5mFk9pT9w6Vjlloxe9imVJWIBFvTWC+
	bG6QBj7oHjrVMvwI2O2DyL1MbZBwjQSSmeve+nQNYpr0fM5BIx7/CN+cA4vDO4gawb7taJPe0t0
	0aREwWXIFFDm1/Ffl4BoAcYI6TBdLl4YKfLvdGzX3k8BNNRBV0dsBavZ8GWOAYT+qOWYC8FPEoQ
	ApWsHLHvfTP6CXCWjQr4kANYq8jD1QPDnmfPQCt3zdhH3/dr5Mc9vNXd0Z7QZFfXzmYKqs1C+M4
	QgWw==
X-Google-Smtp-Source: AGHT+IH0NM63ZM7dRexlUu8fsWoolqMa9I1d3fBqkL/fMp7pKb5+akj2yZn5CnyMwg6LQbH07KRKRg==
X-Received: by 2002:a17:902:ebc4:b0:298:5fde:5a77 with SMTP id d9443c01a7336-29d67f506cemr1911045ad.22.1764713991509;
        Tue, 02 Dec 2025 14:19:51 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40acc7sm163700565ad.2.2025.12.02.14.19.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:19:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/8] libpng: patch CVE-2025-64506
Date: Tue,  2 Dec 2025 14:19:27 -0800
Message-ID: <d94f2fd650d676585422b0bc6560e315ea98044a.1764713862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764713862.git.steve@sakoman.com>
References: <cover.1764713862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 22:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227191

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/files/CVE-2025-64506.patch         | 57 +++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
new file mode 100644
index 0000000000..dc7fe00601
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
@@ -0,0 +1,57 @@
+From 2bd84c019c300b78e811743fbcddb67c9d9bf821 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Fri, 7 Nov 2025 22:40:05 +0200
+Subject: [PATCH] Fix a heap buffer overflow in `png_write_image_8bit`
+
+The condition guarding the pre-transform path incorrectly allowed 8-bit
+input data to enter `png_write_image_8bit` which expects 16-bit input.
+This caused out-of-bounds reads when processing 8-bit grayscale+alpha
+images (GitHub #688), or 8-bit RGB or RGB+alpha images (GitHub #746),
+with the `convert_to_8bit` flag set (an invalid combination that should
+bypass the pre-transform path).
+
+The second part of the condition, i.e.
+
+    colormap == 0 && convert_to_8bit != 0
+
+failed to verify that input was 16-bit, i.e.
+
+    linear != 0
+
+contradicting the comment "This only applies when the input is 16-bit".
+
+The fix consists in restructuring the condition to ensure both the
+`alpha` path and the `convert_to_8bit` path require linear (16-bit)
+input. The corrected condition, i.e.
+
+    linear != 0 && (alpha != 0 || display->convert_to_8bit != 0)
+
+matches the expectation of the `png_write_image_8bit` function and
+prevents treating 8-bit buffers as 16-bit data.
+
+Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
+Reported-by: weijinjinnihao <weijinjinnihao@users.noreply.github.com>
+Analyzed-by: degrigis <degrigis@users.noreply.github.com>
+Reviewed-by: John Bowler <jbowler@acm.org>
+
+CVE: CVE-2025-64506
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/2bd84c019c300b78e811743fbcddb67c9d9bf821]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngwrite.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/pngwrite.c b/pngwrite.c
+index 35a5d17b6..83148960e 100644
+--- a/pngwrite.c
++++ b/pngwrite.c
+@@ -2142,8 +2142,7 @@ png_image_write_main(png_voidp argument)
+     * before it is written.  This only applies when the input is 16-bit and
+     * either there is an alpha channel or it is converted to 8-bit.
+     */
+-   if ((linear != 0 && alpha != 0 ) ||
+-       (colormap == 0 && display->convert_to_8bit != 0))
++   if (linear != 0 && (alpha != 0 || display->convert_to_8bit != 0))
+    {
+       png_bytep row = png_voidcast(png_bytep, png_malloc(png_ptr,
+           png_get_rowbytes(png_ptr, info_ptr)));
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index dec78e568c..ab043e3338 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2025-64505-01.patch \
            file://CVE-2025-64505-02.patch \
            file://CVE-2025-64505-03.patch \
+           file://CVE-2025-64506.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
-- 
2.43.0


