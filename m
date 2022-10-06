Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D14C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 13:30:18 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web09.5809.1665063010501161226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 06:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JwHhXKxe;
 spf=pass (domain: gmail.com, ip: 209.85.167.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id g130so1975283oia.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKYCNnUA6l8bTQyDQzHzF54r2Is/WyAov1XxycuGivw=;
        b=JwHhXKxea0YaqJ6U8gQq8+9WYLRBiPG/+iYGfGG760pV7WzAt/jfxrcMTRgyOB2w4e
         hrFXhAvn9q+TvJdS+fYlq/yYfVhSAxUuRQ3VzBHEq3lIveg4l3/xfMPo19LV0GPMTHeS
         MLIMAZmNw6gpC8XCN2hiB7/mAEbYcf9UZs0Q5pVy9G8tjvphWEfT51wgl76AsQCpAoj9
         V5f43dxYPA4dnXOD9gr8ldzJUMCTRbTpQ3TZoYDNu1Vw/OLhxnvjFzkRa4bhyOe3Ik5j
         xlFObIw4VVWEwiy7+lcBD44iyCsDgnPOUrCq6QDYsbzUymY2X8T47gZecEuF9jnWZBo2
         St/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKYCNnUA6l8bTQyDQzHzF54r2Is/WyAov1XxycuGivw=;
        b=1AfjCr3NO0+Hci8XHcitw3sjXZkPQspFffOnVUS+oK8NWVCn5E09yn6q3ne3bmEHQa
         QsCEfGNZUXf65EBfHTCyiUsynmgYFi1P/c4vsQoGTbi5v6O+WFQxevyxetNsAMxMCHZw
         IuedHV1aYTNsM8gpPp1V3eQMjyrekEKedySSDuVjdm5M/VsTGAfuy2C9Uykj5sET6ZC5
         RbdnKBSSItkrZz1QgL2w0lpdFrqGt2lXVIUR8nEYfp48PKhl2W2MoS3kR7bgqBSJHm8a
         kaVn5Xx+t6W15aJXR/wy5keEwTxqzuv7mzAOw64JEuUyW0HStef1u3TovIPLYxY5clbM
         r6Qg==
X-Gm-Message-State: ACrzQf1UzMv2bEINkb61pKRmLX8W9O32o31F7M8pwW+dMjJByJOk0IVf
	/unUODqs9ARRtvA3y4G7RHvqP3eze0ix4yoP6Xk=
X-Google-Smtp-Source: 
 AMsMyM4I/O1z2UkZ/67KEczgf2WXW3S0dUvbeZp+tueEoi59MTccPIUJ0tqbA0EQg8lEJ4yUAlBfoRFwD+koeMCL2j4=
X-Received: by 2002:aca:1b0f:0:b0:353:f306:198b with SMTP id
 b15-20020aca1b0f000000b00353f306198bmr2527731oib.96.1665063009796; Thu, 06
 Oct 2022 06:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
 <ce66ad3692d01831e5f41f27702c01744a8708c5.1664904217.git.bruce.ashfield@gmail.com>
 <8757104C-1103-45EA-8CEF-43EEE0CF18F8@arm.com>
 <CADkTA4OKoeVa0VgJjEKbsoATtmQ03L28p1QVUdn0ibJ=jcoEwA@mail.gmail.com>
 <401F2D51-AB9E-4D52-84D4-E15C18D6A88A@arm.com>
In-Reply-To: <401F2D51-AB9E-4D52-84D4-E15C18D6A88A@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Oct 2022 09:29:58 -0400
Message-ID: 
 <CADkTA4MXezS7rJBJmHsMDX2EEN4nu4HCwsGc=cEDgkLhz1PZuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 13:30:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171501

On Thu, Oct 6, 2022 at 9:13 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 6 Oct 2022, at 13:38, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Thu, Oct 6, 2022 at 7:29 AM Ross Burton <Ross.Burton@arm.com> wrote:
> >>
> >> On 4 Oct 2022, at 18:27, Bruce Ashfield via lists.openembedded.org <br=
uce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >>> -inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3t=
argetconfig', '', d)}
> >>> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3t=
argetconfig setuptools3', '', d)}
> >>
> >> For reasons, setuptools3-base does this:
> >>
> >> RDEPENDS:${PN}:append:class-target =3D " ${PYTHON_PN}-core=E2=80=9D
> >>
> >> So buildhistory-diff says:
> >>
> >> packages/qemuarm64-poky-linux/perf/perf: RDEPENDS: added "python3-core=
=E2=80=9D
> >>
> >> I=E2=80=99m guessing that isn=E2=80=99t what you meant.
> >>
> >
> > We do need the python support on the target when perf is installed.
> > Isn't that what python-core provides ?
> >
> > While it maybe wasn't a RDEPENDS before, it really should have been
> > (if python-core does provide the runtime bits for target execution).
>
> Sure, but there=E2=80=99s a perf-python package that contains all of the =
python stuff, right? So the RDEPENDS should be there (and is already).

Indeed, that's why it would have worked before.

I'm not particularly concerned if the extra RDEPENDS arrives with
this, since if it is acceptable for other packages inheriting the
setuptools (I thought it was build support only!), it really should be
ok for perf as well. In particular since perf is debug/optional. Or am
I missing something there ?

Bruce

>
> Ross
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

