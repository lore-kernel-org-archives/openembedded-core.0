Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D413C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 16:09:06 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.23839.1678723737216386692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 09:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LKdlwKM2;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id y14so13160698ljq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 09:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678723735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Useq8j2nf8HwjJrFKDCOwXH04Ms0UjMEEyquRlX03HI=;
        b=LKdlwKM2V+sUwCUICwiH9w8Bn0n3kn5bFIh6WwlwhB4vn63Cqu7BYy5NxFJbEVyLT7
         uEkDsklSDs8/2uzXsMyqrf8NwKX5cKJIq/Hl8xj/jpg1gXeaLFl1FIf3czRMPgWoO/95
         5fzt69/GVxoyItEuUJaNaztOJBTY/NJu+MQVY5eXfppiFjXgmj/NWrnt9sFF4ukWUELN
         +Rql+6iQeni4DASVT/ajoEn3WFoCKZHAZCOwIHRf4Ux7kLHyTY+JWn3kmhFmMditOIkx
         rYfl9fZlkDa2vPajbLlEdLymUrF2EgRa/ZJYt7d67ddn7B2liMA00Vp0FkaMblj88vvV
         Rkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678723735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Useq8j2nf8HwjJrFKDCOwXH04Ms0UjMEEyquRlX03HI=;
        b=XMciXOxmBnZCcxET1tTqVqgSaAKoeMczBlbZpccHW4nWFhAjFV8ghEBvtlBCJqaYvA
         pFYLdBFE2eQ59gM8vp6nOxDWVRyjNibWcCBNgsRuz7MxmHFxIm91mdR3xSfFHxte8kmU
         jfxj4yu92SnWx26RAUYsMqee1umAIllud28o1yywDxCHa538w4drcpyChwTYictzFa2l
         +bLvU6JVQIFFO2GKvuDYx4fIpAHIioazGk8d215SUr0NNVJVAPePLoojY2Rq0TriQN3F
         6if99bRjezb5QBJNdWrjY/2v/vZPT2WlqeZG2gcDkPQKCwjeZlv6oAxCBbHSNUY6hU8Q
         jc6g==
X-Gm-Message-State: AO0yUKX3/SLsh/SvoPbZF5dAhtsdaGVAbqy7M/LDZ7aywATX+XQ7N4vP
	TBzB1GMYhO+6QwTLlWurpQPRW6Pl0RkJuPkU8v0=
X-Google-Smtp-Source: AK7set8tD2qUBefepD3ZQsKgPJ88Na6/eFtSA24FM//YqVXcr4sqEZbnEonNI7v+FUEGU1kq5pCq3dlKhjH/M97Rml4=
X-Received: by 2002:a2e:b544:0:b0:295:b597:c903 with SMTP id
 a4-20020a2eb544000000b00295b597c903mr10704175ljn.3.1678723735267; Mon, 13 Mar
 2023 09:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
 <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
 <CAO5Uq5QnyWqi5_CaX7sHTrewVRhvT_SKdXTY7PvKe4dPryCQ6w@mail.gmail.com>
 <CA+cAkeowE7BUYie9rdFPpJ972DHK+d3WGXLKFPAKcYcVYy_AXA@mail.gmail.com> <CANNYZj_xAGD8x9=axLxDuEpaJF2K2yLUVH6VO1j0i5tKSvPi=g@mail.gmail.com>
In-Reply-To: <CANNYZj_xAGD8x9=axLxDuEpaJF2K2yLUVH6VO1j0i5tKSvPi=g@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 13 Mar 2023 17:08:43 +0100
Message-ID: <CA+cAkeoP7ScYgbRG3eV1RR5R9bqEXm1b3cw7_gASG4uhJw=WfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 16:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178456

I understand, I'll pursue all my tests with the current poky master. Thanks

