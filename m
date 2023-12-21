Return-Path: <cordonnier.etienne@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D942C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 21:40:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.5613.1703194847566399364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 13:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RRhQXrMu;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: cordonnier.etienne@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c6ea99429so13643035e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 13:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703194846; x=1703799646; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLCNdb+nyBrGMm9VRyR5TB5CQPwm6caOVL4Zr3k85Uw=;
        b=RRhQXrMuzZTddW2oBORiIXs9E0n5aWOMH2JCIzPsvpV5BS9e5+iCCZdK8QhrKyF6g3
         foKQ9vcLIT+htLvKXk2bD1AawofXtrUlNUAwCa1wDO5p2bGHdi07A+shDBpE11rNseAe
         l3xFns9wjOwCchE9GnRHMCXkEJn/gc62QT0CWZzX1dKgmIBt10HBlZWfKuNY2y1W5B5j
         8yzzwww2uPuGIoswcJCMuY+FxsQwYrbTcjX09bs1+VzdGpTSDiBtCgSIDzqmIyDOHlLI
         6bAcK5v0FUdUwj9/zfBk+liIzHBr9Wlr3OguWMTxNw3aVfTCZE/4lLRuhHVezAMErT/x
         OMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703194846; x=1703799646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLCNdb+nyBrGMm9VRyR5TB5CQPwm6caOVL4Zr3k85Uw=;
        b=oetDSaTwQB0xDKAoONePXSCN0JBrqr57jOArFGBus1euOgsCXzsjy7OKY4VYjBX4nn
         EMM3Up4XcpWmXvFwXD+TWTWEaKk/gMggUwAyfc2gofB3IFai2mbFF5m9LEUEmsa8MajA
         oCeDGAYM2WGQ7GvyCDS71uKu00KiyjnfLD5vv1bVPqIjBSWV4zDlmxDay/U7Oi0FMkRx
         3nnfrIESze7zANylt8LFBL0vt+gymHTEh3z60doJM8mnb3dljM+zIVvbKEJTP2oSbivO
         B1rUcyqofEQsueUuY5Hx6uogUyoPbimQLC0y5EaRnoxphY19AWL3NBMprkfGN/yzELPL
         yVfA==
X-Gm-Message-State: AOJu0YxJg3p33yoZ/bFn+UU+x/VwuPBY/U5WWGE3hjsfHnkCJBizePpV
	nA78Ba6xG1hklPntZoiV0zLyCDhjPhr0hDQUlI8=
X-Google-Smtp-Source: AGHT+IHYV/JnEQ34vhudOvIJtbi+efAn637LrBfqP4k2evmza+NzVseWIe4zQeXfZ9YTGRf+N7JEsIZlPGSCInGWdrA=
X-Received: by 2002:a05:600c:1e88:b0:40d:377f:51ef with SMTP id
 be8-20020a05600c1e8800b0040d377f51efmr134230wmb.55.1703194845627; Thu, 21 Dec
 2023 13:40:45 -0800 (PST)
MIME-Version: 1.0
References: <17A23F37CD7211A7.10836@lists.openembedded.org>
 <CAHUKmYZ_czf-Zg=Mr5fN9nREnq3iE8VAiLSRS7hOAN7qRcTX5w@mail.gmail.com>
 <CAMKF1sqpj_PCmQ5KRevqiBMxi6up4rdp3xZ-9TwD3fLOAzhouw@mail.gmail.com>
 <CAJFWPWaSCUcjL1kQ3EWfWqd=95rbY8P9iOddxCTtoR0AE0cKQg@mail.gmail.com>
 <CAJFWPWaocc9xbTSBohwPXf=mkKwSY8tW_eLKW3p_43JehQrisQ@mail.gmail.com> <d031b402-495f-48d2-9c5f-8d5f85e8a12d@gmail.com>
In-Reply-To: <d031b402-495f-48d2-9c5f-8d5f85e8a12d@gmail.com>
From: Etienne Cordonnier <cordonnier.etienne@gmail.com>
Date: Thu, 21 Dec 2023 22:40:34 +0100
Message-ID: <CAJFWPWZzZcbi70Ny8VkDTv7ru=fm_Huoc=e8jtibtAmDDwQ46A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: Khem Raj <raj.khem@gmail.com>
Cc: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 21:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192849

I was able to reproduce. Adding ignore_dangling_symlinks=3DTrue was
enough to fix the issue (the repository contains dangling symlinks:
https://github.com/varigit/linux-imx/tree/5.15-2.0.x-imx_var01/tools/testin=
g/selftests/drivers/net/dsa
).

