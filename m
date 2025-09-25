Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2608CAC5AA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 04:39:45 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.3893.1758775180272397292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 21:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8zzoWMP;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ea5b80bbfd6so457909276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 21:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758775179; x=1759379979; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kYMJo86VHHlpxsCTXAB80hC/ql1zXQa0K93M9nLceI=;
        b=W8zzoWMP551DNlIVXaXUD6N/wtyw0/1bH2WCzc3fIQAwkRUzDy68fRdPVr00AVoQKR
         5ieNlsblGRJ+yixG2GZ98w6lSbGLGXwUtll2j37/Qy6zIWoRCgNIYh1AZnDW5HfAEIBg
         vMjdtsdE8hEKk4feFmZnaNRkRGjE1EcXfpsk/GH4BK1Hi9jRMgbKIePPXlynIAji06xc
         hFgyKfW7rSMYUL2aNXLqsjHv/UHPhTELAC7J1wQwm7GbGUTRuB/E+F2P0eKfkMu30cg2
         6eUpsY3swoSJ/+X6T7Pbys++B+fvcMmnwQWK7E8JdmsBvkRmFFWCtrxvOXs2mKG/Cs2D
         bSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758775179; x=1759379979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kYMJo86VHHlpxsCTXAB80hC/ql1zXQa0K93M9nLceI=;
        b=FLgtc7AMknGvl0GwxBxrjiq47Bg2pIT6WCSKTHYCErJe0+gpwdf4jhX/WcPPH9pHmS
         qegLe4Td3GAc2HREwjURBirNF0S0bcZHnQhX4/NGHVG6f29Wo3gwW71ZWYtlavmcEmvG
         IKJIQ3aptDHEA36UKV379Dr4NkqY7iJm0Go7m6t7p9D0NDcXYbQGjWU0VM02vPDzn/lr
         oC+LsLyVMmattNI3kMjFiI/Bz3xvsAZhSJsj/gWNsV6VSltH1MjnWfrtCDDx9XD1VXm5
         7fWEwDF8MLeBE77iP2lZeqEZDLV76Tlg8OTgp3Z6bwXlotaxuKNwPGqbsP45T+DfGMA8
         qXVQ==
X-Gm-Message-State: AOJu0YxM8boj+BYLSLjgbjQ97BnfT93ij2E9KI4Uz11iR8GoqRWjGQJ6
	+ni+utiL3MLuvMo1fh4vvsh+2TuF3TtqPhBEHQy71vXg0Yt7spapDqAVrwcmTYwfZFR9V8JJVoh
	PUetDGj7ch9PLrSX0OVaDLhIuDkGwk3Q=
X-Gm-Gg: ASbGncvt7fhPkIxWNZeNhmNK5HmDoY9FkudNi65Tpzac47EINgoYdQ4Lbj1kCt1uaS9
	Agjd0+7z0XdZ05BZ7WRX6oFkiMuLylcn9f+SHNYCYk+7udW0WO9Dbj7cMtaFpdkDpffw0Qd9YAF
	W0di65IYlRJie9IoEyjNJjWqJQMgDBvoNy4sTdXmdd5UcPvMCoToxl17EF8RKUXfd1P/e0o+IM2
	2jXJisOAjq1kpZ/uiUuAA8HCFnk9v6ONozXCzHD2kmQdASbL/P89oB1qzkwDb38Zh7H9VBBkBxr
	G2REZ9M/yoPbdHKx1ZMQE3oBy0XXdLIXH4wlcR4=
X-Google-Smtp-Source: AGHT+IGw7rHKtEQxThNhVad7lotuawMLfpEgaofA1K3bHYpsNRgYm9pA2dL0a48UMmyj1E4V146rdROj/VcwH6RocCI=
X-Received: by 2002:a05:6902:6103:b0:ead:c01d:9c3 with SMTP id
 3f1490d57ef6-eb37fca1d8bmr1620341276.31.1758775179213; Wed, 24 Sep 2025
 21:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250924120834.2886320-1-ross.burton@arm.com> <20250924120834.2886320-6-ross.burton@arm.com>
 <CAMKF1sqNX6evVHckndLkd8m=+GiPd-baPTGywcEJMWVvMkku1A@mail.gmail.com>
