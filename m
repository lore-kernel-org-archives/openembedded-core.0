Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B74C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 18:30:41 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.44103.1679941837901272794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 11:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Edy1Yqqd;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id s7so5068884ilv.12
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 11:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679941837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImRPrN0ZzZz7aLj6nIXiyZiaLvI4n7U+RQjv8/Pomhg=;
        b=Edy1YqqdJU2MMFDsUH/lqioMdkuDCSr2QRPCc0U7mgOdwhkE6as5JQOVw5DXfburJv
         /tq19Q36fP2iE6EZPosV/xoG0Eqgha8VjNS+Utj0qIjghxrm+inZu81u1Kr7+A4lMjk2
         LH3ZfZN36okA/733Uxec6DnyCumlRuIsNgvM1TGjPP+UqZ0Xgn8Y1q7jDEZNCtAdw1+X
         abmsSl6TWdj/06bYSpmcHz0wade/IXEa53DuT58W+pujMbQ0V1h3hnxm4s59Vhlu6c7X
         k6esUGdsO+VkYg5oybPg/OLenWZKEwbuNAregbHrNutN2wpDHSadEe8fwOhv/bfqmuPQ
         vXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679941837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImRPrN0ZzZz7aLj6nIXiyZiaLvI4n7U+RQjv8/Pomhg=;
        b=l9DzNs1Ll1sj1nrBu7GpwKv3XJd2392HrcbxaG1lweSpY+wNWzqRj+v1vlAk6Tjkjh
         Ggh1B8UhqDv0TDFyK1XOiIb3ARA6yprJnch2ep105oEGU9tksCZ37Xc3Bj4ajLoaahbi
         Bn4kvb8rtgJqe1a8ofQCMbVHxQFaIyReC1dBUq5YN3WJmnZn2PF+bgejDomlsCb7wTAb
         sByESBCPfJUISyD7Rb8iT62cYg/TYYabzw3L4qB1NhQ5kMA5c6jnnHj5oLyLiHlc8fnH
         AUnLXvxXOMYSUYM73/TDUKDUewdUngnDfDpOiy9ykxaCv5YKWyPALA5T8iWB8rrIrIlE
         pWig==
X-Gm-Message-State: AAQBX9dQCgG2tfCUS/BijemC4GAaPCDk8Oeq1RjooM6yaT71mq+LJd2f
	nDva/9I6GX5/61g24dWt93B1Di+BFonI84vYt2A=
X-Google-Smtp-Source: AKy350ZcbOthii8TYjLgP1fQUZ0Dad/rP4mGsyUQEFjVMyeY5gU8AnOS82ScniMvkps6LumSSeGsqvd8yc9s8DQJlkk=
X-Received: by 2002:a92:5208:0:b0:326:315:f3d with SMTP id g8-20020a925208000000b0032603150f3dmr2545491ilb.1.1679941837018;
 Mon, 27 Mar 2023 11:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org>
 <CANNYZj8tNBngz4OLgF9YTKVQU08AjWgFf6JS2aHk0qQt=D6tBA@mail.gmail.com>
 <CA+cAkeqyAKnXHSvWDStkYCf6Uj99_OFaq5wQq60iLc6kkW7sDA@mail.gmail.com>
 <CANNYZj82788D_5t+Pt8u6NT0KX0ZzaEfdUCGAD_f92tCCmS5OQ@mail.gmail.com> <CA+cAkeqJESh4oOf=C5YevFdT3vLobLCELRD-wGvbPvvpexTmyw@mail.gmail.com>
In-Reply-To: <CA+cAkeqJESh4oOf=C5YevFdT3vLobLCELRD-wGvbPvvpexTmyw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 27 Mar 2023 18:30:25 +0000
Message-ID: <CAO5Uq5QBNLT-BuQhpSyoEwHGd_c+JEt8q9UKEFA6ejjKab7-4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] Extend cargo based recip support
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 18:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179170

Updating the rust version is pretty much nothing to do with your rust
knowledge and way more about digging into how the bootstrap process
hangs together... whilst I have an awesome rustacean working for me, I
don't think I've ever had to drag him into helping with an upgrade.

