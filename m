Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49462C43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:46:57 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9770.1784036811398948038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 06:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=b8yC+j5Z;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=34376; q=dns/txt;
  s=iport01; t=1784036811; x=1785246411;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3mQxognTfAa75NLdwdtfwfLYT8uTNcfmYhL8w0g+0N0=;
  b=b8yC+j5ZjMjaYDzjSq9HIlJqSdSSkkpuzidofqzKJ0HG9AnoLedUZWsP
   ef6cXXR2YLw53aFztNK50mEAPjCQXrUlPko6i0qIKdIWL1BwXvliigrQs
   LyuFqU74YE8sLujXxiDlnEeyKZ/UWknJ6la6z8zVFHZu/4rXXFKUhb2kQ
   Ti241YSCT0gW3tm/p5f0Gdpme0CH3IhL0kwbgNbJ9C5CwzhIsctPzTaa1
   IacCWNZxp4wgvLmxbdmnfkHCEOTsdc86EOVVB0ZhKxMB8al99hon1CFBa
   RVwjvSMoeUXLeSw+kXZSSik3zsZ8+d3dInJYDKjo4xZ/7ksHwPIv9X+O7
   w==;
X-CSE-ConnectionGUID: SkqwfIQ2QMyLcyoH4qB/Nw==
X-CSE-MsgGUID: q9TGD4j9RFeGx6WkUC5fsw==
X-IPAS-Result: =?us-ascii?q?A0BHAgDrPFZq/5X/Ja1aglmCV3RfQkkDlCaCIYtnkjcUg?=
 =?us-ascii?q?WoPAQEBD0QNBAEBhD+OFQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaASABDAsBGAFZAwECTwsjGAmDAgGCOgM3AgERvGWBeTOBA?=
 =?us-ascii?q?YMoAT8CQ1DYSQ2CWAELFAGBOIU/gn2FI1wYAYQBeycbG4FygRWDaYEFgRpCA?=
 =?us-ascii?q?QGBIwQjhlsEgiKBDIFaHoFfggeMEEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYEdgU6BAIR3Ix8DOX+BMHVKeS1qEheBUoIWAoEGAwsYDUgRL?=
 =?us-ascii?q?DcUGwQ+bgeNRSWBTGALBwEwLxsTARMYBRILXRkIgQw6knQHAgGQHYIhgTWea?=
 =?us-ascii?q?XEKKIN1jCGPPoV8GjOEBIFXkkCSUQuYF2aOCoQJkkeEaYFoPIFHCwdwFRqDC?=
 =?us-ascii?q?AlKGQ+OLQsLgXiBaIF/glFDyUckNQIJAy8BAQcCBw4DC4FokAABJ4FWAQE?=
IronPort-Data: A9a23:c0ed76B+3XKiIxVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApG8qhjZTz
 GsZD2mAOPbcZDP3Ltx+bYu+9kgBvZHTydBkOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD8h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE+PZ3E08XBNch3/dTCnBJ1
 aABAncrcUXW7w626OrTpuhEnM8vKozveYgYoHwllGufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY+BPjDS0Un1lM/E48ygeKihnDXeDxDo1XTrq0yi4TW5FEpgeO0bIWMK7RmQ+1Mz3q3i
 j7Erl7XDz4KauOc9BHY/Gmz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:ypXq+6p3A3T3UcChf1ynipYaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90cu7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3AQe1OHmrAfrt0slmMGF5Py47mUfsma2LT7U6KGmq?=
 =?us-ascii?q?pLW14T53JUHXX3rwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxapjVQ2VIhDfq9xsZcR9qDLnNDUj+vWSJ2xRk8Q?=
 =?us-ascii?q?8lcSrJXJPOAq20TqsXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,163,1779148800"; 
   d="scan'208";a="509314719"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 Jul 2026 13:46:50 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 0079C180001CD
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 13:46:50 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 9FEE2CAF087; Tue, 14 Jul 2026 06:46:49 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2] libpng: Fix CVE-2026-34757
Date: Tue, 14 Jul 2026 06:46:37 -0700
Message-ID: <20260714134636.2883793-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 13:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240894

From: Sudhir Dumbhare <sudumbha@cisco.com>

These patches apply the upstream fixes [1][2], which address
getter-to-setter aliasing issues in libpng chunk setters that could
cause stale-pointer reads, as described in [3].

[1] https://github.com/pnggroup/libpng/commit/398cbe3df03f4e11bb031e07f416dfdde3684e8a
[2] https://github.com/pnggroup/libpng/commit/55d20aaa322c9274491cda82c5cd4f99b48c6bcc
[3] https://github.com/pnggroup/libpng/issues/836

Reference:
https://security-tracker.debian.org/tracker/CVE-2026-34757
https://nvd.nist.gov/vuln/detail/CVE-2026-34757

Test results on qemux86-64 using ptest-runner:
START: ptest-runner
2026-06-04T11:29
BEGIN: /usr/lib/libpng/ptest
PASS: tests/pnggetset
Testsuite summary
# TOTAL: 33
# PASS:  33
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0
DURATION: 80
END: /usr/lib/libpng/ptest
2026-06-04T11:31
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
Changes v1 -> v2:
- Rebased on latest scarthgap (2bf388381ae3)

 .../libpng/files/CVE-2026-34757_p1.patch      | 521 ++++++++++++++++++
 .../libpng/files/CVE-2026-34757_p2.patch      | 484 ++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |   4 +-
 3 files changed, 1008 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
