Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC6AC27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 14:11:11 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.43117.1717769461416531974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 07:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ICzT9736;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-250ac3acc6dso1057140fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 07:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717769460; x=1718374260; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAWP1XkyOKLtsXLTWsOmR1zz0klM8+sxZdlGRQ2J7OQ=;
        b=ICzT9736+LqckiHTfrH8L8xdYR52tWW47jbZCCo2GBLKT6W0UtbvwIpwK4SSJTLPIm
         GXgF0F57x5QRywefZd8gytkl8sTkXEDDaPv/VfoYsCOSnWo0C1Xe7/m9nSfOclZ7XhR+
         iY95SEKPPHqZ8MCDZhixRaI4HCgSHSXWy+E61zT9xQJEGfMK00P4+inKziDqEIlYl0eN
         hat7+LImjSQcqpw2fb/zlo1HewyT5w9k+9+b1Oif2kLJbdcfYqY4Ua6RiD+LwWTz35Kp
         KwT0JXO/736ppVSdxDxpnyzC+IkZLe9gRt85/jk056LtPUaUJ09D/mH40F74p5S3jMK6
         4KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717769460; x=1718374260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAWP1XkyOKLtsXLTWsOmR1zz0klM8+sxZdlGRQ2J7OQ=;
        b=EBjBOLyX8pCsd92emM8bUFWox4+waD3j9BEv08DLjpwBAir/PQjeYeZWP4LrIcDsR5
         ChrkqFJ5odnR5KEi0Q4PtqFXqZALNmqSy4CVjdVTudARhs3htS7eU5lMJ2ejk3VMB8Ra
         XdWVHeHe09oiyod295AnaZKbl+VBClGHTliRfTg2hQDaSdmP5RsK1H3N5+o6ZfzU6KQV
         BogXEnCwxYqZMWnmU6IpjF9bq0tRNLt5p+S61J1YTEVkp5xC/xrv5X1uaZkZmC/rxvN6
         P49q20IKd8PxSWTp6YXEeaet4rznJjkLvLJFmymxusGi52IJaxr7Rn9my433L/uFYISY
         27sA==
X-Gm-Message-State: AOJu0YzwUVf4T/t0ZMxibtje+RDj1jICWTWjIHklmuMkVVOF9FSpqwN8
	siecP/HLu/yT1w14Q8YoKCDGIwOeWQ053yIUbrJxKcRIRLph464PPV9vOoRBtGZkDnArMgkYTyM
	x7ULChwFdFsacqnsCGu3JBTPQN1w=
X-Google-Smtp-Source: AGHT+IF0TLKO4bNXi4S1yTe11AkXHbuNfkZpjNbba0YP+1QEOA8AS6F0fNMxT2uEJMZqcs04QiEvfR14Ozal/9EIzgE=
X-Received: by 2002:a05:6870:970b:b0:24f:e8f1:675b with SMTP id
 586e51a60fabf-2546460c605mr2670898fac.30.1717769460279; Fri, 07 Jun 2024
 07:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240605064317.1646597-1-raj.khem@gmail.com> <202406070933261b369a8f@mail.local>
In-Reply-To: <202406070933261b369a8f@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jun 2024 07:10:33 -0700
Message-ID: <CAMKF1sqwG-vUYKxH3CDs5bLXc6o9Yx7AY2wJACm=b0C7Fp_EKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3: Check for host OS type instead of
 build OS
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 14:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200444

On Fri, Jun 7, 2024 at 2:33=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This breaks musl:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9102/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9116/st=
eps/12/logs/stdio
>

yeah, it exposed another issue in how we configure gcc for musl sadly.

