Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BFDC001B0
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 11:45:04 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.23879.1690112702365948683
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 04:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=R7Km/Mj9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202307231144592027b9e70113169d32-c9z0un@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202307231144592027b9e70113169d32
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Jul 2023 13:44:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Jp7Pu06G+FAA3wciprzkP8x/GNRXJ+8VOZRO14UFPsg=;
 b=R7Km/Mj9He3WkkU+X+7tuicBM8Diowp3UCl9Sw+ftj9bC8UryfxVqWRkX2yWfWvOWttwCb
 YsiqMb44uCo45yHJBEdu5ANqbCw2N6TdoOt3OmLtnhWm77tAlfsQ3drGa9/UIpiW8p+TbeYK
 +IXtbw7Z0gQp5Ft5cUp/M6Ywxntrg=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][dunfell][PATCH v2] libjpeg-turbo: patch CVE-2023-2804
Date: Sun, 23 Jul 2023 13:44:14 +0200
Message-Id: <20230723114414.1743230-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 11:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184748

From: Peter Marko <peter.marko@siemens.com>

Relevant links:
* linked fronm NVD:
  * https://github.com/libjpeg-turbo/libjpeg-turbo/issues/668#issuecomment-1492586118
* follow-up analysis:
  * https://github.com/libjpeg-turbo/libjpeg-turbo/issues/668#issuecomment-1496473989
  * picked commits fix all issues mentioned in this analysis

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../jpeg/files/CVE-2023-2804-1.patch          | 97 +++++++++++++++++++
 .../jpeg/files/CVE-2023-2804-2.patch          | 75 ++++++++++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |  2 +
 3 files changed, 174 insertions(+)
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch

diff --git a/meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch b/meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
new file mode 100644
index 0000000000..6668f6e41d
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
@@ -0,0 +1,97 @@
+From 9679473547874c472569d54fecce32b463999a9d Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turbo/commit/9679473547874c472569d54fecce32b463999a9d]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ChangeLog.md | 6 ++++++
+ jdmaster.c   | 5 +++--
+ jquant2.c    | 5 +++--
+ 3 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/ChangeLog.md b/ChangeLog.md
+index e605abe73..de0c4d0dd 100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -1,3 +1,9 @@ quality values.
++9. Fixed an oversight in 1.4 beta1[8] that caused various segfaults and buffer
++overruns when attempting to decompress various specially-crafted malformed
++12-bit-per-component JPEG images using a 12-bit-per-component build of djpeg
++(`-DWITH_12BIT=1`) with both color quantization and RGB565 color conversion
++enabled.
++
+ 2.0.4
+ =====
+ 
+diff --git a/jdmaster.c b/jdmaster.c
+index b20906438..8d8ef9956 100644
+--- a/jdmaster.c
++++ b/jdmaster.c
+@@ -5,7 +5,7 @@
+  * Copyright (C) 1991-1997, Thomas G. Lane.
+  * Modified 2002-2009 by Guido Vollbeding.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2009-2011, 2016, D. R. Commander.
++ * Copyright (C) 2009-2011, 2016, 2023, D. R. Commander.
+  * Copyright (C) 2013, Linaro Limited.
+  * Copyright (C) 2015, Google, Inc.
+  * For conditions of distribution and use, see the accompanying README.ijg
+@@ -492,7 +492,8 @@ master_selection(j_decompress_ptr cinfo)
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
+index 6570613bb..c760380fb 100644
+--- a/jquant2.c
++++ b/jquant2.c
+@@ -4,7 +4,7 @@
+  * This file was part of the Independent JPEG Group's software:
+  * Copyright (C) 1991-1996, Thomas G. Lane.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2009, 2014-2015, D. R. Commander.
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
index 0000000000..bcba0b513d
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch
@@ -0,0 +1,75 @@
+From 0deab87e24ab3106d5332205f829d1846fa65001 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turbo/commit/0deab87e24ab3106d5332205f829d1846fa65001]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ChangeLog.md |  8 ++++++++
+ jdapistd.c   | 10 ++++++----
+ 2 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/ChangeLog.md b/ChangeLog.md
+index de0c4d0dd..159bd1610 100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -4,6 +4,14 @@ overruns when attempting to decompress various specially-crafted malformed
+ (`-DWITH_12BIT=1`) with both color quantization and RGB565 color conversion
+ enabled.
+ 
++10. Fixed an issue whereby `jpeg_crop_scanline()` sometimes miscalculated the
++downsampled width for components with 4x2 or 2x4 subsampling factors if
++decompression scaling was enabled.  This caused the components to be upsampled
++incompletely, which caused the color converter to read from uninitialized
++memory.  With 12-bit data precision, this caused a buffer overrun or underrun
++and subsequent segfault if the sample value read from unitialized memory was
++outside of the valid sample range.
++
+ 2.0.4
+ =====
+ 
+diff --git a/jdapistd.c b/jdapistd.c
+index 628626254..eb577928c 100644
+--- a/jdapistd.c
++++ b/jdapistd.c
+@@ -4,7 +4,7 @@
+  * This file was part of the Independent JPEG Group's software:
+  * Copyright (C) 1994-1996, Thomas G. Lane.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2010, 2015-2018, 2020, D. R. Commander.
++ * Copyright (C) 2010, 2015-2018, 2020, 2023, D. R. Commander.
+  * Copyright (C) 2015, Google, Inc.
+  * For conditions of distribution and use, see the accompanying README.ijg
+  * file.
+@@ -225,9 +225,11 @@ jpeg_crop_scanline(j_decompress_ptr cinfo, JDIMENSION *xoffset,
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
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
index 630b20300f..fda425c219 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
@@ -16,6 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://CVE-2021-46822.patch \
            file://CVE-2020-35538-1.patch \
            file://CVE-2020-35538-2.patch \
+           file://CVE-2023-2804-1.patch \
+           file://CVE-2023-2804-2.patch \
            "
 
 SRC_URI[md5sum] = "d01d9e0c28c27bc0de9f4e2e8ff49855"
-- 
2.30.2


