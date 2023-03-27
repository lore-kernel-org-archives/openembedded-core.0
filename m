Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4391CC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 22:13:52 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.49966.1679955226094960542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 15:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oEofKOMr;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id bi9so13342485lfb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 15:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679955224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hYda4XR1a/rauGL99Pg4dAZAFXUgeVTfTQswgxF+pc=;
        b=oEofKOMrvuH6DKv5Pq+O0GVrBl82EUi290b5tuTtWrp14AI+RlhsbT9fbrXy+sEc1x
         kkExXJ7/O9hri2i1LwiauWyjFx/SKcqwGwC5KemPyybCsA+vZg97ivejOHgqDpoHTEQ/
         vwPzoEjuErdsbGtKEyByAMHI00Z7BNd5mY64ywrkRRmYMC0p4sS9ZWOjKSApMA7rwLEn
         A3a2sMfZD/7jgLALAW13LWVr8Mgl9iUjAI6UNklj6deCdE1eo/W8GMjFf36Q7rYFlAM5
         mqlnD3/vVoK4AE6fe2t1JlAe2rCo5xApiiCqYshOzgljmsOuIBpAzs7lnR5qViTsv0m5
         xbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679955224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hYda4XR1a/rauGL99Pg4dAZAFXUgeVTfTQswgxF+pc=;
        b=qLQWa1piVYfs50evyWq0So6DVlG5yMSgBZGZOTnsTWDYZBLsWZaza7Mh7lfJ+8b+sq
         PYHLTfI3M1k5kiTnbrJA1o81xLJeOf9ycsphR9kvBRbulLkK8EG0c5SA6uSD5gmWsyJH
         RjVFIVdrnBALjLFtzo8BlBkJEAx6dtFd7l4DDKN3JK+lLycs7oD0a8sCLJIgrFvdNovL
         ATf2AHw9fhad4rU/506MdR0ILvwCuVf8Fd67M6rg5wiq8mSR6dvDCJRPJaA2wqKvcbbg
         +0NKAWhFMjo62HM80CI4gjr5mQNBnicWk1wJXyhyoaxXkiDchmLdHU1UYgMn41TSKtb1
         rawA==
X-Gm-Message-State: AAQBX9f1kcks8YtWbIVSWs8NYycxxRXW03867qBfkaO2qhGfREkYHGlo
	8Hz/bAUJt8reSiNTfdxIMxCaCVWWFXHORQVoU/I=
X-Google-Smtp-Source: AKy350bK22y6PxntSGxQ9Zl2MQ0H45Fmm5u+o6p9/7yneis46EBRkheNK2ZrTWRbb02ng+K5tsKQzEuiczAH2cQp4Gs=
X-Received: by 2002:ac2:522e:0:b0:4ea:e2f8:5ed6 with SMTP id
 i14-20020ac2522e000000b004eae2f85ed6mr3724150lfl.11.1679955223925; Mon, 27
 Mar 2023 15:13:43 -0700 (PDT)
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
 <CANNYZj-FzfwgzCUBnUrMzN_kigHF9ttc59svOACvFG=QjidsQQ@mail.gmail.com> <CA+cAkeqkGmgszQbeRS4Z+8YP2uYa_OuWTpJUkmKyTnSQ8wOo1A@mail.gmail.com>
In-Reply-To: <CA+cAkeqkGmgszQbeRS4Z+8YP2uYa_OuWTpJUkmKyTnSQ8wOo1A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Mar 2023 00:13:32 +0200
Message-ID: <CANNYZj9_Ob5aXzNGajLo2oy7-rtrO+Ly9xvHsL5g0x87EGcprg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] Extend cargo based recip support
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 22:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179185

I think I have meanwhile resolved the 1.68 upgrade issues:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-version=
-updates

So that leaves the hip and cool rust-in-kernel project ;-)

Alex

On Mon, 27 Mar 2023 at 21:20, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Thank you alex and alexender ;)
>
> I'll take a look at this as soon as possible and and tell you in a dedica=
ted thread if I'm making progress. But first, I'll work for the devtool tes=
t that has been mentioned first.
>
> Have a good evening (or day, depending on your timezone)
>
> Le lun. 27 mars 2023, 21:00, Alexander Kanavin <alex.kanavin@gmail.com> a=
 =C3=A9crit :
>>
>> For the kernel modules you could start by replicating an out-of-yocto
>> kernel build as shown here:
>> https://lwn.net/Articles/910762/
>>
>> Alex
>>
>> On Mon, 27 Mar 2023 at 20:52, Alex Kiernan <alex.kiernan@gmail.com> wrot=
e:
>> >
>> > IIRC the cross upgrade just works, its the target build which explodes=
:
>> >
>> > https://github.com/akiernan/openembedded-core
>> >
>> > On Mon, Mar 27, 2023 at 7:40=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons
>> > <frederic.martinsons@gmail.com> wrote:
>> > >
>> > > Ok great, I'm willing to know more about the bootstrap of a rust too=
lchain, I think I can start by just upgrading my poky master to rust 1.68 a=
nd see what it spills out when I compile the hello world
>> > >
>> > > On the other hand, for enabling rust kernel modules in linux-yocto-d=
ev, I don't know where to start (full disclosure : I have no skills about k=
ernel and kernel module developments)
>> > >
>> > > Le lun. 27 mars 2023, 20:30, Alex Kiernan <alex.kiernan@gmail.com> a=
 =C3=A9crit :
