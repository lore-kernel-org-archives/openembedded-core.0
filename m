Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD88EC00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 14:53:11 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.46988.1674139982252214424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 06:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qeA2BUQV;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id n85so1063900iod.7
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 06:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cSKiSuGConRhDCYnpvIaMFWjonn2ND9nzcYzIIbCg8U=;
        b=qeA2BUQVcwVyWQkmQjcQ0E1obF+fiki8HbxOScDlVtMW5c1c8sRm3AnddX4XFQxNMi
         QDrGde7uEr8XSQLqrwWJgVsSPbmkTErjjFNlGAE2WkMsd9kpC1DXqLPlH0vyrM7RfA73
         ksIxa4d7Y8rJAgwZHC69MiZX0jpIRHQngHiF+t8vmVyh4yVgQOdcpTtpdTDte1/Rhg3U
         xjb0exwwVefx+WygqocryfgK8TrHOhtJ+lDcMFaKFmIx214z/6jYGoPkj0SyA0IDq8IF
         +yAaJlOQKBZTZ3LGaOG9Q3PeYOx9vWhajcX9BnDgBIUKVMwNFjTtenGM5grMF9JpZIYS
         G8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSKiSuGConRhDCYnpvIaMFWjonn2ND9nzcYzIIbCg8U=;
        b=Y76QssFE9J+rHmpoVWOdw0cE1ZLC8jfiasPHtZ7iwLB922CVJYRx6F/M7+rTsabw4U
         CtR28OAUVzolu1+Y7ODNm4ekHdBmeYYNWLqRVZnJNz5upchG6jpvuqgJGz5xa1EJvZSy
         w/Qw7ORRKGHnnJ+GLm7YjCn3S+KDfoNhVgFYZUfiN9xnO27vRT5mvLYN9EWiVB1lrHBz
         /UapA2VBMhXJoQ428v6dzIf7V4MAiH98SCTzI2V26fvJI5BA23Ff+Yc86aZElJJJ4RDX
         n8A7wFuQfE9bOUgTx7/wkJJj9Cwha0FJYq/tZjfev+6Rw9I2kQdRerSluzS0e5rQRuxp
         PUow==
X-Gm-Message-State: AFqh2koJXdzsedjowl/lmd9BeBrVoHNVkdfEfxRJikWQTnpbFRPqoPKb
	QyFsjaYDmmo+qZBk74hguabSWZVmZu1nXinKU9M=
X-Google-Smtp-Source: AMrXdXsAr6SMbEVx/zVpIxYSxsO3GrqQAVTBpIUGu4cPZJ3FSmPfiVDmbkP7BeH+czRLLs3oVGPr1DWrp85AhNIQyl0=
X-Received: by 2002:a05:6638:16:b0:3a0:66db:1abf with SMTP id
 z22-20020a056638001600b003a066db1abfmr963997jao.129.1674139981528; Thu, 19
 Jan 2023 06:53:01 -0800 (PST)
MIME-Version: 1.0
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
 <20230119102423.3493565d@booty> <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com> <6597547835fc9c22bc2267362da8c1a84f2fce68.camel@linuxfoundation.org>
In-Reply-To: <6597547835fc9c22bc2267362da8c1a84f2fce68.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Jan 2023 09:52:50 -0500
Message-ID: <CADkTA4OfjPHmc=p=btjf9vvkW2N-QGVJJpSAXLZOFmrikNetpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	=?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>, 
	Anuj Mittal <anuj.mittal@intel.com>, Scott Murray <scott.murray@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 14:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176142

On Thu, Jan 19, 2023 at 9:40 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-01-19 at 08:55 -0500, Bruce Ashfield wrote:
> > On Thu, Jan 19, 2023 at 4:57 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Hi Anuj/Bruce/Jan-Simon/Scott,
> > >
> > > Please see the links below. This patch, pending for master triggers a
> > > few warnings in a few layers as there are a handful of patches with no
> > > Upstream-Status present in them.
> > >
> > > I know this kind of thing is annoying but it is probably worth starting
> > > to give the wider community the hint that they should document this,
> > > and if they do document it, it might remind them to try and submit them
> > > too. You're not the target audience but as layers being tested on the
> > > autobuilder you get to lead by example! :)
> > >
> > > If anyone doesn't want to tweak things to fix this, we can disable the
> > > warnings for that specific test but I would prefer not to, I think this
> > > is the right thing to encourage. The numbers of issues are low and
> > > easily avoided one way or another.
> >
> > I'd prefer the upstream-status check to be disabled for meta-virtualization.
> >
> > This isn't something that I'm strictly enforcing, and not something that I
> > want to start strictly enforcing.
>
> I understand and will see what I can do to change the configurations, I
> was hoping to avoid that.
>
> Just as a heads up, there is an open action for the TSC to discuss
> which QA checks shouldn't be bypassed for compatible layer status.

Understood.

I'll strongly argue that if a layer wants to carry some technical debt
due to the nature of the upstream communities they work within and the
debt is within the layer .. that is something they should be able to
choose.

Cheers,

Bruce

>
> Cheers,
>
> Richard



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

