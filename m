Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B49EB64DC
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 13:13:16 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.12583.1689858792625909807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 06:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MfmCskx7;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-78847bb8940so30884739f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689858792; x=1690463592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5KReKMVL3UT5mVlUDWWJE5oXt+Sld2murIyv14z5ZE=;
        b=MfmCskx7yVEd8AZUnN/5w35d08p/JkmAlkN6mfAgADBZPEG1l4g0Zm+jt2zwkleQtT
         d0zTNoEp+3w1vl7JotHGyL33MAE0vAqy/taP5EktFBQukLuiLQBBqJgm8kX8frsHltW1
         /QwPuslknP3v9Q14j1KHdOnv70FE6RosvG9wQsyh/orqXmHp2CTjXkt6EuxK+ZKEkMmk
         /8ZVwUGFNjDLKdvrmZFMBJEVD9BaOvsHe/LbXpyBQ2fzICY1cYKA1HDlYcHNf0fiiJk1
         6T2BU1B7PFw2/YA0OgUFmoupH0ISbI6R8+iv6NFQX8Y/aLtnpjc4ep/MSt++XMnp/Iec
         M8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689858792; x=1690463592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5KReKMVL3UT5mVlUDWWJE5oXt+Sld2murIyv14z5ZE=;
        b=QbH+f8703ayv9O5/AeJw07R8IKv0BNf+iJQyJ9WZPmHLS6QH1wjXU26AwIuZDtH4/x
         8nAoSxVe1UZMQPh+E2R6qSmfVhtgmPsb7TszhIVg8TshhoVjldBwmWSv0qCSsmFOlOum
         G5Q7zQrTLPlIWcJeGeSgoHpyF7QH8dRPbHOFtinsC+q6Oso6/IidNXD+eR0jk5dFZhbL
         qmTv+7G9nm4IQu6tzaTK/BRbMACcPZiG5twyWeAVAiCsTB8NpLY/rGi2Mddh8ztTDXyh
         HdAA3tuNa5ldvbES6tQviUJrD8GRfuA+qImtCtsBC04SBrT/mqFMAy5zuUmZsaCoQcpl
         ItSg==
X-Gm-Message-State: ABy/qLZGZARDgl+z9GokGcAFKnrksmkRhhZ0qbXmEvqPfYBXYsICKnoo
	d9R9YY862/hS0aYZlT2VfUswBNClbGVnFlDkGto=
X-Google-Smtp-Source: APBJJlEKKuDO0HEEAj2qEGvSGdo/jpzt3z74PMyzcjIBy8uUMZD7PoZNyrW3pCyPshyI1wdsLufa7KrY/Q8emdtcjbs=
X-Received: by 2002:a05:6602:2291:b0:786:25cf:421f with SMTP id
 d17-20020a056602229100b0078625cf421fmr2612237iod.19.1689858791818; Thu, 20
 Jul 2023 06:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4O92vHqJbTEqUDPktnuaCp-vzskCZeb_5iqr5NmfGNONg@mail.gmail.com>
 <TY2PR02MB3678ED281AB36D9AB6CBA9C68139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4OBjLFxO8x3X1tBvzwU9P=nFU4iVx-qgAphbrboqxu1nw@mail.gmail.com> <TY2PR02MB367838917BD294BF286FE226813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
In-Reply-To: <TY2PR02MB367838917BD294BF286FE226813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Jul 2023 09:13:03 -0400
Message-ID: <CADkTA4P6NXH-7am1emePfWaZN43e58FsWe9_Rdj2_PdXD6b9RA@mail.gmail.com>
Subject: Re: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
To: Petr Gotthard <petr.gotthard@advantech.cz>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 13:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184636

On Thu, Jul 20, 2023 at 6:06=E2=80=AFAM Petr Gotthard
<petr.gotthard@advantech.cz> wrote:
>
> > -----Original Message-----
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: Wednesday, July 19, 2023 11:56 PM
> > To: Petr Gotthard <petr.gotthard@advantech.cz>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSIO=
N
>
> > >
> > > The kernel is "linux-ti-staging_6.1" with quite standard settings.
> > > Recently I did explicitly set CONFIG_LOCALVERSION_AUTO=3Dn which was =
"y"
> > > by default. With the default "y" setting I was getting a kernel versi=
on with two
> > identical suffixes ("6.1.33-g8f7f371be2-g8f7f371be2", whereas the make-=
mod-
> > scripts used "6.1.33-g8f7f371be2").
> >
> > Did that only start happening recently ? because with the localversion_=
auto and a
> > set .scmversion, that's what I'd expect to happen (see below).
>
> > I'm curious if on-target module builds work on those boards, since as n=
ear as I can
> > tell the versions won't match (as the .scmversion file isn't captured, =
so the
> > vermagic will be different).
>
> The commit https://git.yoctoproject.org/poky/commit/?id=3Dbb0f9e87700aa40=
ec8db880ede3c018c1d055786
> seems to be the cause here.

I already described in detail about how that commit (which is mine),
is not the only cause.  I'm
quite aware of what is happening now. What is currently in place in
those recipes is about to break
and really was only working by a combination of careful dancing
through the fragility.

My question was about CONFIG_LOCALVERSION_AUTO being something that you cha=
nged
after the first issue popped up (I understood what it was changing
from your first description)
I can't clearly see if you turned it on in response to the breakage,
but I'm assuming that the
answer is yes.

Cheers,

Bruce

> Before this commit all modules (both out-of-tree and the standard ones) h=
ad a version with one suffix ("6.1.33-g8f7f371be2") and could be loaded.
> After this commit:
>  - the standard modules have two suffxes ("6.1.33-g8f7f371be2-g8f7f371be2=
") and work fine
>  - the out-of-tree modules have a "vermagic" with only one suffix ("verma=
gic=3D6.1.33-g8f7f371be2") and fail due to the vermagic mismatch
>
> Setting CONFIG_LOCALVERSION_AUTO=3Dn removes one suffix from everything, =
so the mismatch for out-of-tree modules remains.
>
>
> Petr
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

