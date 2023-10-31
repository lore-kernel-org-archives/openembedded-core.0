Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756C3C4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 13:53:21 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.186496.1698760395816801686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 06:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fFDqiyHS;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-507a3b8b113so8209537e87.0;
        Tue, 31 Oct 2023 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698760394; x=1699365194; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0Ok1Q89n15vDxQD8csxX6xWaCBQ3z5WqeMHljnYZWo=;
        b=fFDqiyHS1C3OjWppWn8dzozh5T7LrtNvMk/htvurZw8aKpmgASgSN/IawZ6lye0p+X
         TGBya7lqaimzSBtmOfJmGIdv9tLe5DdxkrQfGCIBO8Rk+3m7ax2f9vqyrCgzOqIs3N75
         eE78u7SeZVwY4Is5l9NSDNlbcPaalcvJhokLYFXCOz4+YkDyFKKrcsteB4687ZFMoYr3
         CbsJBkV88aIi/Mx4wFARd7ByxWPtARmcwKY4ANWzahIAaG43ZJXxk54wL+YuQFzTLp0K
         2chyuM6uWjKyL1gIDKKIfdHa4PPY0BU7h+WSmKDUpF5yxHwU/4WmGsoQQ0nz0z5MI4M9
         qZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698760394; x=1699365194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0Ok1Q89n15vDxQD8csxX6xWaCBQ3z5WqeMHljnYZWo=;
        b=ECOnmvE0bV0h3/COnF2fHIZao8DN9AMOZtSWQH3ExrUP8fUNZ75pVrOd3HVMffiIaC
         d0Tk5P+SYtkj1lUNMizWiZPRRywpt5wk/XuCvfi0/9wYV0Zowc9lSVYx8N79iPqzNHuN
         QxgM5t3/DOXCQWRsKCx0im+t6dNMqzsvEtsaLaDIE0RfCeDTy6d4iFvrEesFGR4/u41X
         1LRZIrdKytXWz5NhepzSNu99nRpAKwkfPBW6EAX5PRWI2dPivsHZ+A1UgFBuUXWyVyyg
         3IDpEnsFdwo/z2Loc5fXTmGwOAzr2OrXTqbuf70s8ZJwxs2tZhlw8LVH8QoMaVX8D0c6
         ZGsg==
X-Gm-Message-State: AOJu0YyftIeXDOO8M787GKcTm/4tOlWGO58QuQWOJCFBX/o++FUvG37o
	JXtEmKwpfIoIGzofs5pIC81nr2FW/ps4w1Xh02e6lgUYGZE=
X-Google-Smtp-Source: AGHT+IHySbkpUPSBda21cVdzcN16+OoOzR3SLFCk63lu/Ng3HUNJsbYCDbgyXBxIJpJiC+MixeVvROocCZOR1EjJK50=
X-Received: by 2002:a19:c510:0:b0:504:7f2e:9391 with SMTP id
 w16-20020a19c510000000b005047f2e9391mr9178338lfe.34.1698760393574; Tue, 31
 Oct 2023 06:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj-JhGnGFRxaF0+Q_5Sqq76kAg1pSBBMka_xefuhMv6-vQ@mail.gmail.com>
 <ea84079102bca429a6ae521d218118952a79f111.camel@linuxfoundation.org>
 <1792EACC19CD8046.7262@lists.openembedded.org> <CANNYZj_mjbH08rHoo0FzFihcax9zQ1zR6QRoEA3C_JOHG7P9kg@mail.gmail.com>
 <7488045369ecd729ac3df2e526a74ee644fbcf26.camel@linuxfoundation.org>
In-Reply-To: <7488045369ecd729ac3df2e526a74ee644fbcf26.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 31 Oct 2023 14:53:01 +0100
Message-ID: <CANNYZj-DTi-P2aM2wYVDWpeEKn4r_bsBkV6QPr3XdfHa=pM_dA@mail.gmail.com>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 13:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189843

On Tue, 31 Oct 2023 at 13:28, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> > Then we can pull all of it together into 'devtool esdk <image>'
> > command (or similar), which would enter the esdk environment directly
> > via:
> > - running 'bitbake <image> meta-ide-support'
> > - running the above mentioned bitbake local.conf task to generate the
> > esdk-specific local.conf
> > - sourcing the environment script produced by meta-ide-support
> > - rewriting PATH to provide only the curated esdk tools and not
> > everything plus bitbake.
> > - writing a custom devtool.conf similar to that of standalone esdk so
> > that devtool can find bitbake and bitbake can use the esdk-specific
> > local.conf
> >
> > And it would be tested in the same way standalone esdks are.
> >
> > Thoughts? Anything missing from the above list?
>
> That sounds like a good way to handle this to me!

A couple followup points:

- copy_buildsystem() in populate_sdk_ext class is overly long at 400
lines and does many different barely related things, writing
local.conf for esdk one of them:

https://git.yoctoproject.org/poky/tree/meta/classes-recipe/populate_sdk_ext.bbclass#n189

The first step would be to structure it into separate functions each
doing one thing and hopefully fitting on a single screen. Then these
functions can be hand-picked into a task designed to provide esdk
things in a yocto build context, and the code would simply be more
readable, as right now I can barely understand all the various things
that function does, and the spaghetti of local variables etc.

- the tool that would set up the esdk environment in a plain yocto
build could be a shell script in scripts/oe-init-esdk-env perhaps,
similar to oe-init-build-env. No need to make it a devtool plugin; it
could use python helpers to program the more tricky bits such as PATH
manipulations etc. So one would first initialize the yocto
environment, then transition to an esdk environment from that (there
would be no way to go back, as one can simply start a new session).

Alex

