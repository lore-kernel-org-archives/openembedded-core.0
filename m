Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585B6C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 14:36:26 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.14946.1634049385491419388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 07:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AF5x+8+h;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id t16so378368eds.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 07:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gr5mL9I/A4/a7mjGl25vUk+/KhgMuH4iom6+tvZAOTc=;
        b=AF5x+8+h9czrf/XsTniy74NfP8xXR31y96hEOy3IHb2PAOOf/CGG0Eg9rhRqOPuGkK
         F/FdoLFIujzuItz6ClB+AQVvGUqbiaZG0EY0MyHAxa2v6TRIoo3uBEUviVPqUIwg77qj
         WSB7+I0m/jCKGiyOJ8Rl9BF+x/GJa8cj9l0u6Jdu6Fo+m4MaeSLlrCMC/Ug9ZqLAs4X/
         FFX50tui0J2pf6nJhz9YoihAw3e/Z5S3Cr96O4/A0N1SQrgDwp+wPdhGNFKSWULdV2LJ
         PGkRJtcxcigKlJTmh5zI7ROgMLAe+xNzc1nMB60bGdk8yeUskNcUBVuilXdT9nCIK2Al
         errg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gr5mL9I/A4/a7mjGl25vUk+/KhgMuH4iom6+tvZAOTc=;
        b=IOcsOX1eO0B98UNaMJFHIewfU7XGZPMzkA6iTu4Etf9zAylb7V78h+XBCWnWIfOi97
         fAi0v2JIUEeWjy2zBPlwwqz8b6BPGLzIgh9ot2UUk8PST3ZFNIfDL0cwuZnLdsruKy6r
         UeZisedLAbLKi+l+nobbKDqRbk+zwlGJJC1+DJJArx0H3MefHAu57nU5bO8LKLYHMk9k
         ZkPKLc8lvX95P6dlLOakNfjz6ZsX+AG50lL6EAYTZnk/ecWeWIzaSxw/i8aLFj+wclz7
         a9U8+wVbiH4p4tACytrxZJSnqhsx8i6FVoB4Ys5f1HI8u5WrLqiIdr4HwgZsKrhJwab8
         2D9g==
X-Gm-Message-State: AOAM531dSWI2u34rQt0vfMFDkgMtpwBE0yEJB1aHsxbuAFdv/La9J1p7
	pLnESc/QrlkDjw8c7slg432/yykx3McjgrcatrQ=
X-Google-Smtp-Source: 
 ABdhPJzxuKFNfoSAKJSDjK9tASiDV7zkFYt2yzHTMoCNzrlCHjBvJi0VOfssrTarCYx3DYi6h4Zd+fRYX7lOkaeKcQ8=
X-Received: by 2002:a17:907:984d:: with SMTP id
 jj13mr35442652ejc.211.1634049383689;
 Tue, 12 Oct 2021 07:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
 <549aecfd-e6d1-dbe0-3c80-51783f554750@gmail.com>
 <CAAnfSTtj0bS5p05+dEJmLWG8MM-fyr1ZqVxB1MA_hcXHcGXfPQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtj0bS5p05+dEJmLWG8MM-fyr1ZqVxB1MA_hcXHcGXfPQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 12 Oct 2021 10:36:12 -0400
Message-ID: 
 <CADkTA4OK-K0O1zMQHiMFoHATcZ=se8wZLC0Q0tKEZRF-bfrrhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
To: Ross Burton <ross@burtonini.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 14:36:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156880

On Thu, Oct 7, 2021 at 6:13 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Wed, 6 Oct 2021 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> > Does it have to be native or target dependency ?
>
> Native, as it builds compiler plugins for the host.

I was out most of last week, and this was a holiday weekend here, so
I'm running behind.

I didn't notice this on master or master-next, so I've grabbed it and
made the same change to linux-yocto-dev.

I'll send them out in my next pull request.

Bruce

>
> Ross



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

