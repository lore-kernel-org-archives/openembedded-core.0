Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59879CA9ED5
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:29 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23575.1791708086230105189
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MYPVNIjJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c411d6615so542384f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708084; x=1792312884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NDYofPWX1be+c+Np2uLmsO1MBzsjZ5MH/4ybTucAgko=;
        b=MYPVNIjJ7YveqaXObPGTwlDHrfPfF1O2WfUY4w0HxZKGS2hQS+gdFoVNMv2BqPUXTm
         IoAfms7Xr+sBUQY52quLwduhROaTcAD1Qhh0NYl2yLp87kdPf3pgSPNFfxz68u45l2l8
         kWjIButUuC6dnxNfamvrNG2XOOWtBsN5HVKy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708084; x=1792312884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NDYofPWX1be+c+Np2uLmsO1MBzsjZ5MH/4ybTucAgko=;
        b=mXI8lJk2irDAm1AiuEjiEJFxf8Subx7FDfudvsffNKd6X+zJVJg1vUFBygWpm/HbI2
         vjGYr7KuIJDQ+r1Zcbb3jAJKV/dH0CRAzHgkT+Ldd5JAGy9XhX1CppxMeRcUrC53c5q4
         qEdPPEXVxmMw08io53zxVwtRT9xRky5mmpwruGOyWmPec1Mo5aX/iBg8QDG5Br+o42RR
         qQ+izot0XjQo0y15xmD50hRSVTmbZkqyH+NKi3EuZwSNM6GYKRusOHIQ0ib7ccv4/cwT
         JezyI+d2r5I+ub9Yr30b5CDzgfSg8VNrBHvqGcA2XLxMTtIgFCnLCjag0VTVk5Va2a7O
         L59w==
X-Gm-Message-State: AFq9FYI1NKcZv2H7V1fJk/614Gkrwx2/nvmO0utSIGAMQAwvwHPBA6KZ
	hB3i5hGiC456O3XDH47HAoSYtGbBEfvbswnNkXBNHVRJo/U2K7GL2qiuY/GMny0wyb8uCMxcfuy
	8Eu6iFoU=
X-Gm-Gg: AYBFou2sIp8TwXZZT4KChu8Dbc7bgGS1Bx3ddl4aY4V8l5fU6g3OX/HN//v0q35GrHH
	Y6qVXn/0F/anS0E4TV4AxDPdJAfOeo4CKBOUfvxYAqe9ZI9pWVqt2UNG48HHDVpV8u7628irZeX
	0FwAbzXvNgp8EJG5s620Pa2wsDzkbZ2yoWd+H5X4BLCIyvcK4lBqEgzcvNylh7CWLw0HC5fvaGo
	8IPNDa0H8QA70E+i7Z5sJIdGALSE72/ac2e0lOvt4wQDCeNARk+bWC455YHc2AZ4MkF3NpCf6KW
	u90OASLhY6xUDK1SsBKf0X6EelrneOZuqjLYBDpaWiZoUht8424UXfm96uCDw0uZeoC2boy8ZOX
	7yt4W4YHHtzM8cb/4zE2+Dl0NCE3hbWzGmMW1uEdAPYEaWKFZ5x9wKdl6809/++t282cW2g+J4R
	N+LuB9a2SxOswKlpxCBVsGa8zWL3Gad07gGIFPIRTEZgEOEn2rqvWhuK75HedUDLLzDKTdoK/K6
	p/qIMiJ735/8gw227x4lml941uP6k/E3UiI/OIC1lVoEghZ7ZXfWyKfeV2OTnP9yqRnlAxMLw==
X-Received: by 2002:adf:e190:0:b0:48d:bfd5:79c with SMTP id ffacd0b85a97d-48dbfd507e6mr10824933f8f.42.1791708083640;
        Sun, 11 Oct 2026 01:41:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 35/60] libpng: upgrade 1.6.56 -> 1.6.58
Date: Sun, 11 Oct 2026 10:40:08 +0200
Message-ID: <0f0a480b7068ff8f567c8814d4f0a64888a63e56.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247545

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-34757 (in 1.6.57, as described in CVE description).
Solves also regression of CVE-2026-33416 (in 1.56.58).

Explicit CVE_STATUS is needed to remove it from open CVE list.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 31725b7411be75c124385b7fdc778eda2cfe9f69)

This also removes CVE patch which was added on Wrynose branch meanwhile
and is included in this release.

Also resolves conflict in CVE_STATUS added in opposite order.

