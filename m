Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9337C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 17:00:13 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.83300.1752512407765105030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 10:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mhcCURpi;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8b3cc05665so3510888276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 10:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752512407; x=1753117207; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VLI05yX8eSvcjhUMufrKOlysAT5KgdzIY4pfVf6Tbo=;
        b=mhcCURpi+kAJufqVATUOyRqsXcmwI7oSlumht7ES31gINquuu2QDSYglNuNe/f28Do
         /IIJB7VvVWGl0/9Y1wmzDb4dKposYG7W+pjkIQHETVjb3E5368Wme+D1+Ji9UeZn0WFj
         SOx0C50E6obbh4YYGaSFERtG/yitywpkyqOIMxjrF+zrsDDZwxJRhyZ9qvjuFGgjl3H/
         GBctwXXLuq4LeM/cKIcywsM08rDqRRyCl+dEdxuD3xoI5cq9M+Dm9Ok+kEsJ8rKZXg8+
         mVGK5YktdbzNd9FDdNpwkhpbIj5necKLw8iHrIl4vWFKW5+nNx+IJUytK4ww0Vh/Iu3H
         Hh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752512407; x=1753117207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VLI05yX8eSvcjhUMufrKOlysAT5KgdzIY4pfVf6Tbo=;
        b=j3N+PrpDyLITWKKl0OKyDz+gLXk75E8uBzEKnDQ99N4zeehJzbdFHbYATmfqZyTJ/b
         tkW0Wj2u6rP+npr9Ch2kEv1ogoQQkD/TmdSXKY2HJ+/R+OhnqqV9mJSfa0pvMRMYSFgL
         MNsQM/L6a18TUrIZVZQt055UGDWqp0lbYsFydrAuq2ieVbHMpjMIsdtt3ZRNRMwJ4aMp
         bDPJ+TKYhtuOWMMvPoK3LHNnEO6B0x8Z4RhYyk3mvicQ5YidzArKT002phQSPR/mWmh4
         6KmbRL9eqUdZpsXdED9Umee/6XHJCYBI3du5Viu1lLDpLpUukKjv6ru53mieDx6EvzrA
         eh1A==
X-Gm-Message-State: AOJu0Yz9zPkTlerR2Xffih80cpV4MnoeJf9ghe59oYeWASQQGkn19ROQ
	ufUTm/pd/h0MWnK5WjNwfMtfZsx37WigYxYHW/2O5fv4x0253eMC5Hucx8o/kG4tqU0LAGcUn6K
	4aDC7uP9PVj1ZMRVd2UKc9JnbRUp36GyhjGfXeH4=
X-Gm-Gg: ASbGncvCl8gubmPF2d1c/d4fgUYZb2u/7keQJax8HxtXaPPcNZVqFA0KYDyiAMZiaMI
	GBONf1z0IcpyldepL249fYhC6y+DxokNxR0tN6VGYfDgiiIXQpGvplW58G7lItZGlJHub2Lx2ia
	KJLfKoupeaqTx60/8ClfKp4KxuEKfkohPsDkvjdzgLDTP1QyepwmNjofTF4RjAwxptHIqQLdjkH
	WH0Ppyg3Vi2MkW02gqLPdWo2Sx4xDeEcmaR
X-Google-Smtp-Source: AGHT+IECwYGFRPN62JDoi74wp8EQGPI6IYuTPpjxHuDKqKm1a8pSijjluLRQ9GoxYZ+1vePWV1VYOJMAQY+QB0qCMoA=
X-Received: by 2002:a05:690c:18:b0:70a:2675:70b3 with SMTP id
 00721157ae682-717d5dac165mr200928497b3.17.1752512405931; Mon, 14 Jul 2025
 10:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250506201127.4188369-1-raj.khem@gmail.com> <bbda64ad-2bee-4679-9e07-5b1a82a6aac5@gmail.com>
In-Reply-To: <bbda64ad-2bee-4679-9e07-5b1a82a6aac5@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Jul 2025 09:59:39 -0700
X-Gm-Features: Ac12FXw34dHdQuF4pyEcu3kfuHRn92uScQisbE7pe5awUuhj136SaKY0oHDG9Cs
Message-ID: <CAMKF1spFQiiGvi3q5Om4J9pNu1Efufk3=Dv_1AN6YrxZWfPBCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] compiler-rt: Always use clang for compiler
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220254

On Mon, Jul 14, 2025 at 8:03=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> I realize that this is a fairly old commit... anyway.
>
> During the weekend I decided to update a personal project of mine to the
> tip of master, but after performing the main required changes, I faced
> compiler-rt build failures, complaining about unrecognized -mcpu
> argument during the compiler sanity check in do_configure[1].
> Bisecting oe-core points to this commit. The project I'm using uses
> -mcpu=3Dcortex-a72.cortex-a53+crc+crypto (DEFAULTTUNE =3D
> "cortexa72-cortexa53-crypto"), which is not accepted after this change.
>
> Is this a user error, and I'm supposed to change something after this
> revision, or is this a regression?

clang has differences in syntax for big.LITTLE arm systems sadly. In meta-c=
lang
we have a fix for this
https://github.com/kraj/meta-clang/blob/master/classes/clang-legacy.bbclass=
#L25-L38

We need to do something similar in either clang bbclass or in recipes
using toolchain-clang
override.

