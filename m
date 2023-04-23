Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33695C6FD18
	for <webhook@archiver.kernel.org>; Sun, 23 Apr 2023 19:55:47 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.35195.1682279737320385379
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Apr 2023 12:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TQe8G5Dp;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-763ae18986cso50862039f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 12:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682279736; x=1684871736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REJ8gzdrVMaq/w4PjjoMsUZ5M7VrLUSE1+Zj7ab3Q6Q=;
        b=TQe8G5DpD8gfk8h3MVaLBLS2eptqG4MiN4hXj3kwTOUyM7BAC5J0eUNcJoVEWA71ej
         BMpAIZNqjgkNvZm822Y+FayLzV5O+SqCNb0fm1qAgwkFbq1QMUchf9GZNkGEWsEXkXov
         YNUOOJgizoji4PPKQokDn51uIxnnmBB9dqOXSReNOQg0jPxTNVRSBilUBXh06TbDrNkJ
         0BHPMv4z1locZLd0dyaUp+dGtPSPCghva1nYybYovXF6kKqVm4p9P99rLX8d13Gly7Uu
         XCWrmxiE7r7Y1ggFuipnwNIKTQta7H/kC2UlJj1tmCBoYOQ+gCqSwycgT8rFKZ/AYrzu
         OW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682279736; x=1684871736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REJ8gzdrVMaq/w4PjjoMsUZ5M7VrLUSE1+Zj7ab3Q6Q=;
        b=J8YHF9OuMaM8ZDmjiHiJ3fyT5At2i3ioX2UhFZ/grD+iTLniJAc6pMMFeE1cY0XYzC
         tjBGPPW09MKJPRmJEKQGVugObQwh3OekTjC0T6Xz2xjeAYJgSwWb3Qaqjw5GPU1ESzKt
         lQMXaLFvj627HY0LnYiuIppRa+Pa5AAjFOTP5PV7M9OJkzemN1x4X+WUw/cdcxvj+8MS
         /CYzFP+nXiBMdw6dpDQVpZqZIRTJXC3K7uAmqcWxQzVKLGNqfvIRfGlgcueXmzi2s5cz
         0BlWvk0P+OoukuA+MHRvEQTP2a8ix3ilfK0bViEh9kYqBdqpiAanNCDczmuwWxhA0tzv
         kRIA==
X-Gm-Message-State: AAQBX9cywNZoS/OugV/VGccCbZ9XQBd2P89N1tfctQutsmUtlnqQEHmC
	VAHWCxnsMCeKqOc37un6GQfv6tmbbFlf4s5cu3M=
X-Google-Smtp-Source: AKy350YQjA/iIwGdSUHNvB0ezebXv01HU5lLC8o5mogW9yvTPmPPwxZMjfLihVpr3Sh19/JJZ4ofISBd2odimSlKaN4=
X-Received: by 2002:a6b:6502:0:b0:758:917b:c313 with SMTP id
 z2-20020a6b6502000000b00758917bc313mr4626646iob.13.1682279736504; Sun, 23 Apr
 2023 12:55:36 -0700 (PDT)
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
 <7b254d25-03b9-5d0a-4257-4d43c50d069f@email.de>
In-Reply-To: <7b254d25-03b9-5d0a-4257-4d43c50d069f@email.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 23 Apr 2023 15:55:29 -0400
Message-ID: <CADkTA4OPx0hNnp1MfAyB45H8j4Degyz9JtVcXxK_sta=X1AKaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Christoph Lauer <Christoph.Lauer@email.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Jose Quaresma <quaresma.jose@gmail.com>, openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 19:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180336

On Sat, Apr 22, 2023 at 9:06=E2=80=AFAM Christoph Lauer
<Christoph.Lauer@email.de> wrote:
>
> Am 21.04.23 um 22:28 schrieb Bruce Ashfield:
> > On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >>>
> >>> On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
> >>>> Hi,
> >>>>
> >>>> Not related with the previous discussion but just for
> >>>> your information.
> >>>> The rm_work.bbclass has an exception for the kernel recipes [1].
> >>>> So I don't understand why we can't do the same for the make-mod-
> >>>> scripts
> >>>> who is the twin brother of all these kernel recipes.
> >>>>
> >>>> [1]
> >>>> https://git.openembedded.org/openembedded-core/tree/meta/classes/rm_=
work.bbclass#n168
> >>>
> >>> Ideally we wouldn't be doing this for the kernel recipes.
> >>>
> >>> There is also a big difference to that and the proposed patch. The
> >>> proposed patch was preserving a specific directory rather than an
> >>> entire recipe. Removing the task stamps but leaving a small piece of
> >>> WORKDIR is quite different to preserving WORKDIR and STAMPS for a
> >>> specific recipe. The former is not tested and will break things. The
> >>> latter is better tolerated by bitbake.
> >>
> >> Agreed.
> >>
> >> Plus, I am working on this now.
> >>
> >> I have static linking of the scripts/tools working, but what I haven't
> >> figured out is how to do that without patching the Makefiles.
> >>
> >
> > It turned out to be quite the battle to get older kernels what was
> > required for static linking of the tools.
> >
> > Attached is my WIP patch. I'm out of the office early next week, but
> > will revisit it once I'm back.
> >
> > Bruce
> >
> >> Next up will be some rpath trickery.
> >>
> >> Bruce
> >>
> >>>
> >>> So yes, we could do the same. I'm sure there will be other recipes
> >>> people want to preserve for other reasons. Where do we draw the line?
> >>> We could preserve everything and drop rm_work, then we wouldn't have
> >>> these problems? :)
> >>>
> >>> Cheers,
> >>>
> >>> Richard
> >>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#180233): https://lists.openembedded.org/g/openembe=
dded-core/message/180233
> >> Mute This Topic: https://lists.openembedded.org/mt/98296212/1050810
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
> >
>
> Thank you for your work, I see you put some time and effort into it.
> HOSTPKG_CONFIG is, as you mentioned, available since kernel version 5.19

Yes, I realize that and documented it in the patch ... but I also
tested on pre-5.19 kernels and what I have in the patch works. Did it
not work in your testing ?

> (see kernel patch [1]), so we need a way to call 'pkg-config --static'
> with pre-5.19 kernels. A way without modifying the Makefile would be to
> modify openssls pkg-config in recipe-sysroot-native of make-mod-script,
> so 'pkg-config --libs' actually shows the dependencies of 'pkg-config
> --static --libs', but it's a bit hacky.

Already considered, and discarded. That's not going to fly.

>
> Also fully-static executables still need the same glibc during runtime
> that they were built with, which makes them error-prone and is generally
> discouraged. As an alternative, we could build dynamic executables that
> use the static libcrypto library. The linker links by default against
> the shared library, so we could remove them from recipe-sysroot-native
> to force linking against the static library (again, somewhat hacky).

Also considered and discarded.

As do the dynamically linked ones for the c runtime. We aren't talking
about using these outside of a single build and they are generated on
the fly, so again, there's very little concern about runtimes changing
after linking.. There's less risk in static than in the alternatives.

Bruce


>
> [1]
> https://github.com/torvalds/linux/commit/d5ea4fece4508bf8e72b659cd22fa484=
0d8d61e5



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

