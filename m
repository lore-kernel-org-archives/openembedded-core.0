Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF44C433EF
	for <webhook@archiver.kernel.org>; Sat,  8 Jan 2022 15:11:12 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.6542.1641654670892126940
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jan 2022 07:11:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=PajGje6u;
 spf=pass (domain: madison.systems, ip: 209.85.167.43,
 mailfrom: matt@madison.systems)
Received: by mail-lf1-f43.google.com with SMTP id u13so26748533lff.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jan 2022 07:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HU8SdG6yLgH7J5ZerXqoI0E6Owl77v8VtKHFoWHBhjA=;
        b=PajGje6uLHnKAxomf+XE0/2ty3rCwLUDdowdA7qiSjZtNi/YNesKHl/q75t7s3pWA+
         jSnIXZcvf9lZ2KnL6Ri3Fi+3rHhboLkRY8T/MltQQD5gRIqAf476lBtxhPRvJe9bN81o
         U+oLlRYyNnMQJCvFskughWjPgjMwFvDqyk+54UWbQ+coy3VJxzRiLPEmVFAzZ5KCAEuY
         ESdIYsLAkrIJYlapLbNKbNTtBbzDKldXl8ufSS7T/2pfpkiMLhFSR3PKOEL7D67+N/qP
         k+ZhFkFy/onJXaP4ZPd0NJSZdk3tV1JD8bI0kwd2sLETgKm5mieI9Bf+oYfcjHamlhLq
         zyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HU8SdG6yLgH7J5ZerXqoI0E6Owl77v8VtKHFoWHBhjA=;
        b=XASFmXwhJe88S1Ayh/v/ijCbiDAbYRNli/DkDgWU31calW6XHnbKYaPQg4DEeihOlB
         MsLCm9cCkdy4hsQnrofw7c0ipBdAM844GEhDSst9fu7yVsGjzEEdPsl8GSCu1DWy6IBc
         uBPTNTjoFiohEJADRbdTFpoTfT2x7ZN2MI/3cMy+1FuW3uBBcCkrifdpTurQF/idi9cE
         63he7+QEzut+gb/+oz4uSexVKnYzdmT//yL7qSy5XW+tTnME8IYh1vSzh6XJVTyC1D7n
         2Zxg2TbsBD/MC/LbeUyAFpCx8gbRod3k4N1beKOYqun3QBqpqZczmUbAl5anJcVNrHNV
         rKVw==
X-Gm-Message-State: AOAM531TYaVT9xth50fUrdAeadWIs6toUF/rpqbJTcpeSP2VBYSTk9hG
	zofmz2/dhsMCZlHchnOoNVCL6pV4Sf6uAaEWHS9eLQ==
X-Google-Smtp-Source: 
 ABdhPJwwTQ5wv8vNqlif7gyLVEOlLM/fwxToZcfDxVl+FhtLhFaoB4m3XUF7JQYCuUEmQimgZ24EJPU7yNWQmSflmko=
X-Received: by 2002:a2e:88d4:: with SMTP id
 a20mr54405420ljk.218.1641654669001;
 Sat, 08 Jan 2022 07:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20211215201615.536707-1-matt@madison.systems>
 <8d74dd73e03223215a4799df4f7a17bc4b9706eb.camel@linuxfoundation.org>
 <CAGgRHJoyzifLStq3KQfPcHR9HYcQPR+vP=754K5K=3zrBaseqA@mail.gmail.com>
 <16C7FE06BC92B547.9201@lists.openembedded.org>
 <b6e67f9d1c5bff66c5c4ebb792ddf70f6ab3d12a.camel@linuxfoundation.org>
 <CAGgRHJr1UGOL1-p+242MvitOLaCBZKok2S+xDrCL74vndnZUag@mail.gmail.com>
 <93794e98cf7d13b438a1c51e0bd810df130e89e4.camel@linuxfoundation.org>
In-Reply-To: 
 <93794e98cf7d13b438a1c51e0bd810df130e89e4.camel@linuxfoundation.org>
