Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536B9C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 19:00:21 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.44998.1679943613592267156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 12:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U8S+hn7a;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id o20so7198533ljp.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679943611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8JskQhLB1toGTaaOptc/oNGbz7P8YoWJgoGe42FRVA=;
        b=U8S+hn7aKq6/LSStNnAPcT66J3kWz9XFRRGgRUIJ3WJl3eMFx6eh9AklQr/PqAiKx3
         HIwS53219Jj4mbwI6BBZfQK+/zG05JDAnBJX2C/UjDxQwC0zJmHNwhhE0blem6UKhfsH
         +9qocSlBpyWRUnFzDUyKHQWQknndhsANrbRNHAXDOO8NTxH6YoRT7Kr/Nd+7iMtrehMx
         qZNlxPLVBvmblCalzwfuzJq8Ea8ErVwvpRoLOv4Jh9rhncBCUSZiz2XmgAX2FdphrpL5
         LHj4cMwHOBUDNjWrfXXfm5xaGcGfx86nROih7n/lmu1em3z1MPIVPfFg4BEzt78C21wZ
         ApUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679943611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8JskQhLB1toGTaaOptc/oNGbz7P8YoWJgoGe42FRVA=;
        b=cjSbmS/gYRQvVCm6/9kUtafK+G2DYMvyLuDAcG2sB4al7Qg471DPRUekAd5JhiS304
         T3+6p8oHI5Rf9Bwhf0Wq8+4nEL2Dy4OCMnOD8PZc2djMapMWykENzTaDhSApvAzrwio9
         86/4aNvJ4V90wPkZWeyWdOn2hae7exSN+Tts1PYbwB1/K6PdI7KjBcrFT7sUUnMehJab
         tGXXatzikDiw0BzCSWa/ibChSq1UCQ2m4ik1E12K1UtwBUAONuIFAEj7on/3fx12t5lj
         4cymhZ0Vw8Zsr3yjnue7JuzFucSsRTH+X36+5o3ff7TnovOBec0fR2xl3ErclJ7Gear6
         SrOA==
X-Gm-Message-State: AAQBX9c6ngMPf59lI+CBZJaLEyLVxJ7Qwr9J5x9tliFTVAOwQwapZCSN
	uoD+fAHonv2rLEZTMaSCEiU3C8iSOxmvJ97M8TI=
X-Google-Smtp-Source: AKy350YjG+8mTIOKp0bz4bsuE7+kV1Kw7OfM0tugH5uV7rhVtwtnGh/r9Aase96bfkJF9633W2l9g5AWb30JLKG1xHQ=
X-Received: by 2002:a2e:874f:0:b0:295:acea:5875 with SMTP id
 q15-20020a2e874f000000b00295acea5875mr3879620ljj.2.1679943611493; Mon, 27 Mar
 2023 12:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org>
 <CANNYZj8tNBngz4OLgF9YTKVQU08AjWgFf6JS2aHk0qQt=D6tBA@mail.gmail.com>
 <CA+cAkeqyAKnXHSvWDStkYCf6Uj99_OFaq5wQq60iLc6kkW7sDA@mail.gmail.com>
 <CANNYZj82788D_5t+Pt8u6NT0KX0ZzaEfdUCGAD_f92tCCmS5OQ@mail.gmail.com>
 <CA+cAkeqJESh4oOf=C5YevFdT3vLobLCELRD-wGvbPvvpexTmyw@mail.gmail.com>
 <CAO5Uq5QBNLT-BuQhpSyoEwHGd_c+JEt8q9UKEFA6ejjKab7-4w@mail.gmail.com>
 <CA+cAkeoZTZCBogKpy5mrn=G+w+hedMmm4KGB3q=8Ubp_=rOoRQ@mail.gmail.com> <CAO5Uq5RNRnfH=_C4bDnT9u4puME_b_=G1DdmScHu7e4zanVF2A@mail.gmail.com>
In-Reply-To: <CAO5Uq5RNRnfH=_C4bDnT9u4puME_b_=G1DdmScHu7e4zanVF2A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Mar 2023 21:00:00 +0200
Message-ID: <CANNYZj-FzfwgzCUBnUrMzN_kigHF9ttc59svOACvFG=QjidsQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] Extend cargo based recip support
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 19:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179173

For the kernel modules you could start by replicating an out-of-yocto
kernel build as shown here:
https://lwn.net/Articles/910762/

Alex

On Mon, 27 Mar 2023 at 20:52, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> IIRC the cross upgrade just works, its the target build which explodes:
>
> https://github.com/akiernan/openembedded-core
>
> On Mon, Mar 27, 2023 at 7:40=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Ok great, I'm willing to know more about the bootstrap of a rust toolch=
ain, I think I can start by just upgrading my poky master to rust 1.68 and =
see what it spills out when I compile the hello world
> >
> > On the other hand, for enabling rust kernel modules in linux-yocto-dev,=
 I don't know where to start (full disclosure : I have no skills about kern=
