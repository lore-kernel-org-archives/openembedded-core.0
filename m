Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75E2C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 18:13:45 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web08.106.1668190421890213925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 10:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hx51dtdZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id z3so4113384iof.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2RSfdDaJL2TS2cHwzxuun4nqtMDIMSnzxV/TYRtzINI=;
        b=Hx51dtdZysk4z3kFZT8SR9RjCiAx+d1KzO46v58/p7NDad8AHM8R8mo9mRltkCPk4s
         nD213MoRDX3u/reweeWaEg6anc3okAzpu56bN/TipEDL6Gy13eMJkg6NmKEwakoINI/L
         22c82Z99sa93k9KDRd64GhPjz31G8dRgQ7IyJ5/wfHVZhZZHK4KSdeEorREm1hj1+aWJ
         Zv8rVGusBjtfUVSwQVXMzFULhu7e2GX4FFpR4P9HkTJU93L37xV134RUgr/C7tI7brsv
         wA2qtpGSipvD/NiQiPZGbQPiWupSDG3/Jz15RMFJDt6nzNg1IS43tTqRKHsYAEDOLgSp
         N18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2RSfdDaJL2TS2cHwzxuun4nqtMDIMSnzxV/TYRtzINI=;
        b=vSFOzv+nipTmIJNrnCDFQ0LrFbg5645iA5trzmuk5/JYFIPE8uZ1PWG3h0yofnROkw
         4YBKDTojcx2TrKq/yfel8+uN9MqC8fM9PRDrKEMTmNjpPO21USEQpAQ7HWvrC4K2DMGE
         w8iyqMrGNd+zLEDQrDWr21V0tMFE/Rb4JS3pNL9Vqoht/AvZHnUNo3FTToBJkm4DBUeo
         Ds/fRTs9FCRYuBghM4E51/ehQkl+ENv78eGccT9l5E69K8q9e8hEJ64bwotwPXI7WwrD
         uV5j6QQ5jYfn7NHf79D6Fi+GuqTMKJeOQWRjnKiUMUujmTCasdLP3upO+l492n4iP4Zg
         vkJQ==
X-Gm-Message-State: ANoB5pkchRUb0qwD7XahB8IAaRbpHE9evNsydP5T0MJD8AqqdA7G0LXu
	rHcj2Po6bQ6nSgv/Qbg3IA3mlGTxMu1WbOe6fKw=
X-Google-Smtp-Source: AA0mqf44u0PCgQ30wqsCo937/RT5MyIr0M839/ij/2d3aYJ9kTwvhxxqSjH/s7yi7yX5XHFrmLGAGrGWsDxBt2Qkizo=
X-Received: by 2002:a05:6638:1b07:b0:372:f7ed:9f78 with SMTP id
 cb7-20020a0566381b0700b00372f7ed9f78mr1307106jab.245.1668190420891; Fri, 11
 Nov 2022 10:13:40 -0800 (PST)
MIME-Version: 1.0
References: <1667435031-7224-1-git-send-email-paul.eggleton@linux.microsoft.com>
 <7a3e2fb0a5f0e71581fa4c2da529454bd2eb27ad.camel@linuxfoundation.org>
 <3386323.QJadu78ljV@linc> <7d37134e-3239-f6dd-fe35-4ac5f7d519be@prevas.dk> <1945179b38c4a062ccf90f0b275755625ec9a6f6.camel@linuxfoundation.org>
In-Reply-To: <1945179b38c4a062ccf90f0b275755625ec9a6f6.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 Nov 2022 13:13:29 -0500
Message-ID: <CADkTA4NAn_2s9FvwGAZfCnMW2ogeC5XkRyZN9u9_5qjwiBGBtw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] [PATCH] Allow fitimage + initramfs rebuild to be accelerated
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: rasmus.villemoes@prevas.dk, openembedded-core@lists.openembedded.org, 
	paul.eggleton@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 18:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173140

On Fri, Nov 11, 2022 at 8:36 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-11-11 at 14:25 +0100, Rasmus Villemoes via
> lists.openembedded.org wrote:
> > On 10/11/2022 21.32, Paul Eggleton via lists.openembedded.org wrote:
> > > Hi Richard
> > >
> > > On Thursday, 10 November 2022 11:14:24 NZDT Richard Purdie wrote:
> >
> > > > Adding in yet further if/else paths with magic variables to control
> > > > them isn't filling me with confidence.
> > >
> > > I understand that. I was hoping to figure out a way to avoid adding significant
> > > extra complexity.
> > >
> >
> > FWIW, we've long since given up on using kernel-fitimage.bbclass, it is
> > way to inflexible (e.g. there's no way to build two FIT images with the
> > same kernel but different initramfs).
> >
> > It is much simpler to just have a separate small kernel-fit.bb recipe
> > which pulls vmlinux or Image or whatnot, plus the .dtbs, from
> > DEPLOY_DIR_IMAGE along with the initramfs images, provide our own .its
> > file(s), and build the FIT image(s) there. That automatically avoids
> > rebuilding the kernel when only something in initramfs has changed.
> >
> > Building the kernel and packaging the binary into some container format
> > really doesn't need to be done in the same recipe.
>
> I'm open to the idea of changing it to do that as that is how I'd
> prefer it worked. I don't use it or know much about the needs people
> have so I end up guided by others though...

I'm of a like mind.

We've been wanting to re-work and clean up a LOT of the kernel classes
for quite some time, but with all of the different workflows (and lack of tests)
it is hard to get it right, and not break someone's case.

I've been working through Paul's suggested patch, and I agree that it
does try to minimize the copying of the kernel build artifacts, but the
complication to the class and build is inevitable.

I've also done multiple packaging and wrapping of boot artifacts outside
of a single recipe, to avoid both complexity and extra building.

I'm wondering if your classes are something you can cleanup and share ?
That would help the discussion as we could talk about some tangible
new approaches.

Bruce

>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173129): https://lists.openembedded.org/g/openembedded-core/message/173129
> Mute This Topic: https://lists.openembedded.org/mt/94747626/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

