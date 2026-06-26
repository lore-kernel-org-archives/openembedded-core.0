Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A813C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:28:37 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36550.1782484110205691247
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uSui0xSh;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-464192ab2e1so717935f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 07:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782484108; x=1783088908; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWlf1Xe1Izt6jbHQxp3MEmzvz+CnjyQV59Bm7SFZ8ww=;
        b=uSui0xShScOGGwEpP0BY/jbZFxsezjZhiSDW6xwey+A23/YxjzN4UKDTxL/zxO4lJl
         Rbkccb8nYIhRvo1+aWtK8dewJrHhXoe1f2Y3vDxoXsoMWh4Dv9WXCS1x7pLlcjhRi3yL
         R/BzVwwpkx3NO9OMjNjWQX5PiCHMb2bWquh8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782484108; x=1783088908;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iWlf1Xe1Izt6jbHQxp3MEmzvz+CnjyQV59Bm7SFZ8ww=;
        b=LLUYJv9b62wbM0d7Y86HL98PHnfvXU2JFnIKHORs8ejn8bj+trveKwGWgGNzixd+M4
         VSPHCZk5jUBEB/c7q90xx+xG2ZrXOK+1LXk7I+MQxdFGukS96va7lOrYX/ouLep+OySp
         MFqRAzWgvw2yglrKyB3Uqvz1/PTZUpVUYuI3Z0wQzBCGhfmVT6OxsEpslAe3TMXBuc27
         0zXPH1pEJkBZYiMAEbRXQT2EWx6/d42l2DYUJVcfs0m3FtC8xtyCTlYn1PNfxF8dA97S
         qJVSz96oDb86Eye5XAgG3FM4r2hnCSIX9AlY5uwoBiALvd6pWUj5OKzbLl6d/UCNUHj7
         g62A==
X-Forwarded-Encrypted: i=1; AHgh+RpnmtkoxeUv4EgeTr3phuNVVDrJzRNpoOxVyJQsa0SaATxkbri03wg1zf0vt9VyqOY8GGPLuAt3rvVv9QJNtFS9xQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YykzoSm9vOKj8PXkBDlDYgWIzSPIaUUAsNU+wy8tzVIn8wcjC5Z
	Hl8Hic/MbyW44mpc2ct9HV5fqkDcViRsFaeqYCxD3JmNYM+oALzNbRNdEcxyfJMC+tI=
X-Gm-Gg: AfdE7cl8EQS5TDyHRxhyRI0HwA2Jz4L0Mf6PQgJHwtnzq2PMq8YATg01WNkZMRRgGo3
	l0cNMfjNb+d8koqW9zqm27Eowg8QhqiGmcX0xIlmXe4L/h9cAHyRb5gi0Jb2MHCOEBw9+F5SgVk
	RG9e9QFUgUNwcDPqiPJv2Rde/oa6gIVXwlVOAITbrQBazDvjebvYZAuTrjAlkqJ2dDmVuWWO/Lc
	fezy/P/vSy256sEqsrZJGAyv48eOjdSQ+E9w3se4x7VAHhxYhlkXlONhyDAn1AfRnwuf3miLk8c
	7GiTxM79zyMM1ptZzunFg3z9NkL6x2pHhG1XLbtG4wWJQGM80svbLJQEMPjToDizKN4CVXg8Fsk
	yepQo32eo/9r83lMuFeTVr+0vThGV5o+jn1/zvFeMF82uUu3oL1tibaKeUKr/9PS1tlRYXX4TEJ
	tPRtdkd6Is+8w0Jn3zHqblF1gpb46b5SjCGwGKDF3BiyochbzYFpNbnT9X4Mr+/UuJWWiGxFoUL
	nJ2rw==
X-Received: by 2002:a05:6000:46ca:b0:460:2ee5:67b8 with SMTP id ffacd0b85a97d-46dc14cbc9cmr8152308f8f.36.1782484107896;
        Fri, 26 Jun 2026 07:28:27 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d998esm24577965f8f.24.2026.06.26.07.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 07:28:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 16:28:26 +0200
Message-Id: <DJJ1VQ85GDU1.2F6PDWUSCET4Z@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] libpng: Fix CVE-2026-34757
X-Mailer: aerc 0.20.0
References: <20260605092815.976425-2-sudumbha@cisco.com>
In-Reply-To: <20260605092815.976425-2-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 14:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239637

On Fri Jun 5, 2026 at 11:28 AM CEST, Sudhir Dumbhare via lists.openembedded=
.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> These patches apply the upstream fixes [1][2], which address
> getter-to-setter aliasing issues in libpng chunk setters that could
> cause stale-pointer reads, as described in [3].
>
> [1] https://github.com/pnggroup/libpng/commit/398cbe3df03f4e11bb031e07f41=
6dfdde3684e8a
> [2] https://github.com/pnggroup/libpng/commit/55d20aaa322c9274491cda82c5c=
d4f99b48c6bcc
> [3] https://github.com/pnggroup/libpng/issues/836
>
> Reference:
> https://security-tracker.debian.org/tracker/CVE-2026-34757
> https://nvd.nist.gov/vuln/detail/CVE-2026-34757
>
> Test results on qemux86-64 using ptest-runner:
> START: ptest-runner
> 2026-06-04T11:29
> BEGIN: /usr/lib/libpng/ptest
> PASS: tests/pnggetset
> Testsuite summary
> # TOTAL: 33
> # PASS:  33
> # SKIP:  0
> # XFAIL: 0
> # FAIL:  0
> # XPASS: 0
> # ERROR: 0
> DURATION: 80
> END: /usr/lib/libpng/ptest
> 2026-06-04T11:31
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---

Hello,

That patch fails to apply on the latest scarthgap. I guess
your patch conflict with
https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=3D2=
bf388381ae3de76db288a859040c1130786d41b

Can you please rebase and send a v2?

Thanks!

>  .../libpng/files/CVE-2026-34757_p1.patch      | 518 ++++++++++++++++++
>  .../libpng/files/CVE-2026-34757_p2.patch      | 481 ++++++++++++++++
>  .../libpng/libpng_1.6.42.bb                   |   4 +-
>  3 files changed, 1002 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p=
1.patch
>  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p=
2.patch
>
> diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch=
 b/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
