Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183E8EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 05:51:03 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.36324.1687499462071622254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 22:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=kT09eSB8;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b543f7e53aso1915505ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 22:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687499461; x=1690091461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hSVh81fZPJLbAOSCxTNv+fPZQ2riJsNfZcyRBv0cQ3I=;
        b=kT09eSB84+xqtdNJLu7dAJ+1B2R7jNQkZLax/WY1svI+viP2sze+SzvjoSdE8u9Zlt
         rnyMOhcwY5KBtFnuQUEwiNWJd2E1LLLU9vETismN/Q/lHTVM61Ctjf8X8Tu24i/pOPf1
         wvUgjLof/bpRDX1sqNQbOXtRECP+cZ5CwN2cA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687499461; x=1690091461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSVh81fZPJLbAOSCxTNv+fPZQ2riJsNfZcyRBv0cQ3I=;
        b=GNWcctOdU6lSOdj3AXRGLDmIzwAoql7T/DPT/X4tzs8Yd3U9gEEItXJ4nU3AeNWtfB
         oTUU4jHlWsTBzAmFe/jwI96j7+r4v78k0/Yt3++T93mS3eTSb++kPaGiThSGCNso9PZ5
         4LkQsKrXh4dqOk8Kx4fFSajqkvWYfMn2iK/sPDAyre7QE/87MohPCskvCtoAhD3TAq9z
         UEPAqPX0C0AQtiUAZlpnFsQC5/ZmwzHV5wAqZSacjT4zX/UnppGjQuNI4JhG1ZD4fRSf
         D3UdF67yI9zLSZi4binl/smQxwZc78rhBsv4Ro5cvYsVVoGJB0fj2Oho8YE9V7mvZrMT
         Zjpw==
X-Gm-Message-State: AC+VfDxtpmfLSbZXpkWESyXe+G+5B8jVOorTazpOppiP8FQE/uop8aBB
	DYFoybmS4h1fFBBowTputO1q+1NFE6OGJq5+JFk=
X-Google-Smtp-Source: ACHHUZ7AaXGQiIRFyfSU8tM18LVWIkoxc245I7zmywwNGFT6u24rh0W1gyAwqfdjiEgslnujix2p9w==
X-Received: by 2002:a17:902:e74e:b0:1b5:40fd:7b9c with SMTP id p14-20020a170902e74e00b001b540fd7b9cmr20406557plf.22.1687499460152;
        Thu, 22 Jun 2023 22:51:00 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.216.97])
        by smtp.gmail.com with ESMTPSA id jd10-20020a170903260a00b001b562175158sm6282594plb.244.2023.06.22.22.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 22:50:59 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] libjpeg-turbo: CVE-2020-35538 Null pointer dereference in jcopy_sample_rows() function
Date: Fri, 23 Jun 2023 11:18:48 +0530
Message-Id: <20230623054848.192031-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 05:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183307

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/libjpeg-turbo/libjpeg-turbo/commit/9120a247436e84c0b4eea828cb11e8f665fcde30
&
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/a46c111d9f3642f0ef3819e7298846ccc61869e0]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../jpeg/files/CVE-2020-35538-1.patch         | 457 ++++++++++++++++++
 .../jpeg/files/CVE-2020-35538-2.patch         | 400 +++++++++++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |   2 +
 3 files changed, 859 insertions(+)
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2020-35538-1.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2020-35538-2.patch

