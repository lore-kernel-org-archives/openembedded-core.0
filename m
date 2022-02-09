Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200C5C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 20:10:56 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.401.1644437455146438738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 12:10:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qh8AL1JK;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id cz16so7334639edb.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 12:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o3nM3Tu3BF2XlYGrOrxZK1xUeWWdvsEPAELEAP0TV40=;
        b=qh8AL1JKrIh5BrWPWPu7eqjaneNiPrHV9qA11+WpJRvDZEM//zLLHE4UJ/jjLU3d3l
         u/YtlHUScZIXjlw4PMOJZTLlvX84o6ZJ/TwTUspAiCts4U/vRpgTBW1GRNg5YAr6t7sU
         sfC+pfEOwBZbYtgbRALXHgbOR38RkjL9OyvEIPZFwY2uH4hsauDONi2hH9CSKui/uBLn
         ktkbX1oRKA99VxIgAXRCATHkhe8VZCV0hl6Ai+zdyFByXvCsPlKOjyCFQ+RWQBpLiRgA
         eyKd4HgxFrSzE8svUKXaOx9gXgX6vh2IFvIGvZRB9mz9WCw2v0QjenxIKATq17Cg6Stq
         pZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3nM3Tu3BF2XlYGrOrxZK1xUeWWdvsEPAELEAP0TV40=;
        b=dRIsC3wFUxkYgpOrSMBJL6/2n/gDjamBFZ1xrwXqlnUhCd5nU6JxwSk/UYEkEGKoUs
         Ib9SM7IxIJzafOGtbjcRvUqwLCfhVDrnotVqlYwvr9cWV3ErtmWY668Uv6KcO+2Pn7or
         Z6u104ywnXul1+kD0cf8zid7dqtVVmgolhdw+VkAoA/DCV25XwNb9evtXs2D83fpEEe2
         T+/jXChDliV0yI9IRYeKVJedrOkRV+obRoBHWC4d4u4sPA8eEYhUllm+hmfKJCLKmoJG
         dKPRr/Vo73LxMaOD/aNbUstiJPrx6xpmjTgiek4SFlgc8RAhvxo/5T9nOaLtt63L2b5X
         1ERg==
X-Gm-Message-State: AOAM530iNT3Ef9so4maOurJq/j8kdqgpd0rHJZ+WLy/ihT2tQk8tvEVk
	hQOpql9K5hdltMCdVmhA/PfnGXV2Wzo3NmckXoY=
X-Google-Smtp-Source: 
 ABdhPJzh4AvVGh50SpEDsVeZY3ypwwLTM2WrEkdiGT9TvvESQywQMnHqvU6TSwWno9Nv22vE9PZm1ryGR/BpoczdIvk=
X-Received: by 2002:a05:6402:34c7:: with SMTP id
 w7mr4507324edc.397.1644437453403;
 Wed, 09 Feb 2022 12:10:53 -0800 (PST)
MIME-Version: 1.0
References: <20220209173036.3823144-1-ross.burton@arm.com>
 <20220209173036.3823144-2-ross.burton@arm.com>
 <CADkTA4NG8wAoMQtpwbvf2hia23JnGsbboERY4H61GxMpyms5JQ@mail.gmail.com>
 <43fe0dbf3548f549d1c0161d2a55f633a9c27122.camel@linuxfoundation.org>
In-Reply-To: 
 <43fe0dbf3548f549d1c0161d2a55f633a9c27122.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 9 Feb 2022 15:10:42 -0500
Message-ID: 
 <CADkTA4Ms8yb5Jn3K8N2BZktLYHtfDwp0ym_OVke16G4ER_739w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] kernel-module-split: modules should
 recommend the kernel image
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 20:10:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161588

On Wed, Feb 9, 2022 at 2:13 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-02-09 at 12:36 -0500, Bruce Ashfield wrote:
> > On Wed, Feb 9, 2022 at 12:30 PM Ross Burton <ross.burton@arm.com> wrote:
> > >
> > > Currently each split-out kernel module RDEPENDS on the top-level kernel
> > > package (e.g. kernel-5.15-yocto-standard). Whilst at first this seems
> > > correct, as modules obviously need their matching kernel, there are many
> > > situations where the kernel is provided out-of-band and forcing the
> > > kernel in via RDEPENDS in the wrong thing to do, for example an
> > > initramfs really shouldn't contain a kernel image, but can contain
> > > kernel modules.
> > >
> > > Change the module splitting logic to use RRECOMMENDS instead of
> > > RDEPENDS, and tighten the dependency to kernel-image instead of kernel
> > > to pull in just the image, which also means PACKAGE_EXCLUDE =
> > > "kernel-image-*" is sufficient to ensure the image doesn't get pulled
> > > into an image.
> > >
> >
> > As much as I hate to suggest it, I think the strength of the image
> > dependency needs to be configurable. I know of situations were
> > rrecommends are disabled AND they use quite a few out of tree
> > modules. While I can't say that they are counting on RDEPENDS
> > heavily in this situation, I also can't rule it out .. so this is a breaking
> > change in behaviour for those configurations.
> >
> > That being said, if RP doesn't want/like a conditional at this particular
> > spot, I can understand that as well .. and am happy to be ignored
> > in that case :)
>
> Isn't there a case where the main kernel "image" package is empty so you just
> have to break the dependency at the main image level rather than messing with
> the modules? or am I half remembering something badly?

I've always just used this (from kernel.bbclass):

# Allow machines to override this dependency if kernel image files are
# not wanted in images as standard
RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image
(= ${EXTENDPKGV})"

Maybe that's the one you are remembering ?

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

