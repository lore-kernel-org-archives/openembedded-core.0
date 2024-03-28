Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A41CD11DF
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 21:34:32 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.3646.1711661668892852096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 14:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lwSbId4f;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: danismostlikely@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso1074764276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 14:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711661668; x=1712266468; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQCTyUOftnMvcDyNrYc+YBCRArAnUBJ5AYy+45L8b8c=;
        b=lwSbId4fUTxVer8XGHBmHu08UMDJdu/AkMlzjhdt79I+FFkc2cVb4eHUGZf59ZJCP4
         JkhUbzGt/i6mDofTp0F0sVZp4cvvpCnj1de2RUdyswOmwg7J6Gcg2faS82Q8dtCmsvrV
         hJq3w76yfL/QQnT7WBLPR+TjG8VGxYAAIMJGt7gzgjEVUJ7TN7h4+xYc5GOYCnVogY0j
         4MKUFQhcD+JFQm5cQzEsyHHpoumA6R1QeMsZhY3rH7tMWBtceT2d1ksaL0xYVHWxBH1K
         GjqmT82srITx2E0oeGqb1/VuNJbwGEwRryf2mhhHeHSFHV43cs8oB/HDUxvzwmv1InNT
         u+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711661668; x=1712266468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQCTyUOftnMvcDyNrYc+YBCRArAnUBJ5AYy+45L8b8c=;
        b=LVT91jNBnJiZKzplqu6KSDcpomwkULFfdR+WmWnYc7IQskeBEWeme/g75cm9/435MP
         TUgOsCo+WmXdXz7twNObLLq0UXVIr5hIGFPvP5wbF1WmY2M9gpVehOvA5k8VshHlZDy3
         GLPksUCmknhzmIjrXXv960CuCiZBr/XgadV9l19U7fpqzuJXuhIBz2ykCgLw7e514XHY
         tkkqsoCELlypm95qrNX/R8KucY//fkU78Hf7xnUJ+lqyAInK03yQiHDAgvt+pl356WBG
         M0HQNyEhaT3Go+IcWJJeQ6FaOwuESWSA9LRwCBWXB8RWvEYVc2Y0S88bnZJjdzpzoKGm
         gzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH2fu7GIYIzyu/QmHAtmJrRPwUOsTqIL7j8nWxft8EVT7cS1abi70yafMHOQFX5PS3yH5BCcE1y/oCWw/GM2GNcSrSdVnq4Wh4qw/zbwo0GNXQqIY4jjlC
X-Gm-Message-State: AOJu0YyP6srJ/xGZ8fgCmreT/JmGq/CoyYtrkfNc6XIlqOYB1DukRcQF
	sXFJzx8df/9BasrAHKzAHN8l7nUtk47Ni3ISxFIMgrHwy+EcL9y59qXERdQhSEebWK/D2nYPBAH
	KbJLnVQ0AVzNWjhDFVM4K7f+gekU=
X-Google-Smtp-Source: AGHT+IHuDpXwSZ1Pxoh+TQBKuH1GyzqyWVGDj4yglXaTYd5XRWiESLXYtsd8RdyZrPi9XfrCJuwo419n4Ry2siSmdvY=
X-Received: by 2002:a25:b2a4:0:b0:dc7:48f8:1d07 with SMTP id
 k36-20020a25b2a4000000b00dc748f81d07mr588560ybj.21.1711661667984; Thu, 28 Mar
 2024 14:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240328154340.503623-1-daniel.mcgregor@vecima.com>
 <CAMKF1sr9_08xAKaVjEFaraUZtUxcuCTowUj1yM0YKveSB0SkBQ@mail.gmail.com>
 <CACS+7ZTwJ_0-JA2fSSetW99YpkNprTA4TcrQR3BwKe6=P-TzjQ@mail.gmail.com>
 <CAMKF1so5H11Gwq4unRiDXm=gaae+zp+8YPWGFmceUhvjC0COwA@mail.gmail.com> <17C0FCA0F8780678.1578@lists.openembedded.org>
In-Reply-To: <17C0FCA0F8780678.1578@lists.openembedded.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 28 Mar 2024 15:34:17 -0600
Message-ID: <CACS+7ZR1RwDVFNSoYzpREJiaqWqQDSpeEEs8oHmOaArCj2rYuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Allow using libc++
To: danismostlikely@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 21:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197609

