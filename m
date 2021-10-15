Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF14C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 15:46:05 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web12.11306.1634312764246122390
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 08:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mYzIIOR1;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id w10so23808537ybt.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gcQFjm08B4f4n7FfIFQB33KaltJdmCpA+YSFap4BpLE=;
        b=mYzIIOR1aSEWnfd2gNeouHbhEiEL2OwRozWVaj+LOjPU2nTq2RYZMGCOcmvbCQGKUr
         j6+415p8H26xCIYNQBUSv1b54PLCcovhCL+zg8R45g28WW4XimI0vHo3qrDLD0eDZZOI
         XjSuJ2WnRES2XP3pqr50QLnibd5lK46EbjFvQJFxRH+dYENqIzhg1d5MlThuLf9HsONw
         hZ9A+xI3T+1mBAhAGlXpH4yFQJXVPiUa0WlN722VsEBpXM06QBs58OX3X2c8roJfujZy
         ePjhC0u66KpaBJp9h6ohsfSR/Ns0z+p41k3L1Ji+MWKuKw4ZzJGumMlVssrhXrlgCKEr
         2GDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gcQFjm08B4f4n7FfIFQB33KaltJdmCpA+YSFap4BpLE=;
        b=cI2FP+C6HPt1oPtfRkouXo4AvfNTzC03z1yMQC7NLzxIC+APj4WH5Ejt49xYcGWMoO
         cJxldwV1JmPomTrRf/pTbYYIAxrcBPq/bJTky3+hlVKr7bz6hva0pK1vY/2QqlEDn7v5
         GBz0Cbp275k+gdB7VQiJMoL0bbu/u+SpYAxAepP/HI8hH8Xni4uaNVaskvKzKQXB7PMW
         GIExFk2lDJdXOyTAFalVhG5bk432IG/rt4ZWdP/vLFDeNre/Y3hmlOHo65b2hYB0iN/3
         C2jx6MmtviXHVmsPJmPUzav13ITS0oYux9AVvo4GaDNys2CbH/x0IDgl9QCFXWamsZ08
         W+Iw==
X-Gm-Message-State: AOAM532Zw/Ub8YlDcajAYG7KhP7NPSMnufuOKfBmMHSXCHbLcI0h793d
	8g3PCDe2qyIhYBx51b9ZVpyPRp1ZgQ/DLHOEXZg=
X-Google-Smtp-Source: 
 ABdhPJyYLjy8QsSCagN4Gt2BdJGnHLGuVJnBOHBcuBVHk+8XXb09vwjH7jZmn3teG2z3HmvnW0OiebmXgf733gbLmdA=
X-Received: by 2002:a25:f211:: with SMTP id
 i17mr14031335ybe.378.1634312763429;
 Fri, 15 Oct 2021 08:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <0c5732d80a8f5810e9a26c3b1e634422cf750fbf.camel@siemens.com>
 <CAOSpxdaGuK2RqNGz2VJg04AhnDhVRAMYvOLS497d-OTYUoXc-Q@mail.gmail.com>
 <56ce3d16404402d0b6661fb067c587618a57661f.camel@siemens.com>
 <d1015886629914a9b2ca8dba71326ecf7b355bda.camel@linuxfoundation.org>
 <4f983fee5101acf1a55c150a4a4ed1992b7199a4.camel@siemens.com>
In-Reply-To: <4f983fee5101acf1a55c150a4a4ed1992b7199a4.camel@siemens.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Fri, 15 Oct 2021 05:45:52 -1000
Message-ID: 
 <CAGDS+nky--RnYWkRAEhtAmqD2VenaMY+0TERHAPtdcYvjTxpGw@mail.gmail.com>
Subject: Re: [OE-core] libpsl: Add config knobs for runtime/builtin conversion
 choices
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 15:46:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157002

On Fri, Oct 15, 2021 at 12:39 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Ok, but I've just copied the existing commit from master. So I have to
> send a different configuration for dunfell?

Correct, for a stable release we don't want to change default
behavior.  So we can't take the commit directly from master since it
does change behavior.

Steve

>
> Andrej
>
> On Fri, 2021-10-15 at 10:58 +0100, Richard Purdie wrote:
> > On Fri, 2021-10-15 at 06:15 +0000, Andrej Valek wrote:
> > > The reason, why I want to apply it here, to switch replace libidn2
> > > with
> > > icu. According to libpsl documentation, you can chose who will
> > > generate
> > > the PSL database (libidn, libidn2, icu). So I don't want to install
> > > a
> > > new component if there is a valid replacement which is already
> > > installed.
> >
> > I think what Steve is suggesting is a tweaked version which doesn't
> > change the
> > current situation, just adds the PACKAGECONFIG options but doesn't
> > change the
> > current default.
> >
> > You could then change the configuration in your distro.
> >
> > Cheers,
> >
> > Richard
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156989): https://lists.openembedded.org/g/openembedded-core/message/156989
> Mute This Topic: https://lists.openembedded.org/mt/86296104/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

