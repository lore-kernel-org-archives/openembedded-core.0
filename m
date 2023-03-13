Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCFCC61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 10:42:53 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.16682.1678704169541119750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 03:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VqW0EVrz;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id j11so15048672lfg.13
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678704168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPIWOxXIIv/c9x4nJFGXvi+a9paR628rtyEuJM/qC1E=;
        b=VqW0EVrzN5KXgFiIOslhfamNuA9nXA10k2gQ61i1VEe09ja0J1lwkjrhzwRKSBJIz4
         iFmpH/rX3Zpgbo6hlZL07zSrkBXP7nrlfIRIqQKPjJyBFReJ0uNiQy5igQgElwNizEaR
         z206kzVPlBPaWVvHNFfs4oJblDO5d/3M6K615dt6p1AY8PU9o/EQ45Mdom3jxhLhlXOO
         wbIAMXln+UXOqLYWA+6Yr9+fvYiH2M0PuskBm3d5J7T0tX9DgFjfXNZYH/q4hWfF/dqc
         XcOlTM/EezQOuZ9DszBjQiU7Ka6C2QiqTuyzWEtOqZDIdqJa3oetLkyQOM9tXTs9jYaq
         tIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678704168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPIWOxXIIv/c9x4nJFGXvi+a9paR628rtyEuJM/qC1E=;
        b=00JcxUZVkYb7CchkQq0esocPI0Mc6UyKlSfdDk7hSu1WnyhhyXoU70Di4LqSLj3P11
         3wMHHVl2AhaEtAdvt6dGqlKdfzxQma6KZ0ylMnqpvsPwVi7ZDUjtNTM/DYMe56mnIe/X
         Pjqhqflyij9e6A8WtOYOzZ8TpogNDdRKzzqirsFz5gujZEOK3Few8Fyt4KiUBH3ZKQR/
         FIBxIQdtQTJvP/CAcqeXQL5u0iZDBGvAa+tJruZHNGbJnvTTPADOUkyacfjA4S/fk8Sc
         513gdeUtRoDh5SyVhGgr1icOMG2x9n8ix9Jk0Bp45k4BWzjYhS8QfNMcxSTZCHwcvAnZ
         5Z5g==
X-Gm-Message-State: AO0yUKVqY3TSV024nCZMaIw1cwHNezlOnXEu0FdYVHD6UXvPdzzTURbI
	X/z3f7m0wbzf1dEWi0ccQRWaUPAmFz1F2HjfJnM=
X-Google-Smtp-Source: AK7set8s28cuFla9eFt1ISoOlIAmFhruey8aciMOwLI1NmDvZs/ytQUHSau/w5Vi60rWfy7EagMX0CWOG9bgQl7tEgU=
X-Received: by 2002:a05:6512:102c:b0:4e1:dbbb:4937 with SMTP id
 r12-20020a056512102c00b004e1dbbb4937mr10138315lfr.11.1678704167587; Mon, 13
 Mar 2023 03:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
 <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
 <CAO5Uq5QnyWqi5_CaX7sHTrewVRhvT_SKdXTY7PvKe4dPryCQ6w@mail.gmail.com> <CA+cAkeowE7BUYie9rdFPpJ972DHK+d3WGXLKFPAKcYcVYy_AXA@mail.gmail.com>
In-Reply-To: <CA+cAkeowE7BUYie9rdFPpJ972DHK+d3WGXLKFPAKcYcVYy_AXA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Mar 2023 11:42:36 +0100
Message-ID: <CANNYZj_xAGD8x9=axLxDuEpaJF2K2yLUVH6VO1j0i5tKSvPi=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 10:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178428

You need to use kirkstone or newer to see the bitbake-driven network
disabling in action. Can you try on current poky master? You don't
need to port the whole build to that, just one sample recipe.

It is also expected that if you submit patches for master, they were
tested on master.

Alex

On Mon, 13 Mar 2023 at 11:06, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> hmm, how is the network disabled ?
>
> Because with the patch I provided , the git clone in do_compile is succes=
sful.
>
> One major thing I forget to mention is that I use dunfell branch where
> I backport all the cargo/rust relatives from master.
> The backport was functional and straightforward, I just have to keep
> the custom crate fetcher in openembedded-core (meta/lib/crate.py)
> because I'm stuck with bitbake 1.46.
>
>    -
>
> On Mon, 13 Mar 2023 at 10:46, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
> >
> > Are you listing your ssh repos in your SRC_URI? We run with network
> > disabled everywhere other than fetch and with that patch we don't see
> > fetches from local ssh repos in compile.
> >
> > On Mon, Mar 13, 2023 at 9:32=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
> > <frederic.martinsons@gmail.com> wrote:
> > >
> > > Thanks for the patch alex, I did try it and the same happened (git
> > > clone failure during do_compile), I'll
> > > dig more on that and possibly submit patches if I found a way of
> > > supporting git dependencies in Cargo.toml
> > >
> > > On Mon, 13 Mar 2023 at 10:23, Alex Kiernan <alex.kiernan@gmail.com> w=
rote:
> > > >
> > > > ISTR I tried this and ran into a different set of different problem=
s.
> > > >
> > > > On Mon, Mar 13, 2023 at 9:20=E2=80=AFAM Alexander Kanavin
> > > > <alex.kanavin@gmail.com> wrote:
> > > > >
> > > > > Note that we're all rust neophytes, and rust support in yocto is =
still
> > > > > evolving towards maturity. If you can see better ways to do thing=
s,
> > > > > patches would be most welcome - but 'no network access except in
> > > > > bitbake fetchers' is a core rule.
> > > > >
> > > > > Alex
> > > > >
> > > > > On Mon, 13 Mar 2023 at 10:14, Fr=C3=A9d=C3=A9ric Martinsons
> > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > >
> > > > > > I understand there should not be a fetch during build step , I'=
ll try
> > > > > > to find why .
> > > > > > In the mean time, if this is a strong rule, shouldn't we invoke=
 "cargo
> > > > > > build" with  --offline option ?
> > > > > >
> > > > > > On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kanavin@g=
mail.com> wrote:
> > > > > > >
> > > > > > > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinsons
> > > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > > > But the compile step tried to git clone anyway and so it fa=
iled like I
> > > > > > > > showed in my first email.
> > > > > > >
> > > > > > > You need to figure out why this happens, because it should no=
t. We
> > > > > > > have plenty of recipes that list crates in SRC_URI in oe-core=
, so you
> > > > > > > could start by studying how they work.
> > > > > > >
> > > > > > > Accessing network anywhere except do_fetch is not allowed for
> > > > > > > reproducibility and license compliance reasons (both break if=
 that
> > > > > > > happens).
> > > > > > >
> > > > > > > 'cargo bitbake' is a 3rd party project with questionable main=
tenance
> > > > > > > status that we do not support. The official way is to use
> > > > > > > cargo-update-recipe-crates class.
> > > > > > >
> > > > > > > Alex
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#178420): https://lists.openembedded.org/g/ope=
nembedded-core/message/178420
> > > > > Mute This Topic: https://lists.openembedded.org/mt/97555635/36180=
97
> > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/u=
nsub [alex.kiernan@gmail.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >
> > > >
> > > >
> > > > --
> > > > Alex Kiernan
> >
> >
> >
> > --
> > Alex Kiernan

