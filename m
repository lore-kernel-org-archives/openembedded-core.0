Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2319C77B62
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 07:12:04 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.60432.1679987519447503857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 00:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=arg7CV9E;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id s1so5925209ild.6
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 00:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679987518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d3b1BCqLg3ku7Yrl8mRdZcIg2a+TeSdcAfwtnqURd8=;
        b=arg7CV9E6k1eW81+GvKZUi9j0iM6NEYfDcOb1U99Bsq1P5Knr5qeMJP9yA/ZwXZkIg
         G9giq5/GQ0U3To5+Lk9UaPf/17R3giSc8yPVrl/bRU0Wlm3C9EU9NkrNNjH+V0XUE1Vq
         UeZPqM9F0lfKFGLVaOJtM4F1p3fPbmgaYWX9JG/0bBhYWVyg5zh8S5kL0vmtyHpKATyh
         yIAmS4vqS9RJpClKuazenSOjHTGA5QoupqOFAzyHtPIne1eC2WMKmNef1G1X6PJSc+xR
         g05hgpzfj1YO8t1DDQO5+67FqhT9aU+3SAqpidltYL2VhaAXqjSQyxqjYKnHiQBz+BRt
         ErtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679987518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2d3b1BCqLg3ku7Yrl8mRdZcIg2a+TeSdcAfwtnqURd8=;
        b=yVIOzNHa4yapqYqphis+zVtX6z8sll5jbJ1q5UQpQoJaxqyCfcaytxoKeAT5C06u1L
         rP6mW1LBaEbHVYz1w20g/v88ZC31kmtZJfA4cyEpeGSTLLjqSa5kn6R4bfpyWBuRzjlS
         0d9El2v5LLxHW6eeF806Dyz5M08C23Mec45cRpE2age04K8KazGjFFlvMFJKwL1FlirF
         4O2wpe5vOd0KUDBvrN7HQtAHucBvKvXKF6cVqFIZUn2Gi8ES/5WJ31BhWYAncelZXD2N
         KvnIKcUVkiyud4N5vTwG6ICfERugTT9u95fopTliJr6RvF71A3SX2YdOhgOMIVHxAC35
         cTew==
X-Gm-Message-State: AAQBX9cVlL9VYjo7v0V5UyRXYj9Q9jkNOX1jjVoXphCMOtrrega86YhJ
	SAQ2NG0ffae8u+yVOl6jIHLmXtIWyODFmAPCvhU=
X-Google-Smtp-Source: AKy350aUMD0op4n/1VLKzhkn42BiVZVITA5MvyXyxQvdBrHXOgDUehPx8HCfyWRtrFxmDeIYm0cDRDMjdegRpFPDt+Y=
X-Received: by 2002:a05:6e02:1d83:b0:326:220d:b6af with SMTP id
 h3-20020a056e021d8300b00326220db6afmr254935ila.1.1679987518401; Tue, 28 Mar
 2023 00:11:58 -0700 (PDT)
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
 <CA+cAkeqkGmgszQbeRS4Z+8YP2uYa_OuWTpJUkmKyTnSQ8wOo1A@mail.gmail.com> <CANNYZj9_Ob5aXzNGajLo2oy7-rtrO+Ly9xvHsL5g0x87EGcprg@mail.gmail.com>
In-Reply-To: <CANNYZj9_Ob5aXzNGajLo2oy7-rtrO+Ly9xvHsL5g0x87EGcprg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 28 Mar 2023 07:11:46 +0000
Message-ID: <CAO5Uq5SwLNVk2v5T1Ckt+3hn_yJ7dsgVMkscu27Okg3J7gZAwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] Extend cargo based recip support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 07:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179202

I was going to say, that looks pretty much identical to what I had,
but it looks like they've reverted some LTO stuff in 1.68.1, which I
guess is what was exploding:

https://github.com/rust-lang/rust/issues/109067

Would be good to pick up this too:

https://github.com/akiernan/openembedded-core/commit/9e098599aa5247086a346b=
f73a087a2ce4ab640f#diff-84ec9441385da6fa39407418d2eebc685e1ca4260bfeb94c6f5=
d411ef706df1e

which was a backport of what actually got merged upstream for @Khem
Raj's open64 fix:

On Mon, Mar 27, 2023 at 11:13=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I think I have meanwhile resolved the 1.68 upgrade issues:
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-versi=
on-updates
>
> So that leaves the hip and cool rust-in-kernel project ;-)
>
> Alex
>
> On Mon, 27 Mar 2023 at 21:20, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Thank you alex and alexender ;)
> >
> > I'll take a look at this as soon as possible and and tell you in a dedi=
cated thread if I'm making progress. But first, I'll work for the devtool t=
est that has been mentioned first.
> >
> > Have a good evening (or day, depending on your timezone)
> >
> > Le lun. 27 mars 2023, 21:00, Alexander Kanavin <alex.kanavin@gmail.com>=
 a =C3=A9crit :
> >>
> >> For the kernel modules you could start by replicating an out-of-yocto
> >> kernel build as shown here:
> >> https://lwn.net/Articles/910762/
> >>
> >> Alex
> >>
> >> On Mon, 27 Mar 2023 at 20:52, Alex Kiernan <alex.kiernan@gmail.com> wr=
ote:
> >> >
> >> > IIRC the cross upgrade just works, its the target build which explod=
es:
> >> >
> >> > https://github.com/akiernan/openembedded-core
> >> >
> >> > On Mon, Mar 27, 2023 at 7:40=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinson=
s
> >> > <frederic.martinsons@gmail.com> wrote:
> >> > >
> >> > > Ok great, I'm willing to know more about the bootstrap of a rust t=
oolchain, I think I can start by just upgrading my poky master to rust 1.68=
 and see what it spills out when I compile the hello world
> >> > >
> >> > > On the other hand, for enabling rust kernel modules in linux-yocto=
-dev, I don't know where to start (full disclosure : I have no skills about=
 kernel and kernel module developments)
> >> > >
> >> > > Le lun. 27 mars 2023, 20:30, Alex Kiernan <alex.kiernan@gmail.com>=
 a =C3=A9crit :
> >> > >>
> >> > >> Updating the rust version is pretty much nothing to do with your =
rust
> >> > >> knowledge and way more about digging into how the bootstrap proce=
ss
> >> > >> hangs together... whilst I have an awesome rustacean working for =
me, I
> >> > >> don't think I've ever had to drag him into helping with an upgrad=
e.
> >> > >>
> >> > >> I wish I could say I'd spent the last few weeks figuring out why =
the
> >> > >> upgrade broke, but I've been buried down the bottom of an ESP-IDF
> >> > >> application...
> >> > >>
> >> > >> Alex
> >> > >>
> >> > >> On Mon, Mar 27, 2023 at 7:08=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martin=
sons
> >> > >> <frederic.martinsons@gmail.com> wrote:
> >> > >> >
> >> > >> > I'll look at this but I'm not sure if I can help since I'm a be=
ginner (enthusiastic but still)
> >> > >> >
> >> > >> > Le lun. 27 mars 2023, 19:19, Alexander Kanavin <alex.kanavin@gm=
ail.com> a =C3=A9crit :
> >> > >> >>
> >> > >> >> If you'd like to do more here's off the top of my head:
> >> > >> >>
> >> > >> >> - enable rust kernel modules in linux-yocto-dev
> >> > >> >>
> >> > >> >> - help Alex Kiernan with update 1.67 -> 1.68; we need as many =
people
> >> > >> >> as possible capable of updating the rust toolchain. It's often=
 not