From: Matt Madison <matt@madison.systems>
Date: Sat, 8 Jan 2022 07:10:58 -0800
Message-ID: 
 <CAGgRHJpHEyuwCs1Hbu7QpZWvN6qrDXebL0iFJ8iryWpiYhNFMw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jan 2022 15:11:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160276

On Sat, Jan 8, 2022 at 6:34 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-01-07 at 06:44 -0800, Matt Madison wrote:
> > On Fri, Jan 7, 2022 at 4:56 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2022-01-07 at 12:51 +0000, Richard Purdie via lists.openembedded.org
> > > wrote:
> > > > On Fri, 2022-01-07 at 04:36 -0800, Matt Madison wrote:
> > > > > On Fri, Jan 7, 2022 at 3:19 AM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Wed, 2021-12-15 at 12:16 -0800, Matt Madison wrote:
> > > > > > > which is introducing task hash changes for some
> > > > > > > allarch package builds, and should no longer
> > > > > > > be needed with recent versions of qemu.
> > > > > > >
> > > > > > > Signed-off-by: Matt Madison <matt@madison.systems>
> > > > > > > ---
> > > > > > >  meta/classes/qemu.bbclass | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> > > > > > > index 01a7b86ae1..333202b7c4 100644
> > > > > > > --- a/meta/classes/qemu.bbclass
> > > > > > > +++ b/meta/classes/qemu.bbclass
> > > > > > > @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
> > > > > > >  # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
> > > > > > >  # qemu-arm default CPU supports all required architecture levels.
> > > > > > >
> > > > > > > -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > > > > > > +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > > > > > >  QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> > > > > > >
> > > > > > >  QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
> > > > > >
> > > > > > I've sent a revert for this since the commit message isn't true, this is causing
> > > > > > autobuilder failures and there was also a user report of issues with it.
> > > > >
> > > > > Bummer.  I think this is because our OLDEST_KERNEL setting for aarch64
> > > > > (3.14.0) is
> > > > > higher than the UNAME_MINIMUM_RELEASE definition in QEMU (3.8.0).
> > > > >
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4559/steps/13/logs/stdio
> > > > > > (centos7 aarch64 build)
> > > > > >
> > > > > > We'll have to find a different way to fix the allarch issue (more details
> > > > > > welcome on which package shows the issue).
> > > > >
> > > > > I ran into the issue with cantarell-fonts and wayland-protocols, but
> > > > > any recipe that inherits both allarch and meson should trigger it.
> > > > >
> > > > > In my case, I have a layer check job for meta-tegra that runs
> > > > > yocto-check-layer with the --machines option specifying qemux86 and
> > > > > one of the (aarch64) machines in my layer, and that was reporting the
> > > > > signature changes between the two architectures.
> > > >
> > > > I wonder why we don't detect that with our standard tests? :/
> > > >
> > > > There may be another fix:
> > > >
> > > > diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> > > > index 5bd5c44a276..0aadf7bfba6 100644
> > > > --- a/meta/classes/allarch.bbclass
> > > > +++ b/meta/classes/allarch.bbclass
> > > > @@ -43,6 +43,9 @@ python () {
> > > >          d.setVar("TARGET_LDFLAGS", "none")
> > > >          d.setVar("POPULATESYSROOTDEPS", "")
> > > >
> > > > +        if bb.data.inherits_class("meson", d):
> > > > +            d.setVar("do_write_config", ":")
> > > > +
> > > >          # Avoid this being unnecessarily different due to nuances of
> > > >          # the target machine that aren't important for "all" arch
> > > >          # packages.
> > > >
> > > >
> > >
> > > Sorry, that isn't quite right. We want to just remove the append to write_config
> > > which generates the qemu wrapper which will probably need a little more invasive
> > > juggling of the code to make it easier...
> >
> > Your patch to disable the qemu wrapper for allarch looks like a good solution.
> > Hopefully, that will work OK across the board.
>
> It seemed to be so I've merged it. Am hoping this resolves things!

Drat. Unfortunately, it only works if allarch is inherited after meson
(which inherits qemu).  So cantarell-fonts checks out OK,
but wayland-protocols doesn't, since it inherits allarch first.

-Matt

>
> Cheers,
>
> Richard
>