el and kernel module developments)
> >
> > Le lun. 27 mars 2023, 20:30, Alex Kiernan <alex.kiernan@gmail.com> a =
=C3=A9crit :
> >>
> >> Updating the rust version is pretty much nothing to do with your rust
> >> knowledge and way more about digging into how the bootstrap process
> >> hangs together... whilst I have an awesome rustacean working for me, I
> >> don't think I've ever had to drag him into helping with an upgrade.
> >>
> >> I wish I could say I'd spent the last few weeks figuring out why the
> >> upgrade broke, but I've been buried down the bottom of an ESP-IDF
> >> application...
> >>
> >> Alex
> >>
> >> On Mon, Mar 27, 2023 at 7:08=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons
> >> <frederic.martinsons@gmail.com> wrote:
> >> >
> >> > I'll look at this but I'm not sure if I can help since I'm a beginne=
r (enthusiastic but still)
> >> >
> >> > Le lun. 27 mars 2023, 19:19, Alexander Kanavin <alex.kanavin@gmail.c=
om> a =C3=A9crit :
> >> >>
> >> >> If you'd like to do more here's off the top of my head:
> >> >>
> >> >> - enable rust kernel modules in linux-yocto-dev
> >> >>
> >> >> - help Alex Kiernan with update 1.67 -> 1.68; we need as many peopl=
e
> >> >> as possible capable of updating the rust toolchain. It's often not
> >> >> trivial:
> >> >> https://lists.openembedded.org/g/openembedded-core/message/178272
> >> >>
> >> >> Alex
> >> >>
> >> >> On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
> >> >> <frederic.martinsons@gmail.com> wrote:
> >> >> >
> >> >> > Ah!
> >> >> >
> >> >> > Alright, I'll try to setup a devtool test which demonstrate the u=
sage of git subpath with the zvariant.
> >> >> > I'll then issue a V4 series which reintroduce the zvariant recipe=
 in meta-selftest and the unit test on it.
> >> >> >
> >> >> > I must admit I felt in love for rust since the beginning of the y=
ear and considering that I use yocto on a daily basis, I'll do everything I=
 can to extend the support of developing rust for embedded devices.
> >> >> >
> >> >> > Thank you all for the advices.
> >> >> >
> >> >> > Le lun. 27 mars 2023, 16:25, Alexander Kanavin <alex.kanavin@gmai=
l.com> a =C3=A9crit :
> >> >> >>
> >> >> >> So if devtool tests would operate on zvariant recipe, then the r=
ecipe
> >> >> >> can simply go into meta-selftest after all :)
> >> >> >>
> >> >> >> Alex
> >> >> >>
> >> >> >> On Mon, 27 Mar 2023 at 16:20, Richard Purdie
> >> >> >> <richard.purdie@linuxfoundation.org> wrote:
> >> >> >> >
> >> >> >> > On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote:
> >> >> >> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >> >> >> > >
> >> >> >> > > This series brings the support of local git repository insid=
e
> >> >> >> > > a cargo based recipe.
> >> >> >> > >
> >> >> >> > > It also enable devtool capacity on it and provide a real cra=
te
> >> >> >> > > example recipe to show how things are done.
> >> >> >> > >
> >> >> >> > > The following changes since commit 4876189dd2ae5a04a296b11b5=
37b9f613159c6bf:
> >> >> >> > >
> >> >> >> > >   xcb-proto: Fix install conflict when enable multilib. (202=
3-03-23 22:38:41 +0000)
> >> >> >> > >
> >> >> >> > > are available in the Git repository at:
> >> >> >> > >
> >> >> >> > >   https://gitlab.com/fmartinsons/openembedded-core cargo-ext=
end-support-git-and-devtool
> >> >> >> > >
> >> >> >> > > Alex Kiernan (1):
> >> >> >> > >   cargo_common.bbclass: Support local github repos
> >> >> >> > >
> >> >> >> > > Frederic Martinsons (4):
> >> >> >> > >   cargo_common.bbclass: add support of user in url for patch
> >> >> >> > >   rust-example: provide a recipe for zvariant
> >> >> >> > >   devtool: add support for multiple git url inside a cargo b=
ased recipe
> >> >> >> > >   patch: support of git patches when the source uri containe=
d subpath
> >> >> >> > >     param
> >> >> >> >
> >> >> >> > The various rust/cargo/crate patches look like they're heading=
 in a
> >> >> >> > good direction, thanks!
> >> >> >> >
> >> >> >> > The one thing which I think is missing is more support for tes=
ting some
> >> >> >> > of these changes in our automated testing.
> >> >> >> >
> >> >> >> > In particular, devtool does have a decent test suite so we sho=
uld
> >> >> >> > ensure new devtool additions have tests.
> >> >> >> >
> >> >> >> > You can see the devtools tests in
> >> >> >> > meta/lib/oeqa/selftest/cases/devtool.py and run them with a co=
mmand
> >> >> >> > like "oe-selftest -r devtool -j 3" for example.
> >> >> >> >
> >> >> >> > Cheers,
> >> >> >> >
> >> >> >> > Richard
> >> >> >> >
> >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >> >> > Links: You receive all messages sent to this group.
> >> >> >> > View/Reply Online (#179160): https://lists.openembedded.org/g/=
openembedded-core/message/179160
> >> >> >> > Mute This Topic: https://lists.openembedded.org/mt/97840361/16=
86489
> >> >> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> >> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-cor=
e/unsub [alex.kanavin@gmail.com]
> >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >> >> >
> >>
> >>
> >>
> >> --
> >> Alex Kiernan
>
>
>
> --
> Alex Kiernan