>
> On 04/06/2024 23:43:16-0700, Khem Raj wrote:
> > configure uses PLATOFRM_TRIPLET derive many variabled e.g.
> > SOABI, EXT_SUFFIX etc. However, the check is for build system
> > which is not correct when cross-compiling python, it works ok
> > for native builds since host =3D=3D build, however for cross-builds
> > host !=3D build and this ends up with wrong value e.g. on musl/linux
> > it gets linux-gnu whereas it should be linux-musl.
> >
> > Luckily, its fixed upstream, hence backported
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...r-platform-triplet-detection-code-ad.patch | 498 ++++++++++++++++++
> >  .../recipes-devtools/python/python3_3.12.3.bb |   1 +
> >  2 files changed, 499 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3/0001-gh-95855-=
Refactor-platform-triplet-detection-code-ad.patch
> >
> > diff --git a/meta/recipes-devtools/python/python3/0001-gh-95855-Refacto=
r-platform-triplet-detection-code-ad.patch b/meta/recipes-devtools/python/p=
ython3/0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch
> > new file mode 100644
> > index 00000000000..c0dc3a79f67
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3/0001-gh-95855-Refactor-platf=
orm-triplet-detection-code-ad.patch
> > @@ -0,0 +1,498 @@
> > +From c163d7f0b67a568e9b64eeb9c1cbbaa127818596 Mon Sep 17 00:00:00 2001
> > +From: Jeffery To <jeffery.to@gmail.com>
> > +Date: Thu, 24 Aug 2023 20:22:50 +0800
> > +Subject: [PATCH] gh-95855: Refactor platform triplet detection code, a=
dd
> > + detection for MIPS soft float and musl libc (#107221)
> > +
> > +- Move platform triplet detection code into Misc/platform_triplet.c
> > +- Refactor MIPS detection, use defined(__mips64) to detect MIPS64
> > +- Compute libc values in separate section
> > +- Add detection for MIPS soft float
> > +- Add detection for musl
> > +
> > +musl supports SPE with its soft-float ABI:
> > +https://git.musl-libc.org/cgit/musl/commit/?id=3D7be59733d71ada3a32a98=
622507399253f1d5e48
> > +
> > +Original patch by Christian Heimes.
> > +
> > +Co-authored-by: Christian Heimes <christian@python.org>
> > +Co-authored-by: Erlend E. Aasland <erlend@python.org>
> > +
> > +Upstream-Status: Backport [https://github.com/kraj/cpython/commit/c163=
d7f0b67a568e9b64eeb9c1cbbaa127818596]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + ...3-07-25-02-30-00.gh-issue-95855.wA7rAf.rst |   2 +
> > + Misc/platform_triplet.c                       | 255 +++++++++++++++++=
+
> > + configure.ac                                  | 192 +------------
> > + 4 files changed, 265 insertions(+), 376 deletions(-)
> > + create mode 100644 Misc/NEWS.d/next/Build/2023-07-25-02-30-00.gh-issu=
e-95855.wA7rAf.rst
> > + create mode 100644 Misc/platform_triplet.c
> > +
> > +--- /dev/null
> > ++++ b/Misc/NEWS.d/next/Build/2023-07-25-02-30-00.gh-issue-95855.wA7rAf=
.rst
> > +@@ -0,0 +1,2 @@
> > ++Refactor platform triplet detection code and add detection for MIPS s=
oft
> > ++float and musl libc.
> > +--- /dev/null
> > ++++ b/Misc/platform_triplet.c
> > +@@ -0,0 +1,255 @@
> > ++/* Detect platform triplet from builtin defines
> > ++ * cc -E Misc/platform_triplet.c | grep '^PLATFORM_TRIPLET=3D' | tr -=
d ' '
> > ++ */
> > ++#undef bfin
> > ++#undef cris
> > ++#undef fr30
> > ++#undef linux
> > ++#undef hppa
> > ++#undef hpux
> > ++#undef i386
> > ++#undef mips
> > ++#undef powerpc
> > ++#undef sparc
> > ++#undef unix
> > ++#if defined(__ANDROID__)
> > ++    # Android is not a multiarch system.
> > ++#elif defined(__linux__)
> > ++/*
> > ++ * BEGIN of Linux block
> > ++ */
> > ++// Detect libc (based on config.guess)
> > ++# include <features.h>
> > ++# if defined(__UCLIBC__)
> > ++#  error uclibc not supported
> > ++# elif defined(__dietlibc__)
> > ++#  error dietlibc not supported
> > ++# elif defined(__GLIBC__)
> > ++#  define LIBC gnu
> > ++#  define LIBC_X32 gnux32
> > ++#  if defined(__ARM_PCS_VFP)
> > ++#   define LIBC_ARM gnueabihf
> > ++#  else
> > ++#   define LIBC_ARM gnueabi
> > ++#  endif
> > ++#  if defined(__loongarch__)
> > ++#   if defined(__loongarch_soft_float)
> > ++#    define LIBC_LA gnusf
> > ++#   elif defined(__loongarch_single_float)
> > ++#    define LIBC_LA gnuf32
> > ++#   elif defined(__loongarch_double_float)
> > ++#    define LIBC_LA gnu
> > ++#   else
> > ++#    error unknown loongarch floating-point base abi
> > ++#   endif
> > ++#  endif
> > ++#  if defined(_MIPS_SIM)
> > ++#   if defined(__mips_hard_float)
> > ++#    if _MIPS_SIM =3D=3D _ABIO32
> > ++#     define LIBC_MIPS gnu
> > ++#    elif _MIPS_SIM =3D=3D _ABIN32
> > ++#     define LIBC_MIPS gnuabin32
> > ++#    elif _MIPS_SIM =3D=3D _ABI64
> > ++#     define LIBC_MIPS gnuabi64
> > ++#    else
> > ++#     error unknown mips sim value
> > ++#    endif
> > ++#   else
> > ++#    if _MIPS_SIM =3D=3D _ABIO32
> > ++#     define LIBC_MIPS gnusf
> > ++#    elif _MIPS_SIM =3D=3D _ABIN32
> > ++#     define LIBC_MIPS gnuabin32sf
> > ++#    elif _MIPS_SIM =3D=3D _ABI64
> > ++#     define LIBC_MIPS gnuabi64sf
> > ++#    else
> > ++#     error unknown mips sim value
> > ++#    endif
> > ++#   endif
> > ++#  endif
> > ++#  if defined(__SPE__)
> > ++#   define LIBC_PPC gnuspe
> > ++#  else
> > ++#   define LIBC_PPC gnu
> > ++#  endif
> > ++# else
> > ++// Heuristic to detect musl libc
> > ++#  include <stdarg.h>
> > ++#  ifdef __DEFINED_va_list
> > ++#   define LIBC musl
> > ++#   define LIBC_X32 muslx32
> > ++#   if defined(__ARM_PCS_VFP)
> > ++#    define LIBC_ARM musleabihf
> > ++#   else
> > ++#    define LIBC_ARM musleabi
> > ++#   endif
> > ++#   if defined(__loongarch__)
> > ++#    if defined(__loongarch_soft_float)
> > ++#     define LIBC_LA muslsf
> > ++#    elif defined(__loongarch_single_float)
> > ++#     define LIBC_LA muslf32
> > ++#    elif defined(__loongarch_double_float)
> > ++#     define LIBC_LA musl
> > ++#    else
> > ++#     error unknown loongarch floating-point base abi
> > ++#    endif
> > ++#   endif
> > ++#   if defined(_MIPS_SIM)
> > ++#    if defined(__mips_hard_float)
> > ++#     if _MIPS_SIM =3D=3D _ABIO32
> > ++#      define LIBC_MIPS musl
> > ++#     elif _MIPS_SIM =3D=3D _ABIN32
> > ++#      define LIBC_MIPS musln32
> > ++#     elif _MIPS_SIM =3D=3D _ABI64
> > ++#      define LIBC_MIPS musl
> > ++#     else
> > ++#      error unknown mips sim value
> > ++#     endif
> > ++#    else
> > ++#     if _MIPS_SIM =3D=3D _ABIO32
> > ++#      define LIBC_MIPS muslsf
> > ++#     elif _MIPS_SIM =3D=3D _ABIN32
> > ++#      define LIBC_MIPS musln32sf
> > ++#     elif _MIPS_SIM =3D=3D _ABI64
> > ++#      define LIBC_MIPS muslsf
> > ++#     else
> > ++#      error unknown mips sim value
> > ++#     endif
> > ++#    endif
> > ++#   endif
> > ++#   if defined(_SOFT_FLOAT) || defined(__NO_FPRS__)
> > ++#    define LIBC_PPC muslsf
> > ++#   else
> > ++#    define LIBC_PPC musl
> > ++#   endif
> > ++#  else
> > ++#   error unknown libc
> > ++#  endif
> > ++# endif
> > ++
> > ++# if defined(__x86_64__) && defined(__LP64__)
> > ++PLATFORM_TRIPLET=3Dx86_64-linux-LIBC
> > ++# elif defined(__x86_64__) && defined(__ILP32__)
> > ++PLATFORM_TRIPLET=3Dx86_64-linux-LIBC_X32
> > ++# elif defined(__i386__)
> > ++PLATFORM_TRIPLET=3Di386-linux-LIBC
> > ++# elif defined(__aarch64__) && defined(__AARCH64EL__)
> > ++#  if defined(__ILP32__)
> > ++PLATFORM_TRIPLET=3Daarch64_ilp32-linux-LIBC
> > ++#  else
> > ++PLATFORM_TRIPLET=3Daarch64-linux-LIBC
> > ++#  endif
> > ++# elif defined(__aarch64__) && defined(__AARCH64EB__)
> > ++#  if defined(__ILP32__)
> > ++PLATFORM_TRIPLET=3Daarch64_be_ilp32-linux-LIBC
> > ++#  else
> > ++PLATFORM_TRIPLET=3Daarch64_be-linux-LIBC
> > ++#  endif
> > ++# elif defined(__alpha__)
> > ++PLATFORM_TRIPLET=3Dalpha-linux-LIBC
> > ++# elif defined(__ARM_EABI__)
> > ++#  if defined(__ARMEL__)
> > ++PLATFORM_TRIPLET=3Darm-linux-LIBC_ARM
> > ++#  else
> > ++PLATFORM_TRIPLET=3Darmeb-linux-LIBC_ARM
> > ++#  endif
> > ++# elif defined(__hppa__)
> > ++PLATFORM_TRIPLET=3Dhppa-linux-LIBC
> > ++# elif defined(__ia64__)
> > ++PLATFORM_TRIPLET=3Dia64-linux-LIBC
> > ++# elif defined(__loongarch__) && defined(__loongarch_lp64)
> > ++PLATFORM_TRIPLET=3Dloongarch64-linux-LIBC_LA
> > ++# elif defined(__m68k__) && !defined(__mcoldfire__)
> > ++PLATFORM_TRIPLET=3Dm68k-linux-LIBC
> > ++# elif defined(__mips__)
> > ++#  if defined(__mips_isa_rev) && (__mips_isa_rev >=3D6)
> > ++#   if defined(_MIPSEL) && defined(__mips64)
> > ++PLATFORM_TRIPLET=3Dmipsisa64r6el-linux-LIBC_MIPS
> > ++#   elif defined(_MIPSEL)
> > ++PLATFORM_TRIPLET=3Dmipsisa32r6el-linux-LIBC_MIPS
> > ++#   elif defined(__mips64)
> > ++PLATFORM_TRIPLET=3Dmipsisa64r6-linux-LIBC_MIPS
> > ++#   else
> > ++PLATFORM_TRIPLET=3Dmipsisa32r6-linux-LIBC_MIPS
> > ++#   endif
> > ++#  else
> > ++#   if defined(_MIPSEL) && defined(__mips64)
> > ++PLATFORM_TRIPLET=3Dmips64el-linux-LIBC_MIPS
> > ++#   elif defined(_MIPSEL)
> > ++PLATFORM_TRIPLET=3Dmipsel-linux-LIBC_MIPS
> > ++#   elif defined(__mips64)
> > ++PLATFORM_TRIPLET=3Dmips64-linux-LIBC_MIPS
> > ++#   else
> > ++PLATFORM_TRIPLET=3Dmips-linux-LIBC_MIPS
> > ++#   endif
> > ++#  endif
> > ++# elif defined(__or1k__)
> > ++PLATFORM_TRIPLET=3Dor1k-linux-LIBC
> > ++# elif defined(__powerpc64__)
> > ++#  if defined(__LITTLE_ENDIAN__)
> > ++PLATFORM_TRIPLET=3Dpowerpc64le-linux-LIBC
> > ++#  else
> > ++PLATFORM_TRIPLET=3Dpowerpc64-linux-LIBC
> > ++#  endif
> > ++# elif defined(__powerpc__)
> > ++PLATFORM_TRIPLET=3Dpowerpc-linux-LIBC_PPC
> > ++# elif defined(__s390x__)
> > ++PLATFORM_TRIPLET=3Ds390x-linux-LIBC
> > ++# elif defined(__s390__)
> > ++PLATFORM_TRIPLET=3Ds390-linux-LIBC
> > ++# elif defined(__sh__) && defined(__LITTLE_ENDIAN__)
> > ++PLATFORM_TRIPLET=3Dsh4-linux-LIBC
> > ++# elif defined(__sparc__) && defined(__arch64__)
> > ++PLATFORM_TRIPLET=3Dsparc64-linux-LIBC
> > ++# elif defined(__sparc__)
> > ++PLATFORM_TRIPLET=3Dsparc-linux-LIBC
> > ++# elif defined(__riscv)
> > ++#  if __riscv_xlen =3D=3D 32
> > ++PLATFORM_TRIPLET=3Driscv32-linux-LIBC
> > ++#  elif __riscv_xlen =3D=3D 64
> > ++PLATFORM_TRIPLET=3Driscv64-linux-LIBC
> > ++#  else
> > ++#   error unknown platform triplet
> > ++#  endif
> > ++# else
> > ++#   error unknown platform triplet
> > ++# endif
> > ++/*
> > ++ * END of Linux block
> > ++ */
> > ++#elif defined(__FreeBSD_kernel__)
> > ++# if defined(__LP64__)
> > ++PLATFORM_TRIPLET=3Dx86_64-kfreebsd-gnu
> > ++# elif defined(__i386__)
> > ++PLATFORM_TRIPLET=3Di386-kfreebsd-gnu
> > ++# else
> > ++#   error unknown platform triplet
> > ++# endif
> > ++#elif defined(__gnu_hurd__)
> > ++PLATFORM_TRIPLET=3Di386-gnu
> > ++#elif defined(__APPLE__)
> > ++PLATFORM_TRIPLET=3Ddarwin
> > ++#elif defined(__VXWORKS__)
> > ++PLATFORM_TRIPLET=3Dvxworks
> > ++#elif defined(__wasm32__)
> > ++#  if defined(__EMSCRIPTEN__)
> > ++PLATFORM_TRIPLET=3Dwasm32-emscripten
> > ++#  elif defined(__wasi__)
> > ++#    if defined(_REENTRANT)
> > ++PLATFORM_TRIPLET=3Dwasm32-wasi-threads
> > ++#    else
> > ++PLATFORM_TRIPLET=3Dwasm32-wasi
> > ++#    endif
> > ++#  else
> > ++#    error unknown wasm32 platform
> > ++#  endif
> > ++#elif defined(__wasm64__)
> > ++#  if defined(__EMSCRIPTEN__)
> > ++PLATFORM_TRIPLET=3Dwasm64-emscripten
> > ++#  elif defined(__wasi__)
> > ++PLATFORM_TRIPLET=3Dwasm64-wasi
> > ++#  else
> > ++#    error unknown wasm64 platform
> > ++#  endif
> > ++#else
> > ++# error unknown platform triplet
> > ++#endif
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -927,198 +927,14 @@ fi
> > +
> > +
> > + AC_MSG_CHECKING([for the platform triplet based on compiler character=
istics])
> > +-cat > conftest.c <<EOF
> > +-#undef bfin
> > +-#undef cris
> > +-#undef fr30
> > +-#undef linux
> > +-#undef hppa
> > +-#undef hpux
> > +-#undef i386
> > +-#undef mips
> > +-#undef powerpc
> > +-#undef sparc
> > +-#undef unix
> > +-#if defined(__ANDROID__)
> > +-    # Android is not a multiarch system.
> > +-#elif defined(__linux__)
> > +-# if defined(__x86_64__) && defined(__LP64__)
> > +-        x86_64-linux-gnu
> > +-# elif defined(__x86_64__) && defined(__ILP32__)
> > +-        x86_64-linux-gnux32
> > +-# elif defined(__i386__)
> > +-        i386-linux-gnu
> > +-# elif defined(__aarch64__) && defined(__AARCH64EL__)
> > +-#  if defined(__ILP32__)
> > +-        aarch64_ilp32-linux-gnu
> > +-#  else
> > +-        aarch64-linux-gnu
> > +-#  endif
> > +-# elif defined(__aarch64__) && defined(__AARCH64EB__)
> > +-#  if defined(__ILP32__)
> > +-        aarch64_be_ilp32-linux-gnu
> > +-#  else
> > +-        aarch64_be-linux-gnu
> > +-#  endif
> > +-# elif defined(__alpha__)
> > +-        alpha-linux-gnu
> > +-# elif defined(__ARM_EABI__) && defined(__ARM_PCS_VFP)
> > +-#  if defined(__ARMEL__)
> > +-        arm-linux-gnueabihf
> > +-#  else
> > +-        armeb-linux-gnueabihf
> > +-#  endif
> > +-# elif defined(__ARM_EABI__) && !defined(__ARM_PCS_VFP)
> > +-#  if defined(__ARMEL__)
> > +-        arm-linux-gnueabi
> > +-#  else
> > +-        armeb-linux-gnueabi
> > +-#  endif
> > +-# elif defined(__hppa__)
> > +-        hppa-linux-gnu
> > +-# elif defined(__ia64__)
> > +-        ia64-linux-gnu
> > +-# elif defined(__loongarch__)
> > +-#  if defined(__loongarch_lp64)
> > +-#   if defined(__loongarch_soft_float)
> > +-        loongarch64-linux-gnusf
> > +-#   elif defined(__loongarch_single_float)
> > +-        loongarch64-linux-gnuf32
> > +-#   elif defined(__loongarch_double_float)
> > +-        loongarch64-linux-gnu
> > +-#   else
> > +-#    error unknown platform triplet
> > +-#   endif
> > +-#  else
> > +-#   error unknown platform triplet
> > +-#  endif
> > +-# elif defined(__m68k__) && !defined(__mcoldfire__)
> > +-        m68k-linux-gnu
> > +-# elif defined(__mips_hard_float) && defined(__mips_isa_rev) && (__mi=
ps_isa_rev >=3D6) && defined(_MIPSEL)
> > +-#  if _MIPS_SIM =3D=3D _ABIO32
> > +-        mipsisa32r6el-linux-gnu
> > +-#  elif _MIPS_SIM =3D=3D _ABIN32
> > +-        mipsisa64r6el-linux-gnuabin32
> > +-#  elif _MIPS_SIM =3D=3D _ABI64
> > +-        mipsisa64r6el-linux-gnuabi64
> > +-#  else
> > +-#   error unknown platform triplet
> > +-#  endif
> > +-# elif defined(__mips_hard_float) && defined(__mips_isa_rev) && (__mi=
ps_isa_rev >=3D6)
> > +-#  if _MIPS_SIM =3D=3D _ABIO32
> > +-        mipsisa32r6-linux-gnu
> > +-#  elif _MIPS_SIM =3D=3D _ABIN32
> > +-        mipsisa64r6-linux-gnuabin32
> > +-#  elif _MIPS_SIM =3D=3D _ABI64
> > +-        mipsisa64r6-linux-gnuabi64
> > +-#  else
> > +-#   error unknown platform triplet
> > +-#  endif
> > +-# elif defined(__mips_hard_float) && defined(_MIPSEL)
> > +-#  if _MIPS_SIM =3D=3D _ABIO32
> > +-        mipsel-linux-gnu
> > +-#  elif _MIPS_SIM =3D=3D _ABIN32
> > +-        mips64el-linux-gnuabin32
> > +-#  elif _MIPS_SIM =3D=3D _ABI64
> > +-        mips64el-linux-gnuabi64
> > +-#  else
> > +-#   error unknown platform triplet
> > +-#  endif
> > +-# elif defined(__mips_hard_float)
> > +-#  if _MIPS_SIM =3D=3D _ABIO32
> > +-        mips-linux-gnu
> > +-#  elif _MIPS_SIM =3D=3D _ABIN32
> > +-        mips64-linux-gnuabin32
> > +-#  elif _MIPS_SIM =3D=3D _ABI64
> > +-        mips64-linux-gnuabi64
> > +-#  else
> > +-#   error unknown platform triplet
> > +-#  endif
> > +-# elif defined(__or1k__)
> > +-        or1k-linux-gnu
> > +-# elif defined(__powerpc__) && defined(__SPE__)
> > +-        powerpc-linux-gnuspe
> > +-# elif defined(__powerpc64__)
> > +-#  if defined(__LITTLE_ENDIAN__)
> > +-        powerpc64le-linux-gnu
> > +-#  else
> > +-        powerpc64-linux-gnu
> > +-#  endif
> > +-# elif defined(__powerpc__)
> > +-        powerpc-linux-gnu
> > +-# elif defined(__s390x__)
> > +-        s390x-linux-gnu
> > +-# elif defined(__s390__)
> > +-        s390-linux-gnu
> > +-# elif defined(__sh__) && defined(__LITTLE_ENDIAN__)
> > +-        sh4-linux-gnu
> > +-# elif defined(__sparc__) && defined(__arch64__)
> > +-        sparc64-linux-gnu
> > +-# elif defined(__sparc__)
> > +-        sparc-linux-gnu
> > +-# elif defined(__riscv)
> > +-#  if __riscv_xlen =3D=3D 32
> > +-        riscv32-linux-gnu
> > +-#  elif __riscv_xlen =3D=3D 64
> > +-        riscv64-linux-gnu
> > +-#  else
> > +-#   error unknown platform triplet
> > +-#  endif
> > +-# else
> > +-#   error unknown platform triplet
> > +-# endif
> > +-#elif defined(__FreeBSD_kernel__)
> > +-# if defined(__LP64__)
> > +-        x86_64-kfreebsd-gnu
> > +-# elif defined(__i386__)
> > +-        i386-kfreebsd-gnu
> > +-# else
> > +-#   error unknown platform triplet
> > +-# endif
> > +-#elif defined(__gnu_hurd__)
> > +-        i386-gnu
> > +-#elif defined(__APPLE__)
> > +-        darwin
> > +-#elif defined(__VXWORKS__)
> > +-        vxworks
> > +-#elif defined(__wasm32__)
> > +-#  if defined(__EMSCRIPTEN__)
> > +-    wasm32-emscripten
> > +-#  elif defined(__wasi__)
> > +-#    if defined(_REENTRANT)
> > +-    wasm32-wasi-threads
> > +-#    else
> > +-    wasm32-wasi
> > +-#    endif
> > +-#  else
> > +-#    error unknown wasm32 platform
> > +-#  endif
> > +-#elif defined(__wasm64__)
> > +-#  if defined(__EMSCRIPTEN__)
> > +-    wasm64-emscripten
> > +-#  elif defined(__wasi__)
> > +-    wasm64-wasi
> > +-#  else
> > +-#    error unknown wasm64 platform
> > +-#  endif
> > +-#else
> > +-# error unknown platform triplet
> > +-#endif
> > +-
> > +-EOF
> > +-
> > +-if $CPP $CPPFLAGS conftest.c >conftest.out 2>/dev/null; then
> > +-  PLATFORM_TRIPLET=3D`grep -v '^#' conftest.out | grep -v '^ *$' | tr=
 -d '    '`