I wish I could say I'd spent the last few weeks figuring out why the
upgrade broke, but I've been buried down the bottom of an ESP-IDF
application...

Alex

On Mon, Mar 27, 2023 at 7:08=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> I'll look at this but I'm not sure if I can help since I'm a beginner (en=
thusiastic but still)
>
> Le lun. 27 mars 2023, 19:19, Alexander Kanavin <alex.kanavin@gmail.com> a=
 =C3=A9crit :
>>
>> If you'd like to do more here's off the top of my head:
>>
>> - enable rust kernel modules in linux-yocto-dev
>>
>> - help Alex Kiernan with update 1.67 -> 1.68; we need as many people
>> as possible capable of updating the rust toolchain. It's often not
>> trivial:
>> https://lists.openembedded.org/g/openembedded-core/message/178272
>>
>> Alex
>>
>> On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
>> <frederic.martinsons@gmail.com> wrote:
>> >
>> > Ah!
>> >
>> > Alright, I'll try to setup a devtool test which demonstrate the usage =
of git subpath with the zvariant.
>> > I'll then issue a V4 series which reintroduce the zvariant recipe in m=
eta-selftest and the unit test on it.
>> >
>> > I must admit I felt in love for rust since the beginning of the year a=
nd considering that I use yocto on a daily basis, I'll do everything I can =
to extend the support of developing rust for embedded devices.
>> >
>> > Thank you all for the advices.
>> >
>> > Le lun. 27 mars 2023, 16:25, Alexander Kanavin <alex.kanavin@gmail.com=
> a =C3=A9crit :
>> >>
>> >> So if devtool tests would operate on zvariant recipe, then the recipe
>> >> can simply go into meta-selftest after all :)
>> >>
>> >> Alex
>> >>
>> >> On Mon, 27 Mar 2023 at 16:20, Richard Purdie
>> >> <richard.purdie@linuxfoundation.org> wrote:
>> >> >
>> >> > On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote:
>> >> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>> >> > >
>> >> > > This series brings the support of local git repository inside
>> >> > > a cargo based recipe.
>> >> > >
>> >> > > It also enable devtool capacity on it and provide a real crate
>> >> > > example recipe to show how things are done.
>> >> > >
>> >> > > The following changes since commit 4876189dd2ae5a04a296b11b537b9f=
613159c6bf:
>> >> > >
>> >> > >   xcb-proto: Fix install conflict when enable multilib. (2023-03-=
23 22:38:41 +0000)
>> >> > >
>> >> > > are available in the Git repository at:
>> >> > >
>> >> > >   https://gitlab.com/fmartinsons/openembedded-core cargo-extend-s=
upport-git-and-devtool
>> >> > >
>> >> > > Alex Kiernan (1):
>> >> > >   cargo_common.bbclass: Support local github repos
>> >> > >
>> >> > > Frederic Martinsons (4):
>> >> > >   cargo_common.bbclass: add support of user in url for patch
>> >> > >   rust-example: provide a recipe for zvariant
>> >> > >   devtool: add support for multiple git url inside a cargo based =
recipe
>> >> > >   patch: support of git patches when the source uri contained sub=
path
>> >> > >     param
>> >> >
>> >> > The various rust/cargo/crate patches look like they're heading in a
>> >> > good direction, thanks!
>> >> >
>> >> > The one thing which I think is missing is more support for testing =
some
>> >> > of these changes in our automated testing.
>> >> >
>> >> > In particular, devtool does have a decent test suite so we should
>> >> > ensure new devtool additions have tests.
>> >> >
>> >> > You can see the devtools tests in
>> >> > meta/lib/oeqa/selftest/cases/devtool.py and run them with a command
>> >> > like "oe-selftest -r devtool -j 3" for example.
>> >> >
>> >> > Cheers,
>> >> >
>> >> > Richard
>> >> >
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> > Links: You receive all messages sent to this group.
>> >> > View/Reply Online (#179160): https://lists.openembedded.org/g/opene=
mbedded-core/message/179160
>> >> > Mute This Topic: https://lists.openembedded.org/mt/97840361/1686489
>> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [alex.kanavin@gmail.com]
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >



--=20
Alex Kiernan

