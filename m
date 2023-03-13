Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C30C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 09:49:53 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.15591.1678700992775427139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 02:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nEEh5Ql5;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id h5so2623493ile.13
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678700992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hk0/YOAG57Xk3D+MhYUiNFEkcvab1+Vel+MI7KTJDkE=;
        b=nEEh5Ql5YG2K1zktBaY1CzkxJQfgB8EInP9tofZwfNVqOS/6CJG5Myf9k8EqxOl5Oo
         +zKxsJG3LWUBxTx41Lzy4OgQVHrZJJU6qXFYq6cupaFR5jxByxBlFPabR70JR6EQff4k
         R3S6p2VGN6xKepnLr7KVJoXConMgmtORqWjIgyTTGC5C92ZgDsNgin99IoN/7Avl7Rh/
         evVquEj15H0FqBkohbl/6PIVQP3zpFhVr5qh0zstPEtCnjqybynBz1QiEKNELelJl3VA
         znUnLUbZcFM2ffELvlJc0ws5rYTVZumMTqFcf9r/E6xvOCnuU+xrDuD/Isc2H6Z6Xkxc
         0HpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678700992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hk0/YOAG57Xk3D+MhYUiNFEkcvab1+Vel+MI7KTJDkE=;
        b=5lPK6qyjpxGA6gZzxHc1f3PdTesfLX0Fp6ipQF/a9+/tpFDmhas8ONx8VE+cu6FPku
         VKQ1rbSOTVitIFpVJ1EfK8gc3NJDsvCc1+WY0XoJaQBG1POG2ysBy/3bkTwurA5xtS6N
         qz1e6BkxF3zHzt61fCMHIRhjdPOdh9ZN3S+4XHTPsDuPZlthxaGxhQE4F0Vcww3nQEtR
         L52w5tbv81oiqfEH/gK0UuOMmY64DKwDrL7vlEvG11bIoZUyLXjEgP47wolSvwpeMSJa
         IEijmi5r9FD9Io4uDrkTnJLPmdrH41eJsTO2aGHUNx5ylR1SaBKZz9LXY84syjWAinIF
         4FGQ==
X-Gm-Message-State: AO0yUKW8xeFi6EasSLkAfHGXdWZUN7XrsVQ2Wj2bx1O+TxeiJl3Q8vLo
	MgMVJhoOzfc5cpGAaitbTSFQaVNe2vDsnPYdp4tH+OS8iMk=
X-Google-Smtp-Source: AK7set9+Ol2sJkqhybAsOY68n2on7FxgxwpphUXEUqRqoabKH+SSTQSy9MI5Z+buVkcO1ikNEDYt3lNd9MZhfXvRiXs=
X-Received: by 2002:a05:6e02:1289:b0:315:8e92:39ad with SMTP id
 y9-20020a056e02128900b003158e9239admr15657910ilq.1.1678700992025; Mon, 13 Mar
 2023 02:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
 <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com> <174BF173C650BF69.25836@lists.openembedded.org>
In-Reply-To: <174BF173C650BF69.25836@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 13 Mar 2023 09:48:47 +0000
Message-ID: <CAO5Uq5S41-fM8=A2xC3jxbB908ZSwHmUMLgXEjDqWw=KqTxzsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: alex.kiernan@gmail.com
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 09:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178425

For reference this was my test case:

https://github.com/akiernan/uuid-test

I was wondering if this was an ssh vs. https problem, but just
checking we've a mix of ssh and https access to local git repos.

On Mon, Mar 13, 2023 at 9:46=E2=80=AFAM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Are you listing your ssh repos in your SRC_URI? We run with network
> disabled everywhere other than fetch and with that patch we don't see
> fetches from local ssh repos in compile.
>
> On Mon, Mar 13, 2023 at 9:32=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Thanks for the patch alex, I did try it and the same happened (git
> > clone failure during do_compile), I'll
> > dig more on that and possibly submit patches if I found a way of
> > supporting git dependencies in Cargo.toml
> >
> > On Mon, 13 Mar 2023 at 10:23, Alex Kiernan <alex.kiernan@gmail.com> wro=
te:
> > >
> > > ISTR I tried this and ran into a different set of different problems.
> > >
> > > On Mon, Mar 13, 2023 at 9:20=E2=80=AFAM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Note that we're all rust neophytes, and rust support in yocto is st=
ill
> > > > evolving towards maturity. If you can see better ways to do things,
> > > > patches would be most welcome - but 'no network access except in
> > > > bitbake fetchers' is a core rule.
> > > >
> > > > Alex
> > > >
> > > > On Mon, 13 Mar 2023 at 10:14, Fr=C3=A9d=C3=A9ric Martinsons
> > > > <frederic.martinsons@gmail.com> wrote:
> > > > >
> > > > > I understand there should not be a fetch during build step , I'll=
 try
> > > > > to find why .
> > > > > In the mean time, if this is a strong rule, shouldn't we invoke "=
cargo
> > > > > build" with  --offline option ?
> > > > >
> > > > > On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kanavin@gma=
il.com> wrote:
> > > > > >
> > > > > > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinsons
> > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > > But the compile step tried to git clone anyway and so it fail=
ed like I
> > > > > > > showed in my first email.
> > > > > >
> > > > > > You need to figure out why this happens, because it should not.=
 We
> > > > > > have plenty of recipes that list crates in SRC_URI in oe-core, =
so you
> > > > > > could start by studying how they work.
> > > > > >
> > > > > > Accessing network anywhere except do_fetch is not allowed for
> > > > > > reproducibility and license compliance reasons (both break if t=
hat
> > > > > > happens).
> > > > > >
> > > > > > 'cargo bitbake' is a 3rd party project with questionable mainte=
nance
> > > > > > status that we do not support. The official way is to use
> > > > > > cargo-update-recipe-crates class.
> > > > > >
> > > > > > Alex
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > Alex Kiernan
>
>
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178424): https://lists.openembedded.org/g/openembedde=
d-core/message/178424
> Mute This Topic: https://lists.openembedded.org/mt/97555635/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