diff --git a/meta/recipes-graphics/jpeg/files/CVE-2020-35538-1.patch b/meta/recipes-graphics/jpeg/files/CVE-2020-35538-1.patch
new file mode 100644
index 0000000000..8a52ed01e9
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2020-35538-1.patch
@@ -0,0 +1,457 @@
+From 9120a247436e84c0b4eea828cb11e8f665fcde30 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Thu, 23 Jul 2020 21:24:38 -0500
+Subject: [PATCH] Fix jpeg_skip_scanlines() segfault w/merged upsamp
+
+The additional segfault mentioned in #244 was due to the fact that
+the merged upsamplers use a different private structure than the
+non-merged upsamplers.  jpeg_skip_scanlines() was assuming the latter, so
+when merged upsampling was enabled, jpeg_skip_scanlines() clobbered one
+of the IDCT method pointers in the merged upsampler's private structure.
+
+For reasons unknown, the test image in #441 did not encounter this
+segfault (too small?), but it encountered an issue similar to the one
+fixed in 5bc43c7821df982f65aa1c738f67fbf7cba8bd69, whereby it was
+necessary to set up a dummy postprocessing function in
+read_and_discard_scanlines() when merged upsampling was enabled.
+Failing to do so caused either a segfault in merged_2v_upsample() (due
+to a NULL pointer being passed to jcopy_sample_rows()) or an error
+("Corrupt JPEG data: premature end of data segment"), depending on the
+number of scanlines skipped and whether the first scanline skipped was
+an odd- or even-numbered row.
+
+Fixes #441
+Fixes #244 (for real this time)
+
+Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turbo/commit/9120a247436e84c0b4eea828cb11e8f665fcde30]
+CVE: CVE-2020-35538
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ ChangeLog.md |  7 +++++
+ jdapistd.c   | 72 ++++++++++++++++++++++++++++++++++++++++++++++------
+ jdmerge.c    | 46 +++++++--------------------------
+ jdmerge.h    | 47 ++++++++++++++++++++++++++++++++++
+ jdmrg565.c   | 10 ++++----
+ jdmrgext.c   |  6 ++---
+ 6 files changed, 135 insertions(+), 53 deletions(-)
+ create mode 100644 jdmerge.h
+
+diff --git a/ChangeLog.md b/ChangeLog.md
+index 2ebfe71..19d18fa 100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -54,6 +54,13 @@ a 16-bit binary PGM file into an RGB image buffer.
+ generated when using the `tjLoadImage()` function to load a 16-bit binary PPM
+ file into an extended RGB image buffer.
+ 
++2. Fixed segfaults or "Corrupt JPEG data: premature end of data segment" errors
++in `jpeg_skip_scanlines()` that occurred when decompressing 4:2:2 or 4:2:0 JPEG
++images using the merged (non-fancy) upsampling algorithms (that is, when
++setting `cinfo.do_fancy_upsampling` to `FALSE`.)  2.0.0[6] was a similar fix,
++but it did not cover all cases.
++
++
+ 2.0.3
+ =====
+ 
+diff --git a/jdapistd.c b/jdapistd.c
+index 2c808fa..91da642 100644
+--- a/jdapistd.c
++++ b/jdapistd.c
+@@ -4,7 +4,7 @@
+  * This file was part of the Independent JPEG Group's software:
+  * Copyright (C) 1994-1996, Thomas G. Lane.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2010, 2015-2018, D. R. Commander.
++ * Copyright (C) 2010, 2015-2018, 2020, D. R. Commander.
+  * Copyright (C) 2015, Google, Inc.
+  * For conditions of distribution and use, see the accompanying README.ijg
+  * file.
+@@ -21,6 +21,8 @@
+ #include "jinclude.h"
+ #include "jdmainct.h"
+ #include "jdcoefct.h"
++#include "jdmaster.h"
++#include "jdmerge.h"
+ #include "jdsample.h"
+ #include "jmemsys.h"
+ 
+@@ -304,6 +306,16 @@ noop_quantize(j_decompress_ptr cinfo, JSAMPARRAY input_buf,
+ }
+ 
+ 
++/* Dummy postprocessing function used by jpeg_skip_scanlines() */
++LOCAL(void)
++noop_post_process (j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
++                   JDIMENSION *in_row_group_ctr,
++                   JDIMENSION in_row_groups_avail, JSAMPARRAY output_buf,
++                   JDIMENSION *out_row_ctr, JDIMENSION out_rows_avail)
++{
++}
++
++
+ /*
+  * In some cases, it is best to call jpeg_read_scanlines() and discard the
+  * output, rather than skipping the scanlines, because this allows us to
+@@ -316,11 +328,17 @@ LOCAL(void)
+ read_and_discard_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+ {
+   JDIMENSION n;
++  my_master_ptr master = (my_master_ptr)cinfo->master;
+   void (*color_convert) (j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+                          JDIMENSION input_row, JSAMPARRAY output_buf,
+                          int num_rows) = NULL;
+   void (*color_quantize) (j_decompress_ptr cinfo, JSAMPARRAY input_buf,
+                           JSAMPARRAY output_buf, int num_rows) = NULL;
++  void (*post_process_data) (j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
++                             JDIMENSION *in_row_group_ctr,
++                             JDIMENSION in_row_groups_avail,
++                             JSAMPARRAY output_buf, JDIMENSION *out_row_ctr,
++                             JDIMENSION out_rows_avail) = NULL;
+ 
+   if (cinfo->cconvert && cinfo->cconvert->color_convert) {
+     color_convert = cinfo->cconvert->color_convert;
+@@ -332,6 +350,12 @@ read_and_discard_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+     cinfo->cquantize->color_quantize = noop_quantize;
+   }
+ 
++  if (master->using_merged_upsample && cinfo->post &&
++      cinfo->post->post_process_data) {
++    post_process_data = cinfo->post->post_process_data;
++    cinfo->post->post_process_data = noop_post_process;
++  }
++
+   for (n = 0; n < num_lines; n++)
+     jpeg_read_scanlines(cinfo, NULL, 1);
+ 
+@@ -340,6 +364,9 @@ read_and_discard_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+ 
+   if (color_quantize)
+     cinfo->cquantize->color_quantize = color_quantize;
++
++  if (post_process_data)
++    cinfo->post->post_process_data = post_process_data;
+ }
+ 
+ 
+@@ -382,7 +409,7 @@ jpeg_skip_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+ {
+   my_main_ptr main_ptr = (my_main_ptr)cinfo->main;
+   my_coef_ptr coef = (my_coef_ptr)cinfo->coef;
+-  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++  my_master_ptr master = (my_master_ptr)cinfo->master;
+   JDIMENSION i, x;
+   int y;
+   JDIMENSION lines_per_iMCU_row, lines_left_in_iMCU_row, lines_after_iMCU_row;
+@@ -445,8 +472,16 @@ jpeg_skip_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+     main_ptr->buffer_full = FALSE;
+     main_ptr->rowgroup_ctr = 0;
+     main_ptr->context_state = CTX_PREPARE_FOR_IMCU;
+-    upsample->next_row_out = cinfo->max_v_samp_factor;
+-    upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++    if (master->using_merged_upsample) {
++      my_merged_upsample_ptr upsample =
++        (my_merged_upsample_ptr)cinfo->upsample;
++      upsample->spare_full = FALSE;
++      upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++    } else {
++      my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++      upsample->next_row_out = cinfo->max_v_samp_factor;
++      upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++    }
+   }
+ 
+   /* Skipping is much simpler when context rows are not required. */
+@@ -458,8 +493,16 @@ jpeg_skip_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+       cinfo->output_scanline += lines_left_in_iMCU_row;
+       main_ptr->buffer_full = FALSE;
+       main_ptr->rowgroup_ctr = 0;
+-      upsample->next_row_out = cinfo->max_v_samp_factor;
+-      upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++      if (master->using_merged_upsample) {
++        my_merged_upsample_ptr upsample =
++          (my_merged_upsample_ptr)cinfo->upsample;
++        upsample->spare_full = FALSE;
++        upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++      } else {
++        my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++        upsample->next_row_out = cinfo->max_v_samp_factor;
++        upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++      }
+     }
+   }
+ 
+@@ -494,7 +537,14 @@ jpeg_skip_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+       cinfo->output_iMCU_row += lines_to_skip / lines_per_iMCU_row;
+       increment_simple_rowgroup_ctr(cinfo, lines_to_read);
+     }
+-    upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++    if (master->using_merged_upsample) {
++      my_merged_upsample_ptr upsample =
++        (my_merged_upsample_ptr)cinfo->upsample;
++      upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++    } else {
++      my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++      upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++    }
+     return num_lines;
+   }
+ 
+@@ -535,7 +585,13 @@ jpeg_skip_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+    * bit odd, since "rows_to_go" seems to be redundantly keeping track of
+    * output_scanline.
+    */
+-  upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++  if (master->using_merged_upsample) {
++    my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
++    upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++  } else {
++    my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++    upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
++  }
+ 
+   /* Always skip the requested number of lines. */
+   return num_lines;
+diff --git a/jdmerge.c b/jdmerge.c
+index dff5a35..833ad67 100644
+--- a/jdmerge.c
++++ b/jdmerge.c
+@@ -5,7 +5,7 @@
+  * Copyright (C) 1994-1996, Thomas G. Lane.
+  * libjpeg-turbo Modifications:
+  * Copyright 2009 Pierre Ossman <ossman@cendio.se> for Cendio AB
+- * Copyright (C) 2009, 2011, 2014-2015, D. R. Commander.
++ * Copyright (C) 2009, 2011, 2014-2015, 2020, D. R. Commander.
+  * Copyright (C) 2013, Linaro Limited.
+  * For conditions of distribution and use, see the accompanying README.ijg
+  * file.
+@@ -40,41 +40,13 @@
+ #define JPEG_INTERNALS
+ #include "jinclude.h"
+ #include "jpeglib.h"
++#include "jdmerge.h"
+ #include "jsimd.h"
+ #include "jconfigint.h"
+ 
+ #ifdef UPSAMPLE_MERGING_SUPPORTED
+ 
+ 
+-/* Private subobject */
+-
+-typedef struct {
+-  struct jpeg_upsampler pub;    /* public fields */
+-
+-  /* Pointer to routine to do actual upsampling/conversion of one row group */
+-  void (*upmethod) (j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+-                    JDIMENSION in_row_group_ctr, JSAMPARRAY output_buf);
+-
+-  /* Private state for YCC->RGB conversion */
+-  int *Cr_r_tab;                /* => table for Cr to R conversion */
+-  int *Cb_b_tab;                /* => table for Cb to B conversion */
+-  JLONG *Cr_g_tab;              /* => table for Cr to G conversion */
+-  JLONG *Cb_g_tab;              /* => table for Cb to G conversion */
+-
+-  /* For 2:1 vertical sampling, we produce two output rows at a time.
+-   * We need a "spare" row buffer to hold the second output row if the
+-   * application provides just a one-row buffer; we also use the spare
+-   * to discard the dummy last row if the image height is odd.
+-   */
+-  JSAMPROW spare_row;
+-  boolean spare_full;           /* T if spare buffer is occupied */
+-
+-  JDIMENSION out_row_width;     /* samples per output row */
+-  JDIMENSION rows_to_go;        /* counts rows remaining in image */
+-} my_upsampler;
+-
+-typedef my_upsampler *my_upsample_ptr;
+-
+ #define SCALEBITS       16      /* speediest right-shift on some machines */
+ #define ONE_HALF        ((JLONG)1 << (SCALEBITS - 1))
+ #define FIX(x)          ((JLONG)((x) * (1L << SCALEBITS) + 0.5))
+@@ -189,7 +161,7 @@ typedef my_upsampler *my_upsample_ptr;
+ LOCAL(void)
+ build_ycc_rgb_table(j_decompress_ptr cinfo)
+ {
+-  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++  my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
+   int i;
+   JLONG x;
+   SHIFT_TEMPS
+@@ -232,7 +204,7 @@ build_ycc_rgb_table(j_decompress_ptr cinfo)
+ METHODDEF(void)
+ start_pass_merged_upsample(j_decompress_ptr cinfo)
+ {
+-  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++  my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
+ 
+   /* Mark the spare buffer empty */
+   upsample->spare_full = FALSE;
+@@ -254,7 +226,7 @@ merged_2v_upsample(j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+                    JDIMENSION *out_row_ctr, JDIMENSION out_rows_avail)
+ /* 2:1 vertical sampling case: may need a spare row. */
+ {
+-  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++  my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
+   JSAMPROW work_ptrs[2];
+   JDIMENSION num_rows;          /* number of rows returned to caller */
+ 
+@@ -305,7 +277,7 @@ merged_1v_upsample(j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+                    JDIMENSION *out_row_ctr, JDIMENSION out_rows_avail)
+ /* 1:1 vertical sampling case: much easier, never need a spare row. */
+ {
+-  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++  my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
+ 
+   /* Just do the upsampling. */
+   (*upsample->upmethod) (cinfo, input_buf, *in_row_group_ctr,
+@@ -566,11 +538,11 @@ h2v2_merged_upsample_565D(j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+ GLOBAL(void)
+ jinit_merged_upsampler(j_decompress_ptr cinfo)
+ {
+-  my_upsample_ptr upsample;
++  my_merged_upsample_ptr upsample;
+ 
+-  upsample = (my_upsample_ptr)
++  upsample = (my_merged_upsample_ptr)
+     (*cinfo->mem->alloc_small) ((j_common_ptr)cinfo, JPOOL_IMAGE,
+-                                sizeof(my_upsampler));
++                                sizeof(my_merged_upsampler));
+   cinfo->upsample = (struct jpeg_upsampler *)upsample;
+   upsample->pub.start_pass = start_pass_merged_upsample;
+   upsample->pub.need_context_rows = FALSE;
+diff --git a/jdmerge.h b/jdmerge.h
+new file mode 100644
+index 0000000..b583396
+--- /dev/null
++++ b/jdmerge.h
+@@ -0,0 +1,47 @@
++/*
++ * jdmerge.h
++ *
++ * This file was part of the Independent JPEG Group's software:
++ * Copyright (C) 1994-1996, Thomas G. Lane.
++ * libjpeg-turbo Modifications:
++ * Copyright (C) 2020, D. R. Commander.
++ * For conditions of distribution and use, see the accompanying README.ijg
++ * file.
++ */
++
++#define JPEG_INTERNALS
++#include "jpeglib.h"
++
++#ifdef UPSAMPLE_MERGING_SUPPORTED
++
++
++/* Private subobject */
++
++typedef struct {
++  struct jpeg_upsampler pub;    /* public fields */
++
++  /* Pointer to routine to do actual upsampling/conversion of one row group */
++  void (*upmethod) (j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
++                    JDIMENSION in_row_group_ctr, JSAMPARRAY output_buf);
++
++  /* Private state for YCC->RGB conversion */
++  int *Cr_r_tab;                /* => table for Cr to R conversion */
++  int *Cb_b_tab;                /* => table for Cb to B conversion */
++  JLONG *Cr_g_tab;              /* => table for Cr to G conversion */
++  JLONG *Cb_g_tab;              /* => table for Cb to G conversion */
++
++  /* For 2:1 vertical sampling, we produce two output rows at a time.
++   * We need a "spare" row buffer to hold the second output row if the
++   * application provides just a one-row buffer; we also use the spare
++   * to discard the dummy last row if the image height is odd.
++   */
++  JSAMPROW spare_row;
++  boolean spare_full;           /* T if spare buffer is occupied */
++
++  JDIMENSION out_row_width;     /* samples per output row */
++  JDIMENSION rows_to_go;        /* counts rows remaining in image */
++} my_merged_upsampler;
++
++typedef my_merged_upsampler *my_merged_upsample_ptr;
++
++#endif /* UPSAMPLE_MERGING_SUPPORTED */
+diff --git a/jdmrg565.c b/jdmrg565.c
+index 1b87e37..53f1e16 100644
+--- a/jdmrg565.c
++++ b/jdmrg565.c
+@@ -5,7 +5,7 @@
+  * Copyright (C) 1994-1996, Thomas G. Lane.
+  * libjpeg-turbo Modifications:
+  * Copyright (C) 2013, Linaro Limited.
+- * Copyright (C) 2014-2015, 2018, D. R. Commander.
++ * Copyright (C) 2014-2015, 2018, 2020, D. R. Commander.
+  * For conditions of distribution and use, see the accompanying README.ijg
+  * file.
+  *
+@@ -19,7 +19,7 @@ h2v1_merged_upsample_565_internal(j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+                                   JDIMENSION in_row_group_ctr,
+                                   JSAMPARRAY output_buf)
+ {
+-  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++  my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
+   register int y, cred, cgreen, cblue;
+   int cb, cr;
+   register JSAMPROW outptr;
+@@ -90,7 +90,7 @@ h2v1_merged_upsample_565D_internal(j_decompress_ptr cinfo,
+                                    JDIMENSION in_row_group_ctr,
+                                    JSAMPARRAY output_buf)
+ {
+-  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++  my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
+   register int y, cred, cgreen, cblue;
+   int cb, cr;
+   register JSAMPROW outptr;
+@@ -163,7 +163,7 @@ h2v2_merged_upsample_565_internal(j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+                                   JDIMENSION in_row_group_ctr,
+                                   JSAMPARRAY output_buf)
+ {
+-  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++  my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
+   register int y, cred, cgreen, cblue;
+   int cb, cr;
+   register JSAMPROW outptr0, outptr1;
+@@ -259,7 +259,7 @@ h2v2_merged_upsample_565D_internal(j_decompress_ptr cinfo,
+                                    JDIMENSION in_row_group_ctr,
+                                    JSAMPARRAY output_buf)
+ {
+-  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++  my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
+   register int y, cred, cgreen, cblue;
+   int cb, cr;
+   register JSAMPROW outptr0, outptr1;
+diff --git a/jdmrgext.c b/jdmrgext.c
+index b1c27df..c9a44d8 100644
+--- a/jdmrgext.c
++++ b/jdmrgext.c
+@@ -4,7 +4,7 @@
+  * This file was part of the Independent JPEG Group's software:
+  * Copyright (C) 1994-1996, Thomas G. Lane.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2011, 2015, D. R. Commander.
++ * Copyright (C) 2011, 2015, 2020, D. R. Commander.
+  * For conditions of distribution and use, see the accompanying README.ijg
+  * file.
+  *
+@@ -25,7 +25,7 @@ h2v1_merged_upsample_internal(j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+                               JDIMENSION in_row_group_ctr,
+                               JSAMPARRAY output_buf)
+ {
+-  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++  my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
+   register int y, cred, cgreen, cblue;
+   int cb, cr;
+   register JSAMPROW outptr;
+@@ -97,7 +97,7 @@ h2v2_merged_upsample_internal(j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+                               JDIMENSION in_row_group_ctr,
+                               JSAMPARRAY output_buf)
+ {
+-  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++  my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
+   register int y, cred, cgreen, cblue;
+   int cb, cr;
+   register JSAMPROW outptr0, outptr1;
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/jpeg/files/CVE-2020-35538-2.patch b/meta/recipes-graphics/jpeg/files/CVE-2020-35538-2.patch
new file mode 100644
index 0000000000..f86175dff0
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2020-35538-2.patch
@@ -0,0 +1,400 @@
+From a46c111d9f3642f0ef3819e7298846ccc61869e0 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Mon, 27 Jul 2020 14:21:23 -0500
+Subject: [PATCH] Further jpeg_skip_scanlines() fixes
+
+- Introduce a partial image decompression regression test script that
+  validates the correctness of jpeg_skip_scanlines() and
+  jpeg_crop_scanlines() for a variety of cropping regions and libjpeg
+  settings.
+
+  This regression test catches the following issues:
+  #182, fixed in 5bc43c7
+  #237, fixed in 6e95c08
+  #244, fixed in 398c1e9
+  #441, fully fixed in this commit
+
+  It does not catch the following issues:
+  #194, fixed in 773040f
+  #244 (additional segfault), fixed in
+       9120a24
+
+- Modify the libjpeg-turbo regression test suite (make test) so that it
+  checks for the issue reported in #441 (segfault in
+  jpeg_skip_scanlines() when used with 4:2:0 merged upsampling/color
+  conversion.)
+
+- Fix issues in jpeg_skip_scanlines() that caused incorrect output with
+  h2v2 (4:2:0) merged upsampling/color conversion.  The previous commit
+  fixed the segfault reported in #441, but that was a symptom of a
+  larger problem.  Because merged 4:2:0 upsampling uses a "spare row"
+  buffer, it is necessary to allow the upsampler to run when skipping
+  rows (fancy 4:2:0 upsampling, which uses context rows, also requires
+  this.)  Otherwise, if skipping starts at an odd-numbered row, the
+  output image will be incorrect.
+
+- Throw an error if jpeg_skip_scanlines() is called with two-pass color
+  quantization enabled.  With two-pass color quantization, the first
+  pass occurs within jpeg_start_decompress(), so subsequent calls to
+  jpeg_skip_scanlines() interfere with the multipass state and prevent
+  the second pass from occurring during subsequent calls to
+  jpeg_read_scanlines().
+
+Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turbo/commit/a46c111d9f3642f0ef3819e7298846ccc61869e0]
+CVE: CVE-2020-35538
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ CMakeLists.txt |  9 +++--
+ ChangeLog.md   | 15 +++++---
+ croptest.in    | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ jdapistd.c     | 70 +++++++++++--------------------------
+ libjpeg.txt    |  6 ++--
+ 5 files changed, 136 insertions(+), 59 deletions(-)
+ create mode 100755 croptest.in
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index aee74c9..de451f4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -753,7 +753,7 @@ else()
+   set(MD5_PPM_3x2_IFAST fd283664b3b49127984af0a7f118fccd)
+   set(MD5_JPEG_420_ISLOW_ARI e986fb0a637a8d833d96e8a6d6d84ea1)
+   set(MD5_JPEG_444_ISLOW_PROGARI 0a8f1c8f66e113c3cf635df0a475a617)
+-  set(MD5_PPM_420M_IFAST_ARI 72b59a99bcf1de24c5b27d151bde2437)
++  set(MD5_PPM_420M_IFAST_ARI 57251da28a35b46eecb7177d82d10e0e)
+   set(MD5_JPEG_420_ISLOW 9a68f56bc76e466aa7e52f415d0f4a5f)
+   set(MD5_PPM_420M_ISLOW_2_1 9f9de8c0612f8d06869b960b05abf9c9)
+   set(MD5_PPM_420M_ISLOW_15_8 b6875bc070720b899566cc06459b63b7)
+@@ -1131,7 +1131,7 @@ foreach(libtype ${TEST_LIBTYPES})
+ 
+   if(WITH_ARITH_DEC)
+     # CC: RGB->YCC  SAMP: h2v2 merged  IDCT: ifast  ENT: arith
+-    add_bittest(djpeg 420m-ifast-ari "-fast;-ppm"
++    add_bittest(djpeg 420m-ifast-ari "-fast;-skip;1,20;-ppm"
+       testout_420m_ifast_ari.ppm ${TESTIMAGES}/testimgari.jpg
+       ${MD5_PPM_420M_IFAST_ARI})
+ 
+@@ -1266,6 +1266,11 @@ endforeach()
+ add_custom_target(testclean COMMAND ${CMAKE_COMMAND} -P
+   ${CMAKE_CURRENT_SOURCE_DIR}/cmakescripts/testclean.cmake)
+ 
++configure_file(croptest.in croptest @ONLY)
++add_custom_target(croptest
++  COMMAND echo croptest
++  COMMAND ${BASH} ${CMAKE_CURRENT_BINARY_DIR}/croptest)
++
+ if(WITH_TURBOJPEG)
+   configure_file(tjbenchtest.in tjbenchtest @ONLY)
+   configure_file(tjexampletest.in tjexampletest @ONLY)
+diff --git a/ChangeLog.md b/ChangeLog.md
+index 19d18fa..4562eff 100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -54,11 +54,16 @@ a 16-bit binary PGM file into an RGB image buffer.
+ generated when using the `tjLoadImage()` function to load a 16-bit binary PPM
+ file into an extended RGB image buffer.
+ 
+-2. Fixed segfaults or "Corrupt JPEG data: premature end of data segment" errors
+-in `jpeg_skip_scanlines()` that occurred when decompressing 4:2:2 or 4:2:0 JPEG
+-images using the merged (non-fancy) upsampling algorithms (that is, when
+-setting `cinfo.do_fancy_upsampling` to `FALSE`.)  2.0.0[6] was a similar fix,
+-but it did not cover all cases.
++2. Fixed or worked around multiple issues with `jpeg_skip_scanlines()`:
++
++     - Fixed segfaults or "Corrupt JPEG data: premature end of data segment"
++errors in `jpeg_skip_scanlines()` that occurred when decompressing 4:2:2 or
++4:2:0 JPEG images using merged (non-fancy) upsampling/color conversion (that
++is, when setting `cinfo.do_fancy_upsampling` to `FALSE`.)  2.0.0[6] was a
++similar fix, but it did not cover all cases.
++     - `jpeg_skip_scanlines()` now throws an error if two-pass color
++quantization is enabled.  Two-pass color quantization never worked properly
++with `jpeg_skip_scanlines()`, and the issues could not readily be fixed.
+ 
+ 
+ 2.0.3
+diff --git a/croptest.in b/croptest.in
+new file mode 100755
+index 0000000..7e3c293
+--- /dev/null
++++ b/croptest.in
+@@ -0,0 +1,95 @@
++#!/bin/bash
++
++set -u
++set -e
++trap onexit INT
++trap onexit TERM
++trap onexit EXIT
++
++onexit()
++{
++	if [ -d $OUTDIR ]; then
++		rm -rf $OUTDIR
++	fi
++}
++
++runme()
++{
++	echo \*\*\* $*
++	$*
++}
++
++IMAGE=vgl_6548_0026a.bmp
++WIDTH=128
++HEIGHT=95
++IMGDIR=@CMAKE_CURRENT_SOURCE_DIR@/testimages
++OUTDIR=`mktemp -d /tmp/__croptest_output.XXXXXX`
++EXEDIR=@CMAKE_CURRENT_BINARY_DIR@
++
++if [ -d $OUTDIR ]; then
++	rm -rf $OUTDIR
++fi
++mkdir -p $OUTDIR
++
++exec >$EXEDIR/croptest.log
++
++echo "============================================================"
++echo "$IMAGE ($WIDTH x $HEIGHT)"
++echo "============================================================"
++echo
++
++for PROGARG in "" -progressive; do
++
++	cp $IMGDIR/$IMAGE $OUTDIR
++	basename=`basename $IMAGE .bmp`
++	echo "------------------------------------------------------------"
++	echo "Generating test images"
++	echo "------------------------------------------------------------"
++	echo
++	runme $EXEDIR/cjpeg $PROGARG -grayscale -outfile $OUTDIR/${basename}_GRAY.jpg $IMGDIR/${basename}.bmp
++	runme $EXEDIR/cjpeg $PROGARG -sample 2x2 -outfile $OUTDIR/${basename}_420.jpg $IMGDIR/${basename}.bmp
++	runme $EXEDIR/cjpeg $PROGARG -sample 2x1 -outfile $OUTDIR/${basename}_422.jpg $IMGDIR/${basename}.bmp
++	runme $EXEDIR/cjpeg $PROGARG -sample 1x2 -outfile $OUTDIR/${basename}_440.jpg $IMGDIR/${basename}.bmp
++	runme $EXEDIR/cjpeg $PROGARG -sample 1x1 -outfile $OUTDIR/${basename}_444.jpg $IMGDIR/${basename}.bmp
++	echo
++
++	for NSARG in "" -nosmooth; do
++
++		for COLORSARG in "" "-colors 256 -dither none -onepass"; do
++
++			for Y in {0..16}; do
++
++				for H in {1..16}; do
++
++					X=$(( (Y*16)%128 ))
++					W=$(( WIDTH-X-7 ))
++					if [ $Y -le 15 ]; then
++						CROPSPEC="${W}x${H}+${X}+${Y}"
++					else
++						Y2=$(( HEIGHT-H ));
++						CROPSPEC="${W}x${H}+${X}+${Y2}"
++					fi
++
++					echo "------------------------------------------------------------"
++					echo $PROGARG $NSARG $COLORSARG -crop $CROPSPEC
++					echo "------------------------------------------------------------"
++					echo
++					for samp in GRAY 420 422 440 444; do
++						$EXEDIR/djpeg $NSARG $COLORSARG -rgb -outfile $OUTDIR/${basename}_${samp}_full.ppm $OUTDIR/${basename}_${samp}.jpg
++						convert -crop $CROPSPEC $OUTDIR/${basename}_${samp}_full.ppm $OUTDIR/${basename}_${samp}_ref.ppm
++						runme $EXEDIR/djpeg $NSARG $COLORSARG -crop $CROPSPEC -rgb -outfile $OUTDIR/${basename}_${samp}.ppm $OUTDIR/${basename}_${samp}.jpg
++						runme cmp $OUTDIR/${basename}_${samp}.ppm $OUTDIR/${basename}_${samp}_ref.ppm
++					done
++					echo
++
++				done
++
++			done
++
++		done
++
++	done
++
++done
++
++echo SUCCESS!
+diff --git a/jdapistd.c b/jdapistd.c
+index 91da642..c502909 100644
+--- a/jdapistd.c
++++ b/jdapistd.c
+@@ -306,16 +306,6 @@ noop_quantize(j_decompress_ptr cinfo, JSAMPARRAY input_buf,
+ }
+ 
+ 
+-/* Dummy postprocessing function used by jpeg_skip_scanlines() */
+-LOCAL(void)
+-noop_post_process (j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+-                   JDIMENSION *in_row_group_ctr,
+-                   JDIMENSION in_row_groups_avail, JSAMPARRAY output_buf,
+-                   JDIMENSION *out_row_ctr, JDIMENSION out_rows_avail)
+-{
+-}
+-
+-
+ /*
+  * In some cases, it is best to call jpeg_read_scanlines() and discard the
+  * output, rather than skipping the scanlines, because this allows us to
+@@ -329,16 +319,12 @@ read_and_discard_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+ {
+   JDIMENSION n;
+   my_master_ptr master = (my_master_ptr)cinfo->master;
++  JSAMPARRAY scanlines = NULL;
+   void (*color_convert) (j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+                          JDIMENSION input_row, JSAMPARRAY output_buf,
+                          int num_rows) = NULL;
+   void (*color_quantize) (j_decompress_ptr cinfo, JSAMPARRAY input_buf,
+                           JSAMPARRAY output_buf, int num_rows) = NULL;
+-  void (*post_process_data) (j_decompress_ptr cinfo, JSAMPIMAGE input_buf,
+-                             JDIMENSION *in_row_group_ctr,
+-                             JDIMENSION in_row_groups_avail,
+-                             JSAMPARRAY output_buf, JDIMENSION *out_row_ctr,
+-                             JDIMENSION out_rows_avail) = NULL;
+ 
+   if (cinfo->cconvert && cinfo->cconvert->color_convert) {
+     color_convert = cinfo->cconvert->color_convert;
+@@ -350,23 +336,19 @@ read_and_discard_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+     cinfo->cquantize->color_quantize = noop_quantize;
+   }
+ 
+-  if (master->using_merged_upsample && cinfo->post &&
+-      cinfo->post->post_process_data) {
+-    post_process_data = cinfo->post->post_process_data;
+-    cinfo->post->post_process_data = noop_post_process;
++  if (master->using_merged_upsample && cinfo->max_v_samp_factor == 2) {
++    my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
++    scanlines = &upsample->spare_row;
+   }
+ 
+   for (n = 0; n < num_lines; n++)
+-    jpeg_read_scanlines(cinfo, NULL, 1);
++    jpeg_read_scanlines(cinfo, scanlines, 1);
+ 
+   if (color_convert)
+     cinfo->cconvert->color_convert = color_convert;
+ 
+   if (color_quantize)
+     cinfo->cquantize->color_quantize = color_quantize;
+-
+-  if (post_process_data)
+-    cinfo->post->post_process_data = post_process_data;
+ }
+ 
+ 
+@@ -380,6 +362,12 @@ increment_simple_rowgroup_ctr(j_decompress_ptr cinfo, JDIMENSION rows)
+ {
+   JDIMENSION rows_left;
+   my_main_ptr main_ptr = (my_main_ptr)cinfo->main;
++  my_master_ptr master = (my_master_ptr)cinfo->master;
++
++  if (master->using_merged_upsample && cinfo->max_v_samp_factor == 2) {
++    read_and_discard_scanlines(cinfo, rows);
++    return;
++  }
+ 
+   /* Increment the counter to the next row group after the skipped rows. */
+   main_ptr->rowgroup_ctr += rows / cinfo->max_v_samp_factor;
+@@ -410,11 +398,16 @@ jpeg_skip_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+   my_main_ptr main_ptr = (my_main_ptr)cinfo->main;
+   my_coef_ptr coef = (my_coef_ptr)cinfo->coef;
+   my_master_ptr master = (my_master_ptr)cinfo->master;
++  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
+   JDIMENSION i, x;
+   int y;
+   JDIMENSION lines_per_iMCU_row, lines_left_in_iMCU_row, lines_after_iMCU_row;
+   JDIMENSION lines_to_skip, lines_to_read;
+ 
++  /* Two-pass color quantization is not supported. */
++  if (cinfo->quantize_colors && cinfo->two_pass_quantize)
++    ERREXIT(cinfo, JERR_NOTIMPL);
++
+   if (cinfo->global_state != DSTATE_SCANNING)
+     ERREXIT1(cinfo, JERR_BAD_STATE, cinfo->global_state);
+ 
+@@ -472,13 +465,7 @@ jpeg_skip_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+     main_ptr->buffer_full = FALSE;
+     main_ptr->rowgroup_ctr = 0;
+     main_ptr->context_state = CTX_PREPARE_FOR_IMCU;
+-    if (master->using_merged_upsample) {
+-      my_merged_upsample_ptr upsample =
+-        (my_merged_upsample_ptr)cinfo->upsample;
+-      upsample->spare_full = FALSE;
+-      upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
+-    } else {
+-      my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++    if (!master->using_merged_upsample) {
+       upsample->next_row_out = cinfo->max_v_samp_factor;
+       upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
+     }
+@@ -493,13 +480,7 @@ jpeg_skip_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+       cinfo->output_scanline += lines_left_in_iMCU_row;
+       main_ptr->buffer_full = FALSE;
+       main_ptr->rowgroup_ctr = 0;
+-      if (master->using_merged_upsample) {
+-        my_merged_upsample_ptr upsample =
+-          (my_merged_upsample_ptr)cinfo->upsample;
+-        upsample->spare_full = FALSE;
+-        upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
+-      } else {
+-        my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++      if (!master->using_merged_upsample) {
+         upsample->next_row_out = cinfo->max_v_samp_factor;
+         upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
+       }
+@@ -537,14 +518,8 @@ jpeg_skip_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+       cinfo->output_iMCU_row += lines_to_skip / lines_per_iMCU_row;
+       increment_simple_rowgroup_ctr(cinfo, lines_to_read);
+     }
+-    if (master->using_merged_upsample) {
+-      my_merged_upsample_ptr upsample =
+-        (my_merged_upsample_ptr)cinfo->upsample;
+-      upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
+-    } else {
+-      my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
++    if (!master->using_merged_upsample)
+       upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
+-    }
+     return num_lines;
+   }
+ 
+@@ -585,13 +560,8 @@ jpeg_skip_scanlines(j_decompress_ptr cinfo, JDIMENSION num_lines)
+    * bit odd, since "rows_to_go" seems to be redundantly keeping track of
+    * output_scanline.
+    */
+-  if (master->using_merged_upsample) {
+-    my_merged_upsample_ptr upsample = (my_merged_upsample_ptr)cinfo->upsample;
++  if (!master->using_merged_upsample)
+     upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
+-  } else {
+-    my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
+-    upsample->rows_to_go = cinfo->output_height - cinfo->output_scanline;
+-  }
+ 
+   /* Always skip the requested number of lines. */
+   return num_lines;
+diff --git a/libjpeg.txt b/libjpeg.txt
+index c50cf90..c233ecb 100644
+--- a/libjpeg.txt
++++ b/libjpeg.txt
+@@ -3,7 +3,7 @@ USING THE IJG JPEG LIBRARY
+ This file was part of the Independent JPEG Group's software:
+ Copyright (C) 1994-2013, Thomas G. Lane, Guido Vollbeding.
+ libjpeg-turbo Modifications:
+-Copyright (C) 2010, 2014-2018, D. R. Commander.
++Copyright (C) 2010, 2014-2018, 2020, D. R. Commander.
+ Copyright (C) 2015, Google, Inc.
+ For conditions of distribution and use, see the accompanying README.ijg file.
+ 
+@@ -750,7 +750,9 @@ multiple rows in the JPEG image.
+ 
+ Suspending data sources are not supported by this function.  Calling
+ jpeg_skip_scanlines() with a suspending data source will result in undefined
+-behavior.
++behavior.  Two-pass color quantization is also not supported by this function.
++Calling jpeg_skip_scanlines() with two-pass color quantization enabled will
++result in an error.
+ 
+ jpeg_skip_scanlines() will not allow skipping past the bottom of the image.  If
+ the value of num_lines is large enough to skip past the bottom of the image,
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
index 6575582b0c..630b20300f 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
@@ -14,6 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            file://CVE-2020-13790.patch \
            file://CVE-2021-46822.patch \
+           file://CVE-2020-35538-1.patch \
+           file://CVE-2020-35538-2.patch \
            "
 
 SRC_URI[md5sum] = "d01d9e0c28c27bc0de9f4e2e8ff49855"
-- 
2.25.1


