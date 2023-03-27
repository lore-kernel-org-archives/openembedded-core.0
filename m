Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA79C761A6
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 17:19:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.42136.1679937584359858794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 10:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d0l22mh9;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id y20so12451270lfj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 10:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679937582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf1JU5qrtYhwnTUvmgqIkNZ/cb40czxTZkEYcAxxo8w=;
        b=d0l22mh9foRdkHDoUTr1uK5bpF72i1a+FzIsbDtBmwcVyTLyaBlqwVt7p8AqzoUStz
         PQg78GLiHrrk8hF2EK3RWeD5icVO6lO3HiB1Gtc19scXHcNUm8CAtqJIEhMygGBa815+
         iV/B4tG9qkC6YAY9YcLjNATXBT5GycJ8rGuaCCJfhhPEPTg5F2Dtn0+7IkZyUHa0xk2/
         kF8X0ONQi1dINzkpdTSeMi4Y8sEViLPD0FYQcvurIwgxOcVF+rAtozdvgP17nbfEkWf+
         UnOqKQ7COKjaVsjzJABSGHJztGPslOJT3m/672+dTu78ImjDVJEJZjNHOiDtszXzDauV
         8lPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679937582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lf1JU5qrtYhwnTUvmgqIkNZ/cb40czxTZkEYcAxxo8w=;
        b=J2qp1L9dD45D4wYvUAaBIq9xYfSrIGDYJFhlQdC7GlrNjPpv8J5xkM390+OpDkiIbm
         Q5LhcwNEXNJc/gfCdiVxOuTK4aaGhpFyhBcX1GVW2vi/4YgiG3gOR8DkqhhdWP1v/tj/
         B5P389iATJu9or3Nb5Dd7JsSjnFyNde1tPhi5xjIW52HmkK5c8YZGjNZXJ+0DAsQRph9
         TMpufEXG4nqV9oQxt4W+1XB8qxLqNCw95nDlUet4g4DFsuRLQ0PO6NeX+VrxGapSbNbY
         B2a0Nln1b4PCMMeAxZB+HyJH5hxdbnzLpAOh63N4tr07RdVI9+BiZBFaat7DLViGbHC5
         +wSw==
X-Gm-Message-State: AAQBX9cu1kPXepdrlUC9rOiFY1xw27WvQoUgZ315OuCFbmoBEszrZLUY
	JppRdV/APF0S+CUegKKJLdNB1oYC66Y2rRZW6zY=
X-Google-Smtp-Source: AKy350YdbIxtSmTfiL/eFisQiCjNrdMqUm6fdF2kTASt3sI+J2i0eIHiYFga+x7OI8wGIxMac7i9su4BMJh5FFM2ghQ=
X-Received: by 2002:ac2:5ddb:0:b0:4e8:c8f1:a010 with SMTP id
 x27-20020ac25ddb000000b004e8c8f1a010mr3549919lfq.11.1679937582466; Mon, 27
 Mar 2023 10:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org>
 <CANNYZj8tNBngz4OLgF9YTKVQU08AjWgFf6JS2aHk0qQt=D6tBA@mail.gmail.com> <CA+cAkeqyAKnXHSvWDStkYCf6Uj99_OFaq5wQq60iLc6kkW7sDA@mail.gmail.com>
In-Reply-To: <CA+cAkeqyAKnXHSvWDStkYCf6Uj99_OFaq5wQq60iLc6kkW7sDA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Mar 2023 19:19:30 +0200
Message-ID: <CANNYZj82788D_5t+Pt8u6NT0KX0ZzaEfdUCGAD_f92tCCmS5OQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] Extend cargo based recip support
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 17:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179168

If you'd like to do more here's off the top of my head:

- enable rust kernel modules in linux-yocto-dev

- help Alex Kiernan with update 1.67 -> 1.68; we need as many people
as possible capable of updating the rust toolchain. It's often not
trivial:
https://lists.openembedded.org/g/openembedded-core/message/178272

Alex

On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Ah!
>
> Alright, I'll try to setup a devtool test which demonstrate the usage of =
git subpath with the zvariant.
> I'll then issue a V4 series which reintroduce the zvariant recipe in meta=
-selftest and the unit test on it.
>
> I must admit I felt in love for rust since the beginning of the year and =
considering that I use yocto on a daily basis, I'll do everything I can to =
extend the support of developing rust for embedded devices.
>
> Thank you all for the advices.
>
> Le lun. 27 mars 2023, 16:25, Alexander Kanavin <alex.kanavin@gmail.com> a=
 =C3=A9crit :
>>
>> So if devtool tests would operate on zvariant recipe, then the recipe
>> can simply go into meta-selftest after all :)
>>
>> Alex
>>
>> On Mon, 27 Mar 2023 at 16:20, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote:
>> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>> > >
>> > > This series brings the support of local git repository inside
>> > > a cargo based recipe.
>> > >
>> > > It also enable devtool capacity on it and provide a real crate
>> > > example recipe to show how things are done.
>> > >
>> > > The following changes since commit 4876189dd2ae5a04a296b11b537b9f613=
159c6bf:
>> > >
>> > >   xcb-proto: Fix install conflict when enable multilib. (2023-03-23 =
22:38:41 +0000)
>> > >
>> > > are available in the Git repository at:
>> > >
>> > >   https://gitlab.com/fmartinsons/openembedded-core cargo-extend-supp=
ort-git-and-devtool
>> > >
>> > > Alex Kiernan (1):
>> > >   cargo_common.bbclass: Support local github repos
>> > >
>> > > Frederic Martinsons (4):
>> > >   cargo_common.bbclass: add support of user in url for patch
>> > >   rust-example: provide a recipe for zvariant
>> > >   devtool: add support for multiple git url inside a cargo based rec=
ipe
>> > >   patch: support of git patches when the source uri contained subpat=
h
>> > >     param
>> >
>> > The various rust/cargo/crate patches look like they're heading in a
>> > good direction, thanks!
>> >
>> > The one thing which I think is missing is more support for testing som=
e
>> > of these changes in our automated testing.
>> >
>> > In particular, devtool does have a decent test suite so we should
>> > ensure new devtool additions have tests.
>> >
>> > You can see the devtools tests in
>> > meta/lib/oeqa/selftest/cases/devtool.py and run them with a command
>> > like "oe-selftest -r devtool -j 3" for example.
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#179160): https://lists.openembedded.org/g/openembe=
dded-core/message/179160
>> > Mute This Topic: https://lists.openembedded.org/mt/97840361/1686489
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

