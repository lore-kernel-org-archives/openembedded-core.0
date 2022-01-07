Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF171C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 14:44:43 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.7277.1641566682627944800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 06:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=CDLeUsSZ;
 spf=pass (domain: madison.systems, ip: 209.85.167.48,
 mailfrom: matt@madison.systems)
Received: by mail-lf1-f48.google.com with SMTP id k21so16390379lfu.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 06:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CNuF0JqJrN0WUEa/9u7Cx7fRwviR8TBhzhd0erFg2O8=;
        b=CDLeUsSZ09y+QKc1l1vsujnnJKYhGoTzedzioE6b7RlMOce2K7JPPX0+7yb26N3M8j
         mQ1a+n7U4Znsspx6X/HqJNZL56Yq13KrDi/gZRwFSKw3XoQuis1Ah4bFiqa6dsP30tpu
         1ZUdz/OQTrSuRnU96l87vuxSqumBxWTaDMOXGskQx0C26olKlS6JTVUNM37irtaXyW/y
         hypHvBnp4bHdvyYZpb0oiQUhiB3B1wRtlsk9Pkxz97nM2pEx79yg4xOohy8BDbL7rbK4
         JOT8HLFMMA6CVNmV3KZ08UZG7gKksQ46ibesF6tUFlPEgP0qTwGAW+hE/NMQi9sT9BWy
         AUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CNuF0JqJrN0WUEa/9u7Cx7fRwviR8TBhzhd0erFg2O8=;
        b=YQAVY6xFyo/aKjP1MHJzkmjUTZKx2ut17TUW9cjJFtuPDxL5ovdNI6yeB+l6oEaZQd
         0oyRG5SHmgi5rc4I3kMR/DIsKxUGIk1HM+4nDf273K8eY+Y4XNpascYFpgSsKXKyTLVJ
         wsr754BzXRXpmEgNH0OfFx/EnMjURUEJL0ivnORvoRW0w5rbso5dv+oE2Cc7dK0BKOwK
         Geo3XOfWTQZebJaPv0Sqey7v9VEHEO58Y9g4LEycEGExZc9q11B4GnIiszWnTMTEQvay
         3geVjnIORbWlfgJkNbjmn9Mea2nOA+Boprvl7rIMzP5Bm7x5WsZkCqSklvBpdKHRNdnD
         7dpg==
X-Gm-Message-State: AOAM532YCdsifoKCLez6hrqyqFdkNgLJ6a+NcQLlf/dFiTrGjDhbZbW/
	/ckd4CB36HQUab7TMfUKVNHGnwKftGRmSLBkxIfugA==
X-Google-Smtp-Source: 
 ABdhPJyzfld47mrARdlpDF28c9YR/YsPB0Xa1rPb3UyS7G5KHeMNHxVZxscqeWirf8bxBUC1fi26c8KwNY0HTG0K3wU=
X-Received: by 2002:a05:6512:32c5:: with SMTP id
 f5mr53166795lfg.550.1641566680572;
 Fri, 07 Jan 2022 06:44:40 -0800 (PST)
MIME-Version: 1.0
References: <20211215201615.536707-1-matt@madison.systems>
 <8d74dd73e03223215a4799df4f7a17bc4b9706eb.camel@linuxfoundation.org>
 <CAGgRHJoyzifLStq3KQfPcHR9HYcQPR+vP=754K5K=3zrBaseqA@mail.gmail.com>
 <16C7FE06BC92B547.9201@lists.openembedded.org>
 <b6e67f9d1c5bff66c5c4ebb792ddf70f6ab3d12a.camel@linuxfoundation.org>
In-Reply-To: 
 <b6e67f9d1c5bff66c5c4ebb792ddf70f6ab3d12a.camel@linuxfoundation.org>
From: Matt Madison <matt@madison.systems>
Date: Fri, 7 Jan 2022 06:44:29 -0800
Message-ID: 
 <CAGgRHJr1UGOL1-p+242MvitOLaCBZKok2S+xDrCL74vndnZUag@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 14:44:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160262

On Fri, Jan 7, 2022 at 4:56 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-01-07 at 12:51 +0000, Richard Purdie via lists.openembedded.org
> wrote:
> > On Fri, 2022-01-07 at 04:36 -0800, Matt Madison wrote:
> > > On Fri, Jan 7, 2022 at 3:19 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, 2021-12-15 at 12:16 -0800, Matt Madison wrote:
> > > > > which is introducing task hash changes for some
> > > > > allarch package builds, and should no longer
> > > > > be needed with recent versions of qemu.
> > > > >
> > > > > Signed-off-by: Matt Madison <matt@madison.systems>
> > > > > ---
> > > > >  meta/classes/qemu.bbclass | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> > > > > index 01a7b86ae1..333202b7c4 100644
> > > > > --- a/meta/classes/qemu.bbclass
> > > > > +++ b/meta/classes/qemu.bbclass
> > > > > @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
> > > > >  # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
> > > > >  # qemu-arm default CPU supports all required architecture levels.
> > > > >
> > > > > -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > > > > +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > > > >  QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> > > > >
> > > > >  QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
> > > >
> > > > I've sent a revert for this since the commit message isn't true, this is causing
> > > > autobuilder failures and there was also a user report of issues with it.
> > >
> > > Bummer.  I think this is because our OLDEST_KERNEL setting for aarch64
> > > (3.14.0) is
> > > higher than the UNAME_MINIMUM_RELEASE definition in QEMU (3.8.0).
> > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4559/steps/13/logs/stdio
> > > > (centos7 aarch64 build)
> > > >
> > > > We'll have to find a different way to fix the allarch issue (more details
> > > > welcome on which package shows the issue).
> > >
> > > I ran into the issue with cantarell-fonts and wayland-protocols, but
> > > any recipe that inherits both allarch and meson should trigger it.
> > >
> > > In my case, I have a layer check job for meta-tegra that runs
> > > yocto-check-layer with the --machines option specifying qemux86 and
> > > one of the (aarch64) machines in my layer, and that was reporting the
> > > signature changes between the two architectures.
> >
> > I wonder why we don't detect that with our standard tests? :/
> >
> > There may be another fix:
> >
> > diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> > index 5bd5c44a276..0aadf7bfba6 100644
> > --- a/meta/classes/allarch.bbclass
> > +++ b/meta/classes/allarch.bbclass
> > @@ -43,6 +43,9 @@ python () {
> >          d.setVar("TARGET_LDFLAGS", "none")
> >          d.setVar("POPULATESYSROOTDEPS", "")
> >
> > +        if bb.data.inherits_class("meson", d):
> > +            d.setVar("do_write_config", ":")
> > +
> >          # Avoid this being unnecessarily different due to nuances of
> >          # the target machine that aren't important for "all" arch
> >          # packages.
> >
> >
>
> Sorry, that isn't quite right. We want to just remove the append to write_config
> which generates the qemu wrapper which will probably need a little more invasive
> juggling of the code to make it easier...

Your patch to disable the qemu wrapper for allarch looks like a good solution.
Hopefully, that will work OK across the board.

Thanks,
-Matt

>
> Cheers,
>
> Richard
>

