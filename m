Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECC7C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 19:25:13 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.61682.1682364312436005796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 12:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GX850BzM;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-763c3429abaso122783839f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 12:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682364311; x=1684956311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9OSZJTA5Nh+i2QiMv+Z868enNy05A4oWbfU645IIUo=;
        b=GX850BzMmsrMZ1uogwhsOxVmJR2EuB3Glkw3EWcCzYCthIBSgRNpd4XLjcrkxYxAvE
         02Q2z93j+WPyr2gu2g9lRs2Q+qpQtPwZlVuKNTyj5qhTOfNiEHf99uuCvQqXz7A1dJ9P
         a7rlRPVWieleVOxr7T+7J3drKdG6lAlQ46QpIelU03hJXvQdj4WqdY+u8iipwLIMxYk7
         6qQOmoGaYTZyUkvVOR3EWmFslvAJBB00DoQCLfsTo26VdPh01KWBQbClU7Kbnq/xIxEM
         25wYL2CauYt6M8tbZzx1hiKN9xCzhr2+PeHAyQeR+/JXXujbLi/Ud5r7WPAzVWUgy06S
         FWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682364311; x=1684956311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9OSZJTA5Nh+i2QiMv+Z868enNy05A4oWbfU645IIUo=;
        b=Kk1ZIsfZGlfTgkrk2rA90pRfSJUQi5ETO7qeRT9M9i4PvjLuiLbnf21vaYI7afJINX
         QZbWFlhnx7zI/bhUmUnyjCKyk6XOBxsUeXclPob0RXrTvUwdTzpRjWOUsWGCaQGBWtd5
         +yK1NWdWFI/LJlKr/TZNNNEwluD9tyCxaRuBk2ksDjKFenr6ezEZt/c0MV23o24jJMCg
         Rw6y4JwNHNHF9H5NzfzW0MSRDD2pPlXOEJNOpr0hcjKu+52v4dJqWH98VyDIOczeuxid
         Ko1NwX2BrqZ/fBZK4n10+SIstM3Mxm4ghNftA4oo9GslxDe7cz0GQxNlSwS4pZpLBtZQ
         cXJQ==
X-Gm-Message-State: AAQBX9dJbK6/11yyL7ZcTp+Z4gYh/OJiJF1uxE/r0fXFZlnWkHQXdl8c
	blbqab3QkkPWRL2gOhQsEJVo9viRemfWtMnsq7M=
X-Google-Smtp-Source: AKy350aiFklpLZ49PChsK5pNEcXeDRloTQXj5IBWt1fSjLXNT6bOvjep51I3ZKTdhe22pM90g2e0UErZ8ATDs9z633Y=
X-Received: by 2002:a6b:e501:0:b0:758:7abd:959f with SMTP id
 y1-20020a6be501000000b007587abd959fmr6556430ioc.18.1682364311499; Mon, 24 Apr
 2023 12:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
 <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
 <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com>
 <CANPvuR=M0-ndA609d2i43rgVVSPrHzEeo5o7orRjmeR9BA5_QQ@mail.gmail.com>
 <CADkTA4MMj6qUNHyjNV6QxE0iZAwA8=Ur6Ks4_7ETJtmrv6TrNA@mail.gmail.com>
 <CANPvuRmb7Kh3hgjZEcr1vU4czrULvLYabk3apBERQbo4RJ8y3w@mail.gmail.com>
 <afb0f1d6405256d9dfc6bd5bc0a642ddb1dd82c5.camel@linuxfoundation.org>
 <175785898B60CE37.9727@lists.openembedded.org> <CADkTA4MQty2wAcBrDGT=vqVeAHpMbzKjpf8-6xbH7UKa2R6wsg@mail.gmail.com>
 <7b254d25-03b9-5d0a-4257-4d43c50d069f@email.de> <CADkTA4OPx0hNnp1MfAyB45H8j4Degyz9JtVcXxK_sta=X1AKaw@mail.gmail.com>
 <CANPvuRnWCXKCyYEmrLfGRxmrC0w4dDnSNN_H3-LfmOyctQ9XwA@mail.gmail.com>
In-Reply-To: <CANPvuRnWCXKCyYEmrLfGRxmrC0w4dDnSNN_H3-LfmOyctQ9XwA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Apr 2023 15:25:04 -0400
Message-ID: <CADkTA4MwPcPnqQaAPDP-5vR=aEzKFDq9OaA=NA0hspKB2Nzz6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Christoph Lauer <Christoph.Lauer@email.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 19:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180364