>> > >>
>> > >> Updating the rust version is pretty much nothing to do with your ru=
st
>> > >> knowledge and way more about digging into how the bootstrap process
>> > >> hangs together... whilst I have an awesome rustacean working for me=
, I
>> > >> don't think I've ever had to drag him into helping with an upgrade.
>> > >>
>> > >> I wish I could say I'd spent the last few weeks figuring out why th=
e
>> > >> upgrade broke, but I've been buried down the bottom of an ESP-IDF
>> > >> application...
>> > >>
>> > >> Alex
>> > >>
>> > >> On Mon, Mar 27, 2023 at 7:08=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinso=
ns
>> > >> <frederic.martinsons@gmail.com> wrote:
>> > >> >
>> > >> > I'll look at this but I'm not sure if I can help since I'm a begi=
nner (enthusiastic but still)
>> > >> >
>> > >> > Le lun. 27 mars 2023, 19:19, Alexander Kanavin <alex.kanavin@gmai=
l.com> a =C3=A9crit :
>> > >> >>
>> > >> >> If you'd like to do more here's off the top of my head:
>> > >> >>
>> > >> >> - enable rust kernel modules in linux-yocto-dev
>> > >> >>
>> > >> >> - help Alex Kiernan with update 1.67 -> 1.68; we need as many pe=
ople
>> > >> >> as possible capable of updating the rust toolchain. It's often n=
ot
>> > >> >> trivial:
>> > >> >> https://lists.openembedded.org/g/openembedded-core/message/17827=
2
>> > >> >>
>> > >> >> Alex
>> > >> >>
>> > >> >> On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
>> > >> >> <frederic.martinsons@gmail.com> wrote:
>> > >> >> >
>> > >> >> > Ah!
>> > >> >> >
>> > >> >> > Alright, I'll try to setup a devtool test which demonstrate th=
e usage of git subpath with the zvariant.
>> > >> >> > I'll then issue a V4 series which reintroduce the zvariant rec=
ipe in meta-selftest and the unit test on it.
>> > >> >> >
>> > >> >> > I must admit I felt in love for rust since the beginning of th=
e year and considering that I use yocto on a daily basis, I'll do everythin=
g I can to extend the support of developing rust for embedded devices.
>> > >> >> >
>> > >> >> > Thank you all for the advices.
>> > >> >> >
>> > >> >> > Le lun. 27 mars 2023, 16:25, Alexander Kanavin <alex.kanavin@g=
mail.com> a =C3=A9crit :
>> > >> >> >>
>> > >> >> >> So if devtool tests would operate on zvariant recipe, then th=
e recipe
>> > >> >> >> can simply go into meta-selftest after all :)
>> > >> >> >>
>> > >> >> >> Alex
>> > >> >> >>
>> > >> >> >> On Mon, 27 Mar 2023 at 16:20, Richard Purdie
>> > >> >> >> <richard.purdie@linuxfoundation.org> wrote:
>> > >> >> >> >
>> > >> >> >> > On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrot=
e:
>> > >> >> >> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>> > >> >> >> > >
>> > >> >> >> > > This series brings the support of local git repository in=
side
>> > >> >> >> > > a cargo based recipe.
>> > >> >> >> > >
>> > >> >> >> > > It also enable devtool capacity on it and provide a real =
crate
>> > >> >> >> > > example recipe to show how things are done.
>> > >> >> >> > >
>> > >> >> >> > > The following changes since commit 4876189dd2ae5a04a296b1=
1b537b9f613159c6bf:
>> > >> >> >> > >
>> > >> >> >> > >   xcb-proto: Fix install conflict when enable multilib. (=
2023-03-23 22:38:41 +0000)
>> > >> >> >> > >
>> > >> >> >> > > are available in the Git repository at:
>> > >> >> >> > >
>> > >> >> >> > >   https://gitlab.com/fmartinsons/openembedded-core cargo-=
extend-support-git-and-devtool
>> > >> >> >> > >
>> > >> >> >> > > Alex Kiernan (1):
>> > >> >> >> > >   cargo_common.bbclass: Support local github repos
>> > >> >> >> > >
>> > >> >> >> > > Frederic Martinsons (4):
>> > >> >> >> > >   cargo_common.bbclass: add support of user in url for pa=
tch
>> > >> >> >> > >   rust-example: provide a recipe for zvariant
>> > >> >> >> > >   devtool: add support for multiple git url inside a carg=
o based recipe
>> > >> >> >> > >   patch: support of git patches when the source uri conta=
ined subpath
>> > >> >> >> > >     param
>> > >> >> >> >
>> > >> >> >> > The various rust/cargo/crate patches look like they're head=
ing in a
>> > >> >> >> > good direction, thanks!
>> > >> >> >> >
>> > >> >> >> > The one thing which I think is missing is more support for =
testing some
>> > >> >> >> > of these changes in our automated testing.
>> > >> >> >> >
>> > >> >> >> > In particular, devtool does have a decent test suite so we =
should
>> > >> >> >> > ensure new devtool additions have tests.
>> > >> >> >> >
>> > >> >> >> > You can see the devtools tests in
>> > >> >> >> > meta/lib/oeqa/selftest/cases/devtool.py and run them with a=
 command
>> > >> >> >> > like "oe-selftest -r devtool -j 3" for example.
>> > >> >> >> >
>> > >> >> >> > Cheers,
>> > >> >> >> >
>> > >> >> >> > Richard
>> > >> >> >> >
>> > >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > >> >> >> > Links: You receive all messages sent to this group.
>> > >> >> >> > View/Reply Online (#179160): https://lists.openembedded.org=
/g/openembedded-core/message/179160
>> > >> >> >> > Mute This Topic: https://lists.openembedded.org/mt/97840361=
/1686489
>> > >> >> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > >> >> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-=
core/unsub [alex.kanavin@gmail.com]
>> > >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > >> >> >> >
>> > >>
>> > >>
>> > >>
>> > >> --
>> > >> Alex Kiernan
>> >
>> >
>> >
>> > --
>> > Alex Kiernan

