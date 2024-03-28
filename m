Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBDCCD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:59:55 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.1871.1711645187250819495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JFl65xmT;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2297d0d6013so722257fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711645186; x=1712249986; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuYdOD3Rop2D15A4Fkzs3HTQ0EK8rZRg+1D/0MNi8lY=;
        b=JFl65xmT6gzVaqLmB502x4wdOrUKUfiUiO+L558as3GMGN2pe881QNJvbX5Jc+Abbt
         7w500ZeSpTyw+yQJuXRzo42y968uKqUYiMwoioBnO1YjkMHuzDqGRrkfDiHybHy3RiwD
         q1O6K9bJgKa/o1qLUPzOieEvim8/WEf2vzYST0NE6iG7E1H32bDCp9yr/KoS2LZgUNBm
         SDPsnbLudWTS+3f0cpjqULF+oKz4SjFm6tZePtcKgw3B2BsEKsYZ1UYD8jo6K8PkEIWU
         jFD7QKX9RLeCYjtSiD+RbopTJY2/UzXkCcdeRG/PkJR+WelpLE0T6TclMBqvlvmWS7Nd
         xw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711645186; x=1712249986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuYdOD3Rop2D15A4Fkzs3HTQ0EK8rZRg+1D/0MNi8lY=;
        b=mujJwuIUhlFMtJ3vWoRw7oEeu2XQO9fyeEcJ/HhUu9a1r3LsCwKJcGEWp8uzvnPXMv
         IPKPAs5GY6Je7HjGDYcUIRkSOjuZJ9t0h85SJltRYbxKxIRia8Bz/r3bc1bKeLP74ndA
         rQiLl6yuNHg9nFug6saAxkZHwAqIr2FA4RUxOJfi17fnwTz6ImbhpxFzQRkepQuA2jx7
         uzDmTx0mE2+ixMPSW/3qqRiQTPhMGQxE+P6tt+lF+JBLobHmuJP09a4BN53/qK3QAyJV
         MvvskzhoeblEkeG50vRtn27ZYxcsBNrIa1eiQqEeFVjHE+8AW64Y2ppRm/ubK8rrqSR0
         HYZQ==
X-Gm-Message-State: AOJu0Yza8yGohNFwJFH3/mYGHjxJ9k7eBf6E9jpixyzauAaTuh9zLLMd
	e2HROuBSEOK7tEgXywMNq0oKxOAUXLgvcd14pa793y9ssinwnmENodtdGMPBHSYIQYxcE15Y5ms
	zcxPOQg666odjoSt96/qpRV2wxretrBUq
X-Google-Smtp-Source: AGHT+IGylZEpnOnzzw2FJI0waTXMFxVHUcSogwTuvj21tBygQ5zkbvolGb+SeW2CGhmshmM417lNaa+rfJ4p0D4H2/A=
X-Received: by 2002:a05:6871:88b:b0:22a:107c:4ddf with SMTP id
 r11-20020a056871088b00b0022a107c4ddfmr3596691oaq.23.1711645186432; Thu, 28
 Mar 2024 09:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240328154340.503623-1-daniel.mcgregor@vecima.com>
 <CAMKF1sr9_08xAKaVjEFaraUZtUxcuCTowUj1yM0YKveSB0SkBQ@mail.gmail.com> <CACS+7ZTwJ_0-JA2fSSetW99YpkNprTA4TcrQR3BwKe6=P-TzjQ@mail.gmail.com>
In-Reply-To: <CACS+7ZTwJ_0-JA2fSSetW99YpkNprTA4TcrQR3BwKe6=P-TzjQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2024 09:59:20 -0700
Message-ID: <CAMKF1so5H11Gwq4unRiDXm=gaae+zp+8YPWGFmceUhvjC0COwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Allow using libc++
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197596

