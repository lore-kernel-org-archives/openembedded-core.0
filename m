Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46580C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 18:52:41 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.44686.1679943157734784484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 11:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HGcJPGKf;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id e13so4333804ioc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 11:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679943157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12srAKRuHWHcgCmqnvq5Ut3aS6owtY8G+PuYq9AOIQU=;
        b=HGcJPGKfH5t0nWA/TkSEI5fxYR2c6JfgfxAzOseSKQWrBuyb7MOSnPIcG+JM0+nrjj
         mPDyb1F0RJ08EMHa7sME1Xt/G88bMROPv+d8JhESlNQ6MGfa9eBXG3Yl6+L5IiVxJVLo
         nXuL5vVXG0MlaKN6mUWQWPFbiBBjjl0A8sOKKF3DeOzTIZWeF5YGIrnijglIsXEDnOq7
         9/+8LsqoJQA57Hua95qgtp8cf/YRb4+kHucKGZRnSrSjFYT1PYdmvrN8j3/VdqALn3ML
         K4eAkIwKel+LiopKdFyGN3y1ruy0U+2VS9ot8gR6BiMriOXDVkXQC+hDiJDNmvwk2utu
         kCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679943157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12srAKRuHWHcgCmqnvq5Ut3aS6owtY8G+PuYq9AOIQU=;
        b=R6F0bjc4BFBC6L/XMyAJoY+TCGHxY7XE/DegQtZ0qcMt1MjYE5zFJrXlSxmEfe9PkG
         8E9mr5/C1hHlJfYQW394ukYCqAgFhPnL+jDAHVbiqwQjaJb8QcIvZGwFTCPt1cgu+e+E
         Y0C1M/i97waiF/ZTEZyxHH88ecCGkjniEjzFlpG5ETARKpqUMNA9BPUl9vrSnTNv06ug
         lqVGHJrsutNsVKRDMw/Rt6PMkccQZk6czV/9+SHB1qo61031plFTioX8P6FpntLgrtAp
         02XoOPMGtR7rHjcIZwUUDvHeFkAW9AOITcOp/jVZaiIWTd/v8+8EbuoNZAnIpIYdJ+F3
         WBxA==
X-Gm-Message-State: AO0yUKU5Rykfjz1QX1LLitbF/42ztkzWIOlHWvkQZ1FAPMYlordUlFBh
	2g/vdgnZVlxlqafS1M35ZTZjlg6QuMdyWrIh960=
X-Google-Smtp-Source: AK7set+b2Y4BMIKYj+pD1KKzJxL9wu0iaCeSwpn75ws4t216u778bOWncpvITODVPWgiu/E0hsc4wdJTXFchhKWzPWY=
X-Received: by 2002:a6b:e50f:0:b0:755:7b0c:6052 with SMTP id
 y15-20020a6be50f000000b007557b0c6052mr4829658ioc.4.1679943156972; Mon, 27 Mar
 2023 11:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org>
 <CANNYZj8tNBngz4OLgF9YTKVQU08AjWgFf6JS2aHk0qQt=D6tBA@mail.gmail.com>
 <CA+cAkeqyAKnXHSvWDStkYCf6Uj99_OFaq5wQq60iLc6kkW7sDA@mail.gmail.com>
 <CANNYZj82788D_5t+Pt8u6NT0KX0ZzaEfdUCGAD_f92tCCmS5OQ@mail.gmail.com>
 <CA+cAkeqJESh4oOf=C5YevFdT3vLobLCELRD-wGvbPvvpexTmyw@mail.gmail.com>
 <CAO5Uq5QBNLT-BuQhpSyoEwHGd_c+JEt8q9UKEFA6ejjKab7-4w@mail.gmail.com> <CA+cAkeoZTZCBogKpy5mrn=G+w+hedMmm4KGB3q=8Ubp_=rOoRQ@mail.gmail.com>
In-Reply-To: <CA+cAkeoZTZCBogKpy5mrn=G+w+hedMmm4KGB3q=8Ubp_=rOoRQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 27 Mar 2023 18:52:25 +0000
Message-ID: <CAO5Uq5RNRnfH=_C4bDnT9u4puME_b_=G1DdmScHu7e4zanVF2A@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 18:52:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179172

IIRC the cross upgrade just works, its the target build which explodes:

https://github.com/akiernan/openembedded-core

On Mon, Mar 27, 2023 at 7:40=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Ok great, I'm willing to know more about the bootstrap of a rust toolchai=
n, I think I can start by just upgrading my poky master to rust 1.68 and se=
e what it spills out when I compile the hello world
>
> On the other hand, for enabling rust kernel modules in linux-yocto-dev, I=
 don't know where to start (full disclosure : I have no skills about kernel=
 and kernel module developments)