new file mode 100644
index 0000000000..cd8150b1a4
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
@@ -0,0 +1,521 @@
+From 1fb509cdff1f9d83e2bf160259529a742de9285f Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Mon, 30 Mar 2026 17:35:30 +0300
+Subject: [PATCH] fix: Handle self-referencing pointers in getter-to-setter
+ aliasing
+
+Apply a robustness fix for a caller-side API usage pattern involving
+the getters and the setters for PLTE, tRNS, and hIST.
+
+Passing a pointer returned by the PLTE, tRNS, or hIST getters back
+into the corresponding setters used to cause the setters to read from
+a stale pointer. The fix consists in snapshotting the caller's data
+into a stack-local buffer before freeing the old internal storage.
+
+Fixes pnggroup/libpng#836
+
+CVE: CVE-2026-34757
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/398cbe3df03f4e11bb031e07f416dfdde3684e8a]
+
+Reported-by: Iv4n <Iv4n550@noreply.github.com>
+(cherry picked from commit 398cbe3df03f4e11bb031e07f416dfdde3684e8a)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ CMakeLists.txt               |  12 ++
+ Makefile.am                  |   9 +-
+ contrib/libtests/pnggetset.c | 328 +++++++++++++++++++++++++++++++++++
+ pngset.c                     |  29 +++-
+ tests/pnggetset              |   5 +
+ 5 files changed, 380 insertions(+), 3 deletions(-)
+ create mode 100644 contrib/libtests/pnggetset.c
+ create mode 100755 tests/pnggetset
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 93a2c3434..8888d15cb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -591,6 +591,9 @@ set(pngvalid_sources
+ set(pngstest_sources
+     contrib/libtests/pngstest.c
+ )
++set(pnggetset_sources
++    contrib/libtests/pnggetset.c
++)
+ set(pngunknown_sources
+     contrib/libtests/pngunknown.c
+ )
+@@ -758,6 +761,15 @@ if(PNG_TESTS AND PNG_SHARED)
+                COMMAND pngtest
+                FILES "${PNGTEST_PNG}")
+ 
++  # pnggetset test:
++  # Getter-to-setter roundtrips for various chunk types.
++  add_executable(pnggetset ${pnggetset_sources})
++  target_link_libraries(pnggetset
++                        PRIVATE png_shared)
++
++  png_add_test(NAME pnggetset
++               COMMAND pnggetset)
++
+   add_executable(pngvalid ${pngvalid_sources})
+   target_link_libraries(pngvalid PRIVATE png_shared)
+ 
+diff --git a/Makefile.am b/Makefile.am
+index 1f06c703a..bdb40c61c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -13,7 +13,7 @@ ACLOCAL_AMFLAGS = -I scripts/autoconf
+ 
+ # test programs - run on make check, make distcheck
+ if ENABLE_TESTS
+-check_PROGRAMS= pngtest pngunknown pngstest pngvalid pngimage pngcp
++check_PROGRAMS= pngtest pnggetset pngunknown pngstest pngvalid pngimage pngcp
+ if HAVE_CLOCK_GETTIME
+ check_PROGRAMS += timepng
+ endif
+@@ -42,6 +42,9 @@ if ENABLE_TESTS
+ pngtest_SOURCES = pngtest.c
+ pngtest_LDADD = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.la
+ 
++pnggetset_SOURCES = contrib/libtests/pnggetset.c
++pnggetset_LDADD = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.la
++
+ pngvalid_SOURCES = contrib/libtests/pngvalid.c
+ pngvalid_LDADD = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.la
+ 
+@@ -75,6 +78,7 @@ TESTS =\
+    tests/pngtest-all\
+    tests/pngvalid-gamma-16-to-8 tests/pngvalid-gamma-alpha-mode\
+    tests/pngvalid-gamma-background tests/pngvalid-gamma-expand16-alpha-mode\
++   tests/pnggetset\
+    tests/pngvalid-gamma-expand16-background\
+    tests/pngvalid-gamma-expand16-transform tests/pngvalid-gamma-sbit\
+    tests/pngvalid-gamma-threshold tests/pngvalid-gamma-transform\
+@@ -273,9 +277,10 @@ $(srcdir)/scripts/pnglibconf.h.prebuilt:
+ pngtest.o: pnglibconf.h
+ 
+ contrib/libtests/makepng.o: pnglibconf.h
++contrib/libtests/pnggetset.o: pnglibconf.h
++contrib/libtests/pngimage.o: pnglibconf.h
+ contrib/libtests/pngstest.o: pnglibconf.h
+ contrib/libtests/pngunknown.o: pnglibconf.h
+-contrib/libtests/pngimage.o: pnglibconf.h
+ contrib/libtests/pngvalid.o: pnglibconf.h
+ contrib/libtests/readpng.o: pnglibconf.h
+ contrib/libtests/tarith.o: pnglibconf.h
+diff --git a/contrib/libtests/pnggetset.c b/contrib/libtests/pnggetset.c
+new file mode 100644
+index 000000000..b42508094
+--- /dev/null
++++ b/contrib/libtests/pnggetset.c
+@@ -0,0 +1,328 @@
++/* pnggetset.c
++ *
++ * Copyright (c) 2026 Cosmin Truta
++ *
++ * This code is released under the libpng license.
++ * For conditions of distribution and use, see the disclaimer
++ * and license in png.h
++ *
++ * Test the get-then-set roundtrip pattern for PLTE, tRNS, and hIST.
++ *
++ * Passing the internal pointer returned by a getter back into the
++ * corresponding setter is a natural API usage pattern.  A previous
++ * version had a use-after-free on this path because the setter freed
++ * the internal buffer before copying from the caller-supplied pointer.
++ */
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#if defined(HAVE_CONFIG_H) && !defined(PNG_NO_CONFIG_H)
++#  include <config.h>
++#endif
++
++#ifdef PNG_FREESTANDING_TESTS
++#  include <png.h>
++#else
++#  include "../../png.h"
++#endif
++
++/* Test: get the PLTE, pass it straight back to set, verify roundtrip. */
++static int
++test_plte_roundtrip(void)
++{
++   png_structp png_ptr;
++   png_infop info_ptr;
++   png_color palette[4];
++   png_colorp got_palette = NULL;
++   int num_palette = 0;
++   int i;
++
++   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
++       NULL, NULL, NULL);
++   if (png_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
++      return 1;
++   }
++
++   info_ptr = png_create_info_struct(png_ptr);
++   if (info_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
++      png_destroy_write_struct(&png_ptr, NULL);
++      return 1;
++   }
++
++   if (setjmp(png_jmpbuf(png_ptr)))
++   {
++      fprintf(stderr, "pnggetset: libpng error in test_plte_roundtrip\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* Set up a palette-color image header. */
++   png_set_IHDR(png_ptr, info_ptr, 1, 1, 8, PNG_COLOR_TYPE_PALETTE,
++       PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
++
++   /* Populate with recognizable values. */
++   for (i = 0; i < 4; i++)
++   {
++      palette[i].red   = (png_byte)(i * 10);
++      palette[i].green = (png_byte)(i * 20);
++      palette[i].blue  = (png_byte)(i * 30);
++   }
++   png_set_PLTE(png_ptr, info_ptr, palette, 4);
++
++   /* Get the internal pointer and feed it straight back. */
++   png_get_PLTE(png_ptr, info_ptr, &got_palette, &num_palette);
++   if (got_palette == NULL || num_palette != 4)
++   {
++      fprintf(stderr, "pnggetset: png_get_PLTE returned unexpected values\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* This is the critical call: the pointer aliases info_ptr->palette. */
++   png_set_PLTE(png_ptr, info_ptr, got_palette, num_palette);
++
++   /* Verify the data survived the roundtrip. */
++   got_palette = NULL;
++   num_palette = 0;
++   png_get_PLTE(png_ptr, info_ptr, &got_palette, &num_palette);
++   if (got_palette == NULL || num_palette != 4)
++   {
++      fprintf(stderr, "pnggetset: PLTE lost after roundtrip\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++   for (i = 0; i < 4; i++)
++   {
++      if (got_palette[i].red   != (png_byte)(i * 10) ||
++          got_palette[i].green != (png_byte)(i * 20) ||
++          got_palette[i].blue  != (png_byte)(i * 30))
++      {
++         fprintf(stderr,
++             "pnggetset: PLTE entry %d corrupted after roundtrip\n", i);
++         png_destroy_write_struct(&png_ptr, &info_ptr);
++         return 1;
++      }
++   }
++
++   png_destroy_write_struct(&png_ptr, &info_ptr);
++   return 0;
++}
++
++#ifdef PNG_hIST_SUPPORTED
++/* Test: get the hIST, pass it straight back to set, verify roundtrip. */
++static int
++test_hist_roundtrip(void)
++{
++   png_structp png_ptr;
++   png_infop info_ptr;
++   png_color palette[4];
++   png_uint_16 hist[4];
++   png_uint_16p got_hist = NULL;
++   int i;
++
++   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
++       NULL, NULL, NULL);
++   if (png_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
++      return 1;
++   }
++
++   info_ptr = png_create_info_struct(png_ptr);
++   if (info_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
++      png_destroy_write_struct(&png_ptr, NULL);
++      return 1;
++   }
++
++   if (setjmp(png_jmpbuf(png_ptr)))
++   {
++      fprintf(stderr, "pnggetset: libpng error in test_hist_roundtrip\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* Set up a palette-color image header. */
++   memset(palette, 0, sizeof palette);
++   png_set_IHDR(png_ptr, info_ptr, 1, 1, 8, PNG_COLOR_TYPE_PALETTE,
++       PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
++   png_set_PLTE(png_ptr, info_ptr, palette, 4);
++
++   /* Populate with recognizable values. */
++   for (i = 0; i < 4; i++)
++      hist[i] = (png_uint_16)(i * 100 + 42);
++
++   png_set_hIST(png_ptr, info_ptr, hist);
++
++   /* Get the internal pointer and feed it straight back. */
++   if (png_get_hIST(png_ptr, info_ptr, &got_hist) == 0 || got_hist == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_get_hIST returned unexpected values\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* This is the critical call: the pointer aliases info_ptr->hist. */
++   png_set_hIST(png_ptr, info_ptr, got_hist);
++
++   /* Verify the data survived the roundtrip. */
++   got_hist = NULL;
++   if (png_get_hIST(png_ptr, info_ptr, &got_hist) == 0 || got_hist == NULL)
++   {
++      fprintf(stderr, "pnggetset: hIST lost after roundtrip\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++   for (i = 0; i < 4; i++)
++   {
++      if (got_hist[i] != (png_uint_16)(i * 100 + 42))
++      {
++         fprintf(stderr,
++             "pnggetset: hIST entry %d corrupted after roundtrip\n", i);
++         png_destroy_write_struct(&png_ptr, &info_ptr);
++         return 1;
++      }
++   }
++
++   png_destroy_write_struct(&png_ptr, &info_ptr);
++   return 0;
++}
++#endif /* PNG_hIST_SUPPORTED */
++
++#ifdef PNG_tRNS_SUPPORTED
++/* Test: get the tRNS, pass it straight back to set, verify roundtrip. */
++static int
++test_trns_roundtrip(void)
++{
++   png_structp png_ptr;
++   png_infop info_ptr;
++   png_color palette[4];
++   png_byte trans_alpha[4];
++   png_color_16 trans_color;
++   png_bytep got_alpha = NULL;
++   png_color_16p got_color = NULL;
++   int num_trans = 0;
++   int i;
++
++   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
++       NULL, NULL, NULL);
++   if (png_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
++      return 1;
++   }
++
++   info_ptr = png_create_info_struct(png_ptr);
++   if (info_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
++      png_destroy_write_struct(&png_ptr, NULL);
++      return 1;
++   }
++
++   if (setjmp(png_jmpbuf(png_ptr)))
++   {
++      fprintf(stderr, "pnggetset: libpng error in test_trns_roundtrip\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* Set up a palette-color image. */
++   memset(palette, 0, sizeof palette);
++   png_set_IHDR(png_ptr, info_ptr, 1, 1, 8, PNG_COLOR_TYPE_PALETTE,
++       PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
++   png_set_PLTE(png_ptr, info_ptr, palette, 4);
++
++   /* Populate tRNS with recognizable values. */
++   for (i = 0; i < 4; i++)
++      trans_alpha[i] = (png_byte)(0xff - i * 0x11);
++   memset(&trans_color, 0, sizeof trans_color);
++
++   png_set_tRNS(png_ptr, info_ptr, trans_alpha, 4, &trans_color);
++
++   /* Get the internal pointer and feed it straight back. */
++   png_get_tRNS(png_ptr, info_ptr, &got_alpha, &num_trans, &got_color);
++   if (got_alpha == NULL || num_trans != 4)
++   {
++      fprintf(stderr, "pnggetset: png_get_tRNS returned unexpected values\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* This is the critical call: the pointer aliases info_ptr->trans_alpha. */
++   png_set_tRNS(png_ptr, info_ptr, got_alpha, num_trans, got_color);
++
++   /* Verify the data survived the roundtrip. */
++   got_alpha = NULL;
++   num_trans = 0;
++   png_get_tRNS(png_ptr, info_ptr, &got_alpha, &num_trans, &got_color);
++   if (got_alpha == NULL || num_trans != 4)
++   {
++      fprintf(stderr, "pnggetset: tRNS lost after roundtrip\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++   for (i = 0; i < 4; i++)
++   {
++      if (got_alpha[i] != (png_byte)(0xff - i * 0x11))
++      {
++         fprintf(stderr,
++             "pnggetset: tRNS entry %d corrupted after roundtrip\n", i);
++         png_destroy_write_struct(&png_ptr, &info_ptr);
++         return 1;
++      }
++   }
++
++   png_destroy_write_struct(&png_ptr, &info_ptr);
++   return 0;
++}
++#endif /* PNG_tRNS_SUPPORTED */
++
++int
++main(void)
++{
++   int result = 0;
++
++   printf("Testing PLTE get-then-set roundtrip... ");
++   fflush(stdout);
++   if (test_plte_roundtrip() != 0)
++   {
++      printf("FAIL\n");
++      result = 1;
++   }
++   else
++      printf("PASS\n");
++
++#ifdef PNG_hIST_SUPPORTED
++   printf("Testing hIST get-then-set roundtrip... ");
++   fflush(stdout);
++   if (test_hist_roundtrip() != 0)
++   {
++      printf("FAIL\n");
++      result = 1;
++   }
++   else
++      printf("PASS\n");
++#endif
++
++#ifdef PNG_tRNS_SUPPORTED
++   printf("Testing tRNS get-then-set roundtrip... ");
++   fflush(stdout);
++   if (test_trns_roundtrip() != 0)
++   {
++      printf("FAIL\n");
++      result = 1;
++   }
++   else
++      printf("PASS\n");
++#endif
++
++   return result;
++}
+diff --git a/pngset.c b/pngset.c
+index c4a0958aa..9f5c44510 100644
+--- a/pngset.c
++++ b/pngset.c
+@@ -204,6 +204,7 @@ void PNGAPI
+ png_set_hIST(png_const_structrp png_ptr, png_inforp info_ptr,
+     png_const_uint_16p hist)
+ {
++   png_uint_16 safe_hist[PNG_MAX_PALETTE_LENGTH];
+    int i;
+ 
+    png_debug1(1, "in %s storage function", "hIST");
+@@ -220,6 +221,13 @@ png_set_hIST(png_const_structrp png_ptr, png_inforp info_ptr,
+       return;
+    }
+ 
++   /* Snapshot the caller's hist before freeing, in case it points to
++    * info_ptr->hist (getter-to-setter aliasing).
++    */
++   memcpy(safe_hist, hist, (unsigned int)info_ptr->num_palette *
++       (sizeof (png_uint_16)));
++   hist = safe_hist;
++
+    png_free_data(png_ptr, info_ptr, PNG_FREE_HIST, 0);
+ 
+    /* Changed from info->num_palette to PNG_MAX_PALETTE_LENGTH in
+@@ -561,7 +569,7 @@ void PNGAPI
+ png_set_PLTE(png_structrp png_ptr, png_inforp info_ptr,
+     png_const_colorp palette, int num_palette)
+ {
+-
++   png_color safe_palette[PNG_MAX_PALETTE_LENGTH];
+    png_uint_32 max_palette_length;
+ 
+    png_debug1(1, "in %s storage function", "PLTE");
+@@ -595,6 +603,15 @@ png_set_PLTE(png_structrp png_ptr, png_inforp info_ptr,
+       png_error(png_ptr, "Invalid palette");
+    }
+ 
++   /* Snapshot the caller's palette before freeing, in case it points to
++    * info_ptr->palette (getter-to-setter aliasing).
++    */
++   if (num_palette > 0)
++      memcpy(safe_palette, palette, (unsigned int)num_palette *
++          (sizeof (png_color)));
++
++   palette = safe_palette;
++
+    png_free_data(png_ptr, info_ptr, PNG_FREE_PLTE, 0);
+ 
+    /* Changed in libpng-1.2.1 to allocate PNG_MAX_PALETTE_LENGTH instead
+@@ -1000,6 +1017,16 @@ png_set_tRNS(png_structrp png_ptr, png_inforp info_ptr,
+ 
+    if (trans_alpha != NULL)
+    {
++       /* Snapshot the caller's trans_alpha before freeing, in case it
++        * points to info_ptr->trans_alpha (getter-to-setter aliasing).
++        */
++       png_byte safe_trans[PNG_MAX_PALETTE_LENGTH];
++
++       if (num_trans > 0 && num_trans <= PNG_MAX_PALETTE_LENGTH)
++          memcpy(safe_trans, trans_alpha, (size_t)num_trans);
++
++       trans_alpha = safe_trans;
++
+        png_free_data(png_ptr, info_ptr, PNG_FREE_TRNS, 0);
+ 
+        if (num_trans > 0 && num_trans <= PNG_MAX_PALETTE_LENGTH)
+diff --git a/tests/pnggetset b/tests/pnggetset
+new file mode 100755
+index 000000000..57ef731a5
+--- /dev/null
++++ b/tests/pnggetset
+@@ -0,0 +1,5 @@
++#!/bin/sh
++
++# pnggetset test:
++# Getter-to-setter roundtrips for various chunk types.
++exec ./pnggetset
+-- 
+2.51.0
+
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch
new file mode 100644
index 0000000000..7d58ead18d
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch
@@ -0,0 +1,484 @@
+From 2d1c6585d356832bb679ad4d313f5ea542e02064 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Mon, 30 Mar 2026 17:43:05 +0300
+Subject: [PATCH] fix: Handle getter-to-setter aliasing in append-style
+ chunk setters
+
+Apply the same class of robustness fix from the previous commit to
+`png_set_text`, `png_set_sPLT` and `png_set_unknown_chunks`. These
+append-style setters used `png_realloc_array` to grow the internal
+array, then freed the old array before copying from the caller's
+input. If the caller's pointer was obtained from the corresponding
+getter, it aliased the freed array.
+
+The fix defers the freeing of the old array until after the copy loop.
+
+Also extend the pnggetset regression test to cover all three setters.
+
+CVE: CVE-2026-34757
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/55d20aaa322c9274491cda82c5cd4f99b48c6bcc]
+
+(cherry picked from commit 55d20aaa322c9274491cda82c5cd4f99b48c6bcc)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ contrib/libtests/pnggetset.c | 330 ++++++++++++++++++++++++++++++++++-
+ pngset.c                     |  25 ++-
+ 2 files changed, 347 insertions(+), 8 deletions(-)
+
+diff --git a/contrib/libtests/pnggetset.c b/contrib/libtests/pnggetset.c
+index b42508094..6ae43dc66 100644
+--- a/contrib/libtests/pnggetset.c
++++ b/contrib/libtests/pnggetset.c
+@@ -6,12 +6,12 @@
+  * For conditions of distribution and use, see the disclaimer
+  * and license in png.h
+  *
+- * Test the get-then-set roundtrip pattern for PLTE, tRNS, and hIST.
++ * Test the get-then-set roundtrip for chunk types whose getters return
++ * a pointer to internal storage.
+  *
+- * Passing the internal pointer returned by a getter back into the
+- * corresponding setter is a natural API usage pattern.  A previous
+- * version had a use-after-free on this path because the setter freed
+- * the internal buffer before copying from the caller-supplied pointer.
++ * Passing such a pointer back into the corresponding setter must not
++ * cause a use-after-free.  A previous version freed the internal buffer
++ * before copying from the caller-supplied pointer.
+  */
+ 
+ #include <stdio.h>
+@@ -285,6 +285,290 @@ test_trns_roundtrip(void)
+ }
+ #endif /* PNG_tRNS_SUPPORTED */
+ 
++#ifdef PNG_TEXT_SUPPORTED
++/* Test: get the text array, pass it straight back to set, verify data. */
++#define TEXT_COUNT 6 /* enough to trigger reallocation on the second set */
++static int
++test_text_roundtrip(void)
++{
++   png_structp png_ptr;
++   png_infop info_ptr;
++   png_text text_entries[TEXT_COUNT];
++   png_textp got_text = NULL;
++   int got_num_text = 0;
++   int i;
++
++   /* Recognizable keys and values. */
++   static const char *keys[TEXT_COUNT] = {
++      "Title", "Author", "Desc", "Copyright", "Source", "Comment"
++   };
++   static const char *vals[TEXT_COUNT] = {
++      "t0", "t1", "t2", "t3", "t4", "t5"
++   };
++
++   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
++       NULL, NULL, NULL);
++   if (png_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
++      return 1;
++   }
++
++   info_ptr = png_create_info_struct(png_ptr);
++   if (info_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
++      png_destroy_write_struct(&png_ptr, NULL);
++      return 1;
++   }
++
++   if (setjmp(png_jmpbuf(png_ptr)))
++   {
++      fprintf(stderr, "pnggetset: libpng error in test_text_roundtrip\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* Populate the text entries. */
++   memset(text_entries, 0, sizeof text_entries);
++   for (i = 0; i < TEXT_COUNT; i++)
++   {
++      text_entries[i].compression = PNG_TEXT_COMPRESSION_NONE;
++      text_entries[i].key = (png_charp)keys[i];
++      text_entries[i].text = (png_charp)vals[i];
++   }
++   png_set_text(png_ptr, info_ptr, text_entries, TEXT_COUNT);
++
++   /* Get the internal pointer and feed it straight back (append). */
++   png_get_text(png_ptr, info_ptr, &got_text, &got_num_text);
++   if (got_text == NULL || got_num_text != TEXT_COUNT)
++   {
++      fprintf(stderr, "pnggetset: png_get_text returned unexpected values\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* This is the critical call: got_text aliases info_ptr->text. */
++   png_set_text(png_ptr, info_ptr, got_text, got_num_text);
++
++   /* Verify the original entries survived. */
++   got_text = NULL;
++   got_num_text = 0;
++   png_get_text(png_ptr, info_ptr, &got_text, &got_num_text);
++   if (got_text == NULL || got_num_text != TEXT_COUNT * 2)
++   {
++      fprintf(stderr, "pnggetset: text count %d, expected %d after roundtrip\n",
++          got_num_text, TEXT_COUNT * 2);
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++   for (i = 0; i < TEXT_COUNT; i++)
++   {
++      if (got_text[i].key == NULL ||
++          strcmp(got_text[i].key, keys[i]) != 0 ||
++          got_text[i].text == NULL ||
++          strcmp(got_text[i].text, vals[i]) != 0)
++      {
++         fprintf(stderr,
++             "pnggetset: text entry %d corrupted after roundtrip\n", i);
++         png_destroy_write_struct(&png_ptr, &info_ptr);
++         return 1;
++      }
++   }
++
++   png_destroy_write_struct(&png_ptr, &info_ptr);
++   return 0;
++}
++#undef TEXT_COUNT
++#endif /* PNG_TEXT_SUPPORTED */
++
++#ifdef PNG_sPLT_SUPPORTED
++/* Test: get the sPLT array, pass it straight back to set, verify data. */
++static int
++test_splt_roundtrip(void)
++{
++   png_structp png_ptr;
++   png_infop info_ptr;
++   png_sPLT_t splt;
++   png_sPLT_entry splt_entries[4];
++   png_sPLT_tp got_spalettes = NULL;
++   int got_num, i;
++
++   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
++       NULL, NULL, NULL);
++   if (png_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
++      return 1;
++   }
++
++   info_ptr = png_create_info_struct(png_ptr);
++   if (info_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
++      png_destroy_write_struct(&png_ptr, NULL);
++      return 1;
++   }
++
++   if (setjmp(png_jmpbuf(png_ptr)))
++   {
++      fprintf(stderr, "pnggetset: libpng error in test_splt_roundtrip\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* Populate with recognizable values. */
++   memset(splt_entries, 0, sizeof splt_entries);
++   for (i = 0; i < 4; i++)
++   {
++      splt_entries[i].red = (png_uint_16)(i * 1000);
++      splt_entries[i].green = (png_uint_16)(i * 2000);
++      splt_entries[i].blue = (png_uint_16)(i * 3000);
++      splt_entries[i].alpha = 0xffffU;
++      splt_entries[i].frequency = (png_uint_16)(i + 1);
++   }
++   memset(&splt, 0, sizeof splt);
++   splt.name = (png_charp)"test_sPLT";
++   splt.depth = 16;
++   splt.entries = splt_entries;
++   splt.nentries = 4;
++
++   png_set_sPLT(png_ptr, info_ptr, &splt, 1);
++
++   /* Get the internal pointer and feed it straight back (append). */
++   got_num = png_get_sPLT(png_ptr, info_ptr, &got_spalettes);
++   if (got_spalettes == NULL || got_num != 1)
++   {
++      fprintf(stderr, "pnggetset: png_get_sPLT returned unexpected values\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* This is the critical call: got_spalettes aliases internal storage. */
++   png_set_sPLT(png_ptr, info_ptr, got_spalettes, got_num);
++
++   /* Verify the original entry survived. */
++   got_spalettes = NULL;
++   got_num = png_get_sPLT(png_ptr, info_ptr, &got_spalettes);
++   if (got_spalettes == NULL || got_num != 2)
++   {
++      fprintf(stderr, "pnggetset: sPLT count %d, expected 2 after roundtrip\n",
++          got_num);
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++   if (strcmp(got_spalettes[0].name, "test_sPLT") != 0 ||
++       got_spalettes[0].nentries != 4 ||
++       got_spalettes[0].depth != 16)
++   {
++      fprintf(stderr,
++          "pnggetset: sPLT entry 0 corrupted after roundtrip\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++   for (i = 0; i < 4; i++)
++   {
++      if (got_spalettes[0].entries[i].red != (png_uint_16)(i * 1000) ||
++          got_spalettes[0].entries[i].green != (png_uint_16)(i * 2000) ||
++          got_spalettes[0].entries[i].blue != (png_uint_16)(i * 3000))
++      {
++         fprintf(stderr,
++             "pnggetset: sPLT[0] entry %d corrupted after roundtrip\n", i);
++         png_destroy_write_struct(&png_ptr, &info_ptr);
++         return 1;
++      }
++   }
++
++   png_destroy_write_struct(&png_ptr, &info_ptr);
++   return 0;
++}
++#endif /* PNG_sPLT_SUPPORTED */
++
++#ifdef PNG_STORE_UNKNOWN_CHUNKS_SUPPORTED
++/* Test: get unknown chunks, pass them straight back to set, verify data. */
++static int
++test_unknown_roundtrip(void)
++{
++   png_structp png_ptr;
++   png_infop info_ptr;
++   png_unknown_chunk unk;
++   png_unknown_chunkp got_unknowns = NULL;
++   int got_num;
++   static const png_byte test_data[] = {0xde, 0xad, 0xbe, 0xef};
++
++   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
++       NULL, NULL, NULL);
++   if (png_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
++      return 1;
++   }
++
++   info_ptr = png_create_info_struct(png_ptr);
++   if (info_ptr == NULL)
++   {
++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
++      png_destroy_write_struct(&png_ptr, NULL);
++      return 1;
++   }
++
++   if (setjmp(png_jmpbuf(png_ptr)))
++   {
++      fprintf(stderr,
++          "pnggetset: libpng error in test_unknown_roundtrip\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* Set up an unknown chunk with recognizable data. */
++   memset(&unk, 0, sizeof unk);
++   memcpy(unk.name, "teSt", 5);
++   unk.data = (png_bytep)test_data;
++   unk.size = sizeof test_data;
++   unk.location = PNG_HAVE_IHDR;
++
++   png_set_keep_unknown_chunks(png_ptr, PNG_HANDLE_CHUNK_ALWAYS, NULL, 0);
++   png_set_unknown_chunks(png_ptr, info_ptr, &unk, 1);
++
++   /* Get the internal pointer and feed it straight back (append). */
++   got_num = png_get_unknown_chunks(png_ptr, info_ptr, &got_unknowns);
++   if (got_unknowns == NULL || got_num != 1)
++   {
++      fprintf(stderr,
++          "pnggetset: png_get_unknown_chunks returned unexpected values\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   /* This is the critical call: got_unknowns aliases internal storage. */
++   png_set_unknown_chunks(png_ptr, info_ptr, got_unknowns, got_num);
++
++   /* Verify the original entry survived. */
++   got_unknowns = NULL;
++   got_num = png_get_unknown_chunks(png_ptr, info_ptr, &got_unknowns);
++   if (got_unknowns == NULL || got_num != 2)
++   {
++      fprintf(stderr,
++          "pnggetset: unknown_chunks count %d, expected 2 after roundtrip\n",
++          got_num);
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++   if (memcmp(got_unknowns[0].name, "teSt", 4) != 0 ||
++       got_unknowns[0].size != sizeof test_data ||
++       memcmp(got_unknowns[0].data, test_data, sizeof test_data) != 0)
++   {
++      fprintf(stderr,
++          "pnggetset: unknown chunk 0 corrupted after roundtrip\n");
++      png_destroy_write_struct(&png_ptr, &info_ptr);
++      return 1;
++   }
++
++   png_destroy_write_struct(&png_ptr, &info_ptr);
++   return 0;
++}
++#endif /* PNG_STORE_UNKNOWN_CHUNKS_SUPPORTED */
++
+ int
+ main(void)
+ {
+@@ -324,5 +608,41 @@ main(void)
+       printf("PASS\n");
+ #endif
+ 
++#ifdef PNG_TEXT_SUPPORTED
++   printf("Testing tEXt get-then-set roundtrip... ");
++   fflush(stdout);
++   if (test_text_roundtrip() != 0)
++   {
++      printf("FAIL\n");
++      result = 1;
++   }
++   else
++      printf("PASS\n");
++#endif
++
++#ifdef PNG_sPLT_SUPPORTED
++   printf("Testing sPLT get-then-set roundtrip... ");
++   fflush(stdout);
++   if (test_splt_roundtrip() != 0)
++   {
++      printf("FAIL\n");
++      result = 1;
++   }
++   else
++      printf("PASS\n");
++#endif
++
++#ifdef PNG_STORE_UNKNOWN_CHUNKS_SUPPORTED
++   printf("Testing unknown chunks get-then-set roundtrip... ");
++   fflush(stdout);
++   if (test_unknown_roundtrip() != 0)
++   {
++      printf("FAIL\n");
++      result = 1;
++   }
++   else
++      printf("PASS\n");
++#endif
++
+    return result;
+ }
+diff --git a/pngset.c b/pngset.c
+index 9f5c44510..9ffaf2b5a 100644
+--- a/pngset.c
++++ b/pngset.c
+@@ -789,6 +789,7 @@ png_set_text_2(png_const_structrp png_ptr, png_inforp info_ptr,
+     png_const_textp text_ptr, int num_text)
+ {
+    int i;
++   png_textp old_text = NULL;
+ 
+    png_debug1(1, "in text storage function, chunk typeid = 0x%lx",
+       png_ptr == NULL ? 0xabadca11UL : (unsigned long)png_ptr->chunk_name);
+@@ -836,7 +837,10 @@ png_set_text_2(png_const_structrp png_ptr, png_inforp info_ptr,
+          return 1;
+       }
+ 
+-      png_free(png_ptr, info_ptr->text);
++      /* Defer freeing the old array until after the copy loop below,
++       * in case text_ptr aliases info_ptr->text (getter-to-setter).
++       */
++      old_text = info_ptr->text;
+ 
+       info_ptr->text = new_text;
+       info_ptr->free_me |= PNG_FREE_TEXT;
+@@ -921,6 +925,7 @@ png_set_text_2(png_const_structrp png_ptr, png_inforp info_ptr,
+       {
+          png_chunk_report(png_ptr, "text chunk: out of memory",
+              PNG_CHUNK_WRITE_ERROR);
++         png_free(png_ptr, old_text);
+ 
+          return 1;
+       }
+@@ -974,6 +979,8 @@ png_set_text_2(png_const_structrp png_ptr, png_inforp info_ptr,
+       png_debug1(3, "transferred text chunk %d", info_ptr->num_text);
+    }
+ 
++   png_free(png_ptr, old_text);
++
+    return 0;
+ }
+ #endif
+@@ -1112,6 +1119,7 @@ png_set_sPLT(png_const_structrp png_ptr,
+  */
+ {
+    png_sPLT_tp np;
++   png_sPLT_tp old_spalettes;
+ 
+    png_debug1(1, "in %s storage function", "sPLT");
+ 
+@@ -1132,7 +1140,10 @@ png_set_sPLT(png_const_structrp png_ptr,
+       return;
+    }
+ 
+-   png_free(png_ptr, info_ptr->splt_palettes);
++   /* Defer freeing the old array until after the copy loop below,
++    * in case entries aliases info_ptr->splt_palettes (getter-to-setter).
++    */
++   old_spalettes = info_ptr->splt_palettes;
+ 
+    info_ptr->splt_palettes = np;
+    info_ptr->free_me |= PNG_FREE_SPLT;
+@@ -1196,6 +1207,8 @@ png_set_sPLT(png_const_structrp png_ptr,
+    }
+    while (--nentries);
+ 
++   png_free(png_ptr, old_spalettes);
++
+    if (nentries > 0)
+       png_chunk_report(png_ptr, "sPLT out of memory", PNG_CHUNK_WRITE_ERROR);
+ }
+@@ -1244,6 +1257,7 @@ png_set_unknown_chunks(png_const_structrp png_ptr,
+     png_inforp info_ptr, png_const_unknown_chunkp unknowns, int num_unknowns)
+ {
+    png_unknown_chunkp np;
++   png_unknown_chunkp old_unknowns;
+ 
+    if (png_ptr == NULL || info_ptr == NULL || num_unknowns <= 0 ||
+        unknowns == NULL)
+@@ -1290,7 +1304,10 @@ png_set_unknown_chunks(png_const_structrp png_ptr,
+       return;
+    }
+ 
+-   png_free(png_ptr, info_ptr->unknown_chunks);
++   /* Defer freeing the old array until after the copy loop below,
++    * in case unknowns aliases info_ptr->unknown_chunks (getter-to-setter).
++    */
++   old_unknowns = info_ptr->unknown_chunks;
+ 
+    info_ptr->unknown_chunks = np; /* safe because it is initialized */
+    info_ptr->free_me |= PNG_FREE_UNKN;
+@@ -1336,6 +1353,8 @@ png_set_unknown_chunks(png_const_structrp png_ptr,
+       ++np;
+       ++(info_ptr->unknown_chunks_num);
+    }
++
++   png_free(png_ptr, old_unknowns);
+ }
+ 
+ void PNGAPI
+-- 
+2.51.0
+
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index e4cc63686e..b226e327b6 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -29,6 +29,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2026-33416-02.patch \
            file://CVE-2026-33416-03.patch \
            file://CVE-2026-33416-04.patch \
+           file://CVE-2026-34757_p1.patch \
+           file://CVE-2026-34757_p2.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
@@ -66,7 +68,7 @@ do_install_ptest() {
     install -m 644 ${S}/contrib/tools/*.c ${S}/contrib/tools/*.h ${D}${PTEST_PATH}/src/contrib/tools
 
     # Install .libs directory binaries to ptest path
-    install -m 755 ${B}/.libs/pngtest ${B}/.libs/pngstest ${B}/.libs/pngimage ${B}/.libs/pngunknown ${B}/.libs/pngvalid ${D}${PTEST_PATH}/src
+    install -m 755 ${B}/.libs/pngtest ${B}/.libs/pnggetset ${B}/.libs/pngstest ${B}/.libs/pngimage ${B}/.libs/pngunknown ${B}/.libs/pngvalid ${D}${PTEST_PATH}/src
 
     # Copy png files to ptest path
     cd ${S} && find contrib -name '*.png' | cpio -pd ${D}${PTEST_PATH}/src
-- 
2.51.0


