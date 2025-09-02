Return-Path: <rob.woolleywr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B63CA100B
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 15:41:59 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.80859.1756827714453044303
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 08:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jdWjCQ3s;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: rob.woolleywr@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e931cad1fd8so4541820276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756827713; x=1757432513; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Prh1BV+oghOu4tCwdCuyvSkvprTjRcXzcsBRMa72h6I=;
        b=jdWjCQ3sfJCfPj9+Xd4Pip10HPHj3h0XU+zMizmMx1YxRpJNqY4/WcHh+siGWHuxjk
         oiy4d7+tFPSwF+5ZApBZY4uxqJBFfMK+dGNOx9hkoIr1QHvTDFi29pFM0iDwzkZMbnqA
         7vsfZvLrVMPokLGEML05RTpKNouqitKyNmp/69tYSr07GTFRwpxyFBcSL9bcZ/kXbq3t
         q0jzCNP7tC9cO1BSOCOquZSBLMVxQ/9n+37S+rnm9fzOQFjFLmFNAJnqzxKkAH9Wghh6
         U8eg6UHCaifn8YUpbDPUgFaYp8bdGHn9CHO5VvcYqXdztBmxxeDvcVVneKlU0WXmf8k0
         zTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827713; x=1757432513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Prh1BV+oghOu4tCwdCuyvSkvprTjRcXzcsBRMa72h6I=;
        b=av4fYRXeqGNALxbUuifveveouGJheDSUmr30rrR8tzuGwaS8oYflL1KDvrkogzAUHe
         uGg6QoMbOyEwdNjw4nBmNLTH+2lReBTCaxYYW8G6BsMIehY/zq41FbYtI0jfDDVklcYq
         cpef2SNXiRGz/JI2ChGdplIEz2vEUHbxZtpjLy6lvFAIhSWBypsy32/HMGonckNRqg6S
         CNx6D24ozeKW+g98H/oCa0epcjXrX7cIk8ZyVD3mry2PBD2s+U9CyKIhPJJhp0HqkafS
         XJrUTRhyrAnxS2KgEH4kbZGPkWkylWPP1IkewJ8PNl/mTU/Yh99zedfRSI8OoVD6FVb7
         lb1g==
X-Gm-Message-State: AOJu0YzFfO/dF3AZPDPli21YhN3kvPYZHeq9ra3KWAy2Nl/cd+58DzGU
	2y1PIsNjp9AFvvBEBF1X2/M1RDlz4OfeLun3YlZfjDuYCoVKGiJKR3iNGdRkXlcUaQ/hrRh4TMX
	TLUylnobasLMhgpwtwlXBUpPX2J7VuryWUg==
X-Gm-Gg: ASbGnctKkDGL3Dgj5dNyr6usYaMA7stwNXQz90aP+OzQ2GWBJ7DA56dOxWU76ab59PG
	U/t/kwSHk1cGrBmFdM2DPXZbAiBUlbuLasYPVa8cTuCiXLvCZFiOIB94HS4WPw2vouDoZXT+VF/
	IQjg7lU4Y2adQq7+X/AevY2yiAUDVbXMY9hMDRp2ABkyzGTB04oF4wSx3occ9ldub9bWFYODxLn
	pdvcGk=
X-Google-Smtp-Source: AGHT+IGiR1m3c/wsyxCWDn32eXADAVb9qC4eROzsM1vQyrT2uL4ce4qhsNNudvIww1QeVm4b3auRay4ERQbXoJO2aIg=
X-Received: by 2002:a05:690c:9a8f:b0:722:63fa:33cc with SMTP id
 00721157ae682-722763b0be4mr158326237b3.16.1756827712520; Tue, 02 Sep 2025
 08:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250902153929.3365588-1-rob.woolley@windriver.com> <20250902153929.3365588-2-rob.woolley@windriver.com>
In-Reply-To: <20250902153929.3365588-2-rob.woolley@windriver.com>
From: Rob Woolley <rob.woolleywr@gmail.com>
Date: Tue, 2 Sep 2025 11:41:40 -0400
X-Gm-Features: Ac12FXycDksoXdEfMWgPSiR5uyJxJzLYqVQpte6KLGa5MeOMQA-i7GNwSAFMgbk
Message-ID: <CAGAhMByoPAprXisfDY=M7qh_9_3XBi_N87hmL8EB_dXhg=UOmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vte: upgrade 0.78.2 -> 0.80.3
To: rob.woolley@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bc8889063dd3535a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 15:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222740

--000000000000bc8889063dd3535a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please disregard this.... it was git-send-email user error because I adding
-M 1 from the README.md

Regards,
Rob

On Tue, Sep 2, 2025 at 11:39=E2=80=AFAM Rob Woolley via lists.openembedded.=
org
<rob.woolley=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Gyorgy Sarvari <skandigraun@gmail.com>
>
> 0004-fast_float-Add-single-header-library-for-from_char-i.patch
> and 0005-color-parser-Use-fast_float-implementation-for-from_.patch
> patches dropped: upstream has adopted the changes, and oe-core also
> provides now fastfloat, no need to vendor it with a patch.
>
> 0002-lib-Typo-fix.patch is dropped, because it was a backport, and
> it is included in this release.
>
> Shortlog: https://gitlab.gnome.org/GNOME/vte/-/compare/0.80.3...0.78.2
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../vte/vte/0002-lib-Typo-fix.patch           |   25 -
>  ...ingle-header-library-for-from_char-i.patch | 3922 -----------------
>  ...-fast_float-implementation-for-from_.patch |  102 -
>  .../vte/{vte_0.78.2.bb =3D> vte_0.80.3.bb}      |   14 +-
>  4 files changed, 6 insertions(+), 4057 deletions(-)
>  delete mode 100644 meta/recipes-support/vte/vte/0002-lib-Typo-fix.patch
>  delete mode 100644
> meta/recipes-support/vte/vte/0004-fast_float-Add-single-header-library-fo=
r-from_char-i.patch
>  delete mode 100644
> meta/recipes-support/vte/vte/0005-color-parser-Use-fast_float-implementat=
ion-for-from_.patch
>  rename meta/recipes-support/vte/{vte_0.78.2.bb =3D> vte_0.80.3.bb} (82%)
>
> diff --git a/meta/recipes-support/vte/vte/0002-lib-Typo-fix.patch
> b/meta/recipes-support/vte/vte/0002-lib-Typo-fix.patch
> deleted file mode 100644
> index 410d506806..0000000000
> --- a/meta/recipes-support/vte/vte/0002-lib-Typo-fix.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 6b7440996819c12ec32bfaf4e73b27baeb273207 Mon Sep 17 00:00:00 2001
> -From: Christian Persch <chpe@src.gnome.org>
> -Date: Thu, 5 Sep 2024 23:59:05 +0200
> -Subject: [PATCH 2/3] lib: Typo fix
> -
> -Fixes: https://gitlab.gnome.org/GNOME/vte/-/issues/2816
> -Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/vte/-/commit/e24087d953d9352c8bc46074e2662=
c80f9bfbc2d
> ]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/vteinternal.hh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/vteinternal.hh b/src/vteinternal.hh
> -index 051e78c..b1adc19 100644
> ---- a/src/vteinternal.hh
> -+++ b/src/vteinternal.hh
> -@@ -1233,7 +1233,7 @@ public:
> -         void reset_decoder();
> -
> -         void feed(std::string_view const& data,
> --                  bool start_processsing_ =3D true);
> -+                  bool start_processing_ =3D true);
> -         void feed_child(char const* data,
> -                         size_t length) { assert(data); feed_child({data=
,
> length}); }
> -         void feed_child(std::string_view const& str);
> diff --git
> a/meta/recipes-support/vte/vte/0004-fast_float-Add-single-header-library-=
for-from_char-i.patch
> b/meta/recipes-support/vte/vte/0004-fast_float-Add-single-header-library-=
for-from_char-i.patch
> deleted file mode 100644
> index 731dba729d..0000000000
> ---
> a/meta/recipes-support/vte/vte/0004-fast_float-Add-single-header-library-=
for-from_char-i.patch
> +++ /dev/null
> @@ -1,3922 +0,0 @@
> -From 2a32e43e43b04771a3357d3d4ccbafa7714e0114 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 4 Oct 2024 21:21:11 -0700
> -Subject: [PATCH 4/5] fast_float: Add single header library for from_char
> - implementation
> -
> -Document the process to re-generate the file whenever new release
> -is made for fast_float upstream.
> -
> -This would make it work with llvm libc++
> -
> -Upstream-Status: Submitted [
> https://gitlab.gnome.org/GNOME/vte/-/issues/2823#note_2239888]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - README.md         |   17 +
> - src/fast_float.hh | 3869 +++++++++++++++++++++++++++++++++++++++++++++
> - 2 files changed, 3886 insertions(+)
> - create mode 100644 src/fast_float.hh
> -
> -diff --git a/README.md b/README.md
> -index a32465a9..20ed5ba2 100644
> ---- a/README.md
> -+++ b/README.md
> -@@ -21,6 +21,23 @@ on download.gnome.org, but please note that any
> tarball for releases
> - after 0.60.3 were made by either the gnome release team or other
> - gnome contributors, but not by a VTE maintainer.
> -
> -+fast_float library[1] is used to provide from_chars implementation for
> faster
> -+and more portable parsing of 64 decimal strings.
> -+
> -+fast_float.hh is an amalgamation of the entire library,
> -+which can be regenerated by using amalgamate.py script provided by
> -+fast_float repository. Following command can be used to re-generate the
> -+header file
> -+
> -+```
> -+git clone https://github.com/fastfloat/fast_float
> -+cd fast_float
> -+git checkout v6.1.6
> -+python3 ./script/amalgamate.py --license=3DMIT > $VTE_SRC/src/fast_floa=
t.hh
> -+```
> -+
> -+[1]: https://github.com/fastfloat/fast_float
> -+
> - Installation
> - ------------
> -
> -diff --git a/src/fast_float.hh b/src/fast_float.hh
> -new file mode 100644
> -index 00000000..e0d5dd53
> ---- /dev/null
> -+++ b/src/fast_float.hh
> -@@ -0,0 +1,3869 @@
> -+// fast_float by Daniel Lemire
> -+// fast_float by Jo=C3=A3o Paulo Magalhaes
> -+//
> -+//
> -+// with contributions from Eugene Golushkov
> -+// with contributions from Maksim Kita
> -+// with contributions from Marcin Wojdyr
> -+// with contributions from Neal Richardson
> -+// with contributions from Tim Paine
> -+// with contributions from Fabio Pellacini
> -+// with contributions from L=C3=A9n=C3=A1rd Szolnoki
> -+// with contributions from Jan Pharago
> -+// with contributions from Maya Warrier
> -+// with contributions from Taha Khokhar
> -+//
> -+//
> -+// MIT License Notice
> -+//
> -+//    MIT License
> -+//
> -+//    Copyright (c) 2021 The fast_float authors
> -+//
> -+//    Permission is hereby granted, free of charge, to any
> -+//    person obtaining a copy of this software and associated
> -+//    documentation files (the "Software"), to deal in the
> -+//    Software without restriction, including without
> -+//    limitation the rights to use, copy, modify, merge,
> -+//    publish, distribute, sublicense, and/or sell copies of
> -+//    the Software, and to permit persons to whom the Software
> -+//    is furnished to do so, subject to the following
> -+//    conditions:
> -+//
> -+//    The above copyright notice and this permission notice
> -+//    shall be included in all copies or substantial portions
> -+//    of the Software.
> -+//
> -+//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
> -+//    ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
> -+//    TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
> -+//    PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> -+//    SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> -+//    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> -+//    OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
> -+//    IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> -+//    DEALINGS IN THE SOFTWARE.
> -+//
> -+
> -+#ifndef FASTFLOAT_CONSTEXPR_FEATURE_DETECT_H
> -+#define FASTFLOAT_CONSTEXPR_FEATURE_DETECT_H
> -+
> -+#ifdef __has_include
> -+#if __has_include(<version>)
> -+#include <version>
> -+#endif
> -+#endif
> -+
> -+// Testing for https://wg21.link/N3652, adopted in C++14
> -+#if __cpp_constexpr >=3D 201304
> -+#define FASTFLOAT_CONSTEXPR14 constexpr
> -+#else
> -+#define FASTFLOAT_CONSTEXPR14
> -+#endif
> -+
> -+#if defined(__cpp_lib_bit_cast) && __cpp_lib_bit_cast >=3D 201806L
> -+#define FASTFLOAT_HAS_BIT_CAST 1
> -+#else
> -+#define FASTFLOAT_HAS_BIT_CAST 0
> -+#endif
> -+
> -+#if defined(__cpp_lib_is_constant_evaluated) &&
>       \
> -+    __cpp_lib_is_constant_evaluated >=3D 201811L
> -+#define FASTFLOAT_HAS_IS_CONSTANT_EVALUATED 1
> -+#else
> -+#define FASTFLOAT_HAS_IS_CONSTANT_EVALUATED 0
> -+#endif
> -+
> -+// Testing for relevant C++20 constexpr library features
> -+#if FASTFLOAT_HAS_IS_CONSTANT_EVALUATED && FASTFLOAT_HAS_BIT_CAST &&
>        \
> -+    __cpp_lib_constexpr_algorithms >=3D 201806L /*For std::copy and
> std::fill*/
> -+#define FASTFLOAT_CONSTEXPR20 constexpr
> -+#define FASTFLOAT_IS_CONSTEXPR 1
> -+#else
> -+#define FASTFLOAT_CONSTEXPR20
> -+#define FASTFLOAT_IS_CONSTEXPR 0
> -+#endif
> -+
> -+#if __cplusplus >=3D 201703L || (defined(_MSVC_LANG) && _MSVC_LANG >=3D
> 201703L)
> -+#define FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE 0
> -+#else
> -+#define FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE 1
> -+#endif
> -+
> -+#endif // FASTFLOAT_CONSTEXPR_FEATURE_DETECT_H
> -+
> -+#ifndef FASTFLOAT_FLOAT_COMMON_H
> -+#define FASTFLOAT_FLOAT_COMMON_H
> -+
> -+#include <cfloat>
> -+#include <cstdint>
> -+#include <cassert>
> -+#include <cstring>
> -+#include <type_traits>
> -+#include <system_error>
> -+#ifdef __has_include
> -+#if __has_include(<stdfloat>) && (__cplusplus > 202002L || _MSVC_LANG >
> 202002L)
> -+#include <stdfloat>
> -+#endif
> -+#endif
> -+
> -+namespace fast_float {
> -+
> -+#define FASTFLOAT_JSONFMT (1 << 5)
> -+#define FASTFLOAT_FORTRANFMT (1 << 6)
> -+
> -+enum chars_format {
> -+  scientific =3D 1 << 0,
> -+  fixed =3D 1 << 2,
> -+  hex =3D 1 << 3,
> -+  no_infnan =3D 1 << 4,
> -+  // RFC 8259: https://datatracker.ietf.org/doc/html/rfc8259#section-6
> -+  json =3D FASTFLOAT_JSONFMT | fixed | scientific | no_infnan,
> -+  // Extension of RFC 8259 where, e.g., "inf" and "nan" are allowed.
> -+  json_or_infnan =3D FASTFLOAT_JSONFMT | fixed | scientific,
> -+  fortran =3D FASTFLOAT_FORTRANFMT | fixed | scientific,
> -+  general =3D fixed | scientific
> -+};
> -+
> -+template <typename UC> struct from_chars_result_t {
> -+  UC const *ptr;
> -+  std::errc ec;
> -+};
> -+using from_chars_result =3D from_chars_result_t<char>;
> -+
> -+template <typename UC> struct parse_options_t {
> -+  constexpr explicit parse_options_t(chars_format fmt =3D
> chars_format::general,
> -+                                     UC dot =3D UC('.'))
> -+      : format(fmt), decimal_point(dot) {}
> -+
> -+  /** Which number formats are accepted */
> -+  chars_format format;
> -+  /** The character used as decimal point */
> -+  UC decimal_point;
> -+};
> -+using parse_options =3D parse_options_t<char>;
> -+
> -+} // namespace fast_float
> -+
> -+#if FASTFLOAT_HAS_BIT_CAST
> -+#include <bit>
> -+#endif
> -+
> -+#if (defined(__x86_64) || defined(__x86_64__) || defined(_M_X64) ||
>       \
> -+     defined(__amd64) || defined(__aarch64__) || defined(_M_ARM64) ||
>       \
> -+     defined(__MINGW64__) || defined(__s390x__) ||
>        \
> -+     (defined(__ppc64__) || defined(__PPC64__) || defined(__ppc64le__)
> ||      \
> -+      defined(__PPC64LE__)) ||
>        \
> -+     defined(__loongarch64))
> -+#define FASTFLOAT_64BIT 1
> -+#elif (defined(__i386) || defined(__i386__) || defined(_M_IX86) ||
>        \
> -+       defined(__arm__) || defined(_M_ARM) || defined(__ppc__) ||
>       \
> -+       defined(__MINGW32__) || defined(__EMSCRIPTEN__))
> -+#define FASTFLOAT_32BIT 1
> -+#else
> -+  // Need to check incrementally, since SIZE_MAX is a size_t, avoid
> overflow.
> -+// We can never tell the register width, but the SIZE_MAX is a good
> -+// approximation. UINTPTR_MAX and INTPTR_MAX are optional, so avoid the=
m
> for max
> -+// portability.
> -+#if SIZE_MAX =3D=3D 0xffff
> -+#error Unknown platform (16-bit, unsupported)
> -+#elif SIZE_MAX =3D=3D 0xffffffff
> -+#define FASTFLOAT_32BIT 1
> -+#elif SIZE_MAX =3D=3D 0xffffffffffffffff
> -+#define FASTFLOAT_64BIT 1
> -+#else
> -+#error Unknown platform (not 32-bit, not 64-bit?)
> -+#endif
> -+#endif
> -+
> -+#if ((defined(_WIN32) || defined(_WIN64)) && !defined(__clang__)) ||
>        \
> -+    (defined(_M_ARM64) && !defined(__MINGW32__))
> -+#include <intrin.h>
> -+#endif
> -+
> -+#if defined(_MSC_VER) && !defined(__clang__)
> -+#define FASTFLOAT_VISUAL_STUDIO 1
> -+#endif
> -+
> -+#if defined __BYTE_ORDER__ && defined __ORDER_BIG_ENDIAN__
> -+#define FASTFLOAT_IS_BIG_ENDIAN (__BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDI=
AN__)
> -+#elif defined _WIN32
> -+#define FASTFLOAT_IS_BIG_ENDIAN 0
> -+#else
> -+#if defined(__APPLE__) || defined(__FreeBSD__)
> -+#include <machine/endian.h>
> -+#elif defined(sun) || defined(__sun)
> -+#include <sys/byteorder.h>
> -+#elif defined(__MVS__)
> -+#include <sys/endian.h>
> -+#else
> -+#ifdef __has_include
> -+#if __has_include(<endian.h>)
> -+#include <endian.h>
> -+#endif //__has_include(<endian.h>)
> -+#endif //__has_include
> -+#endif
> -+#
> -+#ifndef __BYTE_ORDER__
> -+// safe choice
> -+#define FASTFLOAT_IS_BIG_ENDIAN 0
> -+#endif
> -+#
> -+#ifndef __ORDER_LITTLE_ENDIAN__
> -+// safe choice
> -+#define FASTFLOAT_IS_BIG_ENDIAN 0
> -+#endif
> -+#
> -+#if __BYTE_ORDER__ =3D=3D __ORDER_LITTLE_ENDIAN__
> -+#define FASTFLOAT_IS_BIG_ENDIAN 0
> -+#else
> -+#define FASTFLOAT_IS_BIG_ENDIAN 1
> -+#endif
> -+#endif
> -+
> -+#if defined(__SSE2__) || (defined(FASTFLOAT_VISUAL_STUDIO) &&
>       \
> -+                          (defined(_M_AMD64) || defined(_M_X64) ||
>        \
> -+                           (defined(_M_IX86_FP) && _M_IX86_FP =3D=3D 2)=
))
> -+#define FASTFLOAT_SSE2 1
> -+#endif
> -+
> -+#if defined(__aarch64__) || defined(_M_ARM64)
> -+#define FASTFLOAT_NEON 1
> -+#endif
> -+
> -+#if defined(FASTFLOAT_SSE2) || defined(FASTFLOAT_NEON)
> -+#define FASTFLOAT_HAS_SIMD 1
> -+#endif
> -+
> -+#if defined(__GNUC__)
> -+// disable -Wcast-align=3Dstrict (GCC only)
> -+#define FASTFLOAT_SIMD_DISABLE_WARNINGS
>       \
> -+  _Pragma("GCC diagnostic push")
>        \
> -+      _Pragma("GCC diagnostic ignored \"-Wcast-align\"")
> -+#else
> -+#define FASTFLOAT_SIMD_DISABLE_WARNINGS
> -+#endif
> -+
> -+#if defined(__GNUC__)
> -+#define FASTFLOAT_SIMD_RESTORE_WARNINGS _Pragma("GCC diagnostic pop")
> -+#else
> -+#define FASTFLOAT_SIMD_RESTORE_WARNINGS
> -+#endif
> -+
> -+#ifdef FASTFLOAT_VISUAL_STUDIO
> -+#define fastfloat_really_inline __forceinline
> -+#else
> -+#define fastfloat_really_inline inline __attribute__((always_inline))
> -+#endif
> -+
> -+#ifndef FASTFLOAT_ASSERT
> -+#define FASTFLOAT_ASSERT(x)
>       \
> -+  { ((void)(x)); }
> -+#endif
> -+
> -+#ifndef FASTFLOAT_DEBUG_ASSERT
> -+#define FASTFLOAT_DEBUG_ASSERT(x)
>       \
> -+  { ((void)(x)); }
> -+#endif
> -+
> -+// rust style `try!()` macro, or `?` operator
> -+#define FASTFLOAT_TRY(x)
>        \
> -+  {
>       \
> -+    if (!(x))
>       \
> -+      return false;
>       \
> -+  }
> -+
> -+#define FASTFLOAT_ENABLE_IF(...)
>        \
> -+  typename std::enable_if<(__VA_ARGS__), int>::type
> -+
> -+namespace fast_float {
> -+
> -+fastfloat_really_inline constexpr bool cpp20_and_in_constexpr() {
> -+#if FASTFLOAT_HAS_IS_CONSTANT_EVALUATED
> -+  return std::is_constant_evaluated();
> -+#else
> -+  return false;
> -+#endif
> -+}
> -+
> -+template <typename T>
> -+fastfloat_really_inline constexpr bool is_supported_float_type() {
> -+  return std::is_same<T, float>::value || std::is_same<T, double>::valu=
e
> -+#if __STDCPP_FLOAT32_T__
> -+         || std::is_same<T, std::float32_t>::value
> -+#endif
> -+#if __STDCPP_FLOAT64_T__
> -+         || std::is_same<T, std::float64_t>::value
> -+#endif
> -+      ;
> -+}
> -+
> -+template <typename UC>
> -+fastfloat_really_inline constexpr bool is_supported_char_type() {
> -+  return std::is_same<UC, char>::value || std::is_same<UC,
> wchar_t>::value ||
> -+         std::is_same<UC, char16_t>::value || std::is_same<UC,
> char32_t>::value;
> -+}
> -+
> -+// Compares two ASCII strings in a case insensitive manner.
> -+template <typename UC>
> -+inline FASTFLOAT_CONSTEXPR14 bool
> -+fastfloat_strncasecmp(UC const *input1, UC const *input2, size_t length=
)
> {
> -+  char running_diff{0};
> -+  for (size_t i =3D 0; i < length; ++i) {
> -+    running_diff |=3D (char(input1[i]) ^ char(input2[i]));
> -+  }
> -+  return (running_diff =3D=3D 0) || (running_diff =3D=3D 32);
> -+}
> -+
> -+#ifndef FLT_EVAL_METHOD
> -+#error "FLT_EVAL_METHOD should be defined, please include cfloat."
> -+#endif
> -+
> -+// a pointer and a length to a contiguous block of memory
> -+template <typename T> struct span {
> -+  const T *ptr;
> -+  size_t length;
> -+  constexpr span(const T *_ptr, size_t _length) : ptr(_ptr),
> length(_length) {}
> -+  constexpr span() : ptr(nullptr), length(0) {}
> -+
> -+  constexpr size_t len() const noexcept { return length; }
> -+
> -+  FASTFLOAT_CONSTEXPR14 const T &operator[](size_t index) const noexcep=
t
> {
> -+    FASTFLOAT_DEBUG_ASSERT(index < length);
> -+    return ptr[index];
> -+  }
> -+};
> -+
> -+struct value128 {
> -+  uint64_t low;
> -+  uint64_t high;
> -+  constexpr value128(uint64_t _low, uint64_t _high) : low(_low),
> high(_high) {}
> -+  constexpr value128() : low(0), high(0) {}
> -+};
> -+
> -+/* Helper C++14 constexpr generic implementation of leading_zeroes */
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 int
> -+leading_zeroes_generic(uint64_t input_num, int last_bit =3D 0) {
> -+  if (input_num & uint64_t(0xffffffff00000000)) {
> -+    input_num >>=3D 32;
> -+    last_bit |=3D 32;
> -+  }
> -+  if (input_num & uint64_t(0xffff0000)) {
> -+    input_num >>=3D 16;
> -+    last_bit |=3D 16;
> -+  }
> -+  if (input_num & uint64_t(0xff00)) {
> -+    input_num >>=3D 8;
> -+    last_bit |=3D 8;
> -+  }
> -+  if (input_num & uint64_t(0xf0)) {
> -+    input_num >>=3D 4;
> -+    last_bit |=3D 4;
> -+  }
> -+  if (input_num & uint64_t(0xc)) {
> -+    input_num >>=3D 2;
> -+    last_bit |=3D 2;
> -+  }
> -+  if (input_num & uint64_t(0x2)) { /* input_num >>=3D  1; */
> -+    last_bit |=3D 1;
> -+  }
> -+  return 63 - last_bit;
> -+}
> -+
> -+/* result might be undefined when input_num is zero */
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 int
> -+leading_zeroes(uint64_t input_num) {
> -+  assert(input_num > 0);
> -+  if (cpp20_and_in_constexpr()) {
> -+    return leading_zeroes_generic(input_num);
> -+  }
> -+#ifdef FASTFLOAT_VISUAL_STUDIO
> -+#if defined(_M_X64) || defined(_M_ARM64)
> -+  unsigned long leading_zero =3D 0;
> -+  // Search the mask data from most significant bit (MSB)
> -+  // to least significant bit (LSB) for a set bit (1).
> -+  _BitScanReverse64(&leading_zero, input_num);
> -+  return (int)(63 - leading_zero);
> -+#else
> -+  return leading_zeroes_generic(input_num);
> -+#endif
> -+#else
> -+  return __builtin_clzll(input_num);
> -+#endif
> -+}
> -+
> -+// slow emulation routine for 32-bit
> -+fastfloat_really_inline constexpr uint64_t emulu(uint32_t x, uint32_t y=
)
> {
> -+  return x * (uint64_t)y;
> -+}
> -+
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 uint64_t
> -+umul128_generic(uint64_t ab, uint64_t cd, uint64_t *hi) {
> -+  uint64_t ad =3D emulu((uint32_t)(ab >> 32), (uint32_t)cd);
> -+  uint64_t bd =3D emulu((uint32_t)ab, (uint32_t)cd);
> -+  uint64_t adbc =3D ad + emulu((uint32_t)ab, (uint32_t)(cd >> 32));
> -+  uint64_t adbc_carry =3D (uint64_t)(adbc < ad);
> -+  uint64_t lo =3D bd + (adbc << 32);
> -+  *hi =3D emulu((uint32_t)(ab >> 32), (uint32_t)(cd >> 32)) + (adbc >> =
32)
> +
> -+        (adbc_carry << 32) + (uint64_t)(lo < bd);
> -+  return lo;
> -+}
> -+
> -+#ifdef FASTFLOAT_32BIT
> -+
> -+// slow emulation routine for 32-bit
> -+#if !defined(__MINGW64__)
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 uint64_t _umul128(uint64_=
t
> ab,
> -+                                                                uint64_=
t
> cd,
> -+                                                                uint64_=
t
> *hi) {
> -+  return umul128_generic(ab, cd, hi);
> -+}
> -+#endif // !__MINGW64__
> -+
> -+#endif // FASTFLOAT_32BIT
> -+
> -+// compute 64-bit a*b
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 value128
> -+full_multiplication(uint64_t a, uint64_t b) {
> -+  if (cpp20_and_in_constexpr()) {
> -+    value128 answer;
> -+    answer.low =3D umul128_generic(a, b, &answer.high);
> -+    return answer;
> -+  }
> -+  value128 answer;
> -+#if defined(_M_ARM64) && !defined(__MINGW32__)
> -+  // ARM64 has native support for 64-bit multiplications, no need to
> emulate
> -+  // But MinGW on ARM64 doesn't have native support for 64-bit
> multiplications
> -+  answer.high =3D __umulh(a, b);
> -+  answer.low =3D a * b;
> -+#elif defined(FASTFLOAT_32BIT) ||
>       \
> -+    (defined(_WIN64) && !defined(__clang__) && !defined(_M_ARM64))
> -+  answer.low =3D _umul128(a, b, &answer.high); // _umul128 not availabl=
e
> on ARM64
> -+#elif defined(FASTFLOAT_64BIT) && defined(__SIZEOF_INT128__)
> -+  __uint128_t r =3D ((__uint128_t)a) * b;
> -+  answer.low =3D uint64_t(r);
> -+  answer.high =3D uint64_t(r >> 64);
> -+#else
> -+  answer.low =3D umul128_generic(a, b, &answer.high);
> -+#endif
> -+  return answer;
> -+}
> -+
> -+struct adjusted_mantissa {
> -+  uint64_t mantissa{0};
> -+  int32_t power2{0}; // a negative value indicates an invalid result
> -+  adjusted_mantissa() =3D default;
> -+  constexpr bool operator=3D=3D(const adjusted_mantissa &o) const {
> -+    return mantissa =3D=3D o.mantissa && power2 =3D=3D o.power2;
> -+  }
> -+  constexpr bool operator!=3D(const adjusted_mantissa &o) const {
> -+    return mantissa !=3D o.mantissa || power2 !=3D o.power2;
> -+  }
> -+};
> -+
> -+// Bias so we can get the real exponent with an invalid
> adjusted_mantissa.
> -+constexpr static int32_t invalid_am_bias =3D -0x8000;
> -+
> -+// used for binary_format_lookup_tables<T>::max_mantissa
> -+constexpr uint64_t constant_55555 =3D 5 * 5 * 5 * 5 * 5;
> -+
> -+template <typename T, typename U =3D void> struct
> binary_format_lookup_tables;
> -+
> -+template <typename T> struct binary_format :
> binary_format_lookup_tables<T> {
> -+  using equiv_uint =3D
> -+      typename std::conditional<sizeof(T) =3D=3D 4, uint32_t,
> uint64_t>::type;
> -+
> -+  static inline constexpr int mantissa_explicit_bits();
> -+  static inline constexpr int minimum_exponent();
> -+  static inline constexpr int infinite_power();
> -+  static inline constexpr int sign_index();
> -+  static inline constexpr int
> -+  min_exponent_fast_path(); // used when fegetround() =3D=3D FE_TONEARE=
ST
> -+  static inline constexpr int max_exponent_fast_path();
> -+  static inline constexpr int max_exponent_round_to_even();
> -+  static inline constexpr int min_exponent_round_to_even();
> -+  static inline constexpr uint64_t max_mantissa_fast_path(int64_t power=
);
> -+  static inline constexpr uint64_t
> -+  max_mantissa_fast_path(); // used when fegetround() =3D=3D FE_TONEARE=
ST
> -+  static inline constexpr int largest_power_of_ten();
> -+  static inline constexpr int smallest_power_of_ten();
> -+  static inline constexpr T exact_power_of_ten(int64_t power);
> -+  static inline constexpr size_t max_digits();
> -+  static inline constexpr equiv_uint exponent_mask();
> -+  static inline constexpr equiv_uint mantissa_mask();
> -+  static inline constexpr equiv_uint hidden_bit_mask();
> -+};
> -+
> -+template <typename U> struct binary_format_lookup_tables<double, U> {
> -+  static constexpr double powers_of_ten[] =3D {
> -+      1e0,  1e1,  1e2,  1e3,  1e4,  1e5,  1e6,  1e7,  1e8,  1e9,  1e10,
> 1e11,
> -+      1e12, 1e13, 1e14, 1e15, 1e16, 1e17, 1e18, 1e19, 1e20, 1e21, 1e22}=
;
> -+
> -+  // Largest integer value v so that (5**index * v) <=3D 1<<53.
> -+  // 0x20000000000000 =3D=3D 1 << 53
> -+  static constexpr uint64_t max_mantissa[] =3D {
> -+      0x20000000000000,
> -+      0x20000000000000 / 5,
> -+      0x20000000000000 / (5 * 5),
> -+      0x20000000000000 / (5 * 5 * 5),
> -+      0x20000000000000 / (5 * 5 * 5 * 5),
> -+      0x20000000000000 / (constant_55555),
> -+      0x20000000000000 / (constant_55555 * 5),
> -+      0x20000000000000 / (constant_55555 * 5 * 5),
> -+      0x20000000000000 / (constant_55555 * 5 * 5 * 5),
> -+      0x20000000000000 / (constant_55555 * 5 * 5 * 5 * 5),
> -+      0x20000000000000 / (constant_55555 * constant_55555),
> -+      0x20000000000000 / (constant_55555 * constant_55555 * 5),
> -+      0x20000000000000 / (constant_55555 * constant_55555 * 5 * 5),
> -+      0x20000000000000 / (constant_55555 * constant_55555 * 5 * 5 * 5),
> -+      0x20000000000000 / (constant_55555 * constant_55555 *
> constant_55555),
> -+      0x20000000000000 / (constant_55555 * constant_55555 *
> constant_55555 * 5),
> -+      0x20000000000000 /
> -+          (constant_55555 * constant_55555 * constant_55555 * 5 * 5),
> -+      0x20000000000000 /
> -+          (constant_55555 * constant_55555 * constant_55555 * 5 * 5 * 5=
),
> -+      0x20000000000000 /
> -+          (constant_55555 * constant_55555 * constant_55555 * 5 * 5 * 5
> * 5),
> -+      0x20000000000000 /
> -+          (constant_55555 * constant_55555 * constant_55555 *
> constant_55555),
> -+      0x20000000000000 / (constant_55555 * constant_55555 *
> constant_55555 *
> -+                          constant_55555 * 5),
> -+      0x20000000000000 / (constant_55555 * constant_55555 *
> constant_55555 *
> -+                          constant_55555 * 5 * 5),
> -+      0x20000000000000 / (constant_55555 * constant_55555 *
> constant_55555 *
> -+                          constant_55555 * 5 * 5 * 5),
> -+      0x20000000000000 / (constant_55555 * constant_55555 *
> constant_55555 *
> -+                          constant_55555 * 5 * 5 * 5 * 5)};
> -+};
> -+
> -+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE
> -+
> -+template <typename U>
> -+constexpr double binary_format_lookup_tables<double, U>::powers_of_ten[=
];
> -+
> -+template <typename U>
> -+constexpr uint64_t binary_format_lookup_tables<double,
> U>::max_mantissa[];
> -+
> -+#endif
> -+
> -+template <typename U> struct binary_format_lookup_tables<float, U> {
> -+  static constexpr float powers_of_ten[] =3D {1e0f, 1e1f, 1e2f, 1e3f,
> 1e4f, 1e5f,
> -+                                            1e6f, 1e7f, 1e8f, 1e9f,
> 1e10f};
> -+
> -+  // Largest integer value v so that (5**index * v) <=3D 1<<24.
> -+  // 0x1000000 =3D=3D 1<<24
> -+  static constexpr uint64_t max_mantissa[] =3D {
> -+      0x1000000,
> -+      0x1000000 / 5,
> -+      0x1000000 / (5 * 5),
> -+      0x1000000 / (5 * 5 * 5),
> -+      0x1000000 / (5 * 5 * 5 * 5),
> -+      0x1000000 / (constant_55555),
> -+      0x1000000 / (constant_55555 * 5),
> -+      0x1000000 / (constant_55555 * 5 * 5),
> -+      0x1000000 / (constant_55555 * 5 * 5 * 5),
> -+      0x1000000 / (constant_55555 * 5 * 5 * 5 * 5),
> -+      0x1000000 / (constant_55555 * constant_55555),
> -+      0x1000000 / (constant_55555 * constant_55555 * 5)};
> -+};
> -+
> -+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE
> -+
> -+template <typename U>
> -+constexpr float binary_format_lookup_tables<float, U>::powers_of_ten[];
> -+
> -+template <typename U>
> -+constexpr uint64_t binary_format_lookup_tables<float, U>::max_mantissa[=
];
> -+
> -+#endif
> -+
> -+template <>
> -+inline constexpr int binary_format<double>::min_exponent_fast_path() {
> -+#if (FLT_EVAL_METHOD !=3D 1) && (FLT_EVAL_METHOD !=3D 0)
> -+  return 0;
> -+#else
> -+  return -22;
> -+#endif
> -+}
> -+
> -+template <>
> -+inline constexpr int binary_format<float>::min_exponent_fast_path() {
> -+#if (FLT_EVAL_METHOD !=3D 1) && (FLT_EVAL_METHOD !=3D 0)
> -+  return 0;
> -+#else
> -+  return -10;
> -+#endif
> -+}
> -+
> -+template <>
> -+inline constexpr int binary_format<double>::mantissa_explicit_bits() {
> -+  return 52;
> -+}
> -+template <>
> -+inline constexpr int binary_format<float>::mantissa_explicit_bits() {
> -+  return 23;
> -+}
> -+
> -+template <>
> -+inline constexpr int binary_format<double>::max_exponent_round_to_even(=
)
> {
> -+  return 23;
> -+}
> -+
> -+template <>
> -+inline constexpr int binary_format<float>::max_exponent_round_to_even()=
 {
> -+  return 10;
> -+}
> -+
> -+template <>
> -+inline constexpr int binary_format<double>::min_exponent_round_to_even(=
)
> {
> -+  return -4;
> -+}
> -+
> -+template <>
> -+inline constexpr int binary_format<float>::min_exponent_round_to_even()=
 {
> -+  return -17;
> -+}
> -+
> -+template <> inline constexpr int
> binary_format<double>::minimum_exponent() {
> -+  return -1023;
> -+}
> -+template <> inline constexpr int
> binary_format<float>::minimum_exponent() {
> -+  return -127;
> -+}
> -+
> -+template <> inline constexpr int binary_format<double>::infinite_power(=
)
> {
> -+  return 0x7FF;
> -+}
> -+template <> inline constexpr int binary_format<float>::infinite_power()=
 {
> -+  return 0xFF;
> -+}
> -+
> -+template <> inline constexpr int binary_format<double>::sign_index() {
> -+  return 63;
> -+}
> -+template <> inline constexpr int binary_format<float>::sign_index() {
> -+  return 31;
> -+}
> -+
> -+template <>
> -+inline constexpr int binary_format<double>::max_exponent_fast_path() {
> -+  return 22;
> -+}
> -+template <>
> -+inline constexpr int binary_format<float>::max_exponent_fast_path() {
> -+  return 10;
> -+}
> -+
> -+template <>
> -+inline constexpr uint64_t
> binary_format<double>::max_mantissa_fast_path() {
> -+  return uint64_t(2) << mantissa_explicit_bits();
> -+}
> -+template <>
> -+inline constexpr uint64_t
> -+binary_format<double>::max_mantissa_fast_path(int64_t power) {
> -+  // caller is responsible to ensure that
> -+  // power >=3D 0 && power <=3D 22
> -+  //
> -+  // Work around clang bug https://godbolt.org/z/zedh7rrhc
> -+  return (void)max_mantissa[0], max_mantissa[power];
> -+}
> -+template <>
> -+inline constexpr uint64_t binary_format<float>::max_mantissa_fast_path(=
)
> {
> -+  return uint64_t(2) << mantissa_explicit_bits();
> -+}
> -+template <>
> -+inline constexpr uint64_t
> -+binary_format<float>::max_mantissa_fast_path(int64_t power) {
> -+  // caller is responsible to ensure that
> -+  // power >=3D 0 && power <=3D 10
> -+  //
> -+  // Work around clang bug https://godbolt.org/z/zedh7rrhc
> -+  return (void)max_mantissa[0], max_mantissa[power];
> -+}
> -+
> -+template <>
> -+inline constexpr double
> -+binary_format<double>::exact_power_of_ten(int64_t power) {
> -+  // Work around clang bug https://godbolt.org/z/zedh7rrhc
> -+  return (void)powers_of_ten[0], powers_of_ten[power];
> -+}
> -+template <>
> -+inline constexpr float binary_format<float>::exact_power_of_ten(int64_t
> power) {
> -+  // Work around clang bug https://godbolt.org/z/zedh7rrhc
> -+  return (void)powers_of_ten[0], powers_of_ten[power];
> -+}
> -+
> -+template <> inline constexpr int
> binary_format<double>::largest_power_of_ten() {
> -+  return 308;
> -+}
> -+template <> inline constexpr int
> binary_format<float>::largest_power_of_ten() {
> -+  return 38;
> -+}
> -+
> -+template <>
> -+inline constexpr int binary_format<double>::smallest_power_of_ten() {
> -+  return -342;
> -+}
> -+template <> inline constexpr int
> binary_format<float>::smallest_power_of_ten() {
> -+  return -64;
> -+}
> -+
> -+template <> inline constexpr size_t binary_format<double>::max_digits()=
 {
> -+  return 769;
> -+}
> -+template <> inline constexpr size_t binary_format<float>::max_digits() =
{
> -+  return 114;
> -+}
> -+
> -+template <>
> -+inline constexpr binary_format<float>::equiv_uint
> -+binary_format<float>::exponent_mask() {
> -+  return 0x7F800000;
> -+}
> -+template <>
> -+inline constexpr binary_format<double>::equiv_uint
> -+binary_format<double>::exponent_mask() {
> -+  return 0x7FF0000000000000;
> -+}
> -+
> -+template <>
> -+inline constexpr binary_format<float>::equiv_uint
> -+binary_format<float>::mantissa_mask() {
> -+  return 0x007FFFFF;
> -+}
> -+template <>
> -+inline constexpr binary_format<double>::equiv_uint
> -+binary_format<double>::mantissa_mask() {
> -+  return 0x000FFFFFFFFFFFFF;
> -+}
> -+
> -+template <>
> -+inline constexpr binary_format<float>::equiv_uint
> -+binary_format<float>::hidden_bit_mask() {
> -+  return 0x00800000;
> -+}
> -+template <>
> -+inline constexpr binary_format<double>::equiv_uint
> -+binary_format<double>::hidden_bit_mask() {
> -+  return 0x0010000000000000;
> -+}
> -+
> -+template <typename T>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void
> -+to_float(bool negative, adjusted_mantissa am, T &value) {
> -+  using fastfloat_uint =3D typename binary_format<T>::equiv_uint;
> -+  fastfloat_uint word =3D (fastfloat_uint)am.mantissa;
> -+  word |=3D fastfloat_uint(am.power2)
> -+          << binary_format<T>::mantissa_explicit_bits();
> -+  word |=3D fastfloat_uint(negative) << binary_format<T>::sign_index();
> -+#if FASTFLOAT_HAS_BIT_CAST
> -+  value =3D std::bit_cast<T>(word);
> -+#else
> -+  ::memcpy(&value, &word, sizeof(T));
> -+#endif
> -+}
> -+
> -+#ifdef FASTFLOAT_SKIP_WHITE_SPACE // disabled by default
> -+template <typename =3D void> struct space_lut {
> -+  static constexpr bool value[] =3D {
> -+      0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
> 0, 0,
> -+      0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> 0, 0,
> -+      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> 0, 0,
> -+      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> 0, 0,
> -+      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> 0, 0,
> -+      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> 0, 0,
> -+      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> 0, 0,
> -+      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> 0, 0,
> -+      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> 0, 0,
> -+      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> 0, 0,
> -+      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
> -+};
> -+
> -+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE
> -+
> -+template <typename T> constexpr bool space_lut<T>::value[];
> -+
> -+#endif
> -+
> -+inline constexpr bool is_space(uint8_t c) { return
> space_lut<>::value[c]; }
> -+#endif
> -+
> -+template <typename UC> static constexpr uint64_t int_cmp_zeros() {
> -+  static_assert((sizeof(UC) =3D=3D 1) || (sizeof(UC) =3D=3D 2) || (size=
of(UC) =3D=3D
> 4),
> -+                "Unsupported character size");
> -+  return (sizeof(UC) =3D=3D 1) ? 0x3030303030303030
> -+         : (sizeof(UC) =3D=3D 2)
> -+             ? (uint64_t(UC('0')) << 48 | uint64_t(UC('0')) << 32 |
> -+                uint64_t(UC('0')) << 16 | UC('0'))
> -+             : (uint64_t(UC('0')) << 32 | UC('0'));
> -+}
> -+template <typename UC> static constexpr int int_cmp_len() {
> -+  return sizeof(uint64_t) / sizeof(UC);
> -+}
> -+template <typename UC> static constexpr UC const *str_const_nan() {
> -+  return nullptr;
> -+}
> -+template <> constexpr char const *str_const_nan<char>() { return "nan";=
 }
> -+template <> constexpr wchar_t const *str_const_nan<wchar_t>() { return
> L"nan"; }
> -+template <> constexpr char16_t const *str_const_nan<char16_t>() {
> -+  return u"nan";
> -+}
> -+template <> constexpr char32_t const *str_const_nan<char32_t>() {
> -+  return U"nan";
> -+}
> -+template <typename UC> static constexpr UC const *str_const_inf() {
> -+  return nullptr;
> -+}
> -+template <> constexpr char const *str_const_inf<char>() { return
> "infinity"; }
> -+template <> constexpr wchar_t const *str_const_inf<wchar_t>() {
> -+  return L"infinity";
> -+}
> -+template <> constexpr char16_t const *str_const_inf<char16_t>() {
> -+  return u"infinity";
> -+}
> -+template <> constexpr char32_t const *str_const_inf<char32_t>() {
> -+  return U"infinity";
> -+}
> -+
> -+template <typename =3D void> struct int_luts {
> -+  static constexpr uint8_t chdigit[] =3D {
> -+      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255, 255, 255, 0,   1,   2,   3,   4,   5,   6,   7,   8,   9,
>  255, 255,
> -+      255, 255, 255, 255, 255, 10,  11,  12,  13,  14,  15,  16,  17,
> 18,  19,
> -+      20,  21,  22,  23,  24,  25,  26,  27,  28,  29,  30,  31,  32,
> 33,  34,
> -+      35,  255, 255, 255, 255, 255, 255, 10,  11,  12,  13,  14,  15,
> 16,  17,
> -+      18,  19,  20,  21,  22,  23,  24,  25,  26,  27,  28,  29,  30,
> 31,  32,
> -+      33,  34,  35,  255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
> 255, 255,
> -+      255};
> -+
> -+  static constexpr size_t maxdigits_u64[] =3D {
> -+      64, 41, 32, 28, 25, 23, 22, 21, 20, 19, 18, 18, 17, 17, 16, 16,
> 16, 16,
> -+      15, 15, 15, 15, 14, 14, 14, 14, 14, 14, 14, 13, 13, 13, 13, 13,
> 13};
> -+
> -+  static constexpr uint64_t min_safe_u64[] =3D {
> -+      9223372036854775808ull,  12157665459056928801ull,
> 4611686018427387904,
> -+      7450580596923828125,     4738381338321616896,
>  3909821048582988049,
> -+      9223372036854775808ull,  12157665459056928801ull,
> 10000000000000000000ull,
> -+      5559917313492231481,     2218611106740436992,
>  8650415919381337933,
> -+      2177953337809371136,     6568408355712890625,
>  1152921504606846976,
> -+      2862423051509815793,     6746640616477458432,
>  15181127029874798299ull,
> -+      1638400000000000000,     3243919932521508681,
>  6221821273427820544,
> -+      11592836324538749809ull, 876488338465357824,
> 1490116119384765625,
> -+      2481152873203736576,     4052555153018976267,
>  6502111422497947648,
> -+      10260628712958602189ull, 15943230000000000000ull,
> 787662783788549761,
> -+      1152921504606846976,     1667889514952984961,
>  2386420683693101056,
> -+      3379220508056640625,     4738381338321616896};
> -+};
> -+
> -+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE
> -+
> -+template <typename T> constexpr uint8_t int_luts<T>::chdigit[];
> -+
> -+template <typename T> constexpr size_t int_luts<T>::maxdigits_u64[];
> -+
> -+template <typename T> constexpr uint64_t int_luts<T>::min_safe_u64[];
> -+
> -+#endif
> -+
> -+template <typename UC>
> -+fastfloat_really_inline constexpr uint8_t ch_to_digit(UC c) {
> -+  return int_luts<>::chdigit[static_cast<unsigned char>(c)];
> -+}
> -+
> -+fastfloat_really_inline constexpr size_t max_digits_u64(int base) {
> -+  return int_luts<>::maxdigits_u64[base - 2];
> -+}
> -+
> -+// If a u64 is exactly max_digits_u64() in length, this is
> -+// the value below which it has definitely overflowed.
> -+fastfloat_really_inline constexpr uint64_t min_safe_u64(int base) {
> -+  return int_luts<>::min_safe_u64[base - 2];
> -+}
> -+
> -+} // namespace fast_float
> -+
> -+#endif
> -+
> -+
> -+#ifndef FASTFLOAT_FAST_FLOAT_H
> -+#define FASTFLOAT_FAST_FLOAT_H
> -+
> -+
> -+namespace fast_float {
> -+/**
> -+ * This function parses the character sequence [first,last) for a
> number. It
> -+ * parses floating-point numbers expecting a locale-indepent format
> equivalent
> -+ * to what is used by std::strtod in the default ("C") locale. The
> resulting
> -+ * floating-point value is the closest floating-point values (using
> either float
> -+ * or double), using the "round to even" convention for values that wou=
ld
> -+ * otherwise fall right in-between two values. That is, we provide exac=
t
> parsing
> -+ * according to the IEEE standard.
> -+ *
> -+ * Given a successful parse, the pointer (`ptr`) in the returned value
> is set to
> -+ * point right after the parsed number, and the `value` referenced is
> set to the
> -+ * parsed value. In case of error, the returned `ec` contains a
> representative
> -+ * error, otherwise the default (`std::errc()`) value is stored.
> -+ *
> -+ * The implementation does not throw and does not allocate memory (e.g.=
,
> with
> -+ * `new` or `malloc`).
> -+ *
> -+ * Like the C++17 standard, the `fast_float::from_chars` functions take
> an
> -+ * optional last argument of the type `fast_float::chars_format`. It is
> a bitset
> -+ * value: we check whether `fmt & fast_float::chars_format::fixed` and
> `fmt &
> -+ * fast_float::chars_format::scientific` are set to determine whether w=
e
> allow
> -+ * the fixed point and scientific notation respectively. The default is
> -+ * `fast_float::chars_format::general` which allows both `fixed` and
> -+ * `scientific`.
> -+ */
> -+template <typename T, typename UC =3D char,
> -+          typename =3D FASTFLOAT_ENABLE_IF(is_supported_float_type<T>()=
)>
> -+FASTFLOAT_CONSTEXPR20 from_chars_result_t<UC>
> -+from_chars(UC const *first, UC const *last, T &value,
> -+           chars_format fmt =3D chars_format::general) noexcept;
> -+
> -+/**
> -+ * Like from_chars, but accepts an `options` argument to govern number
> parsing.
> -+ */
> -+template <typename T, typename UC =3D char>
> -+FASTFLOAT_CONSTEXPR20 from_chars_result_t<UC>
> -+from_chars_advanced(UC const *first, UC const *last, T &value,
> -+                    parse_options_t<UC> options) noexcept;
> -+/**
> -+ * from_chars for integer types.
> -+ */
> -+template <typename T, typename UC =3D char,
> -+          typename =3D FASTFLOAT_ENABLE_IF(!is_supported_float_type<T>(=
))>
> -+FASTFLOAT_CONSTEXPR20 from_chars_result_t<UC>
> -+from_chars(UC const *first, UC const *last, T &value, int base =3D 10)
> noexcept;
> -+
> -+} // namespace fast_float
> -+#endif // FASTFLOAT_FAST_FLOAT_H
> -+
> -+#ifndef FASTFLOAT_ASCII_NUMBER_H
> -+#define FASTFLOAT_ASCII_NUMBER_H
> -+
> -+#include <cctype>
> -+#include <cstdint>
> -+#include <cstring>
> -+#include <iterator>
> -+#include <limits>
> -+#include <type_traits>
> -+
> -+
> -+#ifdef FASTFLOAT_SSE2
> -+#include <emmintrin.h>
> -+#endif
> -+
> -+#ifdef FASTFLOAT_NEON
> -+#include <arm_neon.h>
> -+#endif
> -+
> -+namespace fast_float {
> -+
> -+template <typename UC> fastfloat_really_inline constexpr bool
> has_simd_opt() {
> -+#ifdef FASTFLOAT_HAS_SIMD
> -+  return std::is_same<UC, char16_t>::value;
> -+#else
> -+  return false;
> -+#endif
> -+}
> -+
> -+// Next function can be micro-optimized, but compilers are entirely
> -+// able to optimize it well.
> -+template <typename UC>
> -+fastfloat_really_inline constexpr bool is_integer(UC c) noexcept {
> -+  return !(c > UC('9') || c < UC('0'));
> -+}
> -+
> -+fastfloat_really_inline constexpr uint64_t byteswap(uint64_t val) {
> -+  return (val & 0xFF00000000000000) >> 56 | (val & 0x00FF000000000000)
> >> 40 |
> -+         (val & 0x0000FF0000000000) >> 24 | (val & 0x000000FF00000000)
> >> 8 |
> -+         (val & 0x00000000FF000000) << 8 | (val & 0x0000000000FF0000) <=
<
> 24 |
> -+         (val & 0x000000000000FF00) << 40 | (val & 0x00000000000000FF)
> << 56;
> -+}
> -+
> -+// Read 8 UC into a u64. Truncates UC if not char.
> -+template <typename UC>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t
> -+read8_to_u64(const UC *chars) {
> -+  if (cpp20_and_in_constexpr() || !std::is_same<UC, char>::value) {
> -+    uint64_t val =3D 0;
> -+    for (int i =3D 0; i < 8; ++i) {
> -+      val |=3D uint64_t(uint8_t(*chars)) << (i * 8);
> -+      ++chars;
> -+    }
> -+    return val;
> -+  }
> -+  uint64_t val;
> -+  ::memcpy(&val, chars, sizeof(uint64_t));
> -+#if FASTFLOAT_IS_BIG_ENDIAN =3D=3D 1
> -+  // Need to read as-if the number was in little-endian order.
> -+  val =3D byteswap(val);
> -+#endif
> -+  return val;
> -+}
> -+
> -+#ifdef FASTFLOAT_SSE2
> -+
> -+fastfloat_really_inline uint64_t simd_read8_to_u64(const __m128i data) =
{
> -+  FASTFLOAT_SIMD_DISABLE_WARNINGS
> -+  const __m128i packed =3D _mm_packus_epi16(data, data);
> -+#ifdef FASTFLOAT_64BIT
> -+  return uint64_t(_mm_cvtsi128_si64(packed));
> -+#else
> -+  uint64_t value;
> -+  // Visual Studio + older versions of GCC don't support _mm_storeu_si6=
4
> -+  _mm_storel_epi64(reinterpret_cast<__m128i *>(&value), packed);
> -+  return value;
> -+#endif
> -+  FASTFLOAT_SIMD_RESTORE_WARNINGS
> -+}
> -+
> -+fastfloat_really_inline uint64_t simd_read8_to_u64(const char16_t
> *chars) {
> -+  FASTFLOAT_SIMD_DISABLE_WARNINGS
> -+  return simd_read8_to_u64(
> -+      _mm_loadu_si128(reinterpret_cast<const __m128i *>(chars)));
> -+  FASTFLOAT_SIMD_RESTORE_WARNINGS
> -+}
> -+
> -+#elif defined(FASTFLOAT_NEON)
> -+
> -+fastfloat_really_inline uint64_t simd_read8_to_u64(const uint16x8_t
> data) {
> -+  FASTFLOAT_SIMD_DISABLE_WARNINGS
> -+  uint8x8_t utf8_packed =3D vmovn_u16(data);
> -+  return vget_lane_u64(vreinterpret_u64_u8(utf8_packed), 0);
> -+  FASTFLOAT_SIMD_RESTORE_WARNINGS
> -+}
> -+
> -+fastfloat_really_inline uint64_t simd_read8_to_u64(const char16_t
> *chars) {
> -+  FASTFLOAT_SIMD_DISABLE_WARNINGS
> -+  return simd_read8_to_u64(
> -+      vld1q_u16(reinterpret_cast<const uint16_t *>(chars)));
> -+  FASTFLOAT_SIMD_RESTORE_WARNINGS
> -+}
> -+
> -+#endif // FASTFLOAT_SSE2
> -+
> -+// MSVC SFINAE is broken pre-VS2017
> -+#if defined(_MSC_VER) && _MSC_VER <=3D 1900
> -+template <typename UC>
> -+#else
> -+template <typename UC, FASTFLOAT_ENABLE_IF(!has_simd_opt<UC>()) =3D 0>
> -+#endif
> -+// dummy for compile
> -+uint64_t simd_read8_to_u64(UC const *) {
> -+  return 0;
> -+}
> -+
> -+// credit  @aqrit
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 uint32_t
> -+parse_eight_digits_unrolled(uint64_t val) {
> -+  const uint64_t mask =3D 0x000000FF000000FF;
> -+  const uint64_t mul1 =3D 0x000F424000000064; // 100 + (1000000ULL << 3=
2)
> -+  const uint64_t mul2 =3D 0x0000271000000001; // 1 + (10000ULL << 32)
> -+  val -=3D 0x3030303030303030;
> -+  val =3D (val * 10) + (val >> 8); // val =3D (val * 2561) >> 8;
> -+  val =3D (((val & mask) * mul1) + (((val >> 16) & mask) * mul2)) >> 32=
;
> -+  return uint32_t(val);
> -+}
> -+
> -+// Call this if chars are definitely 8 digits.
> -+template <typename UC>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint32_t
> -+parse_eight_digits_unrolled(UC const *chars) noexcept {
> -+  if (cpp20_and_in_constexpr() || !has_simd_opt<UC>()) {
> -+    return parse_eight_digits_unrolled(read8_to_u64(chars)); //
> truncation okay
> -+  }
> -+  return parse_eight_digits_unrolled(simd_read8_to_u64(chars));
> -+}
> -+
> -+// credit @aqrit
> -+fastfloat_really_inline constexpr bool
> -+is_made_of_eight_digits_fast(uint64_t val) noexcept {
> -+  return !((((val + 0x4646464646464646) | (val - 0x3030303030303030)) &
> -+            0x8080808080808080));
> -+}
> -+
> -+#ifdef FASTFLOAT_HAS_SIMD
> -+
> -+// Call this if chars might not be 8 digits.
> -+// Using this style (instead of is_made_of_eight_digits_fast() then
> -+// parse_eight_digits_unrolled()) ensures we don't load SIMD registers
> twice.
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 bool
> -+simd_parse_if_eight_digits_unrolled(const char16_t *chars,
> -+                                    uint64_t &i) noexcept {
> -+  if (cpp20_and_in_constexpr()) {
> -+    return false;
> -+  }
> -+#ifdef FASTFLOAT_SSE2
> -+  FASTFLOAT_SIMD_DISABLE_WARNINGS
> -+  const __m128i data =3D
> -+      _mm_loadu_si128(reinterpret_cast<const __m128i *>(chars));
> -+
> -+  // (x - '0') <=3D 9
> -+  // http://0x80.pl/articles/simd-parsing-int-sequences.html
> -+  const __m128i t0 =3D _mm_add_epi16(data, _mm_set1_epi16(32720));
> -+  const __m128i t1 =3D _mm_cmpgt_epi16(t0, _mm_set1_epi16(-32759));
> -+
> -+  if (_mm_movemask_epi8(t1) =3D=3D 0) {
> -+    i =3D i * 100000000 +
> parse_eight_digits_unrolled(simd_read8_to_u64(data));
> -+    return true;
> -+  } else
> -+    return false;
> -+  FASTFLOAT_SIMD_RESTORE_WARNINGS
> -+#elif defined(FASTFLOAT_NEON)
> -+  FASTFLOAT_SIMD_DISABLE_WARNINGS
> -+  const uint16x8_t data =3D vld1q_u16(reinterpret_cast<const uint16_t
> *>(chars));
> -+
> -+  // (x - '0') <=3D 9
> -+  // http://0x80.pl/articles/simd-parsing-int-sequences.html
> -+  const uint16x8_t t0 =3D vsubq_u16(data, vmovq_n_u16('0'));
> -+  const uint16x8_t mask =3D vcltq_u16(t0, vmovq_n_u16('9' - '0' + 1));
> -+
> -+  if (vminvq_u16(mask) =3D=3D 0xFFFF) {
> -+    i =3D i * 100000000 +
> parse_eight_digits_unrolled(simd_read8_to_u64(data));
> -+    return true;
> -+  } else
> -+    return false;
> -+  FASTFLOAT_SIMD_RESTORE_WARNINGS
> -+#else
> -+  (void)chars;
> -+  (void)i;
> -+  return false;
> -+#endif // FASTFLOAT_SSE2
> -+}
> -+
> -+#endif // FASTFLOAT_HAS_SIMD
> -+
> -+// MSVC SFINAE is broken pre-VS2017
> -+#if defined(_MSC_VER) && _MSC_VER <=3D 1900
> -+template <typename UC>
> -+#else
> -+template <typename UC, FASTFLOAT_ENABLE_IF(!has_simd_opt<UC>()) =3D 0>
> -+#endif
> -+// dummy for compile
> -+bool simd_parse_if_eight_digits_unrolled(UC const *, uint64_t &) {
> -+  return 0;
> -+}
> -+
> -+template <typename UC, FASTFLOAT_ENABLE_IF(!std::is_same<UC,
> char>::value) =3D 0>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void
> -+loop_parse_if_eight_digits(const UC *&p, const UC *const pend, uint64_t
> &i) {
> -+  if (!has_simd_opt<UC>()) {
> -+    return;
> -+  }
> -+  while ((std::distance(p, pend) >=3D 8) &&
> -+         simd_parse_if_eight_digits_unrolled(
> -+             p, i)) { // in rare cases, this will overflow, but that's =
ok
> -+    p +=3D 8;
> -+  }
> -+}
> -+
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void
> -+loop_parse_if_eight_digits(const char *&p, const char *const pend,
> -+                           uint64_t &i) {
> -+  // optimizes better than parse_if_eight_digits_unrolled() for UC =3D
> char.
> -+  while ((std::distance(p, pend) >=3D 8) &&
> -+         is_made_of_eight_digits_fast(read8_to_u64(p))) {
> -+    i =3D i * 100000000 +
> -+        parse_eight_digits_unrolled(read8_to_u64(
> -+            p)); // in rare cases, this will overflow, but that's ok
> -+    p +=3D 8;
> -+  }
> -+}
> -+
> -+enum class parse_error {
> -+  no_error,
> -+  // [JSON-only] The minus sign must be followed by an integer.
> -+  missing_integer_after_sign,
> -+  // A sign must be followed by an integer or dot.
> -+  missing_integer_or_dot_after_sign,
> -+  // [JSON-only] The integer part must not have leading zeros.
> -+  leading_zeros_in_integer_part,
> -+  // [JSON-only] The integer part must have at least one digit.
> -+  no_digits_in_integer_part,
> -+  // [JSON-only] If there is a decimal point, there must be digits in t=
he
> -+  // fractional part.
> -+  no_digits_in_fractional_part,
> -+  // The mantissa must have at least one digit.
> -+  no_digits_in_mantissa,
> -+  // Scientific notation requires an exponential part.
> -+  missing_exponential_part,
> -+};
> -+
> -+template <typename UC> struct parsed_number_string_t {
> -+  int64_t exponent{0};
> -+  uint64_t mantissa{0};
> -+  UC const *lastmatch{nullptr};
> -+  bool negative{false};
> -+  bool valid{false};
> -+  bool too_many_digits{false};
> -+  // contains the range of the significant digits
> -+  span<const UC> integer{};  // non-nullable
> -+  span<const UC> fraction{}; // nullable
> -+  parse_error error{parse_error::no_error};
> -+};
> -+
> -+using byte_span =3D span<const char>;
> -+using parsed_number_string =3D parsed_number_string_t<char>;
> -+
> -+template <typename UC>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 parsed_number_string_t<UC=
>
> -+report_parse_error(UC const *p, parse_error error) {
> -+  parsed_number_string_t<UC> answer;
> -+  answer.valid =3D false;
> -+  answer.lastmatch =3D p;
> -+  answer.error =3D error;
> -+  return answer;
> -+}
> -+
> -+// Assuming that you use no more than 19 digits, this will
> -+// parse an ASCII string.
> -+template <typename UC>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 parsed_number_string_t<UC=
>
> -+parse_number_string(UC const *p, UC const *pend,
> -+                    parse_options_t<UC> options) noexcept {
> -+  chars_format const fmt =3D options.format;
> -+  UC const decimal_point =3D options.decimal_point;
> -+
> -+  parsed_number_string_t<UC> answer;
> -+  answer.valid =3D false;
> -+  answer.too_many_digits =3D false;
> -+  answer.negative =3D (*p =3D=3D UC('-'));
> -+#ifdef FASTFLOAT_ALLOWS_LEADING_PLUS // disabled by default
> -+  if ((*p =3D=3D UC('-')) || (!(fmt & FASTFLOAT_JSONFMT) && *p =3D=3D U=
C('+'))) {
> -+#else
> -+  if (*p =3D=3D UC('-')) { // C++17 20.19.3.(7.1) explicitly forbids '+=
'
> sign here
> -+#endif
> -+    ++p;
> -+    if (p =3D=3D pend) {
> -+      return report_parse_error<UC>(
> -+          p, parse_error::missing_integer_or_dot_after_sign);
> -+    }
> -+    if (fmt & FASTFLOAT_JSONFMT) {
> -+      if (!is_integer(*p)) { // a sign must be followed by an integer
> -+        return report_parse_error<UC>(p,
> -+
> parse_error::missing_integer_after_sign);
> -+      }
> -+    } else {
> -+      if (!is_integer(*p) &&
> -+          (*p !=3D
> -+           decimal_point)) { // a sign must be followed by an integer o=
r
> the dot
> -+        return report_parse_error<UC>(
> -+            p, parse_error::missing_integer_or_dot_after_sign);
> -+      }
> -+    }
> -+  }
> -+  UC const *const start_digits =3D p;
> -+
> -+  uint64_t i =3D 0; // an unsigned int avoids signed overflows (which a=
re
> bad)
> -+
> -+  while ((p !=3D pend) && is_integer(*p)) {
> -+    // a multiplication by 10 is cheaper than an arbitrary integer
> -+    // multiplication
> -+    i =3D 10 * i +
> -+        uint64_t(*p -
> -+                 UC('0')); // might overflow, we will handle the
> overflow later
> -+    ++p;
> -+  }
> -+  UC const *const end_of_integer_part =3D p;
> -+  int64_t digit_count =3D int64_t(end_of_integer_part - start_digits);
> -+  answer.integer =3D span<const UC>(start_digits, size_t(digit_count));
> -+  if (fmt & FASTFLOAT_JSONFMT) {
> -+    // at least 1 digit in integer part, without leading zeros
> -+    if (digit_count =3D=3D 0) {
> -+      return report_parse_error<UC>(p,
> parse_error::no_digits_in_integer_part);
> -+    }
> -+    if ((start_digits[0] =3D=3D UC('0') && digit_count > 1)) {
> -+      return report_parse_error<UC>(start_digits,
> -+
> parse_error::leading_zeros_in_integer_part);
> -+    }
> -+  }
> -+
> -+  int64_t exponent =3D 0;
> -+  const bool has_decimal_point =3D (p !=3D pend) && (*p =3D=3D decimal_=
point);
> -+  if (has_decimal_point) {
> -+    ++p;
> -+    UC const *before =3D p;
> -+    // can occur at most twice without overflowing, but let it occur
> more, since
> -+    // for integers with many digits, digit parsing is the primary
> bottleneck.
> -+    loop_parse_if_eight_digits(p, pend, i);
> -+
> -+    while ((p !=3D pend) && is_integer(*p)) {
> -+      uint8_t digit =3D uint8_t(*p - UC('0'));
> -+      ++p;
> -+      i =3D i * 10 + digit; // in rare cases, this will overflow, but
> that's ok
> -+    }
> -+    exponent =3D before - p;
> -+    answer.fraction =3D span<const UC>(before, size_t(p - before));
> -+    digit_count -=3D exponent;
> -+  }
> -+  if (fmt & FASTFLOAT_JSONFMT) {
> -+    // at least 1 digit in fractional part
> -+    if (has_decimal_point && exponent =3D=3D 0) {
> -+      return report_parse_error<UC>(p,
> -+
> parse_error::no_digits_in_fractional_part);
> -+    }
> -+  } else if (digit_count =3D=3D
> -+             0) { // we must have encountered at least one integer!
> -+    return report_parse_error<UC>(p, parse_error::no_digits_in_mantissa=
);
> -+  }
> -+  int64_t exp_number =3D 0; // explicit exponential part
> -+  if (((fmt & chars_format::scientific) && (p !=3D pend) &&
> -+       ((UC('e') =3D=3D *p) || (UC('E') =3D=3D *p))) ||
> -+      ((fmt & FASTFLOAT_FORTRANFMT) && (p !=3D pend) &&
> -+       ((UC('+') =3D=3D *p) || (UC('-') =3D=3D *p) || (UC('d') =3D=3D *=
p) ||
> -+        (UC('D') =3D=3D *p)))) {
> -+    UC const *location_of_e =3D p;
> -+    if ((UC('e') =3D=3D *p) || (UC('E') =3D=3D *p) || (UC('d') =3D=3D *=
p) ||
> -+        (UC('D') =3D=3D *p)) {
> -+      ++p;
> -+    }
> -+    bool neg_exp =3D false;
> -+    if ((p !=3D pend) && (UC('-') =3D=3D *p)) {
> -+      neg_exp =3D true;
> -+      ++p;
> -+    } else if ((p !=3D pend) &&
> -+               (UC('+') =3D=3D
> -+                *p)) { // '+' on exponent is allowed by C++17
> 20.19.3.(7.1)
> -+      ++p;
> -+    }
> -+    if ((p =3D=3D pend) || !is_integer(*p)) {
> -+      if (!(fmt & chars_format::fixed)) {
> -+        // The exponential part is invalid for scientific notation, so
> it must
> -+        // be a trailing token for fixed notation. However, fixed
> notation is
> -+        // disabled, so report a scientific notation error.
> -+        return report_parse_error<UC>(p,
> parse_error::missing_exponential_part);
> -+      }
> -+      // Otherwise, we will be ignoring the 'e'.
> -+      p =3D location_of_e;
> -+    } else {
> -+      while ((p !=3D pend) && is_integer(*p)) {
> -+        uint8_t digit =3D uint8_t(*p - UC('0'));
> -+        if (exp_number < 0x10000000) {
> -+          exp_number =3D 10 * exp_number + digit;
> -+        }
> -+        ++p;
> -+      }
> -+      if (neg_exp) {
> -+        exp_number =3D -exp_number;
> -+      }
> -+      exponent +=3D exp_number;
> -+    }
> -+  } else {
> -+    // If it scientific and not fixed, we have to bail out.
> -+    if ((fmt & chars_format::scientific) && !(fmt &
> chars_format::fixed)) {
> -+      return report_parse_error<UC>(p,
> parse_error::missing_exponential_part);
> -+    }
> -+  }
> -+  answer.lastmatch =3D p;
> -+  answer.valid =3D true;
> -+
> -+  // If we frequently had to deal with long strings of digits,
> -+  // we could extend our code by using a 128-bit integer instead
> -+  // of a 64-bit integer. However, this is uncommon.
> -+  //
> -+  // We can deal with up to 19 digits.
> -+  if (digit_count > 19) { // this is uncommon
> -+    // It is possible that the integer had an overflow.
> -+    // We have to handle the case where we have 0.0000somenumber.
> -+    // We need to be mindful of the case where we only have zeroes...
> -+    // E.g., 0.000000000...000.
> -+    UC const *start =3D start_digits;
> -+    while ((start !=3D pend) && (*start =3D=3D UC('0') || *start =3D=3D
> decimal_point)) {
> -+      if (*start =3D=3D UC('0')) {
> -+        digit_count--;
> -+      }
> -+      start++;
> -+    }
> -+
> -+    if (digit_count > 19) {
> -+      answer.too_many_digits =3D true;
> -+      // Let us start again, this time, avoiding overflows.
> -+      // We don't need to check if is_integer, since we use the
> -+      // pre-tokenized spans from above.
> -+      i =3D 0;
> -+      p =3D answer.integer.ptr;
> -+      UC const *int_end =3D p + answer.integer.len();
> -+      const uint64_t minimal_nineteen_digit_integer{1000000000000000000=
};
> -+      while ((i < minimal_nineteen_digit_integer) && (p !=3D int_end)) =
{
> -+        i =3D i * 10 + uint64_t(*p - UC('0'));
> -+        ++p;
> -+      }
> -+      if (i >=3D minimal_nineteen_digit_integer) { // We have a big
> integers
> -+        exponent =3D end_of_integer_part - p + exp_number;
> -+      } else { // We have a value with a fractional component.
> -+        p =3D answer.fraction.ptr;
> -+        UC const *frac_end =3D p + answer.fraction.len();
> -+        while ((i < minimal_nineteen_digit_integer) && (p !=3D frac_end=
)) {
> -+          i =3D i * 10 + uint64_t(*p - UC('0'));
> -+          ++p;
> -+        }
> -+        exponent =3D answer.fraction.ptr - p + exp_number;
> -+      }
> -+      // We have now corrected both exponent and i, to a truncated valu=
e
> -+    }
> -+  }
> -+  answer.exponent =3D exponent;
> -+  answer.mantissa =3D i;
> -+  return answer;
> -+}
> -+
> -+template <typename T, typename UC>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 from_chars_result_t<UC>
> -+parse_int_string(UC const *p, UC const *pend, T &value, int base) {
> -+  from_chars_result_t<UC> answer;
> -+
> -+  UC const *const first =3D p;
> -+
> -+  bool negative =3D (*p =3D=3D UC('-'));
> -+  if (!std::is_signed<T>::value && negative) {
> -+    answer.ec =3D std::errc::invalid_argument;
> -+    answer.ptr =3D first;
> -+    return answer;
> -+  }
> -+#ifdef FASTFLOAT_ALLOWS_LEADING_PLUS // disabled by default
> -+  if ((*p =3D=3D UC('-')) || (*p =3D=3D UC('+'))) {
> -+#else
> -+  if (*p =3D=3D UC('-')) {
> -+#endif
> -+    ++p;
> -+  }
> -+
> -+  UC const *const start_num =3D p;
> -+
> -+  while (p !=3D pend && *p =3D=3D UC('0')) {
> -+    ++p;
> -+  }
> -+
> -+  const bool has_leading_zeros =3D p > start_num;
> -+
> -+  UC const *const start_digits =3D p;
> -+
> -+  uint64_t i =3D 0;
> -+  if (base =3D=3D 10) {
> -+    loop_parse_if_eight_digits(p, pend, i); // use SIMD if possible
> -+  }
> -+  while (p !=3D pend) {
> -+    uint8_t digit =3D ch_to_digit(*p);
> -+    if (digit >=3D base) {
> -+      break;
> -+    }
> -+    i =3D uint64_t(base) * i + digit; // might overflow, check this lat=
er
> -+    p++;
> -+  }
> -+
> -+  size_t digit_count =3D size_t(p - start_digits);
> -+
> -+  if (digit_count =3D=3D 0) {
> -+    if (has_leading_zeros) {
> -+      value =3D 0;
> -+      answer.ec =3D std::errc();
> -+      answer.ptr =3D p;
> -+    } else {
> -+      answer.ec =3D std::errc::invalid_argument;
> -+      answer.ptr =3D first;
> -+    }
> -+    return answer;
> -+  }
> -+
> -+  answer.ptr =3D p;
> -+
> -+  // check u64 overflow
> -+  size_t max_digits =3D max_digits_u64(base);
> -+  if (digit_count > max_digits) {
> -+    answer.ec =3D std::errc::result_out_of_range;
> -+    return answer;
> -+  }
> -+  // this check can be eliminated for all other types, but they will al=
l
> require
> -+  // a max_digits(base) equivalent
> -+  if (digit_count =3D=3D max_digits && i < min_safe_u64(base)) {
> -+    answer.ec =3D std::errc::result_out_of_range;
> -+    return answer;
> -+  }
> -+
> -+  // check other types overflow
> -+  if (!std::is_same<T, uint64_t>::value) {
> -+    if (i > uint64_t(std::numeric_limits<T>::max()) +
> uint64_t(negative)) {
> -+      answer.ec =3D std::errc::result_out_of_range;
> -+      return answer;
> -+    }
> -+  }
> -+
> -+  if (negative) {
> -+#ifdef FASTFLOAT_VISUAL_STUDIO
> -+#pragma warning(push)
> -+#pragma warning(disable : 4146)
> -+#endif
> -+    // this weird workaround is required because:
> -+    // - converting unsigned to signed when its value is greater than
> signed max
> -+    // is UB pre-C++23.
> -+    // - reinterpret_casting (~i + 1) would work, but it is not constex=
pr
> -+    // this is always optimized into a neg instruction (note: T is an
> integer
> -+    // type)
> -+    value =3D T(-std::numeric_limits<T>::max() -
> -+              T(i - uint64_t(std::numeric_limits<T>::max())));
> -+#ifdef FASTFLOAT_VISUAL_STUDIO
> -+#pragma warning(pop)
> -+#endif
> -+  } else {
> -+    value =3D T(i);
> -+  }
> -+
> -+  answer.ec =3D std::errc();
> -+  return answer;
> -+}
> -+
> -+} // namespace fast_float
> -+
> -+#endif
> -+
> -+#ifndef FASTFLOAT_FAST_TABLE_H
> -+#define FASTFLOAT_FAST_TABLE_H
> -+
> -+#include <cstdint>
> -+
> -+namespace fast_float {
> -+
> -+/**
> -+ * When mapping numbers from decimal to binary,
> -+ * we go from w * 10^q to m * 2^p but we have
> -+ * 10^q =3D 5^q * 2^q, so effectively
> -+ * we are trying to match
> -+ * w * 2^q * 5^q to m * 2^p. Thus the powers of two
> -+ * are not a concern since they can be represented
> -+ * exactly using the binary notation, only the powers of five
> -+ * affect the binary significand.
> -+ */
> -+
> -+/**
> -+ * The smallest non-zero float (binary64) is 2^-1074.
> -+ * We take as input numbers of the form w x 10^q where w < 2^64.
> -+ * We have that w * 10^-343  <  2^(64-344) 5^-343 < 2^-1076.
> -+ * However, we have that
> -+ * (2^64-1) * 10^-342 =3D  (2^64-1) * 2^-342 * 5^-342 > 2^-1074.
> -+ * Thus it is possible for a number of the form w * 10^-342 where
> -+ * w is a 64-bit value to be a non-zero floating-point number.
> -+ *********
> -+ * Any number of form w * 10^309 where w>=3D 1 is going to be
> -+ * infinite in binary64 so we never need to worry about powers
> -+ * of 5 greater than 308.
> -+ */
> -+template <class unused =3D void> struct powers_template {
> -+
> -+  constexpr static int smallest_power_of_five =3D
> -+      binary_format<double>::smallest_power_of_ten();
> -+  constexpr static int largest_power_of_five =3D
> -+      binary_format<double>::largest_power_of_ten();
> -+  constexpr static int number_of_entries =3D
> -+      2 * (largest_power_of_five - smallest_power_of_five + 1);
> -+  // Powers of five from 5^-342 all the way to 5^308 rounded toward one=
.
> -+  constexpr static uint64_t power_of_five_128[number_of_entries] =3D {
> -+      0xeef453d6923bd65a, 0x113faa2906a13b3f,
> -+      0x9558b4661b6565f8, 0x4ac7ca59a424c507,
> -+      0xbaaee17fa23ebf76, 0x5d79bcf00d2df649,
> -+      0xe95a99df8ace6f53, 0xf4d82c2c107973dc,
> -+      0x91d8a02bb6c10594, 0x79071b9b8a4be869,
> -+      0xb64ec836a47146f9, 0x9748e2826cdee284,
> -+      0xe3e27a444d8d98b7, 0xfd1b1b2308169b25,
> -+      0x8e6d8c6ab0787f72, 0xfe30f0f5e50e20f7,
> -+      0xb208ef855c969f4f, 0xbdbd2d335e51a935,
> -+      0xde8b2b66b3bc4723, 0xad2c788035e61382,
> -+      0x8b16fb203055ac76, 0x4c3bcb5021afcc31,
> -+      0xaddcb9e83c6b1793, 0xdf4abe242a1bbf3d,
> -+      0xd953e8624b85dd78, 0xd71d6dad34a2af0d,
> -+      0x87d4713d6f33aa6b, 0x8672648c40e5ad68,
> -+      0xa9c98d8ccb009506, 0x680efdaf511f18c2,
> -+      0xd43bf0effdc0ba48, 0x212bd1b2566def2,
> -+      0x84a57695fe98746d, 0x14bb630f7604b57,
> -+      0xa5ced43b7e3e9188, 0x419ea3bd35385e2d,
> -+      0xcf42894a5dce35ea, 0x52064cac828675b9,
> -+      0x818995ce7aa0e1b2, 0x7343efebd1940993,
> -+      0xa1ebfb4219491a1f, 0x1014ebe6c5f90bf8,
> -+      0xca66fa129f9b60a6, 0xd41a26e077774ef6,
> -+      0xfd00b897478238d0, 0x8920b098955522b4,
> -+      0x9e20735e8cb16382, 0x55b46e5f5d5535b0,
> -+      0xc5a890362fddbc62, 0xeb2189f734aa831d,
> -+      0xf712b443bbd52b7b, 0xa5e9ec7501d523e4,
> -+      0x9a6bb0aa55653b2d, 0x47b233c92125366e,
> -+      0xc1069cd4eabe89f8, 0x999ec0bb696e840a,
> -+      0xf148440a256e2c76, 0xc00670ea43ca250d,
> -+      0x96cd2a865764dbca, 0x380406926a5e5728,
> -+      0xbc807527ed3e12bc, 0xc605083704f5ecf2,
> -+      0xeba09271e88d976b, 0xf7864a44c633682e,
> -+      0x93445b8731587ea3, 0x7ab3ee6afbe0211d,
> -+      0xb8157268fdae9e4c, 0x5960ea05bad82964,
> -+      0xe61acf033d1a45df, 0x6fb92487298e33bd,
> -+      0x8fd0c16206306bab, 0xa5d3b6d479f8e056,
> -+      0xb3c4f1ba87bc8696, 0x8f48a4899877186c,
> -+      0xe0b62e2929aba83c, 0x331acdabfe94de87,
> -+      0x8c71dcd9ba0b4925, 0x9ff0c08b7f1d0b14,
> -+      0xaf8e5410288e1b6f, 0x7ecf0ae5ee44dd9,
> -+      0xdb71e91432b1a24a, 0xc9e82cd9f69d6150,
> -+      0x892731ac9faf056e, 0xbe311c083a225cd2,
> -+      0xab70fe17c79ac6ca, 0x6dbd630a48aaf406,
> -+      0xd64d3d9db981787d, 0x92cbbccdad5b108,
> -+      0x85f0468293f0eb4e, 0x25bbf56008c58ea5,
> -+      0xa76c582338ed2621, 0xaf2af2b80af6f24e,
> -+      0xd1476e2c07286faa, 0x1af5af660db4aee1,
> -+      0x82cca4db847945ca, 0x50d98d9fc890ed4d,
> -+      0xa37fce126597973c, 0xe50ff107bab528a0,
> -+      0xcc5fc196fefd7d0c, 0x1e53ed49a96272c8,
> -+      0xff77b1fcbebcdc4f, 0x25e8e89c13bb0f7a,
> -+      0x9faacf3df73609b1, 0x77b191618c54e9ac,
> -+      0xc795830d75038c1d, 0xd59df5b9ef6a2417,
> -+      0xf97ae3d0d2446f25, 0x4b0573286b44ad1d,
> -+      0x9becce62836ac577, 0x4ee367f9430aec32,
> -+      0xc2e801fb244576d5, 0x229c41f793cda73f,
> -+      0xf3a20279ed56d48a, 0x6b43527578c1110f,
> -+      0x9845418c345644d6, 0x830a13896b78aaa9,
> -+      0xbe5691ef416bd60c, 0x23cc986bc656d553,
> -+      0xedec366b11c6cb8f, 0x2cbfbe86b7ec8aa8,
> -+      0x94b3a202eb1c3f39, 0x7bf7d71432f3d6a9,
> -+      0xb9e08a83a5e34f07, 0xdaf5ccd93fb0cc53,
> -+      0xe858ad248f5c22c9, 0xd1b3400f8f9cff68,
> -+      0x91376c36d99995be, 0x23100809b9c21fa1,
> -+      0xb58547448ffffb2d, 0xabd40a0c2832a78a,
> -+      0xe2e69915b3fff9f9, 0x16c90c8f323f516c,
> -+      0x8dd01fad907ffc3b, 0xae3da7d97f6792e3,
> -+      0xb1442798f49ffb4a, 0x99cd11cfdf41779c,
> -+      0xdd95317f31c7fa1d, 0x40405643d711d583,
> -+      0x8a7d3eef7f1cfc52, 0x482835ea666b2572,
> -+      0xad1c8eab5ee43b66, 0xda3243650005eecf,
> -+      0xd863b256369d4a40, 0x90bed43e40076a82,
> -+      0x873e4f75e2224e68, 0x5a7744a6e804a291,
> -+      0xa90de3535aaae202, 0x711515d0a205cb36,
> -+      0xd3515c2831559a83, 0xd5a5b44ca873e03,
> -+      0x8412d9991ed58091, 0xe858790afe9486c2,
> -+      0xa5178fff668ae0b6, 0x626e974dbe39a872,
> -+      0xce5d73ff402d98e3, 0xfb0a3d212dc8128f,
> -+      0x80fa687f881c7f8e, 0x7ce66634bc9d0b99,
> -+      0xa139029f6a239f72, 0x1c1fffc1ebc44e80,
> -+      0xc987434744ac874e, 0xa327ffb266b56220,
> -+      0xfbe9141915d7a922, 0x4bf1ff9f0062baa8,
> -+      0x9d71ac8fada6c9b5, 0x6f773fc3603db4a9,
> -+      0xc4ce17b399107c22, 0xcb550fb4384d21d3,
> -+      0xf6019da07f549b2b, 0x7e2a53a146606a48,
> -+      0x99c102844f94e0fb, 0x2eda7444cbfc426d,
> -+      0xc0314325637a1939, 0xfa911155fefb5308,
> -+      0xf03d93eebc589f88, 0x793555ab7eba27ca,
> -+      0x96267c7535b763b5, 0x4bc1558b2f3458de,
> -+      0xbbb01b9283253ca2, 0x9eb1aaedfb016f16,
> -+      0xea9c227723ee8bcb, 0x465e15a979c1cadc,
> -+      0x92a1958a7675175f, 0xbfacd89ec191ec9,
> -+      0xb749faed14125d36, 0xcef980ec671f667b,
> -+      0xe51c79a85916f484, 0x82b7e12780e7401a,
> -+      0x8f31cc0937ae58d2, 0xd1b2ecb8b0908810,
> -+      0xb2fe3f0b8599ef07, 0x861fa7e6dcb4aa15,
> -+      0xdfbdcece67006ac9, 0x67a791e093e1d49a,
> -+      0x8bd6a141006042bd, 0xe0c8bb2c5c6d24e0,
> -+      0xaecc49914078536d, 0x58fae9f773886e18,
> -+      0xda7f5bf590966848, 0xaf39a475506a899e,
> -+      0x888f99797a5e012d, 0x6d8406c952429603,
> -+      0xaab37fd7d8f58178, 0xc8e5087ba6d33b83,
> -+      0xd5605fcdcf32e1d6, 0xfb1e4a9a90880a64,
> -+      0x855c3be0a17fcd26, 0x5cf2eea09a55067f,
> -+      0xa6b34ad8c9dfc06f, 0xf42faa48c0ea481e,
> -+      0xd0601d8efc57b08b, 0xf13b94daf124da26,
> -+      0x823c12795db6ce57, 0x76c53d08d6b70858,
> -+      0xa2cb1717b52481ed, 0x54768c4b0c64ca6e,
> -+      0xcb7ddcdda26da268, 0xa9942f5dcf7dfd09,
> -+      0xfe5d54150b090b02, 0xd3f93b35435d7c4c,
> -+      0x9efa548d26e5a6e1, 0xc47bc5014a1a6daf,
> -+      0xc6b8e9b0709f109a, 0x359ab6419ca1091b,
> -+      0xf867241c8cc6d4c0, 0xc30163d203c94b62,
> -+      0x9b407691d7fc44f8, 0x79e0de63425dcf1d,
> -+      0xc21094364dfb5636, 0x985915fc12f542e4,
> -+      0xf294b943e17a2bc4, 0x3e6f5b7b17b2939d,
> -+      0x979cf3ca6cec5b5a, 0xa705992ceecf9c42,
> -+      0xbd8430bd08277231, 0x50c6ff782a838353,
> -+      0xece53cec4a314ebd, 0xa4f8bf5635246428,
> -+      0x940f4613ae5ed136, 0x871b7795e136be99,
> -+      0xb913179899f68584, 0x28e2557b59846e3f,
> -+      0xe757dd7ec07426e5, 0x331aeada2fe589cf,
> -+      0x9096ea6f3848984f, 0x3ff0d2c85def7621,
> -+      0xb4bca50b065abe63, 0xfed077a756b53a9,
> -+      0xe1ebce4dc7f16dfb, 0xd3e8495912c62894,
> -+      0x8d3360f09cf6e4bd, 0x64712dd7abbbd95c,
> -+      0xb080392cc4349dec, 0xbd8d794d96aacfb3,
> -+      0xdca04777f541c567, 0xecf0d7a0fc5583a0,
> -+      0x89e42caaf9491b60, 0xf41686c49db57244,
> -+      0xac5d37d5b79b6239, 0x311c2875c522ced5,
> -+      0xd77485cb25823ac7, 0x7d633293366b828b,
> -+      0x86a8d39ef77164bc, 0xae5dff9c02033197,
> -+      0xa8530886b54dbdeb, 0xd9f57f830283fdfc,
> -+      0xd267caa862a12d66, 0xd072df63c324fd7b,
> -+      0x8380dea93da4bc60, 0x4247cb9e59f71e6d,
> -+      0xa46116538d0deb78, 0x52d9be85f074e608,
> -+      0xcd795be870516656, 0x67902e276c921f8b,
> -+      0x806bd9714632dff6, 0xba1cd8a3db53b6,
> -+      0xa086cfcd97bf97f3, 0x80e8a40eccd228a4,
> -+      0xc8a883c0fdaf7df0, 0x6122cd128006b2cd,
> -+      0xfad2a4b13d1b5d6c, 0x796b805720085f81,
> -+      0x9cc3a6eec6311a63, 0xcbe3303674053bb0,
> -+      0xc3f490aa77bd60fc, 0xbedbfc4411068a9c,
> -+      0xf4f1b4d515acb93b, 0xee92fb5515482d44,
> -+      0x991711052d8bf3c5, 0x751bdd152d4d1c4a,
> -+      0xbf5cd54678eef0b6, 0xd262d45a78a0635d,
> -+      0xef340a98172aace4, 0x86fb897116c87c34,
> -+      0x9580869f0e7aac0e, 0xd45d35e6ae3d4da0,
> -+      0xbae0a846d2195712, 0x8974836059cca109,
> -+      0xe998d258869facd7, 0x2bd1a438703fc94b,
> -+      0x91ff83775423cc06, 0x7b6306a34627ddcf,
> -+      0xb67f6455292cbf08, 0x1a3bc84c17b1d542,
> -+      0xe41f3d6a7377eeca, 0x20caba5f1d9e4a93,
> -+      0x8e938662882af53e, 0x547eb47b7282ee9c,
> -+      0xb23867fb2a35b28d, 0xe99e619a4f23aa43,
> -+      0xdec681f9f4c31f31, 0x6405fa00e2ec94d4,
> -+      0x8b3c113c38f9f37e, 0xde83bc408dd3dd04,
> -+      0xae0b158b4738705e, 0x9624ab50b148d445,
> -+      0xd98ddaee19068c76, 0x3badd624dd9b0957,
> -+      0x87f8a8d4cfa417c9, 0xe54ca5d70a80e5d6,
> -+      0xa9f6d30a038d1dbc, 0x5e9fcf4ccd211f4c,
> -+      0xd47487cc8470652b, 0x7647c3200069671f,
> -+      0x84c8d4dfd2c63f3b, 0x29ecd9f40041e073,
> -+      0xa5fb0a17c777cf09, 0xf468107100525890,
> -+      0xcf79cc9db955c2cc, 0x7182148d4066eeb4,
> -+      0x81ac1fe293d599bf, 0xc6f14cd848405530,
> -+      0xa21727db38cb002f, 0xb8ada00e5a506a7c,
> -+      0xca9cf1d206fdc03b, 0xa6d90811f0e4851c,
> -+      0xfd442e4688bd304a, 0x908f4a166d1da663,
> -+      0x9e4a9cec15763e2e, 0x9a598e4e043287fe,
> -+      0xc5dd44271ad3cdba, 0x40eff1e1853f29fd,
> -+      0xf7549530e188c128, 0xd12bee59e68ef47c,
> -+      0x9a94dd3e8cf578b9, 0x82bb74f8301958ce,
> -+      0xc13a148e3032d6e7, 0xe36a52363c1faf01,
> -+      0xf18899b1bc3f8ca1, 0xdc44e6c3cb279ac1,
> -+      0x96f5600f15a7b7e5, 0x29ab103a5ef8c0b9,
> -+      0xbcb2b812db11a5de, 0x7415d448f6b6f0e7,
> -+      0xebdf661791d60f56, 0x111b495b3464ad21,
> -+      0x936b9fcebb25c995, 0xcab10dd900beec34,
> -+      0xb84687c269ef3bfb, 0x3d5d514f40eea742,
> -+      0xe65829b3046b0afa, 0xcb4a5a3112a5112,
> -+      0x8ff71a0fe2c2e6dc, 0x47f0e785eaba72ab,
> -+      0xb3f4e093db73a093, 0x59ed216765690f56,
> -+      0xe0f218b8d25088b8, 0x306869c13ec3532c,
> -+      0x8c974f7383725573, 0x1e414218c73a13fb,
> -+      0xafbd2350644eeacf, 0xe5d1929ef90898fa,
> -+      0xdbac6c247d62a583, 0xdf45f746b74abf39,
> -+      0x894bc396ce5da772, 0x6b8bba8c328eb783,
> -+      0xab9eb47c81f5114f, 0x66ea92f3f326564,
> -+      0xd686619ba27255a2, 0xc80a537b0efefebd,
> -+      0x8613fd0145877585, 0xbd06742ce95f5f36,
> -+      0xa798fc4196e952e7, 0x2c48113823b73704,
> -+      0xd17f3b51fca3a7a0, 0xf75a15862ca504c5,
> -+      0x82ef85133de648c4, 0x9a984d73dbe722fb,
> -+      0xa3ab66580d5fdaf5, 0xc13e60d0d2e0ebba,
> -+      0xcc963fee10b7d1b3, 0x318df905079926a8,
> -+      0xffbbcfe994e5c61f, 0xfdf17746497f7052,
> -+      0x9fd561f1fd0f9bd3, 0xfeb6ea8bedefa633,
> -+      0xc7caba6e7c5382c8, 0xfe64a52ee96b8fc0,
> -+      0xf9bd690a1b68637b, 0x3dfdce7aa3c673b0,
> -+      0x9c1661a651213e2d, 0x6bea10ca65c084e,
> -+      0xc31bfa0fe5698db8, 0x486e494fcff30a62,
> -+      0xf3e2f893dec3f126, 0x5a89dba3c3efccfa,
> -+      0x986ddb5c6b3a76b7, 0xf89629465a75e01c,
> -+      0xbe89523386091465, 0xf6bbb397f1135823,
> -+      0xee2ba6c0678b597f, 0x746aa07ded582e2c,
> -+      0x94db483840b717ef, 0xa8c2a44eb4571cdc,
> -+      0xba121a4650e4ddeb, 0x92f34d62616ce413,
> -+      0xe896a0d7e51e1566, 0x77b020baf9c81d17,
> -+      0x915e2486ef32cd60, 0xace1474dc1d122e,
> -+      0xb5b5ada8aaff80b8, 0xd819992132456ba,
> -+      0xe3231912d5bf60e6, 0x10e1fff697ed6c69,
> -+      0x8df5efabc5979c8f, 0xca8d3ffa1ef463c1,
> -+      0xb1736b96b6fd83b3, 0xbd308ff8a6b17cb2,
> -+      0xddd0467c64bce4a0, 0xac7cb3f6d05ddbde,
> -+      0x8aa22c0dbef60ee4, 0x6bcdf07a423aa96b,
> -+      0xad4ab7112eb3929d, 0x86c16c98d2c953c6,
> -+      0xd89d64d57a607744, 0xe871c7bf077ba8b7,
> -+      0x87625f056c7c4a8b, 0x11471cd764ad4972,
> -+      0xa93af6c6c79b5d2d, 0xd598e40d3dd89bcf,
> -+      0xd389b47879823479, 0x4aff1d108d4ec2c3,
> -+      0x843610cb4bf160cb, 0xcedf722a585139ba,
> -+      0xa54394fe1eedb8fe, 0xc2974eb4ee658828,
> -+      0xce947a3da6a9273e, 0x733d226229feea32,
> -+      0x811ccc668829b887, 0x806357d5a3f525f,
> -+      0xa163ff802a3426a8, 0xca07c2dcb0cf26f7,
> -+      0xc9bcff6034c13052, 0xfc89b393dd02f0b5,
> -+      0xfc2c3f3841f17c67, 0xbbac2078d443ace2,
> -+      0x9d9ba7832936edc0, 0xd54b944b84aa4c0d,
> -+      0xc5029163f384a931, 0xa9e795e65d4df11,
> -+      0xf64335bcf065d37d, 0x4d4617b5ff4a16d5,
> -+      0x99ea0196163fa42e, 0x504bced1bf8e4e45,
> -+      0xc06481fb9bcf8d39, 0xe45ec2862f71e1d6,
> -+      0xf07da27a82c37088, 0x5d767327bb4e5a4c,
> -+      0x964e858c91ba2655, 0x3a6a07f8d510f86f,
> -+      0xbbe226efb628afea, 0x890489f70a55368b,
> -+      0xeadab0aba3b2dbe5, 0x2b45ac74ccea842e,
> -+      0x92c8ae6b464fc96f, 0x3b0b8bc90012929d,
> -+      0xb77ada0617e3bbcb, 0x9ce6ebb40173744,
> -+      0xe55990879ddcaabd, 0xcc420a6a101d0515,
> -+      0x8f57fa54c2a9eab6, 0x9fa946824a12232d,
> -+      0xb32df8e9f3546564, 0x47939822dc96abf9,
> -+      0xdff9772470297ebd, 0x59787e2b93bc56f7,
> -+      0x8bfbea76c619ef36, 0x57eb4edb3c55b65a,
> -+      0xaefae51477a06b03, 0xede622920b6b23f1,
> -+      0xdab99e59958885c4, 0xe95fab368e45eced,
> -+      0x88b402f7fd75539b, 0x11dbcb0218ebb414,
> -+      0xaae103b5fcd2a881, 0xd652bdc29f26a119,
> -+      0xd59944a37c0752a2, 0x4be76d3346f0495f,
> -+      0x857fcae62d8493a5, 0x6f70a4400c562ddb,
> -+      0xa6dfbd9fb8e5b88e, 0xcb4ccd500f6bb952,
> -+      0xd097ad07a71f26b2, 0x7e2000a41346a7a7,
> -+      0x825ecc24c873782f, 0x8ed400668c0c28c8,
> -+      0xa2f67f2dfa90563b, 0x728900802f0f32fa,
> -+      0xcbb41ef979346bca, 0x4f2b40a03ad2ffb9,
> -+      0xfea126b7d78186bc, 0xe2f610c84987bfa8,
> -+      0x9f24b832e6b0f436, 0xdd9ca7d2df4d7c9,
> -+      0xc6ede63fa05d3143, 0x91503d1c79720dbb,
> -+      0xf8a95fcf88747d94, 0x75a44c6397ce912a,
> -+      0x9b69dbe1b548ce7c, 0xc986afbe3ee11aba,
> -+      0xc24452da229b021b, 0xfbe85badce996168,
> -+      0xf2d56790ab41c2a2, 0xfae27299423fb9c3,
> -+      0x97c560ba6b0919a5, 0xdccd879fc967d41a,
> -+      0xbdb6b8e905cb600f, 0x5400e987bbc1c920,
> -+      0xed246723473e3813, 0x290123e9aab23b68,
> -+      0x9436c0760c86e30b, 0xf9a0b6720aaf6521,
> -+      0xb94470938fa89bce, 0xf808e40e8d5b3e69,
> -+      0xe7958cb87392c2c2, 0xb60b1d1230b20e04,
> -+      0x90bd77f3483bb9b9, 0xb1c6f22b5e6f48c2,
> -+      0xb4ecd5f01a4aa828, 0x1e38aeb6360b1af3,
> -+      0xe2280b6c20dd5232, 0x25c6da63c38de1b0,
> -+      0x8d590723948a535f, 0x579c487e5a38ad0e,
> -+      0xb0af48ec79ace837, 0x2d835a9df0c6d851,
> -+      0xdcdb1b2798182244, 0xf8e431456cf88e65,
> -+      0x8a08f0f8bf0f156b, 0x1b8e9ecb641b58ff,
> -+      0xac8b2d36eed2dac5, 0xe272467e3d222f3f,
> -+      0xd7adf884aa879177, 0x5b0ed81dcc6abb0f,
> -+      0x86ccbb52ea94baea, 0x98e947129fc2b4e9,
> -+      0xa87fea27a539e9a5, 0x3f2398d747b36224,
> -+      0xd29fe4b18e88640e, 0x8eec7f0d19a03aad,
> -+      0x83a3eeeef9153e89, 0x1953cf68300424ac,
> -+      0xa48ceaaab75a8e2b, 0x5fa8c3423c052dd7,
> -+      0xcdb02555653131b6, 0x3792f412cb06794d,
> -+      0x808e17555f3ebf11, 0xe2bbd88bbee40bd0,
> -+      0xa0b19d2ab70e6ed6, 0x5b6aceaeae9d0ec4,
> -+      0xc8de047564d20a8b, 0xf245825a5a445275,
> -+      0xfb158592be068d2e, 0xeed6e2f0f0d56712,
> -+      0x9ced737bb6c4183d, 0x55464dd69685606b,
> -+      0xc428d05aa4751e4c, 0xaa97e14c3c26b886,
> -+      0xf53304714d9265df, 0xd53dd99f4b3066a8,
> -+      0x993fe2c6d07b7fab, 0xe546a8038efe4029,
> -+      0xbf8fdb78849a5f96, 0xde98520472bdd033,
> -+      0xef73d256a5c0f77c, 0x963e66858f6d4440,
> -+      0x95a8637627989aad, 0xdde7001379a44aa8,
> -+      0xbb127c53b17ec159, 0x5560c018580d5d52,
> -+      0xe9d71b689dde71af, 0xaab8f01e6e10b4a6,
> -+      0x9226712162ab070d, 0xcab3961304ca70e8,
> -+      0xb6b00d69bb55c8d1, 0x3d607b97c5fd0d22,
> -+      0xe45c10c42a2b3b05, 0x8cb89a7db77c506a,
> -+      0x8eb98a7a9a5b04e3, 0x77f3608e92adb242,
> -+      0xb267ed1940f1c61c, 0x55f038b237591ed3,
> -+      0xdf01e85f912e37a3, 0x6b6c46dec52f6688,
> -+      0x8b61313bbabce2c6, 0x2323ac4b3b3da015,
> -+      0xae397d8aa96c1b77, 0xabec975e0a0d081a,
> -+      0xd9c7dced53c72255, 0x96e7bd358c904a21,
> -+      0x881cea14545c7575, 0x7e50d64177da2e54,
> -+      0xaa242499697392d2, 0xdde50bd1d5d0b9e9,
> -+      0xd4ad2dbfc3d07787, 0x955e4ec64b44e864,
> -+      0x84ec3c97da624ab4, 0xbd5af13bef0b113e,
> -+      0xa6274bbdd0fadd61, 0xecb1ad8aeacdd58e,
> -+      0xcfb11ead453994ba, 0x67de18eda5814af2,
> -+      0x81ceb32c4b43fcf4, 0x80eacf948770ced7,
> -+      0xa2425ff75e14fc31, 0xa1258379a94d028d,
> -+      0xcad2f7f5359a3b3e, 0x96ee45813a04330,
> -+      0xfd87b5f28300ca0d, 0x8bca9d6e188853fc,
> -+      0x9e74d1b791e07e48, 0x775ea264cf55347e,
> -+      0xc612062576589dda, 0x95364afe032a819e,
> -+      0xf79687aed3eec551, 0x3a83ddbd83f52205,
> -+      0x9abe14cd44753b52, 0xc4926a9672793543,
> -+      0xc16d9a0095928a27, 0x75b7053c0f178294,
> -+      0xf1c90080baf72cb1, 0x5324c68b12dd6339,
> -+      0x971da05074da7bee, 0xd3f6fc16ebca5e04,
> -+      0xbce5086492111aea, 0x88f4bb1ca6bcf585,
> -+      0xec1e4a7db69561a5, 0x2b31e9e3d06c32e6,
> -+      0x9392ee8e921d5d07, 0x3aff322e62439fd0,
> -+      0xb877aa3236a4b449, 0x9befeb9fad487c3,
> -+      0xe69594bec44de15b, 0x4c2ebe687989a9b4,
> -+      0x901d7cf73ab0acd9, 0xf9d37014bf60a11,
> -+      0xb424dc35095cd80f, 0x538484c19ef38c95,
> -+      0xe12e13424bb40e13, 0x2865a5f206b06fba,
> -+      0x8cbccc096f5088cb, 0xf93f87b7442e45d4,
> -+      0xafebff0bcb24aafe, 0xf78f69a51539d749,
> -+      0xdbe6fecebdedd5be, 0xb573440e5a884d1c,
> -+      0x89705f4136b4a597, 0x31680a88f8953031,
> -+      0xabcc77118461cefc, 0xfdc20d2b36ba7c3e,
> -+      0xd6bf94d5e57a42bc, 0x3d32907604691b4d,
> -+      0x8637bd05af6c69b5, 0xa63f9a49c2c1b110,
> -+      0xa7c5ac471b478423, 0xfcf80dc33721d54,
> -+      0xd1b71758e219652b, 0xd3c36113404ea4a9,
> -+      0x83126e978d4fdf3b, 0x645a1cac083126ea,
> -+      0xa3d70a3d70a3d70a, 0x3d70a3d70a3d70a4,
> -+      0xcccccccccccccccc, 0xcccccccccccccccd,
> -+      0x8000000000000000, 0x0,
> -+      0xa000000000000000, 0x0,
> -+      0xc800000000000000, 0x0,
> -+      0xfa00000000000000, 0x0,
> -+      0x9c40000000000000, 0x0,
> -+      0xc350000000000000, 0x0,
> -+      0xf424000000000000, 0x0,
> -+      0x9896800000000000, 0x0,
> -+      0xbebc200000000000, 0x0,
> -+      0xee6b280000000000, 0x0,
> -+      0x9502f90000000000, 0x0,
> -+      0xba43b74000000000, 0x0,
> -+      0xe8d4a51000000000, 0x0,
> -+      0x9184e72a00000000, 0x0,
> -+      0xb5e620f480000000, 0x0,
> -+      0xe35fa931a0000000, 0x0,
> -+      0x8e1bc9bf04000000, 0x0,
> -+      0xb1a2bc2ec5000000, 0x0,
> -+      0xde0b6b3a76400000, 0x0,
> -+      0x8ac7230489e80000, 0x0,
> -+      0xad78ebc5ac620000, 0x0,
> -+      0xd8d726b7177a8000, 0x0,
> -+      0x878678326eac9000, 0x0,
> -+      0xa968163f0a57b400, 0x0,
> -+      0xd3c21bcecceda100, 0x0,
> -+      0x84595161401484a0, 0x0,
> -+      0xa56fa5b99019a5c8, 0x0,
> -+      0xcecb8f27f4200f3a, 0x0,
> -+      0x813f3978f8940984, 0x4000000000000000,
> -+      0xa18f07d736b90be5, 0x5000000000000000,
> -+      0xc9f2c9cd04674ede, 0xa400000000000000,
> -+      0xfc6f7c4045812296, 0x4d00000000000000,
> -+      0x9dc5ada82b70b59d, 0xf020000000000000,
> -+      0xc5371912364ce305, 0x6c28000000000000,
> -+      0xf684df56c3e01bc6, 0xc732000000000000,
> -+      0x9a130b963a6c115c, 0x3c7f400000000000,
> -+      0xc097ce7bc90715b3, 0x4b9f100000000000,
> -+      0xf0bdc21abb48db20, 0x1e86d40000000000,
> -+      0x96769950b50d88f4, 0x1314448000000000,
> -+      0xbc143fa4e250eb31, 0x17d955a000000000,
> -+      0xeb194f8e1ae525fd, 0x5dcfab0800000000,
> -+      0x92efd1b8d0cf37be, 0x5aa1cae500000000,
> -+      0xb7abc627050305ad, 0xf14a3d9e40000000,
> -+      0xe596b7b0c643c719, 0x6d9ccd05d0000000,
> -+      0x8f7e32ce7bea5c6f, 0xe4820023a2000000,
> -+      0xb35dbf821ae4f38b, 0xdda2802c8a800000,
> -+      0xe0352f62a19e306e, 0xd50b2037ad200000,
> -+      0x8c213d9da502de45, 0x4526f422cc340000,
> -+      0xaf298d050e4395d6, 0x9670b12b7f410000,
> -+      0xdaf3f04651d47b4c, 0x3c0cdd765f114000,
> -+      0x88d8762bf324cd0f, 0xa5880a69fb6ac800,
> -+      0xab0e93b6efee0053, 0x8eea0d047a457a00,
> -+      0xd5d238a4abe98068, 0x72a4904598d6d880,
> -+      0x85a36366eb71f041, 0x47a6da2b7f864750,
> -+      0xa70c3c40a64e6c51, 0x999090b65f67d924,
> -+      0xd0cf4b50cfe20765, 0xfff4b4e3f741cf6d,
> -+      0x82818f1281ed449f, 0xbff8f10e7a8921a4,
> -+      0xa321f2d7226895c7, 0xaff72d52192b6a0d,
> -+      0xcbea6f8ceb02bb39, 0x9bf4f8a69f764490,
> -+      0xfee50b7025c36a08, 0x2f236d04753d5b4,
> -+      0x9f4f2726179a2245, 0x1d762422c946590,
> -+      0xc722f0ef9d80aad6, 0x424d3ad2b7b97ef5,
> -+      0xf8ebad2b84e0d58b, 0xd2e0898765a7deb2,
> -+      0x9b934c3b330c8577, 0x63cc55f49f88eb2f,
> -+      0xc2781f49ffcfa6d5, 0x3cbf6b71c76b25fb,
> -+      0xf316271c7fc3908a, 0x8bef464e3945ef7a,
> -+      0x97edd871cfda3a56, 0x97758bf0e3cbb5ac,
> -+      0xbde94e8e43d0c8ec, 0x3d52eeed1cbea317,
> -+      0xed63a231d4c4fb27, 0x4ca7aaa863ee4bdd,
> -+      0x945e455f24fb1cf8, 0x8fe8caa93e74ef6a,
> -+      0xb975d6b6ee39e436, 0xb3e2fd538e122b44,
> -+      0xe7d34c64a9c85d44, 0x60dbbca87196b616,
> -+      0x90e40fbeea1d3a4a, 0xbc8955e946fe31cd,
> -+      0xb51d13aea4a488dd, 0x6babab6398bdbe41,
> -+      0xe264589a4dcdab14, 0xc696963c7eed2dd1,
> -+      0x8d7eb76070a08aec, 0xfc1e1de5cf543ca2,
> -+      0xb0de65388cc8ada8, 0x3b25a55f43294bcb,
> -+      0xdd15fe86affad912, 0x49ef0eb713f39ebe,
> -+      0x8a2dbf142dfcc7ab, 0x6e3569326c784337,
> -+      0xacb92ed9397bf996, 0x49c2c37f07965404,
> -+      0xd7e77a8f87daf7fb, 0xdc33745ec97be906,
> -+      0x86f0ac99b4e8dafd, 0x69a028bb3ded71a3,
> -+      0xa8acd7c0222311bc, 0xc40832ea0d68ce0c,
> -+      0xd2d80db02aabd62b, 0xf50a3fa490c30190,
> -+      0x83c7088e1aab65db, 0x792667c6da79e0fa,
> -+      0xa4b8cab1a1563f52, 0x577001b891185938,
> -+      0xcde6fd5e09abcf26, 0xed4c0226b55e6f86,
> -+      0x80b05e5ac60b6178, 0x544f8158315b05b4,
> -+      0xa0dc75f1778e39d6, 0x696361ae3db1c721,
> -+      0xc913936dd571c84c, 0x3bc3a19cd1e38e9,
> -+      0xfb5878494ace3a5f, 0x4ab48a04065c723,
> -+      0x9d174b2dcec0e47b, 0x62eb0d64283f9c76,
> -+      0xc45d1df942711d9a, 0x3ba5d0bd324f8394,
> -+      0xf5746577930d6500, 0xca8f44ec7ee36479,
> -+      0x9968bf6abbe85f20, 0x7e998b13cf4e1ecb,
> -+      0xbfc2ef456ae276e8, 0x9e3fedd8c321a67e,
> -+      0xefb3ab16c59b14a2, 0xc5cfe94ef3ea101e,
> -+      0x95d04aee3b80ece5, 0xbba1f1d158724a12,
> -+      0xbb445da9ca61281f, 0x2a8a6e45ae8edc97,
> -+      0xea1575143cf97226, 0xf52d09d71a3293bd,
> -+      0x924d692ca61be758, 0x593c2626705f9c56,
> -+      0xb6e0c377cfa2e12e, 0x6f8b2fb00c77836c,
> -+      0xe498f455c38b997a, 0xb6dfb9c0f956447,
> -+      0x8edf98b59a373fec, 0x4724bd4189bd5eac,
> -+      0xb2977ee300c50fe7, 0x58edec91ec2cb657,
> -+      0xdf3d5e9bc0f653e1, 0x2f2967b66737e3ed,
> -+      0x8b865b215899f46c, 0xbd79e0d20082ee74,
> -+      0xae67f1e9aec07187, 0xecd8590680a3aa11,
> -+      0xda01ee641a708de9, 0xe80e6f4820cc9495,
> -+      0x884134fe908658b2, 0x3109058d147fdcdd,
> -+      0xaa51823e34a7eede, 0xbd4b46f0599fd415,
> -+      0xd4e5e2cdc1d1ea96, 0x6c9e18ac7007c91a,
> -+      0x850fadc09923329e, 0x3e2cf6bc604ddb0,
> -+      0xa6539930bf6bff45, 0x84db8346b786151c,
> -+      0xcfe87f7cef46ff16, 0xe612641865679a63,
> -+      0x81f14fae158c5f6e, 0x4fcb7e8f3f60c07e,
> -+      0xa26da3999aef7749, 0xe3be5e330f38f09d,
> -+      0xcb090c8001ab551c, 0x5cadf5bfd3072cc5,
> -+      0xfdcb4fa002162a63, 0x73d9732fc7c8f7f6,
> -+      0x9e9f11c4014dda7e, 0x2867e7fddcdd9afa,
> -+      0xc646d63501a1511d, 0xb281e1fd541501b8,
> -+      0xf7d88bc24209a565, 0x1f225a7ca91a4226,
> -+      0x9ae757596946075f, 0x3375788de9b06958,
> -+      0xc1a12d2fc3978937, 0x52d6b1641c83ae,
> -+      0xf209787bb47d6b84, 0xc0678c5dbd23a49a,
> -+      0x9745eb4d50ce6332, 0xf840b7ba963646e0,
> -+      0xbd176620a501fbff, 0xb650e5a93bc3d898,
> -+      0xec5d3fa8ce427aff, 0xa3e51f138ab4cebe,
> -+      0x93ba47c980e98cdf, 0xc66f336c36b10137,
> -+      0xb8a8d9bbe123f017, 0xb80b0047445d4184,
> -+      0xe6d3102ad96cec1d, 0xa60dc059157491e5,
> -+      0x9043ea1ac7e41392, 0x87c89837ad68db2f,
> -+      0xb454e4a179dd1877, 0x29babe4598c311fb,
> -+      0xe16a1dc9d8545e94, 0xf4296dd6fef3d67a,
> -+      0x8ce2529e2734bb1d, 0x1899e4a65f58660c,
> -+      0xb01ae745b101e9e4, 0x5ec05dcff72e7f8f,
> -+      0xdc21a1171d42645d, 0x76707543f4fa1f73,
> -+      0x899504ae72497eba, 0x6a06494a791c53a8,
> -+      0xabfa45da0edbde69, 0x487db9d17636892,
> -+      0xd6f8d7509292d603, 0x45a9d2845d3c42b6,
> -+      0x865b86925b9bc5c2, 0xb8a2392ba45a9b2,
> -+      0xa7f26836f282b732, 0x8e6cac7768d7141e,
> -+      0xd1ef0244af2364ff, 0x3207d795430cd926,
> -+      0x8335616aed761f1f, 0x7f44e6bd49e807b8,
> -+      0xa402b9c5a8d3a6e7, 0x5f16206c9c6209a6,
> -+      0xcd036837130890a1, 0x36dba887c37a8c0f,
> -+      0x802221226be55a64, 0xc2494954da2c9789,
> -+      0xa02aa96b06deb0fd, 0xf2db9baa10b7bd6c,
> -+      0xc83553c5c8965d3d, 0x6f92829494e5acc7,
> -+      0xfa42a8b73abbf48c, 0xcb772339ba1f17f9,
> -+      0x9c69a97284b578d7, 0xff2a760414536efb,
> -+      0xc38413cf25e2d70d, 0xfef5138519684aba,
> -+      0xf46518c2ef5b8cd1, 0x7eb258665fc25d69,
> -+      0x98bf2f79d5993802, 0xef2f773ffbd97a61,
> -+      0xbeeefb584aff8603, 0xaafb550ffacfd8fa,
> -+      0xeeaaba2e5dbf6784, 0x95ba2a53f983cf38,
> -+      0x952ab45cfa97a0b2, 0xdd945a747bf26183,
> -+      0xba756174393d88df, 0x94f971119aeef9e4,
> -+      0xe912b9d1478ceb17, 0x7a37cd5601aab85d,
> -+      0x91abb422ccb812ee, 0xac62e055c10ab33a,
> -+      0xb616a12b7fe617aa, 0x577b986b314d6009,
> -+      0xe39c49765fdf9d94, 0xed5a7e85fda0b80b,
> -+      0x8e41ade9fbebc27d, 0x14588f13be847307,
> -+      0xb1d219647ae6b31c, 0x596eb2d8ae258fc8,
> -+      0xde469fbd99a05fe3, 0x6fca5f8ed9aef3bb,
> -+      0x8aec23d680043bee, 0x25de7bb9480d5854,
> -+      0xada72ccc20054ae9, 0xaf561aa79a10ae6a,
> -+      0xd910f7ff28069da4, 0x1b2ba1518094da04,
> -+      0x87aa9aff79042286, 0x90fb44d2f05d0842,
> -+      0xa99541bf57452b28, 0x353a1607ac744a53,
> -+      0xd3fa922f2d1675f2, 0x42889b8997915ce8,
> -+      0x847c9b5d7c2e09b7, 0x69956135febada11,
> -+      0xa59bc234db398c25, 0x43fab9837e699095,
> -+      0xcf02b2c21207ef2e, 0x94f967e45e03f4bb,
> -+      0x8161afb94b44f57d, 0x1d1be0eebac278f5,
> -+      0xa1ba1ba79e1632dc, 0x6462d92a69731732,
> -+      0xca28a291859bbf93, 0x7d7b8f7503cfdcfe,
> -+      0xfcb2cb35e702af78, 0x5cda735244c3d43e,
> -+      0x9defbf01b061adab, 0x3a0888136afa64a7,
> -+      0xc56baec21c7a1916, 0x88aaa1845b8fdd0,
> -+      0xf6c69a72a3989f5b, 0x8aad549e57273d45,
> -+      0x9a3c2087a63f6399, 0x36ac54e2f678864b,
> -+      0xc0cb28a98fcf3c7f, 0x84576a1bb416a7dd,
> -+      0xf0fdf2d3f3c30b9f, 0x656d44a2a11c51d5,
> -+      0x969eb7c47859e743, 0x9f644ae5a4b1b325,
> -+      0xbc4665b596706114, 0x873d5d9f0dde1fee,
> -+      0xeb57ff22fc0c7959, 0xa90cb506d155a7ea,
> -+      0x9316ff75dd87cbd8, 0x9a7f12442d588f2,
> -+      0xb7dcbf5354e9bece, 0xc11ed6d538aeb2f,
> -+      0xe5d3ef282a242e81, 0x8f1668c8a86da5fa,
> -+      0x8fa475791a569d10, 0xf96e017d694487bc,
> -+      0xb38d92d760ec4455, 0x37c981dcc395a9ac,
> -+      0xe070f78d3927556a, 0x85bbe253f47b1417,
> -+      0x8c469ab843b89562, 0x93956d7478ccec8e,
> -+      0xaf58416654a6babb, 0x387ac8d1970027b2,
> -+      0xdb2e51bfe9d0696a, 0x6997b05fcc0319e,
> -+      0x88fcf317f22241e2, 0x441fece3bdf81f03,
> -+      0xab3c2fddeeaad25a, 0xd527e81cad7626c3,
> -+      0xd60b3bd56a5586f1, 0x8a71e223d8d3b074,
> -+      0x85c7056562757456, 0xf6872d5667844e49,
> -+      0xa738c6bebb12d16c, 0xb428f8ac016561db,
> -+      0xd106f86e69d785c7, 0xe13336d701beba52,
> -+      0x82a45b450226b39c, 0xecc0024661173473,
> -+      0xa34d721642b06084, 0x27f002d7f95d0190,
> -+      0xcc20ce9bd35c78a5, 0x31ec038df7b441f4,
> -+      0xff290242c83396ce, 0x7e67047175a15271,
> -+      0x9f79a169bd203e41, 0xf0062c6e984d386,
> -+      0xc75809c42c684dd1, 0x52c07b78a3e60868,
> -+      0xf92e0c3537826145, 0xa7709a56ccdf8a82,
> -+      0x9bbcc7a142b17ccb, 0x88a66076400bb691,
> -+      0xc2abf989935ddbfe, 0x6acff893d00ea435,
> -+      0xf356f7ebf83552fe, 0x583f6b8c4124d43,
> -+      0x98165af37b2153de, 0xc3727a337a8b704a,
> -+      0xbe1bf1b059e9a8d6, 0x744f18c0592e4c5c,
> -+      0xeda2ee1c7064130c, 0x1162def06f79df73,
> -+      0x9485d4d1c63e8be7, 0x8addcb5645ac2ba8,
> -+      0xb9a74a0637ce2ee1, 0x6d953e2bd7173692,
> -+      0xe8111c87c5c1ba99, 0xc8fa8db6ccdd0437,
> -+      0x910ab1d4db9914a0, 0x1d9c9892400a22a2,
> -+      0xb54d5e4a127f59c8, 0x2503beb6d00cab4b,
> -+      0xe2a0b5dc971f303a, 0x2e44ae64840fd61d,
> -+      0x8da471a9de737e24, 0x5ceaecfed289e5d2,
> -+      0xb10d8e1456105dad, 0x7425a83e872c5f47,
> -+      0xdd50f1996b947518, 0xd12f124e28f77719,
> -+      0x8a5296ffe33cc92f, 0x82bd6b70d99aaa6f,
> -+      0xace73cbfdc0bfb7b, 0x636cc64d1001550b,
> -+      0xd8210befd30efa5a, 0x3c47f7e05401aa4e,
> -+      0x8714a775e3e95c78, 0x65acfaec34810a71,
> -+      0xa8d9d1535ce3b396, 0x7f1839a741a14d0d,
> -+      0xd31045a8341ca07c, 0x1ede48111209a050,
> -+      0x83ea2b892091e44d, 0x934aed0aab460432,
> -+      0xa4e4b66b68b65d60, 0xf81da84d5617853f,
> -+      0xce1de40642e3f4b9, 0x36251260ab9d668e,
> -+      0x80d2ae83e9ce78f3, 0xc1d72b7c6b426019,
> -+      0xa1075a24e4421730, 0xb24cf65b8612f81f,
> -+      0xc94930ae1d529cfc, 0xdee033f26797b627,
> -+      0xfb9b7cd9a4a7443c, 0x169840ef017da3b1,
> -+      0x9d412e0806e88aa5, 0x8e1f289560ee864e,
> -+      0xc491798a08a2ad4e, 0xf1a6f2bab92a27e2,
> -+      0xf5b5d7ec8acb58a2, 0xae10af696774b1db,
> -+      0x9991a6f3d6bf1765, 0xacca6da1e0a8ef29,
> -+      0xbff610b0cc6edd3f, 0x17fd090a58d32af3,
> -+      0xeff394dcff8a948e, 0xddfc4b4cef07f5b0,
> -+      0x95f83d0a1fb69cd9, 0x4abdaf101564f98e,
> -+      0xbb764c4ca7a4440f, 0x9d6d1ad41abe37f1,
> -+      0xea53df5fd18d5513, 0x84c86189216dc5ed,
> -+      0x92746b9be2f8552c, 0x32fd3cf5b4e49bb4,
> -+      0xb7118682dbb66a77, 0x3fbc8c33221dc2a1,
> -+      0xe4d5e82392a40515, 0xfabaf3feaa5334a,
> -+      0x8f05b1163ba6832d, 0x29cb4d87f2a7400e,
> -+      0xb2c71d5bca9023f8, 0x743e20e9ef511012,
> -+      0xdf78e4b2bd342cf6, 0x914da9246b255416,
> -+      0x8bab8eefb6409c1a, 0x1ad089b6c2f7548e,
> -+      0xae9672aba3d0c320, 0xa184ac2473b529b1,
> -+      0xda3c0f568cc4f3e8, 0xc9e5d72d90a2741e,
> -+      0x8865899617fb1871, 0x7e2fa67c7a658892,
> -+      0xaa7eebfb9df9de8d, 0xddbb901b98feeab7,
> -+      0xd51ea6fa85785631, 0x552a74227f3ea565,
> -+      0x8533285c936b35de, 0xd53a88958f87275f,
> -+      0xa67ff273b8460356, 0x8a892abaf368f137,
> -+      0xd01fef10a657842c, 0x2d2b7569b0432d85,
> -+      0x8213f56a67f6b29b, 0x9c3b29620e29fc73,
> -+      0xa298f2c501f45f42, 0x8349f3ba91b47b8f,
> -+      0xcb3f2f7642717713, 0x241c70a936219a73,
> -+      0xfe0efb53d30dd4d7, 0xed238cd383aa0110,
> -+      0x9ec95d1463e8a506, 0xf4363804324a40aa,
> -+      0xc67bb4597ce2ce48, 0xb143c6053edcd0d5,
> -+      0xf81aa16fdc1b81da, 0xdd94b7868e94050a,
> -+      0x9b10a4e5e9913128, 0xca7cf2b4191c8326,
> -+      0xc1d4ce1f63f57d72, 0xfd1c2f611f63a3f0,
> -+      0xf24a01a73cf2dccf, 0xbc633b39673c8cec,
> -+      0x976e41088617ca01, 0xd5be0503e085d813,
> -+      0xbd49d14aa79dbc82, 0x4b2d8644d8a74e18,
> -+      0xec9c459d51852ba2, 0xddf8e7d60ed1219e,
> -+      0x93e1ab8252f33b45, 0xcabb90e5c942b503,
> -+      0xb8da1662e7b00a17, 0x3d6a751f3b936243,
> -+      0xe7109bfba19c0c9d, 0xcc512670a783ad4,
> -+      0x906a617d450187e2, 0x27fb2b80668b24c5,
> -+      0xb484f9dc9641e9da, 0xb1f9f660802dedf6,
> -+      0xe1a63853bbd26451, 0x5e7873f8a0396973,
> -+      0x8d07e33455637eb2, 0xdb0b487b6423e1e8,
> -+      0xb049dc016abc5e5f, 0x91ce1a9a3d2cda62,
> -+      0xdc5c5301c56b75f7, 0x7641a140cc7810fb,
> -+      0x89b9b3e11b6329ba, 0xa9e904c87fcb0a9d,
> -+      0xac2820d9623bf429, 0x546345fa9fbdcd44,
> -+      0xd732290fbacaf133, 0xa97c177947ad4095,
> -+      0x867f59a9d4bed6c0, 0x49ed8eabcccc485d,
> -+      0xa81f301449ee8c70, 0x5c68f256bfff5a74,
> -+      0xd226fc195c6a2f8c, 0x73832eec6fff3111,
> -+      0x83585d8fd9c25db7, 0xc831fd53c5ff7eab,
> -+      0xa42e74f3d032f525, 0xba3e7ca8b77f5e55,
> -+      0xcd3a1230c43fb26f, 0x28ce1bd2e55f35eb,
> -+      0x80444b5e7aa7cf85, 0x7980d163cf5b81b3,
> -+      0xa0555e361951c366, 0xd7e105bcc332621f,
> -+      0xc86ab5c39fa63440, 0x8dd9472bf3fefaa7,
> -+      0xfa856334878fc150, 0xb14f98f6f0feb951,
> -+      0x9c935e00d4b9d8d2, 0x6ed1bf9a569f33d3,
> -+      0xc3b8358109e84f07, 0xa862f80ec4700c8,
> -+      0xf4a642e14c6262c8, 0xcd27bb612758c0fa,
> -+      0x98e7e9cccfbd7dbd, 0x8038d51cb897789c,
> -+      0xbf21e44003acdd2c, 0xe0470a63e6bd56c3,
> -+      0xeeea5d5004981478, 0x1858ccfce06cac74,
> -+      0x95527a5202df0ccb, 0xf37801e0c43ebc8,
> -+      0xbaa718e68396cffd, 0xd30560258f54e6ba,
> -+      0xe950df20247c83fd, 0x47c6b82ef32a2069,
> -+      0x91d28b7416cdd27e, 0x4cdc331d57fa5441,
> -+      0xb6472e511c81471d, 0xe0133fe4adf8e952,
> -+      0xe3d8f9e563a198e5, 0x58180fddd97723a6,
> -+      0x8e679c2f5e44ff8f, 0x570f09eaa7ea7648,
> -+  };
> -+};
> -+
> -+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE
> -+
> -+template <class unused>
> -+constexpr uint64_t
> -+    powers_template<unused>::power_of_five_128[number_of_entries];
> -+
> -+#endif
> -+
> -+using powers =3D powers_template<>;
> -+
> -+} // namespace fast_float
> -+
> -+#endif
> -+
> -+#ifndef FASTFLOAT_DECIMAL_TO_BINARY_H
> -+#define FASTFLOAT_DECIMAL_TO_BINARY_H
> -+
> -+#include <cfloat>
> -+#include <cinttypes>
> -+#include <cmath>
> -+#include <cstdint>
> -+#include <cstdlib>
> -+#include <cstring>
> -+
> -+namespace fast_float {
> -+
> -+// This will compute or rather approximate w * 5**q and return a pair o=
f
> 64-bit
> -+// words approximating the result, with the "high" part corresponding t=
o
> the
> -+// most significant bits and the low part corresponding to the least
> significant
> -+// bits.
> -+//
> -+template <int bit_precision>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 value128
> -+compute_product_approximation(int64_t q, uint64_t w) {
> -+  const int index =3D 2 * int(q - powers::smallest_power_of_five);
> -+  // For small values of q, e.g., q in [0,27], the answer is always exa=
ct
> -+  // because The line value128 firstproduct =3D full_multiplication(w,
> -+  // power_of_five_128[index]); gives the exact answer.
> -+  value128 firstproduct =3D
> -+      full_multiplication(w, powers::power_of_five_128[index]);
> -+  static_assert((bit_precision >=3D 0) && (bit_precision <=3D 64),
> -+                " precision should  be in (0,64]");
> -+  constexpr uint64_t precision_mask =3D
> -+      (bit_precision < 64) ? (uint64_t(0xFFFFFFFFFFFFFFFF) >>
> bit_precision)
> -+                           : uint64_t(0xFFFFFFFFFFFFFFFF);
> -+  if ((firstproduct.high & precision_mask) =3D=3D
> -+      precision_mask) { // could further guard with  (lower + w < lower=
)
> -+    // regarding the second product, we only need secondproduct.high,
> but our
> -+    // expectation is that the compiler will optimize this extra work
> away if
> -+    // needed.
> -+    value128 secondproduct =3D
> -+        full_multiplication(w, powers::power_of_five_128[index + 1]);
> -+    firstproduct.low +=3D secondproduct.high;
> -+    if (secondproduct.high > firstproduct.low) {
> -+      firstproduct.high++;
> -+    }
> -+  }
> -+  return firstproduct;
> -+}
> -+
> -+namespace detail {
> -+/**
> -+ * For q in (0,350), we have that
> -+ *  f =3D (((152170 + 65536) * q ) >> 16);
> -+ * is equal to
> -+ *   floor(p) + q
> -+ * where
> -+ *   p =3D log(5**q)/log(2) =3D q * log(5)/log(2)
> -+ *
> -+ * For negative values of q in (-400,0), we have that
> -+ *  f =3D (((152170 + 65536) * q ) >> 16);
> -+ * is equal to
> -+ *   -ceil(p) + q
> -+ * where
> -+ *   p =3D log(5**-q)/log(2) =3D -q * log(5)/log(2)
> -+ */
> -+constexpr fastfloat_really_inline int32_t power(int32_t q) noexcept {
> -+  return (((152170 + 65536) * q) >> 16) + 63;
> -+}
> -+} // namespace detail
> -+
> -+// create an adjusted mantissa, biased by the invalid power2
> -+// for significant digits already multiplied by 10 ** q.
> -+template <typename binary>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 adjusted_mantissa
> -+compute_error_scaled(int64_t q, uint64_t w, int lz) noexcept {
> -+  int hilz =3D int(w >> 63) ^ 1;
> -+  adjusted_mantissa answer;
> -+  answer.mantissa =3D w << hilz;
> -+  int bias =3D binary::mantissa_explicit_bits() -
> binary::minimum_exponent();
> -+  answer.power2 =3D int32_t(detail::power(int32_t(q)) + bias - hilz - l=
z -
> 62 +
> -+                          invalid_am_bias);
> -+  return answer;
> -+}
> -+
> -+// w * 10 ** q, without rounding the representation up.
> -+// the power2 in the exponent will be adjusted by invalid_am_bias.
> -+template <typename binary>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa
> -+compute_error(int64_t q, uint64_t w) noexcept {
> -+  int lz =3D leading_zeroes(w);
> -+  w <<=3D lz;
> -+  value128 product =3D
> -+      compute_product_approximation<binary::mantissa_explicit_bits() +
> 3>(q, w);
> -+  return compute_error_scaled<binary>(q, product.high, lz);
> -+}
> -+
> -+// w * 10 ** q
> -+// The returned value should be a valid ieee64 number that simply need
> to be
> -+// packed. However, in some very rare cases, the computation will fail.
> In such
> -+// cases, we return an adjusted_mantissa with a negative power of 2: th=
e
> caller
> -+// should recompute in such cases.
> -+template <typename binary>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa
> -+compute_float(int64_t q, uint64_t w) noexcept {
> -+  adjusted_mantissa answer;
> -+  if ((w =3D=3D 0) || (q < binary::smallest_power_of_ten())) {
> -+    answer.power2 =3D 0;
> -+    answer.mantissa =3D 0;
> -+    // result should be zero
> -+    return answer;
> -+  }
> -+  if (q > binary::largest_power_of_ten()) {
> -+    // we want to get infinity:
> -+    answer.power2 =3D binary::infinite_power();
> -+    answer.mantissa =3D 0;
> -+    return answer;
> -+  }
> -+  // At this point in time q is in [powers::smallest_power_of_five,
> -+  // powers::largest_power_of_five].
> -+
> -+  // We want the most significant bit of i to be 1. Shift if needed.
> -+  int lz =3D leading_zeroes(w);
> -+  w <<=3D lz;
> -+
> -+  // The required precision is binary::mantissa_explicit_bits() + 3
> because
> -+  // 1. We need the implicit bit
> -+  // 2. We need an extra bit for rounding purposes
> -+  // 3. We might lose a bit due to the "upperbit" routine (result too
> small,
> -+  // requiring a shift)
> -+
> -+  value128 product =3D
> -+      compute_product_approximation<binary::mantissa_explicit_bits() +
> 3>(q, w);
> -+  // The computed 'product' is always sufficient.
> -+  // Mathematical proof:
> -+  // Noble Mushtak and Daniel Lemire, Fast Number Parsing Without
> Fallback (to
> -+  // appear) See script/mushtak_lemire.py
> -+
> -+  // The "compute_product_approximation" function can be slightly slowe=
r
> than a
> -+  // branchless approach: value128 product =3D compute_product(q, w); b=
ut
> in
> -+  // practice, we can win big with the compute_product_approximation if
> its
> -+  // additional branch is easily predicted. Which is best is data
> specific.
> -+  int upperbit =3D int(product.high >> 63);
> -+  int shift =3D upperbit + 64 - binary::mantissa_explicit_bits() - 3;
> -+
> -+  answer.mantissa =3D product.high >> shift;
> -+
> -+  answer.power2 =3D int32_t(detail::power(int32_t(q)) + upperbit - lz -
> -+                          binary::minimum_exponent());
> -+  if (answer.power2 <=3D 0) { // we have a subnormal?
> -+    // Here have that answer.power2 <=3D 0 so -answer.power2 >=3D 0
> -+    if (-answer.power2 + 1 >=3D
> -+        64) { // if we have more than 64 bits below the minimum
> exponent, you
> -+              // have a zero for sure.
> -+      answer.power2 =3D 0;
> -+      answer.mantissa =3D 0;
> -+      // result should be zero
> -+      return answer;
> -+    }
> -+    // next line is safe because -answer.power2 + 1 < 64
> -+    answer.mantissa >>=3D -answer.power2 + 1;
> -+    // Thankfully, we can't have both "round-to-even" and subnormals
> because
> -+    // "round-to-even" only occurs for powers close to 0.
> -+    answer.mantissa +=3D (answer.mantissa & 1); // round up
> -+    answer.mantissa >>=3D 1;
> -+    // There is a weird scenario where we don't have a subnormal but
> just.
> -+    // Suppose we start with 2.2250738585072013e-308, we end up
> -+    // with 0x3fffffffffffff x 2^-1023-53 which is technically subnorma=
l
> -+    // whereas 0x40000000000000 x 2^-1023-53  is normal. Now, we need t=
o
> round
> -+    // up 0x3fffffffffffff x 2^-1023-53  and once we do, we are no long=
er
> -+    // subnormal, but we can only know this after rounding.
> -+    // So we only declare a subnormal if we are smaller than the
> threshold.
> -+    answer.power2 =3D
> -+        (answer.mantissa < (uint64_t(1) <<
> binary::mantissa_explicit_bits()))
> -+            ? 0
> -+            : 1;
> -+    return answer;
> -+  }
> -+
> -+  // usually, we round *up*, but if we fall right in between and and we
> have an
> -+  // even basis, we need to round down
> -+  // We are only concerned with the cases where 5**q fits in single
> 64-bit word.
> -+  if ((product.low <=3D 1) && (q >=3D binary::min_exponent_round_to_eve=
n())
> &&
> -+      (q <=3D binary::max_exponent_round_to_even()) &&
> -+      ((answer.mantissa & 3) =3D=3D 1)) { // we may fall between two fl=
oats!
> -+    // To be in-between two floats we need that in doing
> -+    //   answer.mantissa =3D product.high >> (upperbit + 64 -
> -+    //   binary::mantissa_explicit_bits() - 3);
> -+    // ... we dropped out only zeroes. But if this happened, then we ca=
n
> go
> -+    // back!!!
> -+    if ((answer.mantissa << shift) =3D=3D product.high) {
> -+      answer.mantissa &=3D ~uint64_t(1); // flip it so that we do not
> round up
> -+    }
> -+  }
> -+
> -+  answer.mantissa +=3D (answer.mantissa & 1); // round up
> -+  answer.mantissa >>=3D 1;
> -+  if (answer.mantissa >=3D (uint64_t(2) <<
> binary::mantissa_explicit_bits())) {
> -+    answer.mantissa =3D (uint64_t(1) << binary::mantissa_explicit_bits(=
));
> -+    answer.power2++; // undo previous addition
> -+  }
> -+
> -+  answer.mantissa &=3D ~(uint64_t(1) << binary::mantissa_explicit_bits(=
));
> -+  if (answer.power2 >=3D binary::infinite_power()) { // infinity
> -+    answer.power2 =3D binary::infinite_power();
> -+    answer.mantissa =3D 0;
> -+  }
> -+  return answer;
> -+}
> -+
> -+} // namespace fast_float
> -+
> -+#endif
> -+
> -+#ifndef FASTFLOAT_BIGINT_H
> -+#define FASTFLOAT_BIGINT_H
> -+
> -+#include <algorithm>
> -+#include <cstdint>
> -+#include <climits>
> -+#include <cstring>
> -+
> -+
> -+namespace fast_float {
> -+
> -+// the limb width: we want efficient multiplication of double the bits =
in
> -+// limb, or for 64-bit limbs, at least 64-bit multiplication where we c=
an
> -+// extract the high and low parts efficiently. this is every 64-bit
> -+// architecture except for sparc, which emulates 128-bit multiplication=
.
> -+// we might have platforms where `CHAR_BIT` is not 8, so let's avoid
> -+// doing `8 * sizeof(limb)`.
> -+#if defined(FASTFLOAT_64BIT) && !defined(__sparc)
> -+#define FASTFLOAT_64BIT_LIMB 1
> -+typedef uint64_t limb;
> -+constexpr size_t limb_bits =3D 64;
> -+#else
> -+#define FASTFLOAT_32BIT_LIMB
> -+typedef uint32_t limb;
> -+constexpr size_t limb_bits =3D 32;
> -+#endif
> -+
> -+typedef span<limb> limb_span;
> -+
> -+// number of bits in a bigint. this needs to be at least the number
> -+// of bits required to store the largest bigint, which is
> -+// `log2(10**(digits + max_exp))`, or `log2(10**(767 + 342))`, or
> -+// ~3600 bits, so we round to 4000.
> -+constexpr size_t bigint_bits =3D 4000;
> -+constexpr size_t bigint_limbs =3D bigint_bits / limb_bits;
> -+
> -+// vector-like type that is allocated on the stack. the entire
> -+// buffer is pre-allocated, and only the length changes.
> -+template <uint16_t size> struct stackvec {
> -+  limb data[size];
> -+  // we never need more than 150 limbs
> -+  uint16_t length{0};
> -+
> -+  stackvec() =3D default;
> -+  stackvec(const stackvec &) =3D delete;
> -+  stackvec &operator=3D(const stackvec &) =3D delete;
> -+  stackvec(stackvec &&) =3D delete;
> -+  stackvec &operator=3D(stackvec &&other) =3D delete;
> -+
> -+  // create stack vector from existing limb span.
> -+  FASTFLOAT_CONSTEXPR20 stackvec(limb_span s) {
> -+    FASTFLOAT_ASSERT(try_extend(s));
> -+  }
> -+
> -+  FASTFLOAT_CONSTEXPR14 limb &operator[](size_t index) noexcept {
> -+    FASTFLOAT_DEBUG_ASSERT(index < length);
> -+    return data[index];
> -+  }
> -+  FASTFLOAT_CONSTEXPR14 const limb &operator[](size_t index) const
> noexcept {
> -+    FASTFLOAT_DEBUG_ASSERT(index < length);
> -+    return data[index];
> -+  }
> -+  // index from the end of the container
> -+  FASTFLOAT_CONSTEXPR14 const limb &rindex(size_t index) const noexcept=
 {
> -+    FASTFLOAT_DEBUG_ASSERT(index < length);
> -+    size_t rindex =3D length - index - 1;
> -+    return data[rindex];
> -+  }
> -+
> -+  // set the length, without bounds checking.
> -+  FASTFLOAT_CONSTEXPR14 void set_len(size_t len) noexcept {
> -+    length =3D uint16_t(len);
> -+  }
> -+  constexpr size_t len() const noexcept { return length; }
> -+  constexpr bool is_empty() const noexcept { return length =3D=3D 0; }
> -+  constexpr size_t capacity() const noexcept { return size; }
> -+  // append item to vector, without bounds checking
> -+  FASTFLOAT_CONSTEXPR14 void push_unchecked(limb value) noexcept {
> -+    data[length] =3D value;
> -+    length++;
> -+  }
> -+  // append item to vector, returning if item was added
> -+  FASTFLOAT_CONSTEXPR14 bool try_push(limb value) noexcept {
> -+    if (len() < capacity()) {
> -+      push_unchecked(value);
> -+      return true;
> -+    } else {
> -+      return false;
> -+    }
> -+  }
> -+  // add items to the vector, from a span, without bounds checking
> -+  FASTFLOAT_CONSTEXPR20 void extend_unchecked(limb_span s) noexcept {
> -+    limb *ptr =3D data + length;
> -+    std::copy_n(s.ptr, s.len(), ptr);
> -+    set_len(len() + s.len());
> -+  }
> -+  // try to add items to the vector, returning if items were added
> -+  FASTFLOAT_CONSTEXPR20 bool try_extend(limb_span s) noexcept {
> -+    if (len() + s.len() <=3D capacity()) {
> -+      extend_unchecked(s);
> -+      return true;
> -+    } else {
> -+      return false;
> -+    }
> -+  }
> -+  // resize the vector, without bounds checking
> -+  // if the new size is longer than the vector, assign value to each
> -+  // appended item.
> -+  FASTFLOAT_CONSTEXPR20
> -+  void resize_unchecked(size_t new_len, limb value) noexcept {
> -+    if (new_len > len()) {
> -+      size_t count =3D new_len - len();
> -+      limb *first =3D data + len();
> -+      limb *last =3D first + count;
> -+      ::std::fill(first, last, value);
> -+      set_len(new_len);
> -+    } else {
> -+      set_len(new_len);
> -+    }
> -+  }
> -+  // try to resize the vector, returning if the vector was resized.
> -+  FASTFLOAT_CONSTEXPR20 bool try_resize(size_t new_len, limb value)
> noexcept {
> -+    if (new_len > capacity()) {
> -+      return false;
> -+    } else {
> -+      resize_unchecked(new_len, value);
> -+      return true;
> -+    }
> -+  }
> -+  // check if any limbs are non-zero after the given index.
> -+  // this needs to be done in reverse order, since the index
> -+  // is relative to the most significant limbs.
> -+  FASTFLOAT_CONSTEXPR14 bool nonzero(size_t index) const noexcept {
> -+    while (index < len()) {
> -+      if (rindex(index) !=3D 0) {
> -+        return true;
> -+      }
> -+      index++;
> -+    }
> -+    return false;
> -+  }
> -+  // normalize the big integer, so most-significant zero limbs are
> removed.
> -+  FASTFLOAT_CONSTEXPR14 void normalize() noexcept {
> -+    while (len() > 0 && rindex(0) =3D=3D 0) {
> -+      length--;
> -+    }
> -+  }
> -+};
> -+
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 uint64_t
> -+empty_hi64(bool &truncated) noexcept {
> -+  truncated =3D false;
> -+  return 0;
> -+}
> -+
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t
> -+uint64_hi64(uint64_t r0, bool &truncated) noexcept {
> -+  truncated =3D false;
> -+  int shl =3D leading_zeroes(r0);
> -+  return r0 << shl;
> -+}
> -+
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t
> -+uint64_hi64(uint64_t r0, uint64_t r1, bool &truncated) noexcept {
> -+  int shl =3D leading_zeroes(r0);
> -+  if (shl =3D=3D 0) {
> -+    truncated =3D r1 !=3D 0;
> -+    return r0;
> -+  } else {
> -+    int shr =3D 64 - shl;
> -+    truncated =3D (r1 << shl) !=3D 0;
> -+    return (r0 << shl) | (r1 >> shr);
> -+  }
> -+}
> -+
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t
> -+uint32_hi64(uint32_t r0, bool &truncated) noexcept {
> -+  return uint64_hi64(r0, truncated);
> -+}
> -+
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t
> -+uint32_hi64(uint32_t r0, uint32_t r1, bool &truncated) noexcept {
> -+  uint64_t x0 =3D r0;
> -+  uint64_t x1 =3D r1;
> -+  return uint64_hi64((x0 << 32) | x1, truncated);
> -+}
> -+
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t
> -+uint32_hi64(uint32_t r0, uint32_t r1, uint32_t r2, bool &truncated)
> noexcept {
> -+  uint64_t x0 =3D r0;
> -+  uint64_t x1 =3D r1;
> -+  uint64_t x2 =3D r2;
> -+  return uint64_hi64(x0, (x1 << 32) | x2, truncated);
> -+}
> -+
> -+// add two small integers, checking for overflow.
> -+// we want an efficient operation. for msvc, where
> -+// we don't have built-in intrinsics, this is still
> -+// pretty fast.
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 limb
> -+scalar_add(limb x, limb y, bool &overflow) noexcept {
> -+  limb z;
> -+// gcc and clang
> -+#if defined(__has_builtin)
> -+#if __has_builtin(__builtin_add_overflow)
> -+  if (!cpp20_and_in_constexpr()) {
> -+    overflow =3D __builtin_add_overflow(x, y, &z);
> -+    return z;
> -+  }
> -+#endif
> -+#endif
> -+
> -+  // generic, this still optimizes correctly on MSVC.
> -+  z =3D x + y;
> -+  overflow =3D z < x;
> -+  return z;
> -+}
> -+
> -+// multiply two small integers, getting both the high and low bits.
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 limb
> -+scalar_mul(limb x, limb y, limb &carry) noexcept {
> -+#ifdef FASTFLOAT_64BIT_LIMB
> -+#if defined(__SIZEOF_INT128__)
> -+  // GCC and clang both define it as an extension.
> -+  __uint128_t z =3D __uint128_t(x) * __uint128_t(y) + __uint128_t(carry=
);
> -+  carry =3D limb(z >> limb_bits);
> -+  return limb(z);
> -+#else
> -+  // fallback, no native 128-bit integer multiplication with carry.
> -+  // on msvc, this optimizes identically, somehow.
> -+  value128 z =3D full_multiplication(x, y);
> -+  bool overflow;
> -+  z.low =3D scalar_add(z.low, carry, overflow);
> -+  z.high +=3D uint64_t(overflow); // cannot overflow
> -+  carry =3D z.high;
> -+  return z.low;
> -+#endif
> -+#else
> -+  uint64_t z =3D uint64_t(x) * uint64_t(y) + uint64_t(carry);
> -+  carry =3D limb(z >> limb_bits);
> -+  return limb(z);
> -+#endif
> -+}
> -+
> -+// add scalar value to bigint starting from offset.
> -+// used in grade school multiplication
> -+template <uint16_t size>
> -+inline FASTFLOAT_CONSTEXPR20 bool small_add_from(stackvec<size> &vec,
> limb y,
> -+                                                 size_t start) noexcept=
 {
> -+  size_t index =3D start;
> -+  limb carry =3D y;
> -+  bool overflow;
> -+  while (carry !=3D 0 && index < vec.len()) {
> -+    vec[index] =3D scalar_add(vec[index], carry, overflow);
> -+    carry =3D limb(overflow);
> -+    index +=3D 1;
> -+  }
> -+  if (carry !=3D 0) {
> -+    FASTFLOAT_TRY(vec.try_push(carry));
> -+  }
> -+  return true;
> -+}
> -+
> -+// add scalar value to bigint.
> -+template <uint16_t size>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 bool
> -+small_add(stackvec<size> &vec, limb y) noexcept {
> -+  return small_add_from(vec, y, 0);
> -+}
> -+
> -+// multiply bigint by scalar value.
> -+template <uint16_t size>
> -+inline FASTFLOAT_CONSTEXPR20 bool small_mul(stackvec<size> &vec,
> -+                                            limb y) noexcept {
> -+  limb carry =3D 0;
> -+  for (size_t index =3D 0; index < vec.len(); index++) {
> -+    vec[index] =3D scalar_mul(vec[index], y, carry);
> -+  }
> -+  if (carry !=3D 0) {
> -+    FASTFLOAT_TRY(vec.try_push(carry));
> -+  }
> -+  return true;
> -+}
> -+
> -+// add bigint to bigint starting from index.
> -+// used in grade school multiplication
> -+template <uint16_t size>
> -+FASTFLOAT_CONSTEXPR20 bool large_add_from(stackvec<size> &x, limb_span =
y,
> -+                                          size_t start) noexcept {
> -+  // the effective x buffer is from `xstart..x.len()`, so exit early
> -+  // if we can't get that current range.
> -+  if (x.len() < start || y.len() > x.len() - start) {
> -+    FASTFLOAT_TRY(x.try_resize(y.len() + start, 0));
> -+  }
> -+
> -+  bool carry =3D false;
> -+  for (size_t index =3D 0; index < y.len(); index++) {
> -+    limb xi =3D x[index + start];
> -+    limb yi =3D y[index];
> -+    bool c1 =3D false;
> -+    bool c2 =3D false;
> -+    xi =3D scalar_add(xi, yi, c1);
> -+    if (carry) {
> -+      xi =3D scalar_add(xi, 1, c2);
> -+    }
> -+    x[index + start] =3D xi;
> -+    carry =3D c1 | c2;
> -+  }
> -+
> -+  // handle overflow
> -+  if (carry) {
> -+    FASTFLOAT_TRY(small_add_from(x, 1, y.len() + start));
> -+  }
> -+  return true;
> -+}
> -+
> -+// add bigint to bigint.
> -+template <uint16_t size>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 bool
> -+large_add_from(stackvec<size> &x, limb_span y) noexcept {
> -+  return large_add_from(x, y, 0);
> -+}
> -+
> -+// grade-school multiplication algorithm
> -+template <uint16_t size>
> -+FASTFLOAT_CONSTEXPR20 bool long_mul(stackvec<size> &x, limb_span y)
> noexcept {
> -+  limb_span xs =3D limb_span(x.data, x.len());
> -+  stackvec<size> z(xs);
> -+  limb_span zs =3D limb_span(z.data, z.len());
> -+
> -+  if (y.len() !=3D 0) {
> -+    limb y0 =3D y[0];
> -+    FASTFLOAT_TRY(small_mul(x, y0));
> -+    for (size_t index =3D 1; index < y.len(); index++) {
> -+      limb yi =3D y[index];
> -+      stackvec<size> zi;
> -+      if (yi !=3D 0) {
> -+        // re-use the same buffer throughout
> -+        zi.set_len(0);
> -+        FASTFLOAT_TRY(zi.try_extend(zs));
> -+        FASTFLOAT_TRY(small_mul(zi, yi));
> -+        limb_span zis =3D limb_span(zi.data, zi.len());
> -+        FASTFLOAT_TRY(large_add_from(x, zis, index));
> -+      }
> -+    }
> -+  }
> -+
> -+  x.normalize();
> -+  return true;
> -+}
> -+
> -+// grade-school multiplication algorithm
> -+template <uint16_t size>
> -+FASTFLOAT_CONSTEXPR20 bool large_mul(stackvec<size> &x, limb_span y)
> noexcept {
> -+  if (y.len() =3D=3D 1) {
> -+    FASTFLOAT_TRY(small_mul(x, y[0]));
> -+  } else {
> -+    FASTFLOAT_TRY(long_mul(x, y));
> -+  }
> -+  return true;
> -+}
> -+
> -+template <typename =3D void> struct pow5_tables {
> -+  static constexpr uint32_t large_step =3D 135;
> -+  static constexpr uint64_t small_power_of_5[] =3D {
> -+      1UL,
> -+      5UL,
> -+      25UL,
> -+      125UL,
> -+      625UL,
> -+      3125UL,
> -+      15625UL,
> -+      78125UL,
> -+      390625UL,
> -+      1953125UL,
> -+      9765625UL,
> -+      48828125UL,
> -+      244140625UL,
> -+      1220703125UL,
> -+      6103515625UL,
> -+      30517578125UL,
> -+      152587890625UL,
> -+      762939453125UL,
> -+      3814697265625UL,
> -+      19073486328125UL,
> -+      95367431640625UL,
> -+      476837158203125UL,
> -+      2384185791015625UL,
> -+      11920928955078125UL,
> -+      59604644775390625UL,
> -+      298023223876953125UL,
> -+      1490116119384765625UL,
> -+      7450580596923828125UL,
> -+  };
> -+#ifdef FASTFLOAT_64BIT_LIMB
> -+  constexpr static limb large_power_of_5[] =3D {
> -+      1414648277510068013UL, 9180637584431281687UL,
> 4539964771860779200UL,
> -+      10482974169319127550UL, 198276706040285095UL};
> -+#else
> -+  constexpr static limb large_power_of_5[] =3D {
> -+      4279965485U, 329373468U,  4020270615U, 2137533757U, 4287402176U,
> -+      1057042919U, 1071430142U, 2440757623U, 381945767U,  46164893U};
> -+#endif
> -+};
> -+
> -+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE
> -+
> -+template <typename T> constexpr uint32_t pow5_tables<T>::large_step;
> -+
> -+template <typename T> constexpr uint64_t
> pow5_tables<T>::small_power_of_5[];
> -+
> -+template <typename T> constexpr limb pow5_tables<T>::large_power_of_5[]=
;
> -+
> -+#endif
> -+
> -+// big integer type. implements a small subset of big integer
> -+// arithmetic, using simple algorithms since asymptotically
> -+// faster algorithms are slower for a small number of limbs.
> -+// all operations assume the big-integer is normalized.
> -+struct bigint : pow5_tables<> {
> -+  // storage of the limbs, in little-endian order.
> -+  stackvec<bigint_limbs> vec;
> -+
> -+  FASTFLOAT_CONSTEXPR20 bigint() : vec() {}
> -+  bigint(const bigint &) =3D delete;
> -+  bigint &operator=3D(const bigint &) =3D delete;
> -+  bigint(bigint &&) =3D delete;
> -+  bigint &operator=3D(bigint &&other) =3D delete;
> -+
> -+  FASTFLOAT_CONSTEXPR20 bigint(uint64_t value) : vec() {
> -+#ifdef FASTFLOAT_64BIT_LIMB
> -+    vec.push_unchecked(value);
> -+#else
> -+    vec.push_unchecked(uint32_t(value));
> -+    vec.push_unchecked(uint32_t(value >> 32));
> -+#endif
> -+    vec.normalize();
> -+  }
> -+
> -+  // get the high 64 bits from the vector, and if bits were truncated.
> -+  // this is to get the significant digits for the float.
> -+  FASTFLOAT_CONSTEXPR20 uint64_t hi64(bool &truncated) const noexcept {
> -+#ifdef FASTFLOAT_64BIT_LIMB
> -+    if (vec.len() =3D=3D 0) {
> -+      return empty_hi64(truncated);
> -+    } else if (vec.len() =3D=3D 1) {
> -+      return uint64_hi64(vec.rindex(0), truncated);
> -+    } else {
> -+      uint64_t result =3D uint64_hi64(vec.rindex(0), vec.rindex(1),
> truncated);
> -+      truncated |=3D vec.nonzero(2);
> -+      return result;
> -+    }
> -+#else
> -+    if (vec.len() =3D=3D 0) {
> -+      return empty_hi64(truncated);
> -+    } else if (vec.len() =3D=3D 1) {
> -+      return uint32_hi64(vec.rindex(0), truncated);
> -+    } else if (vec.len() =3D=3D 2) {
> -+      return uint32_hi64(vec.rindex(0), vec.rindex(1), truncated);
> -+    } else {
> -+      uint64_t result =3D
> -+          uint32_hi64(vec.rindex(0), vec.rindex(1), vec.rindex(2),
> truncated);
> -+      truncated |=3D vec.nonzero(3);
> -+      return result;
> -+    }
> -+#endif
> -+  }
> -+
> -+  // compare two big integers, returning the large value.
> -+  // assumes both are normalized. if the return value is
> -+  // negative, other is larger, if the return value is
> -+  // positive, this is larger, otherwise they are equal.
> -+  // the limbs are stored in little-endian order, so we
> -+  // must compare the limbs in ever order.
> -+  FASTFLOAT_CONSTEXPR20 int compare(const bigint &other) const noexcept=
 {
> -+    if (vec.len() > other.vec.len()) {
> -+      return 1;
> -+    } else if (vec.len() < other.vec.len()) {
> -+      return -1;
> -+    } else {
> -+      for (size_t index =3D vec.len(); index > 0; index--) {
> -+        limb xi =3D vec[index - 1];
> -+        limb yi =3D other.vec[index - 1];
> -+        if (xi > yi) {
> -+          return 1;
> -+        } else if (xi < yi) {
> -+          return -1;
> -+        }
> -+      }
> -+      return 0;
> -+    }
> -+  }
> -+
> -+  // shift left each limb n bits, carrying over to the new limb
> -+  // returns true if we were able to shift all the digits.
> -+  FASTFLOAT_CONSTEXPR20 bool shl_bits(size_t n) noexcept {
> -+    // Internally, for each item, we shift left by n, and add the
> previous
> -+    // right shifted limb-bits.
> -+    // For example, we transform (for u8) shifted left 2, to:
> -+    //      b10100100 b01000010
> -+    //      b10 b10010001 b00001000
> -+    FASTFLOAT_DEBUG_ASSERT(n !=3D 0);
> -+    FASTFLOAT_DEBUG_ASSERT(n < sizeof(limb) * 8);
> -+
> -+    size_t shl =3D n;
> -+    size_t shr =3D limb_bits - shl;
> -+    limb prev =3D 0;
> -+    for (size_t index =3D 0; index < vec.len(); index++) {
> -+      limb xi =3D vec[index];
> -+      vec[index] =3D (xi << shl) | (prev >> shr);
> -+      prev =3D xi;
> -+    }
> -+
> -+    limb carry =3D prev >> shr;
> -+    if (carry !=3D 0) {
> -+      return vec.try_push(carry);
> -+    }
> -+    return true;
> -+  }
> -+
> -+  // move the limbs left by `n` limbs.
> -+  FASTFLOAT_CONSTEXPR20 bool shl_limbs(size_t n) noexcept {
> -+    FASTFLOAT_DEBUG_ASSERT(n !=3D 0);
> -+    if (n + vec.len() > vec.capacity()) {
> -+      return false;
> -+    } else if (!vec.is_empty()) {
> -+      // move limbs
> -+      limb *dst =3D vec.data + n;
> -+      const limb *src =3D vec.data;
> -+      std::copy_backward(src, src + vec.len(), dst + vec.len());
> -+      // fill in empty limbs
> -+      limb *first =3D vec.data;
> -+      limb *last =3D first + n;
> -+      ::std::fill(first, last, 0);
> -+      vec.set_len(n + vec.len());
> -+      return true;
> -+    } else {
> -+      return true;
> -+    }
> -+  }
> -+
> -+  // move the limbs left by `n` bits.
> -+  FASTFLOAT_CONSTEXPR20 bool shl(size_t n) noexcept {
> -+    size_t rem =3D n % limb_bits;
> -+    size_t div =3D n / limb_bits;
> -+    if (rem !=3D 0) {
> -+      FASTFLOAT_TRY(shl_bits(rem));
> -+    }
> -+    if (div !=3D 0) {
> -+      FASTFLOAT_TRY(shl_limbs(div));
> -+    }
> -+    return true;
> -+  }
> -+
> -+  // get the number of leading zeros in the bigint.
> -+  FASTFLOAT_CONSTEXPR20 int ctlz() const noexcept {
> -+    if (vec.is_empty()) {
> -+      return 0;
> -+    } else {
> -+#ifdef FASTFLOAT_64BIT_LIMB
> -+      return leading_zeroes(vec.rindex(0));
> -+#else
> -+      // no use defining a specialized leading_zeroes for a 32-bit type=
.
> -+      uint64_t r0 =3D vec.rindex(0);
> -+      return leading_zeroes(r0 << 32);
> -+#endif
> -+    }
> -+  }
> -+
> -+  // get the number of bits in the bigint.
> -+  FASTFLOAT_CONSTEXPR20 int bit_length() const noexcept {
> -+    int lz =3D ctlz();
> -+    return int(limb_bits * vec.len()) - lz;
> -+  }
> -+
> -+  FASTFLOAT_CONSTEXPR20 bool mul(limb y) noexcept { return
> small_mul(vec, y); }
> -+
> -+  FASTFLOAT_CONSTEXPR20 bool add(limb y) noexcept { return
> small_add(vec, y); }
> -+
> -+  // multiply as if by 2 raised to a power.
> -+  FASTFLOAT_CONSTEXPR20 bool pow2(uint32_t exp) noexcept { return
> shl(exp); }
> -+
> -+  // multiply as if by 5 raised to a power.
> -+  FASTFLOAT_CONSTEXPR20 bool pow5(uint32_t exp) noexcept {
> -+    // multiply by a power of 5
> -+    size_t large_length =3D sizeof(large_power_of_5) / sizeof(limb);
> -+    limb_span large =3D limb_span(large_power_of_5, large_length);
> -+    while (exp >=3D large_step) {
> -+      FASTFLOAT_TRY(large_mul(vec, large));
> -+      exp -=3D large_step;
> -+    }
> -+#ifdef FASTFLOAT_64BIT_LIMB
> -+    uint32_t small_step =3D 27;
> -+    limb max_native =3D 7450580596923828125UL;
> -+#else
> -+    uint32_t small_step =3D 13;
> -+    limb max_native =3D 1220703125U;
> -+#endif
> -+    while (exp >=3D small_step) {
> -+      FASTFLOAT_TRY(small_mul(vec, max_native));
> -+      exp -=3D small_step;
> -+    }
> -+    if (exp !=3D 0) {
> -+      // Work around clang bug https://godbolt.org/z/zedh7rrhc
> -+      // This is similar to
> https://github.com/llvm/llvm-project/issues/47746,
> -+      // except the workaround described there don't work here
> -+      FASTFLOAT_TRY(small_mul(
> -+          vec, limb(((void)small_power_of_5[0],
> small_power_of_5[exp]))));
> -+    }
> -+
> -+    return true;
> -+  }
> -+
> -+  // multiply as if by 10 raised to a power.
> -+  FASTFLOAT_CONSTEXPR20 bool pow10(uint32_t exp) noexcept {
> -+    FASTFLOAT_TRY(pow5(exp));
> -+    return pow2(exp);
> -+  }
> -+};
> -+
> -+} // namespace fast_float
> -+
> -+#endif
> -+
> -+#ifndef FASTFLOAT_DIGIT_COMPARISON_H
> -+#define FASTFLOAT_DIGIT_COMPARISON_H
> -+
> -+#include <algorithm>
> -+#include <cstdint>
> -+#include <cstring>
> -+#include <iterator>
> -+
> -+
> -+namespace fast_float {
> -+
> -+// 1e0 to 1e19
> -+constexpr static uint64_t powers_of_ten_uint64[] =3D {1UL,
> -+                                                    10UL,
> -+                                                    100UL,
> -+                                                    1000UL,
> -+                                                    10000UL,
> -+                                                    100000UL,
> -+                                                    1000000UL,
> -+                                                    10000000UL,
> -+                                                    100000000UL,
> -+                                                    1000000000UL,
> -+                                                    10000000000UL,
> -+                                                    100000000000UL,
> -+                                                    1000000000000UL,
> -+                                                    10000000000000UL,
> -+                                                    100000000000000UL,
> -+                                                    1000000000000000UL,
> -+                                                    10000000000000000UL=
,
> -+                                                    100000000000000000U=
L,
> -+
> 1000000000000000000UL,
> -+
> 10000000000000000000UL};
> -+
> -+// calculate the exponent, in scientific notation, of the number.
> -+// this algorithm is not even close to optimized, but it has no practic=
al
> -+// effect on performance: in order to have a faster algorithm, we'd nee=
d
> -+// to slow down performance for faster algorithms, and this is still
> fast.
> -+template <typename UC>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 int32_t
> -+scientific_exponent(parsed_number_string_t<UC> &num) noexcept {
> -+  uint64_t mantissa =3D num.mantissa;
> -+  int32_t exponent =3D int32_t(num.exponent);
> -+  while (mantissa >=3D 10000) {
> -+    mantissa /=3D 10000;
> -+    exponent +=3D 4;
> -+  }
> -+  while (mantissa >=3D 100) {
> -+    mantissa /=3D 100;
> -+    exponent +=3D 2;
> -+  }
> -+  while (mantissa >=3D 10) {
> -+    mantissa /=3D 10;
> -+    exponent +=3D 1;
> -+  }
> -+  return exponent;
> -+}
> -+
> -+// this converts a native floating-point number to an extended-precisio=
n
> float.
> -+template <typename T>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa
> -+to_extended(T value) noexcept {
> -+  using equiv_uint =3D typename binary_format<T>::equiv_uint;
> -+  constexpr equiv_uint exponent_mask =3D binary_format<T>::exponent_mas=
k();
> -+  constexpr equiv_uint mantissa_mask =3D binary_format<T>::mantissa_mas=
k();
> -+  constexpr equiv_uint hidden_bit_mask =3D
> binary_format<T>::hidden_bit_mask();
> -+
> -+  adjusted_mantissa am;
> -+  int32_t bias =3D binary_format<T>::mantissa_explicit_bits() -
> -+                 binary_format<T>::minimum_exponent();
> -+  equiv_uint bits;
> -+#if FASTFLOAT_HAS_BIT_CAST
> -+  bits =3D std::bit_cast<equiv_uint>(value);
> -+#else
> -+  ::memcpy(&bits, &value, sizeof(T));
> -+#endif
> -+  if ((bits & exponent_mask) =3D=3D 0) {
> -+    // denormal
> -+    am.power2 =3D 1 - bias;
> -+    am.mantissa =3D bits & mantissa_mask;
> -+  } else {
> -+    // normal
> -+    am.power2 =3D int32_t((bits & exponent_mask) >>
> -+                        binary_format<T>::mantissa_explicit_bits());
> -+    am.power2 -=3D bias;
> -+    am.mantissa =3D (bits & mantissa_mask) | hidden_bit_mask;
> -+  }
> -+
> -+  return am;
> -+}
> -+
> -+// get the extended precision value of the halfway point between b and
> b+u.
> -+// we are given a native float that represents b, so we need to adjust =
it
> -+// halfway between b and b+u.
> -+template <typename T>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa
> -+to_extended_halfway(T value) noexcept {
> -+  adjusted_mantissa am =3D to_extended(value);
> -+  am.mantissa <<=3D 1;
> -+  am.mantissa +=3D 1;
> -+  am.power2 -=3D 1;
> -+  return am;
> -+}
> -+
> -+// round an extended-precision float to the nearest machine float.
> -+template <typename T, typename callback>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 void
> round(adjusted_mantissa &am,
> -+                                                         callback cb)
> noexcept {
> -+  int32_t mantissa_shift =3D 64 -
> binary_format<T>::mantissa_explicit_bits() - 1;
> -+  if (-am.power2 >=3D mantissa_shift) {
> -+    // have a denormal float
> -+    int32_t shift =3D -am.power2 + 1;
> -+    cb(am, std::min<int32_t>(shift, 64));
> -+    // check for round-up: if rounding-nearest carried us to the hidden
> bit.
> -+    am.power2 =3D (am.mantissa <
> -+                 (uint64_t(1) <<
> binary_format<T>::mantissa_explicit_bits()))
> -+                    ? 0
> -+                    : 1;
> -+    return;
> -+  }
> -+
> -+  // have a normal float, use the default shift.
> -+  cb(am, mantissa_shift);
> -+
> -+  // check for carry
> -+  if (am.mantissa >=3D
> -+      (uint64_t(2) << binary_format<T>::mantissa_explicit_bits())) {
> -+    am.mantissa =3D (uint64_t(1) <<
> binary_format<T>::mantissa_explicit_bits());
> -+    am.power2++;
> -+  }
> -+
> -+  // check for infinite: we could have carried to an infinite power
> -+  am.mantissa &=3D ~(uint64_t(1) <<
> binary_format<T>::mantissa_explicit_bits());
> -+  if (am.power2 >=3D binary_format<T>::infinite_power()) {
> -+    am.power2 =3D binary_format<T>::infinite_power();
> -+    am.mantissa =3D 0;
> -+  }
> -+}
> -+
> -+template <typename callback>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 void
> -+round_nearest_tie_even(adjusted_mantissa &am, int32_t shift,
> -+                       callback cb) noexcept {
> -+  const uint64_t mask =3D (shift =3D=3D 64) ? UINT64_MAX : (uint64_t(1)=
 <<
> shift) - 1;
> -+  const uint64_t halfway =3D (shift =3D=3D 0) ? 0 : uint64_t(1) << (shi=
ft - 1);
> -+  uint64_t truncated_bits =3D am.mantissa & mask;
> -+  bool is_above =3D truncated_bits > halfway;
> -+  bool is_halfway =3D truncated_bits =3D=3D halfway;
> -+
> -+  // shift digits into position
> -+  if (shift =3D=3D 64) {
> -+    am.mantissa =3D 0;
> -+  } else {
> -+    am.mantissa >>=3D shift;
> -+  }
> -+  am.power2 +=3D shift;
> -+
> -+  bool is_odd =3D (am.mantissa & 1) =3D=3D 1;
> -+  am.mantissa +=3D uint64_t(cb(is_odd, is_halfway, is_above));
> -+}
> -+
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 void
> -+round_down(adjusted_mantissa &am, int32_t shift) noexcept {
> -+  if (shift =3D=3D 64) {
> -+    am.mantissa =3D 0;
> -+  } else {
> -+    am.mantissa >>=3D shift;
> -+  }
> -+  am.power2 +=3D shift;
> -+}
> -+template <typename UC>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void
> -+skip_zeros(UC const *&first, UC const *last) noexcept {
> -+  uint64_t val;
> -+  while (!cpp20_and_in_constexpr() &&
> -+         std::distance(first, last) >=3D int_cmp_len<UC>()) {
> -+    ::memcpy(&val, first, sizeof(uint64_t));
> -+    if (val !=3D int_cmp_zeros<UC>()) {
> -+      break;
> -+    }
> -+    first +=3D int_cmp_len<UC>();
> -+  }
> -+  while (first !=3D last) {
> -+    if (*first !=3D UC('0')) {
> -+      break;
> -+    }
> -+    first++;
> -+  }
> -+}
> -+
> -+// determine if any non-zero digits were truncated.
> -+// all characters must be valid digits.
> -+template <typename UC>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 bool
> -+is_truncated(UC const *first, UC const *last) noexcept {
> -+  // do 8-bit optimizations, can just compare to 8 literal 0s.
> -+  uint64_t val;
> -+  while (!cpp20_and_in_constexpr() &&
> -+         std::distance(first, last) >=3D int_cmp_len<UC>()) {
> -+    ::memcpy(&val, first, sizeof(uint64_t));
> -+    if (val !=3D int_cmp_zeros<UC>()) {
> -+      return true;
> -+    }
> -+    first +=3D int_cmp_len<UC>();
> -+  }
> -+  while (first !=3D last) {
> -+    if (*first !=3D UC('0')) {
> -+      return true;
> -+    }
> -+    ++first;
> -+  }
> -+  return false;
> -+}
> -+template <typename UC>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 bool
> -+is_truncated(span<const UC> s) noexcept {
> -+  return is_truncated(s.ptr, s.ptr + s.len());
> -+}
> -+
> -+template <typename UC>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void
> -+parse_eight_digits(const UC *&p, limb &value, size_t &counter,
> -+                   size_t &count) noexcept {
> -+  value =3D value * 100000000 + parse_eight_digits_unrolled(p);
> -+  p +=3D 8;
> -+  counter +=3D 8;
> -+  count +=3D 8;
> -+}
> -+
> -+template <typename UC>
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 void
> -+parse_one_digit(UC const *&p, limb &value, size_t &counter,
> -+                size_t &count) noexcept {
> -+  value =3D value * 10 + limb(*p - UC('0'));
> -+  p++;
> -+  counter++;
> -+  count++;
> -+}
> -+
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void
> -+add_native(bigint &big, limb power, limb value) noexcept {
> -+  big.mul(power);
> -+  big.add(value);
> -+}
> -+
> -+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void
> -+round_up_bigint(bigint &big, size_t &count) noexcept {
> -+  // need to round-up the digits, but need to avoid rounding
> -+  // ....9999 to ...10000, which could cause a false halfway point.
> -+  add_native(big, 10, 1);
> -+  count++;
> -+}
> -+
> -+// parse the significant digits into a big integer
> -+template <typename UC>
> -+inline FASTFLOAT_CONSTEXPR20 void
> -+parse_mantissa(bigint &result, parsed_number_string_t<UC> &num,
> -+               size_t max_digits, size_t &digits) noexcept {
> -+  // try to minimize the number of big integer and scalar multiplicatio=
n.
> -+  // therefore, try to parse 8 digits at a time, and multiply by the
> largest
> -+  // scalar value (9 or 19 digits) for each step.
> -+  size_t counter =3D 0;
> -+  digits =3D 0;
> -+  limb value =3D 0;
> -+#ifdef FASTFLOAT_64BIT_LIMB
> -+  size_t step =3D 19;
> -+#else
> -+  size_t step =3D 9;
> -+#endif
> -+
> -+  // process all integer digits.
> -+  UC const *p =3D num.integer.ptr;
> -+  UC const *pend =3D p + num.integer.len();
> -+  skip_zeros(p, pend);
> -+  // process all digits, in increments of step per loop
> -+  while (p !=3D pend) {
> -+    while ((std::distance(p, pend) >=3D 8) && (step - counter >=3D 8) &=
&
> -+           (max_digits - digits >=3D 8)) {
> -+      parse_eight_digits(p, value, counter, digits);
> -+    }
> -+    while (counter < step && p !=3D pend && digits < max_digits) {
> -+      parse_one_digit(p, value, counter, digits);
> -+    }
> -+    if (digits =3D=3D max_digits) {
> -+      // add the temporary value, then check if we've truncated any
> digits
> -+      add_native(result, limb(powers_of_ten_uint64[counter]), value);
> -+      bool truncated =3D is_truncated(p, pend);
> -+      if (num.fraction.ptr !=3D nullptr) {
> -+        truncated |=3D is_truncated(num.fraction);
> -+      }
> -+      if (truncated) {
> -+        round_up_bigint(result, digits);
> -+      }
> -+      return;
> -+    } else {
> -+      add_native(result, limb(powers_of_ten_uint64[counter]), value);
> -+      counter =3D 0;
> -+      value =3D 0;
> -+    }
> -+  }
> -+
> -+  // add our fraction digits, if they're available.
> -+  if (num.fraction.ptr !=3D nullptr) {
> -+    p =3D num.fraction.ptr;
> -+    pend =3D p + num.fraction.len();
> -+    if (digits =3D=3D 0) {
> -+      skip_zeros(p, pend);
> -+    }
> -+    // process all digits, in increments of step per loop
> -+    while (p !=3D pend) {
> -+      while ((std::distance(p, pend) >=3D 8) && (step - counter >=3D 8)=
 &&
> -+             (max_digits - digits >=3D 8)) {
> -+        parse_eight_digits(p, value, counter, digits);
> -+      }
> -+      while (counter < step && p !=3D pend && digits < max_digits) {
> -+        parse_one_digit(p, value, counter, digits);
> -+      }
> -+      if (digits =3D=3D max_digits) {
> -+        // add the temporary value, then check if we've truncated any
> digits
> -+        add_native(result, limb(powers_of_ten_uint64[counter]), value);
> -+        bool truncated =3D is_truncated(p, pend);
> -+        if (truncated) {
> -+          round_up_bigint(result, digits);
> -+        }
> -+        return;
> -+      } else {
> -+        add_native(result, limb(powers_of_ten_uint64[counter]), value);
> -+        counter =3D 0;
> -+        value =3D 0;
> -+      }
> -+    }
> -+  }
> -+
> -+  if (counter !=3D 0) {
> -+    add_native(result, limb(powers_of_ten_uint64[counter]), value);
> -+  }
> -+}
> -+
> -+template <typename T>
> -+inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa
> -+positive_digit_comp(bigint &bigmant, int32_t exponent) noexcept {
> -+  FASTFLOAT_ASSERT(bigmant.pow10(uint32_t(exponent)));
> -+  adjusted_mantissa answer;
> -+  bool truncated;
> -+  answer.mantissa =3D bigmant.hi64(truncated);
> -+  int bias =3D binary_format<T>::mantissa_explicit_bits() -
> -+             binary_format<T>::minimum_exponent();
> -+  answer.power2 =3D bigmant.bit_length() - 64 + bias;
> -+
> -+  round<T>(answer, [truncated](adjusted_mantissa &a, int32_t shift) {
> -+    round_nearest_tie_even(
> -+        a, shift,
> -+        [truncated](bool is_odd, bool is_halfway, bool is_above) -> boo=
l
> {
> -+          return is_above || (is_halfway && truncated) ||
> -+                 (is_odd && is_halfway);
> -+        });
> -+  });
> -+
> -+  return answer;
> -+}
> -+
> -+// the scaling here is quite simple: we have, for the real digits `m *
> 10^e`,
> -+// and for the theoretical digits `n * 2^f`. Since `e` is always
> negative,
> -+// to scale them identically, we do `n * 2^f * 5^-f`, so we now have `m
> * 2^e`.
> -+// we then need to scale by `2^(f- e)`, and then the two significant
> digits
> -+// are of the same magnitude.
> -+template <typename T>
> -+inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa negative_digit_comp(
> -+    bigint &bigmant, adjusted_mantissa am, int32_t exponent) noexcept {
> -+  bigint &real_digits =3D bigmant;
> -+  int32_t real_exp =3D exponent;
> -+
> -+  // get the value of `b`, rounded down, and get a bigint representatio=
n
> of b+h
> -+  adjusted_mantissa am_b =3D am;
> -+  // gcc7 buf: use a lambda to remove the noexcept qualifier bug with
> -+  // -Wnoexcept-type.
> -+  round<T>(am_b,
> -+           [](adjusted_mantissa &a, int32_t shift) { round_down(a,
> shift); });
> -+  T b;
> -+  to_float(false, am_b, b);
> -+  adjusted_mantissa theor =3D to_extended_halfway(b);
> -+  bigint theor_digits(theor.mantissa);
> -+  int32_t theor_exp =3D theor.power2;
> -+
> -+  // scale real digits and theor digits to be same power.
> -+  int32_t pow2_exp =3D theor_exp - real_exp;
> -+  uint32_t pow5_exp =3D uint32_t(-real_exp);
> -+  if (pow5_exp !=3D 0) {
> -+    FASTFLOAT_ASSERT(theor_digits.pow5(pow5_exp));
> -+  }
> -+  if (pow2_exp > 0) {
> -+    FASTFLOAT_ASSERT(theor_digits.pow2(uint32_t(pow2_exp)));
> -+  } else if (pow2_exp < 0) {
> -+    FASTFLOAT_ASSERT(real_digits.pow2(uint32_t(-pow2_exp)));
> -+  }
> -+
> -+  // compare digits, and use it to director rounding
> -+  int ord =3D real_digits.compare(theor_digits);
> -+  adjusted_mantissa answer =3D am;
> -+  round<T>(answer, [ord](adjusted_mantissa &a, int32_t shift) {
> -+    round_nearest_tie_even(
> -+        a, shift, [ord](bool is_odd, bool _, bool __) -> bool {
> -+          (void)_;  // not needed, since we've done our comparison
> -+          (void)__; // not needed, since we've done our comparison
> -+          if (ord > 0) {
> -+            return true;
> -+          } else if (ord < 0) {
> -+            return false;
> -+          } else {
> -+            return is_odd;
> -+          }
> -+        });
> -+  });
> -+
> -+  return answer;
> -+}
> -+
> -+// parse the significant digits as a big integer to unambiguously round
> the
> -+// the significant digits. here, we are trying to determine how to roun=
d
> -+// an extended float representation close to `b+h`, halfway between `b`
> -+// (the float rounded-down) and `b+u`, the next positive float. this
> -+// algorithm is always correct, and uses one of two approaches. when
> -+// the exponent is positive relative to the significant digits (such as
> -+// 1234), we create a big-integer representation, get the high 64-bits,
> -+// determine if any lower bits are truncated, and use that to direct
> -+// rounding. in case of a negative exponent relative to the significant
> -+// digits (such as 1.2345), we create a theoretical representation of
> -+// `b` as a big-integer type, scaled to the same binary exponent as
> -+// the actual digits. we then compare the big integer representations
> -+// of both, and use that to direct rounding.
> -+template <typename T, typename UC>
> -+inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa
> -+digit_comp(parsed_number_string_t<UC> &num, adjusted_mantissa am)
> noexcept {
> -+  // remove the invalid exponent bias
> -+  am.power2 -=3D invalid_am_bias;
> -+
> -+  int32_t sci_exp =3D scientific_exponent(num);
> -+  size_t max_digits =3D binary_format<T>::max_digits();
> -+  size_t digits =3D 0;
> -+  bigint bigmant;
> -+  parse_mantissa(bigmant, num, max_digits, digits);
> -+  // can't underflow, since digits is at most max_digits.
> -+  int32_t exponent =3D sci_exp + 1 - int32_t(digits);
> -+  if (exponent >=3D 0) {
> -+    return positive_digit_comp<T>(bigmant, exponent);
> -+  } else {
> -+    return negative_digit_comp<T>(bigmant, am, exponent);
> -+  }
> -+}
> -+
> -+} // namespace fast_float
> -+
> -+#endif
> -+
> -+#ifndef FASTFLOAT_PARSE_NUMBER_H
> -+#define FASTFLOAT_PARSE_NUMBER_H
> -+
> -+
> -+#include <cmath>
> -+#include <cstring>
> -+#include <limits>
> -+#include <system_error>
> -+namespace fast_float {
> -+
> -+namespace detail {
> -+/**
> -+ * Special case +inf, -inf, nan, infinity, -infinity.
> -+ * The case comparisons could be made much faster given that we know
> that the
> -+ * strings a null-free and fixed.
> -+ **/
> -+template <typename T, typename UC>
> -+from_chars_result_t<UC> FASTFLOAT_CONSTEXPR14 parse_infnan(UC const
> *first,
> -+                                                           UC const
> *last,
> -+                                                           T &value)
> noexcept {
> -+  from_chars_result_t<UC> answer{};
> -+  answer.ptr =3D first;
> -+  answer.ec =3D std::errc(); // be optimistic
> -+  bool minusSign =3D false;
> -+  if (*first =3D=3D
> -+      UC('-')) { // assume first < last, so dereference without checks;
> -+                 // C++17 20.19.3.(7.1) explicitly forbids '+' here
> -+    minusSign =3D true;
> -+    ++first;
> -+  }
> -+#ifdef FASTFLOAT_ALLOWS_LEADING_PLUS // disabled by default
> -+  if (*first =3D=3D UC('+')) {
> -+    ++first;
> -+  }
> -+#endif
> -+  if (last - first >=3D 3) {
> -+    if (fastfloat_strncasecmp(first, str_const_nan<UC>(), 3)) {
> -+      answer.ptr =3D (first +=3D 3);
> -+      value =3D minusSign ? -std::numeric_limits<T>::quiet_NaN()
> -+                        : std::numeric_limits<T>::quiet_NaN();
> -+      // Check for possible nan(n-char-seq-opt), C++17 20.19.3.7,
> -+      // C11 7.20.1.3.3. At least MSVC produces nan(ind) and nan(snan).
> -+      if (first !=3D last && *first =3D=3D UC('(')) {
> -+        for (UC const *ptr =3D first + 1; ptr !=3D last; ++ptr) {
> -+          if (*ptr =3D=3D UC(')')) {
> -+            answer.ptr =3D ptr + 1; // valid nan(n-char-seq-opt)
> -+            break;
> -+          } else if (!((UC('a') <=3D *ptr && *ptr <=3D UC('z')) ||
> -+                       (UC('A') <=3D *ptr && *ptr <=3D UC('Z')) ||
> -+                       (UC('0') <=3D *ptr && *ptr <=3D UC('9')) || *ptr=
 =3D=3D
> UC('_')))
> -+            break; // forbidden char, not nan(n-char-seq-opt)
> -+        }
> -+      }
> -+      return answer;
> -+    }
> -+    if (fastfloat_strncasecmp(first, str_const_inf<UC>(), 3)) {
> -+      if ((last - first >=3D 8) &&
> -+          fastfloat_strncasecmp(first + 3, str_const_inf<UC>() + 3, 5))=
 {
> -+        answer.ptr =3D first + 8;
> -+      } else {
> -+        answer.ptr =3D first + 3;
> -+      }
> -+      value =3D minusSign ? -std::numeric_limits<T>::infinity()
> -+                        : std::numeric_limits<T>::infinity();
> -+      return answer;
> -+    }
> -+  }
> -+  answer.ec =3D std::errc::invalid_argument;
> -+  return answer;
> -+}
> -+
> -+/**
> -+ * Returns true if the floating-pointing rounding mode is to 'nearest'.
> -+ * It is the default on most system. This function is meant to be
> inexpensive.
> -+ * Credit : @mwalcott3
> -+ */
> -+fastfloat_really_inline bool rounds_to_nearest() noexcept {
> -+  // https://lemire.me/blog/2020/06/26/gcc-not-nearest/
> -+#if (FLT_EVAL_METHOD !=3D 1) && (FLT_EVAL_METHOD !=3D 0)
> -+  return false;
> -+#endif
> -+  // See
> -+  // A fast function to check your floating-point rounding mode
> -+  //
> https://lemire.me/blog/2022/11/16/a-fast-function-to-check-your-floating-=
point-rounding-mode/
> -+  //
> -+  // This function is meant to be equivalent to :
> -+  // prior: #include <cfenv>
> -+  //  return fegetround() =3D=3D FE_TONEAREST;
> -+  // However, it is expected to be much faster than the fegetround()
> -+  // function call.
> -+  //
> -+  // The volatile keywoard prevents the compiler from computing the
> function
> -+  // at compile-time.
> -+  // There might be other ways to prevent compile-time optimizations
> (e.g.,
> -+  // asm). The value does not need to be
> std::numeric_limits<float>::min(), any
> -+  // small value so that 1 + x should round to 1 would do (after
> accounting for
> -+  // excess precision, as in 387 instructions).
> -+  static volatile float fmin =3D std::numeric_limits<float>::min();
> -+  float fmini =3D fmin; // we copy it so that it gets loaded at most on=
ce.
> -+//
> -+// Explanation:
> -+// Only when fegetround() =3D=3D FE_TONEAREST do we have that
> -+// fmin + 1.0f =3D=3D 1.0f - fmin.
> -+//
> -+// FE_UPWARD:
> -+//  fmin + 1.0f > 1
> -+//  1.0f - fmin =3D=3D 1
> -+//
> -+// FE_DOWNWARD or  FE_TOWARDZERO:
> -+//  fmin + 1.0f =3D=3D 1
> -+//  1.0f - fmin < 1
> -+//
> -+// Note: This may fail to be accurate if fast-math has been
> -+// enabled, as rounding conventions may not apply.
> -+#ifdef FASTFLOAT_VISUAL_STUDIO
> -+#pragma warning(push)
> -+//  todo: is there a VS warning?
> -+//  see
> -+//
> https://stackoverflow.com/questions/46079446/is-there-a-warning-for-float=
ing-point-equality-checking-in-visual-studio-2013
> -+#elif defined(__clang__)
> -+#pragma clang diagnostic push
> -+#pragma clang diagnostic ignored "-Wfloat-equal"
> -+#elif defined(__GNUC__)
> -+#pragma GCC diagnostic push
> -+#pragma GCC diagnostic ignored "-Wfloat-equal"
> -+#endif
> -+  return (fmini + 1.0f =3D=3D 1.0f - fmini);
> -+#ifdef FASTFLOAT_VISUAL_STUDIO
> -+#pragma warning(pop)
> -+#elif defined(__clang__)
> -+#pragma clang diagnostic pop
> -+#elif defined(__GNUC__)
> -+#pragma GCC diagnostic pop
> -+#endif
> -+}
> -+
> -+} // namespace detail
> -+
> -+template <typename T> struct from_chars_caller {
> -+  template <typename UC>
> -+  FASTFLOAT_CONSTEXPR20 static from_chars_result_t<UC>
> -+  call(UC const *first, UC const *last, T &value,
> -+       parse_options_t<UC> options) noexcept {
> -+    return from_chars_advanced(first, last, value, options);
> -+  }
> -+};
> -+
> -+#if __STDCPP_FLOAT32_T__ =3D=3D 1
> -+template <> struct from_chars_caller<std::float32_t> {
> -+  template <typename UC>
> -+  FASTFLOAT_CONSTEXPR20 static from_chars_result_t<UC>
> -+  call(UC const *first, UC const *last, std::float32_t &value,
> -+       parse_options_t<UC> options) noexcept {
> -+    // if std::float32_t is defined, and we are in C++23 mode; macro se=
t
> for
> -+    // float32; set value to float due to equivalence between float and
> -+    // float32_t
> -+    float val;
> -+    auto ret =3D from_chars_advanced(first, last, val, options);
> -+    value =3D val;
> -+    return ret;
> -+  }
> -+};
> -+#endif
> -+
> -+#if __STDCPP_FLOAT64_T__ =3D=3D 1
> -+template <> struct from_chars_caller<std::float64_t> {
> -+  template <typename UC>
> -+  FASTFLOAT_CONSTEXPR20 static from_chars_result_t<UC>
> -+  call(UC const *first, UC const *last, std::float64_t &value,
> -+       parse_options_t<UC> options) noexcept {
> -+    // if std::float64_t is defined, and we are in C++23 mode; macro se=
t
> for
> -+    // float64; set value as double due to equivalence between double a=
nd
> -+    // float64_t
> -+    double val;
> -+    auto ret =3D from_chars_advanced(first, last, val, options);
> -+    value =3D val;
> -+    return ret;
> -+  }
> -+};
> -+#endif
> -+
> -+template <typename T, typename UC, typename>
> -+FASTFLOAT_CONSTEXPR20 from_chars_result_t<UC>
> -+from_chars(UC const *first, UC const *last, T &value,
> -+           chars_format fmt /*=3D chars_format::general*/) noexcept {
> -+  return from_chars_caller<T>::call(first, last, value,
> -+                                    parse_options_t<UC>(fmt));
> -+}
> -+
> -+/**
> -+ * This function overload takes parsed_number_string_t structure that i=
s
> created
> -+ * and populated either by from_chars_advanced function taking chars
> range and
> -+ * parsing options or other parsing custom function implemented by user=
.
> -+ */
> -+template <typename T, typename UC>
> -+FASTFLOAT_CONSTEXPR20 from_chars_result_t<UC>
> -+from_chars_advanced(parsed_number_string_t<UC> &pns, T &value) noexcept=
 {
> -+
> -+  static_assert(is_supported_float_type<T>(),
> -+                "only some floating-point types are supported");
> -+  static_assert(is_supported_char_type<UC>(),
> -+                "only char, wchar_t, char16_t and char32_t are
> supported");
> -+
> -+  from_chars_result_t<UC> answer;
> -+
> -+  answer.ec =3D std::errc(); // be optimistic
> -+  answer.ptr =3D pns.lastmatch;
> -+  // The implementation of the Clinger's fast path is convoluted becaus=
e
> -+  // we want round-to-nearest in all cases, irrespective of the roundin=
g
> mode
> -+  // selected on the thread.
> -+  // We proceed optimistically, assuming that detail::rounds_to_nearest=
()
> -+  // returns true.
> -+  if (binary_format<T>::min_exponent_fast_path() <=3D pns.exponent &&
> -+      pns.exponent <=3D binary_format<T>::max_exponent_fast_path() &&
> -+      !pns.too_many_digits) {
> -+    // Unfortunately, the conventional Clinger's fast path is only
> possible
> -+    // when the system rounds to the nearest float.
> -+    //
> -+    // We expect the next branch to almost always be selected.
> -+    // We could check it first (before the previous branch), but
> -+    // there might be performance advantages at having the check
> -+    // be last.
> -+    if (!cpp20_and_in_constexpr() && detail::rounds_to_nearest()) {
> -+      // We have that fegetround() =3D=3D FE_TONEAREST.
> -+      // Next is Clinger's fast path.
> -+      if (pns.mantissa <=3D binary_format<T>::max_mantissa_fast_path())=
 {
> -+        value =3D T(pns.mantissa);
> -+        if (pns.exponent < 0) {
> -+          value =3D value /
> binary_format<T>::exact_power_of_ten(-pns.exponent);
> -+        } else {
> -+          value =3D value *
> binary_format<T>::exact_power_of_ten(pns.exponent);
> -+        }
> -+        if (pns.negative) {
> -+          value =3D -value;
> -+        }
> -+        return answer;
> -+      }
> -+    } else {
> -+      // We do not have that fegetround() =3D=3D FE_TONEAREST.
> -+      // Next is a modified Clinger's fast path, inspired by Jakub
> Jel=C3=ADnek's
> -+      // proposal
> -+      if (pns.exponent >=3D 0 &&
> -+          pns.mantissa <=3D
> -+              binary_format<T>::max_mantissa_fast_path(pns.exponent)) {
> -+#if defined(__clang__) || defined(FASTFLOAT_32BIT)
> -+        // Clang may map 0 to -0.0 when fegetround() =3D=3D FE_DOWNWARD
> -+        if (pns.mantissa =3D=3D 0) {
> -+          value =3D pns.negative ? T(-0.) : T(0.);
> -+          return answer;
> -+        }
> -+#endif
> -+        value =3D T(pns.mantissa) *
> -+                binary_format<T>::exact_power_of_ten(pns.exponent);
> -+        if (pns.negative) {
> -+          value =3D -value;
> -+        }
> -+        return answer;
> -+      }
> -+    }
> -+  }
> -+  adjusted_mantissa am =3D
> -+      compute_float<binary_format<T>>(pns.exponent, pns.mantissa);
> -+  if (pns.too_many_digits && am.power2 >=3D 0) {
> -+    if (am !=3D compute_float<binary_format<T>>(pns.exponent, pns.manti=
ssa
> + 1)) {
> -+      am =3D compute_error<binary_format<T>>(pns.exponent, pns.mantissa=
);
> -+    }
> -+  }
> -+  // If we called compute_float<binary_format<T>>(pns.exponent,
> pns.mantissa)
> -+  // and we have an invalid power (am.power2 < 0), then we need to go
> the long
> -+  // way around again. This is very uncommon.
> -+  if (am.power2 < 0) {
> -+    am =3D digit_comp<T>(pns, am);
> -+  }
> -+  to_float(pns.negative, am, value);
> -+  // Test for over/underflow.
> -+  if ((pns.mantissa !=3D 0 && am.mantissa =3D=3D 0 && am.power2 =3D=3D =
0) ||
> -+      am.power2 =3D=3D binary_format<T>::infinite_power()) {
> -+    answer.ec =3D std::errc::result_out_of_range;
> -+  }
> -+  return answer;
> -+}
> -+
> -+template <typename T, typename UC>
> -+FASTFLOAT_CONSTEXPR20 from_chars_result_t<UC>
> -+from_chars_advanced(UC const *first, UC const *last, T &value,
> -+                    parse_options_t<UC> options) noexcept {
> -+
> -+  static_assert(is_supported_float_type<T>(),
> -+                "only some floating-point types are supported");
> -+  static_assert(is_supported_char_type<UC>(),
> -+                "only char, wchar_t, char16_t and char32_t are
> supported");
> -+
> -+  from_chars_result_t<UC> answer;
> -+#ifdef FASTFLOAT_SKIP_WHITE_SPACE // disabled by default
> -+  while ((first !=3D last) && fast_float::is_space(uint8_t(*first))) {
> -+    first++;
> -+  }
> -+#endif
> -+  if (first =3D=3D last) {
> -+    answer.ec =3D std::errc::invalid_argument;
> -+    answer.ptr =3D first;
> -+    return answer;
> -+  }
> -+  parsed_number_string_t<UC> pns =3D
> -+      parse_number_string<UC>(first, last, options);
> -+  if (!pns.valid) {
> -+    if (options.format & chars_format::no_infnan) {
> -+      answer.ec =3D std::errc::invalid_argument;
> -+      answer.ptr =3D first;
> -+      return answer;
> -+    } else {
> -+      return detail::parse_infnan(first, last, value);
> -+    }
> -+  }
> -+
> -+  // call overload that takes parsed_number_string_t directly.
> -+  return from_chars_advanced(pns, value);
> -+}
> -+
> -+template <typename T, typename UC, typename>
> -+FASTFLOAT_CONSTEXPR20 from_chars_result_t<UC>
> -+from_chars(UC const *first, UC const *last, T &value, int base) noexcep=
t
> {
> -+  static_assert(is_supported_char_type<UC>(),
> -+                "only char, wchar_t, char16_t and char32_t are
> supported");
> -+
> -+  from_chars_result_t<UC> answer;
> -+#ifdef FASTFLOAT_SKIP_WHITE_SPACE // disabled by default
> -+  while ((first !=3D last) && fast_float::is_space(uint8_t(*first))) {
> -+    first++;
> -+  }
> -+#endif
> -+  if (first =3D=3D last || base < 2 || base > 36) {
> -+    answer.ec =3D std::errc::invalid_argument;
> -+    answer.ptr =3D first;
> -+    return answer;
> -+  }
> -+  return parse_int_string(first, last, value, base);
> -+}
> -+
> -+} // namespace fast_float
> -+
> -+#endif
> -+
> diff --git
> a/meta/recipes-support/vte/vte/0005-color-parser-Use-fast_float-implement=
ation-for-from_.patch
> b/meta/recipes-support/vte/vte/0005-color-parser-Use-fast_float-implement=
ation-for-from_.patch
> deleted file mode 100644
> index b951bbac18..0000000000
> ---
> a/meta/recipes-support/vte/vte/0005-color-parser-Use-fast_float-implement=
ation-for-from_.patch
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -From 08b90d0a5bf8ceb68dd1b4e9ded0f8a2b5287a6e Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 4 Oct 2024 21:22:52 -0700
> -Subject: [PATCH 5/5] color-parser: Use fast_float implementation for
> - from_chars
> -
> -Removed dependency on c++ runtime to provide it.
> -
> -Fixes: https://gitlab.gnome.org/GNOME/vte/-/issues/2823
> -
> -Upstream-Status: Submitted [
> https://gitlab.gnome.org/GNOME/vte/-/issues/2823#note_2239888]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/color-parser.cc | 12 ++++++------
> - src/termprops.hh    | 12 ++++++------
> - 2 files changed, 12 insertions(+), 12 deletions(-)
> -
> -diff --git a/src/color-parser.cc b/src/color-parser.cc
> -index 02ec5d3a..42c51966 100644
> ---- a/src/color-parser.cc
> -+++ b/src/color-parser.cc
> -@@ -17,7 +17,7 @@
> -
> - #include "color-parser.hh"
> - #include "color.hh"
> --
> -+#include "fast_float.hh"
> - #include <algorithm>
> - #include <cctype>
> - #include <charconv>
> -@@ -298,7 +298,7 @@ parse_csslike(std::string const& spec) noexcept
> -                 auto value =3D uint64_t{};
> -                 auto const start =3D spec.c_str() + 1;
> -                 auto const end =3D spec.c_str() + spec.size();
> --                auto const rv =3D std::from_chars(start, end, value, 16=
);
> -+                auto const rv =3D fast_float::from_chars(start, end,
> value, 16);
> -                 if (rv.ec !=3D std::errc{} || rv.ptr !=3D end)
> -                         return std::nullopt;
> -
> -@@ -424,7 +424,7 @@ parse_x11like(std::string const& spec) noexcept
> -                 auto value =3D uint64_t{};
> -                 auto const start =3D spec.c_str() + 1;
> -                 auto const end =3D spec.c_str() + spec.size();
> --                auto const rv =3D std::from_chars(start, end, value, 16=
);
> -+                auto const rv =3D fast_float::from_chars(start, end,
> value, 16);
> -                 if (rv.ec !=3D std::errc{} || rv.ptr !=3D end)
> -                         return std::nullopt;
> -
> -@@ -447,13 +447,13 @@ parse_x11like(std::string const& spec) noexcept
> -                 // Note that the length check above makes sure that @r,
> @g, @b,
> -                 // don't exceed @bits.
> -                 auto r =3D UINT64_C(0), b =3D UINT64_C(0), g =3D UINT64=
_C(0);
> --                auto rv =3D std::from_chars(start, end, r, 16);
> -+                auto rv =3D fast_float::from_chars(start, end, r, 16);
> -                 if (rv.ec !=3D std::errc{} || rv.ptr =3D=3D end || *rv.=
ptr !=3D
> '/')
> -                         return std::nullopt;
> --                rv =3D std::from_chars(rv.ptr + 1, end, g, 16);
> -+                rv =3D fast_float::from_chars(rv.ptr + 1, end, g, 16);
> -                 if (rv.ec !=3D std::errc{} || rv.ptr =3D=3D end || *rv.=
ptr !=3D
> '/')
> -                         return std::nullopt;
> --                rv =3D std::from_chars(rv.ptr + 1, end, b, 16);
> -+                rv =3D fast_float::from_chars(rv.ptr + 1, end, b, 16);
> -                 if (rv.ec !=3D std::errc{} || rv.ptr !=3D end)
> -                         return std::nullopt;
> -
> -diff --git a/src/termprops.hh b/src/termprops.hh
> -index 0d3f0f4c..a10fc7d1 100644
> ---- a/src/termprops.hh
> -+++ b/src/termprops.hh
> -@@ -17,6 +17,7 @@
> -
> - #include <glib.h>
> -
> -+#include "fast_float.hh"
> - #include "fwd.hh"
> - #include "uuid.hh"
> - #include "color.hh"
> -@@ -355,8 +356,8 @@ inline std::optional<TermpropValue>
> - parse_termprop_integral(std::string_view const& str) noexcept
> - {
> -         auto v =3D T{};
> --        if (auto [ptr, err] =3D std::from_chars(std::begin(str),
> --                                              std::end(str),
> -+        if (auto [ptr, err] =3D fast_float::from_chars(str.data(),
> -+                                              str.data()+str.size(),
> -                                               v);
> -             err =3D=3D std::errc() && ptr =3D=3D std::end(str)) {
> -                 if constexpr (std::is_unsigned_v<T>) {
> -@@ -389,10 +390,9 @@ inline std::optional<TermpropValue>
> - parse_termprop_floating(std::string_view const& str) noexcept
> - {
> -         auto v =3D T{};
> --        if (auto [ptr, err] =3D std::from_chars(std::begin(str),
> --                                              std::end(str),
> --                                              v,
> --
> std::chars_format::general);
> -+        if (auto [ptr, err] =3D fast_float::from_chars(str.data(),
> -+                                              str.data() + str.size(),
> -+                                              v);
> -             err =3D=3D std::errc() &&
> -             ptr =3D=3D std::end(str) &&
> -             std::isfinite(v)) {
> diff --git a/meta/recipes-support/vte/vte_0.78.2.bb
> b/meta/recipes-support/vte/vte_0.80.3.bb
> similarity index 82%
> rename from meta/recipes-support/vte/vte_0.78.2.bb
> rename to meta/recipes-support/vte/vte_0.80.3.bb
> index 0593d16cd8..1eb95dd827 100644
> --- a/meta/recipes-support/vte/vte_0.78.2.bb
> +++ b/meta/recipes-support/vte/vte_0.80.3.bb
> @@ -11,18 +11,15 @@ LIC_FILES_CHKSUM =3D " \
>      file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057 \
>  "
>
> -DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native
> gperf-native icu lz4"
> +DEPENDS =3D "fastfloat glib-2.0 glib-2.0-native gtk+3 libpcre2
> libxml2-native gperf-native icu lz4"
>
>  GIR_MESON_OPTION =3D 'gir'
>  GIDOCGEN_MESON_OPTION =3D "docs"
>  inherit gnomebase gi-docgen features_check upstream-version-is-even
> gobject-introspection systemd vala
>
> -SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pat=
ch \
> -           file://0002-lib-Typo-fix.patch \
> -
>  file://0004-fast_float-Add-single-header-library-for-from_char-i.patch \
> -
>  file://0005-color-parser-Use-fast_float-implementation-for-from_.patch \
> -           "
> -SRC_URI[archive.sha256sum] =3D
> "35d7bcde07356846b4a12881c8e016705b70a9004a9082285eee5834ccc49890"
> +SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pat=
ch"
> +
> +SRC_URI[archive.sha256sum] =3D
> "2e596fd3fbeabb71531662224e71f6a2c37f684426136d62854627276ef4f699"
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
> @@ -49,7 +46,8 @@ FILES:${PN}-gtk4-dev =3D "${libdir}/lib*gtk4.so \
>                          ${datadir}/vala/vapi/vte-2.91-gtk4.vapi \
>                          ${includedir}/vte-2.91-gtk4 \
>                          "
> -FILES:${PN} +=3D "${systemd_user_unitdir}"
> +FILES:${PN} +=3D "${systemd_user_unitdir} \
> +                ${datadir}/xdg-terminals"
>  FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
>  FILES:${PN}-prompt =3D " \
>      ${sysconfdir}/profile.d \
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222738):
> https://lists.openembedded.org/g/openembedded-core/message/222738
> Mute This Topic: https://lists.openembedded.org/mt/115028533/556952
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rob.woolleywr@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bc8889063dd3535a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please disregard this.... it was git-send-email user error=
 because I adding -M 1 from the README.md<br><br>Regards,<br>Rob</div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Sep 2, 2025 at 11:39=E2=80=AFAM Rob Woolley via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;rob.wooll=
ey=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigrau=
n@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
<br>
0004-fast_float-Add-single-header-library-for-from_char-i.patch<br>
and 0005-color-parser-Use-fast_float-implementation-for-from_.patch<br>
patches dropped: upstream has adopted the changes, and oe-core also<br>
provides now fastfloat, no need to vendor it with a patch.<br>
<br>
0002-lib-Typo-fix.patch is dropped, because it was a backport, and<br>
it is included in this release.<br>
<br>
Shortlog: <a href=3D"https://gitlab.gnome.org/GNOME/vte/-/compare/0.80.3...=
0.78.2" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME=
/vte/-/compare/0.80.3...0.78.2</a><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
Signed-off-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-b=
riand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&=
gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0.../vte/vte/0002-lib-Typo-fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A025 -<br>
=C2=A0...ingle-header-library-for-from_char-i.patch | 3922 ----------------=
-<br>
=C2=A0...-fast_float-implementation-for-from_.patch |=C2=A0 102 -<br>
=C2=A0.../vte/{<a href=3D"http://vte_0.78.2.bb" rel=3D"noreferrer" target=
=3D"_blank">vte_0.78.2.bb</a> =3D&gt; <a href=3D"http://vte_0.80.3.bb" rel=
=3D"noreferrer" target=3D"_blank">vte_0.80.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A014 +-<br>
=C2=A04 files changed, 6 insertions(+), 4057 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-support/vte/vte/0002-lib-Typo-fix.pat=
ch<br>
=C2=A0delete mode 100644 meta/recipes-support/vte/vte/0004-fast_float-Add-s=
ingle-header-library-for-from_char-i.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/vte/vte/0005-color-parser-Use=
-fast_float-implementation-for-from_.patch<br>
=C2=A0rename meta/recipes-support/vte/{<a href=3D"http://vte_0.78.2.bb" rel=
=3D"noreferrer" target=3D"_blank">vte_0.78.2.bb</a> =3D&gt; <a href=3D"http=
://vte_0.80.3.bb" rel=3D"noreferrer" target=3D"_blank">vte_0.80.3.bb</a>} (=
82%)<br>
<br>
diff --git a/meta/recipes-support/vte/vte/0002-lib-Typo-fix.patch b/meta/re=
cipes-support/vte/vte/0002-lib-Typo-fix.patch<br>
deleted file mode 100644<br>
index 410d506806..0000000000<br>
--- a/meta/recipes-support/vte/vte/0002-lib-Typo-fix.patch<br>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-From 6b7440996819c12ec32bfaf4e73b27baeb273207 Mon Sep 17 00:00:00 2001<br>
-From: Christian Persch &lt;<a href=3D"mailto:chpe@src.gnome.org" target=3D=
"_blank">chpe@src.gnome.org</a>&gt;<br>
-Date: Thu, 5 Sep 2024 23:59:05 +0200<br>
-Subject: [PATCH 2/3] lib: Typo fix<br>
-<br>
-Fixes: <a href=3D"https://gitlab.gnome.org/GNOME/vte/-/issues/2816" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/vte/-/issues/=
2816</a><br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/vte/-=
/commit/e24087d953d9352c8bc46074e2662c80f9bfbc2d" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.gnome.org/GNOME/vte/-/commit/e24087d953d9352c8bc=
46074e2662c80f9bfbc2d</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- src/vteinternal.hh | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/vteinternal.hh b/src/vteinternal.hh<br>
-index 051e78c..b1adc19 100644<br>
---- a/src/vteinternal.hh<br>
-+++ b/src/vteinternal.hh<br>
-@@ -1233,7 +1233,7 @@ public:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void reset_decoder();<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void feed(std::string_view const&amp; da=
ta,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool start=
_processsing_ =3D true);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool start=
_processing_ =3D true);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void feed_child(char const* data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0size_t length) { assert(data); feed_child({data, length});=
 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void feed_child(std::string_view const&a=
mp; str);<br>
diff --git a/meta/recipes-support/vte/vte/0004-fast_float-Add-single-header=
-library-for-from_char-i.patch b/meta/recipes-support/vte/vte/0004-fast_flo=
at-Add-single-header-library-for-from_char-i.patch<br>
deleted file mode 100644<br>
index 731dba729d..0000000000<br>
--- a/meta/recipes-support/vte/vte/0004-fast_float-Add-single-header-librar=
y-for-from_char-i.patch<br>
+++ /dev/null<br>
@@ -1,3922 +0,0 @@<br>
-From 2a32e43e43b04771a3357d3d4ccbafa7714e0114 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Fri, 4 Oct 2024 21:21:11 -0700<br>
-Subject: [PATCH 4/5] fast_float: Add single header library for from_char<b=
r>
- implementation<br>
-<br>
-Document the process to re-generate the file whenever new release<br>
-is made for fast_float upstream.<br>
-<br>
-This would make it work with llvm libc++<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://gitlab.gnome.org/GNOME/vte/=
-/issues/2823#note_2239888" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.gnome.org/GNOME/vte/-/issues/2823#note_2239888</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A017 +<br>
- src/fast_float.hh | 3869 +++++++++++++++++++++++++++++++++++++++++++++<br=
>
- 2 files changed, 3886 insertions(+)<br>
- create mode 100644 src/fast_float.hh<br>
-<br>
-diff --git a/README.md b/README.md<br>
-index a32465a9..20ed5ba2 100644<br>
---- a/README.md<br>
-+++ b/README.md<br>
-@@ -21,6 +21,23 @@ on <a href=3D"http://download.gnome.org" rel=3D"norefer=
rer" target=3D"_blank">download.gnome.org</a>, but please note that any tar=
ball for releases<br>
- after 0.60.3 were made by either the gnome release team or other<br>
- gnome contributors, but not by a VTE maintainer.<br>
- <br>
-+fast_float library[1] is used to provide from_chars implementation for fa=
ster<br>
-+and more portable parsing of 64 decimal strings.<br>
-+<br>
-+fast_float.hh is an amalgamation of the entire library,<br>
-+which can be regenerated by using amalgamate.py script provided by<br>
-+fast_float repository. Following command can be used to re-generate the<b=
r>
-+header file<br>
-+<br>
-+```<br>
-+git clone <a href=3D"https://github.com/fastfloat/fast_float" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/fastfloat/fast_float</a><br>
-+cd fast_float<br>
-+git checkout v6.1.6<br>
-+python3 ./script/amalgamate.py --license=3DMIT &gt; $VTE_SRC/src/fast_flo=
at.hh<br>
-+```<br>
-+<br>
-+[1]: <a href=3D"https://github.com/fastfloat/fast_float" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/fastfloat/fast_float</a><br>
-+<br>
- Installation<br>
- ------------<br>
- <br>
-diff --git a/src/fast_float.hh b/src/fast_float.hh<br>
-new file mode 100644<br>
-index 00000000..e0d5dd53<br>
---- /dev/null<br>
-+++ b/src/fast_float.hh<br>
-@@ -0,0 +1,3869 @@<br>
-+// fast_float by Daniel Lemire<br>
-+// fast_float by Jo=C3=A3o Paulo Magalhaes<br>
-+//<br>
-+//<br>
-+// with contributions from Eugene Golushkov<br>
-+// with contributions from Maksim Kita<br>
-+// with contributions from Marcin Wojdyr<br>
-+// with contributions from Neal Richardson<br>
-+// with contributions from Tim Paine<br>
-+// with contributions from Fabio Pellacini<br>
-+// with contributions from L=C3=A9n=C3=A1rd Szolnoki<br>
-+// with contributions from Jan Pharago<br>
-+// with contributions from Maya Warrier<br>
-+// with contributions from Taha Khokhar<br>
-+//<br>
-+//<br>
-+// MIT License Notice<br>
-+//<br>
-+//=C2=A0 =C2=A0 MIT License<br>
-+//=C2=A0 =C2=A0 <br>
-+//=C2=A0 =C2=A0 Copyright (c) 2021 The fast_float authors<br>
-+//=C2=A0 =C2=A0 <br>
-+//=C2=A0 =C2=A0 Permission is hereby granted, free of charge, to any<br>
-+//=C2=A0 =C2=A0 person obtaining a copy of this software and associated<b=
r>
-+//=C2=A0 =C2=A0 documentation files (the &quot;Software&quot;), to deal i=
n the<br>
-+//=C2=A0 =C2=A0 Software without restriction, including without<br>
-+//=C2=A0 =C2=A0 limitation the rights to use, copy, modify, merge,<br>
-+//=C2=A0 =C2=A0 publish, distribute, sublicense, and/or sell copies of<br=
>
-+//=C2=A0 =C2=A0 the Software, and to permit persons to whom the Software<=
br>
-+//=C2=A0 =C2=A0 is furnished to do so, subject to the following<br>
-+//=C2=A0 =C2=A0 conditions:<br>
-+//=C2=A0 =C2=A0 <br>
-+//=C2=A0 =C2=A0 The above copyright notice and this permission notice<br>
-+//=C2=A0 =C2=A0 shall be included in all copies or substantial portions<b=
r>
-+//=C2=A0 =C2=A0 of the Software.<br>
-+//=C2=A0 =C2=A0 <br>
-+//=C2=A0 =C2=A0 THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRA=
NTY OF<br>
-+//=C2=A0 =C2=A0 ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED<b=
r>
-+//=C2=A0 =C2=A0 TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A<br>
-+//=C2=A0 =C2=A0 PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT<br>
-+//=C2=A0 =C2=A0 SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY<=
br>
-+//=C2=A0 =C2=A0 CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION<b=
r>
-+//=C2=A0 =C2=A0 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR<b=
r>
-+//=C2=A0 =C2=A0 IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER<br>
-+//=C2=A0 =C2=A0 DEALINGS IN THE SOFTWARE.<br>
-+//<br>
-+<br>
-+#ifndef FASTFLOAT_CONSTEXPR_FEATURE_DETECT_H<br>
-+#define FASTFLOAT_CONSTEXPR_FEATURE_DETECT_H<br>
-+<br>
-+#ifdef __has_include<br>
-+#if __has_include(&lt;version&gt;)<br>
-+#include &lt;version&gt;<br>
-+#endif<br>
-+#endif<br>
-+<br>
-+// Testing for <a href=3D"https://wg21.link/N3652" rel=3D"noreferrer" tar=
get=3D"_blank">https://wg21.link/N3652</a>, adopted in C++14<br>
-+#if __cpp_constexpr &gt;=3D 201304<br>
-+#define FASTFLOAT_CONSTEXPR14 constexpr<br>
-+#else<br>
-+#define FASTFLOAT_CONSTEXPR14<br>
-+#endif<br>
-+<br>
-+#if defined(__cpp_lib_bit_cast) &amp;&amp; __cpp_lib_bit_cast &gt;=3D 201=
806L<br>
-+#define FASTFLOAT_HAS_BIT_CAST 1<br>
-+#else<br>
-+#define FASTFLOAT_HAS_BIT_CAST 0<br>
-+#endif<br>
-+<br>
-+#if defined(__cpp_lib_is_constant_evaluated) &amp;&amp;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 __cpp_lib_is_constant_evaluated &gt;=3D 201811L<br>
-+#define FASTFLOAT_HAS_IS_CONSTANT_EVALUATED 1<br>
-+#else<br>
-+#define FASTFLOAT_HAS_IS_CONSTANT_EVALUATED 0<br>
-+#endif<br>
-+<br>
-+// Testing for relevant C++20 constexpr library features<br>
-+#if FASTFLOAT_HAS_IS_CONSTANT_EVALUATED &amp;&amp; FASTFLOAT_HAS_BIT_CAST=
 &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 __cpp_lib_constexpr_algorithms &gt;=3D 201806L /*For std::c=
opy and std::fill*/<br>
-+#define FASTFLOAT_CONSTEXPR20 constexpr<br>
-+#define FASTFLOAT_IS_CONSTEXPR 1<br>
-+#else<br>
-+#define FASTFLOAT_CONSTEXPR20<br>
-+#define FASTFLOAT_IS_CONSTEXPR 0<br>
-+#endif<br>
-+<br>
-+#if __cplusplus &gt;=3D 201703L || (defined(_MSVC_LANG) &amp;&amp; _MSVC_=
LANG &gt;=3D 201703L)<br>
-+#define FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE 0<br>
-+#else<br>
-+#define FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE 1<br>
-+#endif<br>
-+<br>
-+#endif // FASTFLOAT_CONSTEXPR_FEATURE_DETECT_H<br>
-+<br>
-+#ifndef FASTFLOAT_FLOAT_COMMON_H<br>
-+#define FASTFLOAT_FLOAT_COMMON_H<br>
-+<br>
-+#include &lt;cfloat&gt;<br>
-+#include &lt;cstdint&gt;<br>
-+#include &lt;cassert&gt;<br>
-+#include &lt;cstring&gt;<br>
-+#include &lt;type_traits&gt;<br>
-+#include &lt;system_error&gt;<br>
-+#ifdef __has_include<br>
-+#if __has_include(&lt;stdfloat&gt;) &amp;&amp; (__cplusplus &gt; 202002L =
|| _MSVC_LANG &gt; 202002L)<br>
-+#include &lt;stdfloat&gt;<br>
-+#endif<br>
-+#endif<br>
-+<br>
-+namespace fast_float {<br>
-+<br>
-+#define FASTFLOAT_JSONFMT (1 &lt;&lt; 5)<br>
-+#define FASTFLOAT_FORTRANFMT (1 &lt;&lt; 6)<br>
-+<br>
-+enum chars_format {<br>
-+=C2=A0 scientific =3D 1 &lt;&lt; 0,<br>
-+=C2=A0 fixed =3D 1 &lt;&lt; 2,<br>
-+=C2=A0 hex =3D 1 &lt;&lt; 3,<br>
-+=C2=A0 no_infnan =3D 1 &lt;&lt; 4,<br>
-+=C2=A0 // RFC 8259: <a href=3D"https://datatracker.ietf.org/doc/html/rfc8=
259#section-6" rel=3D"noreferrer" target=3D"_blank">https://datatracker.iet=
f.org/doc/html/rfc8259#section-6</a><br>
-+=C2=A0 json =3D FASTFLOAT_JSONFMT | fixed | scientific | no_infnan,<br>
-+=C2=A0 // Extension of RFC 8259 where, e.g., &quot;inf&quot; and &quot;na=
n&quot; are allowed.<br>
-+=C2=A0 json_or_infnan =3D FASTFLOAT_JSONFMT | fixed | scientific,<br>
-+=C2=A0 fortran =3D FASTFLOAT_FORTRANFMT | fixed | scientific,<br>
-+=C2=A0 general =3D fixed | scientific<br>
-+};<br>
-+<br>
-+template &lt;typename UC&gt; struct from_chars_result_t {<br>
-+=C2=A0 UC const *ptr;<br>
-+=C2=A0 std::errc ec;<br>
-+};<br>
-+using from_chars_result =3D from_chars_result_t&lt;char&gt;;<br>
-+<br>
-+template &lt;typename UC&gt; struct parse_options_t {<br>
-+=C2=A0 constexpr explicit parse_options_t(chars_format fmt =3D chars_form=
at::general,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UC dot =3D UC(&#=
39;.&#39;))<br>
-+=C2=A0 =C2=A0 =C2=A0 : format(fmt), decimal_point(dot) {}<br>
-+<br>
-+=C2=A0 /** Which number formats are accepted */<br>
-+=C2=A0 chars_format format;<br>
-+=C2=A0 /** The character used as decimal point */<br>
-+=C2=A0 UC decimal_point;<br>
-+};<br>
-+using parse_options =3D parse_options_t&lt;char&gt;;<br>
-+<br>
-+} // namespace fast_float<br>
-+<br>
-+#if FASTFLOAT_HAS_BIT_CAST<br>
-+#include &lt;bit&gt;<br>
-+#endif<br>
-+<br>
-+#if (defined(__x86_64) || defined(__x86_64__) || defined(_M_X64) ||=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 =C2=A0defined(__amd64) || defined(__aarch64__) || defined(_=
M_ARM64) ||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 =C2=A0defined(__MINGW64__) || defined(__s390x__) ||=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 =C2=A0(defined(__ppc64__) || defined(__PPC64__) || defined(=
__ppc64le__) ||=C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 =C2=A0 defined(__PPC64LE__)) ||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
-+=C2=A0 =C2=A0 =C2=A0defined(__loongarch64))<br>
-+#define FASTFLOAT_64BIT 1<br>
-+#elif (defined(__i386) || defined(__i386__) || defined(_M_IX86) ||=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0defined(__arm__) || defined(_M_ARM) || defined=
(__ppc__) ||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0defined(__MINGW32__) || defined(__EMSCRIPTEN__=
))<br>
-+#define FASTFLOAT_32BIT 1<br>
-+#else<br>
-+=C2=A0 // Need to check incrementally, since SIZE_MAX is a size_t, avoid =
overflow.<br>
-+// We can never tell the register width, but the SIZE_MAX is a good<br>
-+// approximation. UINTPTR_MAX and INTPTR_MAX are optional, so avoid them =
for max<br>
-+// portability.<br>
-+#if SIZE_MAX =3D=3D 0xffff<br>
-+#error Unknown platform (16-bit, unsupported)<br>
-+#elif SIZE_MAX =3D=3D 0xffffffff<br>
-+#define FASTFLOAT_32BIT 1<br>
-+#elif SIZE_MAX =3D=3D 0xffffffffffffffff<br>
-+#define FASTFLOAT_64BIT 1<br>
-+#else<br>
-+#error Unknown platform (not 32-bit, not 64-bit?)<br>
-+#endif<br>
-+#endif<br>
-+<br>
-+#if ((defined(_WIN32) || defined(_WIN64)) &amp;&amp; !defined(__clang__))=
 ||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 (defined(_M_ARM64) &amp;&amp; !defined(__MINGW32__))<br>
-+#include &lt;intrin.h&gt;<br>
-+#endif<br>
-+<br>
-+#if defined(_MSC_VER) &amp;&amp; !defined(__clang__)<br>
-+#define FASTFLOAT_VISUAL_STUDIO 1<br>
-+#endif<br>
-+<br>
-+#if defined __BYTE_ORDER__ &amp;&amp; defined __ORDER_BIG_ENDIAN__<br>
-+#define FASTFLOAT_IS_BIG_ENDIAN (__BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN=
__)<br>
-+#elif defined _WIN32<br>
-+#define FASTFLOAT_IS_BIG_ENDIAN 0<br>
-+#else<br>
-+#if defined(__APPLE__) || defined(__FreeBSD__)<br>
-+#include &lt;machine/endian.h&gt;<br>
-+#elif defined(sun) || defined(__sun)<br>
-+#include &lt;sys/byteorder.h&gt;<br>
-+#elif defined(__MVS__)<br>
-+#include &lt;sys/endian.h&gt;<br>
-+#else<br>
-+#ifdef __has_include<br>
-+#if __has_include(&lt;endian.h&gt;)<br>
-+#include &lt;endian.h&gt;<br>
-+#endif //__has_include(&lt;endian.h&gt;)<br>
-+#endif //__has_include<br>
-+#endif<br>
-+#<br>
-+#ifndef __BYTE_ORDER__<br>
-+// safe choice<br>
-+#define FASTFLOAT_IS_BIG_ENDIAN 0<br>
-+#endif<br>
-+#<br>
-+#ifndef __ORDER_LITTLE_ENDIAN__<br>
-+// safe choice<br>
-+#define FASTFLOAT_IS_BIG_ENDIAN 0<br>
-+#endif<br>
-+#<br>
-+#if __BYTE_ORDER__ =3D=3D __ORDER_LITTLE_ENDIAN__<br>
-+#define FASTFLOAT_IS_BIG_ENDIAN 0<br>
-+#else<br>
-+#define FASTFLOAT_IS_BIG_ENDIAN 1<br>
-+#endif<br>
-+#endif<br>
-+<br>
-+#if defined(__SSE2__) || (defined(FASTFLOAT_VISUAL_STUDIO) &amp;&amp;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (defined(_M_AMD64) || defined(_M_X64) ||=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(defined(_M_IX86_FP) &amp;&amp; _M_IX86_FP =3D=3D 2=
)))<br>
-+#define FASTFLOAT_SSE2 1<br>
-+#endif<br>
-+<br>
-+#if defined(__aarch64__) || defined(_M_ARM64)<br>
-+#define FASTFLOAT_NEON 1<br>
-+#endif<br>
-+<br>
-+#if defined(FASTFLOAT_SSE2) || defined(FASTFLOAT_NEON)<br>
-+#define FASTFLOAT_HAS_SIMD 1<br>
-+#endif<br>
-+<br>
-+#if defined(__GNUC__)<br>
-+// disable -Wcast-align=3Dstrict (GCC only)<br>
-+#define FASTFLOAT_SIMD_DISABLE_WARNINGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 _Pragma(&quot;GCC diagnostic push&quot;)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 =C2=A0 _Pragma(&quot;GCC diagnostic ignored \&quot;-Wcast-a=
lign\&quot;&quot;)<br>
-+#else<br>
-+#define FASTFLOAT_SIMD_DISABLE_WARNINGS<br>
-+#endif<br>
-+<br>
-+#if defined(__GNUC__)<br>
-+#define FASTFLOAT_SIMD_RESTORE_WARNINGS _Pragma(&quot;GCC diagnostic pop&=
quot;)<br>
-+#else<br>
-+#define FASTFLOAT_SIMD_RESTORE_WARNINGS<br>
-+#endif<br>
-+<br>
-+#ifdef FASTFLOAT_VISUAL_STUDIO<br>
-+#define fastfloat_really_inline __forceinline<br>
-+#else<br>
-+#define fastfloat_really_inline inline __attribute__((always_inline))<br>
-+#endif<br>
-+<br>
-+#ifndef FASTFLOAT_ASSERT<br>
-+#define FASTFLOAT_ASSERT(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 { ((void)(x)); }<br>
-+#endif<br>
-+<br>
-+#ifndef FASTFLOAT_DEBUG_ASSERT<br>
-+#define FASTFLOAT_DEBUG_ASSERT(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 { ((void)(x)); }<br>
-+#endif<br>
-+<br>
-+// rust style `try!()` macro, or `?` operator<br>
-+#define FASTFLOAT_TRY(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
-+=C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 if (!(x))=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 }<br>
-+<br>
-+#define FASTFLOAT_ENABLE_IF(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 typename std::enable_if&lt;(__VA_ARGS__), int&gt;::type<br>
-+<br>
-+namespace fast_float {<br>
-+<br>
-+fastfloat_really_inline constexpr bool cpp20_and_in_constexpr() {<br>
-+#if FASTFLOAT_HAS_IS_CONSTANT_EVALUATED<br>
-+=C2=A0 return std::is_constant_evaluated();<br>
-+#else<br>
-+=C2=A0 return false;<br>
-+#endif<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+fastfloat_really_inline constexpr bool is_supported_float_type() {<br>
-+=C2=A0 return std::is_same&lt;T, float&gt;::value || std::is_same&lt;T, d=
ouble&gt;::value<br>
-+#if __STDCPP_FLOAT32_T__<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| std::is_same&lt;T, std::float32_t&gt=
;::value<br>
-+#endif<br>
-+#if __STDCPP_FLOAT64_T__<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| std::is_same&lt;T, std::float64_t&gt=
;::value<br>
-+#endif<br>
-+=C2=A0 =C2=A0 =C2=A0 ;<br>
-+}<br>
-+<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline constexpr bool is_supported_char_type() {<br>
-+=C2=A0 return std::is_same&lt;UC, char&gt;::value || std::is_same&lt;UC, =
wchar_t&gt;::value ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::is_same&lt;UC, char16_t&gt;::value=
 || std::is_same&lt;UC, char32_t&gt;::value;<br>
-+}<br>
-+<br>
-+// Compares two ASCII strings in a case insensitive manner.<br>
-+template &lt;typename UC&gt;<br>
-+inline FASTFLOAT_CONSTEXPR14 bool<br>
-+fastfloat_strncasecmp(UC const *input1, UC const *input2, size_t length) =
{<br>
-+=C2=A0 char running_diff{0};<br>
-+=C2=A0 for (size_t i =3D 0; i &lt; length; ++i) {<br>
-+=C2=A0 =C2=A0 running_diff |=3D (char(input1[i]) ^ char(input2[i]));<br>
-+=C2=A0 }<br>
-+=C2=A0 return (running_diff =3D=3D 0) || (running_diff =3D=3D 32);<br>
-+}<br>
-+<br>
-+#ifndef FLT_EVAL_METHOD<br>
-+#error &quot;FLT_EVAL_METHOD should be defined, please include cfloat.&qu=
ot;<br>
-+#endif<br>
-+<br>
-+// a pointer and a length to a contiguous block of memory<br>
-+template &lt;typename T&gt; struct span {<br>
-+=C2=A0 const T *ptr;<br>
-+=C2=A0 size_t length;<br>
-+=C2=A0 constexpr span(const T *_ptr, size_t _length) : ptr(_ptr), length(=
_length) {}<br>
-+=C2=A0 constexpr span() : ptr(nullptr), length(0) {}<br>
-+<br>
-+=C2=A0 constexpr size_t len() const noexcept { return length; }<br>
-+<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR14 const T &amp;operator[](size_t index) const =
noexcept {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_DEBUG_ASSERT(index &lt; length);<br>
-+=C2=A0 =C2=A0 return ptr[index];<br>
-+=C2=A0 }<br>
-+};<br>
-+<br>
-+struct value128 {<br>
-+=C2=A0 uint64_t low;<br>
-+=C2=A0 uint64_t high;<br>
-+=C2=A0 constexpr value128(uint64_t _low, uint64_t _high) : low(_low), hig=
h(_high) {}<br>
-+=C2=A0 constexpr value128() : low(0), high(0) {}<br>
-+};<br>
-+<br>
-+/* Helper C++14 constexpr generic implementation of leading_zeroes */<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 int<br>
-+leading_zeroes_generic(uint64_t input_num, int last_bit =3D 0) {<br>
-+=C2=A0 if (input_num &amp; uint64_t(0xffffffff00000000)) {<br>
-+=C2=A0 =C2=A0 input_num &gt;&gt;=3D 32;<br>
-+=C2=A0 =C2=A0 last_bit |=3D 32;<br>
-+=C2=A0 }<br>
-+=C2=A0 if (input_num &amp; uint64_t(0xffff0000)) {<br>
-+=C2=A0 =C2=A0 input_num &gt;&gt;=3D 16;<br>
-+=C2=A0 =C2=A0 last_bit |=3D 16;<br>
-+=C2=A0 }<br>
-+=C2=A0 if (input_num &amp; uint64_t(0xff00)) {<br>
-+=C2=A0 =C2=A0 input_num &gt;&gt;=3D 8;<br>
-+=C2=A0 =C2=A0 last_bit |=3D 8;<br>
-+=C2=A0 }<br>
-+=C2=A0 if (input_num &amp; uint64_t(0xf0)) {<br>
-+=C2=A0 =C2=A0 input_num &gt;&gt;=3D 4;<br>
-+=C2=A0 =C2=A0 last_bit |=3D 4;<br>
-+=C2=A0 }<br>
-+=C2=A0 if (input_num &amp; uint64_t(0xc)) {<br>
-+=C2=A0 =C2=A0 input_num &gt;&gt;=3D 2;<br>
-+=C2=A0 =C2=A0 last_bit |=3D 2;<br>
-+=C2=A0 }<br>
-+=C2=A0 if (input_num &amp; uint64_t(0x2)) { /* input_num &gt;&gt;=3D=C2=
=A0 1; */<br>
-+=C2=A0 =C2=A0 last_bit |=3D 1;<br>
-+=C2=A0 }<br>
-+=C2=A0 return 63 - last_bit;<br>
-+}<br>
-+<br>
-+/* result might be undefined when input_num is zero */<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 int<br>
-+leading_zeroes(uint64_t input_num) {<br>
-+=C2=A0 assert(input_num &gt; 0);<br>
-+=C2=A0 if (cpp20_and_in_constexpr()) {<br>
-+=C2=A0 =C2=A0 return leading_zeroes_generic(input_num);<br>
-+=C2=A0 }<br>
-+#ifdef FASTFLOAT_VISUAL_STUDIO<br>
-+#if defined(_M_X64) || defined(_M_ARM64)<br>
-+=C2=A0 unsigned long leading_zero =3D 0;<br>
-+=C2=A0 // Search the mask data from most significant bit (MSB)<br>
-+=C2=A0 // to least significant bit (LSB) for a set bit (1).<br>
-+=C2=A0 _BitScanReverse64(&amp;leading_zero, input_num);<br>
-+=C2=A0 return (int)(63 - leading_zero);<br>
-+#else<br>
-+=C2=A0 return leading_zeroes_generic(input_num);<br>
-+#endif<br>
-+#else<br>
-+=C2=A0 return __builtin_clzll(input_num);<br>
-+#endif<br>
-+}<br>
-+<br>
-+// slow emulation routine for 32-bit<br>
-+fastfloat_really_inline constexpr uint64_t emulu(uint32_t x, uint32_t y) =
{<br>
-+=C2=A0 return x * (uint64_t)y;<br>
-+}<br>
-+<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 uint64_t<br>
-+umul128_generic(uint64_t ab, uint64_t cd, uint64_t *hi) {<br>
-+=C2=A0 uint64_t ad =3D emulu((uint32_t)(ab &gt;&gt; 32), (uint32_t)cd);<b=
r>
-+=C2=A0 uint64_t bd =3D emulu((uint32_t)ab, (uint32_t)cd);<br>
-+=C2=A0 uint64_t adbc =3D ad + emulu((uint32_t)ab, (uint32_t)(cd &gt;&gt; =
32));<br>
-+=C2=A0 uint64_t adbc_carry =3D (uint64_t)(adbc &lt; ad);<br>
-+=C2=A0 uint64_t lo =3D bd + (adbc &lt;&lt; 32);<br>
-+=C2=A0 *hi =3D emulu((uint32_t)(ab &gt;&gt; 32), (uint32_t)(cd &gt;&gt; 3=
2)) + (adbc &gt;&gt; 32) +<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (adbc_carry &lt;&lt; 32) + (uint64_t)(lo &lt;=
 bd);<br>
-+=C2=A0 return lo;<br>
-+}<br>
-+<br>
-+#ifdef FASTFLOAT_32BIT<br>
-+<br>
-+// slow emulation routine for 32-bit<br>
-+#if !defined(__MINGW64__)<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 uint64_t _umul128(uint64_t =
ab,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint64_t cd,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint64_t *hi) {<br>
-+=C2=A0 return umul128_generic(ab, cd, hi);<br>
-+}<br>
-+#endif // !__MINGW64__<br>
-+<br>
-+#endif // FASTFLOAT_32BIT<br>
-+<br>
-+// compute 64-bit a*b<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 value128<br>
-+full_multiplication(uint64_t a, uint64_t b) {<br>
-+=C2=A0 if (cpp20_and_in_constexpr()) {<br>
-+=C2=A0 =C2=A0 value128 answer;<br>
-+=C2=A0 =C2=A0 answer.low =3D umul128_generic(a, b, &amp;answer.high);<br>
-+=C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 }<br>
-+=C2=A0 value128 answer;<br>
-+#if defined(_M_ARM64) &amp;&amp; !defined(__MINGW32__)<br>
-+=C2=A0 // ARM64 has native support for 64-bit multiplications, no need to=
 emulate<br>
-+=C2=A0 // But MinGW on ARM64 doesn&#39;t have native support for 64-bit m=
ultiplications<br>
-+=C2=A0 answer.high =3D __umulh(a, b);<br>
-+=C2=A0 answer.low =3D a * b;<br>
-+#elif defined(FASTFLOAT_32BIT) ||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 (defined(_WIN64) &amp;&amp; !defined(__clang__) &amp;&amp; =
!defined(_M_ARM64))<br>
-+=C2=A0 answer.low =3D _umul128(a, b, &amp;answer.high); // _umul128 not a=
vailable on ARM64<br>
-+#elif defined(FASTFLOAT_64BIT) &amp;&amp; defined(__SIZEOF_INT128__)<br>
-+=C2=A0 __uint128_t r =3D ((__uint128_t)a) * b;<br>
-+=C2=A0 answer.low =3D uint64_t(r);<br>
-+=C2=A0 answer.high =3D uint64_t(r &gt;&gt; 64);<br>
-+#else<br>
-+=C2=A0 answer.low =3D umul128_generic(a, b, &amp;answer.high);<br>
-+#endif<br>
-+=C2=A0 return answer;<br>
-+}<br>
-+<br>
-+struct adjusted_mantissa {<br>
-+=C2=A0 uint64_t mantissa{0};<br>
-+=C2=A0 int32_t power2{0}; // a negative value indicates an invalid result=
<br>
-+=C2=A0 adjusted_mantissa() =3D default;<br>
-+=C2=A0 constexpr bool operator=3D=3D(const adjusted_mantissa &amp;o) cons=
t {<br>
-+=C2=A0 =C2=A0 return mantissa =3D=3D o.mantissa &amp;&amp; power2 =3D=3D =
o.power2;<br>
-+=C2=A0 }<br>
-+=C2=A0 constexpr bool operator!=3D(const adjusted_mantissa &amp;o) const =
{<br>
-+=C2=A0 =C2=A0 return mantissa !=3D o.mantissa || power2 !=3D o.power2;<br=
>
-+=C2=A0 }<br>
-+};<br>
-+<br>
-+// Bias so we can get the real exponent with an invalid adjusted_mantissa=
.<br>
-+constexpr static int32_t invalid_am_bias =3D -0x8000;<br>
-+<br>
-+// used for binary_format_lookup_tables&lt;T&gt;::max_mantissa<br>
-+constexpr uint64_t constant_55555 =3D 5 * 5 * 5 * 5 * 5;<br>
-+<br>
-+template &lt;typename T, typename U =3D void&gt; struct binary_format_loo=
kup_tables;<br>
-+<br>
-+template &lt;typename T&gt; struct binary_format : binary_format_lookup_t=
ables&lt;T&gt; {<br>
-+=C2=A0 using equiv_uint =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 typename std::conditional&lt;sizeof(T) =3D=3D 4, uin=
t32_t, uint64_t&gt;::type;<br>
-+<br>
-+=C2=A0 static inline constexpr int mantissa_explicit_bits();<br>
-+=C2=A0 static inline constexpr int minimum_exponent();<br>
-+=C2=A0 static inline constexpr int infinite_power();<br>
-+=C2=A0 static inline constexpr int sign_index();<br>
-+=C2=A0 static inline constexpr int<br>
-+=C2=A0 min_exponent_fast_path(); // used when fegetround() =3D=3D FE_TONE=
AREST<br>
-+=C2=A0 static inline constexpr int max_exponent_fast_path();<br>
-+=C2=A0 static inline constexpr int max_exponent_round_to_even();<br>
-+=C2=A0 static inline constexpr int min_exponent_round_to_even();<br>
-+=C2=A0 static inline constexpr uint64_t max_mantissa_fast_path(int64_t po=
wer);<br>
-+=C2=A0 static inline constexpr uint64_t<br>
-+=C2=A0 max_mantissa_fast_path(); // used when fegetround() =3D=3D FE_TONE=
AREST<br>
-+=C2=A0 static inline constexpr int largest_power_of_ten();<br>
-+=C2=A0 static inline constexpr int smallest_power_of_ten();<br>
-+=C2=A0 static inline constexpr T exact_power_of_ten(int64_t power);<br>
-+=C2=A0 static inline constexpr size_t max_digits();<br>
-+=C2=A0 static inline constexpr equiv_uint exponent_mask();<br>
-+=C2=A0 static inline constexpr equiv_uint mantissa_mask();<br>
-+=C2=A0 static inline constexpr equiv_uint hidden_bit_mask();<br>
-+};<br>
-+<br>
-+template &lt;typename U&gt; struct binary_format_lookup_tables&lt;double,=
 U&gt; {<br>
-+=C2=A0 static constexpr double powers_of_ten[] =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 1e0,=C2=A0 1e1,=C2=A0 1e2,=C2=A0 1e3,=C2=A0 1e4,=C2=
=A0 1e5,=C2=A0 1e6,=C2=A0 1e7,=C2=A0 1e8,=C2=A0 1e9,=C2=A0 1e10, 1e11,<br>
-+=C2=A0 =C2=A0 =C2=A0 1e12, 1e13, 1e14, 1e15, 1e16, 1e17, 1e18, 1e19, 1e20=
, 1e21, 1e22};<br>
-+<br>
-+=C2=A0 // Largest integer value v so that (5**index * v) &lt;=3D 1&lt;&lt=
;53.<br>
-+=C2=A0 // 0x20000000000000 =3D=3D 1 &lt;&lt; 53<br>
-+=C2=A0 static constexpr uint64_t max_mantissa[] =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / 5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (5 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (5 * 5 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * 5 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * 5 * 5 * 5 * 5),=
<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * constant_55555)=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * constant_55555 =
* 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * constant_55555 =
* 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * constant_55555 =
* 5 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * constant_55555 =
* constant_55555),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * constant_55555 =
* constant_55555 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 /<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (constant_55555 * constant_55555 * con=
stant_55555 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 /<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (constant_55555 * constant_55555 * con=
stant_55555 * 5 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 /<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (constant_55555 * constant_55555 * con=
stant_55555 * 5 * 5 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 /<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (constant_55555 * constant_55555 * con=
stant_55555 * constant_55555),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * constant_55555 =
* constant_55555 *<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 constant_55555 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * constant_55555 =
* constant_55555 *<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 constant_55555 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * constant_55555 =
* constant_55555 *<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 constant_55555 * 5 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x20000000000000 / (constant_55555 * constant_55555 =
* constant_55555 *<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 constant_55555 * 5 * 5 * 5 * 5)};<br>
-+};<br>
-+<br>
-+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE<br>
-+<br>
-+template &lt;typename U&gt;<br>
-+constexpr double binary_format_lookup_tables&lt;double, U&gt;::powers_of_=
ten[];<br>
-+<br>
-+template &lt;typename U&gt;<br>
-+constexpr uint64_t binary_format_lookup_tables&lt;double, U&gt;::max_mant=
issa[];<br>
-+<br>
-+#endif<br>
-+<br>
-+template &lt;typename U&gt; struct binary_format_lookup_tables&lt;float, =
U&gt; {<br>
-+=C2=A0 static constexpr float powers_of_ten[] =3D {1e0f, 1e1f, 1e2f, 1e3f=
, 1e4f, 1e5f,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1e6f, 1e7f, 1e8f, 1e9f, 1e10f};<br>
-+<br>
-+=C2=A0 // Largest integer value v so that (5**index * v) &lt;=3D 1&lt;&lt=
;24.<br>
-+=C2=A0 // 0x1000000 =3D=3D 1&lt;&lt;24<br>
-+=C2=A0 static constexpr uint64_t max_mantissa[] =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000 / 5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000 / (5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000 / (5 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000 / (5 * 5 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000 / (constant_55555),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000 / (constant_55555 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000 / (constant_55555 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000 / (constant_55555 * 5 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000 / (constant_55555 * 5 * 5 * 5 * 5),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000 / (constant_55555 * constant_55555),<br>
-+=C2=A0 =C2=A0 =C2=A0 0x1000000 / (constant_55555 * constant_55555 * 5)};<=
br>
-+};<br>
-+<br>
-+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE<br>
-+<br>
-+template &lt;typename U&gt;<br>
-+constexpr float binary_format_lookup_tables&lt;float, U&gt;::powers_of_te=
n[];<br>
-+<br>
-+template &lt;typename U&gt;<br>
-+constexpr uint64_t binary_format_lookup_tables&lt;float, U&gt;::max_manti=
ssa[];<br>
-+<br>
-+#endif<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr int binary_format&lt;double&gt;::min_exponent_fast_path(=
) {<br>
-+#if (FLT_EVAL_METHOD !=3D 1) &amp;&amp; (FLT_EVAL_METHOD !=3D 0)<br>
-+=C2=A0 return 0;<br>
-+#else<br>
-+=C2=A0 return -22;<br>
-+#endif<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr int binary_format&lt;float&gt;::min_exponent_fast_path()=
 {<br>
-+#if (FLT_EVAL_METHOD !=3D 1) &amp;&amp; (FLT_EVAL_METHOD !=3D 0)<br>
-+=C2=A0 return 0;<br>
-+#else<br>
-+=C2=A0 return -10;<br>
-+#endif<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr int binary_format&lt;double&gt;::mantissa_explicit_bits(=
) {<br>
-+=C2=A0 return 52;<br>
-+}<br>
-+template &lt;&gt;<br>
-+inline constexpr int binary_format&lt;float&gt;::mantissa_explicit_bits()=
 {<br>
-+=C2=A0 return 23;<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr int binary_format&lt;double&gt;::max_exponent_round_to_e=
ven() {<br>
-+=C2=A0 return 23;<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr int binary_format&lt;float&gt;::max_exponent_round_to_ev=
en() {<br>
-+=C2=A0 return 10;<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr int binary_format&lt;double&gt;::min_exponent_round_to_e=
ven() {<br>
-+=C2=A0 return -4;<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr int binary_format&lt;float&gt;::min_exponent_round_to_ev=
en() {<br>
-+=C2=A0 return -17;<br>
-+}<br>
-+<br>
-+template &lt;&gt; inline constexpr int binary_format&lt;double&gt;::minim=
um_exponent() {<br>
-+=C2=A0 return -1023;<br>
-+}<br>
-+template &lt;&gt; inline constexpr int binary_format&lt;float&gt;::minimu=
m_exponent() {<br>
-+=C2=A0 return -127;<br>
-+}<br>
-+<br>
-+template &lt;&gt; inline constexpr int binary_format&lt;double&gt;::infin=
ite_power() {<br>
-+=C2=A0 return 0x7FF;<br>
-+}<br>
-+template &lt;&gt; inline constexpr int binary_format&lt;float&gt;::infini=
te_power() {<br>
-+=C2=A0 return 0xFF;<br>
-+}<br>
-+<br>
-+template &lt;&gt; inline constexpr int binary_format&lt;double&gt;::sign_=
index() {<br>
-+=C2=A0 return 63;<br>
-+}<br>
-+template &lt;&gt; inline constexpr int binary_format&lt;float&gt;::sign_i=
ndex() {<br>
-+=C2=A0 return 31;<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr int binary_format&lt;double&gt;::max_exponent_fast_path(=
) {<br>
-+=C2=A0 return 22;<br>
-+}<br>
-+template &lt;&gt;<br>
-+inline constexpr int binary_format&lt;float&gt;::max_exponent_fast_path()=
 {<br>
-+=C2=A0 return 10;<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr uint64_t binary_format&lt;double&gt;::max_mantissa_fast_=
path() {<br>
-+=C2=A0 return uint64_t(2) &lt;&lt; mantissa_explicit_bits();<br>
-+}<br>
-+template &lt;&gt;<br>
-+inline constexpr uint64_t<br>
-+binary_format&lt;double&gt;::max_mantissa_fast_path(int64_t power) {<br>
-+=C2=A0 // caller is responsible to ensure that<br>
-+=C2=A0 // power &gt;=3D 0 &amp;&amp; power &lt;=3D 22<br>
-+=C2=A0 //<br>
-+=C2=A0 // Work around clang bug <a href=3D"https://godbolt.org/z/zedh7rrh=
c" rel=3D"noreferrer" target=3D"_blank">https://godbolt.org/z/zedh7rrhc</a>=
<br>
-+=C2=A0 return (void)max_mantissa[0], max_mantissa[power];<br>
-+}<br>
-+template &lt;&gt;<br>
-+inline constexpr uint64_t binary_format&lt;float&gt;::max_mantissa_fast_p=
ath() {<br>
-+=C2=A0 return uint64_t(2) &lt;&lt; mantissa_explicit_bits();<br>
-+}<br>
-+template &lt;&gt;<br>
-+inline constexpr uint64_t<br>
-+binary_format&lt;float&gt;::max_mantissa_fast_path(int64_t power) {<br>
-+=C2=A0 // caller is responsible to ensure that<br>
-+=C2=A0 // power &gt;=3D 0 &amp;&amp; power &lt;=3D 10<br>
-+=C2=A0 //<br>
-+=C2=A0 // Work around clang bug <a href=3D"https://godbolt.org/z/zedh7rrh=
c" rel=3D"noreferrer" target=3D"_blank">https://godbolt.org/z/zedh7rrhc</a>=
<br>
-+=C2=A0 return (void)max_mantissa[0], max_mantissa[power];<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr double<br>
-+binary_format&lt;double&gt;::exact_power_of_ten(int64_t power) {<br>
-+=C2=A0 // Work around clang bug <a href=3D"https://godbolt.org/z/zedh7rrh=
c" rel=3D"noreferrer" target=3D"_blank">https://godbolt.org/z/zedh7rrhc</a>=
<br>
-+=C2=A0 return (void)powers_of_ten[0], powers_of_ten[power];<br>
-+}<br>
-+template &lt;&gt;<br>
-+inline constexpr float binary_format&lt;float&gt;::exact_power_of_ten(int=
64_t power) {<br>
-+=C2=A0 // Work around clang bug <a href=3D"https://godbolt.org/z/zedh7rrh=
c" rel=3D"noreferrer" target=3D"_blank">https://godbolt.org/z/zedh7rrhc</a>=
<br>
-+=C2=A0 return (void)powers_of_ten[0], powers_of_ten[power];<br>
-+}<br>
-+<br>
-+template &lt;&gt; inline constexpr int binary_format&lt;double&gt;::large=
st_power_of_ten() {<br>
-+=C2=A0 return 308;<br>
-+}<br>
-+template &lt;&gt; inline constexpr int binary_format&lt;float&gt;::larges=
t_power_of_ten() {<br>
-+=C2=A0 return 38;<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr int binary_format&lt;double&gt;::smallest_power_of_ten()=
 {<br>
-+=C2=A0 return -342;<br>
-+}<br>
-+template &lt;&gt; inline constexpr int binary_format&lt;float&gt;::smalle=
st_power_of_ten() {<br>
-+=C2=A0 return -64;<br>
-+}<br>
-+<br>
-+template &lt;&gt; inline constexpr size_t binary_format&lt;double&gt;::ma=
x_digits() {<br>
-+=C2=A0 return 769;<br>
-+}<br>
-+template &lt;&gt; inline constexpr size_t binary_format&lt;float&gt;::max=
_digits() {<br>
-+=C2=A0 return 114;<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr binary_format&lt;float&gt;::equiv_uint<br>
-+binary_format&lt;float&gt;::exponent_mask() {<br>
-+=C2=A0 return 0x7F800000;<br>
-+}<br>
-+template &lt;&gt;<br>
-+inline constexpr binary_format&lt;double&gt;::equiv_uint<br>
-+binary_format&lt;double&gt;::exponent_mask() {<br>
-+=C2=A0 return 0x7FF0000000000000;<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr binary_format&lt;float&gt;::equiv_uint<br>
-+binary_format&lt;float&gt;::mantissa_mask() {<br>
-+=C2=A0 return 0x007FFFFF;<br>
-+}<br>
-+template &lt;&gt;<br>
-+inline constexpr binary_format&lt;double&gt;::equiv_uint<br>
-+binary_format&lt;double&gt;::mantissa_mask() {<br>
-+=C2=A0 return 0x000FFFFFFFFFFFFF;<br>
-+}<br>
-+<br>
-+template &lt;&gt;<br>
-+inline constexpr binary_format&lt;float&gt;::equiv_uint<br>
-+binary_format&lt;float&gt;::hidden_bit_mask() {<br>
-+=C2=A0 return 0x00800000;<br>
-+}<br>
-+template &lt;&gt;<br>
-+inline constexpr binary_format&lt;double&gt;::equiv_uint<br>
-+binary_format&lt;double&gt;::hidden_bit_mask() {<br>
-+=C2=A0 return 0x0010000000000000;<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void<br>
-+to_float(bool negative, adjusted_mantissa am, T &amp;value) {<br>
-+=C2=A0 using fastfloat_uint =3D typename binary_format&lt;T&gt;::equiv_ui=
nt;<br>
-+=C2=A0 fastfloat_uint word =3D (fastfloat_uint)am.mantissa;<br>
-+=C2=A0 word |=3D fastfloat_uint(am.power2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; binary_format&lt;T&gt;::manti=
ssa_explicit_bits();<br>
-+=C2=A0 word |=3D fastfloat_uint(negative) &lt;&lt; binary_format&lt;T&gt;=
::sign_index();<br>
-+#if FASTFLOAT_HAS_BIT_CAST<br>
-+=C2=A0 value =3D std::bit_cast&lt;T&gt;(word);<br>
-+#else<br>
-+=C2=A0 ::memcpy(&amp;value, &amp;word, sizeof(T));<br>
-+#endif<br>
-+}<br>
-+<br>
-+#ifdef FASTFLOAT_SKIP_WHITE_SPACE // disabled by default<br>
-+template &lt;typename =3D void&gt; struct space_lut {<br>
-+=C2=A0 static constexpr bool value[] =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};<br>
-+};<br>
-+<br>
-+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE<br>
-+<br>
-+template &lt;typename T&gt; constexpr bool space_lut&lt;T&gt;::value[];<b=
r>
-+<br>
-+#endif<br>
-+<br>
-+inline constexpr bool is_space(uint8_t c) { return space_lut&lt;&gt;::val=
ue[c]; }<br>
-+#endif<br>
-+<br>
-+template &lt;typename UC&gt; static constexpr uint64_t int_cmp_zeros() {<=
br>
-+=C2=A0 static_assert((sizeof(UC) =3D=3D 1) || (sizeof(UC) =3D=3D 2) || (s=
izeof(UC) =3D=3D 4),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unsupported=
 character size&quot;);<br>
-+=C2=A0 return (sizeof(UC) =3D=3D 1) ? 0x3030303030303030<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: (sizeof(UC) =3D=3D 2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? (uint64_t(UC(&#39;0&#39=
;)) &lt;&lt; 48 | uint64_t(UC(&#39;0&#39;)) &lt;&lt; 32 |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t(UC(&#39;=
0&#39;)) &lt;&lt; 16 | UC(&#39;0&#39;))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: (uint64_t(UC(&#39;0&#39=
;)) &lt;&lt; 32 | UC(&#39;0&#39;));<br>
-+}<br>
-+template &lt;typename UC&gt; static constexpr int int_cmp_len() {<br>
-+=C2=A0 return sizeof(uint64_t) / sizeof(UC);<br>
-+}<br>
-+template &lt;typename UC&gt; static constexpr UC const *str_const_nan() {=
<br>
-+=C2=A0 return nullptr;<br>
-+}<br>
-+template &lt;&gt; constexpr char const *str_const_nan&lt;char&gt;() { ret=
urn &quot;nan&quot;; }<br>
-+template &lt;&gt; constexpr wchar_t const *str_const_nan&lt;wchar_t&gt;()=
 { return L&quot;nan&quot;; }<br>
-+template &lt;&gt; constexpr char16_t const *str_const_nan&lt;char16_t&gt;=
() {<br>
-+=C2=A0 return u&quot;nan&quot;;<br>
-+}<br>
-+template &lt;&gt; constexpr char32_t const *str_const_nan&lt;char32_t&gt;=
() {<br>
-+=C2=A0 return U&quot;nan&quot;;<br>
-+}<br>
-+template &lt;typename UC&gt; static constexpr UC const *str_const_inf() {=
<br>
-+=C2=A0 return nullptr;<br>
-+}<br>
-+template &lt;&gt; constexpr char const *str_const_inf&lt;char&gt;() { ret=
urn &quot;infinity&quot;; }<br>
-+template &lt;&gt; constexpr wchar_t const *str_const_inf&lt;wchar_t&gt;()=
 {<br>
-+=C2=A0 return L&quot;infinity&quot;;<br>
-+}<br>
-+template &lt;&gt; constexpr char16_t const *str_const_inf&lt;char16_t&gt;=
() {<br>
-+=C2=A0 return u&quot;infinity&quot;;<br>
-+}<br>
-+template &lt;&gt; constexpr char32_t const *str_const_inf&lt;char32_t&gt;=
() {<br>
-+=C2=A0 return U&quot;infinity&quot;;<br>
-+}<br>
-+<br>
-+template &lt;typename =3D void&gt; struct int_luts {<br>
-+=C2=A0 static constexpr uint8_t chdigit[] =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 25=
5, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 25=
5, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 25=
5, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 0,=C2=A0 =C2=A01,=C2=A0 =C2=A02,=C2=
=A0 =C2=A03,=C2=A0 =C2=A04,=C2=A0 =C2=A05,=C2=A0 =C2=A06,=C2=A0 =C2=A07,=C2=
=A0 =C2=A08,=C2=A0 =C2=A09,=C2=A0 =C2=A0255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 10,=C2=A0 11,=C2=A0 12,=C2=
=A0 13,=C2=A0 14,=C2=A0 15,=C2=A0 16,=C2=A0 17,=C2=A0 18,=C2=A0 19,<br>
-+=C2=A0 =C2=A0 =C2=A0 20,=C2=A0 21,=C2=A0 22,=C2=A0 23,=C2=A0 24,=C2=A0 25=
,=C2=A0 26,=C2=A0 27,=C2=A0 28,=C2=A0 29,=C2=A0 30,=C2=A0 31,=C2=A0 32,=C2=
=A0 33,=C2=A0 34,<br>
-+=C2=A0 =C2=A0 =C2=A0 35,=C2=A0 255, 255, 255, 255, 255, 255, 10,=C2=A0 11=
,=C2=A0 12,=C2=A0 13,=C2=A0 14,=C2=A0 15,=C2=A0 16,=C2=A0 17,<br>
-+=C2=A0 =C2=A0 =C2=A0 18,=C2=A0 19,=C2=A0 20,=C2=A0 21,=C2=A0 22,=C2=A0 23=
,=C2=A0 24,=C2=A0 25,=C2=A0 26,=C2=A0 27,=C2=A0 28,=C2=A0 29,=C2=A0 30,=C2=
=A0 31,=C2=A0 32,<br>
-+=C2=A0 =C2=A0 =C2=A0 33,=C2=A0 34,=C2=A0 35,=C2=A0 255, 255, 255, 255, 25=
5, 255, 255, 255, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 25=
5, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 25=
5, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 25=
5, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 25=
5, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 25=
5, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 25=
5, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 25=
5, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 25=
5, 255, 255, 255, 255,<br>
-+=C2=A0 =C2=A0 =C2=A0 255};<br>
-+<br>
-+=C2=A0 static constexpr size_t maxdigits_u64[] =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 64, 41, 32, 28, 25, 23, 22, 21, 20, 19, 18, 18, 17, =
17, 16, 16, 16, 16,<br>
-+=C2=A0 =C2=A0 =C2=A0 15, 15, 15, 15, 14, 14, 14, 14, 14, 14, 14, 13, 13, =
13, 13, 13, 13};<br>
-+<br>
-+=C2=A0 static constexpr uint64_t min_safe_u64[] =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 9223372036854775808ull,=C2=A0 12157665459056928801ul=
l, 4611686018427387904,<br>
-+=C2=A0 =C2=A0 =C2=A0 7450580596923828125,=C2=A0 =C2=A0 =C2=A0473838133832=
1616896,=C2=A0 =C2=A0 =C2=A03909821048582988049,<br>
-+=C2=A0 =C2=A0 =C2=A0 9223372036854775808ull,=C2=A0 12157665459056928801ul=
l, 10000000000000000000ull,<br>
-+=C2=A0 =C2=A0 =C2=A0 5559917313492231481,=C2=A0 =C2=A0 =C2=A0221861110674=
0436992,=C2=A0 =C2=A0 =C2=A08650415919381337933,<br>
-+=C2=A0 =C2=A0 =C2=A0 2177953337809371136,=C2=A0 =C2=A0 =C2=A0656840835571=
2890625,=C2=A0 =C2=A0 =C2=A01152921504606846976,<br>
-+=C2=A0 =C2=A0 =C2=A0 2862423051509815793,=C2=A0 =C2=A0 =C2=A0674664061647=
7458432,=C2=A0 =C2=A0 =C2=A015181127029874798299ull,<br>
-+=C2=A0 =C2=A0 =C2=A0 1638400000000000000,=C2=A0 =C2=A0 =C2=A0324391993252=
1508681,=C2=A0 =C2=A0 =C2=A06221821273427820544,<br>
-+=C2=A0 =C2=A0 =C2=A0 11592836324538749809ull, 876488338465357824,=C2=A0 =
=C2=A0 =C2=A0 1490116119384765625,<br>
-+=C2=A0 =C2=A0 =C2=A0 2481152873203736576,=C2=A0 =C2=A0 =C2=A0405255515301=
8976267,=C2=A0 =C2=A0 =C2=A06502111422497947648,<br>
-+=C2=A0 =C2=A0 =C2=A0 10260628712958602189ull, 15943230000000000000ull, 78=
7662783788549761,<br>
-+=C2=A0 =C2=A0 =C2=A0 1152921504606846976,=C2=A0 =C2=A0 =C2=A0166788951495=
2984961,=C2=A0 =C2=A0 =C2=A02386420683693101056,<br>
-+=C2=A0 =C2=A0 =C2=A0 3379220508056640625,=C2=A0 =C2=A0 =C2=A0473838133832=
1616896};<br>
-+};<br>
-+<br>
-+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE<br>
-+<br>
-+template &lt;typename T&gt; constexpr uint8_t int_luts&lt;T&gt;::chdigit[=
];<br>
-+<br>
-+template &lt;typename T&gt; constexpr size_t int_luts&lt;T&gt;::maxdigits=
_u64[];<br>
-+<br>
-+template &lt;typename T&gt; constexpr uint64_t int_luts&lt;T&gt;::min_saf=
e_u64[];<br>
-+<br>
-+#endif<br>
-+<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline constexpr uint8_t ch_to_digit(UC c) {<br>
-+=C2=A0 return int_luts&lt;&gt;::chdigit[static_cast&lt;unsigned char&gt;(=
c)];<br>
-+}<br>
-+<br>
-+fastfloat_really_inline constexpr size_t max_digits_u64(int base) {<br>
-+=C2=A0 return int_luts&lt;&gt;::maxdigits_u64[base - 2];<br>
-+}<br>
-+<br>
-+// If a u64 is exactly max_digits_u64() in length, this is<br>
-+// the value below which it has definitely overflowed.<br>
-+fastfloat_really_inline constexpr uint64_t min_safe_u64(int base) {<br>
-+=C2=A0 return int_luts&lt;&gt;::min_safe_u64[base - 2];<br>
-+}<br>
-+<br>
-+} // namespace fast_float<br>
-+<br>
-+#endif<br>
-+<br>
-+<br>
-+#ifndef FASTFLOAT_FAST_FLOAT_H<br>
-+#define FASTFLOAT_FAST_FLOAT_H<br>
-+<br>
-+<br>
-+namespace fast_float {<br>
-+/**<br>
-+ * This function parses the character sequence [first,last) for a number.=
 It<br>
-+ * parses floating-point numbers expecting a locale-indepent format equiv=
alent<br>
-+ * to what is used by std::strtod in the default (&quot;C&quot;) locale. =
The resulting<br>
-+ * floating-point value is the closest floating-point values (using eithe=
r float<br>
-+ * or double), using the &quot;round to even&quot; convention for values =
that would<br>
-+ * otherwise fall right in-between two values. That is, we provide exact =
parsing<br>
-+ * according to the IEEE standard.<br>
-+ *<br>
-+ * Given a successful parse, the pointer (`ptr`) in the returned value is=
 set to<br>
-+ * point right after the parsed number, and the `value` referenced is set=
 to the<br>
-+ * parsed value. In case of error, the returned `ec` contains a represent=
ative<br>
-+ * error, otherwise the default (`std::errc()`) value is stored.<br>
-+ *<br>
-+ * The implementation does not throw and does not allocate memory (e.g., =
with<br>
-+ * `new` or `malloc`).<br>
-+ *<br>
-+ * Like the C++17 standard, the `fast_float::from_chars` functions take a=
n<br>
-+ * optional last argument of the type `fast_float::chars_format`. It is a=
 bitset<br>
-+ * value: we check whether `fmt &amp; fast_float::chars_format::fixed` an=
d `fmt &amp;<br>
-+ * fast_float::chars_format::scientific` are set to determine whether we =
allow<br>
-+ * the fixed point and scientific notation respectively. The default is<b=
r>
-+ * `fast_float::chars_format::general` which allows both `fixed` and<br>
-+ * `scientific`.<br>
-+ */<br>
-+template &lt;typename T, typename UC =3D char,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typename =3D FASTFLOAT_ENABLE_IF(is_su=
pported_float_type&lt;T&gt;())&gt;<br>
-+FASTFLOAT_CONSTEXPR20 from_chars_result_t&lt;UC&gt;<br>
-+from_chars(UC const *first, UC const *last, T &amp;value,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chars_format fmt =3D chars_forma=
t::general) noexcept;<br>
-+<br>
-+/**<br>
-+ * Like from_chars, but accepts an `options` argument to govern number pa=
rsing.<br>
-+ */<br>
-+template &lt;typename T, typename UC =3D char&gt;<br>
-+FASTFLOAT_CONSTEXPR20 from_chars_result_t&lt;UC&gt;<br>
-+from_chars_advanced(UC const *first, UC const *last, T &amp;value,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 par=
se_options_t&lt;UC&gt; options) noexcept;<br>
-+/**<br>
-+ * from_chars for integer types.<br>
-+ */<br>
-+template &lt;typename T, typename UC =3D char,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typename =3D FASTFLOAT_ENABLE_IF(!is_s=
upported_float_type&lt;T&gt;())&gt;<br>
-+FASTFLOAT_CONSTEXPR20 from_chars_result_t&lt;UC&gt;<br>
-+from_chars(UC const *first, UC const *last, T &amp;value, int base =3D 10=
) noexcept;<br>
-+<br>
-+} // namespace fast_float<br>
-+#endif // FASTFLOAT_FAST_FLOAT_H<br>
-+<br>
-+#ifndef FASTFLOAT_ASCII_NUMBER_H<br>
-+#define FASTFLOAT_ASCII_NUMBER_H<br>
-+<br>
-+#include &lt;cctype&gt;<br>
-+#include &lt;cstdint&gt;<br>
-+#include &lt;cstring&gt;<br>
-+#include &lt;iterator&gt;<br>
-+#include &lt;limits&gt;<br>
-+#include &lt;type_traits&gt;<br>
-+<br>
-+<br>
-+#ifdef FASTFLOAT_SSE2<br>
-+#include &lt;emmintrin.h&gt;<br>
-+#endif<br>
-+<br>
-+#ifdef FASTFLOAT_NEON<br>
-+#include &lt;arm_neon.h&gt;<br>
-+#endif<br>
-+<br>
-+namespace fast_float {<br>
-+<br>
-+template &lt;typename UC&gt; fastfloat_really_inline constexpr bool has_s=
imd_opt() {<br>
-+#ifdef FASTFLOAT_HAS_SIMD<br>
-+=C2=A0 return std::is_same&lt;UC, char16_t&gt;::value;<br>
-+#else<br>
-+=C2=A0 return false;<br>
-+#endif<br>
-+}<br>
-+<br>
-+// Next function can be micro-optimized, but compilers are entirely<br>
-+// able to optimize it well.<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline constexpr bool is_integer(UC c) noexcept {<br>
-+=C2=A0 return !(c &gt; UC(&#39;9&#39;) || c &lt; UC(&#39;0&#39;));<br>
-+}<br>
-+<br>
-+fastfloat_really_inline constexpr uint64_t byteswap(uint64_t val) {<br>
-+=C2=A0 return (val &amp; 0xFF00000000000000) &gt;&gt; 56 | (val &amp; 0x0=
0FF000000000000) &gt;&gt; 40 |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(val &amp; 0x0000FF0000000000) &gt;&gt;=
 24 | (val &amp; 0x000000FF00000000) &gt;&gt; 8 |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(val &amp; 0x00000000FF000000) &lt;&lt;=
 8 | (val &amp; 0x0000000000FF0000) &lt;&lt; 24 |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(val &amp; 0x000000000000FF00) &lt;&lt;=
 40 | (val &amp; 0x00000000000000FF) &lt;&lt; 56;<br>
-+}<br>
-+<br>
-+// Read 8 UC into a u64. Truncates UC if not char.<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t<br>
-+read8_to_u64(const UC *chars) {<br>
-+=C2=A0 if (cpp20_and_in_constexpr() || !std::is_same&lt;UC, char&gt;::val=
ue) {<br>
-+=C2=A0 =C2=A0 uint64_t val =3D 0;<br>
-+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; 8; ++i) {<br>
-+=C2=A0 =C2=A0 =C2=A0 val |=3D uint64_t(uint8_t(*chars)) &lt;&lt; (i * 8);=
<br>
-+=C2=A0 =C2=A0 =C2=A0 ++chars;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 return val;<br>
-+=C2=A0 }<br>
-+=C2=A0 uint64_t val;<br>
-+=C2=A0 ::memcpy(&amp;val, chars, sizeof(uint64_t));<br>
-+#if FASTFLOAT_IS_BIG_ENDIAN =3D=3D 1<br>
-+=C2=A0 // Need to read as-if the number was in little-endian order.<br>
-+=C2=A0 val =3D byteswap(val);<br>
-+#endif<br>
-+=C2=A0 return val;<br>
-+}<br>
-+<br>
-+#ifdef FASTFLOAT_SSE2<br>
-+<br>
-+fastfloat_really_inline uint64_t simd_read8_to_u64(const __m128i data) {<=
br>
-+=C2=A0 FASTFLOAT_SIMD_DISABLE_WARNINGS<br>
-+=C2=A0 const __m128i packed =3D _mm_packus_epi16(data, data);<br>
-+#ifdef FASTFLOAT_64BIT<br>
-+=C2=A0 return uint64_t(_mm_cvtsi128_si64(packed));<br>
-+#else<br>
-+=C2=A0 uint64_t value;<br>
-+=C2=A0 // Visual Studio + older versions of GCC don&#39;t support _mm_sto=
reu_si64<br>
-+=C2=A0 _mm_storel_epi64(reinterpret_cast&lt;__m128i *&gt;(&amp;value), pa=
cked);<br>
-+=C2=A0 return value;<br>
-+#endif<br>
-+=C2=A0 FASTFLOAT_SIMD_RESTORE_WARNINGS<br>
-+}<br>
-+<br>
-+fastfloat_really_inline uint64_t simd_read8_to_u64(const char16_t *chars)=
 {<br>
-+=C2=A0 FASTFLOAT_SIMD_DISABLE_WARNINGS<br>
-+=C2=A0 return simd_read8_to_u64(<br>
-+=C2=A0 =C2=A0 =C2=A0 _mm_loadu_si128(reinterpret_cast&lt;const __m128i *&=
gt;(chars)));<br>
-+=C2=A0 FASTFLOAT_SIMD_RESTORE_WARNINGS<br>
-+}<br>
-+<br>
-+#elif defined(FASTFLOAT_NEON)<br>
-+<br>
-+fastfloat_really_inline uint64_t simd_read8_to_u64(const uint16x8_t data)=
 {<br>
-+=C2=A0 FASTFLOAT_SIMD_DISABLE_WARNINGS<br>
-+=C2=A0 uint8x8_t utf8_packed =3D vmovn_u16(data);<br>
-+=C2=A0 return vget_lane_u64(vreinterpret_u64_u8(utf8_packed), 0);<br>
-+=C2=A0 FASTFLOAT_SIMD_RESTORE_WARNINGS<br>
-+}<br>
-+<br>
-+fastfloat_really_inline uint64_t simd_read8_to_u64(const char16_t *chars)=
 {<br>
-+=C2=A0 FASTFLOAT_SIMD_DISABLE_WARNINGS<br>
-+=C2=A0 return simd_read8_to_u64(<br>
-+=C2=A0 =C2=A0 =C2=A0 vld1q_u16(reinterpret_cast&lt;const uint16_t *&gt;(c=
hars)));<br>
-+=C2=A0 FASTFLOAT_SIMD_RESTORE_WARNINGS<br>
-+}<br>
-+<br>
-+#endif // FASTFLOAT_SSE2<br>
-+<br>
-+// MSVC SFINAE is broken pre-VS2017<br>
-+#if defined(_MSC_VER) &amp;&amp; _MSC_VER &lt;=3D 1900<br>
-+template &lt;typename UC&gt;<br>
-+#else<br>
-+template &lt;typename UC, FASTFLOAT_ENABLE_IF(!has_simd_opt&lt;UC&gt;()) =
=3D 0&gt;<br>
-+#endif<br>
-+// dummy for compile<br>
-+uint64_t simd_read8_to_u64(UC const *) {<br>
-+=C2=A0 return 0;<br>
-+}<br>
-+<br>
-+// credit=C2=A0 @aqrit<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 uint32_t<br>
-+parse_eight_digits_unrolled(uint64_t val) {<br>
-+=C2=A0 const uint64_t mask =3D 0x000000FF000000FF;<br>
-+=C2=A0 const uint64_t mul1 =3D 0x000F424000000064; // 100 + (1000000ULL &=
lt;&lt; 32)<br>
-+=C2=A0 const uint64_t mul2 =3D 0x0000271000000001; // 1 + (10000ULL &lt;&=
lt; 32)<br>
-+=C2=A0 val -=3D 0x3030303030303030;<br>
-+=C2=A0 val =3D (val * 10) + (val &gt;&gt; 8); // val =3D (val * 2561) &gt=
;&gt; 8;<br>
-+=C2=A0 val =3D (((val &amp; mask) * mul1) + (((val &gt;&gt; 16) &amp; mas=
k) * mul2)) &gt;&gt; 32;<br>
-+=C2=A0 return uint32_t(val);<br>
-+}<br>
-+<br>
-+// Call this if chars are definitely 8 digits.<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint32_t<br>
-+parse_eight_digits_unrolled(UC const *chars) noexcept {<br>
-+=C2=A0 if (cpp20_and_in_constexpr() || !has_simd_opt&lt;UC&gt;()) {<br>
-+=C2=A0 =C2=A0 return parse_eight_digits_unrolled(read8_to_u64(chars)); //=
 truncation okay<br>
-+=C2=A0 }<br>
-+=C2=A0 return parse_eight_digits_unrolled(simd_read8_to_u64(chars));<br>
-+}<br>
-+<br>
-+// credit @aqrit<br>
-+fastfloat_really_inline constexpr bool<br>
-+is_made_of_eight_digits_fast(uint64_t val) noexcept {<br>
-+=C2=A0 return !((((val + 0x4646464646464646) | (val - 0x3030303030303030)=
) &amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x8080808080808080));<br>
-+}<br>
-+<br>
-+#ifdef FASTFLOAT_HAS_SIMD<br>
-+<br>
-+// Call this if chars might not be 8 digits.<br>
-+// Using this style (instead of is_made_of_eight_digits_fast() then<br>
-+// parse_eight_digits_unrolled()) ensures we don&#39;t load SIMD register=
s twice.<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 bool<br>
-+simd_parse_if_eight_digits_unrolled(const char16_t *chars,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t &amp;i) noexc=
ept {<br>
-+=C2=A0 if (cpp20_and_in_constexpr()) {<br>
-+=C2=A0 =C2=A0 return false;<br>
-+=C2=A0 }<br>
-+#ifdef FASTFLOAT_SSE2<br>
-+=C2=A0 FASTFLOAT_SIMD_DISABLE_WARNINGS<br>
-+=C2=A0 const __m128i data =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 _mm_loadu_si128(reinterpret_cast&lt;const __m128i *&=
gt;(chars));<br>
-+<br>
-+=C2=A0 // (x - &#39;0&#39;) &lt;=3D 9<br>
-+=C2=A0 // <a href=3D"http://0x80.pl/articles/simd-parsing-int-sequences.h=
tml" rel=3D"noreferrer" target=3D"_blank">http://0x80.pl/articles/simd-pars=
ing-int-sequences.html</a><br>
-+=C2=A0 const __m128i t0 =3D _mm_add_epi16(data, _mm_set1_epi16(32720));<b=
r>
-+=C2=A0 const __m128i t1 =3D _mm_cmpgt_epi16(t0, _mm_set1_epi16(-32759));<=
br>
-+<br>
-+=C2=A0 if (_mm_movemask_epi8(t1) =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 i =3D i * 100000000 + parse_eight_digits_unrolled(simd_read=
8_to_u64(data));<br>
-+=C2=A0 =C2=A0 return true;<br>
-+=C2=A0 } else<br>
-+=C2=A0 =C2=A0 return false;<br>
-+=C2=A0 FASTFLOAT_SIMD_RESTORE_WARNINGS<br>
-+#elif defined(FASTFLOAT_NEON)<br>
-+=C2=A0 FASTFLOAT_SIMD_DISABLE_WARNINGS<br>
-+=C2=A0 const uint16x8_t data =3D vld1q_u16(reinterpret_cast&lt;const uint=
16_t *&gt;(chars));<br>
-+<br>
-+=C2=A0 // (x - &#39;0&#39;) &lt;=3D 9<br>
-+=C2=A0 // <a href=3D"http://0x80.pl/articles/simd-parsing-int-sequences.h=
tml" rel=3D"noreferrer" target=3D"_blank">http://0x80.pl/articles/simd-pars=
ing-int-sequences.html</a><br>
-+=C2=A0 const uint16x8_t t0 =3D vsubq_u16(data, vmovq_n_u16(&#39;0&#39;));=
<br>
-+=C2=A0 const uint16x8_t mask =3D vcltq_u16(t0, vmovq_n_u16(&#39;9&#39; - =
&#39;0&#39; + 1));<br>
-+<br>
-+=C2=A0 if (vminvq_u16(mask) =3D=3D 0xFFFF) {<br>
-+=C2=A0 =C2=A0 i =3D i * 100000000 + parse_eight_digits_unrolled(simd_read=
8_to_u64(data));<br>
-+=C2=A0 =C2=A0 return true;<br>
-+=C2=A0 } else<br>
-+=C2=A0 =C2=A0 return false;<br>
-+=C2=A0 FASTFLOAT_SIMD_RESTORE_WARNINGS<br>
-+#else<br>
-+=C2=A0 (void)chars;<br>
-+=C2=A0 (void)i;<br>
-+=C2=A0 return false;<br>
-+#endif // FASTFLOAT_SSE2<br>
-+}<br>
-+<br>
-+#endif // FASTFLOAT_HAS_SIMD<br>
-+<br>
-+// MSVC SFINAE is broken pre-VS2017<br>
-+#if defined(_MSC_VER) &amp;&amp; _MSC_VER &lt;=3D 1900<br>
-+template &lt;typename UC&gt;<br>
-+#else<br>
-+template &lt;typename UC, FASTFLOAT_ENABLE_IF(!has_simd_opt&lt;UC&gt;()) =
=3D 0&gt;<br>
-+#endif<br>
-+// dummy for compile<br>
-+bool simd_parse_if_eight_digits_unrolled(UC const *, uint64_t &amp;) {<br=
>
-+=C2=A0 return 0;<br>
-+}<br>
-+<br>
-+template &lt;typename UC, FASTFLOAT_ENABLE_IF(!std::is_same&lt;UC, char&g=
t;::value) =3D 0&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void<br>
-+loop_parse_if_eight_digits(const UC *&amp;p, const UC *const pend, uint64=
_t &amp;i) {<br>
-+=C2=A0 if (!has_simd_opt&lt;UC&gt;()) {<br>
-+=C2=A0 =C2=A0 return;<br>
-+=C2=A0 }<br>
-+=C2=A0 while ((std::distance(p, pend) &gt;=3D 8) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0simd_parse_if_eight_digits_unrolled(<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p, i)) { // in rare cases=
, this will overflow, but that&#39;s ok<br>
-+=C2=A0 =C2=A0 p +=3D 8;<br>
-+=C2=A0 }<br>
-+}<br>
-+<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void<br>
-+loop_parse_if_eight_digits(const char *&amp;p, const char *const pend,<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint64_t &amp;i) {<br>
-+=C2=A0 // optimizes better than parse_if_eight_digits_unrolled() for UC =
=3D char.<br>
-+=C2=A0 while ((std::distance(p, pend) &gt;=3D 8) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is_made_of_eight_digits_fast(read8_to_u=
64(p))) {<br>
-+=C2=A0 =C2=A0 i =3D i * 100000000 +<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_eight_digits_unrolled(read8_to_u64(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p)); // in rare cases, this wil=
l overflow, but that&#39;s ok<br>
-+=C2=A0 =C2=A0 p +=3D 8;<br>
-+=C2=A0 }<br>
-+}<br>
-+<br>
-+enum class parse_error {<br>
-+=C2=A0 no_error,<br>
-+=C2=A0 // [JSON-only] The minus sign must be followed by an integer.<br>
-+=C2=A0 missing_integer_after_sign,<br>
-+=C2=A0 // A sign must be followed by an integer or dot.<br>
-+=C2=A0 missing_integer_or_dot_after_sign,<br>
-+=C2=A0 // [JSON-only] The integer part must not have leading zeros.<br>
-+=C2=A0 leading_zeros_in_integer_part,<br>
-+=C2=A0 // [JSON-only] The integer part must have at least one digit.<br>
-+=C2=A0 no_digits_in_integer_part,<br>
-+=C2=A0 // [JSON-only] If there is a decimal point, there must be digits i=
n the<br>
-+=C2=A0 // fractional part.<br>
-+=C2=A0 no_digits_in_fractional_part,<br>
-+=C2=A0 // The mantissa must have at least one digit.<br>
-+=C2=A0 no_digits_in_mantissa,<br>
-+=C2=A0 // Scientific notation requires an exponential part.<br>
-+=C2=A0 missing_exponential_part,<br>
-+};<br>
-+<br>
-+template &lt;typename UC&gt; struct parsed_number_string_t {<br>
-+=C2=A0 int64_t exponent{0};<br>
-+=C2=A0 uint64_t mantissa{0};<br>
-+=C2=A0 UC const *lastmatch{nullptr};<br>
-+=C2=A0 bool negative{false};<br>
-+=C2=A0 bool valid{false};<br>
-+=C2=A0 bool too_many_digits{false};<br>
-+=C2=A0 // contains the range of the significant digits<br>
-+=C2=A0 span&lt;const UC&gt; integer{};=C2=A0 // non-nullable<br>
-+=C2=A0 span&lt;const UC&gt; fraction{}; // nullable<br>
-+=C2=A0 parse_error error{parse_error::no_error};<br>
-+};<br>
-+<br>
-+using byte_span =3D span&lt;const char&gt;;<br>
-+using parsed_number_string =3D parsed_number_string_t&lt;char&gt;;<br>
-+<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 parsed_number_string_t&lt;U=
C&gt;<br>
-+report_parse_error(UC const *p, parse_error error) {<br>
-+=C2=A0 parsed_number_string_t&lt;UC&gt; answer;<br>
-+=C2=A0 answer.valid =3D false;<br>
-+=C2=A0 answer.lastmatch =3D p;<br>
-+=C2=A0 answer.error =3D error;<br>
-+=C2=A0 return answer;<br>
-+}<br>
-+<br>
-+// Assuming that you use no more than 19 digits, this will<br>
-+// parse an ASCII string.<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 parsed_number_string_t&lt;U=
C&gt;<br>
-+parse_number_string(UC const *p, UC const *pend,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 par=
se_options_t&lt;UC&gt; options) noexcept {<br>
-+=C2=A0 chars_format const fmt =3D options.format;<br>
-+=C2=A0 UC const decimal_point =3D options.decimal_point;<br>
-+<br>
-+=C2=A0 parsed_number_string_t&lt;UC&gt; answer;<br>
-+=C2=A0 answer.valid =3D false;<br>
-+=C2=A0 answer.too_many_digits =3D false;<br>
-+=C2=A0 answer.negative =3D (*p =3D=3D UC(&#39;-&#39;));<br>
-+#ifdef FASTFLOAT_ALLOWS_LEADING_PLUS // disabled by default<br>
-+=C2=A0 if ((*p =3D=3D UC(&#39;-&#39;)) || (!(fmt &amp; FASTFLOAT_JSONFMT)=
 &amp;&amp; *p =3D=3D UC(&#39;+&#39;))) {<br>
-+#else<br>
-+=C2=A0 if (*p =3D=3D UC(&#39;-&#39;)) { // C++17 20.19.3.(7.1) explicitly=
 forbids &#39;+&#39; sign here<br>
-+#endif<br>
-+=C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 =C2=A0 if (p =3D=3D pend) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return report_parse_error&lt;UC&gt;(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p, parse_error::missing_integer_or_dot=
_after_sign);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 if (fmt &amp; FASTFLOAT_JSONFMT) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!is_integer(*p)) { // a sign must be followed by=
 an integer<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return report_parse_error&lt;UC&gt;(p,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_error::mi=
ssing_integer_after_sign);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!is_integer(*p) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*p !=3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0decimal_point)) { // a sign must=
 be followed by an integer or the dot<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return report_parse_error&lt;UC&gt;(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p, parse_error::missing_integer=
_or_dot_after_sign);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+=C2=A0 UC const *const start_digits =3D p;<br>
-+<br>
-+=C2=A0 uint64_t i =3D 0; // an unsigned int avoids signed overflows (whic=
h are bad)<br>
-+<br>
-+=C2=A0 while ((p !=3D pend) &amp;&amp; is_integer(*p)) {<br>
-+=C2=A0 =C2=A0 // a multiplication by 10 is cheaper than an arbitrary inte=
ger<br>
-+=C2=A0 =C2=A0 // multiplication<br>
-+=C2=A0 =C2=A0 i =3D 10 * i +<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t(*p -<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UC(&#39;0&#=
39;)); // might overflow, we will handle the overflow later<br>
-+=C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 }<br>
-+=C2=A0 UC const *const end_of_integer_part =3D p;<br>
-+=C2=A0 int64_t digit_count =3D int64_t(end_of_integer_part - start_digits=
);<br>
-+=C2=A0 answer.integer =3D span&lt;const UC&gt;(start_digits, size_t(digit=
_count));<br>
-+=C2=A0 if (fmt &amp; FASTFLOAT_JSONFMT) {<br>
-+=C2=A0 =C2=A0 // at least 1 digit in integer part, without leading zeros<=
br>
-+=C2=A0 =C2=A0 if (digit_count =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return report_parse_error&lt;UC&gt;(p, parse_error::=
no_digits_in_integer_part);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 if ((start_digits[0] =3D=3D UC(&#39;0&#39;) &amp;&amp; digi=
t_count &gt; 1)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return report_parse_error&lt;UC&gt;(start_digits,<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_error::leading_z=
eros_in_integer_part);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 int64_t exponent =3D 0;<br>
-+=C2=A0 const bool has_decimal_point =3D (p !=3D pend) &amp;&amp; (*p =3D=
=3D decimal_point);<br>
-+=C2=A0 if (has_decimal_point) {<br>
-+=C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 =C2=A0 UC const *before =3D p;<br>
-+=C2=A0 =C2=A0 // can occur at most twice without overflowing, but let it =
occur more, since<br>
-+=C2=A0 =C2=A0 // for integers with many digits, digit parsing is the prim=
ary bottleneck.<br>
-+=C2=A0 =C2=A0 loop_parse_if_eight_digits(p, pend, i);<br>
-+<br>
-+=C2=A0 =C2=A0 while ((p !=3D pend) &amp;&amp; is_integer(*p)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 uint8_t digit =3D uint8_t(*p - UC(&#39;0&#39;));<br>
-+=C2=A0 =C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 =C2=A0 =C2=A0 i =3D i * 10 + digit; // in rare cases, this will ov=
erflow, but that&#39;s ok<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 exponent =3D before - p;<br>
-+=C2=A0 =C2=A0 answer.fraction =3D span&lt;const UC&gt;(before, size_t(p -=
 before));<br>
-+=C2=A0 =C2=A0 digit_count -=3D exponent;<br>
-+=C2=A0 }<br>
-+=C2=A0 if (fmt &amp; FASTFLOAT_JSONFMT) {<br>
-+=C2=A0 =C2=A0 // at least 1 digit in fractional part<br>
-+=C2=A0 =C2=A0 if (has_decimal_point &amp;&amp; exponent =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return report_parse_error&lt;UC&gt;(p,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_error::no_digits=
_in_fractional_part);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 } else if (digit_count =3D=3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00) { // we must have enco=
untered at least one integer!<br>
-+=C2=A0 =C2=A0 return report_parse_error&lt;UC&gt;(p, parse_error::no_digi=
ts_in_mantissa);<br>
-+=C2=A0 }<br>
-+=C2=A0 int64_t exp_number =3D 0; // explicit exponential part<br>
-+=C2=A0 if (((fmt &amp; chars_format::scientific) &amp;&amp; (p !=3D pend)=
 &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0((UC(&#39;e&#39;) =3D=3D *p) || (UC(&#39;E&#39=
;) =3D=3D *p))) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 ((fmt &amp; FASTFLOAT_FORTRANFMT) &amp;&amp; (p !=3D=
 pend) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0((UC(&#39;+&#39;) =3D=3D *p) || (UC(&#39;-&#39=
;) =3D=3D *p) || (UC(&#39;d&#39;) =3D=3D *p) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (UC(&#39;D&#39;) =3D=3D *p)))) {<br>
-+=C2=A0 =C2=A0 UC const *location_of_e =3D p;<br>
-+=C2=A0 =C2=A0 if ((UC(&#39;e&#39;) =3D=3D *p) || (UC(&#39;E&#39;) =3D=3D =
*p) || (UC(&#39;d&#39;) =3D=3D *p) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (UC(&#39;D&#39;) =3D=3D *p)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 bool neg_exp =3D false;<br>
-+=C2=A0 =C2=A0 if ((p !=3D pend) &amp;&amp; (UC(&#39;-&#39;) =3D=3D *p)) {=
<br>
-+=C2=A0 =C2=A0 =C2=A0 neg_exp =3D true;<br>
-+=C2=A0 =C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 =C2=A0 } else if ((p !=3D pend) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(UC(&#39;+&#39;) =
=3D=3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p)) { // &#39;+&=
#39; on exponent is allowed by C++17 20.19.3.(7.1)<br>
-+=C2=A0 =C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 if ((p =3D=3D pend) || !is_integer(*p)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!(fmt &amp; chars_format::fixed)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 // The exponential part is invalid for scient=
ific notation, so it must<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 // be a trailing token for fixed notation. Ho=
wever, fixed notation is<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 // disabled, so report a scientific notation =
error.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return report_parse_error&lt;UC&gt;(p, parse_=
error::missing_exponential_part);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 // Otherwise, we will be ignoring the &#39;e&#39;.<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 p =3D location_of_e;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 while ((p !=3D pend) &amp;&amp; is_integer(*p)) {<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t digit =3D uint8_t(*p - UC(&#39;0&#39;=
));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (exp_number &lt; 0x10000000) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exp_number =3D 10 * exp_number + digit=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (neg_exp) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exp_number =3D -exp_number;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 exponent +=3D exp_number;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 } else {<br>
-+=C2=A0 =C2=A0 // If it scientific and not fixed, we have to bail out.<br>
-+=C2=A0 =C2=A0 if ((fmt &amp; chars_format::scientific) &amp;&amp; !(fmt &=
amp; chars_format::fixed)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return report_parse_error&lt;UC&gt;(p, parse_error::=
missing_exponential_part);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+=C2=A0 answer.lastmatch =3D p;<br>
-+=C2=A0 answer.valid =3D true;<br>
-+<br>
-+=C2=A0 // If we frequently had to deal with long strings of digits,<br>
-+=C2=A0 // we could extend our code by using a 128-bit integer instead<br>
-+=C2=A0 // of a 64-bit integer. However, this is uncommon.<br>
-+=C2=A0 //<br>
-+=C2=A0 // We can deal with up to 19 digits.<br>
-+=C2=A0 if (digit_count &gt; 19) { // this is uncommon<br>
-+=C2=A0 =C2=A0 // It is possible that the integer had an overflow.<br>
-+=C2=A0 =C2=A0 // We have to handle the case where we have 0.0000somenumbe=
r.<br>
-+=C2=A0 =C2=A0 // We need to be mindful of the case where we only have zer=
oes...<br>
-+=C2=A0 =C2=A0 // E.g., 0.000000000...000.<br>
-+=C2=A0 =C2=A0 UC const *start =3D start_digits;<br>
-+=C2=A0 =C2=A0 while ((start !=3D pend) &amp;&amp; (*start =3D=3D UC(&#39;=
0&#39;) || *start =3D=3D decimal_point)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (*start =3D=3D UC(&#39;0&#39;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 digit_count--;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 start++;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 if (digit_count &gt; 19) {<br>
-+=C2=A0 =C2=A0 =C2=A0 answer.too_many_digits =3D true;<br>
-+=C2=A0 =C2=A0 =C2=A0 // Let us start again, this time, avoiding overflows=
.<br>
-+=C2=A0 =C2=A0 =C2=A0 // We don&#39;t need to check if is_integer, since w=
e use the<br>
-+=C2=A0 =C2=A0 =C2=A0 // pre-tokenized spans from above.<br>
-+=C2=A0 =C2=A0 =C2=A0 i =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 p =3D answer.integer.ptr;<br>
-+=C2=A0 =C2=A0 =C2=A0 UC const *int_end =3D p + answer.integer.len();<br>
-+=C2=A0 =C2=A0 =C2=A0 const uint64_t minimal_nineteen_digit_integer{100000=
0000000000000};<br>
-+=C2=A0 =C2=A0 =C2=A0 while ((i &lt; minimal_nineteen_digit_integer) &amp;=
&amp; (p !=3D int_end)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D i * 10 + uint64_t(*p - UC(&#39;0&#39;))=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D minimal_nineteen_digit_integer) { // W=
e have a big integers<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exponent =3D end_of_integer_part - p + exp_nu=
mber;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else { // We have a value with a fractional compon=
ent.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D answer.fraction.ptr;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 UC const *frac_end =3D p + answer.fraction.le=
n();<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while ((i &lt; minimal_nineteen_digit_integer=
) &amp;&amp; (p !=3D frac_end)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D i * 10 + uint64_t(*p - UC(&#39;0=
&#39;));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exponent =3D answer.fraction.ptr - p + exp_nu=
mber;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 // We have now corrected both exponent and i, to a t=
runcated value<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+=C2=A0 answer.exponent =3D exponent;<br>
-+=C2=A0 answer.mantissa =3D i;<br>
-+=C2=A0 return answer;<br>
-+}<br>
-+<br>
-+template &lt;typename T, typename UC&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 from_chars_result_t&lt;UC&g=
t;<br>
-+parse_int_string(UC const *p, UC const *pend, T &amp;value, int base) {<b=
r>
-+=C2=A0 from_chars_result_t&lt;UC&gt; answer;<br>
-+<br>
-+=C2=A0 UC const *const first =3D p;<br>
-+<br>
-+=C2=A0 bool negative =3D (*p =3D=3D UC(&#39;-&#39;));<br>
-+=C2=A0 if (!std::is_signed&lt;T&gt;::value &amp;&amp; negative) {<br>
-+=C2=A0 =C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" target=3D"_=
blank">answer.ec</a> =3D std::errc::invalid_argument;<br>
-+=C2=A0 =C2=A0 answer.ptr =3D first;<br>
-+=C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 }<br>
-+#ifdef FASTFLOAT_ALLOWS_LEADING_PLUS // disabled by default<br>
-+=C2=A0 if ((*p =3D=3D UC(&#39;-&#39;)) || (*p =3D=3D UC(&#39;+&#39;))) {<=
br>
-+#else<br>
-+=C2=A0 if (*p =3D=3D UC(&#39;-&#39;)) {<br>
-+#endif<br>
-+=C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 UC const *const start_num =3D p;<br>
-+<br>
-+=C2=A0 while (p !=3D pend &amp;&amp; *p =3D=3D UC(&#39;0&#39;)) {<br>
-+=C2=A0 =C2=A0 ++p;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 const bool has_leading_zeros =3D p &gt; start_num;<br>
-+<br>
-+=C2=A0 UC const *const start_digits =3D p;<br>
-+<br>
-+=C2=A0 uint64_t i =3D 0;<br>
-+=C2=A0 if (base =3D=3D 10) {<br>
-+=C2=A0 =C2=A0 loop_parse_if_eight_digits(p, pend, i); // use SIMD if poss=
ible<br>
-+=C2=A0 }<br>
-+=C2=A0 while (p !=3D pend) {<br>
-+=C2=A0 =C2=A0 uint8_t digit =3D ch_to_digit(*p);<br>
-+=C2=A0 =C2=A0 if (digit &gt;=3D base) {<br>
-+=C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 i =3D uint64_t(base) * i + digit; // might overflow, check =
this later<br>
-+=C2=A0 =C2=A0 p++;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 size_t digit_count =3D size_t(p - start_digits);<br>
-+<br>
-+=C2=A0 if (digit_count =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 if (has_leading_zeros) {<br>
-+=C2=A0 =C2=A0 =C2=A0 value =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" targ=
et=3D"_blank">answer.ec</a> =3D std::errc();<br>
-+=C2=A0 =C2=A0 =C2=A0 answer.ptr =3D p;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" targ=
et=3D"_blank">answer.ec</a> =3D std::errc::invalid_argument;<br>
-+=C2=A0 =C2=A0 =C2=A0 answer.ptr =3D first;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 answer.ptr =3D p;<br>
-+<br>
-+=C2=A0 // check u64 overflow<br>
-+=C2=A0 size_t max_digits =3D max_digits_u64(base);<br>
-+=C2=A0 if (digit_count &gt; max_digits) {<br>
-+=C2=A0 =C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" target=3D"_=
blank">answer.ec</a> =3D std::errc::result_out_of_range;<br>
-+=C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 }<br>
-+=C2=A0 // this check can be eliminated for all other types, but they will=
 all require<br>
-+=C2=A0 // a max_digits(base) equivalent<br>
-+=C2=A0 if (digit_count =3D=3D max_digits &amp;&amp; i &lt; min_safe_u64(b=
ase)) {<br>
-+=C2=A0 =C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" target=3D"_=
blank">answer.ec</a> =3D std::errc::result_out_of_range;<br>
-+=C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // check other types overflow<br>
-+=C2=A0 if (!std::is_same&lt;T, uint64_t&gt;::value) {<br>
-+=C2=A0 =C2=A0 if (i &gt; uint64_t(std::numeric_limits&lt;T&gt;::max()) + =
uint64_t(negative)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" targ=
et=3D"_blank">answer.ec</a> =3D std::errc::result_out_of_range;<br>
-+=C2=A0 =C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 if (negative) {<br>
-+#ifdef FASTFLOAT_VISUAL_STUDIO<br>
-+#pragma warning(push)<br>
-+#pragma warning(disable : 4146)<br>
-+#endif<br>
-+=C2=A0 =C2=A0 // this weird workaround is required because:<br>
-+=C2=A0 =C2=A0 // - converting unsigned to signed when its value is greate=
r than signed max<br>
-+=C2=A0 =C2=A0 // is UB pre-C++23.<br>
-+=C2=A0 =C2=A0 // - reinterpret_casting (~i + 1) would work, but it is not=
 constexpr<br>
-+=C2=A0 =C2=A0 // this is always optimized into a neg instruction (note: T=
 is an integer<br>
-+=C2=A0 =C2=A0 // type)<br>
-+=C2=A0 =C2=A0 value =3D T(-std::numeric_limits&lt;T&gt;::max() -<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 T(i - uint64_t(std::nume=
ric_limits&lt;T&gt;::max())));<br>
-+#ifdef FASTFLOAT_VISUAL_STUDIO<br>
-+#pragma warning(pop)<br>
-+#endif<br>
-+=C2=A0 } else {<br>
-+=C2=A0 =C2=A0 value =3D T(i);<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" target=3D"_blank">=
answer.ec</a> =3D std::errc();<br>
-+=C2=A0 return answer;<br>
-+}<br>
-+<br>
-+} // namespace fast_float<br>
-+<br>
-+#endif<br>
-+<br>
-+#ifndef FASTFLOAT_FAST_TABLE_H<br>
-+#define FASTFLOAT_FAST_TABLE_H<br>
-+<br>
-+#include &lt;cstdint&gt;<br>
-+<br>
-+namespace fast_float {<br>
-+<br>
-+/**<br>
-+ * When mapping numbers from decimal to binary,<br>
-+ * we go from w * 10^q to m * 2^p but we have<br>
-+ * 10^q =3D 5^q * 2^q, so effectively<br>
-+ * we are trying to match<br>
-+ * w * 2^q * 5^q to m * 2^p. Thus the powers of two<br>
-+ * are not a concern since they can be represented<br>
-+ * exactly using the binary notation, only the powers of five<br>
-+ * affect the binary significand.<br>
-+ */<br>
-+<br>
-+/**<br>
-+ * The smallest non-zero float (binary64) is 2^-1074.<br>
-+ * We take as input numbers of the form w x 10^q where w &lt; 2^64.<br>
-+ * We have that w * 10^-343=C2=A0 &lt;=C2=A0 2^(64-344) 5^-343 &lt; 2^-10=
76.<br>
-+ * However, we have that<br>
-+ * (2^64-1) * 10^-342 =3D=C2=A0 (2^64-1) * 2^-342 * 5^-342 &gt; 2^-1074.<=
br>
-+ * Thus it is possible for a number of the form w * 10^-342 where<br>
-+ * w is a 64-bit value to be a non-zero floating-point number.<br>
-+ *********<br>
-+ * Any number of form w * 10^309 where w&gt;=3D 1 is going to be<br>
-+ * infinite in binary64 so we never need to worry about powers<br>
-+ * of 5 greater than 308.<br>
-+ */<br>
-+template &lt;class unused =3D void&gt; struct powers_template {<br>
-+<br>
-+=C2=A0 constexpr static int smallest_power_of_five =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 binary_format&lt;double&gt;::smallest_power_of_ten()=
;<br>
-+=C2=A0 constexpr static int largest_power_of_five =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 binary_format&lt;double&gt;::largest_power_of_ten();=
<br>
-+=C2=A0 constexpr static int number_of_entries =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 2 * (largest_power_of_five - smallest_power_of_five =
+ 1);<br>
-+=C2=A0 // Powers of five from 5^-342 all the way to 5^308 rounded toward =
one.<br>
-+=C2=A0 constexpr static uint64_t power_of_five_128[number_of_entries] =3D=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 0xeef453d6923bd65a, 0x113faa2906a13b3f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9558b4661b6565f8, 0x4ac7ca59a424c507,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbaaee17fa23ebf76, 0x5d79bcf00d2df649,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe95a99df8ace6f53, 0xf4d82c2c107973dc,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x91d8a02bb6c10594, 0x79071b9b8a4be869,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb64ec836a47146f9, 0x9748e2826cdee284,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe3e27a444d8d98b7, 0xfd1b1b2308169b25,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8e6d8c6ab0787f72, 0xfe30f0f5e50e20f7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb208ef855c969f4f, 0xbdbd2d335e51a935,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xde8b2b66b3bc4723, 0xad2c788035e61382,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8b16fb203055ac76, 0x4c3bcb5021afcc31,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xaddcb9e83c6b1793, 0xdf4abe242a1bbf3d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd953e8624b85dd78, 0xd71d6dad34a2af0d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x87d4713d6f33aa6b, 0x8672648c40e5ad68,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa9c98d8ccb009506, 0x680efdaf511f18c2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd43bf0effdc0ba48, 0x212bd1b2566def2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x84a57695fe98746d, 0x14bb630f7604b57,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa5ced43b7e3e9188, 0x419ea3bd35385e2d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcf42894a5dce35ea, 0x52064cac828675b9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x818995ce7aa0e1b2, 0x7343efebd1940993,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa1ebfb4219491a1f, 0x1014ebe6c5f90bf8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xca66fa129f9b60a6, 0xd41a26e077774ef6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfd00b897478238d0, 0x8920b098955522b4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9e20735e8cb16382, 0x55b46e5f5d5535b0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc5a890362fddbc62, 0xeb2189f734aa831d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf712b443bbd52b7b, 0xa5e9ec7501d523e4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9a6bb0aa55653b2d, 0x47b233c92125366e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc1069cd4eabe89f8, 0x999ec0bb696e840a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf148440a256e2c76, 0xc00670ea43ca250d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x96cd2a865764dbca, 0x380406926a5e5728,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbc807527ed3e12bc, 0xc605083704f5ecf2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xeba09271e88d976b, 0xf7864a44c633682e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x93445b8731587ea3, 0x7ab3ee6afbe0211d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb8157268fdae9e4c, 0x5960ea05bad82964,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe61acf033d1a45df, 0x6fb92487298e33bd,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8fd0c16206306bab, 0xa5d3b6d479f8e056,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb3c4f1ba87bc8696, 0x8f48a4899877186c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe0b62e2929aba83c, 0x331acdabfe94de87,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8c71dcd9ba0b4925, 0x9ff0c08b7f1d0b14,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xaf8e5410288e1b6f, 0x7ecf0ae5ee44dd9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdb71e91432b1a24a, 0xc9e82cd9f69d6150,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x892731ac9faf056e, 0xbe311c083a225cd2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xab70fe17c79ac6ca, 0x6dbd630a48aaf406,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd64d3d9db981787d, 0x92cbbccdad5b108,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x85f0468293f0eb4e, 0x25bbf56008c58ea5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa76c582338ed2621, 0xaf2af2b80af6f24e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd1476e2c07286faa, 0x1af5af660db4aee1,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x82cca4db847945ca, 0x50d98d9fc890ed4d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa37fce126597973c, 0xe50ff107bab528a0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcc5fc196fefd7d0c, 0x1e53ed49a96272c8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xff77b1fcbebcdc4f, 0x25e8e89c13bb0f7a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9faacf3df73609b1, 0x77b191618c54e9ac,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc795830d75038c1d, 0xd59df5b9ef6a2417,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf97ae3d0d2446f25, 0x4b0573286b44ad1d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9becce62836ac577, 0x4ee367f9430aec32,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc2e801fb244576d5, 0x229c41f793cda73f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf3a20279ed56d48a, 0x6b43527578c1110f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9845418c345644d6, 0x830a13896b78aaa9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbe5691ef416bd60c, 0x23cc986bc656d553,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xedec366b11c6cb8f, 0x2cbfbe86b7ec8aa8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x94b3a202eb1c3f39, 0x7bf7d71432f3d6a9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb9e08a83a5e34f07, 0xdaf5ccd93fb0cc53,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe858ad248f5c22c9, 0xd1b3400f8f9cff68,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x91376c36d99995be, 0x23100809b9c21fa1,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb58547448ffffb2d, 0xabd40a0c2832a78a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe2e69915b3fff9f9, 0x16c90c8f323f516c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8dd01fad907ffc3b, 0xae3da7d97f6792e3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb1442798f49ffb4a, 0x99cd11cfdf41779c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdd95317f31c7fa1d, 0x40405643d711d583,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8a7d3eef7f1cfc52, 0x482835ea666b2572,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xad1c8eab5ee43b66, 0xda3243650005eecf,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd863b256369d4a40, 0x90bed43e40076a82,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x873e4f75e2224e68, 0x5a7744a6e804a291,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa90de3535aaae202, 0x711515d0a205cb36,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd3515c2831559a83, 0xd5a5b44ca873e03,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8412d9991ed58091, 0xe858790afe9486c2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa5178fff668ae0b6, 0x626e974dbe39a872,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xce5d73ff402d98e3, 0xfb0a3d212dc8128f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x80fa687f881c7f8e, 0x7ce66634bc9d0b99,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa139029f6a239f72, 0x1c1fffc1ebc44e80,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc987434744ac874e, 0xa327ffb266b56220,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfbe9141915d7a922, 0x4bf1ff9f0062baa8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9d71ac8fada6c9b5, 0x6f773fc3603db4a9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc4ce17b399107c22, 0xcb550fb4384d21d3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf6019da07f549b2b, 0x7e2a53a146606a48,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x99c102844f94e0fb, 0x2eda7444cbfc426d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc0314325637a1939, 0xfa911155fefb5308,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf03d93eebc589f88, 0x793555ab7eba27ca,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x96267c7535b763b5, 0x4bc1558b2f3458de,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbbb01b9283253ca2, 0x9eb1aaedfb016f16,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xea9c227723ee8bcb, 0x465e15a979c1cadc,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x92a1958a7675175f, 0xbfacd89ec191ec9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb749faed14125d36, 0xcef980ec671f667b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe51c79a85916f484, 0x82b7e12780e7401a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8f31cc0937ae58d2, 0xd1b2ecb8b0908810,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb2fe3f0b8599ef07, 0x861fa7e6dcb4aa15,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdfbdcece67006ac9, 0x67a791e093e1d49a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8bd6a141006042bd, 0xe0c8bb2c5c6d24e0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xaecc49914078536d, 0x58fae9f773886e18,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xda7f5bf590966848, 0xaf39a475506a899e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x888f99797a5e012d, 0x6d8406c952429603,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xaab37fd7d8f58178, 0xc8e5087ba6d33b83,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd5605fcdcf32e1d6, 0xfb1e4a9a90880a64,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x855c3be0a17fcd26, 0x5cf2eea09a55067f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa6b34ad8c9dfc06f, 0xf42faa48c0ea481e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd0601d8efc57b08b, 0xf13b94daf124da26,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x823c12795db6ce57, 0x76c53d08d6b70858,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa2cb1717b52481ed, 0x54768c4b0c64ca6e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcb7ddcdda26da268, 0xa9942f5dcf7dfd09,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfe5d54150b090b02, 0xd3f93b35435d7c4c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9efa548d26e5a6e1, 0xc47bc5014a1a6daf,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc6b8e9b0709f109a, 0x359ab6419ca1091b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf867241c8cc6d4c0, 0xc30163d203c94b62,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9b407691d7fc44f8, 0x79e0de63425dcf1d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc21094364dfb5636, 0x985915fc12f542e4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf294b943e17a2bc4, 0x3e6f5b7b17b2939d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x979cf3ca6cec5b5a, 0xa705992ceecf9c42,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbd8430bd08277231, 0x50c6ff782a838353,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xece53cec4a314ebd, 0xa4f8bf5635246428,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x940f4613ae5ed136, 0x871b7795e136be99,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb913179899f68584, 0x28e2557b59846e3f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe757dd7ec07426e5, 0x331aeada2fe589cf,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9096ea6f3848984f, 0x3ff0d2c85def7621,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb4bca50b065abe63, 0xfed077a756b53a9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe1ebce4dc7f16dfb, 0xd3e8495912c62894,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8d3360f09cf6e4bd, 0x64712dd7abbbd95c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb080392cc4349dec, 0xbd8d794d96aacfb3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdca04777f541c567, 0xecf0d7a0fc5583a0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x89e42caaf9491b60, 0xf41686c49db57244,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xac5d37d5b79b6239, 0x311c2875c522ced5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd77485cb25823ac7, 0x7d633293366b828b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x86a8d39ef77164bc, 0xae5dff9c02033197,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa8530886b54dbdeb, 0xd9f57f830283fdfc,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd267caa862a12d66, 0xd072df63c324fd7b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8380dea93da4bc60, 0x4247cb9e59f71e6d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa46116538d0deb78, 0x52d9be85f074e608,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcd795be870516656, 0x67902e276c921f8b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x806bd9714632dff6, 0xba1cd8a3db53b6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa086cfcd97bf97f3, 0x80e8a40eccd228a4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc8a883c0fdaf7df0, 0x6122cd128006b2cd,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfad2a4b13d1b5d6c, 0x796b805720085f81,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9cc3a6eec6311a63, 0xcbe3303674053bb0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc3f490aa77bd60fc, 0xbedbfc4411068a9c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf4f1b4d515acb93b, 0xee92fb5515482d44,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x991711052d8bf3c5, 0x751bdd152d4d1c4a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbf5cd54678eef0b6, 0xd262d45a78a0635d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xef340a98172aace4, 0x86fb897116c87c34,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9580869f0e7aac0e, 0xd45d35e6ae3d4da0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbae0a846d2195712, 0x8974836059cca109,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe998d258869facd7, 0x2bd1a438703fc94b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x91ff83775423cc06, 0x7b6306a34627ddcf,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb67f6455292cbf08, 0x1a3bc84c17b1d542,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe41f3d6a7377eeca, 0x20caba5f1d9e4a93,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8e938662882af53e, 0x547eb47b7282ee9c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb23867fb2a35b28d, 0xe99e619a4f23aa43,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdec681f9f4c31f31, 0x6405fa00e2ec94d4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8b3c113c38f9f37e, 0xde83bc408dd3dd04,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xae0b158b4738705e, 0x9624ab50b148d445,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd98ddaee19068c76, 0x3badd624dd9b0957,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x87f8a8d4cfa417c9, 0xe54ca5d70a80e5d6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa9f6d30a038d1dbc, 0x5e9fcf4ccd211f4c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd47487cc8470652b, 0x7647c3200069671f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x84c8d4dfd2c63f3b, 0x29ecd9f40041e073,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa5fb0a17c777cf09, 0xf468107100525890,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcf79cc9db955c2cc, 0x7182148d4066eeb4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x81ac1fe293d599bf, 0xc6f14cd848405530,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa21727db38cb002f, 0xb8ada00e5a506a7c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xca9cf1d206fdc03b, 0xa6d90811f0e4851c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfd442e4688bd304a, 0x908f4a166d1da663,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9e4a9cec15763e2e, 0x9a598e4e043287fe,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc5dd44271ad3cdba, 0x40eff1e1853f29fd,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf7549530e188c128, 0xd12bee59e68ef47c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9a94dd3e8cf578b9, 0x82bb74f8301958ce,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc13a148e3032d6e7, 0xe36a52363c1faf01,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf18899b1bc3f8ca1, 0xdc44e6c3cb279ac1,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x96f5600f15a7b7e5, 0x29ab103a5ef8c0b9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbcb2b812db11a5de, 0x7415d448f6b6f0e7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xebdf661791d60f56, 0x111b495b3464ad21,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x936b9fcebb25c995, 0xcab10dd900beec34,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb84687c269ef3bfb, 0x3d5d514f40eea742,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe65829b3046b0afa, 0xcb4a5a3112a5112,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8ff71a0fe2c2e6dc, 0x47f0e785eaba72ab,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb3f4e093db73a093, 0x59ed216765690f56,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe0f218b8d25088b8, 0x306869c13ec3532c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8c974f7383725573, 0x1e414218c73a13fb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xafbd2350644eeacf, 0xe5d1929ef90898fa,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdbac6c247d62a583, 0xdf45f746b74abf39,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x894bc396ce5da772, 0x6b8bba8c328eb783,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xab9eb47c81f5114f, 0x66ea92f3f326564,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd686619ba27255a2, 0xc80a537b0efefebd,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8613fd0145877585, 0xbd06742ce95f5f36,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa798fc4196e952e7, 0x2c48113823b73704,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd17f3b51fca3a7a0, 0xf75a15862ca504c5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x82ef85133de648c4, 0x9a984d73dbe722fb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa3ab66580d5fdaf5, 0xc13e60d0d2e0ebba,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcc963fee10b7d1b3, 0x318df905079926a8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xffbbcfe994e5c61f, 0xfdf17746497f7052,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9fd561f1fd0f9bd3, 0xfeb6ea8bedefa633,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc7caba6e7c5382c8, 0xfe64a52ee96b8fc0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf9bd690a1b68637b, 0x3dfdce7aa3c673b0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9c1661a651213e2d, 0x6bea10ca65c084e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc31bfa0fe5698db8, 0x486e494fcff30a62,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf3e2f893dec3f126, 0x5a89dba3c3efccfa,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x986ddb5c6b3a76b7, 0xf89629465a75e01c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbe89523386091465, 0xf6bbb397f1135823,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xee2ba6c0678b597f, 0x746aa07ded582e2c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x94db483840b717ef, 0xa8c2a44eb4571cdc,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xba121a4650e4ddeb, 0x92f34d62616ce413,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe896a0d7e51e1566, 0x77b020baf9c81d17,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x915e2486ef32cd60, 0xace1474dc1d122e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb5b5ada8aaff80b8, 0xd819992132456ba,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe3231912d5bf60e6, 0x10e1fff697ed6c69,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8df5efabc5979c8f, 0xca8d3ffa1ef463c1,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb1736b96b6fd83b3, 0xbd308ff8a6b17cb2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xddd0467c64bce4a0, 0xac7cb3f6d05ddbde,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8aa22c0dbef60ee4, 0x6bcdf07a423aa96b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xad4ab7112eb3929d, 0x86c16c98d2c953c6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd89d64d57a607744, 0xe871c7bf077ba8b7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x87625f056c7c4a8b, 0x11471cd764ad4972,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa93af6c6c79b5d2d, 0xd598e40d3dd89bcf,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd389b47879823479, 0x4aff1d108d4ec2c3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x843610cb4bf160cb, 0xcedf722a585139ba,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa54394fe1eedb8fe, 0xc2974eb4ee658828,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xce947a3da6a9273e, 0x733d226229feea32,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x811ccc668829b887, 0x806357d5a3f525f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa163ff802a3426a8, 0xca07c2dcb0cf26f7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc9bcff6034c13052, 0xfc89b393dd02f0b5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfc2c3f3841f17c67, 0xbbac2078d443ace2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9d9ba7832936edc0, 0xd54b944b84aa4c0d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc5029163f384a931, 0xa9e795e65d4df11,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf64335bcf065d37d, 0x4d4617b5ff4a16d5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x99ea0196163fa42e, 0x504bced1bf8e4e45,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc06481fb9bcf8d39, 0xe45ec2862f71e1d6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf07da27a82c37088, 0x5d767327bb4e5a4c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x964e858c91ba2655, 0x3a6a07f8d510f86f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbbe226efb628afea, 0x890489f70a55368b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xeadab0aba3b2dbe5, 0x2b45ac74ccea842e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x92c8ae6b464fc96f, 0x3b0b8bc90012929d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb77ada0617e3bbcb, 0x9ce6ebb40173744,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe55990879ddcaabd, 0xcc420a6a101d0515,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8f57fa54c2a9eab6, 0x9fa946824a12232d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb32df8e9f3546564, 0x47939822dc96abf9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdff9772470297ebd, 0x59787e2b93bc56f7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8bfbea76c619ef36, 0x57eb4edb3c55b65a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xaefae51477a06b03, 0xede622920b6b23f1,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdab99e59958885c4, 0xe95fab368e45eced,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x88b402f7fd75539b, 0x11dbcb0218ebb414,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xaae103b5fcd2a881, 0xd652bdc29f26a119,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd59944a37c0752a2, 0x4be76d3346f0495f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x857fcae62d8493a5, 0x6f70a4400c562ddb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa6dfbd9fb8e5b88e, 0xcb4ccd500f6bb952,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd097ad07a71f26b2, 0x7e2000a41346a7a7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x825ecc24c873782f, 0x8ed400668c0c28c8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa2f67f2dfa90563b, 0x728900802f0f32fa,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcbb41ef979346bca, 0x4f2b40a03ad2ffb9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfea126b7d78186bc, 0xe2f610c84987bfa8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9f24b832e6b0f436, 0xdd9ca7d2df4d7c9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc6ede63fa05d3143, 0x91503d1c79720dbb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf8a95fcf88747d94, 0x75a44c6397ce912a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9b69dbe1b548ce7c, 0xc986afbe3ee11aba,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc24452da229b021b, 0xfbe85badce996168,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf2d56790ab41c2a2, 0xfae27299423fb9c3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x97c560ba6b0919a5, 0xdccd879fc967d41a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbdb6b8e905cb600f, 0x5400e987bbc1c920,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xed246723473e3813, 0x290123e9aab23b68,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9436c0760c86e30b, 0xf9a0b6720aaf6521,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb94470938fa89bce, 0xf808e40e8d5b3e69,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe7958cb87392c2c2, 0xb60b1d1230b20e04,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x90bd77f3483bb9b9, 0xb1c6f22b5e6f48c2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb4ecd5f01a4aa828, 0x1e38aeb6360b1af3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe2280b6c20dd5232, 0x25c6da63c38de1b0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8d590723948a535f, 0x579c487e5a38ad0e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb0af48ec79ace837, 0x2d835a9df0c6d851,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdcdb1b2798182244, 0xf8e431456cf88e65,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8a08f0f8bf0f156b, 0x1b8e9ecb641b58ff,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xac8b2d36eed2dac5, 0xe272467e3d222f3f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd7adf884aa879177, 0x5b0ed81dcc6abb0f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x86ccbb52ea94baea, 0x98e947129fc2b4e9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa87fea27a539e9a5, 0x3f2398d747b36224,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd29fe4b18e88640e, 0x8eec7f0d19a03aad,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x83a3eeeef9153e89, 0x1953cf68300424ac,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa48ceaaab75a8e2b, 0x5fa8c3423c052dd7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcdb02555653131b6, 0x3792f412cb06794d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x808e17555f3ebf11, 0xe2bbd88bbee40bd0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa0b19d2ab70e6ed6, 0x5b6aceaeae9d0ec4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc8de047564d20a8b, 0xf245825a5a445275,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfb158592be068d2e, 0xeed6e2f0f0d56712,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9ced737bb6c4183d, 0x55464dd69685606b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc428d05aa4751e4c, 0xaa97e14c3c26b886,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf53304714d9265df, 0xd53dd99f4b3066a8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x993fe2c6d07b7fab, 0xe546a8038efe4029,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbf8fdb78849a5f96, 0xde98520472bdd033,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xef73d256a5c0f77c, 0x963e66858f6d4440,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x95a8637627989aad, 0xdde7001379a44aa8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbb127c53b17ec159, 0x5560c018580d5d52,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe9d71b689dde71af, 0xaab8f01e6e10b4a6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9226712162ab070d, 0xcab3961304ca70e8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb6b00d69bb55c8d1, 0x3d607b97c5fd0d22,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe45c10c42a2b3b05, 0x8cb89a7db77c506a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8eb98a7a9a5b04e3, 0x77f3608e92adb242,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb267ed1940f1c61c, 0x55f038b237591ed3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdf01e85f912e37a3, 0x6b6c46dec52f6688,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8b61313bbabce2c6, 0x2323ac4b3b3da015,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xae397d8aa96c1b77, 0xabec975e0a0d081a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd9c7dced53c72255, 0x96e7bd358c904a21,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x881cea14545c7575, 0x7e50d64177da2e54,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xaa242499697392d2, 0xdde50bd1d5d0b9e9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd4ad2dbfc3d07787, 0x955e4ec64b44e864,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x84ec3c97da624ab4, 0xbd5af13bef0b113e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa6274bbdd0fadd61, 0xecb1ad8aeacdd58e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcfb11ead453994ba, 0x67de18eda5814af2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x81ceb32c4b43fcf4, 0x80eacf948770ced7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa2425ff75e14fc31, 0xa1258379a94d028d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcad2f7f5359a3b3e, 0x96ee45813a04330,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfd87b5f28300ca0d, 0x8bca9d6e188853fc,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9e74d1b791e07e48, 0x775ea264cf55347e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc612062576589dda, 0x95364afe032a819e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf79687aed3eec551, 0x3a83ddbd83f52205,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9abe14cd44753b52, 0xc4926a9672793543,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc16d9a0095928a27, 0x75b7053c0f178294,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf1c90080baf72cb1, 0x5324c68b12dd6339,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x971da05074da7bee, 0xd3f6fc16ebca5e04,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbce5086492111aea, 0x88f4bb1ca6bcf585,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xec1e4a7db69561a5, 0x2b31e9e3d06c32e6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9392ee8e921d5d07, 0x3aff322e62439fd0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb877aa3236a4b449, 0x9befeb9fad487c3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe69594bec44de15b, 0x4c2ebe687989a9b4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x901d7cf73ab0acd9, 0xf9d37014bf60a11,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb424dc35095cd80f, 0x538484c19ef38c95,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe12e13424bb40e13, 0x2865a5f206b06fba,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8cbccc096f5088cb, 0xf93f87b7442e45d4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xafebff0bcb24aafe, 0xf78f69a51539d749,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdbe6fecebdedd5be, 0xb573440e5a884d1c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x89705f4136b4a597, 0x31680a88f8953031,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xabcc77118461cefc, 0xfdc20d2b36ba7c3e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd6bf94d5e57a42bc, 0x3d32907604691b4d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8637bd05af6c69b5, 0xa63f9a49c2c1b110,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa7c5ac471b478423, 0xfcf80dc33721d54,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd1b71758e219652b, 0xd3c36113404ea4a9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x83126e978d4fdf3b, 0x645a1cac083126ea,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa3d70a3d70a3d70a, 0x3d70a3d70a3d70a4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcccccccccccccccc, 0xcccccccccccccccd,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8000000000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa000000000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc800000000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfa00000000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9c40000000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc350000000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf424000000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9896800000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbebc200000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xee6b280000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9502f90000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xba43b74000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe8d4a51000000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9184e72a00000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb5e620f480000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe35fa931a0000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8e1bc9bf04000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb1a2bc2ec5000000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xde0b6b3a76400000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8ac7230489e80000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xad78ebc5ac620000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd8d726b7177a8000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x878678326eac9000, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa968163f0a57b400, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd3c21bcecceda100, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x84595161401484a0, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa56fa5b99019a5c8, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcecb8f27f4200f3a, 0x0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x813f3978f8940984, 0x4000000000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa18f07d736b90be5, 0x5000000000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc9f2c9cd04674ede, 0xa400000000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfc6f7c4045812296, 0x4d00000000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9dc5ada82b70b59d, 0xf020000000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc5371912364ce305, 0x6c28000000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf684df56c3e01bc6, 0xc732000000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9a130b963a6c115c, 0x3c7f400000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc097ce7bc90715b3, 0x4b9f100000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf0bdc21abb48db20, 0x1e86d40000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x96769950b50d88f4, 0x1314448000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbc143fa4e250eb31, 0x17d955a000000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xeb194f8e1ae525fd, 0x5dcfab0800000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x92efd1b8d0cf37be, 0x5aa1cae500000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb7abc627050305ad, 0xf14a3d9e40000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe596b7b0c643c719, 0x6d9ccd05d0000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8f7e32ce7bea5c6f, 0xe4820023a2000000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb35dbf821ae4f38b, 0xdda2802c8a800000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe0352f62a19e306e, 0xd50b2037ad200000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8c213d9da502de45, 0x4526f422cc340000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xaf298d050e4395d6, 0x9670b12b7f410000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdaf3f04651d47b4c, 0x3c0cdd765f114000,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x88d8762bf324cd0f, 0xa5880a69fb6ac800,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xab0e93b6efee0053, 0x8eea0d047a457a00,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd5d238a4abe98068, 0x72a4904598d6d880,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x85a36366eb71f041, 0x47a6da2b7f864750,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa70c3c40a64e6c51, 0x999090b65f67d924,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd0cf4b50cfe20765, 0xfff4b4e3f741cf6d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x82818f1281ed449f, 0xbff8f10e7a8921a4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa321f2d7226895c7, 0xaff72d52192b6a0d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcbea6f8ceb02bb39, 0x9bf4f8a69f764490,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfee50b7025c36a08, 0x2f236d04753d5b4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9f4f2726179a2245, 0x1d762422c946590,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc722f0ef9d80aad6, 0x424d3ad2b7b97ef5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf8ebad2b84e0d58b, 0xd2e0898765a7deb2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9b934c3b330c8577, 0x63cc55f49f88eb2f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc2781f49ffcfa6d5, 0x3cbf6b71c76b25fb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf316271c7fc3908a, 0x8bef464e3945ef7a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x97edd871cfda3a56, 0x97758bf0e3cbb5ac,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbde94e8e43d0c8ec, 0x3d52eeed1cbea317,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xed63a231d4c4fb27, 0x4ca7aaa863ee4bdd,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x945e455f24fb1cf8, 0x8fe8caa93e74ef6a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb975d6b6ee39e436, 0xb3e2fd538e122b44,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe7d34c64a9c85d44, 0x60dbbca87196b616,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x90e40fbeea1d3a4a, 0xbc8955e946fe31cd,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb51d13aea4a488dd, 0x6babab6398bdbe41,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe264589a4dcdab14, 0xc696963c7eed2dd1,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8d7eb76070a08aec, 0xfc1e1de5cf543ca2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb0de65388cc8ada8, 0x3b25a55f43294bcb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdd15fe86affad912, 0x49ef0eb713f39ebe,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8a2dbf142dfcc7ab, 0x6e3569326c784337,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xacb92ed9397bf996, 0x49c2c37f07965404,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd7e77a8f87daf7fb, 0xdc33745ec97be906,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x86f0ac99b4e8dafd, 0x69a028bb3ded71a3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa8acd7c0222311bc, 0xc40832ea0d68ce0c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd2d80db02aabd62b, 0xf50a3fa490c30190,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x83c7088e1aab65db, 0x792667c6da79e0fa,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa4b8cab1a1563f52, 0x577001b891185938,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcde6fd5e09abcf26, 0xed4c0226b55e6f86,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x80b05e5ac60b6178, 0x544f8158315b05b4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa0dc75f1778e39d6, 0x696361ae3db1c721,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc913936dd571c84c, 0x3bc3a19cd1e38e9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfb5878494ace3a5f, 0x4ab48a04065c723,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9d174b2dcec0e47b, 0x62eb0d64283f9c76,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc45d1df942711d9a, 0x3ba5d0bd324f8394,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf5746577930d6500, 0xca8f44ec7ee36479,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9968bf6abbe85f20, 0x7e998b13cf4e1ecb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbfc2ef456ae276e8, 0x9e3fedd8c321a67e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xefb3ab16c59b14a2, 0xc5cfe94ef3ea101e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x95d04aee3b80ece5, 0xbba1f1d158724a12,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbb445da9ca61281f, 0x2a8a6e45ae8edc97,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xea1575143cf97226, 0xf52d09d71a3293bd,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x924d692ca61be758, 0x593c2626705f9c56,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb6e0c377cfa2e12e, 0x6f8b2fb00c77836c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe498f455c38b997a, 0xb6dfb9c0f956447,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8edf98b59a373fec, 0x4724bd4189bd5eac,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb2977ee300c50fe7, 0x58edec91ec2cb657,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdf3d5e9bc0f653e1, 0x2f2967b66737e3ed,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8b865b215899f46c, 0xbd79e0d20082ee74,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xae67f1e9aec07187, 0xecd8590680a3aa11,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xda01ee641a708de9, 0xe80e6f4820cc9495,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x884134fe908658b2, 0x3109058d147fdcdd,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xaa51823e34a7eede, 0xbd4b46f0599fd415,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd4e5e2cdc1d1ea96, 0x6c9e18ac7007c91a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x850fadc09923329e, 0x3e2cf6bc604ddb0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa6539930bf6bff45, 0x84db8346b786151c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcfe87f7cef46ff16, 0xe612641865679a63,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x81f14fae158c5f6e, 0x4fcb7e8f3f60c07e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa26da3999aef7749, 0xe3be5e330f38f09d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcb090c8001ab551c, 0x5cadf5bfd3072cc5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfdcb4fa002162a63, 0x73d9732fc7c8f7f6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9e9f11c4014dda7e, 0x2867e7fddcdd9afa,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc646d63501a1511d, 0xb281e1fd541501b8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf7d88bc24209a565, 0x1f225a7ca91a4226,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9ae757596946075f, 0x3375788de9b06958,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc1a12d2fc3978937, 0x52d6b1641c83ae,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf209787bb47d6b84, 0xc0678c5dbd23a49a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9745eb4d50ce6332, 0xf840b7ba963646e0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbd176620a501fbff, 0xb650e5a93bc3d898,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xec5d3fa8ce427aff, 0xa3e51f138ab4cebe,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x93ba47c980e98cdf, 0xc66f336c36b10137,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb8a8d9bbe123f017, 0xb80b0047445d4184,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe6d3102ad96cec1d, 0xa60dc059157491e5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9043ea1ac7e41392, 0x87c89837ad68db2f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb454e4a179dd1877, 0x29babe4598c311fb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe16a1dc9d8545e94, 0xf4296dd6fef3d67a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8ce2529e2734bb1d, 0x1899e4a65f58660c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb01ae745b101e9e4, 0x5ec05dcff72e7f8f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdc21a1171d42645d, 0x76707543f4fa1f73,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x899504ae72497eba, 0x6a06494a791c53a8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xabfa45da0edbde69, 0x487db9d17636892,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd6f8d7509292d603, 0x45a9d2845d3c42b6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x865b86925b9bc5c2, 0xb8a2392ba45a9b2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa7f26836f282b732, 0x8e6cac7768d7141e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd1ef0244af2364ff, 0x3207d795430cd926,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8335616aed761f1f, 0x7f44e6bd49e807b8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa402b9c5a8d3a6e7, 0x5f16206c9c6209a6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcd036837130890a1, 0x36dba887c37a8c0f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x802221226be55a64, 0xc2494954da2c9789,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa02aa96b06deb0fd, 0xf2db9baa10b7bd6c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc83553c5c8965d3d, 0x6f92829494e5acc7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfa42a8b73abbf48c, 0xcb772339ba1f17f9,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9c69a97284b578d7, 0xff2a760414536efb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc38413cf25e2d70d, 0xfef5138519684aba,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf46518c2ef5b8cd1, 0x7eb258665fc25d69,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x98bf2f79d5993802, 0xef2f773ffbd97a61,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbeeefb584aff8603, 0xaafb550ffacfd8fa,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xeeaaba2e5dbf6784, 0x95ba2a53f983cf38,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x952ab45cfa97a0b2, 0xdd945a747bf26183,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xba756174393d88df, 0x94f971119aeef9e4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe912b9d1478ceb17, 0x7a37cd5601aab85d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x91abb422ccb812ee, 0xac62e055c10ab33a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb616a12b7fe617aa, 0x577b986b314d6009,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe39c49765fdf9d94, 0xed5a7e85fda0b80b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8e41ade9fbebc27d, 0x14588f13be847307,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb1d219647ae6b31c, 0x596eb2d8ae258fc8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xde469fbd99a05fe3, 0x6fca5f8ed9aef3bb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8aec23d680043bee, 0x25de7bb9480d5854,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xada72ccc20054ae9, 0xaf561aa79a10ae6a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd910f7ff28069da4, 0x1b2ba1518094da04,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x87aa9aff79042286, 0x90fb44d2f05d0842,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa99541bf57452b28, 0x353a1607ac744a53,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd3fa922f2d1675f2, 0x42889b8997915ce8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x847c9b5d7c2e09b7, 0x69956135febada11,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa59bc234db398c25, 0x43fab9837e699095,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcf02b2c21207ef2e, 0x94f967e45e03f4bb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8161afb94b44f57d, 0x1d1be0eebac278f5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa1ba1ba79e1632dc, 0x6462d92a69731732,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xca28a291859bbf93, 0x7d7b8f7503cfdcfe,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfcb2cb35e702af78, 0x5cda735244c3d43e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9defbf01b061adab, 0x3a0888136afa64a7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc56baec21c7a1916, 0x88aaa1845b8fdd0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf6c69a72a3989f5b, 0x8aad549e57273d45,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9a3c2087a63f6399, 0x36ac54e2f678864b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc0cb28a98fcf3c7f, 0x84576a1bb416a7dd,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf0fdf2d3f3c30b9f, 0x656d44a2a11c51d5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x969eb7c47859e743, 0x9f644ae5a4b1b325,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbc4665b596706114, 0x873d5d9f0dde1fee,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xeb57ff22fc0c7959, 0xa90cb506d155a7ea,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9316ff75dd87cbd8, 0x9a7f12442d588f2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb7dcbf5354e9bece, 0xc11ed6d538aeb2f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe5d3ef282a242e81, 0x8f1668c8a86da5fa,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8fa475791a569d10, 0xf96e017d694487bc,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb38d92d760ec4455, 0x37c981dcc395a9ac,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe070f78d3927556a, 0x85bbe253f47b1417,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8c469ab843b89562, 0x93956d7478ccec8e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xaf58416654a6babb, 0x387ac8d1970027b2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdb2e51bfe9d0696a, 0x6997b05fcc0319e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x88fcf317f22241e2, 0x441fece3bdf81f03,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xab3c2fddeeaad25a, 0xd527e81cad7626c3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd60b3bd56a5586f1, 0x8a71e223d8d3b074,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x85c7056562757456, 0xf6872d5667844e49,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa738c6bebb12d16c, 0xb428f8ac016561db,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd106f86e69d785c7, 0xe13336d701beba52,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x82a45b450226b39c, 0xecc0024661173473,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa34d721642b06084, 0x27f002d7f95d0190,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcc20ce9bd35c78a5, 0x31ec038df7b441f4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xff290242c83396ce, 0x7e67047175a15271,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9f79a169bd203e41, 0xf0062c6e984d386,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc75809c42c684dd1, 0x52c07b78a3e60868,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf92e0c3537826145, 0xa7709a56ccdf8a82,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9bbcc7a142b17ccb, 0x88a66076400bb691,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc2abf989935ddbfe, 0x6acff893d00ea435,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf356f7ebf83552fe, 0x583f6b8c4124d43,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x98165af37b2153de, 0xc3727a337a8b704a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbe1bf1b059e9a8d6, 0x744f18c0592e4c5c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xeda2ee1c7064130c, 0x1162def06f79df73,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9485d4d1c63e8be7, 0x8addcb5645ac2ba8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb9a74a0637ce2ee1, 0x6d953e2bd7173692,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe8111c87c5c1ba99, 0xc8fa8db6ccdd0437,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x910ab1d4db9914a0, 0x1d9c9892400a22a2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb54d5e4a127f59c8, 0x2503beb6d00cab4b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe2a0b5dc971f303a, 0x2e44ae64840fd61d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8da471a9de737e24, 0x5ceaecfed289e5d2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb10d8e1456105dad, 0x7425a83e872c5f47,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdd50f1996b947518, 0xd12f124e28f77719,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8a5296ffe33cc92f, 0x82bd6b70d99aaa6f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xace73cbfdc0bfb7b, 0x636cc64d1001550b,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd8210befd30efa5a, 0x3c47f7e05401aa4e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8714a775e3e95c78, 0x65acfaec34810a71,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa8d9d1535ce3b396, 0x7f1839a741a14d0d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd31045a8341ca07c, 0x1ede48111209a050,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x83ea2b892091e44d, 0x934aed0aab460432,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa4e4b66b68b65d60, 0xf81da84d5617853f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xce1de40642e3f4b9, 0x36251260ab9d668e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x80d2ae83e9ce78f3, 0xc1d72b7c6b426019,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa1075a24e4421730, 0xb24cf65b8612f81f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc94930ae1d529cfc, 0xdee033f26797b627,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfb9b7cd9a4a7443c, 0x169840ef017da3b1,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9d412e0806e88aa5, 0x8e1f289560ee864e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc491798a08a2ad4e, 0xf1a6f2bab92a27e2,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf5b5d7ec8acb58a2, 0xae10af696774b1db,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9991a6f3d6bf1765, 0xacca6da1e0a8ef29,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbff610b0cc6edd3f, 0x17fd090a58d32af3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xeff394dcff8a948e, 0xddfc4b4cef07f5b0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x95f83d0a1fb69cd9, 0x4abdaf101564f98e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbb764c4ca7a4440f, 0x9d6d1ad41abe37f1,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xea53df5fd18d5513, 0x84c86189216dc5ed,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x92746b9be2f8552c, 0x32fd3cf5b4e49bb4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb7118682dbb66a77, 0x3fbc8c33221dc2a1,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe4d5e82392a40515, 0xfabaf3feaa5334a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8f05b1163ba6832d, 0x29cb4d87f2a7400e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb2c71d5bca9023f8, 0x743e20e9ef511012,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdf78e4b2bd342cf6, 0x914da9246b255416,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8bab8eefb6409c1a, 0x1ad089b6c2f7548e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xae9672aba3d0c320, 0xa184ac2473b529b1,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xda3c0f568cc4f3e8, 0xc9e5d72d90a2741e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8865899617fb1871, 0x7e2fa67c7a658892,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xaa7eebfb9df9de8d, 0xddbb901b98feeab7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd51ea6fa85785631, 0x552a74227f3ea565,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8533285c936b35de, 0xd53a88958f87275f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa67ff273b8460356, 0x8a892abaf368f137,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd01fef10a657842c, 0x2d2b7569b0432d85,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8213f56a67f6b29b, 0x9c3b29620e29fc73,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa298f2c501f45f42, 0x8349f3ba91b47b8f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcb3f2f7642717713, 0x241c70a936219a73,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfe0efb53d30dd4d7, 0xed238cd383aa0110,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9ec95d1463e8a506, 0xf4363804324a40aa,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc67bb4597ce2ce48, 0xb143c6053edcd0d5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf81aa16fdc1b81da, 0xdd94b7868e94050a,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9b10a4e5e9913128, 0xca7cf2b4191c8326,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc1d4ce1f63f57d72, 0xfd1c2f611f63a3f0,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf24a01a73cf2dccf, 0xbc633b39673c8cec,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x976e41088617ca01, 0xd5be0503e085d813,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbd49d14aa79dbc82, 0x4b2d8644d8a74e18,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xec9c459d51852ba2, 0xddf8e7d60ed1219e,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x93e1ab8252f33b45, 0xcabb90e5c942b503,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb8da1662e7b00a17, 0x3d6a751f3b936243,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe7109bfba19c0c9d, 0xcc512670a783ad4,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x906a617d450187e2, 0x27fb2b80668b24c5,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb484f9dc9641e9da, 0xb1f9f660802dedf6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe1a63853bbd26451, 0x5e7873f8a0396973,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8d07e33455637eb2, 0xdb0b487b6423e1e8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb049dc016abc5e5f, 0x91ce1a9a3d2cda62,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xdc5c5301c56b75f7, 0x7641a140cc7810fb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x89b9b3e11b6329ba, 0xa9e904c87fcb0a9d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xac2820d9623bf429, 0x546345fa9fbdcd44,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd732290fbacaf133, 0xa97c177947ad4095,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x867f59a9d4bed6c0, 0x49ed8eabcccc485d,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa81f301449ee8c70, 0x5c68f256bfff5a74,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xd226fc195c6a2f8c, 0x73832eec6fff3111,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x83585d8fd9c25db7, 0xc831fd53c5ff7eab,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa42e74f3d032f525, 0xba3e7ca8b77f5e55,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xcd3a1230c43fb26f, 0x28ce1bd2e55f35eb,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x80444b5e7aa7cf85, 0x7980d163cf5b81b3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xa0555e361951c366, 0xd7e105bcc332621f,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc86ab5c39fa63440, 0x8dd9472bf3fefaa7,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xfa856334878fc150, 0xb14f98f6f0feb951,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x9c935e00d4b9d8d2, 0x6ed1bf9a569f33d3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xc3b8358109e84f07, 0xa862f80ec4700c8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xf4a642e14c6262c8, 0xcd27bb612758c0fa,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x98e7e9cccfbd7dbd, 0x8038d51cb897789c,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbf21e44003acdd2c, 0xe0470a63e6bd56c3,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xeeea5d5004981478, 0x1858ccfce06cac74,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x95527a5202df0ccb, 0xf37801e0c43ebc8,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xbaa718e68396cffd, 0xd30560258f54e6ba,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe950df20247c83fd, 0x47c6b82ef32a2069,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x91d28b7416cdd27e, 0x4cdc331d57fa5441,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xb6472e511c81471d, 0xe0133fe4adf8e952,<br>
-+=C2=A0 =C2=A0 =C2=A0 0xe3d8f9e563a198e5, 0x58180fddd97723a6,<br>
-+=C2=A0 =C2=A0 =C2=A0 0x8e679c2f5e44ff8f, 0x570f09eaa7ea7648,<br>
-+=C2=A0 };<br>
-+};<br>
-+<br>
-+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE<br>
-+<br>
-+template &lt;class unused&gt;<br>
-+constexpr uint64_t<br>
-+=C2=A0 =C2=A0 powers_template&lt;unused&gt;::power_of_five_128[number_of_=
entries];<br>
-+<br>
-+#endif<br>
-+<br>
-+using powers =3D powers_template&lt;&gt;;<br>
-+<br>
-+} // namespace fast_float<br>
-+<br>
-+#endif<br>
-+<br>
-+#ifndef FASTFLOAT_DECIMAL_TO_BINARY_H<br>
-+#define FASTFLOAT_DECIMAL_TO_BINARY_H<br>
-+<br>
-+#include &lt;cfloat&gt;<br>
-+#include &lt;cinttypes&gt;<br>
-+#include &lt;cmath&gt;<br>
-+#include &lt;cstdint&gt;<br>
-+#include &lt;cstdlib&gt;<br>
-+#include &lt;cstring&gt;<br>
-+<br>
-+namespace fast_float {<br>
-+<br>
-+// This will compute or rather approximate w * 5**q and return a pair of =
64-bit<br>
-+// words approximating the result, with the &quot;high&quot; part corresp=
onding to the<br>
-+// most significant bits and the low part corresponding to the least sign=
ificant<br>
-+// bits.<br>
-+//<br>
-+template &lt;int bit_precision&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 value128<br>
-+compute_product_approximation(int64_t q, uint64_t w) {<br>
-+=C2=A0 const int index =3D 2 * int(q - powers::smallest_power_of_five);<b=
r>
-+=C2=A0 // For small values of q, e.g., q in [0,27], the answer is always =
exact<br>
-+=C2=A0 // because The line value128 firstproduct =3D full_multiplication(=
w,<br>
-+=C2=A0 // power_of_five_128[index]); gives the exact answer.<br>
-+=C2=A0 value128 firstproduct =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 full_multiplication(w, powers::power_of_five_128[ind=
ex]);<br>
-+=C2=A0 static_assert((bit_precision &gt;=3D 0) &amp;&amp; (bit_precision =
&lt;=3D 64),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; precision =
should=C2=A0 be in (0,64]&quot;);<br>
-+=C2=A0 constexpr uint64_t precision_mask =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 (bit_precision &lt; 64) ? (uint64_t(0xFFFFFFFFFFFFFF=
FF) &gt;&gt; bit_precision)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0: uint64_t(0xFFFFFFFFFFFFFFFF);<br>
-+=C2=A0 if ((firstproduct.high &amp; precision_mask) =3D=3D<br>
-+=C2=A0 =C2=A0 =C2=A0 precision_mask) { // could further guard with=C2=A0 =
(lower + w &lt; lower)<br>
-+=C2=A0 =C2=A0 // regarding the second product, we only need secondproduct=
.high, but our<br>
-+=C2=A0 =C2=A0 // expectation is that the compiler will optimize this extr=
a work away if<br>
-+=C2=A0 =C2=A0 // needed.<br>
-+=C2=A0 =C2=A0 value128 secondproduct =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 full_multiplication(w, powers::power_of_five_=
128[index + 1]);<br>
-+=C2=A0 =C2=A0 firstproduct.low +=3D secondproduct.high;<br>
-+=C2=A0 =C2=A0 if (secondproduct.high &gt; firstproduct.low) {<br>
-+=C2=A0 =C2=A0 =C2=A0 firstproduct.high++;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+=C2=A0 return firstproduct;<br>
-+}<br>
-+<br>
-+namespace detail {<br>
-+/**<br>
-+ * For q in (0,350), we have that<br>
-+ *=C2=A0 f =3D (((152170 + 65536) * q ) &gt;&gt; 16);<br>
-+ * is equal to<br>
-+ *=C2=A0 =C2=A0floor(p) + q<br>
-+ * where<br>
-+ *=C2=A0 =C2=A0p =3D log(5**q)/log(2) =3D q * log(5)/log(2)<br>
-+ *<br>
-+ * For negative values of q in (-400,0), we have that<br>
-+ *=C2=A0 f =3D (((152170 + 65536) * q ) &gt;&gt; 16);<br>
-+ * is equal to<br>
-+ *=C2=A0 =C2=A0-ceil(p) + q<br>
-+ * where<br>
-+ *=C2=A0 =C2=A0p =3D log(5**-q)/log(2) =3D -q * log(5)/log(2)<br>
-+ */<br>
-+constexpr fastfloat_really_inline int32_t power(int32_t q) noexcept {<br>
-+=C2=A0 return (((152170 + 65536) * q) &gt;&gt; 16) + 63;<br>
-+}<br>
-+} // namespace detail<br>
-+<br>
-+// create an adjusted mantissa, biased by the invalid power2<br>
-+// for significant digits already multiplied by 10 ** q.<br>
-+template &lt;typename binary&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 adjusted_mantissa<br>
-+compute_error_scaled(int64_t q, uint64_t w, int lz) noexcept {<br>
-+=C2=A0 int hilz =3D int(w &gt;&gt; 63) ^ 1;<br>
-+=C2=A0 adjusted_mantissa answer;<br>
-+=C2=A0 answer.mantissa =3D w &lt;&lt; hilz;<br>
-+=C2=A0 int bias =3D binary::mantissa_explicit_bits() - binary::minimum_ex=
ponent();<br>
-+=C2=A0 answer.power2 =3D int32_t(detail::power(int32_t(q)) + bias - hilz =
- lz - 62 +<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 invalid_am_bias);<br>
-+=C2=A0 return answer;<br>
-+}<br>
-+<br>
-+// w * 10 ** q, without rounding the representation up.<br>
-+// the power2 in the exponent will be adjusted by invalid_am_bias.<br>
-+template &lt;typename binary&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa<br>
-+compute_error(int64_t q, uint64_t w) noexcept {<br>
-+=C2=A0 int lz =3D leading_zeroes(w);<br>
-+=C2=A0 w &lt;&lt;=3D lz;<br>
-+=C2=A0 value128 product =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 compute_product_approximation&lt;binary::mantissa_ex=
plicit_bits() + 3&gt;(q, w);<br>
-+=C2=A0 return compute_error_scaled&lt;binary&gt;(q, product.high, lz);<br=
>
-+}<br>
-+<br>
-+// w * 10 ** q<br>
-+// The returned value should be a valid ieee64 number that simply need to=
 be<br>
-+// packed. However, in some very rare cases, the computation will fail. I=
n such<br>
-+// cases, we return an adjusted_mantissa with a negative power of 2: the =
caller<br>
-+// should recompute in such cases.<br>
-+template &lt;typename binary&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa<br>
-+compute_float(int64_t q, uint64_t w) noexcept {<br>
-+=C2=A0 adjusted_mantissa answer;<br>
-+=C2=A0 if ((w =3D=3D 0) || (q &lt; binary::smallest_power_of_ten())) {<br=
>
-+=C2=A0 =C2=A0 answer.power2 =3D 0;<br>
-+=C2=A0 =C2=A0 answer.mantissa =3D 0;<br>
-+=C2=A0 =C2=A0 // result should be zero<br>
-+=C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 }<br>
-+=C2=A0 if (q &gt; binary::largest_power_of_ten()) {<br>
-+=C2=A0 =C2=A0 // we want to get infinity:<br>
-+=C2=A0 =C2=A0 answer.power2 =3D binary::infinite_power();<br>
-+=C2=A0 =C2=A0 answer.mantissa =3D 0;<br>
-+=C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 }<br>
-+=C2=A0 // At this point in time q is in [powers::smallest_power_of_five,<=
br>
-+=C2=A0 // powers::largest_power_of_five].<br>
-+<br>
-+=C2=A0 // We want the most significant bit of i to be 1. Shift if needed.=
<br>
-+=C2=A0 int lz =3D leading_zeroes(w);<br>
-+=C2=A0 w &lt;&lt;=3D lz;<br>
-+<br>
-+=C2=A0 // The required precision is binary::mantissa_explicit_bits() + 3 =
because<br>
-+=C2=A0 // 1. We need the implicit bit<br>
-+=C2=A0 // 2. We need an extra bit for rounding purposes<br>
-+=C2=A0 // 3. We might lose a bit due to the &quot;upperbit&quot; routine =
(result too small,<br>
-+=C2=A0 // requiring a shift)<br>
-+<br>
-+=C2=A0 value128 product =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 compute_product_approximation&lt;binary::mantissa_ex=
plicit_bits() + 3&gt;(q, w);<br>
-+=C2=A0 // The computed &#39;product&#39; is always sufficient.<br>
-+=C2=A0 // Mathematical proof:<br>
-+=C2=A0 // Noble Mushtak and Daniel Lemire, Fast Number Parsing Without Fa=
llback (to<br>
-+=C2=A0 // appear) See script/mushtak_lemire.py<br>
-+<br>
-+=C2=A0 // The &quot;compute_product_approximation&quot; function can be s=
lightly slower than a<br>
-+=C2=A0 // branchless approach: value128 product =3D compute_product(q, w)=
; but in<br>
-+=C2=A0 // practice, we can win big with the compute_product_approximation=
 if its<br>
-+=C2=A0 // additional branch is easily predicted. Which is best is data sp=
ecific.<br>
-+=C2=A0 int upperbit =3D int(product.high &gt;&gt; 63);<br>
-+=C2=A0 int shift =3D upperbit + 64 - binary::mantissa_explicit_bits() - 3=
;<br>
-+<br>
-+=C2=A0 answer.mantissa =3D product.high &gt;&gt; shift;<br>
-+<br>
-+=C2=A0 answer.power2 =3D int32_t(detail::power(int32_t(q)) + upperbit - l=
z -<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 binary::minimum_exponent());<br>
-+=C2=A0 if (answer.power2 &lt;=3D 0) { // we have a subnormal?<br>
-+=C2=A0 =C2=A0 // Here have that answer.power2 &lt;=3D 0 so -answer.power2=
 &gt;=3D 0<br>
-+=C2=A0 =C2=A0 if (-answer.power2 + 1 &gt;=3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 64) { // if we have more than 64 bits below t=
he minimum exponent, you<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // have a zero for sure.=
<br>
-+=C2=A0 =C2=A0 =C2=A0 answer.power2 =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 answer.mantissa =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 // result should be zero<br>
-+=C2=A0 =C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 // next line is safe because -answer.power2 + 1 &lt; 64<br>
-+=C2=A0 =C2=A0 answer.mantissa &gt;&gt;=3D -answer.power2 + 1;<br>
-+=C2=A0 =C2=A0 // Thankfully, we can&#39;t have both &quot;round-to-even&q=
uot; and subnormals because<br>
-+=C2=A0 =C2=A0 // &quot;round-to-even&quot; only occurs for powers close t=
o 0.<br>
-+=C2=A0 =C2=A0 answer.mantissa +=3D (answer.mantissa &amp; 1); // round up=
<br>
-+=C2=A0 =C2=A0 answer.mantissa &gt;&gt;=3D 1;<br>
-+=C2=A0 =C2=A0 // There is a weird scenario where we don&#39;t have a subn=
ormal but just.<br>
-+=C2=A0 =C2=A0 // Suppose we start with 2.2250738585072013e-308, we end up=
<br>
-+=C2=A0 =C2=A0 // with 0x3fffffffffffff x 2^-1023-53 which is technically =
subnormal<br>
-+=C2=A0 =C2=A0 // whereas 0x40000000000000 x 2^-1023-53=C2=A0 is normal. N=
ow, we need to round<br>
-+=C2=A0 =C2=A0 // up 0x3fffffffffffff x 2^-1023-53=C2=A0 and once we do, w=
e are no longer<br>
-+=C2=A0 =C2=A0 // subnormal, but we can only know this after rounding.<br>
-+=C2=A0 =C2=A0 // So we only declare a subnormal if we are smaller than th=
e threshold.<br>
-+=C2=A0 =C2=A0 answer.power2 =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (answer.mantissa &lt; (uint64_t(1) &lt;&lt; b=
inary::mantissa_explicit_bits()))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? 0<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 1;<br>
-+=C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // usually, we round *up*, but if we fall right in between and and=
 we have an<br>
-+=C2=A0 // even basis, we need to round down<br>
-+=C2=A0 // We are only concerned with the cases where 5**q fits in single =
64-bit word.<br>
-+=C2=A0 if ((product.low &lt;=3D 1) &amp;&amp; (q &gt;=3D binary::min_expo=
nent_round_to_even()) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 (q &lt;=3D binary::max_exponent_round_to_even()) &am=
p;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 ((answer.mantissa &amp; 3) =3D=3D 1)) { // we may fa=
ll between two floats!<br>
-+=C2=A0 =C2=A0 // To be in-between two floats we need that in doing<br>
-+=C2=A0 =C2=A0 //=C2=A0 =C2=A0answer.mantissa =3D product.high &gt;&gt; (u=
pperbit + 64 -<br>
-+=C2=A0 =C2=A0 //=C2=A0 =C2=A0binary::mantissa_explicit_bits() - 3);<br>
-+=C2=A0 =C2=A0 // ... we dropped out only zeroes. But if this happened, th=
en we can go<br>
-+=C2=A0 =C2=A0 // back!!!<br>
-+=C2=A0 =C2=A0 if ((answer.mantissa &lt;&lt; shift) =3D=3D product.high) {=
<br>
-+=C2=A0 =C2=A0 =C2=A0 answer.mantissa &amp;=3D ~uint64_t(1); // flip it so=
 that we do not round up<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 answer.mantissa +=3D (answer.mantissa &amp; 1); // round up<br>
-+=C2=A0 answer.mantissa &gt;&gt;=3D 1;<br>
-+=C2=A0 if (answer.mantissa &gt;=3D (uint64_t(2) &lt;&lt; binary::mantissa=
_explicit_bits())) {<br>
-+=C2=A0 =C2=A0 answer.mantissa =3D (uint64_t(1) &lt;&lt; binary::mantissa_=
explicit_bits());<br>
-+=C2=A0 =C2=A0 answer.power2++; // undo previous addition<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 answer.mantissa &amp;=3D ~(uint64_t(1) &lt;&lt; binary::mantissa_e=
xplicit_bits());<br>
-+=C2=A0 if (answer.power2 &gt;=3D binary::infinite_power()) { // infinity<=
br>
-+=C2=A0 =C2=A0 answer.power2 =3D binary::infinite_power();<br>
-+=C2=A0 =C2=A0 answer.mantissa =3D 0;<br>
-+=C2=A0 }<br>
-+=C2=A0 return answer;<br>
-+}<br>
-+<br>
-+} // namespace fast_float<br>
-+<br>
-+#endif<br>
-+<br>
-+#ifndef FASTFLOAT_BIGINT_H<br>
-+#define FASTFLOAT_BIGINT_H<br>
-+<br>
-+#include &lt;algorithm&gt;<br>
-+#include &lt;cstdint&gt;<br>
-+#include &lt;climits&gt;<br>
-+#include &lt;cstring&gt;<br>
-+<br>
-+<br>
-+namespace fast_float {<br>
-+<br>
-+// the limb width: we want efficient multiplication of double the bits in=
<br>
-+// limb, or for 64-bit limbs, at least 64-bit multiplication where we can=
<br>
-+// extract the high and low parts efficiently. this is every 64-bit<br>
-+// architecture except for sparc, which emulates 128-bit multiplication.<=
br>
-+// we might have platforms where `CHAR_BIT` is not 8, so let&#39;s avoid<=
br>
-+// doing `8 * sizeof(limb)`.<br>
-+#if defined(FASTFLOAT_64BIT) &amp;&amp; !defined(__sparc)<br>
-+#define FASTFLOAT_64BIT_LIMB 1<br>
-+typedef uint64_t limb;<br>
-+constexpr size_t limb_bits =3D 64;<br>
-+#else<br>
-+#define FASTFLOAT_32BIT_LIMB<br>
-+typedef uint32_t limb;<br>
-+constexpr size_t limb_bits =3D 32;<br>
-+#endif<br>
-+<br>
-+typedef span&lt;limb&gt; limb_span;<br>
-+<br>
-+// number of bits in a bigint. this needs to be at least the number<br>
-+// of bits required to store the largest bigint, which is<br>
-+// `log2(10**(digits + max_exp))`, or `log2(10**(767 + 342))`, or<br>
-+// ~3600 bits, so we round to 4000.<br>
-+constexpr size_t bigint_bits =3D 4000;<br>
-+constexpr size_t bigint_limbs =3D bigint_bits / limb_bits;<br>
-+<br>
-+// vector-like type that is allocated on the stack. the entire<br>
-+// buffer is pre-allocated, and only the length changes.<br>
-+template &lt;uint16_t size&gt; struct stackvec {<br>
-+=C2=A0 limb data[size];<br>
-+=C2=A0 // we never need more than 150 limbs<br>
-+=C2=A0 uint16_t length{0};<br>
-+<br>
-+=C2=A0 stackvec() =3D default;<br>
-+=C2=A0 stackvec(const stackvec &amp;) =3D delete;<br>
-+=C2=A0 stackvec &amp;operator=3D(const stackvec &amp;) =3D delete;<br>
-+=C2=A0 stackvec(stackvec &amp;&amp;) =3D delete;<br>
-+=C2=A0 stackvec &amp;operator=3D(stackvec &amp;&amp;other) =3D delete;<br=
>
-+<br>
-+=C2=A0 // create stack vector from existing limb span.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 stackvec(limb_span s) {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_ASSERT(try_extend(s));<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR14 limb &amp;operator[](size_t index) noexcept =
{<br>
-+=C2=A0 =C2=A0 FASTFLOAT_DEBUG_ASSERT(index &lt; length);<br>
-+=C2=A0 =C2=A0 return data[index];<br>
-+=C2=A0 }<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR14 const limb &amp;operator[](size_t index) con=
st noexcept {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_DEBUG_ASSERT(index &lt; length);<br>
-+=C2=A0 =C2=A0 return data[index];<br>
-+=C2=A0 }<br>
-+=C2=A0 // index from the end of the container<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR14 const limb &amp;rindex(size_t index) const n=
oexcept {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_DEBUG_ASSERT(index &lt; length);<br>
-+=C2=A0 =C2=A0 size_t rindex =3D length - index - 1;<br>
-+=C2=A0 =C2=A0 return data[rindex];<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // set the length, without bounds checking.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR14 void set_len(size_t len) noexcept {<br>
-+=C2=A0 =C2=A0 length =3D uint16_t(len);<br>
-+=C2=A0 }<br>
-+=C2=A0 constexpr size_t len() const noexcept { return length; }<br>
-+=C2=A0 constexpr bool is_empty() const noexcept { return length =3D=3D 0;=
 }<br>
-+=C2=A0 constexpr size_t capacity() const noexcept { return size; }<br>
-+=C2=A0 // append item to vector, without bounds checking<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR14 void push_unchecked(limb value) noexcept {<b=
r>
-+=C2=A0 =C2=A0 data[length] =3D value;<br>
-+=C2=A0 =C2=A0 length++;<br>
-+=C2=A0 }<br>
-+=C2=A0 // append item to vector, returning if item was added<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR14 bool try_push(limb value) noexcept {<br>
-+=C2=A0 =C2=A0 if (len() &lt; capacity()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 push_unchecked(value);<br>
-+=C2=A0 =C2=A0 =C2=A0 return true;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 return false;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+=C2=A0 // add items to the vector, from a span, without bounds checking<b=
r>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 void extend_unchecked(limb_span s) noexcept =
{<br>
-+=C2=A0 =C2=A0 limb *ptr =3D data + length;<br>
-+=C2=A0 =C2=A0 std::copy_n(s.ptr, s.len(), ptr);<br>
-+=C2=A0 =C2=A0 set_len(len() + s.len());<br>
-+=C2=A0 }<br>
-+=C2=A0 // try to add items to the vector, returning if items were added<b=
r>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bool try_extend(limb_span s) noexcept {<br>
-+=C2=A0 =C2=A0 if (len() + s.len() &lt;=3D capacity()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 extend_unchecked(s);<br>
-+=C2=A0 =C2=A0 =C2=A0 return true;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 return false;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+=C2=A0 // resize the vector, without bounds checking<br>
-+=C2=A0 // if the new size is longer than the vector, assign value to each=
<br>
-+=C2=A0 // appended item.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20<br>
-+=C2=A0 void resize_unchecked(size_t new_len, limb value) noexcept {<br>
-+=C2=A0 =C2=A0 if (new_len &gt; len()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 size_t count =3D new_len - len();<br>
-+=C2=A0 =C2=A0 =C2=A0 limb *first =3D data + len();<br>
-+=C2=A0 =C2=A0 =C2=A0 limb *last =3D first + count;<br>
-+=C2=A0 =C2=A0 =C2=A0 ::std::fill(first, last, value);<br>
-+=C2=A0 =C2=A0 =C2=A0 set_len(new_len);<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 set_len(new_len);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+=C2=A0 // try to resize the vector, returning if the vector was resized.<=
br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bool try_resize(size_t new_len, limb value) =
noexcept {<br>
-+=C2=A0 =C2=A0 if (new_len &gt; capacity()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return false;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 resize_unchecked(new_len, value);<br>
-+=C2=A0 =C2=A0 =C2=A0 return true;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+=C2=A0 // check if any limbs are non-zero after the given index.<br>
-+=C2=A0 // this needs to be done in reverse order, since the index<br>
-+=C2=A0 // is relative to the most significant limbs.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR14 bool nonzero(size_t index) const noexcept {<=
br>
-+=C2=A0 =C2=A0 while (index &lt; len()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (rindex(index) !=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 index++;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 return false;<br>
-+=C2=A0 }<br>
-+=C2=A0 // normalize the big integer, so most-significant zero limbs are r=
emoved.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR14 void normalize() noexcept {<br>
-+=C2=A0 =C2=A0 while (len() &gt; 0 &amp;&amp; rindex(0) =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 length--;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+};<br>
-+<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 uint64_t<br>
-+empty_hi64(bool &amp;truncated) noexcept {<br>
-+=C2=A0 truncated =3D false;<br>
-+=C2=A0 return 0;<br>
-+}<br>
-+<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t<br>
-+uint64_hi64(uint64_t r0, bool &amp;truncated) noexcept {<br>
-+=C2=A0 truncated =3D false;<br>
-+=C2=A0 int shl =3D leading_zeroes(r0);<br>
-+=C2=A0 return r0 &lt;&lt; shl;<br>
-+}<br>
-+<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t<br>
-+uint64_hi64(uint64_t r0, uint64_t r1, bool &amp;truncated) noexcept {<br>
-+=C2=A0 int shl =3D leading_zeroes(r0);<br>
-+=C2=A0 if (shl =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 truncated =3D r1 !=3D 0;<br>
-+=C2=A0 =C2=A0 return r0;<br>
-+=C2=A0 } else {<br>
-+=C2=A0 =C2=A0 int shr =3D 64 - shl;<br>
-+=C2=A0 =C2=A0 truncated =3D (r1 &lt;&lt; shl) !=3D 0;<br>
-+=C2=A0 =C2=A0 return (r0 &lt;&lt; shl) | (r1 &gt;&gt; shr);<br>
-+=C2=A0 }<br>
-+}<br>
-+<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t<br>
-+uint32_hi64(uint32_t r0, bool &amp;truncated) noexcept {<br>
-+=C2=A0 return uint64_hi64(r0, truncated);<br>
-+}<br>
-+<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t<br>
-+uint32_hi64(uint32_t r0, uint32_t r1, bool &amp;truncated) noexcept {<br>
-+=C2=A0 uint64_t x0 =3D r0;<br>
-+=C2=A0 uint64_t x1 =3D r1;<br>
-+=C2=A0 return uint64_hi64((x0 &lt;&lt; 32) | x1, truncated);<br>
-+}<br>
-+<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 uint64_t<br>
-+uint32_hi64(uint32_t r0, uint32_t r1, uint32_t r2, bool &amp;truncated) n=
oexcept {<br>
-+=C2=A0 uint64_t x0 =3D r0;<br>
-+=C2=A0 uint64_t x1 =3D r1;<br>
-+=C2=A0 uint64_t x2 =3D r2;<br>
-+=C2=A0 return uint64_hi64(x0, (x1 &lt;&lt; 32) | x2, truncated);<br>
-+}<br>
-+<br>
-+// add two small integers, checking for overflow.<br>
-+// we want an efficient operation. for msvc, where<br>
-+// we don&#39;t have built-in intrinsics, this is still<br>
-+// pretty fast.<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 limb<br>
-+scalar_add(limb x, limb y, bool &amp;overflow) noexcept {<br>
-+=C2=A0 limb z;<br>
-+// gcc and clang<br>
-+#if defined(__has_builtin)<br>
-+#if __has_builtin(__builtin_add_overflow)<br>
-+=C2=A0 if (!cpp20_and_in_constexpr()) {<br>
-+=C2=A0 =C2=A0 overflow =3D __builtin_add_overflow(x, y, &amp;z);<br>
-+=C2=A0 =C2=A0 return z;<br>
-+=C2=A0 }<br>
-+#endif<br>
-+#endif<br>
-+<br>
-+=C2=A0 // generic, this still optimizes correctly on MSVC.<br>
-+=C2=A0 z =3D x + y;<br>
-+=C2=A0 overflow =3D z &lt; x;<br>
-+=C2=A0 return z;<br>
-+}<br>
-+<br>
-+// multiply two small integers, getting both the high and low bits.<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 limb<br>
-+scalar_mul(limb x, limb y, limb &amp;carry) noexcept {<br>
-+#ifdef FASTFLOAT_64BIT_LIMB<br>
-+#if defined(__SIZEOF_INT128__)<br>
-+=C2=A0 // GCC and clang both define it as an extension.<br>
-+=C2=A0 __uint128_t z =3D __uint128_t(x) * __uint128_t(y) + __uint128_t(ca=
rry);<br>
-+=C2=A0 carry =3D limb(z &gt;&gt; limb_bits);<br>
-+=C2=A0 return limb(z);<br>
-+#else<br>
-+=C2=A0 // fallback, no native 128-bit integer multiplication with carry.<=
br>
-+=C2=A0 // on msvc, this optimizes identically, somehow.<br>
-+=C2=A0 value128 z =3D full_multiplication(x, y);<br>
-+=C2=A0 bool overflow;<br>
-+=C2=A0 z.low =3D scalar_add(z.low, carry, overflow);<br>
-+=C2=A0 z.high +=3D uint64_t(overflow); // cannot overflow<br>
-+=C2=A0 carry =3D z.high;<br>
-+=C2=A0 return z.low;<br>
-+#endif<br>
-+#else<br>
-+=C2=A0 uint64_t z =3D uint64_t(x) * uint64_t(y) + uint64_t(carry);<br>
-+=C2=A0 carry =3D limb(z &gt;&gt; limb_bits);<br>
-+=C2=A0 return limb(z);<br>
-+#endif<br>
-+}<br>
-+<br>
-+// add scalar value to bigint starting from offset.<br>
-+// used in grade school multiplication<br>
-+template &lt;uint16_t size&gt;<br>
-+inline FASTFLOAT_CONSTEXPR20 bool small_add_from(stackvec&lt;size&gt; &am=
p;vec, limb y,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t start) noexcept {<br>
-+=C2=A0 size_t index =3D start;<br>
-+=C2=A0 limb carry =3D y;<br>
-+=C2=A0 bool overflow;<br>
-+=C2=A0 while (carry !=3D 0 &amp;&amp; index &lt; vec.len()) {<br>
-+=C2=A0 =C2=A0 vec[index] =3D scalar_add(vec[index], carry, overflow);<br>
-+=C2=A0 =C2=A0 carry =3D limb(overflow);<br>
-+=C2=A0 =C2=A0 index +=3D 1;<br>
-+=C2=A0 }<br>
-+=C2=A0 if (carry !=3D 0) {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_TRY(vec.try_push(carry));<br>
-+=C2=A0 }<br>
-+=C2=A0 return true;<br>
-+}<br>
-+<br>
-+// add scalar value to bigint.<br>
-+template &lt;uint16_t size&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 bool<br>
-+small_add(stackvec&lt;size&gt; &amp;vec, limb y) noexcept {<br>
-+=C2=A0 return small_add_from(vec, y, 0);<br>
-+}<br>
-+<br>
-+// multiply bigint by scalar value.<br>
-+template &lt;uint16_t size&gt;<br>
-+inline FASTFLOAT_CONSTEXPR20 bool small_mul(stackvec&lt;size&gt; &amp;vec=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 limb y) noexcept {<br>
-+=C2=A0 limb carry =3D 0;<br>
-+=C2=A0 for (size_t index =3D 0; index &lt; vec.len(); index++) {<br>
-+=C2=A0 =C2=A0 vec[index] =3D scalar_mul(vec[index], y, carry);<br>
-+=C2=A0 }<br>
-+=C2=A0 if (carry !=3D 0) {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_TRY(vec.try_push(carry));<br>
-+=C2=A0 }<br>
-+=C2=A0 return true;<br>
-+}<br>
-+<br>
-+// add bigint to bigint starting from index.<br>
-+// used in grade school multiplication<br>
-+template &lt;uint16_t size&gt;<br>
-+FASTFLOAT_CONSTEXPR20 bool large_add_from(stackvec&lt;size&gt; &amp;x, li=
mb_span y,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
ize_t start) noexcept {<br>
-+=C2=A0 // the effective x buffer is from `xstart..x.len()`, so exit early=
<br>
-+=C2=A0 // if we can&#39;t get that current range.<br>
-+=C2=A0 if (x.len() &lt; start || y.len() &gt; x.len() - start) {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_TRY(x.try_resize(y.len() + start, 0));<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 bool carry =3D false;<br>
-+=C2=A0 for (size_t index =3D 0; index &lt; y.len(); index++) {<br>
-+=C2=A0 =C2=A0 limb xi =3D x[index + start];<br>
-+=C2=A0 =C2=A0 limb yi =3D y[index];<br>
-+=C2=A0 =C2=A0 bool c1 =3D false;<br>
-+=C2=A0 =C2=A0 bool c2 =3D false;<br>
-+=C2=A0 =C2=A0 xi =3D scalar_add(xi, yi, c1);<br>
-+=C2=A0 =C2=A0 if (carry) {<br>
-+=C2=A0 =C2=A0 =C2=A0 xi =3D scalar_add(xi, 1, c2);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 x[index + start] =3D xi;<br>
-+=C2=A0 =C2=A0 carry =3D c1 | c2;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // handle overflow<br>
-+=C2=A0 if (carry) {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_TRY(small_add_from(x, 1, y.len() + start));<br>
-+=C2=A0 }<br>
-+=C2=A0 return true;<br>
-+}<br>
-+<br>
-+// add bigint to bigint.<br>
-+template &lt;uint16_t size&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 bool<br>
-+large_add_from(stackvec&lt;size&gt; &amp;x, limb_span y) noexcept {<br>
-+=C2=A0 return large_add_from(x, y, 0);<br>
-+}<br>
-+<br>
-+// grade-school multiplication algorithm<br>
-+template &lt;uint16_t size&gt;<br>
-+FASTFLOAT_CONSTEXPR20 bool long_mul(stackvec&lt;size&gt; &amp;x, limb_spa=
n y) noexcept {<br>
-+=C2=A0 limb_span xs =3D limb_span(x.data, x.len());<br>
-+=C2=A0 stackvec&lt;size&gt; z(xs);<br>
-+=C2=A0 limb_span zs =3D limb_span(z.data, z.len());<br>
-+<br>
-+=C2=A0 if (y.len() !=3D 0) {<br>
-+=C2=A0 =C2=A0 limb y0 =3D y[0];<br>
-+=C2=A0 =C2=A0 FASTFLOAT_TRY(small_mul(x, y0));<br>
-+=C2=A0 =C2=A0 for (size_t index =3D 1; index &lt; y.len(); index++) {<br>
-+=C2=A0 =C2=A0 =C2=A0 limb yi =3D y[index];<br>
-+=C2=A0 =C2=A0 =C2=A0 stackvec&lt;size&gt; zi;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (yi !=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 // re-use the same buffer throughout<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 zi.set_len(0);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FASTFLOAT_TRY(zi.try_extend(zs));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FASTFLOAT_TRY(small_mul(zi, yi));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 limb_span zis =3D limb_span(zi.data, zi.len()=
);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FASTFLOAT_TRY(large_add_from(x, zis, index));=
<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 x.normalize();<br>
-+=C2=A0 return true;<br>
-+}<br>
-+<br>
-+// grade-school multiplication algorithm<br>
-+template &lt;uint16_t size&gt;<br>
-+FASTFLOAT_CONSTEXPR20 bool large_mul(stackvec&lt;size&gt; &amp;x, limb_sp=
an y) noexcept {<br>
-+=C2=A0 if (y.len() =3D=3D 1) {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_TRY(small_mul(x, y[0]));<br>
-+=C2=A0 } else {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_TRY(long_mul(x, y));<br>
-+=C2=A0 }<br>
-+=C2=A0 return true;<br>
-+}<br>
-+<br>
-+template &lt;typename =3D void&gt; struct pow5_tables {<br>
-+=C2=A0 static constexpr uint32_t large_step =3D 135;<br>
-+=C2=A0 static constexpr uint64_t small_power_of_5[] =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 1UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 5UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 25UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 3125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 15625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 78125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 390625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 1953125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 9765625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 48828125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 244140625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 1220703125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 6103515625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 30517578125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 152587890625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 762939453125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 3814697265625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 19073486328125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 95367431640625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 476837158203125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 2384185791015625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 11920928955078125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 59604644775390625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 298023223876953125UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 1490116119384765625UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 7450580596923828125UL,<br>
-+=C2=A0 };<br>
-+#ifdef FASTFLOAT_64BIT_LIMB<br>
-+=C2=A0 constexpr static limb large_power_of_5[] =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 1414648277510068013UL, 9180637584431281687UL, 453996=
4771860779200UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 10482974169319127550UL, 198276706040285095UL};<br>
-+#else<br>
-+=C2=A0 constexpr static limb large_power_of_5[] =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 4279965485U, 329373468U,=C2=A0 4020270615U, 21375337=
57U, 4287402176U,<br>
-+=C2=A0 =C2=A0 =C2=A0 1057042919U, 1071430142U, 2440757623U, 381945767U,=
=C2=A0 46164893U};<br>
-+#endif<br>
-+};<br>
-+<br>
-+#if FASTFLOAT_DETAIL_MUST_DEFINE_CONSTEXPR_VARIABLE<br>
-+<br>
-+template &lt;typename T&gt; constexpr uint32_t pow5_tables&lt;T&gt;::larg=
e_step;<br>
-+<br>
-+template &lt;typename T&gt; constexpr uint64_t pow5_tables&lt;T&gt;::smal=
l_power_of_5[];<br>
-+<br>
-+template &lt;typename T&gt; constexpr limb pow5_tables&lt;T&gt;::large_po=
wer_of_5[];<br>
-+<br>
-+#endif<br>
-+<br>
-+// big integer type. implements a small subset of big integer<br>
-+// arithmetic, using simple algorithms since asymptotically<br>
-+// faster algorithms are slower for a small number of limbs.<br>
-+// all operations assume the big-integer is normalized.<br>
-+struct bigint : pow5_tables&lt;&gt; {<br>
-+=C2=A0 // storage of the limbs, in little-endian order.<br>
-+=C2=A0 stackvec&lt;bigint_limbs&gt; vec;<br>
-+<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bigint() : vec() {}<br>
-+=C2=A0 bigint(const bigint &amp;) =3D delete;<br>
-+=C2=A0 bigint &amp;operator=3D(const bigint &amp;) =3D delete;<br>
-+=C2=A0 bigint(bigint &amp;&amp;) =3D delete;<br>
-+=C2=A0 bigint &amp;operator=3D(bigint &amp;&amp;other) =3D delete;<br>
-+<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bigint(uint64_t value) : vec() {<br>
-+#ifdef FASTFLOAT_64BIT_LIMB<br>
-+=C2=A0 =C2=A0 vec.push_unchecked(value);<br>
-+#else<br>
-+=C2=A0 =C2=A0 vec.push_unchecked(uint32_t(value));<br>
-+=C2=A0 =C2=A0 vec.push_unchecked(uint32_t(value &gt;&gt; 32));<br>
-+#endif<br>
-+=C2=A0 =C2=A0 vec.normalize();<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // get the high 64 bits from the vector, and if bits were truncate=
d.<br>
-+=C2=A0 // this is to get the significant digits for the float.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 uint64_t hi64(bool &amp;truncated) const noe=
xcept {<br>
-+#ifdef FASTFLOAT_64BIT_LIMB<br>
-+=C2=A0 =C2=A0 if (vec.len() =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return empty_hi64(truncated);<br>
-+=C2=A0 =C2=A0 } else if (vec.len() =3D=3D 1) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return uint64_hi64(vec.rindex(0), truncated);<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 uint64_t result =3D uint64_hi64(vec.rindex(0), vec.r=
index(1), truncated);<br>
-+=C2=A0 =C2=A0 =C2=A0 truncated |=3D vec.nonzero(2);<br>
-+=C2=A0 =C2=A0 =C2=A0 return result;<br>
-+=C2=A0 =C2=A0 }<br>
-+#else<br>
-+=C2=A0 =C2=A0 if (vec.len() =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return empty_hi64(truncated);<br>
-+=C2=A0 =C2=A0 } else if (vec.len() =3D=3D 1) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return uint32_hi64(vec.rindex(0), truncated);<br>
-+=C2=A0 =C2=A0 } else if (vec.len() =3D=3D 2) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return uint32_hi64(vec.rindex(0), vec.rindex(1), tru=
ncated);<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 uint64_t result =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_hi64(vec.rindex(0), vec.rindex(=
1), vec.rindex(2), truncated);<br>
-+=C2=A0 =C2=A0 =C2=A0 truncated |=3D vec.nonzero(3);<br>
-+=C2=A0 =C2=A0 =C2=A0 return result;<br>
-+=C2=A0 =C2=A0 }<br>
-+#endif<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // compare two big integers, returning the large value.<br>
-+=C2=A0 // assumes both are normalized. if the return value is<br>
-+=C2=A0 // negative, other is larger, if the return value is<br>
-+=C2=A0 // positive, this is larger, otherwise they are equal.<br>
-+=C2=A0 // the limbs are stored in little-endian order, so we<br>
-+=C2=A0 // must compare the limbs in ever order.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 int compare(const bigint &amp;other) const n=
oexcept {<br>
-+=C2=A0 =C2=A0 if (vec.len() &gt; other.vec.len()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return 1;<br>
-+=C2=A0 =C2=A0 } else if (vec.len() &lt; other.vec.len()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return -1;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 for (size_t index =3D vec.len(); index &gt; 0; index=
--) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 limb xi =3D vec[index - 1];<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 limb yi =3D other.vec[index - 1];<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (xi &gt; yi) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (xi &lt; yi) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // shift left each limb n bits, carrying over to the new limb<br>
-+=C2=A0 // returns true if we were able to shift all the digits.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bool shl_bits(size_t n) noexcept {<br>
-+=C2=A0 =C2=A0 // Internally, for each item, we shift left by n, and add t=
he previous<br>
-+=C2=A0 =C2=A0 // right shifted limb-bits.<br>
-+=C2=A0 =C2=A0 // For example, we transform (for u8) shifted left 2, to:<b=
r>
-+=C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=A0 b10100100 b01000010<br>
-+=C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=A0 b10 b10010001 b00001000<br>
-+=C2=A0 =C2=A0 FASTFLOAT_DEBUG_ASSERT(n !=3D 0);<br>
-+=C2=A0 =C2=A0 FASTFLOAT_DEBUG_ASSERT(n &lt; sizeof(limb) * 8);<br>
-+<br>
-+=C2=A0 =C2=A0 size_t shl =3D n;<br>
-+=C2=A0 =C2=A0 size_t shr =3D limb_bits - shl;<br>
-+=C2=A0 =C2=A0 limb prev =3D 0;<br>
-+=C2=A0 =C2=A0 for (size_t index =3D 0; index &lt; vec.len(); index++) {<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 limb xi =3D vec[index];<br>
-+=C2=A0 =C2=A0 =C2=A0 vec[index] =3D (xi &lt;&lt; shl) | (prev &gt;&gt; sh=
r);<br>
-+=C2=A0 =C2=A0 =C2=A0 prev =3D xi;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 limb carry =3D prev &gt;&gt; shr;<br>
-+=C2=A0 =C2=A0 if (carry !=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return vec.try_push(carry);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 return true;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // move the limbs left by `n` limbs.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bool shl_limbs(size_t n) noexcept {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_DEBUG_ASSERT(n !=3D 0);<br>
-+=C2=A0 =C2=A0 if (n + vec.len() &gt; vec.capacity()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return false;<br>
-+=C2=A0 =C2=A0 } else if (!vec.is_empty()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 // move limbs<br>
-+=C2=A0 =C2=A0 =C2=A0 limb *dst =3D vec.data + n;<br>
-+=C2=A0 =C2=A0 =C2=A0 const limb *src =3D vec.data;<br>
-+=C2=A0 =C2=A0 =C2=A0 std::copy_backward(src, src + vec.len(), dst + vec.l=
en());<br>
-+=C2=A0 =C2=A0 =C2=A0 // fill in empty limbs<br>
-+=C2=A0 =C2=A0 =C2=A0 limb *first =3D vec.data;<br>
-+=C2=A0 =C2=A0 =C2=A0 limb *last =3D first + n;<br>
-+=C2=A0 =C2=A0 =C2=A0 ::std::fill(first, last, 0);<br>
-+=C2=A0 =C2=A0 =C2=A0 vec.set_len(n + vec.len());<br>
-+=C2=A0 =C2=A0 =C2=A0 return true;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 return true;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // move the limbs left by `n` bits.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bool shl(size_t n) noexcept {<br>
-+=C2=A0 =C2=A0 size_t rem =3D n % limb_bits;<br>
-+=C2=A0 =C2=A0 size_t div =3D n / limb_bits;<br>
-+=C2=A0 =C2=A0 if (rem !=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 FASTFLOAT_TRY(shl_bits(rem));<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 if (div !=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 FASTFLOAT_TRY(shl_limbs(div));<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 return true;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // get the number of leading zeros in the bigint.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 int ctlz() const noexcept {<br>
-+=C2=A0 =C2=A0 if (vec.is_empty()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+#ifdef FASTFLOAT_64BIT_LIMB<br>
-+=C2=A0 =C2=A0 =C2=A0 return leading_zeroes(vec.rindex(0));<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 // no use defining a specialized leading_zeroes for =
a 32-bit type.<br>
-+=C2=A0 =C2=A0 =C2=A0 uint64_t r0 =3D vec.rindex(0);<br>
-+=C2=A0 =C2=A0 =C2=A0 return leading_zeroes(r0 &lt;&lt; 32);<br>
-+#endif<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // get the number of bits in the bigint.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 int bit_length() const noexcept {<br>
-+=C2=A0 =C2=A0 int lz =3D ctlz();<br>
-+=C2=A0 =C2=A0 return int(limb_bits * vec.len()) - lz;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bool mul(limb y) noexcept { return small_mul=
(vec, y); }<br>
-+<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bool add(limb y) noexcept { return small_add=
(vec, y); }<br>
-+<br>
-+=C2=A0 // multiply as if by 2 raised to a power.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bool pow2(uint32_t exp) noexcept { return sh=
l(exp); }<br>
-+<br>
-+=C2=A0 // multiply as if by 5 raised to a power.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bool pow5(uint32_t exp) noexcept {<br>
-+=C2=A0 =C2=A0 // multiply by a power of 5<br>
-+=C2=A0 =C2=A0 size_t large_length =3D sizeof(large_power_of_5) / sizeof(l=
imb);<br>
-+=C2=A0 =C2=A0 limb_span large =3D limb_span(large_power_of_5, large_lengt=
h);<br>
-+=C2=A0 =C2=A0 while (exp &gt;=3D large_step) {<br>
-+=C2=A0 =C2=A0 =C2=A0 FASTFLOAT_TRY(large_mul(vec, large));<br>
-+=C2=A0 =C2=A0 =C2=A0 exp -=3D large_step;<br>
-+=C2=A0 =C2=A0 }<br>
-+#ifdef FASTFLOAT_64BIT_LIMB<br>
-+=C2=A0 =C2=A0 uint32_t small_step =3D 27;<br>
-+=C2=A0 =C2=A0 limb max_native =3D 7450580596923828125UL;<br>
-+#else<br>
-+=C2=A0 =C2=A0 uint32_t small_step =3D 13;<br>
-+=C2=A0 =C2=A0 limb max_native =3D 1220703125U;<br>
-+#endif<br>
-+=C2=A0 =C2=A0 while (exp &gt;=3D small_step) {<br>
-+=C2=A0 =C2=A0 =C2=A0 FASTFLOAT_TRY(small_mul(vec, max_native));<br>
-+=C2=A0 =C2=A0 =C2=A0 exp -=3D small_step;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 if (exp !=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 // Work around clang bug <a href=3D"https://godbolt.=
org/z/zedh7rrhc" rel=3D"noreferrer" target=3D"_blank">https://godbolt.org/z=
/zedh7rrhc</a><br>
-+=C2=A0 =C2=A0 =C2=A0 // This is similar to <a href=3D"https://github.com/=
llvm/llvm-project/issues/47746" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/llvm/llvm-project/issues/47746</a>,<br>
-+=C2=A0 =C2=A0 =C2=A0 // except the workaround described there don&#39;t w=
ork here<br>
-+=C2=A0 =C2=A0 =C2=A0 FASTFLOAT_TRY(small_mul(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vec, limb(((void)small_power_of_5[0], =
small_power_of_5[exp]))));<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 return true;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // multiply as if by 10 raised to a power.<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 bool pow10(uint32_t exp) noexcept {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_TRY(pow5(exp));<br>
-+=C2=A0 =C2=A0 return pow2(exp);<br>
-+=C2=A0 }<br>
-+};<br>
-+<br>
-+} // namespace fast_float<br>
-+<br>
-+#endif<br>
-+<br>
-+#ifndef FASTFLOAT_DIGIT_COMPARISON_H<br>
-+#define FASTFLOAT_DIGIT_COMPARISON_H<br>
-+<br>
-+#include &lt;algorithm&gt;<br>
-+#include &lt;cstdint&gt;<br>
-+#include &lt;cstring&gt;<br>
-+#include &lt;iterator&gt;<br>
-+<br>
-+<br>
-+namespace fast_float {<br>
-+<br>
-+// 1e0 to 1e19<br>
-+constexpr static uint64_t powers_of_ten_uint64[] =3D {1UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10000000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100000000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000000000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10000000000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100000000000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000000000000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10000000000000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100000000000000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000000000000000000UL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10000000000000000000UL};<br>
-+<br>
-+// calculate the exponent, in scientific notation, of the number.<br>
-+// this algorithm is not even close to optimized, but it has no practical=
<br>
-+// effect on performance: in order to have a faster algorithm, we&#39;d n=
eed<br>
-+// to slow down performance for faster algorithms, and this is still fast=
.<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 int32_t<br>
-+scientific_exponent(parsed_number_string_t&lt;UC&gt; &amp;num) noexcept {=
<br>
-+=C2=A0 uint64_t mantissa =3D num.mantissa;<br>
-+=C2=A0 int32_t exponent =3D int32_t(num.exponent);<br>
-+=C2=A0 while (mantissa &gt;=3D 10000) {<br>
-+=C2=A0 =C2=A0 mantissa /=3D 10000;<br>
-+=C2=A0 =C2=A0 exponent +=3D 4;<br>
-+=C2=A0 }<br>
-+=C2=A0 while (mantissa &gt;=3D 100) {<br>
-+=C2=A0 =C2=A0 mantissa /=3D 100;<br>
-+=C2=A0 =C2=A0 exponent +=3D 2;<br>
-+=C2=A0 }<br>
-+=C2=A0 while (mantissa &gt;=3D 10) {<br>
-+=C2=A0 =C2=A0 mantissa /=3D 10;<br>
-+=C2=A0 =C2=A0 exponent +=3D 1;<br>
-+=C2=A0 }<br>
-+=C2=A0 return exponent;<br>
-+}<br>
-+<br>
-+// this converts a native floating-point number to an extended-precision =
float.<br>
-+template &lt;typename T&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa<br>
-+to_extended(T value) noexcept {<br>
-+=C2=A0 using equiv_uint =3D typename binary_format&lt;T&gt;::equiv_uint;<=
br>
-+=C2=A0 constexpr equiv_uint exponent_mask =3D binary_format&lt;T&gt;::exp=
onent_mask();<br>
-+=C2=A0 constexpr equiv_uint mantissa_mask =3D binary_format&lt;T&gt;::man=
tissa_mask();<br>
-+=C2=A0 constexpr equiv_uint hidden_bit_mask =3D binary_format&lt;T&gt;::h=
idden_bit_mask();<br>
-+<br>
-+=C2=A0 adjusted_mantissa am;<br>
-+=C2=A0 int32_t bias =3D binary_format&lt;T&gt;::mantissa_explicit_bits() =
-<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0binary_form=
at&lt;T&gt;::minimum_exponent();<br>
-+=C2=A0 equiv_uint bits;<br>
-+#if FASTFLOAT_HAS_BIT_CAST<br>
-+=C2=A0 bits =3D std::bit_cast&lt;equiv_uint&gt;(value);<br>
-+#else<br>
-+=C2=A0 ::memcpy(&amp;bits, &amp;value, sizeof(T));<br>
-+#endif<br>
-+=C2=A0 if ((bits &amp; exponent_mask) =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 // denormal<br>
-+=C2=A0 =C2=A0 am.power2 =3D 1 - bias;<br>
-+=C2=A0 =C2=A0 am.mantissa =3D bits &amp; mantissa_mask;<br>
-+=C2=A0 } else {<br>
-+=C2=A0 =C2=A0 // normal<br>
-+=C2=A0 =C2=A0 am.power2 =3D int32_t((bits &amp; exponent_mask) &gt;&gt;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 binary_format&lt;T&gt;::mantissa_explicit_bits());<br>
-+=C2=A0 =C2=A0 am.power2 -=3D bias;<br>
-+=C2=A0 =C2=A0 am.mantissa =3D (bits &amp; mantissa_mask) | hidden_bit_mas=
k;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 return am;<br>
-+}<br>
-+<br>
-+// get the extended precision value of the halfway point between b and b+=
u.<br>
-+// we are given a native float that represents b, so we need to adjust it=
<br>
-+// halfway between b and b+u.<br>
-+template &lt;typename T&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa<br>
-+to_extended_halfway(T value) noexcept {<br>
-+=C2=A0 adjusted_mantissa am =3D to_extended(value);<br>
-+=C2=A0 am.mantissa &lt;&lt;=3D 1;<br>
-+=C2=A0 am.mantissa +=3D 1;<br>
-+=C2=A0 am.power2 -=3D 1;<br>
-+=C2=A0 return am;<br>
-+}<br>
-+<br>
-+// round an extended-precision float to the nearest machine float.<br>
-+template &lt;typename T, typename callback&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 void round(adjusted_mantiss=
a &amp;am,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callback cb) noexcep=
t {<br>
-+=C2=A0 int32_t mantissa_shift =3D 64 - binary_format&lt;T&gt;::mantissa_e=
xplicit_bits() - 1;<br>
-+=C2=A0 if (-am.power2 &gt;=3D mantissa_shift) {<br>
-+=C2=A0 =C2=A0 // have a denormal float<br>
-+=C2=A0 =C2=A0 int32_t shift =3D -am.power2 + 1;<br>
-+=C2=A0 =C2=A0 cb(am, std::min&lt;int32_t&gt;(shift, 64));<br>
-+=C2=A0 =C2=A0 // check for round-up: if rounding-nearest carried us to th=
e hidden bit.<br>
-+=C2=A0 =C2=A0 am.power2 =3D (am.mantissa &lt;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint64_t(1=
) &lt;&lt; binary_format&lt;T&gt;::mantissa_explicit_bits()))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? 0=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 1=
;<br>
-+=C2=A0 =C2=A0 return;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // have a normal float, use the default shift.<br>
-+=C2=A0 cb(am, mantissa_shift);<br>
-+<br>
-+=C2=A0 // check for carry<br>
-+=C2=A0 if (am.mantissa &gt;=3D<br>
-+=C2=A0 =C2=A0 =C2=A0 (uint64_t(2) &lt;&lt; binary_format&lt;T&gt;::mantis=
sa_explicit_bits())) {<br>
-+=C2=A0 =C2=A0 am.mantissa =3D (uint64_t(1) &lt;&lt; binary_format&lt;T&gt=
;::mantissa_explicit_bits());<br>
-+=C2=A0 =C2=A0 am.power2++;<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // check for infinite: we could have carried to an infinite power<=
br>
-+=C2=A0 am.mantissa &amp;=3D ~(uint64_t(1) &lt;&lt; binary_format&lt;T&gt;=
::mantissa_explicit_bits());<br>
-+=C2=A0 if (am.power2 &gt;=3D binary_format&lt;T&gt;::infinite_power()) {<=
br>
-+=C2=A0 =C2=A0 am.power2 =3D binary_format&lt;T&gt;::infinite_power();<br>
-+=C2=A0 =C2=A0 am.mantissa =3D 0;<br>
-+=C2=A0 }<br>
-+}<br>
-+<br>
-+template &lt;typename callback&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 void<br>
-+round_nearest_tie_even(adjusted_mantissa &amp;am, int32_t shift,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0callback cb) noexcept {<br>
-+=C2=A0 const uint64_t mask =3D (shift =3D=3D 64) ? UINT64_MAX : (uint64_t=
(1) &lt;&lt; shift) - 1;<br>
-+=C2=A0 const uint64_t halfway =3D (shift =3D=3D 0) ? 0 : uint64_t(1) &lt;=
&lt; (shift - 1);<br>
-+=C2=A0 uint64_t truncated_bits =3D am.mantissa &amp; mask;<br>
-+=C2=A0 bool is_above =3D truncated_bits &gt; halfway;<br>
-+=C2=A0 bool is_halfway =3D truncated_bits =3D=3D halfway;<br>
-+<br>
-+=C2=A0 // shift digits into position<br>
-+=C2=A0 if (shift =3D=3D 64) {<br>
-+=C2=A0 =C2=A0 am.mantissa =3D 0;<br>
-+=C2=A0 } else {<br>
-+=C2=A0 =C2=A0 am.mantissa &gt;&gt;=3D shift;<br>
-+=C2=A0 }<br>
-+=C2=A0 am.power2 +=3D shift;<br>
-+<br>
-+=C2=A0 bool is_odd =3D (am.mantissa &amp; 1) =3D=3D 1;<br>
-+=C2=A0 am.mantissa +=3D uint64_t(cb(is_odd, is_halfway, is_above));<br>
-+}<br>
-+<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 void<br>
-+round_down(adjusted_mantissa &amp;am, int32_t shift) noexcept {<br>
-+=C2=A0 if (shift =3D=3D 64) {<br>
-+=C2=A0 =C2=A0 am.mantissa =3D 0;<br>
-+=C2=A0 } else {<br>
-+=C2=A0 =C2=A0 am.mantissa &gt;&gt;=3D shift;<br>
-+=C2=A0 }<br>
-+=C2=A0 am.power2 +=3D shift;<br>
-+}<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void<br>
-+skip_zeros(UC const *&amp;first, UC const *last) noexcept {<br>
-+=C2=A0 uint64_t val;<br>
-+=C2=A0 while (!cpp20_and_in_constexpr() &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::distance(first, last) &gt;=3D int_=
cmp_len&lt;UC&gt;()) {<br>
-+=C2=A0 =C2=A0 ::memcpy(&amp;val, first, sizeof(uint64_t));<br>
-+=C2=A0 =C2=A0 if (val !=3D int_cmp_zeros&lt;UC&gt;()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 first +=3D int_cmp_len&lt;UC&gt;();<br>
-+=C2=A0 }<br>
-+=C2=A0 while (first !=3D last) {<br>
-+=C2=A0 =C2=A0 if (*first !=3D UC(&#39;0&#39;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 first++;<br>
-+=C2=A0 }<br>
-+}<br>
-+<br>
-+// determine if any non-zero digits were truncated.<br>
-+// all characters must be valid digits.<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 bool<br>
-+is_truncated(UC const *first, UC const *last) noexcept {<br>
-+=C2=A0 // do 8-bit optimizations, can just compare to 8 literal 0s.<br>
-+=C2=A0 uint64_t val;<br>
-+=C2=A0 while (!cpp20_and_in_constexpr() &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::distance(first, last) &gt;=3D int_=
cmp_len&lt;UC&gt;()) {<br>
-+=C2=A0 =C2=A0 ::memcpy(&amp;val, first, sizeof(uint64_t));<br>
-+=C2=A0 =C2=A0 if (val !=3D int_cmp_zeros&lt;UC&gt;()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return true;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 first +=3D int_cmp_len&lt;UC&gt;();<br>
-+=C2=A0 }<br>
-+=C2=A0 while (first !=3D last) {<br>
-+=C2=A0 =C2=A0 if (*first !=3D UC(&#39;0&#39;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 return true;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 ++first;<br>
-+=C2=A0 }<br>
-+=C2=A0 return false;<br>
-+}<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 bool<br>
-+is_truncated(span&lt;const UC&gt; s) noexcept {<br>
-+=C2=A0 return is_truncated(s.ptr, s.ptr + s.len());<br>
-+}<br>
-+<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void<br>
-+parse_eight_digits(const UC *&amp;p, limb &amp;value, size_t &amp;counter=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size=
_t &amp;count) noexcept {<br>
-+=C2=A0 value =3D value * 100000000 + parse_eight_digits_unrolled(p);<br>
-+=C2=A0 p +=3D 8;<br>
-+=C2=A0 counter +=3D 8;<br>
-+=C2=A0 count +=3D 8;<br>
-+}<br>
-+<br>
-+template &lt;typename UC&gt;<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR14 void<br>
-+parse_one_digit(UC const *&amp;p, limb &amp;value, size_t &amp;counter,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t &amp;count=
) noexcept {<br>
-+=C2=A0 value =3D value * 10 + limb(*p - UC(&#39;0&#39;));<br>
-+=C2=A0 p++;<br>
-+=C2=A0 counter++;<br>
-+=C2=A0 count++;<br>
-+}<br>
-+<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void<br>
-+add_native(bigint &amp;big, limb power, limb value) noexcept {<br>
-+=C2=A0 big.mul(power);<br>
-+=C2=A0 big.add(value);<br>
-+}<br>
-+<br>
-+fastfloat_really_inline FASTFLOAT_CONSTEXPR20 void<br>
-+round_up_bigint(bigint &amp;big, size_t &amp;count) noexcept {<br>
-+=C2=A0 // need to round-up the digits, but need to avoid rounding<br>
-+=C2=A0 // ....9999 to ...10000, which could cause a false halfway point.<=
br>
-+=C2=A0 add_native(big, 10, 1);<br>
-+=C2=A0 count++;<br>
-+}<br>
-+<br>
-+// parse the significant digits into a big integer<br>
-+template &lt;typename UC&gt;<br>
-+inline FASTFLOAT_CONSTEXPR20 void<br>
-+parse_mantissa(bigint &amp;result, parsed_number_string_t&lt;UC&gt; &amp;=
num,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t max_digits,=
 size_t &amp;digits) noexcept {<br>
-+=C2=A0 // try to minimize the number of big integer and scalar multiplica=
tion.<br>
-+=C2=A0 // therefore, try to parse 8 digits at a time, and multiply by the=
 largest<br>
-+=C2=A0 // scalar value (9 or 19 digits) for each step.<br>
-+=C2=A0 size_t counter =3D 0;<br>
-+=C2=A0 digits =3D 0;<br>
-+=C2=A0 limb value =3D 0;<br>
-+#ifdef FASTFLOAT_64BIT_LIMB<br>
-+=C2=A0 size_t step =3D 19;<br>
-+#else<br>
-+=C2=A0 size_t step =3D 9;<br>
-+#endif<br>
-+<br>
-+=C2=A0 // process all integer digits.<br>
-+=C2=A0 UC const *p =3D num.integer.ptr;<br>
-+=C2=A0 UC const *pend =3D p + num.integer.len();<br>
-+=C2=A0 skip_zeros(p, pend);<br>
-+=C2=A0 // process all digits, in increments of step per loop<br>
-+=C2=A0 while (p !=3D pend) {<br>
-+=C2=A0 =C2=A0 while ((std::distance(p, pend) &gt;=3D 8) &amp;&amp; (step =
- counter &gt;=3D 8) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(max_digits - digits &gt;=3D 8))=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 parse_eight_digits(p, value, counter, digits);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 while (counter &lt; step &amp;&amp; p !=3D pend &amp;&amp; =
digits &lt; max_digits) {<br>
-+=C2=A0 =C2=A0 =C2=A0 parse_one_digit(p, value, counter, digits);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 if (digits =3D=3D max_digits) {<br>
-+=C2=A0 =C2=A0 =C2=A0 // add the temporary value, then check if we&#39;ve =
truncated any digits<br>
-+=C2=A0 =C2=A0 =C2=A0 add_native(result, limb(powers_of_ten_uint64[counter=
]), value);<br>
-+=C2=A0 =C2=A0 =C2=A0 bool truncated =3D is_truncated(p, pend);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (num.fraction.ptr !=3D nullptr) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 truncated |=3D is_truncated(num.fraction);<br=
>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (truncated) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 round_up_bigint(result, digits);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 add_native(result, limb(powers_of_ten_uint64[counter=
]), value);<br>
-+=C2=A0 =C2=A0 =C2=A0 counter =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 value =3D 0;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // add our fraction digits, if they&#39;re available.<br>
-+=C2=A0 if (num.fraction.ptr !=3D nullptr) {<br>
-+=C2=A0 =C2=A0 p =3D num.fraction.ptr;<br>
-+=C2=A0 =C2=A0 pend =3D p + num.fraction.len();<br>
-+=C2=A0 =C2=A0 if (digits =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 skip_zeros(p, pend);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 // process all digits, in increments of step per loop<br>
-+=C2=A0 =C2=A0 while (p !=3D pend) {<br>
-+=C2=A0 =C2=A0 =C2=A0 while ((std::distance(p, pend) &gt;=3D 8) &amp;&amp;=
 (step - counter &gt;=3D 8) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(max_digits - digits &gt;=
=3D 8)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_eight_digits(p, value, counter, digits)=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 while (counter &lt; step &amp;&amp; p !=3D pend &amp=
;&amp; digits &lt; max_digits) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_one_digit(p, value, counter, digits);<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (digits =3D=3D max_digits) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 // add the temporary value, then check if we&=
#39;ve truncated any digits<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 add_native(result, limb(powers_of_ten_uint64[=
counter]), value);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool truncated =3D is_truncated(p, pend);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (truncated) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 round_up_bigint(result, digits);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 add_native(result, limb(powers_of_ten_uint64[=
counter]), value);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 if (counter !=3D 0) {<br>
-+=C2=A0 =C2=A0 add_native(result, limb(powers_of_ten_uint64[counter]), val=
ue);<br>
-+=C2=A0 }<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa<br>
-+positive_digit_comp(bigint &amp;bigmant, int32_t exponent) noexcept {<br>
-+=C2=A0 FASTFLOAT_ASSERT(bigmant.pow10(uint32_t(exponent)));<br>
-+=C2=A0 adjusted_mantissa answer;<br>
-+=C2=A0 bool truncated;<br>
-+=C2=A0 answer.mantissa =3D bigmant.hi64(truncated);<br>
-+=C2=A0 int bias =3D binary_format&lt;T&gt;::mantissa_explicit_bits() -<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0binary_format&lt;T&gt;::m=
inimum_exponent();<br>
-+=C2=A0 answer.power2 =3D bigmant.bit_length() - 64 + bias;<br>
-+<br>
-+=C2=A0 round&lt;T&gt;(answer, [truncated](adjusted_mantissa &amp;a, int32=
_t shift) {<br>
-+=C2=A0 =C2=A0 round_nearest_tie_even(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 a, shift,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [truncated](bool is_odd, bool is_halfway, boo=
l is_above) -&gt; bool {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return is_above || (is_halfway &amp;&a=
mp; truncated) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(is_odd &am=
p;&amp; is_halfway);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
-+=C2=A0 });<br>
-+<br>
-+=C2=A0 return answer;<br>
-+}<br>
-+<br>
-+// the scaling here is quite simple: we have, for the real digits `m * 10=
^e`,<br>
-+// and for the theoretical digits `n * 2^f`. Since `e` is always negative=
,<br>
-+// to scale them identically, we do `n * 2^f * 5^-f`, so we now have `m *=
 2^e`.<br>
-+// we then need to scale by `2^(f- e)`, and then the two significant digi=
ts<br>
-+// are of the same magnitude.<br>
-+template &lt;typename T&gt;<br>
-+inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa negative_digit_comp(<br>
-+=C2=A0 =C2=A0 bigint &amp;bigmant, adjusted_mantissa am, int32_t exponent=
) noexcept {<br>
-+=C2=A0 bigint &amp;real_digits =3D bigmant;<br>
-+=C2=A0 int32_t real_exp =3D exponent;<br>
-+<br>
-+=C2=A0 // get the value of `b`, rounded down, and get a bigint representa=
tion of b+h<br>
-+=C2=A0 adjusted_mantissa am_b =3D am;<br>
-+=C2=A0 // gcc7 buf: use a lambda to remove the noexcept qualifier bug wit=
h<br>
-+=C2=A0 // -Wnoexcept-type.<br>
-+=C2=A0 round&lt;T&gt;(am_b,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[](adjusted_mantissa &amp;a, int=
32_t shift) { round_down(a, shift); });<br>
-+=C2=A0 T b;<br>
-+=C2=A0 to_float(false, am_b, b);<br>
-+=C2=A0 adjusted_mantissa theor =3D to_extended_halfway(b);<br>
-+=C2=A0 bigint theor_digits(theor.mantissa);<br>
-+=C2=A0 int32_t theor_exp =3D theor.power2;<br>
-+<br>
-+=C2=A0 // scale real digits and theor digits to be same power.<br>
-+=C2=A0 int32_t pow2_exp =3D theor_exp - real_exp;<br>
-+=C2=A0 uint32_t pow5_exp =3D uint32_t(-real_exp);<br>
-+=C2=A0 if (pow5_exp !=3D 0) {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_ASSERT(theor_digits.pow5(pow5_exp));<br>
-+=C2=A0 }<br>
-+=C2=A0 if (pow2_exp &gt; 0) {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_ASSERT(theor_digits.pow2(uint32_t(pow2_exp)));<br=
>
-+=C2=A0 } else if (pow2_exp &lt; 0) {<br>
-+=C2=A0 =C2=A0 FASTFLOAT_ASSERT(real_digits.pow2(uint32_t(-pow2_exp)));<br=
>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // compare digits, and use it to director rounding<br>
-+=C2=A0 int ord =3D real_digits.compare(theor_digits);<br>
-+=C2=A0 adjusted_mantissa answer =3D am;<br>
-+=C2=A0 round&lt;T&gt;(answer, [ord](adjusted_mantissa &amp;a, int32_t shi=
ft) {<br>
-+=C2=A0 =C2=A0 round_nearest_tie_even(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 a, shift, [ord](bool is_odd, bool _, bool __)=
 -&gt; bool {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)_;=C2=A0 // not needed, since we=
&#39;ve done our comparison<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)__; // not needed, since we&#39;=
ve done our comparison<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ord &gt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ord &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return is_odd;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
-+=C2=A0 });<br>
-+<br>
-+=C2=A0 return answer;<br>
-+}<br>
-+<br>
-+// parse the significant digits as a big integer to unambiguously round t=
he<br>
-+// the significant digits. here, we are trying to determine how to round<=
br>
-+// an extended float representation close to `b+h`, halfway between `b`<b=
r>
-+// (the float rounded-down) and `b+u`, the next positive float. this<br>
-+// algorithm is always correct, and uses one of two approaches. when<br>
-+// the exponent is positive relative to the significant digits (such as<b=
r>
-+// 1234), we create a big-integer representation, get the high 64-bits,<b=
r>
-+// determine if any lower bits are truncated, and use that to direct<br>
-+// rounding. in case of a negative exponent relative to the significant<b=
r>
-+// digits (such as 1.2345), we create a theoretical representation of<br>
-+// `b` as a big-integer type, scaled to the same binary exponent as<br>
-+// the actual digits. we then compare the big integer representations<br>
-+// of both, and use that to direct rounding.<br>
-+template &lt;typename T, typename UC&gt;<br>
-+inline FASTFLOAT_CONSTEXPR20 adjusted_mantissa<br>
-+digit_comp(parsed_number_string_t&lt;UC&gt; &amp;num, adjusted_mantissa a=
m) noexcept {<br>
-+=C2=A0 // remove the invalid exponent bias<br>
-+=C2=A0 am.power2 -=3D invalid_am_bias;<br>
-+<br>
-+=C2=A0 int32_t sci_exp =3D scientific_exponent(num);<br>
-+=C2=A0 size_t max_digits =3D binary_format&lt;T&gt;::max_digits();<br>
-+=C2=A0 size_t digits =3D 0;<br>
-+=C2=A0 bigint bigmant;<br>
-+=C2=A0 parse_mantissa(bigmant, num, max_digits, digits);<br>
-+=C2=A0 // can&#39;t underflow, since digits is at most max_digits.<br>
-+=C2=A0 int32_t exponent =3D sci_exp + 1 - int32_t(digits);<br>
-+=C2=A0 if (exponent &gt;=3D 0) {<br>
-+=C2=A0 =C2=A0 return positive_digit_comp&lt;T&gt;(bigmant, exponent);<br>
-+=C2=A0 } else {<br>
-+=C2=A0 =C2=A0 return negative_digit_comp&lt;T&gt;(bigmant, am, exponent);=
<br>
-+=C2=A0 }<br>
-+}<br>
-+<br>
-+} // namespace fast_float<br>
-+<br>
-+#endif<br>
-+<br>
-+#ifndef FASTFLOAT_PARSE_NUMBER_H<br>
-+#define FASTFLOAT_PARSE_NUMBER_H<br>
-+<br>
-+<br>
-+#include &lt;cmath&gt;<br>
-+#include &lt;cstring&gt;<br>
-+#include &lt;limits&gt;<br>
-+#include &lt;system_error&gt;<br>
-+namespace fast_float {<br>
-+<br>
-+namespace detail {<br>
-+/**<br>
-+ * Special case +inf, -inf, nan, infinity, -infinity.<br>
-+ * The case comparisons could be made much faster given that we know that=
 the<br>
-+ * strings a null-free and fixed.<br>
-+ **/<br>
-+template &lt;typename T, typename UC&gt;<br>
-+from_chars_result_t&lt;UC&gt; FASTFLOAT_CONSTEXPR14 parse_infnan(UC const=
 *first,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UC const *las=
t,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T &amp;value)=
 noexcept {<br>
-+=C2=A0 from_chars_result_t&lt;UC&gt; answer{};<br>
-+=C2=A0 answer.ptr =3D first;<br>
-+=C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" target=3D"_blank">=
answer.ec</a> =3D std::errc(); // be optimistic<br>
-+=C2=A0 bool minusSign =3D false;<br>
-+=C2=A0 if (*first =3D=3D<br>
-+=C2=A0 =C2=A0 =C2=A0 UC(&#39;-&#39;)) { // assume first &lt; last, so der=
eference without checks;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// C++17 20=
.19.3.(7.1) explicitly forbids &#39;+&#39; here<br>
-+=C2=A0 =C2=A0 minusSign =3D true;<br>
-+=C2=A0 =C2=A0 ++first;<br>
-+=C2=A0 }<br>
-+#ifdef FASTFLOAT_ALLOWS_LEADING_PLUS // disabled by default<br>
-+=C2=A0 if (*first =3D=3D UC(&#39;+&#39;)) {<br>
-+=C2=A0 =C2=A0 ++first;<br>
-+=C2=A0 }<br>
-+#endif<br>
-+=C2=A0 if (last - first &gt;=3D 3) {<br>
-+=C2=A0 =C2=A0 if (fastfloat_strncasecmp(first, str_const_nan&lt;UC&gt;(),=
 3)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 answer.ptr =3D (first +=3D 3);<br>
-+=C2=A0 =C2=A0 =C2=A0 value =3D minusSign ? -std::numeric_limits&lt;T&gt;:=
:quiet_NaN()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 : std::numeric_limits&lt;T&gt;::quiet_NaN();<br>
-+=C2=A0 =C2=A0 =C2=A0 // Check for possible nan(n-char-seq-opt), C++17 20.=
19.3.7,<br>
-+=C2=A0 =C2=A0 =C2=A0 // C11 7.20.1.3.3. At least MSVC produces nan(ind) a=
nd nan(snan).<br>
-+=C2=A0 =C2=A0 =C2=A0 if (first !=3D last &amp;&amp; *first =3D=3D UC(&#39=
;(&#39;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (UC const *ptr =3D first + 1; ptr !=3D la=
st; ++ptr) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*ptr =3D=3D UC(&#39;)&#39;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 answer.ptr =3D ptr + 1; // vali=
d nan(n-char-seq-opt)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!((UC(&#39;a&#39;) &lt;=3D =
*ptr &amp;&amp; *ptr &lt;=3D UC(&#39;z&#39;)) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(UC(&#39;A&#39;) &lt;=3D *ptr &amp;&amp; *ptr &lt;=3D UC(&#39;Z&#=
39;)) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(UC(&#39;0&#39;) &lt;=3D *ptr &amp;&amp; *ptr &lt;=3D UC(&#39;9&#=
39;)) || *ptr =3D=3D UC(&#39;_&#39;)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break; // forbidden char, not n=
an(n-char-seq-opt)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 if (fastfloat_strncasecmp(first, str_const_inf&lt;UC&gt;(),=
 3)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((last - first &gt;=3D 8) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fastfloat_strncasecmp(first + 3, str_c=
onst_inf&lt;UC&gt;() + 3, 5)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 answer.ptr =3D first + 8;<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 answer.ptr =3D first + 3;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 value =3D minusSign ? -std::numeric_limits&lt;T&gt;:=
:infinity()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 : std::numeric_limits&lt;T&gt;::infinity();<br>
-+=C2=A0 =C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+=C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" target=3D"_blank">=
answer.ec</a> =3D std::errc::invalid_argument;<br>
-+=C2=A0 return answer;<br>
-+}<br>
-+<br>
-+/**<br>
-+ * Returns true if the floating-pointing rounding mode is to &#39;nearest=
&#39;.<br>
-+ * It is the default on most system. This function is meant to be inexpen=
sive.<br>
-+ * Credit : @mwalcott3<br>
-+ */<br>
-+fastfloat_really_inline bool rounds_to_nearest() noexcept {<br>
-+=C2=A0 // <a href=3D"https://lemire.me/blog/2020/06/26/gcc-not-nearest/" =
rel=3D"noreferrer" target=3D"_blank">https://lemire.me/blog/2020/06/26/gcc-=
not-nearest/</a><br>
-+#if (FLT_EVAL_METHOD !=3D 1) &amp;&amp; (FLT_EVAL_METHOD !=3D 0)<br>
-+=C2=A0 return false;<br>
-+#endif<br>
-+=C2=A0 // See<br>
-+=C2=A0 // A fast function to check your floating-point rounding mode<br>
-+=C2=A0 // <a href=3D"https://lemire.me/blog/2022/11/16/a-fast-function-to=
-check-your-floating-point-rounding-mode/" rel=3D"noreferrer" target=3D"_bl=
ank">https://lemire.me/blog/2022/11/16/a-fast-function-to-check-your-floati=
ng-point-rounding-mode/</a><br>
-+=C2=A0 //<br>
-+=C2=A0 // This function is meant to be equivalent to :<br>
-+=C2=A0 // prior: #include &lt;cfenv&gt;<br>
-+=C2=A0 //=C2=A0 return fegetround() =3D=3D FE_TONEAREST;<br>
-+=C2=A0 // However, it is expected to be much faster than the fegetround()=
<br>
-+=C2=A0 // function call.<br>
-+=C2=A0 //<br>
-+=C2=A0 // The volatile keywoard prevents the compiler from computing the =
function<br>
-+=C2=A0 // at compile-time.<br>
-+=C2=A0 // There might be other ways to prevent compile-time optimizations=
 (e.g.,<br>
-+=C2=A0 // asm). The value does not need to be std::numeric_limits&lt;floa=
t&gt;::min(), any<br>
-+=C2=A0 // small value so that 1 + x should round to 1 would do (after acc=
ounting for<br>
-+=C2=A0 // excess precision, as in 387 instructions).<br>
-+=C2=A0 static volatile float fmin =3D std::numeric_limits&lt;float&gt;::m=
in();<br>
-+=C2=A0 float fmini =3D fmin; // we copy it so that it gets loaded at most=
 once.<br>
-+//<br>
-+// Explanation:<br>
-+// Only when fegetround() =3D=3D FE_TONEAREST do we have that<br>
-+// fmin + 1.0f =3D=3D 1.0f - fmin.<br>
-+//<br>
-+// FE_UPWARD:<br>
-+//=C2=A0 fmin + 1.0f &gt; 1<br>
-+//=C2=A0 1.0f - fmin =3D=3D 1<br>
-+//<br>
-+// FE_DOWNWARD or=C2=A0 FE_TOWARDZERO:<br>
-+//=C2=A0 fmin + 1.0f =3D=3D 1<br>
-+//=C2=A0 1.0f - fmin &lt; 1<br>
-+//<br>
-+// Note: This may fail to be accurate if fast-math has been<br>
-+// enabled, as rounding conventions may not apply.<br>
-+#ifdef FASTFLOAT_VISUAL_STUDIO<br>
-+#pragma warning(push)<br>
-+//=C2=A0 todo: is there a VS warning?<br>
-+//=C2=A0 see<br>
-+//=C2=A0 <a href=3D"https://stackoverflow.com/questions/46079446/is-there=
-a-warning-for-floating-point-equality-checking-in-visual-studio-2013" rel=
=3D"noreferrer" target=3D"_blank">https://stackoverflow.com/questions/46079=
446/is-there-a-warning-for-floating-point-equality-checking-in-visual-studi=
o-2013</a><br>
-+#elif defined(__clang__)<br>
-+#pragma clang diagnostic push<br>
-+#pragma clang diagnostic ignored &quot;-Wfloat-equal&quot;<br>
-+#elif defined(__GNUC__)<br>
-+#pragma GCC diagnostic push<br>
-+#pragma GCC diagnostic ignored &quot;-Wfloat-equal&quot;<br>
-+#endif<br>
-+=C2=A0 return (fmini + 1.0f =3D=3D 1.0f - fmini);<br>
-+#ifdef FASTFLOAT_VISUAL_STUDIO<br>
-+#pragma warning(pop)<br>
-+#elif defined(__clang__)<br>
-+#pragma clang diagnostic pop<br>
-+#elif defined(__GNUC__)<br>
-+#pragma GCC diagnostic pop<br>
-+#endif<br>
-+}<br>
-+<br>
-+} // namespace detail<br>
-+<br>
-+template &lt;typename T&gt; struct from_chars_caller {<br>
-+=C2=A0 template &lt;typename UC&gt;<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 static from_chars_result_t&lt;UC&gt;<br>
-+=C2=A0 call(UC const *first, UC const *last, T &amp;value,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0parse_options_t&lt;UC&gt; options) noexcept {<=
br>
-+=C2=A0 =C2=A0 return from_chars_advanced(first, last, value, options);<br=
>
-+=C2=A0 }<br>
-+};<br>
-+<br>
-+#if __STDCPP_FLOAT32_T__ =3D=3D 1<br>
-+template &lt;&gt; struct from_chars_caller&lt;std::float32_t&gt; {<br>
-+=C2=A0 template &lt;typename UC&gt;<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 static from_chars_result_t&lt;UC&gt;<br>
-+=C2=A0 call(UC const *first, UC const *last, std::float32_t &amp;value,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0parse_options_t&lt;UC&gt; options) noexcept {<=
br>
-+=C2=A0 =C2=A0 // if std::float32_t is defined, and we are in C++23 mode; =
macro set for<br>
-+=C2=A0 =C2=A0 // float32; set value to float due to equivalence between f=
loat and<br>
-+=C2=A0 =C2=A0 // float32_t<br>
-+=C2=A0 =C2=A0 float val;<br>
-+=C2=A0 =C2=A0 auto ret =3D from_chars_advanced(first, last, val, options)=
;<br>
-+=C2=A0 =C2=A0 value =3D val;<br>
-+=C2=A0 =C2=A0 return ret;<br>
-+=C2=A0 }<br>
-+};<br>
-+#endif<br>
-+<br>
-+#if __STDCPP_FLOAT64_T__ =3D=3D 1<br>
-+template &lt;&gt; struct from_chars_caller&lt;std::float64_t&gt; {<br>
-+=C2=A0 template &lt;typename UC&gt;<br>
-+=C2=A0 FASTFLOAT_CONSTEXPR20 static from_chars_result_t&lt;UC&gt;<br>
-+=C2=A0 call(UC const *first, UC const *last, std::float64_t &amp;value,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0parse_options_t&lt;UC&gt; options) noexcept {<=
br>
-+=C2=A0 =C2=A0 // if std::float64_t is defined, and we are in C++23 mode; =
macro set for<br>
-+=C2=A0 =C2=A0 // float64; set value as double due to equivalence between =
double and<br>
-+=C2=A0 =C2=A0 // float64_t<br>
-+=C2=A0 =C2=A0 double val;<br>
-+=C2=A0 =C2=A0 auto ret =3D from_chars_advanced(first, last, val, options)=
;<br>
-+=C2=A0 =C2=A0 value =3D val;<br>
-+=C2=A0 =C2=A0 return ret;<br>
-+=C2=A0 }<br>
-+};<br>
-+#endif<br>
-+<br>
-+template &lt;typename T, typename UC, typename&gt;<br>
-+FASTFLOAT_CONSTEXPR20 from_chars_result_t&lt;UC&gt;<br>
-+from_chars(UC const *first, UC const *last, T &amp;value,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chars_format fmt /*=3D chars_for=
mat::general*/) noexcept {<br>
-+=C2=A0 return from_chars_caller&lt;T&gt;::call(first, last, value,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_options_t&lt;UC&=
gt;(fmt));<br>
-+}<br>
-+<br>
-+/**<br>
-+ * This function overload takes parsed_number_string_t structure that is =
created<br>
-+ * and populated either by from_chars_advanced function taking chars rang=
e and<br>
-+ * parsing options or other parsing custom function implemented by user.<=
br>
-+ */<br>
-+template &lt;typename T, typename UC&gt;<br>
-+FASTFLOAT_CONSTEXPR20 from_chars_result_t&lt;UC&gt;<br>
-+from_chars_advanced(parsed_number_string_t&lt;UC&gt; &amp;pns, T &amp;val=
ue) noexcept {<br>
-+<br>
-+=C2=A0 static_assert(is_supported_float_type&lt;T&gt;(),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;only some f=
loating-point types are supported&quot;);<br>
-+=C2=A0 static_assert(is_supported_char_type&lt;UC&gt;(),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;only char, =
wchar_t, char16_t and char32_t are supported&quot;);<br>
-+<br>
-+=C2=A0 from_chars_result_t&lt;UC&gt; answer;<br>
-+<br>
-+=C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" target=3D"_blank">=
answer.ec</a> =3D std::errc(); // be optimistic<br>
-+=C2=A0 answer.ptr =3D pns.lastmatch;<br>
-+=C2=A0 // The implementation of the Clinger&#39;s fast path is convoluted=
 because<br>
-+=C2=A0 // we want round-to-nearest in all cases, irrespective of the roun=
ding mode<br>
-+=C2=A0 // selected on the thread.<br>
-+=C2=A0 // We proceed optimistically, assuming that detail::rounds_to_near=
est()<br>
-+=C2=A0 // returns true.<br>
-+=C2=A0 if (binary_format&lt;T&gt;::min_exponent_fast_path() &lt;=3D pns.e=
xponent &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 pns.exponent &lt;=3D binary_format&lt;T&gt;::max_exp=
onent_fast_path() &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 !pns.too_many_digits) {<br>
-+=C2=A0 =C2=A0 // Unfortunately, the conventional Clinger&#39;s fast path =
is only possible<br>
-+=C2=A0 =C2=A0 // when the system rounds to the nearest float.<br>
-+=C2=A0 =C2=A0 //<br>
-+=C2=A0 =C2=A0 // We expect the next branch to almost always be selected.<=
br>
-+=C2=A0 =C2=A0 // We could check it first (before the previous branch), bu=
t<br>
-+=C2=A0 =C2=A0 // there might be performance advantages at having the chec=
k<br>
-+=C2=A0 =C2=A0 // be last.<br>
-+=C2=A0 =C2=A0 if (!cpp20_and_in_constexpr() &amp;&amp; detail::rounds_to_=
nearest()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 // We have that fegetround() =3D=3D FE_TONEAREST.<br=
>
-+=C2=A0 =C2=A0 =C2=A0 // Next is Clinger&#39;s fast path.<br>
-+=C2=A0 =C2=A0 =C2=A0 if (pns.mantissa &lt;=3D binary_format&lt;T&gt;::max=
_mantissa_fast_path()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D T(pns.mantissa);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pns.exponent &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D value / binary_format&lt;T&g=
t;::exact_power_of_ten(-pns.exponent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D value * binary_format&lt;T&g=
t;::exact_power_of_ten(pns.exponent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pns.negative) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D -value;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 // We do not have that fegetround() =3D=3D FE_TONEAR=
EST.<br>
-+=C2=A0 =C2=A0 =C2=A0 // Next is a modified Clinger&#39;s fast path, inspi=
red by Jakub Jel=C3=ADnek&#39;s<br>
-+=C2=A0 =C2=A0 =C2=A0 // proposal<br>
-+=C2=A0 =C2=A0 =C2=A0 if (pns.exponent &gt;=3D 0 &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pns.mantissa &lt;=3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 binary_format&lt;T&gt;::=
max_mantissa_fast_path(pns.exponent)) {<br>
-+#if defined(__clang__) || defined(FASTFLOAT_32BIT)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Clang may map 0 to -0.0 when fegetround() =
=3D=3D FE_DOWNWARD<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pns.mantissa =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D pns.negative ? T(-0.) : T(0.=
);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+#endif<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D T(pns.mantissa) *<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 binary_format&lt;=
T&gt;::exact_power_of_ten(pns.exponent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pns.negative) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D -value;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+=C2=A0 adjusted_mantissa am =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 compute_float&lt;binary_format&lt;T&gt;&gt;(pns.expo=
nent, pns.mantissa);<br>
-+=C2=A0 if (pns.too_many_digits &amp;&amp; am.power2 &gt;=3D 0) {<br>
-+=C2=A0 =C2=A0 if (am !=3D compute_float&lt;binary_format&lt;T&gt;&gt;(pns=
.exponent, pns.mantissa + 1)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 am =3D compute_error&lt;binary_format&lt;T&gt;&gt;(p=
ns.exponent, pns.mantissa);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+=C2=A0 // If we called compute_float&lt;binary_format&lt;T&gt;&gt;(pns.ex=
ponent, pns.mantissa)<br>
-+=C2=A0 // and we have an invalid power (am.power2 &lt; 0), then we need t=
o go the long<br>
-+=C2=A0 // way around again. This is very uncommon.<br>
-+=C2=A0 if (am.power2 &lt; 0) {<br>
-+=C2=A0 =C2=A0 am =3D digit_comp&lt;T&gt;(pns, am);<br>
-+=C2=A0 }<br>
-+=C2=A0 to_float(pns.negative, am, value);<br>
-+=C2=A0 // Test for over/underflow.<br>
-+=C2=A0 if ((pns.mantissa !=3D 0 &amp;&amp; am.mantissa =3D=3D 0 &amp;&amp=
; am.power2 =3D=3D 0) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 am.power2 =3D=3D binary_format&lt;T&gt;::infinite_po=
wer()) {<br>
-+=C2=A0 =C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" target=3D"_=
blank">answer.ec</a> =3D std::errc::result_out_of_range;<br>
-+=C2=A0 }<br>
-+=C2=A0 return answer;<br>
-+}<br>
-+<br>
-+template &lt;typename T, typename UC&gt;<br>
-+FASTFLOAT_CONSTEXPR20 from_chars_result_t&lt;UC&gt;<br>
-+from_chars_advanced(UC const *first, UC const *last, T &amp;value,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 par=
se_options_t&lt;UC&gt; options) noexcept {<br>
-+<br>
-+=C2=A0 static_assert(is_supported_float_type&lt;T&gt;(),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;only some f=
loating-point types are supported&quot;);<br>
-+=C2=A0 static_assert(is_supported_char_type&lt;UC&gt;(),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;only char, =
wchar_t, char16_t and char32_t are supported&quot;);<br>
-+<br>
-+=C2=A0 from_chars_result_t&lt;UC&gt; answer;<br>
-+#ifdef FASTFLOAT_SKIP_WHITE_SPACE // disabled by default<br>
-+=C2=A0 while ((first !=3D last) &amp;&amp; fast_float::is_space(uint8_t(*=
first))) {<br>
-+=C2=A0 =C2=A0 first++;<br>
-+=C2=A0 }<br>
-+#endif<br>
-+=C2=A0 if (first =3D=3D last) {<br>
-+=C2=A0 =C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" target=3D"_=
blank">answer.ec</a> =3D std::errc::invalid_argument;<br>
-+=C2=A0 =C2=A0 answer.ptr =3D first;<br>
-+=C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 }<br>
-+=C2=A0 parsed_number_string_t&lt;UC&gt; pns =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 parse_number_string&lt;UC&gt;(first, last, options);=
<br>
-+=C2=A0 if (!pns.valid) {<br>
-+=C2=A0 =C2=A0 if (options.format &amp; chars_format::no_infnan) {<br>
-+=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" targ=
et=3D"_blank">answer.ec</a> =3D std::errc::invalid_argument;<br>
-+=C2=A0 =C2=A0 =C2=A0 answer.ptr =3D first;<br>
-+=C2=A0 =C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 return detail::parse_infnan(first, last, value);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+<br>
-+=C2=A0 // call overload that takes parsed_number_string_t directly.<br>
-+=C2=A0 return from_chars_advanced(pns, value);<br>
-+}<br>
-+<br>
-+template &lt;typename T, typename UC, typename&gt;<br>
-+FASTFLOAT_CONSTEXPR20 from_chars_result_t&lt;UC&gt;<br>
-+from_chars(UC const *first, UC const *last, T &amp;value, int base) noexc=
ept {<br>
-+=C2=A0 static_assert(is_supported_char_type&lt;UC&gt;(),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;only char, =
wchar_t, char16_t and char32_t are supported&quot;);<br>
-+<br>
-+=C2=A0 from_chars_result_t&lt;UC&gt; answer;<br>
-+#ifdef FASTFLOAT_SKIP_WHITE_SPACE // disabled by default<br>
-+=C2=A0 while ((first !=3D last) &amp;&amp; fast_float::is_space(uint8_t(*=
first))) {<br>
-+=C2=A0 =C2=A0 first++;<br>
-+=C2=A0 }<br>
-+#endif<br>
-+=C2=A0 if (first =3D=3D last || base &lt; 2 || base &gt; 36) {<br>
-+=C2=A0 =C2=A0 <a href=3D"http://answer.ec" rel=3D"noreferrer" target=3D"_=
blank">answer.ec</a> =3D std::errc::invalid_argument;<br>
-+=C2=A0 =C2=A0 answer.ptr =3D first;<br>
-+=C2=A0 =C2=A0 return answer;<br>
-+=C2=A0 }<br>
-+=C2=A0 return parse_int_string(first, last, value, base);<br>
-+}<br>
-+<br>
-+} // namespace fast_float<br>
-+<br>
-+#endif<br>
-+<br>
diff --git a/meta/recipes-support/vte/vte/0005-color-parser-Use-fast_float-=
implementation-for-from_.patch b/meta/recipes-support/vte/vte/0005-color-pa=
rser-Use-fast_float-implementation-for-from_.patch<br>
deleted file mode 100644<br>
index b951bbac18..0000000000<br>
--- a/meta/recipes-support/vte/vte/0005-color-parser-Use-fast_float-impleme=
ntation-for-from_.patch<br>
+++ /dev/null<br>
@@ -1,102 +0,0 @@<br>
-From 08b90d0a5bf8ceb68dd1b4e9ded0f8a2b5287a6e Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Fri, 4 Oct 2024 21:22:52 -0700<br>
-Subject: [PATCH 5/5] color-parser: Use fast_float implementation for<br>
- from_chars<br>
-<br>
-Removed dependency on c++ runtime to provide it.<br>
-<br>
-Fixes: <a href=3D"https://gitlab.gnome.org/GNOME/vte/-/issues/2823" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/vte/-/issues/=
2823</a><br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://gitlab.gnome.org/GNOME/vte/=
-/issues/2823#note_2239888" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.gnome.org/GNOME/vte/-/issues/2823#note_2239888</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- src/color-parser.cc | 12 ++++++------<br>
- src/termprops.hh=C2=A0 =C2=A0 | 12 ++++++------<br>
- 2 files changed, 12 insertions(+), 12 deletions(-)<br>
-<br>
-diff --git a/src/color-parser.cc b/src/color-parser.cc<br>
-index 02ec5d3a..42c51966 100644<br>
---- a/src/color-parser.cc<br>
-+++ b/src/color-parser.cc<br>
-@@ -17,7 +17,7 @@<br>
- <br>
- #include &quot;color-parser.hh&quot;<br>
- #include &quot;color.hh&quot;<br>
--<br>
-+#include &quot;fast_float.hh&quot;<br>
- #include &lt;algorithm&gt;<br>
- #include &lt;cctype&gt;<br>
- #include &lt;charconv&gt;<br>
-@@ -298,7 +298,7 @@ parse_csslike(std::string const&amp; spec) noexcept<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto value =
=3D uint64_t{};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto const s=
tart =3D spec.c_str() + 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto const e=
nd =3D spec.c_str() + spec.size();<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 auto const rv =3D=
 std::from_chars(start, end, value, 16);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 auto const rv =3D=
 fast_float::from_chars(start, end, value, 16);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (<a href=
=3D"http://rv.ec" rel=3D"noreferrer" target=3D"_blank">rv.ec</a> !=3D std::=
errc{} || rv.ptr !=3D end)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return std::nullopt;<br>
- <br>
-@@ -424,7 +424,7 @@ parse_x11like(std::string const&amp; spec) noexcept<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto value =
=3D uint64_t{};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto const s=
tart =3D spec.c_str() + 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto const e=
nd =3D spec.c_str() + spec.size();<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 auto const rv =3D=
 std::from_chars(start, end, value, 16);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 auto const rv =3D=
 fast_float::from_chars(start, end, value, 16);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (<a href=
=3D"http://rv.ec" rel=3D"noreferrer" target=3D"_blank">rv.ec</a> !=3D std::=
errc{} || rv.ptr !=3D end)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return std::nullopt;<br>
- <br>
-@@ -447,13 +447,13 @@ parse_x11like(std::string const&amp; spec) noexcept<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Note that=
 the length check above makes sure that @r, @g, @b,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// don&#39;t=
 exceed @bits.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto r =3D U=
INT64_C(0), b =3D UINT64_C(0), g =3D UINT64_C(0);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 auto rv =3D std::=
from_chars(start, end, r, 16);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 auto rv =3D fast_=
float::from_chars(start, end, r, 16);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (<a href=
=3D"http://rv.ec" rel=3D"noreferrer" target=3D"_blank">rv.ec</a> !=3D std::=
errc{} || rv.ptr =3D=3D end || *rv.ptr !=3D &#39;/&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return std::nullopt;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rv =3D std::from_=
chars(rv.ptr + 1, end, g, 16);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rv =3D fast_float=
::from_chars(rv.ptr + 1, end, g, 16);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (<a href=
=3D"http://rv.ec" rel=3D"noreferrer" target=3D"_blank">rv.ec</a> !=3D std::=
errc{} || rv.ptr =3D=3D end || *rv.ptr !=3D &#39;/&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return std::nullopt;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rv =3D std::from_=
chars(rv.ptr + 1, end, b, 16);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rv =3D fast_float=
::from_chars(rv.ptr + 1, end, b, 16);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (<a href=
=3D"http://rv.ec" rel=3D"noreferrer" target=3D"_blank">rv.ec</a> !=3D std::=
errc{} || rv.ptr !=3D end)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return std::nullopt;<br>
- <br>
-diff --git a/src/termprops.hh b/src/termprops.hh<br>
-index 0d3f0f4c..a10fc7d1 100644<br>
---- a/src/termprops.hh<br>
-+++ b/src/termprops.hh<br>
-@@ -17,6 +17,7 @@<br>
- <br>
- #include &lt;glib.h&gt;<br>
- <br>
-+#include &quot;fast_float.hh&quot;<br>
- #include &quot;fwd.hh&quot;<br>
- #include &quot;uuid.hh&quot;<br>
- #include &quot;color.hh&quot;<br>
-@@ -355,8 +356,8 @@ inline std::optional&lt;TermpropValue&gt;<br>
- parse_termprop_integral(std::string_view const&amp; str) noexcept<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto v =3D T{};<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (auto [ptr, err] =3D std::from_chars(std::=
begin(str),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 std::end(str),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (auto [ptr, err] =3D fast_float::from_char=
s(str.data(),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 str.data()+str.size(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0v);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D=3D std::errc() &am=
p;&amp; ptr =3D=3D std::end(str)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if constexpr=
 (std::is_unsigned_v&lt;T&gt;) {<br>
-@@ -389,10 +390,9 @@ inline std::optional&lt;TermpropValue&gt;<br>
- parse_termprop_floating(std::string_view const&amp; str) noexcept<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto v =3D T{};<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (auto [ptr, err] =3D std::from_chars(std::=
begin(str),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 std::end(str),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 v,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 std::chars_format::general);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (auto [ptr, err] =3D fast_float::from_char=
s(str.data(),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 str.data() + str.size(),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 v);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D=3D std::errc() &am=
p;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D=3D std::end(str) &=
amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::isfinite(v)) {<br>
diff --git a/meta/recipes-support/vte/<a href=3D"http://vte_0.78.2.bb" rel=
=3D"noreferrer" target=3D"_blank">vte_0.78.2.bb</a> b/meta/recipes-support/=
vte/<a href=3D"http://vte_0.80.3.bb" rel=3D"noreferrer" target=3D"_blank">v=
te_0.80.3.bb</a><br>
similarity index 82%<br>
rename from meta/recipes-support/vte/<a href=3D"http://vte_0.78.2.bb" rel=
=3D"noreferrer" target=3D"_blank">vte_0.78.2.bb</a><br>
rename to meta/recipes-support/vte/<a href=3D"http://vte_0.80.3.bb" rel=3D"=
noreferrer" target=3D"_blank">vte_0.80.3.bb</a><br>
index 0593d16cd8..1eb95dd827 100644<br>
--- a/meta/recipes-support/vte/<a href=3D"http://vte_0.78.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.78.2.bb</a><br>
+++ b/meta/recipes-support/vte/<a href=3D"http://vte_0.80.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.80.3.bb</a><br>
@@ -11,18 +11,15 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030=
f057 \<br>
=C2=A0&quot;<br>
<br>
-DEPENDS =3D &quot;glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native g=
perf-native icu lz4&quot;<br>
+DEPENDS =3D &quot;fastfloat glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml=
2-native gperf-native icu lz4&quot;<br>
<br>
=C2=A0GIR_MESON_OPTION =3D &#39;gir&#39;<br>
=C2=A0GIDOCGEN_MESON_OPTION =3D &quot;docs&quot;<br>
=C2=A0inherit gnomebase gi-docgen features_check upstream-version-is-even g=
object-introspection systemd vala<br>
<br>
-SRC_URI +=3D &quot;file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.=
patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-lib-Typo-fix.patch \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-fast_float-Add-single=
-header-library-for-from_char-i.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-color-parser-Use-fast=
_float-implementation-for-from_.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[archive.sha256sum] =3D &quot;35d7bcde07356846b4a12881c8e016705b70a=
9004a9082285eee5834ccc49890&quot;<br>
+SRC_URI +=3D &quot;file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.=
patch&quot;<br>
+<br>
+SRC_URI[archive.sha256sum] =3D &quot;2e596fd3fbeabb71531662224e71f6a2c37f6=
84426136d62854627276ef4f699&quot;<br>
<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
<br>
@@ -49,7 +46,8 @@ FILES:${PN}-gtk4-dev =3D &quot;${libdir}/lib*gtk4.so \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${datadir}/vala/vapi/vte-2.91-gtk4.vapi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${includedir}/vte-2.91-gtk4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;<br>
-FILES:${PN} +=3D &quot;${systemd_user_unitdir}&quot;<br>
+FILES:${PN} +=3D &quot;${systemd_user_unitdir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/xdg-ter=
minals&quot;<br>
=C2=A0FILES:libvte =3D &quot;${libdir}/*.so.* ${libdir}/girepository-1.0/*&=
quot;<br>
=C2=A0FILES:${PN}-prompt =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/profile.d \<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#222738): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/222738" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/222738</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115028533/556=
952" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/115028533/556952</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rob.woolleywr@gmail.com" t=
arget=3D"_blank">rob.woolleywr@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000bc8889063dd3535a--