>
> Le lun. 27 mars 2023, 20:30, Alex Kiernan <alex.kiernan@gmail.com> a =C3=
=A9crit :
>>
>> Updating the rust version is pretty much nothing to do with your rust
>> knowledge and way more about digging into how the bootstrap process
>> hangs together... whilst I have an awesome rustacean working for me, I
>> don't think I've ever had to drag him into helping with an upgrade.
>>
>> I wish I could say I'd spent the last few weeks figuring out why the
>> upgrade broke, but I've been buried down the bottom of an ESP-IDF
>> application...
>>
>> Alex
>>
>> On Mon, Mar 27, 2023 at 7:08=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons
>> <frederic.martinsons@gmail.com> wrote:
>> >
>> > I'll look at this but I'm not sure if I can help since I'm a beginner =
(enthusiastic but still)
>> >
>> > Le lun. 27 mars 2023, 19:19, Alexander Kanavin <alex.kanavin@gmail.com=
> a =C3=A9crit :
>> >>
>> >> If you'd like to do more here's off the top of my head:
>> >>
>> >> - enable rust kernel modules in linux-yocto-dev
>> >>
>> >> - help Alex Kiernan with update 1.67 -> 1.68; we need as many people
>> >> as possible capable of updating the rust toolchain. It's often not
>> >> trivial:
>> >> https://lists.openembedded.org/g/openembedded-core/message/178272
>> >>
>> >> Alex
>> >>
>> >> On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
>> >> <frederic.martinsons@gmail.com> wrote:
>> >> >
>> >> > Ah!
>> >> >
>> >> > Alright, I'll try to setup a devtool test which demonstrate the usa=
ge of git subpath with the zvariant.
>> >> > I'll then issue a V4 series which reintroduce the zvariant recipe i=
n meta-selftest and the unit test on it.
>> >> >
>> >> > I must admit I felt in love for rust since the beginning of the yea=
r and considering that I use yocto on a daily basis, I'll do everything I c=
an to extend the support of developing rust for embedded devices.
>> >> >
>> >> > Thank you all for the advices.
>> >> >
>> >> > Le lun. 27 mars 2023, 16:25, Alexander Kanavin <alex.kanavin@gmail.=
com> a =C3=A9crit :
>> >> >>
>> >> >> So if devtool tests would operate on zvariant recipe, then the rec=
ipe
>> >> >> can simply go into meta-selftest after all :)
>> >> >>
>> >> >> Alex
>> >> >>
>> >> >> On Mon, 27 Mar 2023 at 16:20, Richard Purdie
>> >> >> <richard.purdie@linuxfoundation.org> wrote:
>> >> >> >
>> >> >> > On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote:
>> >> >> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>> >> >> > >
>> >> >> > > This series brings the support of local git repository inside
>> >> >> > > a cargo based recipe.
>> >> >> > >
>> >> >> > > It also enable devtool capacity on it and provide a real crate
>> >> >> > > example recipe to show how things are done.
>> >> >> > >
>> >> >> > > The following changes since commit 4876189dd2ae5a04a296b11b537=
b9f613159c6bf:
>> >> >> > >
>> >> >> > >   xcb-proto: Fix install conflict when enable multilib. (2023-=
03-23 22:38:41 +0000)
>> >> >> > >
>> >> >> > > are available in the Git repository at:
>> >> >> > >
>> >> >> > >   https://gitlab.com/fmartinsons/openembedded-core cargo-exten=
d-support-git-and-devtool
>> >> >> > >
>> >> >> > > Alex Kiernan (1):
>> >> >> > >   cargo_common.bbclass: Support local github repos
>> >> >> > >
>> >> >> > > Frederic Martinsons (4):
>> >> >> > >   cargo_common.bbclass: add support of user in url for patch
>> >> >> > >   rust-example: provide a recipe for zvariant
>> >> >> > >   devtool: add support for multiple git url inside a cargo bas=
ed recipe
>> >> >> > >   patch: support of git patches when the source uri contained =
subpath
>> >> >> > >     param
>> >> >> >
>> >> >> > The various rust/cargo/crate patches look like they're heading i=
n a
>> >> >> > good direction, thanks!
>> >> >> >
>> >> >> > The one thing which I think is missing is more support for testi=
ng some
>> >> >> > of these changes in our automated testing.
>> >> >> >
>> >> >> > In particular, devtool does have a decent test suite so we shoul=
d
>> >> >> > ensure new devtool additions have tests.
>> >> >> >
>> >> >> > You can see the devtools tests in
>> >> >> > meta/lib/oeqa/selftest/cases/devtool.py and run them with a comm=
and
>> >> >> > like "oe-selftest -r devtool -j 3" for example.
>> >> >> >
>> >> >> > Cheers,
>> >> >> >
>> >> >> > Richard
>> >> >> >
>> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >> > Links: You receive all messages sent to this group.
>> >> >> > View/Reply Online (#179160): https://lists.openembedded.org/g/op=
enembedded-core/message/179160
>> >> >> > Mute This Topic: https://lists.openembedded.org/mt/97840361/1686=
489
>> >> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/=
unsub [alex.kanavin@gmail.com]
>> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >> >
>>
>>
>>
>> --
>> Alex Kiernan



--=20
Alex Kiernan