Release notes:
* https://github.com/pnggroup/libpng/blob/v1.6.57/CHANGES#L6371
* https://github.com/pnggroup/libpng/blob/v1.6.58/CHANGES#L6382

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/files/CVE-2026-34757_p1.patch      | 518 ------------------
 .../libpng/files/CVE-2026-34757_p2.patch      | 481 ----------------
 .../{libpng_1.6.56.bb => libpng_1.6.58.bb}    |   7 +-
 3 files changed, 3 insertions(+), 1003 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.56.bb => libpng_1.6.58.bb} (94%)

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
deleted file mode 100644
index 7b5ebb18b7e..00000000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
+++ /dev/null
@@ -1,518 +0,0 @@
-From e621c40a46aa748608d5392f6a5c0278f77573d3 Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Mon, 30 Mar 2026 17:35:30 +0300
-Subject: [PATCH] fix: Handle self-referencing pointers in getter-to-setter
- aliasing
-
-Apply a robustness fix for a caller-side API usage pattern involving
-the getters and the setters for PLTE, tRNS, and hIST.
-
-Passing a pointer returned by the PLTE, tRNS, or hIST getters back
-into the corresponding setters used to cause the setters to read from
-a stale pointer. The fix consists in snapshotting the caller's data
-into a stack-local buffer before freeing the old internal storage.
-
-Fixes pnggroup/libpng#836
-
-Reported-by: Iv4n <Iv4n550@noreply.github.com>
-CVE: CVE-2026-34757
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/398cbe3df03f4e11bb031e07f416dfdde3684e8a]
-
-(cherry picked from commit 398cbe3df03f4e11bb031e07f416dfdde3684e8a)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- CMakeLists.txt               |  12 ++
- Makefile.am                  |   9 +-
- contrib/libtests/pnggetset.c | 328 +++++++++++++++++++++++++++++++++++
- pngset.c                     |  29 +++-
- tests/pnggetset              |   5 +
- 5 files changed, 380 insertions(+), 3 deletions(-)
- create mode 100644 contrib/libtests/pnggetset.c
- create mode 100755 tests/pnggetset
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fde2a323c..6401b7bd3 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -624,6 +624,9 @@ set(pngvalid_sources
- set(pngstest_sources
-     contrib/libtests/pngstest.c
- )
-+set(pnggetset_sources
-+    contrib/libtests/pnggetset.c
-+)
- set(pngunknown_sources
-     contrib/libtests/pngunknown.c
- )
-@@ -786,6 +789,15 @@ if(PNG_TESTS AND PNG_SHARED)
-                COMMAND pngtest
-                FILES "${TEST_PNG3_PNGS}")
- 
-+  # pnggetset test:
-+  # Getter-to-setter roundtrips for various chunk types.
-+  add_executable(pnggetset ${pnggetset_sources})
-+  target_link_libraries(pnggetset
-+                        PRIVATE png_shared)
-+
-+  png_add_test(NAME pnggetset
-+               COMMAND pnggetset)
-+
-   # pngvalid tests:
-   # Internal validation of standard and progressive reading,
-   # transforms, and gamma handling.
-diff --git a/Makefile.am b/Makefile.am
-index 88f7ab628..fa5bbeb61 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -13,7 +13,7 @@ ACLOCAL_AMFLAGS = -I scripts/autoconf
- 
- # test programs - run on make check, make distcheck
- if ENABLE_TESTS
--check_PROGRAMS= pngtest pngunknown pngstest pngvalid pngimage pngcp
-+check_PROGRAMS= pngtest pnggetset pngunknown pngstest pngvalid pngimage pngcp
- if HAVE_CLOCK_GETTIME
- check_PROGRAMS += timepng
- endif
-@@ -42,6 +42,9 @@ if ENABLE_TESTS
- pngtest_SOURCES = pngtest.c
- pngtest_LDADD = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.la
- 
-+pnggetset_SOURCES = contrib/libtests/pnggetset.c
-+pnggetset_LDADD = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.la
-+
- pngvalid_SOURCES = contrib/libtests/pngvalid.c
- pngvalid_LDADD = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.la
- 
-@@ -73,6 +76,7 @@ endif
- if ENABLE_TESTS
- TESTS =\
-    tests/pngtest-all\
-+   tests/pnggetset\
-    tests/pngvalid-gamma-16-to-8\
-    tests/pngvalid-gamma-alpha-mode\
-    tests/pngvalid-gamma-background\
-@@ -303,9 +307,10 @@ $(srcdir)/scripts/pnglibconf.h.prebuilt:
- pngtest.o: pnglibconf.h
- 
- contrib/libtests/makepng.o: pnglibconf.h
-+contrib/libtests/pnggetset.o: pnglibconf.h
-+contrib/libtests/pngimage.o: pnglibconf.h
- contrib/libtests/pngstest.o: pnglibconf.h
- contrib/libtests/pngunknown.o: pnglibconf.h
--contrib/libtests/pngimage.o: pnglibconf.h
- contrib/libtests/pngvalid.o: pnglibconf.h
- contrib/libtests/readpng.o: pnglibconf.h
- contrib/libtests/tarith.o: pnglibconf.h
-diff --git a/contrib/libtests/pnggetset.c b/contrib/libtests/pnggetset.c
-new file mode 100644
-index 000000000..b42508094
---- /dev/null
-+++ b/contrib/libtests/pnggetset.c
-@@ -0,0 +1,328 @@
-+/* pnggetset.c
-+ *
-+ * Copyright (c) 2026 Cosmin Truta
-+ *
-+ * This code is released under the libpng license.
-+ * For conditions of distribution and use, see the disclaimer
-+ * and license in png.h
-+ *
-+ * Test the get-then-set roundtrip pattern for PLTE, tRNS, and hIST.
-+ *
-+ * Passing the internal pointer returned by a getter back into the
-+ * corresponding setter is a natural API usage pattern.  A previous
-+ * version had a use-after-free on this path because the setter freed
-+ * the internal buffer before copying from the caller-supplied pointer.
-+ */
-+
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <string.h>
-+
-+#if defined(HAVE_CONFIG_H) && !defined(PNG_NO_CONFIG_H)
-+#  include <config.h>
-+#endif
-+
-+#ifdef PNG_FREESTANDING_TESTS
-+#  include <png.h>
-+#else
-+#  include "../../png.h"
-+#endif
-+
-+/* Test: get the PLTE, pass it straight back to set, verify roundtrip. */
-+static int
-+test_plte_roundtrip(void)
-+{
-+   png_structp png_ptr;
-+   png_infop info_ptr;
-+   png_color palette[4];
-+   png_colorp got_palette = NULL;
-+   int num_palette = 0;
-+   int i;
-+
-+   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
-+       NULL, NULL, NULL);
-+   if (png_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
-+      return 1;
-+   }
-+
-+   info_ptr = png_create_info_struct(png_ptr);
-+   if (info_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
-+      png_destroy_write_struct(&png_ptr, NULL);
-+      return 1;
-+   }
-+
-+   if (setjmp(png_jmpbuf(png_ptr)))
-+   {
-+      fprintf(stderr, "pnggetset: libpng error in test_plte_roundtrip\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* Set up a palette-color image header. */
-+   png_set_IHDR(png_ptr, info_ptr, 1, 1, 8, PNG_COLOR_TYPE_PALETTE,
-+       PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
-+
-+   /* Populate with recognizable values. */
-+   for (i = 0; i < 4; i++)
-+   {
-+      palette[i].red   = (png_byte)(i * 10);
-+      palette[i].green = (png_byte)(i * 20);
-+      palette[i].blue  = (png_byte)(i * 30);
-+   }
-+   png_set_PLTE(png_ptr, info_ptr, palette, 4);
-+
-+   /* Get the internal pointer and feed it straight back. */
-+   png_get_PLTE(png_ptr, info_ptr, &got_palette, &num_palette);
-+   if (got_palette == NULL || num_palette != 4)
-+   {
-+      fprintf(stderr, "pnggetset: png_get_PLTE returned unexpected values\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* This is the critical call: the pointer aliases info_ptr->palette. */
-+   png_set_PLTE(png_ptr, info_ptr, got_palette, num_palette);
-+
-+   /* Verify the data survived the roundtrip. */
-+   got_palette = NULL;
-+   num_palette = 0;
-+   png_get_PLTE(png_ptr, info_ptr, &got_palette, &num_palette);
-+   if (got_palette == NULL || num_palette != 4)
-+   {
-+      fprintf(stderr, "pnggetset: PLTE lost after roundtrip\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+   for (i = 0; i < 4; i++)
-+   {
-+      if (got_palette[i].red   != (png_byte)(i * 10) ||
-+          got_palette[i].green != (png_byte)(i * 20) ||
-+          got_palette[i].blue  != (png_byte)(i * 30))
-+      {
-+         fprintf(stderr,
-+             "pnggetset: PLTE entry %d corrupted after roundtrip\n", i);
-+         png_destroy_write_struct(&png_ptr, &info_ptr);
-+         return 1;
-+      }
-+   }
-+
-+   png_destroy_write_struct(&png_ptr, &info_ptr);
-+   return 0;
-+}
-+
-+#ifdef PNG_hIST_SUPPORTED
-+/* Test: get the hIST, pass it straight back to set, verify roundtrip. */
-+static int
-+test_hist_roundtrip(void)
-+{
-+   png_structp png_ptr;
-+   png_infop info_ptr;
-+   png_color palette[4];
-+   png_uint_16 hist[4];
-+   png_uint_16p got_hist = NULL;
-+   int i;
-+
-+   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
-+       NULL, NULL, NULL);
-+   if (png_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
-+      return 1;
-+   }
-+
-+   info_ptr = png_create_info_struct(png_ptr);
-+   if (info_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
-+      png_destroy_write_struct(&png_ptr, NULL);
-+      return 1;
-+   }
-+
-+   if (setjmp(png_jmpbuf(png_ptr)))
-+   {
-+      fprintf(stderr, "pnggetset: libpng error in test_hist_roundtrip\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* Set up a palette-color image header. */
-+   memset(palette, 0, sizeof palette);
-+   png_set_IHDR(png_ptr, info_ptr, 1, 1, 8, PNG_COLOR_TYPE_PALETTE,
-+       PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
-+   png_set_PLTE(png_ptr, info_ptr, palette, 4);
-+
-+   /* Populate with recognizable values. */
-+   for (i = 0; i < 4; i++)
-+      hist[i] = (png_uint_16)(i * 100 + 42);
-+
-+   png_set_hIST(png_ptr, info_ptr, hist);
-+
-+   /* Get the internal pointer and feed it straight back. */
-+   if (png_get_hIST(png_ptr, info_ptr, &got_hist) == 0 || got_hist == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_get_hIST returned unexpected values\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* This is the critical call: the pointer aliases info_ptr->hist. */
-+   png_set_hIST(png_ptr, info_ptr, got_hist);
-+
-+   /* Verify the data survived the roundtrip. */
-+   got_hist = NULL;
-+   if (png_get_hIST(png_ptr, info_ptr, &got_hist) == 0 || got_hist == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: hIST lost after roundtrip\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+   for (i = 0; i < 4; i++)
-+   {
-+      if (got_hist[i] != (png_uint_16)(i * 100 + 42))
-+      {
-+         fprintf(stderr,
-+             "pnggetset: hIST entry %d corrupted after roundtrip\n", i);
-+         png_destroy_write_struct(&png_ptr, &info_ptr);
-+         return 1;
-+      }
-+   }
-+
-+   png_destroy_write_struct(&png_ptr, &info_ptr);
-+   return 0;
-+}
-+#endif /* PNG_hIST_SUPPORTED */
-+
-+#ifdef PNG_tRNS_SUPPORTED
-+/* Test: get the tRNS, pass it straight back to set, verify roundtrip. */
-+static int
-+test_trns_roundtrip(void)
-+{
-+   png_structp png_ptr;
-+   png_infop info_ptr;
-+   png_color palette[4];
-+   png_byte trans_alpha[4];
-+   png_color_16 trans_color;
-+   png_bytep got_alpha = NULL;
-+   png_color_16p got_color = NULL;
-+   int num_trans = 0;
-+   int i;
-+
-+   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
-+       NULL, NULL, NULL);
-+   if (png_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
-+      return 1;
-+   }
-+
-+   info_ptr = png_create_info_struct(png_ptr);
-+   if (info_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
-+      png_destroy_write_struct(&png_ptr, NULL);
-+      return 1;
-+   }
-+
-+   if (setjmp(png_jmpbuf(png_ptr)))
-+   {
-+      fprintf(stderr, "pnggetset: libpng error in test_trns_roundtrip\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* Set up a palette-color image. */
-+   memset(palette, 0, sizeof palette);
-+   png_set_IHDR(png_ptr, info_ptr, 1, 1, 8, PNG_COLOR_TYPE_PALETTE,
-+       PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
-+   png_set_PLTE(png_ptr, info_ptr, palette, 4);
-+
-+   /* Populate tRNS with recognizable values. */
-+   for (i = 0; i < 4; i++)
-+      trans_alpha[i] = (png_byte)(0xff - i * 0x11);
-+   memset(&trans_color, 0, sizeof trans_color);
-+
-+   png_set_tRNS(png_ptr, info_ptr, trans_alpha, 4, &trans_color);
-+
-+   /* Get the internal pointer and feed it straight back. */
-+   png_get_tRNS(png_ptr, info_ptr, &got_alpha, &num_trans, &got_color);
-+   if (got_alpha == NULL || num_trans != 4)
-+   {
-+      fprintf(stderr, "pnggetset: png_get_tRNS returned unexpected values\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* This is the critical call: the pointer aliases info_ptr->trans_alpha. */
-+   png_set_tRNS(png_ptr, info_ptr, got_alpha, num_trans, got_color);
-+
-+   /* Verify the data survived the roundtrip. */
-+   got_alpha = NULL;
-+   num_trans = 0;
-+   png_get_tRNS(png_ptr, info_ptr, &got_alpha, &num_trans, &got_color);
-+   if (got_alpha == NULL || num_trans != 4)
-+   {
-+      fprintf(stderr, "pnggetset: tRNS lost after roundtrip\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+   for (i = 0; i < 4; i++)
-+   {
-+      if (got_alpha[i] != (png_byte)(0xff - i * 0x11))
-+      {
-+         fprintf(stderr,
-+             "pnggetset: tRNS entry %d corrupted after roundtrip\n", i);
-+         png_destroy_write_struct(&png_ptr, &info_ptr);
-+         return 1;
-+      }
-+   }
-+
-+   png_destroy_write_struct(&png_ptr, &info_ptr);
-+   return 0;
-+}
-+#endif /* PNG_tRNS_SUPPORTED */
-+
-+int
-+main(void)
-+{
-+   int result = 0;
-+
-+   printf("Testing PLTE get-then-set roundtrip... ");
-+   fflush(stdout);
-+   if (test_plte_roundtrip() != 0)
-+   {
-+      printf("FAIL\n");
-+      result = 1;
-+   }
-+   else
-+      printf("PASS\n");
-+
-+#ifdef PNG_hIST_SUPPORTED
-+   printf("Testing hIST get-then-set roundtrip... ");
-+   fflush(stdout);
-+   if (test_hist_roundtrip() != 0)
-+   {
-+      printf("FAIL\n");
-+      result = 1;
-+   }
-+   else
-+      printf("PASS\n");
-+#endif
-+
-+#ifdef PNG_tRNS_SUPPORTED
-+   printf("Testing tRNS get-then-set roundtrip... ");
-+   fflush(stdout);
-+   if (test_trns_roundtrip() != 0)
-+   {
-+      printf("FAIL\n");
-+      result = 1;
-+   }
-+   else
-+      printf("PASS\n");
-+#endif
-+
-+   return result;
-+}
-diff --git a/pngset.c b/pngset.c
-index b9ccb7fb1..a6f20123e 100644
---- a/pngset.c
-+++ b/pngset.c
-@@ -385,6 +385,7 @@ void PNGAPI
- png_set_hIST(png_const_structrp png_ptr, png_inforp info_ptr,
-     png_const_uint_16p hist)
- {
-+   png_uint_16 safe_hist[PNG_MAX_PALETTE_LENGTH];
-    int i;
- 
-    png_debug1(1, "in %s storage function", "hIST");
-@@ -401,6 +402,13 @@ png_set_hIST(png_const_structrp png_ptr, png_inforp info_ptr,
-       return;
-    }
- 
-+   /* Snapshot the caller's hist before freeing, in case it points to
-+    * info_ptr->hist (getter-to-setter aliasing).
-+    */
-+   memcpy(safe_hist, hist, (unsigned int)info_ptr->num_palette *
-+       (sizeof (png_uint_16)));
-+   hist = safe_hist;
-+
-    png_free_data(png_ptr, info_ptr, PNG_FREE_HIST, 0);
- 
-    /* Changed from info->num_palette to PNG_MAX_PALETTE_LENGTH in
-@@ -742,7 +750,7 @@ void PNGAPI
- png_set_PLTE(png_structrp png_ptr, png_inforp info_ptr,
-     png_const_colorp palette, int num_palette)
- {
--
-+   png_color safe_palette[PNG_MAX_PALETTE_LENGTH];
-    png_uint_32 max_palette_length;
- 
-    png_debug1(1, "in %s storage function", "PLTE");
-@@ -776,6 +784,15 @@ png_set_PLTE(png_structrp png_ptr, png_inforp info_ptr,
-       png_error(png_ptr, "Invalid palette");
-    }
- 
-+   /* Snapshot the caller's palette before freeing, in case it points to
-+    * info_ptr->palette (getter-to-setter aliasing).
-+    */
-+   if (num_palette > 0)
-+      memcpy(safe_palette, palette, (unsigned int)num_palette *
-+          (sizeof (png_color)));
-+
-+   palette = safe_palette;
-+
-    png_free_data(png_ptr, info_ptr, PNG_FREE_PLTE, 0);
- 
-    /* Changed in libpng-1.2.1 to allocate PNG_MAX_PALETTE_LENGTH instead
-@@ -1165,6 +1182,16 @@ png_set_tRNS(png_structrp png_ptr, png_inforp info_ptr,
- 
-    if (trans_alpha != NULL)
-    {
-+       /* Snapshot the caller's trans_alpha before freeing, in case it
-+        * points to info_ptr->trans_alpha (getter-to-setter aliasing).
-+        */
-+       png_byte safe_trans[PNG_MAX_PALETTE_LENGTH];
-+
-+       if (num_trans > 0 && num_trans <= PNG_MAX_PALETTE_LENGTH)
-+          memcpy(safe_trans, trans_alpha, (size_t)num_trans);
-+
-+       trans_alpha = safe_trans;
-+
-        png_free_data(png_ptr, info_ptr, PNG_FREE_TRNS, 0);
- 
-        if (num_trans > 0 && num_trans <= PNG_MAX_PALETTE_LENGTH)
-diff --git a/tests/pnggetset b/tests/pnggetset
-new file mode 100755
-index 000000000..57ef731a5
---- /dev/null
-+++ b/tests/pnggetset
-@@ -0,0 +1,5 @@
-+#!/bin/sh
-+
-+# pnggetset test:
-+# Getter-to-setter roundtrips for various chunk types.
-+exec ./pnggetset
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch
deleted file mode 100644
index 894f9d618be..00000000000
--- a/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch
+++ /dev/null
@@ -1,481 +0,0 @@
-From 815fdfc8dba0603abc26523d0b7e37f7ad21988b Mon Sep 17 00:00:00 2001
-From: Cosmin Truta <ctruta@gmail.com>
-Date: Mon, 30 Mar 2026 17:43:05 +0300
-Subject: [PATCH] fix: Handle getter-to-setter aliasing in append-style chunk
- setters
-
-Apply the same class of robustness fix from the previous commit to
-`png_set_text`, `png_set_sPLT` and `png_set_unknown_chunks`. These
-append-style setters used `png_realloc_array` to grow the internal
-array, then freed the old array before copying from the caller's
-input. If the caller's pointer was obtained from the corresponding
-getter, it aliased the freed array.
-
-The fix defers the freeing of the old array until after the copy loop.
-
-Also extend the pnggetset regression test to cover all three setters.
-
-CVE: CVE-2026-34757
-Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/55d20aaa322c9274491cda82c5cd4f99b48c6bcc]
-
-(cherry picked from commit 55d20aaa322c9274491cda82c5cd4f99b48c6bcc)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- contrib/libtests/pnggetset.c | 330 ++++++++++++++++++++++++++++++++++-
- pngset.c                     |  25 ++-
- 2 files changed, 347 insertions(+), 8 deletions(-)
-
-diff --git a/contrib/libtests/pnggetset.c b/contrib/libtests/pnggetset.c
-index b42508094..6ae43dc66 100644
---- a/contrib/libtests/pnggetset.c
-+++ b/contrib/libtests/pnggetset.c
-@@ -6,12 +6,12 @@
-  * For conditions of distribution and use, see the disclaimer
-  * and license in png.h
-  *
-- * Test the get-then-set roundtrip pattern for PLTE, tRNS, and hIST.
-+ * Test the get-then-set roundtrip for chunk types whose getters return
-+ * a pointer to internal storage.
-  *
-- * Passing the internal pointer returned by a getter back into the
-- * corresponding setter is a natural API usage pattern.  A previous
-- * version had a use-after-free on this path because the setter freed
-- * the internal buffer before copying from the caller-supplied pointer.
-+ * Passing such a pointer back into the corresponding setter must not
-+ * cause a use-after-free.  A previous version freed the internal buffer
-+ * before copying from the caller-supplied pointer.
-  */
- 
- #include <stdio.h>
-@@ -285,6 +285,290 @@ test_trns_roundtrip(void)
- }
- #endif /* PNG_tRNS_SUPPORTED */
- 
-+#ifdef PNG_TEXT_SUPPORTED
-+/* Test: get the text array, pass it straight back to set, verify data. */
-+#define TEXT_COUNT 6 /* enough to trigger reallocation on the second set */
-+static int
-+test_text_roundtrip(void)
-+{
-+   png_structp png_ptr;
-+   png_infop info_ptr;
-+   png_text text_entries[TEXT_COUNT];
-+   png_textp got_text = NULL;
-+   int got_num_text = 0;
-+   int i;
-+
-+   /* Recognizable keys and values. */
-+   static const char *keys[TEXT_COUNT] = {
-+      "Title", "Author", "Desc", "Copyright", "Source", "Comment"
-+   };
-+   static const char *vals[TEXT_COUNT] = {
-+      "t0", "t1", "t2", "t3", "t4", "t5"
-+   };
-+
-+   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
-+       NULL, NULL, NULL);
-+   if (png_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
-+      return 1;
-+   }
-+
-+   info_ptr = png_create_info_struct(png_ptr);
-+   if (info_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
-+      png_destroy_write_struct(&png_ptr, NULL);
-+      return 1;
-+   }
-+
-+   if (setjmp(png_jmpbuf(png_ptr)))
-+   {
-+      fprintf(stderr, "pnggetset: libpng error in test_text_roundtrip\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* Populate the text entries. */
-+   memset(text_entries, 0, sizeof text_entries);
-+   for (i = 0; i < TEXT_COUNT; i++)
-+   {
-+      text_entries[i].compression = PNG_TEXT_COMPRESSION_NONE;
-+      text_entries[i].key = (png_charp)keys[i];
-+      text_entries[i].text = (png_charp)vals[i];
-+   }
-+   png_set_text(png_ptr, info_ptr, text_entries, TEXT_COUNT);
-+
-+   /* Get the internal pointer and feed it straight back (append). */
-+   png_get_text(png_ptr, info_ptr, &got_text, &got_num_text);
-+   if (got_text == NULL || got_num_text != TEXT_COUNT)
-+   {
-+      fprintf(stderr, "pnggetset: png_get_text returned unexpected values\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* This is the critical call: got_text aliases info_ptr->text. */
-+   png_set_text(png_ptr, info_ptr, got_text, got_num_text);
-+
-+   /* Verify the original entries survived. */
-+   got_text = NULL;
-+   got_num_text = 0;
-+   png_get_text(png_ptr, info_ptr, &got_text, &got_num_text);
-+   if (got_text == NULL || got_num_text != TEXT_COUNT * 2)
-+   {
-+      fprintf(stderr, "pnggetset: text count %d, expected %d after roundtrip\n",
-+          got_num_text, TEXT_COUNT * 2);
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+   for (i = 0; i < TEXT_COUNT; i++)
-+   {
-+      if (got_text[i].key == NULL ||
-+          strcmp(got_text[i].key, keys[i]) != 0 ||
-+          got_text[i].text == NULL ||
-+          strcmp(got_text[i].text, vals[i]) != 0)
-+      {
-+         fprintf(stderr,
-+             "pnggetset: text entry %d corrupted after roundtrip\n", i);
-+         png_destroy_write_struct(&png_ptr, &info_ptr);
-+         return 1;
-+      }
-+   }
-+
-+   png_destroy_write_struct(&png_ptr, &info_ptr);
-+   return 0;
-+}
-+#undef TEXT_COUNT
-+#endif /* PNG_TEXT_SUPPORTED */
-+
-+#ifdef PNG_sPLT_SUPPORTED
-+/* Test: get the sPLT array, pass it straight back to set, verify data. */
-+static int
-+test_splt_roundtrip(void)
-+{
-+   png_structp png_ptr;
-+   png_infop info_ptr;
-+   png_sPLT_t splt;
-+   png_sPLT_entry splt_entries[4];
-+   png_sPLT_tp got_spalettes = NULL;
-+   int got_num, i;
-+
-+   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
-+       NULL, NULL, NULL);
-+   if (png_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
-+      return 1;
-+   }
-+
-+   info_ptr = png_create_info_struct(png_ptr);
-+   if (info_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
-+      png_destroy_write_struct(&png_ptr, NULL);
-+      return 1;
-+   }
-+
-+   if (setjmp(png_jmpbuf(png_ptr)))
-+   {
-+      fprintf(stderr, "pnggetset: libpng error in test_splt_roundtrip\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* Populate with recognizable values. */
-+   memset(splt_entries, 0, sizeof splt_entries);
-+   for (i = 0; i < 4; i++)
-+   {
-+      splt_entries[i].red = (png_uint_16)(i * 1000);
-+      splt_entries[i].green = (png_uint_16)(i * 2000);
-+      splt_entries[i].blue = (png_uint_16)(i * 3000);
-+      splt_entries[i].alpha = 0xffffU;
-+      splt_entries[i].frequency = (png_uint_16)(i + 1);
-+   }
-+   memset(&splt, 0, sizeof splt);
-+   splt.name = (png_charp)"test_sPLT";
-+   splt.depth = 16;
-+   splt.entries = splt_entries;
-+   splt.nentries = 4;
-+
-+   png_set_sPLT(png_ptr, info_ptr, &splt, 1);
-+
-+   /* Get the internal pointer and feed it straight back (append). */
-+   got_num = png_get_sPLT(png_ptr, info_ptr, &got_spalettes);
-+   if (got_spalettes == NULL || got_num != 1)
-+   {
-+      fprintf(stderr, "pnggetset: png_get_sPLT returned unexpected values\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* This is the critical call: got_spalettes aliases internal storage. */
-+   png_set_sPLT(png_ptr, info_ptr, got_spalettes, got_num);
-+
-+   /* Verify the original entry survived. */
-+   got_spalettes = NULL;
-+   got_num = png_get_sPLT(png_ptr, info_ptr, &got_spalettes);
-+   if (got_spalettes == NULL || got_num != 2)
-+   {
-+      fprintf(stderr, "pnggetset: sPLT count %d, expected 2 after roundtrip\n",
-+          got_num);
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+   if (strcmp(got_spalettes[0].name, "test_sPLT") != 0 ||
-+       got_spalettes[0].nentries != 4 ||
-+       got_spalettes[0].depth != 16)
-+   {
-+      fprintf(stderr,
-+          "pnggetset: sPLT entry 0 corrupted after roundtrip\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+   for (i = 0; i < 4; i++)
-+   {
-+      if (got_spalettes[0].entries[i].red != (png_uint_16)(i * 1000) ||
-+          got_spalettes[0].entries[i].green != (png_uint_16)(i * 2000) ||
-+          got_spalettes[0].entries[i].blue != (png_uint_16)(i * 3000))
-+      {
-+         fprintf(stderr,
-+             "pnggetset: sPLT[0] entry %d corrupted after roundtrip\n", i);
-+         png_destroy_write_struct(&png_ptr, &info_ptr);
-+         return 1;
-+      }
-+   }
-+
-+   png_destroy_write_struct(&png_ptr, &info_ptr);
-+   return 0;
-+}
-+#endif /* PNG_sPLT_SUPPORTED */
-+
-+#ifdef PNG_STORE_UNKNOWN_CHUNKS_SUPPORTED
-+/* Test: get unknown chunks, pass them straight back to set, verify data. */
-+static int
-+test_unknown_roundtrip(void)
-+{
-+   png_structp png_ptr;
-+   png_infop info_ptr;
-+   png_unknown_chunk unk;
-+   png_unknown_chunkp got_unknowns = NULL;
-+   int got_num;
-+   static const png_byte test_data[] = {0xde, 0xad, 0xbe, 0xef};
-+
-+   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
-+       NULL, NULL, NULL);
-+   if (png_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
-+      return 1;
-+   }
-+
-+   info_ptr = png_create_info_struct(png_ptr);
-+   if (info_ptr == NULL)
-+   {
-+      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
-+      png_destroy_write_struct(&png_ptr, NULL);
-+      return 1;
-+   }
-+
-+   if (setjmp(png_jmpbuf(png_ptr)))
-+   {
-+      fprintf(stderr,
-+          "pnggetset: libpng error in test_unknown_roundtrip\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* Set up an unknown chunk with recognizable data. */
-+   memset(&unk, 0, sizeof unk);
-+   memcpy(unk.name, "teSt", 5);
-+   unk.data = (png_bytep)test_data;
-+   unk.size = sizeof test_data;
-+   unk.location = PNG_HAVE_IHDR;
-+
-+   png_set_keep_unknown_chunks(png_ptr, PNG_HANDLE_CHUNK_ALWAYS, NULL, 0);
-+   png_set_unknown_chunks(png_ptr, info_ptr, &unk, 1);
-+
-+   /* Get the internal pointer and feed it straight back (append). */
-+   got_num = png_get_unknown_chunks(png_ptr, info_ptr, &got_unknowns);
-+   if (got_unknowns == NULL || got_num != 1)
-+   {
-+      fprintf(stderr,
-+          "pnggetset: png_get_unknown_chunks returned unexpected values\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   /* This is the critical call: got_unknowns aliases internal storage. */
-+   png_set_unknown_chunks(png_ptr, info_ptr, got_unknowns, got_num);
-+
-+   /* Verify the original entry survived. */
-+   got_unknowns = NULL;
-+   got_num = png_get_unknown_chunks(png_ptr, info_ptr, &got_unknowns);
-+   if (got_unknowns == NULL || got_num != 2)
-+   {
-+      fprintf(stderr,
-+          "pnggetset: unknown_chunks count %d, expected 2 after roundtrip\n",
-+          got_num);
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+   if (memcmp(got_unknowns[0].name, "teSt", 4) != 0 ||
-+       got_unknowns[0].size != sizeof test_data ||
-+       memcmp(got_unknowns[0].data, test_data, sizeof test_data) != 0)
-+   {
-+      fprintf(stderr,
-+          "pnggetset: unknown chunk 0 corrupted after roundtrip\n");
-+      png_destroy_write_struct(&png_ptr, &info_ptr);
-+      return 1;
-+   }
-+
-+   png_destroy_write_struct(&png_ptr, &info_ptr);
-+   return 0;
-+}
-+#endif /* PNG_STORE_UNKNOWN_CHUNKS_SUPPORTED */
-+
- int
- main(void)
- {
-@@ -324,5 +608,41 @@ main(void)
-       printf("PASS\n");
- #endif
- 
-+#ifdef PNG_TEXT_SUPPORTED
-+   printf("Testing tEXt get-then-set roundtrip... ");
-+   fflush(stdout);
-+   if (test_text_roundtrip() != 0)
-+   {
-+      printf("FAIL\n");
-+      result = 1;
-+   }
-+   else
-+      printf("PASS\n");
-+#endif
-+
-+#ifdef PNG_sPLT_SUPPORTED
-+   printf("Testing sPLT get-then-set roundtrip... ");
-+   fflush(stdout);
-+   if (test_splt_roundtrip() != 0)
-+   {
-+      printf("FAIL\n");
-+      result = 1;
-+   }
-+   else
-+      printf("PASS\n");
-+#endif
-+
-+#ifdef PNG_STORE_UNKNOWN_CHUNKS_SUPPORTED
-+   printf("Testing unknown chunks get-then-set roundtrip... ");
-+   fflush(stdout);
-+   if (test_unknown_roundtrip() != 0)
-+   {
-+      printf("FAIL\n");
-+      result = 1;
-+   }
-+   else
-+      printf("PASS\n");
-+#endif
-+
-    return result;
- }
-diff --git a/pngset.c b/pngset.c
-index a6f20123e..513c51eb4 100644
---- a/pngset.c
-+++ b/pngset.c
-@@ -954,6 +954,7 @@ png_set_text_2(png_const_structrp png_ptr, png_inforp info_ptr,
-     png_const_textp text_ptr, int num_text)
- {
-    int i;
-+   png_textp old_text = NULL;
- 
-    png_debug1(1, "in text storage function, chunk typeid = 0x%lx",
-       png_ptr == NULL ? 0xabadca11UL : (unsigned long)png_ptr->chunk_name);
-@@ -1001,7 +1002,10 @@ png_set_text_2(png_const_structrp png_ptr, png_inforp info_ptr,
-          return 1;
-       }
- 
--      png_free(png_ptr, info_ptr->text);
-+      /* Defer freeing the old array until after the copy loop below,
-+       * in case text_ptr aliases info_ptr->text (getter-to-setter).
-+       */
-+      old_text = info_ptr->text;
- 
-       info_ptr->text = new_text;
-       info_ptr->free_me |= PNG_FREE_TEXT;
-@@ -1086,6 +1090,7 @@ png_set_text_2(png_const_structrp png_ptr, png_inforp info_ptr,
-       {
-          png_chunk_report(png_ptr, "text chunk: out of memory",
-              PNG_CHUNK_WRITE_ERROR);
-+         png_free(png_ptr, old_text);
- 
-          return 1;
-       }
-@@ -1139,6 +1144,8 @@ png_set_text_2(png_const_structrp png_ptr, png_inforp info_ptr,
-       png_debug1(3, "transferred text chunk %d", info_ptr->num_text);
-    }
- 
-+   png_free(png_ptr, old_text);
-+
-    return 0;
- }
- #endif
-@@ -1276,6 +1283,7 @@ png_set_sPLT(png_const_structrp png_ptr,
-  */
- {
-    png_sPLT_tp np;
-+   png_sPLT_tp old_spalettes;
- 
-    png_debug1(1, "in %s storage function", "sPLT");
- 
-@@ -1296,7 +1304,10 @@ png_set_sPLT(png_const_structrp png_ptr,
-       return;
-    }
- 
--   png_free(png_ptr, info_ptr->splt_palettes);
-+   /* Defer freeing the old array until after the copy loop below,
-+    * in case entries aliases info_ptr->splt_palettes (getter-to-setter).
-+    */
-+   old_spalettes = info_ptr->splt_palettes;
- 
-    info_ptr->splt_palettes = np;
-    info_ptr->free_me |= PNG_FREE_SPLT;
-@@ -1360,6 +1371,8 @@ png_set_sPLT(png_const_structrp png_ptr,
-    }
-    while (--nentries);
- 
-+   png_free(png_ptr, old_spalettes);
-+
-    if (nentries > 0)
-       png_chunk_report(png_ptr, "sPLT out of memory", PNG_CHUNK_WRITE_ERROR);
- }
-@@ -1408,6 +1421,7 @@ png_set_unknown_chunks(png_const_structrp png_ptr,
-     png_inforp info_ptr, png_const_unknown_chunkp unknowns, int num_unknowns)
- {
-    png_unknown_chunkp np;
-+   png_unknown_chunkp old_unknowns;
- 
-    if (png_ptr == NULL || info_ptr == NULL || num_unknowns <= 0 ||
-        unknowns == NULL)
-@@ -1454,7 +1468,10 @@ png_set_unknown_chunks(png_const_structrp png_ptr,
-       return;
-    }
- 
--   png_free(png_ptr, info_ptr->unknown_chunks);
-+   /* Defer freeing the old array until after the copy loop below,
-+    * in case unknowns aliases info_ptr->unknown_chunks (getter-to-setter).
-+    */
-+   old_unknowns = info_ptr->unknown_chunks;
- 
-    info_ptr->unknown_chunks = np; /* safe because it is initialized */
-    info_ptr->free_me |= PNG_FREE_UNKN;
-@@ -1500,6 +1517,8 @@ png_set_unknown_chunks(png_const_structrp png_ptr,
-       ++np;
-       ++(info_ptr->unknown_chunks_num);
-    }
-+
-+   png_free(png_ptr, old_unknowns);
- }
- 
- void PNGAPI
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
similarity index 94%
rename from meta/recipes-multimedia/libpng/libpng_1.6.56.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.58.bb
index 9a85d44f52b..6e4e5e9f387 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
@@ -12,11 +12,9 @@ LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
-           file://CVE-2026-34757_p1.patch \
-           file://CVE-2026-34757_p2.patch \
-           "
+"
 
-SRC_URI[sha256sum] = "f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18"
+SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
@@ -73,4 +71,5 @@ do_install_ptest() {
 
 BBCLASSEXTEND = "native nativesdk"
 
+CVE_STATUS[CVE-2026-34757] = "fixed-version: fixed since 1.6.57"
 CVE_STATUS[CVE-2026-40930] = "cpe-incorrect: Yocto never included affected libpng-apng patch"

