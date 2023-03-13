Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C33BC61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 09:32:33 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.15377.1678699948574017823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 02:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KAGaVZtV;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id r27so14802430lfe.10
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678699947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+9WLIWcE5+jVt0x8aSCSdv5FAKw8g9OmWRIueJp8BA=;
        b=KAGaVZtVzZ8d0MjEmO/BIHsbv9PCMdXk22nqsyvVJ4uJ5WvXDJEJpLkD0a7bctJR0M
         KMPVUeSYqp965BKyyedm9EvpUcN/6TI3dqOgV+1dKN9n/j0RrpzqMWvh9dRiC+hsBl8R
         GScL9/mmortjf/DzYtwMfK+Z2MgJMb+Wrp/cRIM3A/EQWegWInPWNS4xSJwdkhJKA3cQ
         btjLmvYipGRwfuQq40yVetWk+n/zuarOacVsi4cJxEXcm4ZGqmd5JaRbSUV3YNMQ87Wh
         akfr7IPfBq3uxDyelsfj3TYeklu4fCXdiaSx49g9wfbosAapBK454yJEKpOAzpIBNPDo
         MC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678699947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+9WLIWcE5+jVt0x8aSCSdv5FAKw8g9OmWRIueJp8BA=;
        b=L9Mt2S/2H3BOt2H5305uC7/6OULo3ifO1Cgq5T/DOMUcBwHEdRw1lUMzs172LYRaNr
         tSuyVCOtgaf/I2Tm02+GLH9ec/db4k/5vp7OKDQ3ntM3gxo+nM3LIsd+DjOqC96HjJvh
         Ks8u/5N/dG5+9ChbJsHQJ7/lkymUSObSGC4xTsJxew0VWcCdgVpgz3+eMDqV50/+sZUv
         buan0uPrC1tiRJ9k+CN68LxykZRuxvGWIEYVNFnJriKOs/9rTiqQi0AQns+c44Uk1tM5
         kLHRSEyTylOFA4HxVJaIyp1C/Q4Q2dLWQwNRb/Nmp2tlH0GraLqbQ1mykYUQ1HvgtlQk
         dSHA==
X-Gm-Message-State: AO0yUKW5UgojxSm/2IQshgaIAQpQtYBDRi//sfckkQony/3CVjs8zKJ/
	p6+au6uI96egFOTVvhoaC6U7qPjDOiGFcZ3CAsY=
X-Google-Smtp-Source: AK7set8ekAXNbI6tZ+OLzGd5wCUC6uoqWNVfO+KIM91jqGiK6F6popzyMvFhd/r02uq4XXs63VrVQMYfPBmEtwklGxg=
X-Received: by 2002:ac2:4893:0:b0:4d5:ca42:aeec with SMTP id
 x19-20020ac24893000000b004d5ca42aeecmr10388061lfc.12.1678699946661; Mon, 13
 Mar 2023 02:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com> <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
In-Reply-To: <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 13 Mar 2023 10:32:15 +0100
Message-ID: <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 09:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178422

Thanks for the patch alex, I did try it and the same happened (git
clone failure during do_compile), I'll
dig more on that and possibly submit patches if I found a way of
supporting git dependencies in Cargo.toml

On Mon, 13 Mar 2023 at 10:23, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> ISTR I tried this and ran into a different set of different problems.
>
> On Mon, Mar 13, 2023 at 9:20=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Note that we're all rust neophytes, and rust support in yocto is still
> > evolving towards maturity. If you can see better ways to do things,
> > patches would be most welcome - but 'no network access except in
> > bitbake fetchers' is a core rule.
> >
> > Alex
> >
> > On Mon, 13 Mar 2023 at 10:14, Fr=C3=A9d=C3=A9ric Martinsons
> > <frederic.martinsons@gmail.com> wrote:
> > >
> > > I understand there should not be a fetch during build step , I'll try
> > > to find why .
> > > In the mean time, if this is a strong rule, shouldn't we invoke "carg=
o
> > > build" with  --offline option ?
> > >
> > > On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kanavin@gmail.c=
om> wrote:
> > > >
> > > > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinsons
> > > > <frederic.martinsons@gmail.com> wrote:
> > > > > But the compile step tried to git clone anyway and so it failed l=
ike I
> > > > > showed in my first email.
> > > >
> > > > You need to figure out why this happens, because it should not. We
> > > > have plenty of recipes that list crates in SRC_URI in oe-core, so y=
ou
> > > > could start by studying how they work.
> > > >
> > > > Accessing network anywhere except do_fetch is not allowed for
> > > > reproducibility and license compliance reasons (both break if that
> > > > happens).
> > > >
> > > > 'cargo bitbake' is a 3rd party project with questionable maintenanc=
e
> > > > status that we do not support. The official way is to use
> > > > cargo-update-recipe-crates class.
> > > >
> > > > Alex
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178420): https://lists.openembedded.org/g/openembed=
ded-core/message/178420
> > Mute This Topic: https://lists.openembedded.org/mt/97555635/3618097
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kiernan@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alex Kiernan