> > +-  case "$build_os" in
> > +-  linux-musl*)
> > +-    PLATFORM_TRIPLET=3D`echo "$PLATFORM_TRIPLET" | sed 's/linux-gnu/l=
inux-musl/'`
> > +-    ;;
> > +-  esac
> > ++if $CPP $CPPFLAGS $srcdir/Misc/platform_triplet.c >conftest.out 2>/de=
v/null; then
> > ++  PLATFORM_TRIPLET=3D`grep '^PLATFORM_TRIPLET=3D' conftest.out | tr -=
d '        '`
> > ++  PLATFORM_TRIPLET=3D"${PLATFORM_TRIPLET@%:@PLATFORM_TRIPLET=3D}"
> > +   AC_MSG_RESULT([$PLATFORM_TRIPLET])
> > + else
> > +   AC_MSG_RESULT([none])
> > + fi
> > +-rm -f conftest.c conftest.out
> > ++rm -f conftest.out
> > +
> > + AC_MSG_CHECKING([for multiarch])
> > + AS_CASE([$ac_sys_system],
> > diff --git a/meta/recipes-devtools/python/python3_3.12.3.bb b/meta/reci=
pes-devtools/python/python3_3.12.3.bb
> > index 37afa442fa3..f5f311f61c9 100644
> > --- a/meta/recipes-devtools/python/python3_3.12.3.bb
> > +++ b/meta/recipes-devtools/python/python3_3.12.3.bb
> > @@ -32,6 +32,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/P=
ython-${PV}.tar.xz \
> >             file://0001-gh-114492-Initialize-struct-termios-before-call=
ing-t.patch \
> >             file://0001-test_shutdown-skip-problematic-test.patch \
> >             file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-=
failu.patch \
> > +           file://0001-gh-95855-Refactor-platform-triplet-detection-co=
de-ad.patch \
> >             "
> >
> >  SRC_URI:append:class-native =3D " \
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#200353): https://lists.openembedded.org/g/openembed=
ded-core/message/200353
> > Mute This Topic: https://lists.openembedded.org/mt/106498609/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

