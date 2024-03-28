Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAEECD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 17:07:15 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.2101.1711645626516028128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 10:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aEKwUaOy;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-61130dd21c1so12879387b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711645625; x=1712250425; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Z1E7GZgxzoeWlZSljYopPPeS3212VjES5//Yc3PEMU=;
        b=aEKwUaOym6v6wP/fvOT2kNF2aobSyJoVxAuUrFVdkr4Lv4H+n+H6Im+jhcvW8sJ6DV
         7jNjc0kmVwaO4fbKzuM+XcEMKO4qsngUQ1vM3AGnRLnDjXSnvgGdbt9605hz4nQ8KMkj
         Ahe3+9P4/OAv/0xqAzyfhf/DN2J9bD3x2eW4ktZ2Wq6uuG2ShPmsjUrnFU+QCCXZDsSS
         Zix0/brqyqPOy8C3GIV675/Bv5ioA6/xE1dt9dwnZSyYKTOTd5OJ8X92jkAX/lRI6MTG
         HkwjV3KLRyjdaI3G4yUFlVhg3x/EIvvFmTViQgS+PI9XQKBuX0aCZrzCRWi29mUXgM9J
         c7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711645626; x=1712250426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Z1E7GZgxzoeWlZSljYopPPeS3212VjES5//Yc3PEMU=;
        b=P5UwonlcMYZSdH2uK/hWjJsAinKqnmEGu41qv0pmiW5GwpHo6Frb3DeKe813H5kR7m
         wqdOTlV1KdJukCCZwVlb3pAiVAxDmfzqI/sGXAV5VyZ1MI9MqP0w01G6X/HgbkRAHJsw
         1UAs3Xchdtt7ivXmR2vezA/KrpksWNRHYMhaQ+G80nadWiICHPLCUqNM2pC7wO2YJ1Qp
         yxA822GnX8L1tOM0m6g0rJE/bUqNz/cUuQCZO6HZhAtC2UfyM6rdMtNUzHwTql9GTdb4
         zHhkjPPcE+TK2tItsey0SiT81TszxHOMwnYdDUzSNYqRMm47DSfGFSku7lMkbl0kgohT
         As3Q==
X-Gm-Message-State: AOJu0YzryOXpSvyq8JQu9DaSCCDNeZmkx7OaEnuAsHch78UnUWjplkdz
	mEThxWCjOoCNLlNYfxEr6DAYHQIgtINRjO0QKzpVDUrKfL0ILJuflQ77NKSH7CaR6nSOMKZxgHE
	/LTqFiGjsNfBHGXQvlYLSHN3Czw8=
X-Google-Smtp-Source: AGHT+IE4GH+HroUzvnN6Mc24ZV2NKt6ih6WI03yyRtcdshMFZoabvXqJAvkfAyu41jH5XJkuF3oWxOfLoLgvcSCdOxg=
X-Received: by 2002:a81:9216:0:b0:60a:1d7d:c0de with SMTP id
 j22-20020a819216000000b0060a1d7dc0demr70188ywg.16.1711645625665; Thu, 28 Mar
 2024 10:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240328154340.503623-1-daniel.mcgregor@vecima.com>
 <CAMKF1sr9_08xAKaVjEFaraUZtUxcuCTowUj1yM0YKveSB0SkBQ@mail.gmail.com>
 <CACS+7ZTwJ_0-JA2fSSetW99YpkNprTA4TcrQR3BwKe6=P-TzjQ@mail.gmail.com> <CAMKF1so5H11Gwq4unRiDXm=gaae+zp+8YPWGFmceUhvjC0COwA@mail.gmail.com>
In-Reply-To: <CAMKF1so5H11Gwq4unRiDXm=gaae+zp+8YPWGFmceUhvjC0COwA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 28 Mar 2024 11:06:54 -0600
Message-ID: <CACS+7ZSWRzc1uRhquGtdB_FpkRO-ZKq8JOq2D26dwUhyWeXF7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Allow using libc++
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 17:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197598