On Thu, Dec 21, 2023 at 9:29=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On 12/21/23 12:12 PM, Etienne Cordonnier wrote:
> > Also which release of yocto are you referring to? Both those
> > repositories don't have a nanbield branch.
> >
> > On Thu, Dec 21, 2023 at 9:09=E2=80=AFPM Etienne Cordonnier
> > <cordonnier.etienne@gmail.com> wrote:
> >>
> >> Is it from https://github.com/varigit/meta-variscite-bsp-ti or
> >> https://github.com/varigit/meta-variscite-bsp-imx ? I did not find a
> >> repository called "meta-variscite-bsp".
> >>
>
> yes it has been renamed upstream
> https://github.com/varigit/meta-variscite-bsp-imx/tree/kirkstone-var02/re=
cipes-kernel/linux
>
> use kirkstone-var02 branch
>
> >> On Thu, Dec 21, 2023 at 5:14=E2=80=AFPM Khem Raj <raj.khem@gmail.com> =
wrote:
> >>>
> >>> this fails in linux-variscrite recipe from meta-variscite-bsp
> >>>
> >>> https://snips.sh/f/9klGZxlCRE
> >>>
> >>> On Tue, Dec 19, 2023 at 5:40=E2=80=AFAM Etienne Cordonnier via
> >>> lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org=
>
> >>> wrote:
> >>>>
> >>>> Patch v4: use idempotent copy of the files instead of simply skippin=
g the code (see discussion under v2 of the patch).
> >>>>
> >>>> On Tue, Dec 19, 2023 at 2:38=E2=80=AFPM Etienne Cordonnier via lists=
.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
> >>>>>
> >>>>> From: Etienne Cordonnier <ecordonnier@snap.com>
> >>>>>
> >>>>> The function do_symlink_kernsrc is not reentrant in the case where =
S is defined
> >>>>> to a non-default value. This causes build-failures e.g. when buildi=
ng linux-yocto, then updating
> >>>>> poky to a commit which modifies kernel.bbclass, and then building l=
inux-yocto again.
> >>>>>
> >>>>> Bugzilla: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bu=
gzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIDAg&c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkS=
Ga66m67E&m=3DVB1zXAiE9q_CqM9DgoA0BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSu=
Ik&s=3D9Cr8vwWgUwwGM5oCO07DB4sO9sQpMCdweS1u8CmZ0Qw&e=3D
> >>>>>
> >>>>> Tested with a recipe "my-custom-linux" which unpacks sources to a c=
ustom ${S} directory
> >>>>> and ran symlink_kernsrc several times:
> >>>>> $ bitbake -f -c symlink_kernsrc my-custom-linux
> >>>>>
> >>>>> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> >>>>> ---
> >>>>>   meta/classes-recipe/kernel.bbclass | 8 +++++++-
> >>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-reci=
pe/kernel.bbclass
> >>>>> index 9ff37f5c38..42c5519f81 100644
> >>>>> --- a/meta/classes-recipe/kernel.bbclass
> >>>>> +++ b/meta/classes-recipe/kernel.bbclass
> >>>>> @@ -189,11 +189,17 @@ python do_symlink_kernsrc () {
> >>>>>               # drop trailing slash, so that os.symlink(kernsrc, s)=
 doesn't use s as
> >>>>>               # directory name and fail
> >>>>>               s =3D s[:-1]
> >>>>> -        if d.getVar("EXTERNALSRC"):
> >>>>> +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
> >>>>>               # With EXTERNALSRC S will not be wiped so we can syml=
ink to it
> >>>>>               os.symlink(s, kernsrc)
> >>>>>           else:
> >>>>>               import shutil
> >>>>> +            # perform idempotent/reentrant copy
> >>>>> +            s_copy =3D s + ".orig"
> >>>>> +            if not os.path.isdir(s_copy):
> >>>>> +                shutil.copytree(s, s_copy)
> >>>>> +            bb.utils.remove(s, recurse=3DTrue)
> >>>>> +            shutil.copytree(s_copy, s)
> >>>>>               shutil.move(s, kernsrc)
> >>>>>               os.symlink(kernsrc, s)
> >>>>>   }
> >>>>> --
> >>>>> 2.36.1.vfs.0.0
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>
> >>>>
> >>>>
> >>>
> >>>
> >>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192848): https://lists.openembedded.org/g/openembedde=
d-core/message/192848
> Mute This Topic: https://lists.openembedded.org/mt/103262114/7259375
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [co=
rdonnier.etienne@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