In-Reply-To: <CAMKF1sqNX6evVHckndLkd8m=+GiPd-baPTGywcEJMWVvMkku1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Sep 2025 21:39:12 -0700
X-Gm-Features: AS18NWD_ysH8n12vX57hvVCY-JZTQP_t1DOx0a8oDDD-GES6NkKsVi7uVAFDfx0
Message-ID: <CAMKF1sr3VaEtA4prCFLdjJfkypD2JxaZ5v15zTL_5LGG4qW1Sg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 6/7] clang: tell cross-builds of clang how to
 build natively
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 04:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223997

AB also showing same failure

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/953/step=
s/14/logs/stdio

On Wed, Sep 24, 2025 at 9:21=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> I am seeing that target clang is failing to build
>
> FAILED: [code=3D127] NATIVE/bin/clang-tidy-confusable-chars-gen
> /mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/clang/21.1.1/bui=
ld/NATIVE/bin/clang-tidy-confusable-chars-gen
>
> full compile log is here
>
> https://termbin.com/qct7
>
> On Wed, Sep 24, 2025 at 5:09=E2=80=AFAM Ross Burton via lists.openembedde=
d.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > If we pass CROSS_TOOLCHAIN_FLAGS_NATIVE to all the builds, instead of
> > just nativesdk, then clang can correctly build its own native tools as
> > needed.
> >
> > This means we can stop manually installing clang-tidy-confusable-chars-=
gen
> > as clang-tidy will build it.  We (currently) still build the tblgen
> > binaries once as they're used in several recipes so there's likely valu=
e
> > in building those once.
> >
> > Also consolidate the LLVM_TABLEGEN variables as they're not specific to
> > a particular class.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-devtools/clang/clang_git.bb | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-de=
vtools/clang/clang_git.bb
> > index 998c1731f2f..9ccb81a5308 100644
> > --- a/meta/recipes-devtools/clang/clang_git.bb
> > +++ b/meta/recipes-devtools/clang/clang_git.bb
> > @@ -120,14 +120,13 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOF=
F \
> >                    -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD}'=
 \
> >                    -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPER=
IMENTAL_TARGETS_TO_BUILD}' \
> >                    -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
> > -                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/l=
lvm-min-tblgen \
> > +                  -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblg=
en \
> > +                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-=
tblgen \
> >                    -DLLVM_INCLUDE_TESTS=3DOFF \
> > +                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_=
FILE=3D${WORKDIR}/toolchain-native.cmake' \
> >  "
> >
> >  EXTRA_OECMAKE:append:class-nativesdk =3D "\
> > -                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_=
FILE=3D${WORKDIR}/toolchain-native.cmake' \
> > -                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-=
tblgen \
> > -                  -DCLANG_TIDY_CONFUSABLE_CHARS_GEN=3D${STAGING_BINDIR=
_NATIVE}/clang-tidy-confusable-chars-gen \
> >                    -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGE=
T_PREFIX}llvm-ranlib \
> >                    -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PR=
EFIX}llvm-ar \
> >                    -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PR=
EFIX}llvm-nm \
> > @@ -205,7 +204,6 @@ do_install:append:class-native () {
> >      if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false'=
, d)}; then
> >          install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}$=
{bindir}/clangd-indexer
> >      fi
> > -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-ch=
ars-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
> >
> >      for f in `find ${D}${bindir} -executable -type f -not -type l`; do
> >          test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
> > @@ -225,7 +223,6 @@ do_install:append:class-nativesdk () {
> >          install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}$=
{bindir}/clangd-indexer
> >      fi
> >      install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindi=
r}/clang-tblgen
> > -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-ch=
ars-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
> >      for f in `find ${D}${bindir} -executable -type f -not -type l`; do
> >          test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
> >      done
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#223972): https://lists.openembedded.org/g/openembed=
ded-core/message/223972
> > Mute This Topic: https://lists.openembedded.org/mt/115410450/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

