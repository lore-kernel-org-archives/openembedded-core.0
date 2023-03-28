Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09137C76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 08:37:35 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.61220.1679992652799937360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 01:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pmJ358wW;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id by8so11628749ljb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 01:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679992651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmhE/u/whcD37TFp/eOHr5EJE7pOFoWUKc6y0Xp9o+Q=;
        b=pmJ358wW+VxYRt68rGpJ+YPuIeveZQtr5yKszxlNQc6ZuMfGkND70DEDIxqwcrYpJB
         X3Ud24t9yoYNlBqzOUVLULPHyQb1fa7wVALR245sCJz6C3Aqe/piyWojb8b7h6QgAeUx
         iXcaAQog/RKRx0dVOaPj7xczJuUlkeaVJz5n6GM1RYeNXZtmrOLHsQhTjgBm3BJC5oQ3
         GyPF/qQA9grzHYchpIFotfnWlyPh2QuTdzTYjfdIF1pDZ4hC9JP132uR9grDAqgJaqvc
         Oi5otlV6ydCbAGWtnkGll9pvnq8ibGILvE8/0Hnyj5VNU7TbKzimVVRY5okiqnJxjLcF
         eV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679992651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmhE/u/whcD37TFp/eOHr5EJE7pOFoWUKc6y0Xp9o+Q=;
        b=hoGN7208FpvaC66ycwhJvJalgES3eyb4JzDCnv6YkE0ZVOi69L1C2K/Vgnsd3nRobe
         vmLHO42gJAYHCgi0PE3EZjhkZeYV1w2VYxcOFcrkdIPMUmYYQ0UwHdxZ3Y4I/WaG4LfT
         u5uK5V6dnGCHJoWJx6OUhmLETw8UFWgrvv9Mgjio5K00Hm+OV0xYhSqUEsOZO+hhX43F
         eMt5XzRn5/B/rgXUSlhFOZXDr7wJjdrdMgkxOqq3YOxjk+oYZIcTGr/cnnnTGw3F/Kij
         50MahIZTg9KMOF8tUZnyPJ1J3P4+gYmFD6vWWQ1EmmabPAxBfVO0SnojqzIGerW22e2j
         /3zA==
X-Gm-Message-State: AAQBX9feK9bkcGiXPyauUnGZlPQD6RoIJRAgHMq7JtbHrkRooX/9Q96q
	EftuLUugG2/LxkzT3BNe2Jt6CE+jJo+/vqutedQ=
X-Google-Smtp-Source: AKy350YH8yzhXzo/6KkFLNfDZ45RoMa+oHoferwX2U5FxAWNCss59tyRaUDtmdowrRZJmgaOaPzlSmRSh/42nuYaBeo=
X-Received: by 2002:a05:651c:115:b0:299:9de5:2f1b with SMTP id
 a21-20020a05651c011500b002999de52f1bmr4409330ljb.7.1679992650801; Tue, 28 Mar
 2023 01:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org>
 <CANNYZj8tNBngz4OLgF9YTKVQU08AjWgFf6JS2aHk0qQt=D6tBA@mail.gmail.com>
 <CA+cAkeqyAKnXHSvWDStkYCf6Uj99_OFaq5wQq60iLc6kkW7sDA@mail.gmail.com>
 <CANNYZj82788D_5t+Pt8u6NT0KX0ZzaEfdUCGAD_f92tCCmS5OQ@mail.gmail.com>
 <CA+cAkeqJESh4oOf=C5YevFdT3vLobLCELRD-wGvbPvvpexTmyw@mail.gmail.com>
 <CAO5Uq5QBNLT-BuQhpSyoEwHGd_c+JEt8q9UKEFA6ejjKab7-4w@mail.gmail.com>
 <CA+cAkeoZTZCBogKpy5mrn=G+w+hedMmm4KGB3q=8Ubp_=rOoRQ@mail.gmail.com>
 <CAO5Uq5RNRnfH=_C4bDnT9u4puME_b_=G1DdmScHu7e4zanVF2A@mail.gmail.com>
 <CANNYZj-FzfwgzCUBnUrMzN_kigHF9ttc59svOACvFG=QjidsQQ@mail.gmail.com>
 <CA+cAkeqkGmgszQbeRS4Z+8YP2uYa_OuWTpJUkmKyTnSQ8wOo1A@mail.gmail.com>
 <CANNYZj9_Ob5aXzNGajLo2oy7-rtrO+Ly9xvHsL5g0x87EGcprg@mail.gmail.com> <CAO5Uq5SwLNVk2v5T1Ckt+3hn_yJ7dsgVMkscu27Okg3J7gZAwQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5SwLNVk2v5T1Ckt+3hn_yJ7dsgVMkscu27Okg3J7gZAwQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Mar 2023 10:37:19 +0200
Message-ID: <CANNYZj84YMex981r9DhQQURBz-TaeUSyTBfDcVbr1iSi+bD2+Q@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 08:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179212

