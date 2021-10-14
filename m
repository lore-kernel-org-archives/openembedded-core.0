Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B3BC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:47:10 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.9661.1634219229614999084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kWFSXAlD;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id z20so24699181edc.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VZZ+vHdEB5ZGThzYADOSPKJ7KwRDjlxXHp66J0SrYHU=;
        b=kWFSXAlDt9FuXcUfNBjP70aPuhth3AZOtDirFANavPZqh0WCBgZXwYhqg/7r07ryI/
         nWDtmPxT+CG2xdeLpFOVskTtu0PX0HJ9V1c5iF0nRkGNJGp9Z7255sB5IvYaTuSDjIqI
         9vELIV/xcgeroBGu16uA/bfMmEyurWOaEk7YmRMkAUAX5wDHmVxQJJf9q7Rhi5gH3LJc
         zPu5wTFYBsQBpesYUSWlAyQ8JYo3k3asB9As22w5GRfdnRh3RXBNXkuD7CVAvmosPCBS
         PXT6KiGGgpS1v/X0QdwXVjr/TmBRxBHQ4U7/HVFQF6KXofAYdGAb7aN9RAdnqpqDF6Jt
         OI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VZZ+vHdEB5ZGThzYADOSPKJ7KwRDjlxXHp66J0SrYHU=;
        b=q9yMVPFBhp1lVY0vAgRvBXHh6Hylrm+ashIbwRrqcyx0e8Azad+BhXHO+0jNgeR4gH
         fmvgZJixQC1qjwfN4s5ebfByVGfJuOgyJAt7QzrwBaDclts2yEob9xdO7d2qnoXkhZSn
         +8qUO7CdM297toKUlET9zF0gpmCELL3ZhhpiYzOtzyodtF0CT/bd1mfrX5asIGfFiBRM
         dwq0t5D81+5jETly2ogJSfVj685xdBmlKNja5AqSYAJdBttBigFE1UZRF9OqPaeBrA8r
         XDpXGFg2Rjz1fvTBPQLDBHZkNwmVPNeUcRdfanOWsAbJC2cdO4W5leARlX/REo2WDMS7
         O1vQ==
X-Gm-Message-State: AOAM532iDBJBZe1cuXCRoNzuRxvPmIoK4eluseS0k8KO/Ov/vpgxLCex
	Vt7Vn2eFBhj+2Lry5yweRjvpEk6P8nGs0bqVM2Vi+nUt6Y0=
X-Google-Smtp-Source: 
 ABdhPJw3TkwTElKVnpImDUhoH4+pGKdAmp96C1uNlntSzUYIWY7+dclJ5aSfyxrJCEhqVyEpX00OkFo7XJFs+GMGAc0=
X-Received: by 2002:a50:e041:: with SMTP id g1mr9017564edl.4.1634219221245;
 Thu, 14 Oct 2021 06:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
 <20211014121025.2913401-7-richard.purdie@linuxfoundation.org>
 <CADkTA4MccXdOvzaEoHOX-wVj-iFsLRb7OsDpO+myowr3f0gT=w@mail.gmail.com>
 <f83e1f3063a28ca1e761ab11656846fd71ca41e2.camel@linuxfoundation.org>
 <CADkTA4NZRmGhb92Y22MnGsQhdxZOUtpg99pu0LahdZgyCJCzzw@mail.gmail.com>
 <YWg0Zxz52+65ukRp@piout.net>
In-Reply-To: <YWg0Zxz52+65ukRp@piout.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Oct 2021 09:46:49 -0400
Message-ID: 
 <CADkTA4OaNxpO_gSBRVpOypKZ3yRSEkCXQ5s39O7UkHLbq2DdVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] reproducible: Drop
 BUILD_REPRODUCIBLE_BINARIES
 variable
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 13:47:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156959

On Thu, Oct 14, 2021 at 9:45 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 14/10/2021 08:38:46-0400, Bruce Ashfield wrote:
> > On Thu, Oct 14, 2021 at 8:32 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2021-10-14 at 08:28 -0400, Bruce Ashfield wrote:
> > > > On Thu, Oct 14, 2021 at 8:10 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > We want things to be reproduicble and the variable doesn't really change
> > > > > much any more. Drop the remaining uses and make those code paths always
> > > > > active.
> > > >
> > > > It wasn't clear to me from reading the patch.  What is the way that
> > > > someone would now get the current timestamp into a kernel build, if
> > > > that's the behaviour that they want ?
> > >
> > > With this change they probably don't get the option. If we want that to be
> > > configurable, we should probably move the control to a different variable which
> > > is focused specifically on the kernel. The hardest bit is probably picking a
> > > name!
> >
> > This is probably the most surprising feature of reproducibility for
> > kernel developers, and a question that I've gotten multiple times
> > ("what happened to my timestamp ?" followed by "how do I turn this
> > off?")
> >
> > Most kernel developers already don't really like the "yocto workflow",
> > and this adds another element in that category. It is common in a
> > debug scenario to check the timestamp of the running kernel to make
> > sure that you've actually booted the one you just built.
> >
>
> But do kernel developers actually do their development using YP?
> I definitively not. I do all my BSP work outside of any build system and
> then I finally integrate everything once this is working/ready.

Many do, yup!

Bruce

>
> It did indeed surprise me the first time I saw that but this doesn't
> have any actual effect on my workflow. Also, the issue was already
> existing if what you were trying to build was already in the sstate
> cache (e.G from a nightly build), it would contain the time of the
> actual build.
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