On Mon, Apr 24, 2023 at 6:30=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia domingo, 23/04/=
2023 =C3=A0(s) 20:55:
>>
>> On Sat, Apr 22, 2023 at 9:06=E2=80=AFAM Christoph Lauer
>> <Christoph.Lauer@email.de> wrote:
>> >
>> > Am 21.04.23 um 22:28 schrieb Bruce Ashfield:
>> > > On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield via
>> > > lists.openembedded.org
>> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>> > >>
>> > >> On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie
>> > >> <richard.purdie@linuxfoundation.org> wrote:
>> > >>>
>> > >>> On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
>> > >>>> Hi,
>> > >>>>
>> > >>>> Not related with the previous discussion but just for
>> > >>>> your information.
>> > >>>> The rm_work.bbclass has an exception for the kernel recipes [1].
>> > >>>> So I don't understand why we can't do the same for the make-mod-
>> > >>>> scripts
>> > >>>> who is the twin brother of all these kernel recipes.
>> > >>>>
>> > >>>> [1]
>> > >>>> https://git.openembedded.org/openembedded-core/tree/meta/classes/=
rm_work.bbclass#n168
>> > >>>
>> > >>> Ideally we wouldn't be doing this for the kernel recipes.
>> > >>>
>> > >>> There is also a big difference to that and the proposed patch. The
>> > >>> proposed patch was preserving a specific directory rather than an
>> > >>> entire recipe. Removing the task stamps but leaving a small piece =
of
>> > >>> WORKDIR is quite different to preserving WORKDIR and STAMPS for a
>> > >>> specific recipe. The former is not tested and will break things. T=
he
>> > >>> latter is better tolerated by bitbake.
>> > >>
>> > >> Agreed.
>> > >>
>> > >> Plus, I am working on this now.
>> > >>
>> > >> I have static linking of the scripts/tools working, but what I have=
n't
>> > >> figured out is how to do that without patching the Makefiles.
>> > >>
>> > >
>> > > It turned out to be quite the battle to get older kernels what was
>> > > required for static linking of the tools.
>> > >
>> > > Attached is my WIP patch. I'm out of the office early next week, but
>> > > will revisit it once I'm back.
>> > >
>> > > Bruce
>> > >
>> > >> Next up will be some rpath trickery.
>> > >>
>> > >> Bruce
>> > >>
>> > >>>
>> > >>> So yes, we could do the same. I'm sure there will be other recipes
>> > >>> people want to preserve for other reasons. Where do we draw the li=
ne?
>> > >>> We could preserve everything and drop rm_work, then we wouldn't ha=
ve
>> > >>> these problems? :)
>> > >>>
>> > >>> Cheers,
>> > >>>
>> > >>> Richard
>> > >>
>> > >>
>> > >>
>> > >> --
>> > >> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>> > >> thee at its end
>> > >> - "Use the force Harry" - Gandalf, Star Trek II
>> > >>
>> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > >> Links: You receive all messages sent to this group.
>> > >> View/Reply Online (#180233): https://lists.openembedded.org/g/opene=
mbedded-core/message/180233
>> > >> Mute This Topic: https://lists.openembedded.org/mt/98296212/1050810
>> > >> Group Owner: openembedded-core+owner@lists.openembedded.org
>> > >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [bruce.ashfield@gmail.com]
>> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > >>
>> > >
>> > >
>> >
>> > Thank you for your work, I see you put some time and effort into it.
>> > HOSTPKG_CONFIG is, as you mentioned, available since kernel version 5.=
19
>>
>> Yes, I realize that and documented it in the patch ... but I also
>> tested on pre-5.19 kernels and what I have in the patch works. Did it
>> not work in your testing ?
>
>
> I will test the patch on a couple of kernel versions with some of them pr=
e-5.19
> but all in 5 major versions.
> I will say something about my results later this week.

5.15-stable also has the pkg-config changes

Bruce

>
> Thanks for working on this one.
>
> Jose
>
>>
>>
>> > (see kernel patch [1]), so we need a way to call 'pkg-config --static'
>> > with pre-5.19 kernels. A way without modifying the Makefile would be t=
o
>> > modify openssls pkg-config in recipe-sysroot-native of make-mod-script=
,
>> > so 'pkg-config --libs' actually shows the dependencies of 'pkg-config
>> > --static --libs', but it's a bit hacky.
>>
>> Already considered, and discarded. That's not going to fly.
>>
>> >
>> > Also fully-static executables still need the same glibc during runtime
>> > that they were built with, which makes them error-prone and is general=
ly
>> > discouraged. As an alternative, we could build dynamic executables tha=
t
>> > use the static libcrypto library. The linker links by default against
>> > the shared library, so we could remove them from recipe-sysroot-native
>> > to force linking against the static library (again, somewhat hacky).
>>
>> Also considered and discarded.
>>
>> As do the dynamically linked ones for the c runtime. We aren't talking
>> about using these outside of a single build and they are generated on
>> the fly, so again, there's very little concern about runtimes changing
>> after linking.. There's less risk in static than in the alternatives.
>>
>> Bruce
>>
>>
>> >
>> > [1]
>> > https://github.com/torvalds/linux/commit/d5ea4fece4508bf8e72b659cd22fa=
4840d8d61e5
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