On Mon, 13 Mar 2023 at 11:42, Alexander Kanavin <alex.kanavin@gmail.com> wr=
ote:
>
> You need to use kirkstone or newer to see the bitbake-driven network
> disabling in action. Can you try on current poky master? You don't
> need to port the whole build to that, just one sample recipe.
>
> It is also expected that if you submit patches for master, they were
> tested on master.
>
> Alex
>
> On Mon, 13 Mar 2023 at 11:06, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > hmm, how is the network disabled ?
> >
> > Because with the patch I provided , the git clone in do_compile is succ=
essful.
> >
> > One major thing I forget to mention is that I use dunfell branch where
> > I backport all the cargo/rust relatives from master.
> > The backport was functional and straightforward, I just have to keep
> > the custom crate fetcher in openembedded-core (meta/lib/crate.py)
> > because I'm stuck with bitbake 1.46.
> >
> >    -
> >
> > On Mon, 13 Mar 2023 at 10:46, Alex Kiernan <alex.kiernan@gmail.com> wro=
te:
> > >
> > > Are you listing your ssh repos in your SRC_URI? We run with network
> > > disabled everywhere other than fetch and with that patch we don't see
> > > fetches from local ssh repos in compile.
> > >
> > > On Mon, Mar 13, 2023 at 9:32=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
> > > <frederic.martinsons@gmail.com> wrote:
> > > >
> > > > Thanks for the patch alex, I did try it and the same happened (git
> > > > clone failure during do_compile), I'll
> > > > dig more on that and possibly submit patches if I found a way of
> > > > supporting git dependencies in Cargo.toml
> > > >
> > > > On Mon, 13 Mar 2023 at 10:23, Alex Kiernan <alex.kiernan@gmail.com>=
 wrote:
> > > > >
> > > > > ISTR I tried this and ran into a different set of different probl=
ems.
> > > > >
> > > > > On Mon, Mar 13, 2023 at 9:20=E2=80=AFAM Alexander Kanavin
> > > > > <alex.kanavin@gmail.com> wrote:
> > > > > >
> > > > > > Note that we're all rust neophytes, and rust support in yocto i=
s still
> > > > > > evolving towards maturity. If you can see better ways to do thi=
ngs,
> > > > > > patches would be most welcome - but 'no network access except i=
n
> > > > > > bitbake fetchers' is a core rule.
> > > > > >
> > > > > > Alex
> > > > > >
> > > > > > On Mon, 13 Mar 2023 at 10:14, Fr=C3=A9d=C3=A9ric Martinsons
> > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > >
> > > > > > > I understand there should not be a fetch during build step , =
I'll try
> > > > > > > to find why .
> > > > > > > In the mean time, if this is a strong rule, shouldn't we invo=
ke "cargo
> > > > > > > build" with  --offline option ?
> > > > > > >
> > > > > > > On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kanavin=
@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinsons
> > > > > > > > <frederic.martinsons@gmail.com> wrote:
> > > > > > > > > But the compile step tried to git clone anyway and so it =
failed like I
> > > > > > > > > showed in my first email.
> > > > > > > >
> > > > > > > > You need to figure out why this happens, because it should =
not. We
> > > > > > > > have plenty of recipes that list crates in SRC_URI in oe-co=
re, so you
> > > > > > > > could start by studying how they work.
> > > > > > > >
> > > > > > > > Accessing network anywhere except do_fetch is not allowed f=
or
> > > > > > > > reproducibility and license compliance reasons (both break =
if that
> > > > > > > > happens).
> > > > > > > >
> > > > > > > > 'cargo bitbake' is a 3rd party project with questionable ma=
intenance
> > > > > > > > status that we do not support. The official way is to use
> > > > > > > > cargo-update-recipe-crates class.
> > > > > > > >
> > > > > > > > Alex
> > > > > >
> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > Links: You receive all messages sent to this group.
> > > > > > View/Reply Online (#178420): https://lists.openembedded.org/g/o=
penembedded-core/message/178420
> > > > > > Mute This Topic: https://lists.openembedded.org/mt/97555635/361=
8097
> > > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core=
/unsub [alex.kiernan@gmail.com]
> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Alex Kiernan
> > >
> > >
> > >
> > > --
> > > Alex Kiernan

