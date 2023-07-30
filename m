Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3C6C41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:11 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.78380.1690740062659625169
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WAo+YprJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68336d06620so3821095b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740062; x=1691344862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1veEEdMkQ1Lx0P+Uubjd3VlaTMv20AJY98H6b5nD2Y=;
        b=WAo+YprJ1LGT92dsAnFzaWeW5uCqPBtbdlpgle/BABzelj6aq8iO2F0E0YiaqR1Kdz
         faKCQmMJlYTw8BFcvcV/CQDkt+OXaLEpaJsGeYJd4AXVGRZIZZ01IwdJuDh3H4xXo8Wb
         5KyO0PrcBvtWllU5ZRKRVAqhynXpOp+X+UjKG3Hied9nsxH9H1g1xOiSNb3O6lwc27q9
         SUsnlKnpxqRsTS1x41uKUjsvT5fkSonzMOogzkZjwK4sPzfNaaC88C6CyJeu3KHgu26y
         aQjXRLQAFAmwUNlsoejZKBI7h9c6EY2yH8xpSxUM9bl9XffZqGiG6DYG9mlGW4sp57Rc
         xQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740062; x=1691344862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1veEEdMkQ1Lx0P+Uubjd3VlaTMv20AJY98H6b5nD2Y=;
        b=a45jpFoMAsYkk7khg6U6dbe5XaNSydk0CpHR8tBh1/SPKDDxaGKsby8z/p9IwrQuHx
         esxPKAanKs40O0t3AHZpdewcH+G5fYzBgEaBbUoidVZEEJZZ+Yxhl8/umqVsK3ew7hVi
         0rk4zj2BmDI5hPR+kegkJ6vWPdvjxvTaEEISgmh46dgzbyZMOBQd+WrEeIyuh/Fu/z6d
         p7AjzkB6btT0oT9o+IhCEvjnMiNAz1Q0cTawKaDKEd2V+kySJ6k3Zh6RRaV2kf8V+KYW
         F8REhS2TT32cLbLjKF7RaUTZcxQoIBcEcEJwT8Ap9G6L+pTFQTeYp9Bm3podPTsPpbwN
         93HA==
X-Gm-Message-State: ABy/qLZEn1N4zOo6e0QaLtJd/73dbXkUKFfsZjkB8CJD2TuW0S8bRUGZ
	yGhCmf/zvSJd1A+LIJc2+50HnCbNYTyBZzo5L4M7Zw==
X-Google-Smtp-Source: APBJJlHCcgWpN27bQqt+uaqMe/V5ocki3Td4lDO6lWpz65oMOss20OUiVN9ifE96ZIfF+pNNbbV9og==
X-Received: by 2002:a05:6a00:14ca:b0:687:22ce:365f with SMTP id w10-20020a056a0014ca00b0068722ce365fmr5149409pfu.29.1690740061621;
        Sun, 30 Jul 2023 11:01:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/30] libjpeg-turbo: patch CVE-2023-2804
Date: Sun, 30 Jul 2023 08:00:24 -1000
Message-Id: <ca8ede6d29c04159e85c2bdd2b635c58ec6a1484.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185079

From: Peter Marko <peter.marko@siemens.com>

Relevant links:
* linked fronm NVD:
  * https://github.com/libjpeg-turbo/libjpeg-turbo/issues/668#issuecomment-1492586118
* follow-up analysis:
  * https://github.com/libjpeg-turbo/libjpeg-turbo/issues/668#issuecomment-1496473989
  * picked commits fix all issues mentioned in this analysis

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../jpeg/files/CVE-2023-2804-1.patch          | 103 ++++++++++++++++++
 .../jpeg/files/CVE-2023-2804-2.patch          |  75 +++++++++++++
 .../jpeg/libjpeg-turbo_2.1.5.1.bb             |   2 +
 3 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch

