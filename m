Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D671C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 17:12:23 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.45242.1660842736561095862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 10:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LyoN3V4c;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id o2so2965120lfb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 10:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=vNm9uOfIdLepapmNN2UzzamYzRGd5SIsvAM5pGpn584=;
        b=LyoN3V4cozBZMyNe0BZdS1vRqcrwF2grzJgAT7yoZ5qPPjT5c/e7dPaiFrooPIeLpI
         spC4fUXHbf24FQMN0oIDTnFJYvqh5olG89Ip3QU5R50Dn+y9vLTE4ThGfxqJmyKJ4VS3
         CY9zvnSfvnyfP4KXb346RbHBhqXEXNJTJIqX/4o6H08nfxHDp1iYMjpTVW3hq+pdynjk
         3KDGAeMgqsjijzurfU6P/m1S1WwQSYtILVvik6yd/rLiU/JAsIvg3UeHEyon/EsfTnEf
         LvgHg8LQsf6ALvz4I/HIY55grNwTSxEEEZKBrpOVtNYuODLcbpIu7Eus4fdWRWkwJCQi
         DEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=vNm9uOfIdLepapmNN2UzzamYzRGd5SIsvAM5pGpn584=;
        b=pnDatKkxP8woPjUY3Z7mJ4ab353+hjtSkcn2+LM38avAUZ4Rmfq9y4dTZhczCRnICU
         IiepRaQFwEkryBHYrz7qvJ9/j6W7TsRyi4lUNpi/6T2TwYO8ge8fF+AhjGGIP+FY1tZN
         oLG/7Ga+KW7Jqb/Q0tt42zF3XRC8aNKnbDRXrSw/i90ByKaKCtrpcjqW1o7s+SvxxQTu
         J8jZ1RurQASZjamXQSlF6gxaXhFTjbq0SzrhCAKcCvSSc0UyqvboqOqdPjqLebvFN0lF
         ZXiHaOGpz3uHTrXJIy/KYAgbGvrQJkdxqJYA37RQ9SufuPUEeSsuYkXFsm+R0EpHCbwS
         NKdQ==
X-Gm-Message-State: ACgBeo1EnU6u72smDLSiPwVJSsWm/PimNuopzS0tIBntzl9gV5pxzLOw
	ObLvhLoMCqODaq1TLHVDc1+b41bmgIPhc0HTIw0=
X-Google-Smtp-Source: 
 AA6agR7LB7dv5LhEDXXBoDUpbds7R9UkGsZIvoFSKd7lbLdhRSlfftF6LzXUmrvea/uWh8hcLZYr+wdUfh4yw+h3hvU=
X-Received: by 2002:a05:6512:b98:b0:492:beef:a6a5 with SMTP id
 b24-20020a0565120b9800b00492beefa6a5mr1010708lfv.358.1660842734504; Thu, 18
 Aug 2022 10:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
 <20220815182503.2007534-1-drew@moseleynet.net>
 <43f17af6-eb16-efd3-ce23-374ea6791c52@gmail.com>
 <CAMKF1spqYbHNQ7nWbPiM8jmy=pZNM3h7UvRhPfCRaYORuo7qDw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spqYbHNQ7nWbPiM8jmy=pZNM3h7UvRhPfCRaYORuo7qDw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Aug 2022 19:12:02 +0200
Message-ID: 
 <CANNYZj_g=Rc0PUUH5xb=o=WmPJEFhERNAmtD8kR7-VeZQz5suA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rng-tools: Change "Requires" to "WantedBy" for
 dev-hwrng.device
To: Khem Raj <raj.khem@gmail.com>
Cc: Drew Moseley <drew.moseley@gmail.com>, Claudius Heine <ch@denx.de>,
	Dragos-Marian Panait <dragos.panait@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 17:12:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169534

I am definitely seeing a serious regression where qemu images get
stuck for 4 minutes on boot waiting for /dev/hwrng, so if this is
fixing the issue, I'd appreciate getting it in!

Alex

On Mon, 15 Aug 2022 at 20:48, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Aug 15, 2022 at 11:30 AM Drew Moseley <drew.moseley@gmail.com> wrote:
> >
> > Hi Khem,
> >
> > It looks like you recently removed both the dependency on hwrng and
> > systemd-udev-settle.  Do you think this change will be useful?
>
> Depending on udev-settle certainly seems an overkill so that should go.
> the change you have made will now ensure that this service starts when
> dev-hwrng device is created
> but loses the order of starting the service. So it may still race with
> device creation.
>
> >
> > Claudius, any thoughts here?
> >
> >
> > Drew
> >
> >
> >
> > On 8/15/22 2:25 PM, drew.moseley@gmail.com wrote:
> > > From: Drew Moseley <drew@moseleynet.net>
> > >
> > > The previous change to remove the dependency on systemd-udev-settle
> > > caused boot delays at least on qemu. It seems that change required
> > > a hwrng device but that's not necessarily available on all platforms.
> > >
> > > This changes the "Requires" to a "WantedBy" as modeled after the
> > > version of this file on Ubuntu 20.04.
> > >
> > > Signed-off-by: Drew Moseley <drew@moseleynet.net>
> > > ---
> > >   meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> > > index 0f50890dcb..b013d95932 100644
> > > --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> > > +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> > > @@ -3,8 +3,6 @@ Description=Hardware RNG Entropy Gatherer Daemon
> > >   DefaultDependencies=no
> > >   After=systemd-udev-settle.service
> > >   Before=sysinit.target shutdown.target
> > > -Requires=dev-hwrng.device
> > > -After=dev-hwrng.device
> > >   Conflicts=shutdown.target
> > >
> > >   [Service]
> > > @@ -32,3 +30,4 @@ SystemCallFilter=@system-service
> > >
> > >   [Install]
> > >   WantedBy=sysinit.target
> > > +WantedBy=dev-hwrng.device
> >
> > --
> > mailto:drew@moseleynet.net
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169360): https://lists.openembedded.org/g/openembedded-core/message/169360
> Mute This Topic: https://lists.openembedded.org/mt/93042904/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