> >> > >> >> trivial:
> >> > >> >> https://lists.openembedded.org/g/openembedded-core/message/178=
272
> >> > >> >>
> >> > >> >> Alex
> >> > >> >>
> >> > >> >> On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
> >> > >> >> <frederic.martinsons@gmail.com> wrote:
> >> > >> >> >
> >> > >> >> > Ah!
> >> > >> >> >
> >> > >> >> > Alright, I'll try to setup a devtool test which demonstrate =
the usage of git subpath with the zvariant.
> >> > >> >> > I'll then issue a V4 series which reintroduce the zvariant r=
ecipe in meta-selftest and the unit test on it.
> >> > >> >> >
> >> > >> >> > I must admit I felt in love for rust since the beginning of =
the year and considering that I use yocto on a daily basis, I'll do everyth=
ing I can to extend the support of developing rust for embedded devices.
> >> > >> >> >
> >> > >> >> > Thank you all for the advices.
> >> > >> >> >
> >> > >> >> > Le lun. 27 mars 2023, 16:25, Alexander Kanavin <alex.kanavin=
@gmail.com> a =C3=A9crit :
> >> > >> >> >>
> >> > >> >> >> So if devtool tests would operate on zvariant recipe, then =
the recipe
> >> > >> >> >> can simply go into meta-selftest after all :)
> >> > >> >> >>
> >> > >> >> >> Alex
> >> > >> >> >>
> >> > >> >> >> On Mon, 27 Mar 2023 at 16:20, Richard Purdie
> >> > >> >> >> <richard.purdie@linuxfoundation.org> wrote:
> >> > >> >> >> >
> >> > >> >> >> > On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wr=
ote:
> >> > >> >> >> > > From: Frederic Martinsons <frederic.martinsons@gmail.co=
m>
> >> > >> >> >> > >
> >> > >> >> >> > > This series brings the support of local git repository =
inside
> >> > >> >> >> > > a cargo based recipe.
> >> > >> >> >> > >
> >> > >> >> >> > > It also enable devtool capacity on it and provide a rea=
l crate
> >> > >> >> >> > > example recipe to show how things are done.
> >> > >> >> >> > >
> >> > >> >> >> > > The following changes since commit 4876189dd2ae5a04a296=
b11b537b9f613159c6bf:
> >> > >> >> >> > >
> >> > >> >> >> > >   xcb-proto: Fix install conflict when enable multilib.=
 (2023-03-23 22:38:41 +0000)
> >> > >> >> >> > >
> >> > >> >> >> > > are available in the Git repository at:
> >> > >> >> >> > >
> >> > >> >> >> > >   https://gitlab.com/fmartinsons/openembedded-core carg=
o-extend-support-git-and-devtool
> >> > >> >> >> > >
> >> > >> >> >> > > Alex Kiernan (1):
> >> > >> >> >> > >   cargo_common.bbclass: Support local github repos
> >> > >> >> >> > >
> >> > >> >> >> > > Frederic Martinsons (4):
> >> > >> >> >> > >   cargo_common.bbclass: add support of user in url for =
patch
> >> > >> >> >> > >   rust-example: provide a recipe for zvariant
> >> > >> >> >> > >   devtool: add support for multiple git url inside a ca=
rgo based recipe
> >> > >> >> >> > >   patch: support of git patches when the source uri con=
tained subpath
> >> > >> >> >> > >     param
> >> > >> >> >> >
> >> > >> >> >> > The various rust/cargo/crate patches look like they're he=
ading in a
> >> > >> >> >> > good direction, thanks!
> >> > >> >> >> >
> >> > >> >> >> > The one thing which I think is missing is more support fo=
r testing some
> >> > >> >> >> > of these changes in our automated testing.
> >> > >> >> >> >
> >> > >> >> >> > In particular, devtool does have a decent test suite so w=
e should
> >> > >> >> >> > ensure new devtool additions have tests.
> >> > >> >> >> >
> >> > >> >> >> > You can see the devtools tests in
> >> > >> >> >> > meta/lib/oeqa/selftest/cases/devtool.py and run them with=
 a command
> >> > >> >> >> > like "oe-selftest -r devtool -j 3" for example.
> >> > >> >> >> >
> >> > >> >> >> > Cheers,
> >> > >> >> >> >
> >> > >> >> >> > Richard
> >> > >> >> >> >
> >> > >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > >> >> >> > Links: You receive all messages sent to this group.
> >> > >> >> >> > View/Reply Online (#179160): https://lists.openembedded.o=
rg/g/openembedded-core/message/179160
> >> > >> >> >> > Mute This Topic: https://lists.openembedded.org/mt/978403=
61/1686489
> >> > >> >> >> > Group Owner: openembedded-core+owner@lists.openembedded.o=
rg
> >> > >> >> >> > Unsubscribe: https://lists.openembedded.org/g/openembedde=
d-core/unsub [alex.kanavin@gmail.com]
> >> > >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > >> >> >> >
> >> > >>
> >> > >>
> >> > >>
> >> > >> --
> >> > >> Alex Kiernan
> >> >
> >> >
> >> >
> >> > --
> >> > Alex Kiernan



--=20
Alex Kiernan