diff --git a/meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch b/meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
new file mode 100644
index 0000000000..fd8a66bca7
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
@@ -0,0 +1,103 @@
+From 42ce199c9cfe129e5e21afd48dfe757a6acf87c4 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Tue, 4 Apr 2023 19:06:20 -0500
+Subject: [PATCH] Decomp: Don't enable 2-pass color quant w/ RGB565
+
+The 2-pass color quantization algorithm assumes 3-sample pixels.  RGB565
+is the only 3-component colorspace that doesn't have 3-sample pixels, so
+we need to treat it as a special case when determining whether to enable
+2-pass color quantization.  Otherwise, attempting to initialize 2-pass
+color quantization with an RGB565 output buffer could cause
+prescan_quantize() to read from uninitialized memory and subsequently
+underflow/overflow the histogram array.
+
+djpeg is supposed to fail gracefully if both -rgb565 and -colors are
+specified, because none of its destination managers (image writers)
+support color quantization with RGB565.  However, prescan_quantize() was
+called before that could occur.  It is possible but very unlikely that
+these issues could have been reproduced in applications other than
+djpeg.  The issues involve the use of two features (12-bit precision and
+RGB565) that are incompatible, and they also involve the use of two
+rarely-used legacy features (RGB565 and color quantization) that don't
+make much sense when combined.
+
+Fixes #668
+Fixes #671
+Fixes #680
+
+CVE: CVE-2023-2804
+Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turbo/commit/42ce199c9cfe129e5e21afd48dfe757a6acf87c4]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ChangeLog.md | 12 ++++++++++++
+ jdmaster.c   |  5 +++--
+ jquant2.c    |  5 +++--
+ 3 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/ChangeLog.md b/ChangeLog.md
+index 1c1e6538a..f1bfb3d87 100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -1,3 +1,15 @@
++2.1.6
++=====
++
++### Significant changes relative to 2.1.5.1:
++
++1. Fixed an oversight in 1.4 beta1[8] that caused various segfaults and buffer
++overruns when attempting to decompress various specially-crafted malformed
++12-bit-per-component JPEG images using a 12-bit-per-component build of djpeg
++(`-DWITH_12BIT=1`) with both color quantization and RGB565 color conversion
++enabled.
++
++
+ 2.1.5.1
+ =======
+ 
+diff --git a/jdmaster.c b/jdmaster.c
+index a3690bf56..a9446adfd 100644
+--- a/jdmaster.c
++++ b/jdmaster.c
+@@ -5,7 +5,7 @@
+  * Copyright (C) 1991-1997, Thomas G. Lane.
+  * Modified 2002-2009 by Guido Vollbeding.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2009-2011, 2016, 2019, 2022, D. R. Commander.
++ * Copyright (C) 2009-2011, 2016, 2019, 2022-2023, D. R. Commander.
+  * Copyright (C) 2013, Linaro Limited.
+  * Copyright (C) 2015, Google, Inc.
+  * For conditions of distribution and use, see the accompanying README.ijg
+@@ -480,7 +480,8 @@ master_selection(j_decompress_ptr cinfo)
+     if (cinfo->raw_data_out)
+       ERREXIT(cinfo, JERR_NOTIMPL);
+     /* 2-pass quantizer only works in 3-component color space. */
+-    if (cinfo->out_color_components != 3) {
++    if (cinfo->out_color_components != 3 ||
++        cinfo->out_color_space == JCS_RGB565) {
+       cinfo->enable_1pass_quant = TRUE;
+       cinfo->enable_external_quant = FALSE;
+       cinfo->enable_2pass_quant = FALSE;
+diff --git a/jquant2.c b/jquant2.c
+index 44efb18ca..1c14ef763 100644
+--- a/jquant2.c
++++ b/jquant2.c
+@@ -4,7 +4,7 @@
+  * This file was part of the Independent JPEG Group's software:
+  * Copyright (C) 1991-1996, Thomas G. Lane.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2009, 2014-2015, 2020, D. R. Commander.
++ * Copyright (C) 2009, 2014-2015, 2020, 2023, D. R. Commander.
+  * For conditions of distribution and use, see the accompanying README.ijg
+  * file.
+  *
+@@ -1230,7 +1230,8 @@ jinit_2pass_quantizer(j_decompress_ptr cinfo)
+   cquantize->error_limiter = NULL;
+ 
+   /* Make sure jdmaster didn't give me a case I can't handle */
+-  if (cinfo->out_color_components != 3)
++  if (cinfo->out_color_components != 3 ||
++      cinfo->out_color_space == JCS_RGB565)
+     ERREXIT(cinfo, JERR_NOTIMPL);
+ 
+   /* Allocate the histogram/inverse colormap storage */
diff --git a/meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch b/meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch
new file mode 100644
index 0000000000..af955a72f6
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch
@@ -0,0 +1,75 @@
+From 2e1b8a462f7f9f9bf6cd25a8516caa8203cc4593 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Thu, 6 Apr 2023 18:33:41 -0500
+Subject: [PATCH] jpeg_crop_scanline: Fix calc w/sclg + 2x4,4x2 samp
+
+When computing the downsampled width for a particular component,
+jpeg_crop_scanline() needs to take into account the fact that the
+libjpeg code uses a combination of IDCT scaling and upsampling to
+implement 4x2 and 2x4 upsampling with certain decompression scaling
+factors.  Failing to account for that led to incomplete upsampling of
+4x2- or 2x4-subsampled components, which caused the color converter to
+read from uninitialized memory.  With 12-bit data precision, this caused
+a buffer overrun or underrun and subsequent segfault if the
+uninitialized memory contained a value that was outside of the valid
+sample range (because the color converter uses the value as an array
+index.)
+
+Fixes #669
+
+CVE: CVE-2023-2804
+Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turbo/commit/2e1b8a462f7f9f9bf6cd25a8516caa8203cc4593]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ChangeLog.md |  8 ++++++++
+ jdapistd.c   | 10 ++++++----
+ 2 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/ChangeLog.md b/ChangeLog.md
+index f1bfb3d87..0a075c3c5 100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -9,6 +9,14 @@ overruns when attempting to decompress various specially-crafted malformed
+ (`-DWITH_12BIT=1`) with both color quantization and RGB565 color conversion
+ enabled.
+ 
++2. Fixed an issue whereby `jpeg_crop_scanline()` sometimes miscalculated the
++downsampled width for components with 4x2 or 2x4 subsampling factors if
++decompression scaling was enabled.  This caused the components to be upsampled
++incompletely, which caused the color converter to read from uninitialized
++memory.  With 12-bit data precision, this caused a buffer overrun or underrun
++and subsequent segfault if the sample value read from unitialized memory was
++outside of the valid sample range.
++
+ 
+ 2.1.5.1
+ =======
+diff --git a/jdapistd.c b/jdapistd.c
+index 02cd0cb93..96cded112 100644
+--- a/jdapistd.c
++++ b/jdapistd.c
+@@ -4,7 +4,7 @@
+  * This file was part of the Independent JPEG Group's software:
+  * Copyright (C) 1994-1996, Thomas G. Lane.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2010, 2015-2020, 2022, D. R. Commander.
++ * Copyright (C) 2010, 2015-2020, 2022-2023, D. R. Commander.
+  * Copyright (C) 2015, Google, Inc.
+  * For conditions of distribution and use, see the accompanying README.ijg
+  * file.
+@@ -236,9 +236,11 @@ jpeg_crop_scanline(j_decompress_ptr cinfo, JDIMENSION *xoffset,
+     /* Set downsampled_width to the new output width. */
+     orig_downsampled_width = compptr->downsampled_width;
+     compptr->downsampled_width =
+-      (JDIMENSION)jdiv_round_up((long)(cinfo->output_width *
+-                                       compptr->h_samp_factor),
+-                                (long)cinfo->max_h_samp_factor);
++      (JDIMENSION)jdiv_round_up((long)cinfo->output_width *
++                                (long)(compptr->h_samp_factor *
++                                       compptr->_DCT_scaled_size),
++                                (long)(cinfo->max_h_samp_factor *
++                                       cinfo->_min_DCT_scaled_size));
+     if (compptr->downsampled_width < 2 && orig_downsampled_width >= 2)
+       reinit_upsampler = TRUE;
+ 
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
index e086830c02..86bf471eea 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
@@ -12,6 +12,8 @@ DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
+           file://CVE-2023-2804-1.patch \
+           file://CVE-2023-2804-2.patch \
            "
 
 SRC_URI[sha256sum] = "2fdc3feb6e9deb17adec9bafa3321419aa19f8f4e5dea7bf8486844ca22207bf"
-- 
2.34.1