The exploding part was the 'unable to find std crate', which is fixed
by not doing 'build --stage 2' at all, and going directly to 'install'
(which builds all the needed parts in correct order anyway and is
tested upstream).

I'll add the getrandom-open64.patch update to my tree, thanks.

Alex

On Tue, 28 Mar 2023 at 09:11, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> I was going to say, that looks pretty much identical to what I had,
> but it looks like they've reverted some LTO stuff in 1.68.1, which I
> guess is what was exploding:
>
> https://github.com/rust-lang/rust/issues/109067
>
> Would be good to pick up this too:
>
> https://github.com/akiernan/openembedded-core/commit/9e098599aa5247086a34=
6bf73a087a2ce4ab640f#diff-84ec9441385da6fa39407418d2eebc685e1ca4260bfeb94c6=
f5d411ef706df1e
>
> which was a backport of what actually got merged upstream for @Khem
> Raj's open64 fix:
>
> On Mon, Mar 27, 2023 at 11:13=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > I think I have meanwhile resolved the 1.68 upgrade issues:
> > https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-ver=
sion-updates
> >
> > So that leaves the hip and cool rust-in-kernel project ;-)
> >
> > Alex
> >
> > On Mon, 27 Mar 2023 at 21:20, Fr=C3=A9d=C3=A9ric Martinsons
> > <frederic.martinsons@gmail.com> wrote:
> > >
> > > Thank you alex and alexender ;)
> > >
> > > I'll take a look at this as soon as possible and and tell you in a de=
dicated thread if I'm making progress. But first, I'll work for the devtool=
 test that has been mentioned first.
> > >
> > > Have a good evening (or day, depending on your timezone)
> > >
> > > Le lun. 27 mars 2023, 21:00, Alexander Kanavin <alex.kanavin@gmail.co=
m> a =C3=A9crit :
> > >>
> > >> For the kernel modules you could start by replicating an out-of-yoct=
o
> > >> kernel build as shown here:
> > >> https://lwn.net/Articles/910762/
> > >>
> > >> Alex
> > >>
> > >> On Mon, 27 Mar 2023 at 20:52, Alex Kiernan <alex.kiernan@gmail.com> =
wrote:
> > >> >
> > >> > IIRC the cross upgrade just works, its the target build which expl=
odes:
> > >> >
> > >> > https://github.com/akiernan/openembedded-core
> > >> >
> > >> > On Mon, Mar 27, 2023 at 7:40=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martins=
ons
> > >> > <frederic.martinsons@gmail.com> wrote:
> > >> > >
> > >> > > Ok great, I'm willing to know more about the bootstrap of a rust=
 toolchain, I think I can start by just upgrading my poky master to rust 1.=
68 and see what it spills out when I compile the hello world
> > >> > >
> > >> > > On the other hand, for enabling rust kernel modules in linux-yoc=
to-dev, I don't know where to start (full disclosure : I have no skills abo=
ut kernel and kernel module developments)
> > >> > >
> > >> > > Le lun. 27 mars 2023, 20:30, Alex Kiernan <alex.kiernan@gmail.co=
m> a =C3=A9crit :
> > >> > >>
> > >> > >> Updating the rust version is pretty much nothing to do with you=
r rust
> > >> > >> knowledge and way more about digging into how the bootstrap pro=
cess
> > >> > >> hangs together... whilst I have an awesome rustacean working fo=
r me, I
> > >> > >> don't think I've ever had to drag him into helping with an upgr=
ade.
> > >> > >>
> > >> > >> I wish I could say I'd spent the last few weeks figuring out wh=
y the
> > >> > >> upgrade broke, but I've been buried down the bottom of an ESP-I=
DF
> > >> > >> application...
> > >> > >>
> > >> > >> Alex
> > >> > >>
> > >> > >> On Mon, Mar 27, 2023 at 7:08=E2=80=AFPM Fr=C3=A9d=C3=A9ric Mart=
insons
> > >> > >> <frederic.martinsons@gmail.com> wrote:
> > >> > >> >
> > >> > >> > I'll look at this but I'm not sure if I can help since I'm a =
beginner (enthusiastic but still)
> > >> > >> >
> > >> > >> > Le lun. 27 mars 2023, 19:19, Alexander Kanavin <alex.kanavin@=
gmail.com> a =C3=A9crit :
> > >> > >> >>
> > >> > >> >> If you'd like to do more here's off the top of my head:
> > >> > >> >>
> > >> > >> >> - enable rust kernel modules in linux-yocto-dev
> > >> > >> >>
> > >> > >> >> - help Alex Kiernan with update 1.67 -> 1.68; we need as man=
y people
> > >> > >> >> as possible capable of updating the rust toolchain. It's oft=
en not
> > >> > >> >> trivial:
> > >> > >> >> https://lists.openembedded.org/g/openembedded-core/message/1=
78272
> > >> > >> >>
> > >> > >> >> Alex
> > >> > >> >>
> > >> > >> >> On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
> > >> > >> >> <frederic.martinsons@gmail.com> wrote:
> > >> > >> >> >
> > >> > >> >> > Ah!
> > >> > >> >> >
> > >> > >> >> > Alright, I'll try to setup a devtool test which demonstrat=
e the usage of git subpath with the zvariant.
> > >> > >> >> > I'll then issue a V4 series which reintroduce the zvariant=
 recipe in meta-selftest and the unit test on it.