On Thu, 28 Mar 2024 at 11:07, Dan McGregor via lists.openembedded.org
<danismostlikely=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Thu, 28 Mar 2024 at 10:59, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Mar 28, 2024 at 9:29=E2=80=AFAM Dan McGregor <danismostlikely@g=
mail.com> wrote:
> > >
> > > On Thu, 28 Mar 2024 at 10:11, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Thu, Mar 28, 2024 at 8:43=E2=80=AFAM Dan McGregor <danismostlike=
ly@gmail.com> wrote:
> > > > >
> > > > > With the addition of the C++ runtime setting added recently, allo=
w
> > > > > gcc to use libc++ as its runtime. There's some minor fixes still
> > > > > required, such as allowing setting the unwinder library. But this
> > > > > allows for testing libc++ with gcc.
> > > > >
> > > > > Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> > > > > ---
> > > > >  meta/recipes-devtools/gcc/gcc-13.2.inc           | 6 ------
> > > > >  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 +
> > > > >  meta/recipes-devtools/gcc/gcc-cross.inc          | 1 +
> > > > >  meta/recipes-devtools/gcc/gcc-target.inc         | 1 +
> > > > >  4 files changed, 3 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipe=
s-devtools/gcc/gcc-13.2.inc
> > > > > index 603377a49a2..a19ceadeaae 100644
> > > > > --- a/meta/recipes-devtools/gcc/gcc-13.2.inc
> > > > > +++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
> > > > > @@ -109,11 +109,5 @@ EXTRA_OECONF_INITIAL =3D "\
> > > > >      --disable-libssp \
> > > > >  "
> > > > >
> > > > > -EXTRA_OECONF_PATHS =3D "\
> > > > > -    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/$=
{BINV} \
> > > > > -    --with-sysroot=3D/not/exist \
> > > > > -    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > > > > -"
> > > >
> > > > this include is used by almost all of gcc based recipes including
> > > > runtime libraries
> > > > if we remove it here, then I guess they will be impacted in some wa=
y.
> > > > e.g. libgcc
> > > > Can you check what the effect is ?
> > >
> > > All of the recipes I looked at explicitly set this value
> > > independently, either in the recipe, or another common(ish) include
> > > file.
> > > I thought about leaving this in, but it threw me off when I started
> > > this, so I figured it's best to remove it so others don't hit the sam=
e
> > > issue.
> >
> > If it is redundant then perhaps its ok, I would suggest to do nativesdk=
 builds
> > and mingw builds with this change.
>
> Ah, yes. I didn't try mingw. I did try nativesdk, though.

Okay, so I tested this out with mingw and nativesdk again. libgcc,
libgcc-initial, nativesdk-libgcc-initial, and nativesdk-libgcc lose
the extra paths settings, but they also don't use them. Those settings
are used to configure the compiler itself, and the build gets the
sysroot settings and such directly from our cross compiler.

So I think setting this here is unnecessary. If we really want to set
those values for libgcc* maybe I can put them in libgcc-common.inc.

>
> >
> > >
> > > >
> > > > > -
> > > > >  CVE_STATUS[CVE-2021-37322] =3D "cpe-incorrect: Is a binutils 2.2=
6 issue, not gcc"
> > > > >  CVE_STATUS[CVE-2023-4039] =3D "fixed-version: Fixed via CVE-2023=
-4039.patch included here. Set the status explictly to deal with all recipe=
s that share the gcc-source"
> > > > > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/m=
eta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > > > index ec87b462193..7c4233c2115 100644
> > > > > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > > > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > > > @@ -12,6 +12,7 @@ require gcc-configure-common.inc
> > > > >  EXTRA_OECONF +=3D "--with-plugin-ld=3Dld"
> > > > >  EXTRA_OECONF_PATHS =3D "\
> > > > >      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/=
${BINV} \
> > > > > +    --with-gxx-libcxx-include-dir=3D/not/exist${target_includedi=
r}/c++/v1 \
> > > > >      --with-build-time-tools=3D${STAGING_DIR_NATIVE}${prefix_nati=
ve}/${TARGET_SYS}/bin \
> > > > >      --with-sysroot=3D/not/exist \
> > > > >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > > > > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recip=
es-devtools/gcc/gcc-cross.inc
> > > > > index a540fb2434a..5b0ca15d476 100644
> > > > > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > > > > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > > > > @@ -37,6 +37,7 @@ EXTRA_OECONF:remove:libc-newlib =3D "--enable-t=
hreads=3Dposix"
> > > > >
> > > > >  EXTRA_OECONF_PATHS =3D "\
> > > > >      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/=
${BINV} \
> > > > > +    --with-gxx-libcxx-include-dir=3D/not/exist${target_includedi=
r}/c++/v1 \
> > > > >      --with-sysroot=3D/not/exist \
> > > > >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > > > >  "
> > > > > diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/reci=
pes-devtools/gcc/gcc-target.inc
> > > > > index 7dac3ef422c..82da5ef82be 100644
> > > > > --- a/meta/recipes-devtools/gcc/gcc-target.inc
> > > > > +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> > > > > @@ -2,6 +2,7 @@ GCCMULTILIB =3D "--enable-multilib"
> > > > >  require gcc-configure-common.inc
> > > > >
> > > > >  EXTRA_OECONF_PATHS =3D "\
> > > > > +    --with-gxx-libcxx-include-dir=3D${target_includedir}/c++/v1 =
\
> > > > >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > > > >  "
> > > > >
> > > > > --
> > > > > 2.41.0
> > > > >
> > > > >
> > > > >
> > > > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197598): https://lists.openembedded.org/g/openembedde=
d-core/message/197598
> Mute This Topic: https://lists.openembedded.org/mt/105199106/3617261
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [da=
nismostlikely@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