> new file mode 100644
> index 0000000000..1b921e6456
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
> @@ -0,0 +1,518 @@
> +From 0637603fccfb8521cecdc135f7938219d4838b7f Mon Sep 17 00:00:00 2001
> +From: Cosmin Truta <ctruta@gmail.com>
> +Date: Mon, 30 Mar 2026 17:35:30 +0300
> +Subject: [PATCH] fix: Handle self-referencing pointers in getter-to-sett=
er
> + aliasing
> +
> +Apply a robustness fix for a caller-side API usage pattern involving
> +the getters and the setters for PLTE, tRNS, and hIST.
> +
> +Passing a pointer returned by the PLTE, tRNS, or hIST getters back
> +into the corresponding setters used to cause the setters to read from
> +a stale pointer. The fix consists in snapshotting the caller's data
> +into a stack-local buffer before freeing the old internal storage.
> +
> +Fixes pnggroup/libpng#836
> +
> +CVE: CVE-2026-34757
> +Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/398=
cbe3df03f4e11bb031e07f416dfdde3684e8a]
> +
> +Reported-by: Iv4n <Iv4n550@noreply.github.com>
> +(cherry picked from commit 398cbe3df03f4e11bb031e07f416dfdde3684e8a)
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + CMakeLists.txt               |  12 ++
> + Makefile.am                  |   9 +-
> + contrib/libtests/pnggetset.c | 328 +++++++++++++++++++++++++++++++++++
> + pngset.c                     |  29 +++-
> + tests/pnggetset              |   5 +
> + 5 files changed, 380 insertions(+), 3 deletions(-)
> + create mode 100644 contrib/libtests/pnggetset.c
> + create mode 100755 tests/pnggetset
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 93a2c3434..8888d15cb 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -591,6 +591,9 @@ set(pngvalid_sources
> + set(pngstest_sources
> +     contrib/libtests/pngstest.c
> + )
> ++set(pnggetset_sources
> ++    contrib/libtests/pnggetset.c
> ++)
> + set(pngunknown_sources
> +     contrib/libtests/pngunknown.c
> + )
> +@@ -758,6 +761,15 @@ if(PNG_TESTS AND PNG_SHARED)
> +                COMMAND pngtest
> +                FILES "${PNGTEST_PNG}")
> +=20
> ++  # pnggetset test:
> ++  # Getter-to-setter roundtrips for various chunk types.
> ++  add_executable(pnggetset ${pnggetset_sources})
> ++  target_link_libraries(pnggetset
> ++                        PRIVATE png_shared)
> ++
> ++  png_add_test(NAME pnggetset
> ++               COMMAND pnggetset)
> ++
> +   add_executable(pngvalid ${pngvalid_sources})
> +   target_link_libraries(pngvalid PRIVATE png_shared)
> +=20
> +diff --git a/Makefile.am b/Makefile.am
> +index 1f06c703a..bdb40c61c 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -13,7 +13,7 @@ ACLOCAL_AMFLAGS =3D -I scripts/autoconf
> +=20
> + # test programs - run on make check, make distcheck
> + if ENABLE_TESTS
> +-check_PROGRAMS=3D pngtest pngunknown pngstest pngvalid pngimage pngcp
> ++check_PROGRAMS=3D pngtest pnggetset pngunknown pngstest pngvalid pngima=
ge pngcp
> + if HAVE_CLOCK_GETTIME
> + check_PROGRAMS +=3D timepng
> + endif
> +@@ -42,6 +42,9 @@ if ENABLE_TESTS
> + pngtest_SOURCES =3D pngtest.c
> + pngtest_LDADD =3D libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.la
> +=20
> ++pnggetset_SOURCES =3D contrib/libtests/pnggetset.c
> ++pnggetset_LDADD =3D libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.la
> ++
> + pngvalid_SOURCES =3D contrib/libtests/pngvalid.c
> + pngvalid_LDADD =3D libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.la
> +=20
> +@@ -75,6 +78,7 @@ TESTS =3D\
> +    tests/pngtest-all\
> +    tests/pngvalid-gamma-16-to-8 tests/pngvalid-gamma-alpha-mode\
> +    tests/pngvalid-gamma-background tests/pngvalid-gamma-expand16-alpha-=
mode\
> ++   tests/pnggetset\
> +    tests/pngvalid-gamma-expand16-background\
> +    tests/pngvalid-gamma-expand16-transform tests/pngvalid-gamma-sbit\
> +    tests/pngvalid-gamma-threshold tests/pngvalid-gamma-transform\
> +@@ -273,9 +277,10 @@ $(srcdir)/scripts/pnglibconf.h.prebuilt:
> + pngtest.o: pnglibconf.h
> +=20
> + contrib/libtests/makepng.o: pnglibconf.h
> ++contrib/libtests/pnggetset.o: pnglibconf.h
> ++contrib/libtests/pngimage.o: pnglibconf.h
> + contrib/libtests/pngstest.o: pnglibconf.h
> + contrib/libtests/pngunknown.o: pnglibconf.h
> +-contrib/libtests/pngimage.o: pnglibconf.h
> + contrib/libtests/pngvalid.o: pnglibconf.h
> + contrib/libtests/readpng.o: pnglibconf.h
> + contrib/libtests/tarith.o: pnglibconf.h
> +diff --git a/contrib/libtests/pnggetset.c b/contrib/libtests/pnggetset.c
> +new file mode 100644
> +index 000000000..b42508094
> +--- /dev/null
> ++++ b/contrib/libtests/pnggetset.c
> +@@ -0,0 +1,328 @@
> ++/* pnggetset.c
> ++ *
> ++ * Copyright (c) 2026 Cosmin Truta
> ++ *
> ++ * This code is released under the libpng license.
> ++ * For conditions of distribution and use, see the disclaimer
> ++ * and license in png.h
> ++ *
> ++ * Test the get-then-set roundtrip pattern for PLTE, tRNS, and hIST.
> ++ *
> ++ * Passing the internal pointer returned by a getter back into the
> ++ * corresponding setter is a natural API usage pattern.  A previous
> ++ * version had a use-after-free on this path because the setter freed
> ++ * the internal buffer before copying from the caller-supplied pointer.
> ++ */
> ++
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++
> ++#if defined(HAVE_CONFIG_H) && !defined(PNG_NO_CONFIG_H)
> ++#  include <config.h>
> ++#endif
> ++
> ++#ifdef PNG_FREESTANDING_TESTS
> ++#  include <png.h>
> ++#else
> ++#  include "../../png.h"
> ++#endif
> ++
> ++/* Test: get the PLTE, pass it straight back to set, verify roundtrip. =
*/
> ++static int
> ++test_plte_roundtrip(void)
> ++{
> ++   png_structp png_ptr;
> ++   png_infop info_ptr;
> ++   png_color palette[4];
> ++   png_colorp got_palette =3D NULL;
> ++   int num_palette =3D 0;
> ++   int i;
> ++
> ++   png_ptr =3D png_create_write_struct(PNG_LIBPNG_VER_STRING,
> ++       NULL, NULL, NULL);
> ++   if (png_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
> ++      return 1;
> ++   }
> ++
> ++   info_ptr =3D png_create_info_struct(png_ptr);
> ++   if (info_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
> ++      png_destroy_write_struct(&png_ptr, NULL);
> ++      return 1;
> ++   }
> ++
> ++   if (setjmp(png_jmpbuf(png_ptr)))
> ++   {
> ++      fprintf(stderr, "pnggetset: libpng error in test_plte_roundtrip\n=
");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* Set up a palette-color image header. */
> ++   png_set_IHDR(png_ptr, info_ptr, 1, 1, 8, PNG_COLOR_TYPE_PALETTE,
> ++       PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_B=
ASE);
> ++
> ++   /* Populate with recognizable values. */
> ++   for (i =3D 0; i < 4; i++)
> ++   {
> ++      palette[i].red   =3D (png_byte)(i * 10);
> ++      palette[i].green =3D (png_byte)(i * 20);
> ++      palette[i].blue  =3D (png_byte)(i * 30);
> ++   }
> ++   png_set_PLTE(png_ptr, info_ptr, palette, 4);
> ++
> ++   /* Get the internal pointer and feed it straight back. */
> ++   png_get_PLTE(png_ptr, info_ptr, &got_palette, &num_palette);
> ++   if (got_palette =3D=3D NULL || num_palette !=3D 4)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_get_PLTE returned unexpected valu=
es\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* This is the critical call: the pointer aliases info_ptr->palette.=
 */
> ++   png_set_PLTE(png_ptr, info_ptr, got_palette, num_palette);
> ++
> ++   /* Verify the data survived the roundtrip. */
> ++   got_palette =3D NULL;
> ++   num_palette =3D 0;
> ++   png_get_PLTE(png_ptr, info_ptr, &got_palette, &num_palette);
> ++   if (got_palette =3D=3D NULL || num_palette !=3D 4)
> ++   {
> ++      fprintf(stderr, "pnggetset: PLTE lost after roundtrip\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++   for (i =3D 0; i < 4; i++)
> ++   {
> ++      if (got_palette[i].red   !=3D (png_byte)(i * 10) ||
> ++          got_palette[i].green !=3D (png_byte)(i * 20) ||
> ++          got_palette[i].blue  !=3D (png_byte)(i * 30))
> ++      {
> ++         fprintf(stderr,
> ++             "pnggetset: PLTE entry %d corrupted after roundtrip\n", i)=
;
> ++         png_destroy_write_struct(&png_ptr, &info_ptr);
> ++         return 1;
> ++      }
> ++   }
> ++
> ++   png_destroy_write_struct(&png_ptr, &info_ptr);
> ++   return 0;
> ++}
> ++
> ++#ifdef PNG_hIST_SUPPORTED
> ++/* Test: get the hIST, pass it straight back to set, verify roundtrip. =
*/
> ++static int
> ++test_hist_roundtrip(void)
> ++{
> ++   png_structp png_ptr;
> ++   png_infop info_ptr;
> ++   png_color palette[4];
> ++   png_uint_16 hist[4];
> ++   png_uint_16p got_hist =3D NULL;
> ++   int i;
> ++
> ++   png_ptr =3D png_create_write_struct(PNG_LIBPNG_VER_STRING,
> ++       NULL, NULL, NULL);
> ++   if (png_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
> ++      return 1;
> ++   }
> ++
> ++   info_ptr =3D png_create_info_struct(png_ptr);
> ++   if (info_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
> ++      png_destroy_write_struct(&png_ptr, NULL);
> ++      return 1;
> ++   }
> ++
> ++   if (setjmp(png_jmpbuf(png_ptr)))
> ++   {
> ++      fprintf(stderr, "pnggetset: libpng error in test_hist_roundtrip\n=
");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* Set up a palette-color image header. */
> ++   memset(palette, 0, sizeof palette);
> ++   png_set_IHDR(png_ptr, info_ptr, 1, 1, 8, PNG_COLOR_TYPE_PALETTE,
> ++       PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_B=
ASE);
> ++   png_set_PLTE(png_ptr, info_ptr, palette, 4);
> ++
> ++   /* Populate with recognizable values. */
> ++   for (i =3D 0; i < 4; i++)
> ++      hist[i] =3D (png_uint_16)(i * 100 + 42);
> ++
> ++   png_set_hIST(png_ptr, info_ptr, hist);
> ++
> ++   /* Get the internal pointer and feed it straight back. */
> ++   if (png_get_hIST(png_ptr, info_ptr, &got_hist) =3D=3D 0 || got_hist =
=3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_get_hIST returned unexpected valu=
es\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* This is the critical call: the pointer aliases info_ptr->hist. */
> ++   png_set_hIST(png_ptr, info_ptr, got_hist);
> ++
> ++   /* Verify the data survived the roundtrip. */
> ++   got_hist =3D NULL;
> ++   if (png_get_hIST(png_ptr, info_ptr, &got_hist) =3D=3D 0 || got_hist =
=3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: hIST lost after roundtrip\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++   for (i =3D 0; i < 4; i++)
> ++   {
> ++      if (got_hist[i] !=3D (png_uint_16)(i * 100 + 42))
> ++      {
> ++         fprintf(stderr,
> ++             "pnggetset: hIST entry %d corrupted after roundtrip\n", i)=
;
> ++         png_destroy_write_struct(&png_ptr, &info_ptr);
> ++         return 1;
> ++      }
> ++   }
> ++
> ++   png_destroy_write_struct(&png_ptr, &info_ptr);
> ++   return 0;
> ++}
> ++#endif /* PNG_hIST_SUPPORTED */
> ++
> ++#ifdef PNG_tRNS_SUPPORTED
> ++/* Test: get the tRNS, pass it straight back to set, verify roundtrip. =
*/
> ++static int
> ++test_trns_roundtrip(void)
> ++{
> ++   png_structp png_ptr;
> ++   png_infop info_ptr;
> ++   png_color palette[4];
> ++   png_byte trans_alpha[4];
> ++   png_color_16 trans_color;
> ++   png_bytep got_alpha =3D NULL;
> ++   png_color_16p got_color =3D NULL;
> ++   int num_trans =3D 0;
> ++   int i;
> ++
> ++   png_ptr =3D png_create_write_struct(PNG_LIBPNG_VER_STRING,
> ++       NULL, NULL, NULL);
> ++   if (png_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
> ++      return 1;
> ++   }
> ++
> ++   info_ptr =3D png_create_info_struct(png_ptr);
> ++   if (info_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
> ++      png_destroy_write_struct(&png_ptr, NULL);
> ++      return 1;
> ++   }
> ++
> ++   if (setjmp(png_jmpbuf(png_ptr)))
> ++   {
> ++      fprintf(stderr, "pnggetset: libpng error in test_trns_roundtrip\n=
");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* Set up a palette-color image. */
> ++   memset(palette, 0, sizeof palette);
> ++   png_set_IHDR(png_ptr, info_ptr, 1, 1, 8, PNG_COLOR_TYPE_PALETTE,
> ++       PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_B=
ASE);
> ++   png_set_PLTE(png_ptr, info_ptr, palette, 4);
> ++
> ++   /* Populate tRNS with recognizable values. */
> ++   for (i =3D 0; i < 4; i++)
> ++      trans_alpha[i] =3D (png_byte)(0xff - i * 0x11);
> ++   memset(&trans_color, 0, sizeof trans_color);
> ++
> ++   png_set_tRNS(png_ptr, info_ptr, trans_alpha, 4, &trans_color);
> ++
> ++   /* Get the internal pointer and feed it straight back. */
> ++   png_get_tRNS(png_ptr, info_ptr, &got_alpha, &num_trans, &got_color);
> ++   if (got_alpha =3D=3D NULL || num_trans !=3D 4)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_get_tRNS returned unexpected valu=
es\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* This is the critical call: the pointer aliases info_ptr->trans_al=
pha. */
> ++   png_set_tRNS(png_ptr, info_ptr, got_alpha, num_trans, got_color);
> ++
> ++   /* Verify the data survived the roundtrip. */
> ++   got_alpha =3D NULL;
> ++   num_trans =3D 0;
> ++   png_get_tRNS(png_ptr, info_ptr, &got_alpha, &num_trans, &got_color);
> ++   if (got_alpha =3D=3D NULL || num_trans !=3D 4)
> ++   {
> ++      fprintf(stderr, "pnggetset: tRNS lost after roundtrip\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++   for (i =3D 0; i < 4; i++)
> ++   {
> ++      if (got_alpha[i] !=3D (png_byte)(0xff - i * 0x11))
> ++      {
> ++         fprintf(stderr,
> ++             "pnggetset: tRNS entry %d corrupted after roundtrip\n", i)=
;
> ++         png_destroy_write_struct(&png_ptr, &info_ptr);
> ++         return 1;
> ++      }
> ++   }
> ++
> ++   png_destroy_write_struct(&png_ptr, &info_ptr);
> ++   return 0;
> ++}
> ++#endif /* PNG_tRNS_SUPPORTED */
> ++
> ++int
> ++main(void)
> ++{
> ++   int result =3D 0;
> ++
> ++   printf("Testing PLTE get-then-set roundtrip... ");
> ++   fflush(stdout);
> ++   if (test_plte_roundtrip() !=3D 0)
> ++   {
> ++      printf("FAIL\n");
> ++      result =3D 1;
> ++   }
> ++   else
> ++      printf("PASS\n");
> ++
> ++#ifdef PNG_hIST_SUPPORTED
> ++   printf("Testing hIST get-then-set roundtrip... ");
> ++   fflush(stdout);
> ++   if (test_hist_roundtrip() !=3D 0)
> ++   {
> ++      printf("FAIL\n");
> ++      result =3D 1;
> ++   }
> ++   else
> ++      printf("PASS\n");
> ++#endif
> ++
> ++#ifdef PNG_tRNS_SUPPORTED
> ++   printf("Testing tRNS get-then-set roundtrip... ");
> ++   fflush(stdout);
> ++   if (test_trns_roundtrip() !=3D 0)
> ++   {
> ++      printf("FAIL\n");
> ++      result =3D 1;
> ++   }
> ++   else
> ++      printf("PASS\n");
> ++#endif
> ++
> ++   return result;
> ++}
> +diff --git a/pngset.c b/pngset.c
> +index eb1c8c7a3..9b9a008b8 100644
> +--- a/pngset.c
> ++++ b/pngset.c
> +@@ -204,6 +204,7 @@ void PNGAPI
> + png_set_hIST(png_const_structrp png_ptr, png_inforp info_ptr,
> +     png_const_uint_16p hist)
> + {
> ++   png_uint_16 safe_hist[PNG_MAX_PALETTE_LENGTH];
> +    int i;
> +=20
> +    png_debug1(1, "in %s storage function", "hIST");
> +@@ -220,6 +221,13 @@ png_set_hIST(png_const_structrp png_ptr, png_inforp=
 info_ptr,
> +       return;
> +    }
> +=20
> ++   /* Snapshot the caller's hist before freeing, in case it points to
> ++    * info_ptr->hist (getter-to-setter aliasing).
> ++    */
> ++   memcpy(safe_hist, hist, (unsigned int)info_ptr->num_palette *
> ++       (sizeof (png_uint_16)));
> ++   hist =3D safe_hist;
> ++
> +    png_free_data(png_ptr, info_ptr, PNG_FREE_HIST, 0);
> +=20
> +    /* Changed from info->num_palette to PNG_MAX_PALETTE_LENGTH in
> +@@ -561,7 +569,7 @@ void PNGAPI
> + png_set_PLTE(png_structrp png_ptr, png_inforp info_ptr,
> +     png_const_colorp palette, int num_palette)
> + {
> +-
> ++   png_color safe_palette[PNG_MAX_PALETTE_LENGTH];
> +    png_uint_32 max_palette_length;
> +=20
> +    png_debug1(1, "in %s storage function", "PLTE");
> +@@ -602,6 +610,15 @@ png_set_PLTE(png_structrp png_ptr, png_inforp info_=
ptr,
> +     * 1.6.0: the above statement appears to be incorrect; something has=
 to set
> +     * the palette inside png_struct on read.
> +     */
> ++   /* Snapshot the caller's palette before freeing, in case it points t=
o
> ++    * info_ptr->palette (getter-to-setter aliasing).
> ++    */
> ++   if (num_palette > 0)
> ++      memcpy(safe_palette, palette, (unsigned int)num_palette *
> ++          (sizeof (png_color)));
> ++
> ++   palette =3D safe_palette;
> ++
> +    png_free_data(png_ptr, info_ptr, PNG_FREE_PLTE, 0);
> +=20
> +    /* Changed in libpng-1.2.1 to allocate PNG_MAX_PALETTE_LENGTH instea=
d
> +@@ -998,6 +1015,16 @@ png_set_tRNS(png_structrp png_ptr, png_inforp info=
_ptr,
> +         * relies on png_set_tRNS storing the information in png_struct
> +         * (otherwise it won't be there for the code in pngrtran.c).
> +         */
> ++       /* Snapshot the caller's trans_alpha before freeing, in case it
> ++        * points to info_ptr->trans_alpha (getter-to-setter aliasing).
> ++        */
> ++       png_byte safe_trans[PNG_MAX_PALETTE_LENGTH];
> ++
> ++       if (num_trans > 0 && num_trans <=3D PNG_MAX_PALETTE_LENGTH)
> ++          memcpy(safe_trans, trans_alpha, (size_t)num_trans);
> ++
> ++       trans_alpha =3D safe_trans;
> ++
> +=20
> +        png_free_data(png_ptr, info_ptr, PNG_FREE_TRNS, 0);
> +=20
> +diff --git a/tests/pnggetset b/tests/pnggetset
> +new file mode 100755
> +index 000000000..57ef731a5
> +--- /dev/null
> ++++ b/tests/pnggetset
> +@@ -0,0 +1,5 @@
> ++#!/bin/sh
> ++
> ++# pnggetset test:
> ++# Getter-to-setter roundtrips for various chunk types.
> ++exec ./pnggetset
> diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch=
 b/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch
> new file mode 100644
> index 0000000000..a29220a370
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch
> @@ -0,0 +1,481 @@
> +From f9d54efeaf4511be726bbd7a66cdac17f22e18e3 Mon Sep 17 00:00:00 2001
> +From: Cosmin Truta <ctruta@gmail.com>
> +Date: Mon, 30 Mar 2026 17:43:05 +0300
> +Subject: [PATCH] fix: Handle getter-to-setter aliasing in append-style c=
hunk
> + setters
> +
> +Apply the same class of robustness fix from the previous commit to
> +`png_set_text`, `png_set_sPLT` and `png_set_unknown_chunks`. These
> +append-style setters used `png_realloc_array` to grow the internal
> +array, then freed the old array before copying from the caller's
> +input. If the caller's pointer was obtained from the corresponding
> +getter, it aliased the freed array.
> +
> +The fix defers the freeing of the old array until after the copy loop.
> +
> +Also extend the pnggetset regression test to cover all three setters.
> +
> +CVE: CVE-2026-34757
> +Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/55d=
20aaa322c9274491cda82c5cd4f99b48c6bcc]
> +
> +(cherry picked from commit 55d20aaa322c9274491cda82c5cd4f99b48c6bcc)
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + contrib/libtests/pnggetset.c | 330 ++++++++++++++++++++++++++++++++++-
> + pngset.c                     |  25 ++-
> + 2 files changed, 347 insertions(+), 8 deletions(-)
> +
> +diff --git a/contrib/libtests/pnggetset.c b/contrib/libtests/pnggetset.c
> +index b42508094..6ae43dc66 100644
> +--- a/contrib/libtests/pnggetset.c
> ++++ b/contrib/libtests/pnggetset.c
> +@@ -6,12 +6,12 @@
> +  * For conditions of distribution and use, see the disclaimer
> +  * and license in png.h
> +  *
> +- * Test the get-then-set roundtrip pattern for PLTE, tRNS, and hIST.
> ++ * Test the get-then-set roundtrip for chunk types whose getters return
> ++ * a pointer to internal storage.
> +  *
> +- * Passing the internal pointer returned by a getter back into the
> +- * corresponding setter is a natural API usage pattern.  A previous
> +- * version had a use-after-free on this path because the setter freed
> +- * the internal buffer before copying from the caller-supplied pointer.
> ++ * Passing such a pointer back into the corresponding setter must not
> ++ * cause a use-after-free.  A previous version freed the internal buffe=
r
> ++ * before copying from the caller-supplied pointer.
> +  */
> +=20
> + #include <stdio.h>
> +@@ -285,6 +285,290 @@ test_trns_roundtrip(void)
> + }
> + #endif /* PNG_tRNS_SUPPORTED */
> +=20
> ++#ifdef PNG_TEXT_SUPPORTED
> ++/* Test: get the text array, pass it straight back to set, verify data.=
 */
> ++#define TEXT_COUNT 6 /* enough to trigger reallocation on the second se=
t */
> ++static int
> ++test_text_roundtrip(void)
> ++{
> ++   png_structp png_ptr;
> ++   png_infop info_ptr;
> ++   png_text text_entries[TEXT_COUNT];
> ++   png_textp got_text =3D NULL;
> ++   int got_num_text =3D 0;
> ++   int i;
> ++
> ++   /* Recognizable keys and values. */
> ++   static const char *keys[TEXT_COUNT] =3D {
> ++      "Title", "Author", "Desc", "Copyright", "Source", "Comment"
> ++   };
> ++   static const char *vals[TEXT_COUNT] =3D {
> ++      "t0", "t1", "t2", "t3", "t4", "t5"
> ++   };
> ++
> ++   png_ptr =3D png_create_write_struct(PNG_LIBPNG_VER_STRING,
> ++       NULL, NULL, NULL);
> ++   if (png_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
> ++      return 1;
> ++   }
> ++
> ++   info_ptr =3D png_create_info_struct(png_ptr);
> ++   if (info_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
> ++      png_destroy_write_struct(&png_ptr, NULL);
> ++      return 1;
> ++   }
> ++
> ++   if (setjmp(png_jmpbuf(png_ptr)))
> ++   {
> ++      fprintf(stderr, "pnggetset: libpng error in test_text_roundtrip\n=
");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* Populate the text entries. */
> ++   memset(text_entries, 0, sizeof text_entries);
> ++   for (i =3D 0; i < TEXT_COUNT; i++)
> ++   {
> ++      text_entries[i].compression =3D PNG_TEXT_COMPRESSION_NONE;
> ++      text_entries[i].key =3D (png_charp)keys[i];
> ++      text_entries[i].text =3D (png_charp)vals[i];
> ++   }
> ++   png_set_text(png_ptr, info_ptr, text_entries, TEXT_COUNT);
> ++
> ++   /* Get the internal pointer and feed it straight back (append). */
> ++   png_get_text(png_ptr, info_ptr, &got_text, &got_num_text);
> ++   if (got_text =3D=3D NULL || got_num_text !=3D TEXT_COUNT)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_get_text returned unexpected valu=
es\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* This is the critical call: got_text aliases info_ptr->text. */
> ++   png_set_text(png_ptr, info_ptr, got_text, got_num_text);
> ++
> ++   /* Verify the original entries survived. */
> ++   got_text =3D NULL;
> ++   got_num_text =3D 0;
> ++   png_get_text(png_ptr, info_ptr, &got_text, &got_num_text);
> ++   if (got_text =3D=3D NULL || got_num_text !=3D TEXT_COUNT * 2)
> ++   {
> ++      fprintf(stderr, "pnggetset: text count %d, expected %d after roun=
dtrip\n",
> ++          got_num_text, TEXT_COUNT * 2);
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++   for (i =3D 0; i < TEXT_COUNT; i++)
> ++   {
> ++      if (got_text[i].key =3D=3D NULL ||
> ++          strcmp(got_text[i].key, keys[i]) !=3D 0 ||
> ++          got_text[i].text =3D=3D NULL ||
> ++          strcmp(got_text[i].text, vals[i]) !=3D 0)
> ++      {
> ++         fprintf(stderr,
> ++             "pnggetset: text entry %d corrupted after roundtrip\n", i)=
;
> ++         png_destroy_write_struct(&png_ptr, &info_ptr);
> ++         return 1;
> ++      }
> ++   }
> ++
> ++   png_destroy_write_struct(&png_ptr, &info_ptr);
> ++   return 0;
> ++}
> ++#undef TEXT_COUNT
> ++#endif /* PNG_TEXT_SUPPORTED */
> ++
> ++#ifdef PNG_sPLT_SUPPORTED
> ++/* Test: get the sPLT array, pass it straight back to set, verify data.=
 */
> ++static int
> ++test_splt_roundtrip(void)
> ++{
> ++   png_structp png_ptr;
> ++   png_infop info_ptr;
> ++   png_sPLT_t splt;
> ++   png_sPLT_entry splt_entries[4];
> ++   png_sPLT_tp got_spalettes =3D NULL;
> ++   int got_num, i;
> ++
> ++   png_ptr =3D png_create_write_struct(PNG_LIBPNG_VER_STRING,
> ++       NULL, NULL, NULL);
> ++   if (png_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
> ++      return 1;
> ++   }
> ++
> ++   info_ptr =3D png_create_info_struct(png_ptr);
> ++   if (info_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
> ++      png_destroy_write_struct(&png_ptr, NULL);
> ++      return 1;
> ++   }
> ++
> ++   if (setjmp(png_jmpbuf(png_ptr)))
> ++   {
> ++      fprintf(stderr, "pnggetset: libpng error in test_splt_roundtrip\n=
");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* Populate with recognizable values. */
> ++   memset(splt_entries, 0, sizeof splt_entries);
> ++   for (i =3D 0; i < 4; i++)
> ++   {
> ++      splt_entries[i].red =3D (png_uint_16)(i * 1000);
> ++      splt_entries[i].green =3D (png_uint_16)(i * 2000);
> ++      splt_entries[i].blue =3D (png_uint_16)(i * 3000);
> ++      splt_entries[i].alpha =3D 0xffffU;
> ++      splt_entries[i].frequency =3D (png_uint_16)(i + 1);
> ++   }
> ++   memset(&splt, 0, sizeof splt);
> ++   splt.name =3D (png_charp)"test_sPLT";
> ++   splt.depth =3D 16;
> ++   splt.entries =3D splt_entries;
> ++   splt.nentries =3D 4;
> ++
> ++   png_set_sPLT(png_ptr, info_ptr, &splt, 1);
> ++
> ++   /* Get the internal pointer and feed it straight back (append). */
> ++   got_num =3D png_get_sPLT(png_ptr, info_ptr, &got_spalettes);
> ++   if (got_spalettes =3D=3D NULL || got_num !=3D 1)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_get_sPLT returned unexpected valu=
es\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* This is the critical call: got_spalettes aliases internal storage=
. */
> ++   png_set_sPLT(png_ptr, info_ptr, got_spalettes, got_num);
> ++
> ++   /* Verify the original entry survived. */
> ++   got_spalettes =3D NULL;
> ++   got_num =3D png_get_sPLT(png_ptr, info_ptr, &got_spalettes);
> ++   if (got_spalettes =3D=3D NULL || got_num !=3D 2)
> ++   {
> ++      fprintf(stderr, "pnggetset: sPLT count %d, expected 2 after round=
trip\n",
> ++          got_num);
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++   if (strcmp(got_spalettes[0].name, "test_sPLT") !=3D 0 ||
> ++       got_spalettes[0].nentries !=3D 4 ||
> ++       got_spalettes[0].depth !=3D 16)
> ++   {
> ++      fprintf(stderr,
> ++          "pnggetset: sPLT entry 0 corrupted after roundtrip\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++   for (i =3D 0; i < 4; i++)
> ++   {
> ++      if (got_spalettes[0].entries[i].red !=3D (png_uint_16)(i * 1000) =
||
> ++          got_spalettes[0].entries[i].green !=3D (png_uint_16)(i * 2000=
) ||
> ++          got_spalettes[0].entries[i].blue !=3D (png_uint_16)(i * 3000)=
)
> ++      {
> ++         fprintf(stderr,
> ++             "pnggetset: sPLT[0] entry %d corrupted after roundtrip\n",=
 i);
> ++         png_destroy_write_struct(&png_ptr, &info_ptr);
> ++         return 1;
> ++      }
> ++   }
> ++
> ++   png_destroy_write_struct(&png_ptr, &info_ptr);
> ++   return 0;
> ++}
> ++#endif /* PNG_sPLT_SUPPORTED */
> ++
> ++#ifdef PNG_STORE_UNKNOWN_CHUNKS_SUPPORTED
> ++/* Test: get unknown chunks, pass them straight back to set, verify dat=
a. */
> ++static int
> ++test_unknown_roundtrip(void)
> ++{
> ++   png_structp png_ptr;
> ++   png_infop info_ptr;
> ++   png_unknown_chunk unk;
> ++   png_unknown_chunkp got_unknowns =3D NULL;
> ++   int got_num;
> ++   static const png_byte test_data[] =3D {0xde, 0xad, 0xbe, 0xef};
> ++
> ++   png_ptr =3D png_create_write_struct(PNG_LIBPNG_VER_STRING,
> ++       NULL, NULL, NULL);
> ++   if (png_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_write_struct failed\n");
> ++      return 1;
> ++   }
> ++
> ++   info_ptr =3D png_create_info_struct(png_ptr);
> ++   if (info_ptr =3D=3D NULL)
> ++   {
> ++      fprintf(stderr, "pnggetset: png_create_info_struct failed\n");
> ++      png_destroy_write_struct(&png_ptr, NULL);
> ++      return 1;
> ++   }
> ++
> ++   if (setjmp(png_jmpbuf(png_ptr)))
> ++   {
> ++      fprintf(stderr,
> ++          "pnggetset: libpng error in test_unknown_roundtrip\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* Set up an unknown chunk with recognizable data. */
> ++   memset(&unk, 0, sizeof unk);
> ++   memcpy(unk.name, "teSt", 5);
> ++   unk.data =3D (png_bytep)test_data;
> ++   unk.size =3D sizeof test_data;
> ++   unk.location =3D PNG_HAVE_IHDR;
> ++
> ++   png_set_keep_unknown_chunks(png_ptr, PNG_HANDLE_CHUNK_ALWAYS, NULL, =
0);
> ++   png_set_unknown_chunks(png_ptr, info_ptr, &unk, 1);
> ++
> ++   /* Get the internal pointer and feed it straight back (append). */
> ++   got_num =3D png_get_unknown_chunks(png_ptr, info_ptr, &got_unknowns)=
;
> ++   if (got_unknowns =3D=3D NULL || got_num !=3D 1)
> ++   {
> ++      fprintf(stderr,
> ++          "pnggetset: png_get_unknown_chunks returned unexpected values=
\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   /* This is the critical call: got_unknowns aliases internal storage.=
 */
> ++   png_set_unknown_chunks(png_ptr, info_ptr, got_unknowns, got_num);
> ++
> ++   /* Verify the original entry survived. */
> ++   got_unknowns =3D NULL;
> ++   got_num =3D png_get_unknown_chunks(png_ptr, info_ptr, &got_unknowns)=
;
> ++   if (got_unknowns =3D=3D NULL || got_num !=3D 2)
> ++   {
> ++      fprintf(stderr,
> ++          "pnggetset: unknown_chunks count %d, expected 2 after roundtr=
ip\n",
> ++          got_num);
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++   if (memcmp(got_unknowns[0].name, "teSt", 4) !=3D 0 ||
> ++       got_unknowns[0].size !=3D sizeof test_data ||
> ++       memcmp(got_unknowns[0].data, test_data, sizeof test_data) !=3D 0=
)
> ++   {
> ++      fprintf(stderr,
> ++          "pnggetset: unknown chunk 0 corrupted after roundtrip\n");
> ++      png_destroy_write_struct(&png_ptr, &info_ptr);
> ++      return 1;
> ++   }
> ++
> ++   png_destroy_write_struct(&png_ptr, &info_ptr);
> ++   return 0;
> ++}
> ++#endif /* PNG_STORE_UNKNOWN_CHUNKS_SUPPORTED */
> ++
> + int
> + main(void)
> + {
> +@@ -324,5 +608,41 @@ main(void)
> +       printf("PASS\n");
> + #endif
> +=20
> ++#ifdef PNG_TEXT_SUPPORTED
> ++   printf("Testing tEXt get-then-set roundtrip... ");
> ++   fflush(stdout);
> ++   if (test_text_roundtrip() !=3D 0)
> ++   {
> ++      printf("FAIL\n");
> ++      result =3D 1;
> ++   }
> ++   else
> ++      printf("PASS\n");
> ++#endif
> ++
> ++#ifdef PNG_sPLT_SUPPORTED
> ++   printf("Testing sPLT get-then-set roundtrip... ");
> ++   fflush(stdout);
> ++   if (test_splt_roundtrip() !=3D 0)
> ++   {
> ++      printf("FAIL\n");
> ++      result =3D 1;
> ++   }
> ++   else
> ++      printf("PASS\n");
> ++#endif
> ++
> ++#ifdef PNG_STORE_UNKNOWN_CHUNKS_SUPPORTED
> ++   printf("Testing unknown chunks get-then-set roundtrip... ");
> ++   fflush(stdout);
> ++   if (test_unknown_roundtrip() !=3D 0)
> ++   {
> ++      printf("FAIL\n");
> ++      result =3D 1;
> ++   }
> ++   else
> ++      printf("PASS\n");
> ++#endif
> ++
> +    return result;
> + }
> +diff --git a/pngset.c b/pngset.c
> +index 9b9a008b8..1fc65cad9 100644
> +--- a/pngset.c
> ++++ b/pngset.c
> +@@ -779,6 +779,7 @@ png_set_text_2(png_const_structrp png_ptr, png_infor=
p info_ptr,
> +     png_const_textp text_ptr, int num_text)
> + {
> +    int i;
> ++   png_textp old_text =3D NULL;
> +=20
> +    png_debug1(1, "in text storage function, chunk typeid =3D 0x%lx",
> +       png_ptr =3D=3D NULL ? 0xabadca11UL : (unsigned long)png_ptr->chun=
k_name);
> +@@ -826,7 +827,10 @@ png_set_text_2(png_const_structrp png_ptr, png_info=
rp info_ptr,
> +          return 1;
> +       }
> +=20
> +-      png_free(png_ptr, info_ptr->text);
> ++      /* Defer freeing the old array until after the copy loop below,
> ++       * in case text_ptr aliases info_ptr->text (getter-to-setter).
> ++       */
> ++      old_text =3D info_ptr->text;
> +=20
> +       info_ptr->text =3D new_text;
> +       info_ptr->free_me |=3D PNG_FREE_TEXT;
> +@@ -911,6 +915,7 @@ png_set_text_2(png_const_structrp png_ptr, png_infor=
p info_ptr,
> +       {
> +          png_chunk_report(png_ptr, "text chunk: out of memory",
> +              PNG_CHUNK_WRITE_ERROR);
> ++         png_free(png_ptr, old_text);
> +=20
> +          return 1;
> +       }
> +@@ -964,6 +969,8 @@ png_set_text_2(png_const_structrp png_ptr, png_infor=
p info_ptr,
> +       png_debug1(3, "transferred text chunk %d", info_ptr->num_text);
> +    }
> +=20
> ++   png_free(png_ptr, old_text);
> ++
> +    return 0;
> + }
> + #endif
> +@@ -1089,6 +1096,7 @@ png_set_sPLT(png_const_structrp png_ptr,
> +  */
> + {
> +    png_sPLT_tp np;
> ++   png_sPLT_tp old_spalettes;
> +=20
> +    png_debug1(1, "in %s storage function", "sPLT");
> +=20
> +@@ -1109,7 +1117,10 @@ png_set_sPLT(png_const_structrp png_ptr,
> +       return;
> +    }
> +=20
> +-   png_free(png_ptr, info_ptr->splt_palettes);
> ++   /* Defer freeing the old array until after the copy loop below,
> ++    * in case entries aliases info_ptr->splt_palettes (getter-to-setter=
).
> ++    */
> ++   old_spalettes =3D info_ptr->splt_palettes;
> +=20
> +    info_ptr->splt_palettes =3D np;
> +    info_ptr->free_me |=3D PNG_FREE_SPLT;
> +@@ -1173,6 +1184,8 @@ png_set_sPLT(png_const_structrp png_ptr,
> +    }
> +    while (--nentries);
> +=20
> ++   png_free(png_ptr, old_spalettes);
> ++
> +    if (nentries > 0)
> +       png_chunk_report(png_ptr, "sPLT out of memory", PNG_CHUNK_WRITE_E=
RROR);
> + }
> +@@ -1221,6 +1234,7 @@ png_set_unknown_chunks(png_const_structrp png_ptr,
> +     png_inforp info_ptr, png_const_unknown_chunkp unknowns, int num_unk=
nowns)
> + {
> +    png_unknown_chunkp np;
> ++   png_unknown_chunkp old_unknowns;
> +=20
> +    if (png_ptr =3D=3D NULL || info_ptr =3D=3D NULL || num_unknowns <=3D=
 0 ||
> +        unknowns =3D=3D NULL)
> +@@ -1267,7 +1281,10 @@ png_set_unknown_chunks(png_const_structrp png_ptr=
,
> +       return;
> +    }
> +=20
> +-   png_free(png_ptr, info_ptr->unknown_chunks);
> ++   /* Defer freeing the old array until after the copy loop below,
> ++    * in case unknowns aliases info_ptr->unknown_chunks (getter-to-sett=
er).
> ++    */
> ++   old_unknowns =3D info_ptr->unknown_chunks;
> +=20
> +    info_ptr->unknown_chunks =3D np; /* safe because it is initialized *=
/
> +    info_ptr->free_me |=3D PNG_FREE_UNKN;
> +@@ -1313,6 +1330,8 @@ png_set_unknown_chunks(png_const_structrp png_ptr,
> +       ++np;
> +       ++(info_ptr->unknown_chunks_num);
> +    }
> ++
> ++   png_free(png_ptr, old_unknowns);
> + }
> +=20
> + void PNGAPI
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recip=
es-multimedia/libpng/libpng_1.6.42.bb
> index 923ed79896..17d0913629 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
> @@ -25,6 +25,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN=
}${LIBV}/${PV}/${BP}.tar.xz
>             file://CVE-2026-22801.patch \
>             file://CVE-2026-25646.patch \
>             file://CVE-2026-33636.patch \
> +           file://CVE-2026-34757_p1.patch \
> +           file://CVE-2026-34757_p2.patch \
>  "
> =20
>  SRC_URI[sha256sum] =3D "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af97=
2bb60057bdb48450"
> @@ -62,7 +64,7 @@ do_install_ptest() {
>      install -m 644 ${S}/contrib/tools/*.c ${S}/contrib/tools/*.h ${D}${P=
TEST_PATH}/src/contrib/tools
> =20
>      # Install .libs directory binaries to ptest path
> -    install -m 755 ${B}/.libs/pngtest ${B}/.libs/pngstest ${B}/.libs/png=
image ${B}/.libs/pngunknown ${B}/.libs/pngvalid ${D}${PTEST_PATH}/src
> +    install -m 755 ${B}/.libs/pngtest ${B}/.libs/pnggetset ${B}/.libs/pn=
gstest ${B}/.libs/pngimage ${B}/.libs/pngunknown ${B}/.libs/pngvalid ${D}${=
PTEST_PATH}/src
> =20
>      # Copy png files to ptest path
>      cd ${S} && find contrib -name '*.png' | cpio -pd ${D}${PTEST_PATH}/s=
rc


--=20
Yoann Congal
Smile ECS