On Thu, Mar 28, 2024 at 9:29=E2=80=AFAM Dan McGregor <danismostlikely@gmail=
.com> wrote:
>
> On Thu, 28 Mar 2024 at 10:11, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Mar 28, 2024 at 8:43=E2=80=AFAM Dan McGregor <danismostlikely@g=
mail.com> wrote:
> > >
> > > With the addition of the C++ runtime setting added recently, allow
> > > gcc to use libc++ as its runtime. There's some minor fixes still
> > > required, such as allowing setting the unwinder library. But this
> > > allows for testing libc++ with gcc.
> > >
> > > Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> > > ---
> > >  meta/recipes-devtools/gcc/gcc-13.2.inc           | 6 ------
> > >  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 +
> > >  meta/recipes-devtools/gcc/gcc-cross.inc          | 1 +
> > >  meta/recipes-devtools/gcc/gcc-target.inc         | 1 +
> > >  4 files changed, 3 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-de=
vtools/gcc/gcc-13.2.inc
> > > index 603377a49a2..a19ceadeaae 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-13.2.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
> > > @@ -109,11 +109,5 @@ EXTRA_OECONF_INITIAL =3D "\
> > >      --disable-libssp \
> > >  "
> > >
> > > -EXTRA_OECONF_PATHS =3D "\
> > > -    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BIN=
V} \
> > > -    --with-sysroot=3D/not/exist \
> > > -    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > > -"
> >
> > this include is used by almost all of gcc based recipes including
> > runtime libraries
> > if we remove it here, then I guess they will be impacted in some way.
> > e.g. libgcc
> > Can you check what the effect is ?
>
> All of the recipes I looked at explicitly set this value
> independently, either in the recipe, or another common(ish) include
> file.
> I thought about leaving this in, but it threw me off when I started
> this, so I figured it's best to remove it so others don't hit the same
> issue.

If it is redundant then perhaps its ok, I would suggest to do nativesdk bui=
lds
and mingw builds with this change.

>
> >
> > > -
> > >  CVE_STATUS[CVE-2021-37322] =3D "cpe-incorrect: Is a binutils 2.26 is=
sue, not gcc"
> > >  CVE_STATUS[CVE-2023-4039] =3D "fixed-version: Fixed via CVE-2023-403=
9.patch included here. Set the status explictly to deal with all recipes th=
at share the gcc-source"
> > > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/=
recipes-devtools/gcc/gcc-cross-canadian.inc
> > > index ec87b462193..7c4233c2115 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > @@ -12,6 +12,7 @@ require gcc-configure-common.inc
> > >  EXTRA_OECONF +=3D "--with-plugin-ld=3Dld"
> > >  EXTRA_OECONF_PATHS =3D "\
> > >      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BI=
NV} \
> > > +    --with-gxx-libcxx-include-dir=3D/not/exist${target_includedir}/c=
++/v1 \
> > >      --with-build-time-tools=3D${STAGING_DIR_NATIVE}${prefix_native}/=
${TARGET_SYS}/bin \
> > >      --with-sysroot=3D/not/exist \
> > >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-d=
evtools/gcc/gcc-cross.inc
> > > index a540fb2434a..5b0ca15d476 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > > @@ -37,6 +37,7 @@ EXTRA_OECONF:remove:libc-newlib =3D "--enable-threa=
ds=3Dposix"
> > >
> > >  EXTRA_OECONF_PATHS =3D "\
> > >      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BI=
NV} \
> > > +    --with-gxx-libcxx-include-dir=3D/not/exist${target_includedir}/c=
++/v1 \
> > >      --with-sysroot=3D/not/exist \
> > >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > >  "
> > > diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-=
devtools/gcc/gcc-target.inc
> > > index 7dac3ef422c..82da5ef82be 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-target.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> > > @@ -2,6 +2,7 @@ GCCMULTILIB =3D "--enable-multilib"
> > >  require gcc-configure-common.inc
> > >
> > >  EXTRA_OECONF_PATHS =3D "\
> > > +    --with-gxx-libcxx-include-dir=3D${target_includedir}/c++/v1 \
> > >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > >  "
> > >
> > > --
> > > 2.41.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#197582): https://lists.openembedded.org/g/openemb=
edded-core/message/197582
> > > Mute This Topic: https://lists.openembedded.org/mt/105199106/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