>
> Thanks
>
> [1]:
> https://gist.github.com/OldManYellsAtCloud/1e0a931a815a054a35cf61792e529b=
70
>
> On 5/6/25 22:11, Khem Raj via lists.openembedded.org wrote:
> > This makes it build for all architectures e.g. riscv/mips/ppc etc.
> >
> > Using clang-native to build all variants of recipe makes it easier to
> > handle compiling with various distros choosing different runtimes
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Fix builds when using clang as default system compiler
> >
> >  .../recipes-devtools/clang/compiler-rt_git.bb | 29 ++++++++++++-------
> >  1 file changed, 18 insertions(+), 11 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/reci=
pes-devtools/clang/compiler-rt_git.bb
> > index 93928541273..a0f9c769a06 100644
> > --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
> > +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
> > @@ -32,15 +32,15 @@ DEPENDS:append:class-nativesdk =3D " virtual/cross-=
c++ clang-native clang-crosssdk
> >  DEPENDS:append:class-native =3D " clang-native"
> >
> >  # Trick clang.bbclass into not creating circular dependencies
> > -UNWINDLIB:class-nativesdk:toolchain-clang =3D "--unwindlib=3Dlibgcc"
> > -COMPILER_RT:class-nativesdk:toolchain-clang =3D "-rtlib=3Dlibgcc --unw=
indlib=3Dlibgcc"
> > -LIBCPLUSPLUS:class-nativesdk:toolchain-clang =3D "-stdlib=3Dlibstdc++"
> > -UNWINDLIB:class-native:toolchain-clang =3D "--unwindlib=3Dlibgcc"
> > -COMPILER_RT:class-native:toolchain-clang =3D "-rtlib=3Dlibgcc --unwind=
lib=3Dlibgcc"
> > -LIBCPLUSPLUS:class-native:toolchain-clang =3D "-stdlib=3Dlibstdc++"
> > -UNWINDLIB:class-target:toolchain-clang =3D "--unwindlib=3Dlibgcc"
> > -COMPILER_RT:class-target:toolchain-clang =3D "-rtlib=3Dlibgcc --unwind=
lib=3Dlibgcc"
> > -LIBCPLUSPLUS:class-target:toolchain-clang =3D "-stdlib=3Dlibstdc++"
> > +UNWINDLIB:class-nativesdk =3D "--unwindlib=3Dlibgcc"
> > +COMPILER_RT:class-nativesdk =3D "-rtlib=3Dlibgcc"
> > +LIBCPLUSPLUS:class-nativesdk =3D "-stdlib=3Dlibstdc++"
> > +UNWINDLIB:class-native =3D "--unwindlib=3Dlibgcc"
> > +COMPILER_RT:class-native =3D "-rtlib=3Dlibgcc"
> > +LIBCPLUSPLUS:class-native =3D "-stdlib=3Dlibstdc++"
> > +UNWINDLIB:class-target =3D "--unwindlib=3Dlibgcc"
> > +COMPILER_RT:class-target =3D "-rtlib=3Dlibgcc"
> > +LIBCPLUSPLUS:class-target =3D "-stdlib=3Dlibstdc++"
> >
> >  PACKAGECONFIG ??=3D ""
> >  PACKAGECONFIG[crt] =3D "-DCOMPILER_RT_BUILD_CRT:BOOL=3DON,-DCOMPILER_R=
T_BUILD_CRT:BOOL=3DOFF"
> > @@ -52,6 +52,13 @@ HF =3D ""
> >  HF:class-target =3D "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard=
', 'hf', '', d)}"
> >  HF[vardepvalue] =3D "${HF}"
> >
> > +CC =3D "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTION=
S}"
> > +CXX =3D "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPT=
IONS}"
> > +BUILD_CC =3D "${CCACHE}clang ${BUILD_CC_ARCH}"
> > +BUILD_CXX =3D "${CCACHE}clang++ ${BUILD_CC_ARCH}"
> > +LDFLAGS +=3D "${COMPILER_RT} ${UNWINDLIB}"
> > +CXXFLAGS +=3D "${LIBCPLUSPLUS}"
> > +
> >  OECMAKE_TARGET_COMPILE =3D "compiler-rt"
> >  OECMAKE_TARGET_INSTALL =3D "install-compiler-rt install-compiler-rt-he=
aders"
> >  OECMAKE_SOURCEPATH =3D "${S}/llvm"
> > @@ -72,7 +79,7 @@ EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebIn=
fo \
> >
> >  EXTRA_OECMAKE:append:class-native =3D "\
> >                    -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D${HOST_ARCH} \
> > -                  -DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH} \
> > +                  -DCMAKE_C_COMPILER_TARGET=3D${HOST_SYS} \
> >  "
> >
> >  EXTRA_OECMAKE:append:class-target =3D "\
> > @@ -89,7 +96,7 @@ EXTRA_OECMAKE:append:class-nativesdk =3D "\
> >                 -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFI=
X}llvm-nm \
> >                 -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen =
\
> >                 -DCLANG_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/clang-tblge=
n \
> > -               -DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-=
${HOST_OS}${HF} \
> > +               -DCMAKE_C_COMPILER_TARGET=3D${HOST_SYS} \
> >  "
> >  EXTRA_OECMAKE:append:powerpc =3D " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=
=3Dpowerpc "
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#216082): https://lists.openembedded.org/g/openembed=
ded-core/message/216082
> > Mute This Topic: https://lists.openembedded.org/mt/112656561/6084445
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

