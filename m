Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B26ECD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:29:15 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.956.1711643348149834583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WLghIyw9;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: danismostlikely@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so1143924276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711643347; x=1712248147; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aetdj6XAEeRT0A2cisWB8uMbv7a6Vs8c7apWM0ztw/4=;
        b=WLghIyw9AvWWp33c563wooUVj+2TvrX6fDS0dTp+5VMbODe4juOKwANXcCYPGsgf17
         jSCKv3dt+GkGxhEiR71NCmsH+lIm8QS/3od5e69ubDtHnFbx32BB/WaoLheiaPEovA6X
         XePQK8YI3tBGyqdLHODnb2HBIWJRHQ7TiD7GTWFvd+Qe4F2wEBk3pmGzhAdi/CRIA35x
         dmWdSWAvVSMWoGaOnufVryd8d2yO4XQF5LKMVlZfb9QPKkGJtNtSAkoQYboLr2scQF9U
         8JhFQzOzdarNy81dd7rhHVC3BhnAW9DvAcx+PCTGz2h8aZ8GyQK5UR2pxpwoKAv3tAFt
         nwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643347; x=1712248147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aetdj6XAEeRT0A2cisWB8uMbv7a6Vs8c7apWM0ztw/4=;
        b=vEZTADbxnU5jKqbYW6RCCSGMFxx89NQfFn85V1i6RuA25qAV1BOEyIbcJ0wHuPKGtd
         8VHq3HPbEjTgtyqJyBCbI3+/b/tegc1OaMWHi5j94VL14IgMurELj7/MFV4qBCCNAlX9
         DXTXaKpSOoWAkjKjCqvQQryb+hTo5x3qQ3DhD6cxEbFxzrW6Nj7NI3CnWAJojL4L1Oyl
         pTQcIhuztl3Gsls6G0pzuxZYJXxsYQt93FLVPuFG5jYQ6SL+9vCoVT6pMsJeE1rk0s6W
         va+ownSCZKaDkTLwdyT8ZgxSSsbz4V7QzNH9wboEiz8AE2rN3ahY+XSP+6YGJvPlTQ94
         Szxg==
X-Gm-Message-State: AOJu0YzqMpvKx3u4EROJ4rAxWtSACKPOBKLHUN5mG7hbEu7Tv/xZYLez
	BE0lXpGBFfaS4/AXdvvxaEiBio9sAfftf62IqdpzY1Vml3k0sIFdje1wrTJ7b8RNrjpPW7IItMp
	gbeMicWe1WZr1LawIuMaSnlNVlRM=
X-Google-Smtp-Source: AGHT+IE2QXeitx6iBlAKxFG63ImMiX0rHTtQaGBAreSOCg9c1zBqFl4kmcuqLcVdoJKO9xBD4NvttSHQf+ZsVe15uUU=
X-Received: by 2002:a25:acdc:0:b0:dc2:466a:23bd with SMTP id
 x28-20020a25acdc000000b00dc2466a23bdmr3431470ybd.54.1711643347256; Thu, 28
 Mar 2024 09:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240328154340.503623-1-daniel.mcgregor@vecima.com> <CAMKF1sr9_08xAKaVjEFaraUZtUxcuCTowUj1yM0YKveSB0SkBQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr9_08xAKaVjEFaraUZtUxcuCTowUj1yM0YKveSB0SkBQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 28 Mar 2024 10:28:56 -0600
Message-ID: <CACS+7ZTwJ_0-JA2fSSetW99YpkNprTA4TcrQR3BwKe6=P-TzjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Allow using libc++
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197592

On Thu, 28 Mar 2024 at 10:11, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 28, 2024 at 8:43=E2=80=AFAM Dan McGregor <danismostlikely@gma=
il.com> wrote:
> >
> > With the addition of the C++ runtime setting added recently, allow
> > gcc to use libc++ as its runtime. There's some minor fixes still
> > required, such as allowing setting the unwinder library. But this
> > allows for testing libc++ with gcc.
> >
> > Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-13.2.inc           | 6 ------
> >  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 +
> >  meta/recipes-devtools/gcc/gcc-cross.inc          | 1 +
> >  meta/recipes-devtools/gcc/gcc-target.inc         | 1 +
> >  4 files changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devt=
ools/gcc/gcc-13.2.inc
> > index 603377a49a2..a19ceadeaae 100644
> > --- a/meta/recipes-devtools/gcc/gcc-13.2.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
> > @@ -109,11 +109,5 @@ EXTRA_OECONF_INITIAL =3D "\
> >      --disable-libssp \
> >  "
> >
> > -EXTRA_OECONF_PATHS =3D "\
> > -    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BINV}=
 \
> > -    --with-sysroot=3D/not/exist \
> > -    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > -"
>
> this include is used by almost all of gcc based recipes including
> runtime libraries
> if we remove it here, then I guess they will be impacted in some way.
> e.g. libgcc
> Can you check what the effect is ?

All of the recipes I looked at explicitly set this value
independently, either in the recipe, or another common(ish) include
file.
I thought about leaving this in, but it threw me off when I started
this, so I figured it's best to remove it so others don't hit the same
issue.

>
> > -
> >  CVE_STATUS[CVE-2021-37322] =3D "cpe-incorrect: Is a binutils 2.26 issu=
e, not gcc"
> >  CVE_STATUS[CVE-2023-4039] =3D "fixed-version: Fixed via CVE-2023-4039.=
patch included here. Set the status explictly to deal with all recipes that=
 share the gcc-source"
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/re=
cipes-devtools/gcc/gcc-cross-canadian.inc
> > index ec87b462193..7c4233c2115 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > @@ -12,6 +12,7 @@ require gcc-configure-common.inc
> >  EXTRA_OECONF +=3D "--with-plugin-ld=3Dld"
> >  EXTRA_OECONF_PATHS =3D "\
> >      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV=
} \
> > +    --with-gxx-libcxx-include-dir=3D/not/exist${target_includedir}/c++=
/v1 \
> >      --with-build-time-tools=3D${STAGING_DIR_NATIVE}${prefix_native}/${=
TARGET_SYS}/bin \
> >      --with-sysroot=3D/not/exist \
> >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-dev=
tools/gcc/gcc-cross.inc
> > index a540fb2434a..5b0ca15d476 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > @@ -37,6 +37,7 @@ EXTRA_OECONF:remove:libc-newlib =3D "--enable-threads=
=3Dposix"
> >
> >  EXTRA_OECONF_PATHS =3D "\
> >      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV=
} \
> > +    --with-gxx-libcxx-include-dir=3D/not/exist${target_includedir}/c++=
/v1 \
> >      --with-sysroot=3D/not/exist \
> >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> >  "
> > diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-de=
vtools/gcc/gcc-target.inc
> > index 7dac3ef422c..82da5ef82be 100644
> > --- a/meta/recipes-devtools/gcc/gcc-target.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> > @@ -2,6 +2,7 @@ GCCMULTILIB =3D "--enable-multilib"
> >  require gcc-configure-common.inc
> >
> >  EXTRA_OECONF_PATHS =3D "\
> > +    --with-gxx-libcxx-include-dir=3D${target_includedir}/c++/v1 \
> >      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> >  "
> >
> > --
> > 2.41.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197582): https://lists.openembedded.org/g/openembed=
ded-core/message/197582
> > Mute This Topic: https://lists.openembedded.org/mt/105199106/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

