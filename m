Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E60C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 10:09:53 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.16259.1678702186301537560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 03:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fzhC2f0m;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id t11so14979875lfr.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678702184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNTtV916YMjS2eSjudaLpL6nxKA9pvxIluyx62Kq6GY=;
        b=fzhC2f0mmuOlUW+stoeq9utZi/oDI8wfvSKac/eT11wa+6nETREQiSswDzkbcrz20e
         4u2i2YTtnM+ayuRGV5Ct+khwbx9SfQAg1LqeCXvJw+b6rqaqkO3AoccpqiRKZMV2aRXs
         LP1cUjYmEE5KHLuIjM5eHp7FaAcNZGTy7NF3cPTk8Nqjsl/A4xZ4bOXJv5fXTvGmCjau
         a4fg8yZmxE1obi82AyLanMkCqVrw719rhNoQNCucAWGHQZ98IpM9hqhWaGtJBVyGz/9O
         ku/Sx/ICFUEqLehKen03nqTUkGc2cjxvyiQtALCMjINEGRcVKi1Kqsc/Noh2+jl9veFs
         mG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678702184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNTtV916YMjS2eSjudaLpL6nxKA9pvxIluyx62Kq6GY=;
        b=1fzbTmAJQcFNsXBGBatFO+qcGfIQHddeBUyIDlPKGEPlpfhhBWWgNp2iU080zasuaZ
         PKqtFSKXmXpyOoqk8DE01HhiK0S1hGv1Jfqk7/wgJDvDn8ekrJGvmKVFL7gU5ju37ydi
         9qtQNijhy/Vamer7z7eXduiJTBUvdYFORzReTTiu3nnCOv8PANWnrO695FdAr956eglD
         uPGrDLfbkGwIyETFF5f05Bt2Bmj+T4RR+vwVQXqFzJeuvYdgeM//35KZOfCckKiB5Rv9
         4MjsMbbjt03xHLMaAuzI0BVdJMMahUX81UwyDPP0rpgKJYW+67MbvQ33Mxq6aBgevl5Y
         Za3A==
X-Gm-Message-State: AO0yUKXsCi2lL2yxserqoPtFKnc+16AOwuIrHw7LdKXT4B6v6pRm97uF
	KiwTgr3jmQ3OXiUw7zuwlup828q3Qbx6Wng2M8i4QGI+
X-Google-Smtp-Source: AK7set8cRusNVgbx590cS+LazCUisBlrDBsGVVMGUqziNsFvkhm4d3hFfFhcBEutZjTevElgtEW8j0iAhE0XO70ZuCs=
X-Received: by 2002:a05:6512:4c2:b0:4dd:9931:c4ee with SMTP id
 w2-20020a05651204c200b004dd9931c4eemr10544036lfq.12.1678702184506; Mon, 13
 Mar 2023 03:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
 <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
 <174BF173C650BF69.25836@lists.openembedded.org> <CAO5Uq5S41-fM8=A2xC3jxbB908ZSwHmUMLgXEjDqWw=KqTxzsA@mail.gmail.com>
In-Reply-To: <CAO5Uq5S41-fM8=A2xC3jxbB908ZSwHmUMLgXEjDqWw=KqTxzsA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 13 Mar 2023 11:09:33 +0100
Message-ID: <CA+cAkeqZ+LmVY8CLsiEaJsjgGVHYAMox+VL8jPgHWiesOjxWNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 10:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178427

Thank you very much, I tested your project and it worked.

So I'll try https for my git instead of ssh.

On Mon, 13 Mar 2023 at 10:49, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> For reference this was my test case:
>
> https://github.com/akiernan/uuid-test
>
> I was wondering if this was an ssh vs. https problem, but just
> checking we've a mix of ssh and https access to local git repos.
>
> On Mon, Mar 13, 2023 at 9:46=E2=80=AFAM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
> wrote:
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
> > > > >
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
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178424): https://lists.openembedded.org/g/openembed=
ded-core/message/178424
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