On Thu, 28 Mar 2024 at 10:59, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 28, 2024 at 9:29=E2=80=AFAM Dan McGregor <danismostlikely@gma=
il.com> wrote:
> >
> > On Thu, 28 Mar 2024 at 10:11, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Thu, Mar 28, 2024 at 8:43=E2=80=AFAM Dan McGregor <danismostlikely=
@gmail.com> wrote:
> > > >
> > > > With the addition of the C++ runtime setting added recently, allow
> > > > gcc to use libc++ as its runtime. There's some minor fixes still
> > > > required, such as allowing setting the unwinder library. But this
> > > > allows for testing libc++ with gcc.
> > > >
> > > > Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> > > > ---
> > > >  meta/recipes-devtools/gcc/gcc-13.2.inc           | 6 ------
> > > >  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 +
> > > >  meta/recipes-devtools/gcc/gcc-cross.inc          | 1 +
> > > >  meta/recipes-devtools/gcc/gcc-target.inc         | 1 +
> > > >  4 files changed, 3 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-=
devtools/gcc/gcc-13.2.inc
> > > > index 603377a49a2..a19ceadeaae 100644
> > > > --- a/meta/recipes-devtools/gcc/gcc-13.2.inc
> > > > +++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
> > > > @@ -109,11 +109,5 @@ EXTRA_OECONF_INITIAL =3D "\
> > > >      --disable-libssp \
> > > >  "
> > > >
> > > > -EXTRA_OECONF_PATHS =3D "\
> > > > -    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${B=
INV} \
> > > > -    --with-sysroot=3D/not/exist \
> > > > -    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > > > -"
> > >
> > > this include is used by almost all of gcc based recipes including
> > > runtime libraries
> > > if we remove it here, then I guess they will be impacted in some way.
> > > e.g. libgcc
> > > Can you check what the effect is ?
> >
> > All of the recipes I looked at explicitly set this value
> > independently, either in the recipe, or another common(ish) include
> > file.
> > I thought about leaving this in, but it threw me off when I started
> > this, so I figured it's best to remove it so others don't hit the same
> > issue.
>
> If it is redundant then perhaps its ok, I would suggest to do nativesdk b=
uilds
> and mingw builds with this change.

Ah, yes. I didn't try mingw. I did try nativesdk, though.

>
> >
> > >
> > > > -
> > > >  CVE_STATUS[CVE-2021-37322] =3D "cpe-incorrect: Is a binutils 2.26 =
issue, not gcc"
> > > >  CVE_STATUS[CVE-2023-4039] =3D "fixed-version: Fixed via CVE-2023-4=
039.patch included here. Set the status explictly to deal with all recipes =
that share the gcc-source"
> > > > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/met=
a/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > > index ec87b462193..7c4233c2115 100644
> > > > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > > @@ -12,6 +12,7 @@ require gcc-configure-common.inc
> > > >  EXTRA_OECONF +=3D "--with-plugin-ld=3Dld"
> > > >  EXTRA_OECONF_PATHS =3D "\
> > > >      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${=
BINV} \
> > > > +    --with-gxx-libcxx-include-dir=3D/not/exist${target_includedir}=
/c++/v1 \
> > > >      --with-build-time-tools=3D${STAGING_DIR_NATIVE}${prefix_native=
}/${TARGET_SYS}/bin \
> > > >      --with-sysroot=3D/not/exist \
> > > >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > > > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes=
-devtools/gcc/gcc-cross.inc
> > > > index a540fb2434a..5b0ca15d476 100644
> > > > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > > > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > > > @@ -37,6 +37,7 @@ EXTRA_OECONF:remove:libc-newlib =3D "--enable-thr=
eads=3Dposix"
> > > >
> > > >  EXTRA_OECONF_PATHS =3D "\
> > > >      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${=
BINV} \
> > > > +    --with-gxx-libcxx-include-dir=3D/not/exist${target_includedir}=
/c++/v1 \
> > > >      --with-sysroot=3D/not/exist \
> > > >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > > >  "
> > > > diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipe=
s-devtools/gcc/gcc-target.inc
> > > > index 7dac3ef422c..82da5ef82be 100644
> > > > --- a/meta/recipes-devtools/gcc/gcc-target.inc
> > > > +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> > > > @@ -2,6 +2,7 @@ GCCMULTILIB =3D "--enable-multilib"
> > > >  require gcc-configure-common.inc
> > > >
> > > >  EXTRA_OECONF_PATHS =3D "\
> > > > +    --with-gxx-libcxx-include-dir=3D${target_includedir}/c++/v1 \
> > > >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > > >  "
> > > >
> > > > --
> > > > 2.41.0
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#197582): https://lists.openembedded.org/g/opene=
mbedded-core/message/197582
> > > > Mute This Topic: https://lists.openembedded.org/mt/105199106/199791=
4
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

