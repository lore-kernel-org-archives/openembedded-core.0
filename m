Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48220C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 18:44:06 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.412.1662662638820275005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RQUdm6QX;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so31871004fac.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KnXY1D5Fa3YCVOM66y79e2q+gC6MNmXXBvVuA8D9t1o=;
        b=RQUdm6QXFJtapD+KzJnpZ7tXxJ1nSkju6Jvg00bVf1chkB0kiS3i3kVrGbg2kP8PN8
         HsDXUQTzyqWh8SxosHshyVOBK/w2R72frqoL8NUVkL+3kwM8AGHf+esC+vmcdZLBQXtP
         0hsATPukFCLi2dETDt7lYNqoBv0l0L3csYOW7X8y45VGEItHaUlBxhLtpOYpVCAUggmQ
         yCMWhdXCfkZ9BnxnO3TE0SaW4cnDQeIM3tcWTSjYAbGvfTArDVpAnRMZUsY3x9YlrE8k
         uo6clnm+XxFJJCyWGw1mRGcksv4ZvJfsoz1MfBvj6vDidYdi2uEA9XS3sC7mcyo6n/QE
         IQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KnXY1D5Fa3YCVOM66y79e2q+gC6MNmXXBvVuA8D9t1o=;
        b=Xqld9nuzQiaQfqN6pOR02xWWeSAyrpw3M5MMYvf8A44wtbWDlxxZY5MPzwEsu0+vsG
         A+xGxIq7oC38j2gMeDbOLZRQw03NXbodeXVUHOYA1PlEu1VeG7NyWFQPSAcNJoYW4c7f
         nqFq80EXuA5rzk8bF28byQcGdE22kLS0q2kfDt85cFvmY2RKY9qQiid2UN9sflPYurIC
         PhJ142z7cShmB051nZcm4bBYjKhLwed5aFRcPbuhCI9E8krCTZ8DqlgZQw8IUWQ+wrRK
         mbT+fbQO3MWE3wBpIJ9q37BJw0RKA9i0AV90ti7T73ApKoB54y+xZs8R5JcyyAzTaIRT
         iK9A==
X-Gm-Message-State: ACgBeo0zrLMq8Kd88GDNLLhiq6KQotk2xkMGvcbt5dZ9sUNPiRy/BfNO
	7LAakHpYLNuxVMzxaoC0g1zxhO7VDW1BHAge9bc=
X-Google-Smtp-Source: 
 AA6agR5eK6IqM6rnqSVjYOLiwjNHhGW1kvFKKaY519V7x/D2d1LQAOWC2N13cmr+mQ9UjKNnos+EDbt3m63TmZq5xhA=
X-Received: by 2002:a05:6870:f222:b0:10b:7326:18c2 with SMTP id
 t34-20020a056870f22200b0010b732618c2mr2671027oao.55.1662662638045; Thu, 08
 Sep 2022 11:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220907220535.3017588-1-raj.khem@gmail.com>
 <YxnypGsRgsp6Uaxt@mail.local>
 <CADkTA4P4MKW6XG1Sdeac-NQHuk_mMWDPuhjXj4HN-wnOw4z0rw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P4MKW6XG1Sdeac-NQHuk_mMWDPuhjXj4HN-wnOw4z0rw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Sep 2022 11:43:32 -0700
Message-ID: 
 <CAMKF1sq0UJJ354o0V7Xs8-wo00bdEWFohLxP_Zf0Xa7McQtHzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: Enable mdio for qemu
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 18:44:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170468

Cool, thanks!

On Thu, Sep 8, 2022 at 7:09 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Sep 8, 2022 at 9:48 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hi,
> >
> > This caused many failures like this one:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5847/steps/11/logs/stdio
> >
>
> Technically not an error, only an error in the eyes of the stricter testing.
>
> Khem: Let me queue the patch here, and I'll add a mask for that
> warning, since in this case =y is as good as =m
>
> Bruce
>
> > On 07/09/2022 15:05:35-0700, Khem Raj wrote:
> > > There are package like mdio-netlink in meta-oe which need this feature
> > > to be available, it has started to fail with 5.19
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto_5.19.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > > index 0ff28aa952..e96395d1bb 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > > @@ -56,7 +56,7 @@ COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qe
> > >  # Functionality flags
> > >  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> > >  KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
> > > -KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
> > > +KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
> > >  KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > >  KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > >  KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
> > > --
> > > 2.37.3
> > >
> >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#170431): https://lists.openembedded.org/g/openembedded-core/message/170431
> > > Mute This Topic: https://lists.openembedded.org/mt/93535950/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

