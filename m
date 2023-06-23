Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BA0EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:56:17 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.608.1687532170795365314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eAnhW0c8;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1a9a2724a62so557812fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 07:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687532170; x=1690124170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqMRSK7itVMvaGhW1Ry7j8iA/rTKtm4STaoLo2zarJM=;
        b=eAnhW0c8/0mk5LutrliNmnlWP0KbDUkQ07hY3s/Wi9SoglcCcuCJ6S9nJxLPE9topB
         0IqNzrAxT5RGW2u8rtoqqMPDBsQEhVnyZPwQulC+9AYUbvSXt39f1xki+7xppjDlTztZ
         8FCv3JEXtPv12gOu1CknawV1YjjmH/REN6fTs78HWQygONPRPRmWxJK0l93mUn5QPai0
         Xa6wE//9Dl+1cyGoUKx7I7dlMa06D0OlQmh4L0fmZvn7OTgwdr8G3oSqQsVfkLimShMO
         N1f/YYLx1Mttx6JtYm06fkip1RqqDWcvgPu53zf80mkpZCC2KmhRVZodPjopDpixqM/i
         Sl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687532170; x=1690124170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqMRSK7itVMvaGhW1Ry7j8iA/rTKtm4STaoLo2zarJM=;
        b=Hs04qHdbeSavipoFF3T06s22Kvedft/qffKLYHct1gwR3i3L52bvyE+/XxBEGWf/74
         ezs2YYZCKAIQ/3PR/XwGmXsT7ZaH4WZMQzpGPtJN0LJX39IIe6QhW5ixX/W/Zb/BTYQJ
         /bjLfAgUp89CphWLqj8Vn/ZbL7yoyaCblc1O5mhF5Njh4oyQOBmEx6vLIy9V8BzypcIE
         0+TprmJ7Bff3jR+2ae2yFBM/q4aqBuMgZkVCzoJEUGcJR9YnUHbz7CY43hAIcaEcFKvA
         hI6HnhszzJamOn2bR0WmSo0koUHP28yP9lvmiNdWVqlim4cOHVpkMgqfbfyDLPqheRTm
         T/NA==
X-Gm-Message-State: AC+VfDyCBatNYZQaMqvmpdj7mShcrGb56nAMlRP+foSGWNdXjef8Bu8S
	B41Vdc+8//qBobKXAXsoG8xGm+Gg5cnFafppdkgouKpD
X-Google-Smtp-Source: ACHHUZ5iT/7fQXj1h8nUDeX/jAs033BZZEvqkI4A/eEuOkkosfZVpyQBwkY4jyvDHnn+yHipaVlnyobzvIa5an6N36E=
X-Received: by 2002:a05:6870:1a90:b0:19f:3ea6:413c with SMTP id
 ef16-20020a0568701a9000b0019f3ea6413cmr14877912oab.0.1687532169931; Fri, 23
 Jun 2023 07:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
 <20230622161749.797820-2-maxime.roussinbelanger@gmail.com>
 <CANNYZj8KCSygjo9EPUD91oqOzdZhBkYVrJCVthu66bBSoQz8Jg@mail.gmail.com>
 <CAE=T-s78z1EsvaTs6AiSU2LXwB9Niq1_UGSWG1RmhSUkk1eGBw@mail.gmail.com> <CANNYZj_afN2+PxGrQVLShBnrKK6th7=EeUO-nrb3B7oZHrEU1w@mail.gmail.com>
In-Reply-To: <CANNYZj_afN2+PxGrQVLShBnrKK6th7=EeUO-nrb3B7oZHrEU1w@mail.gmail.com>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Date: Fri, 23 Jun 2023 10:55:40 -0400
Message-ID: <CAE=T-s4rMrn93u3f+BK-+XLyraaor0v75X5RXVhfBHMosJKz_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] insane: ignore nativesdk-${PN}-src host
 contaminated issue
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 14:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183330

On Fri, Jun 23, 2023 at 3:53=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 22 Jun 2023 at 20:04, Maxime Roussin-B=C3=A9langer
> <maxime.roussinbelanger@gmail.com> wrote:
> > > I'm not sure I understand this. The check is to ensure build process
> > > works as it should, specifically to prevent build host ownership
> > > leaking into packages. Yes this information doesn't matter when these
> > > packages are installed, but it matters for correctness of the build.
> > >
> > > Alex
> >
> > Maybe I don't get how this check is done because everything in the TMPD=
IR
> > is owned by the user running bitbake.
>
> Installation and packaging tasks run under 'pseudo', an abstraction
> that gives the tasks an illusion of running as root and setting file
> ownership without restrictions. On build host's disk it's all owned by
> bitbake user, but actual packages contain the desired ownership for
> the target package installation.

When you mention `packages`, do you mean the .rpm, .deb, etc?

What would be proper desired ownership inside those packages
for a nativesdk -src package? Is it suppose to be root?

Max.

>
> Alex