> > >> > >> >> >
> > >> > >> >> > I must admit I felt in love for rust since the beginning o=
f the year and considering that I use yocto on a daily basis, I'll do every=
thing I can to extend the support of developing rust for embedded devices.
> > >> > >> >> >
> > >> > >> >> > Thank you all for the advices.
> > >> > >> >> >
> > >> > >> >> > Le lun. 27 mars 2023, 16:25, Alexander Kanavin <alex.kanav=
in@gmail.com> a =C3=A9crit :
> > >> > >> >> >>
> > >> > >> >> >> So if devtool tests would operate on zvariant recipe, the=
n the recipe
> > >> > >> >> >> can simply go into meta-selftest after all :)
> > >> > >> >> >>
> > >> > >> >> >> Alex
> > >> > >> >> >>
> > >> > >> >> >> On Mon, 27 Mar 2023 at 16:20, Richard Purdie
> > >> > >> >> >> <richard.purdie@linuxfoundation.org> wrote:
> > >> > >> >> >> >
> > >> > >> >> >> > On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons =
wrote:
> > >> > >> >> >> > > From: Frederic Martinsons <frederic.martinsons@gmail.=
com>
> > >> > >> >> >> > >
> > >> > >> >> >> > > This series brings the support of local git repositor=
y inside
> > >> > >> >> >> > > a cargo based recipe.
> > >> > >> >> >> > >
> > >> > >> >> >> > > It also enable devtool capacity on it and provide a r=
eal crate
> > >> > >> >> >> > > example recipe to show how things are done.
> > >> > >> >> >> > >
> > >> > >> >> >> > > The following changes since commit 4876189dd2ae5a04a2=
96b11b537b9f613159c6bf:
> > >> > >> >> >> > >
> > >> > >> >> >> > >   xcb-proto: Fix install conflict when enable multili=
b. (2023-03-23 22:38:41 +0000)
> > >> > >> >> >> > >
> > >> > >> >> >> > > are available in the Git repository at:
> > >> > >> >> >> > >
> > >> > >> >> >> > >   https://gitlab.com/fmartinsons/openembedded-core ca=
rgo-extend-support-git-and-devtool
> > >> > >> >> >> > >
> > >> > >> >> >> > > Alex Kiernan (1):
> > >> > >> >> >> > >   cargo_common.bbclass: Support local github repos
> > >> > >> >> >> > >
> > >> > >> >> >> > > Frederic Martinsons (4):
> > >> > >> >> >> > >   cargo_common.bbclass: add support of user in url fo=
r patch
> > >> > >> >> >> > >   rust-example: provide a recipe for zvariant
> > >> > >> >> >> > >   devtool: add support for multiple git url inside a =
cargo based recipe
> > >> > >> >> >> > >   patch: support of git patches when the source uri c=
ontained subpath
> > >> > >> >> >> > >     param
> > >> > >> >> >> >
> > >> > >> >> >> > The various rust/cargo/crate patches look like they're =
heading in a
> > >> > >> >> >> > good direction, thanks!
> > >> > >> >> >> >
> > >> > >> >> >> > The one thing which I think is missing is more support =
for testing some
> > >> > >> >> >> > of these changes in our automated testing.
> > >> > >> >> >> >
> > >> > >> >> >> > In particular, devtool does have a decent test suite so=
 we should
> > >> > >> >> >> > ensure new devtool additions have tests.
> > >> > >> >> >> >
> > >> > >> >> >> > You can see the devtools tests in
> > >> > >> >> >> > meta/lib/oeqa/selftest/cases/devtool.py and run them wi=
th a command
> > >> > >> >> >> > like "oe-selftest -r devtool -j 3" for example.
> > >> > >> >> >> >
> > >> > >> >> >> > Cheers,
> > >> > >> >> >> >
> > >> > >> >> >> > Richard
> > >> > >> >> >> >
> > >> > >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> > >> >> >> > Links: You receive all messages sent to this group.
> > >> > >> >> >> > View/Reply Online (#179160): https://lists.openembedded=
.org/g/openembedded-core/message/179160
> > >> > >> >> >> > Mute This Topic: https://lists.openembedded.org/mt/9784=
0361/1686489
> > >> > >> >> >> > Group Owner: openembedded-core+owner@lists.openembedded=
.org
> > >> > >> >> >> > Unsubscribe: https://lists.openembedded.org/g/openembed=
ded-core/unsub [alex.kanavin@gmail.com]
> > >> > >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> > >> >> >> >
> > >> > >>
> > >> > >>
> > >> > >>
> > >> > >> --
> > >> > >> Alex Kiernan
> > >> >
> > >> >
> > >> >
> > >> > --
> > >> > Alex Kiernan
>
>
>
> --
> Alex Kiernan

