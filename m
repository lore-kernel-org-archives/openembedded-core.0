Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D01C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 13:43:01 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.12957.1672926176053450491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 05:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cor8XuHi;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: toertel@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id y8so1531900qvn.11
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 05:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/V1oqxll8CMOa40CgOMbqLJxcTYdOpD66Nta4Bbin0=;
        b=Cor8XuHicPDadt1+Rg5huJ70Betj13T9MPn6L+zy67GqmqvPb2LIlDYXQrGg15Llaf
         NFeEAmdltGALMrV/YcWSe2fhcD94hrwbKuT9UE669qBGhVX+aqT774FueUxDGKPR+00u
         v+VZCbMUQkI2h4EGjG1osWCWZJVd8E4liqaMwnDcQbkQXbossj04HwkZTHkuuneJNSIU
         s8KKGTVIpAc4VA2OtoU9/qCvE9QA56jcgvMv1BcU3U8tBI90We6hNGUrL1QIHFkjpf35
         NUGan8dEa/yzIAf+1fq/Quue7icPMi0Q56bE/h9LIxz93mdRUNPmCX6Wzfi7CHTlhN30
         narg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/V1oqxll8CMOa40CgOMbqLJxcTYdOpD66Nta4Bbin0=;
        b=vIVX1wr9BZe7iUFSLwSCZynM5URNnv7xHUnQlXKAUGpcJhvj23r7ZYurpAqwSmo/OI
         zy03dJV+9mlw9d7XqxCXE8htYtUp3uRzx40YlaAbIlNsMdStQ9J97lP3XvgZTcYfkXR9
         WO7DjgeL5axvWKVk651KmXYoTC6xfp0tIRdzqrAFu6ewsaiLr7ufI6zoj6uxC9wMvMSe
         2baWTVAaxGNVPW+DtChpW5shWjqlxmgQ9CcSU0rJNiYE8EsElSeD6xniUfb/0ZmN2lB1
         mjNWC/iUK1T822RumhxDPpU2cFCwLXHdcCVC/lnnmOrT4lzXtZ/aB6dFjnkiBK555Z7f
         DDGg==
X-Gm-Message-State: AFqh2kpI1ZtSlAKBpBJEi5VP3Qdmw9hUOgqt/vMZkBqfAZ0pCNrVVu+F
	NT/8aDde9JpImJ1Ff3YoXHpTrgorrF6mfOGjxwM=
X-Google-Smtp-Source: AMrXdXuLEBOJ3WEpHUPOZyr6jE57uI/Jy42wlSZQ521kANPLy2NK6OD9BT30faBxgBIvjXhZpXu4LSijjlRksaJ+ubA=
X-Received: by 2002:a05:6214:3904:b0:525:1e7e:ae46 with SMTP id
 nh4-20020a056214390400b005251e7eae46mr2864213qvb.49.1672926175011; Thu, 05
 Jan 2023 05:42:55 -0800 (PST)
MIME-Version: 1.0
References: <20230104121808.1065203-1-toertel@gmail.com> <20230104121808.1065203-3-toertel@gmail.com>
 <CADkTA4OBb1J9Ld19rzvuQntdj04rRUdH9sP=cPSKwvO=U1s-Tw@mail.gmail.com>
In-Reply-To: <CADkTA4OBb1J9Ld19rzvuQntdj04rRUdH9sP=cPSKwvO=U1s-Tw@mail.gmail.com>
From: Mark Jonas <toertel@gmail.com>
Date: Thu, 5 Jan 2023 14:42:44 +0100
Message-ID: <CAEE5dN1jL4KYpYMz9En=NqiEE-Bu8HsCXhTSUgECekktmjr78A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] linux-yocto: Autoload sound driver on QEMU x86
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, michael.opdenacker@bootlin.com, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 13:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175526

Hi Bruce,

On Wed, Jan 4, 2023 at 5:07 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, Jan 4, 2023 at 7:18 AM Mark Jonas <toertel@gmail.com> wrote:
> >
> > From: Mark Jonas <toertel@gmail.com>
> >
> > If DISTRO_FEATURES includes ALSA then automatically load the
> > snd-intel8x0 kernel module on qemux86 and qemux86-64. This matches the
> > machine configurations conf/machine/qemux86.conf and qemux86-64.conf.
> >
> > Signed-off-by: Mark Jonas <toertel@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> > index 091003ed82..c8a9b0a1e3 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > @@ -37,6 +37,11 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
> >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
> >
> > +# sound driver recommended by conf/machine/qemux86*.conf
> > +ALSA_MODULES = "${@bb.utils.contains("DISTRO_FEATURES", "alsa", "snd-intel8x0", "", d)}"
> > +KERNEL_MODULE_AUTOLOAD:qemux86 += "${ALSA_MODULES}"
> > +KERNEL_MODULE_AUTOLOAD:qemux86-64 += "${ALSA_MODULES}"
>
> This gets us most of the way, but if we are going to do this we should
> complete the job.
>
> We really need to make sure there's a configuration fragment that
> explicitly enables
> the modules we need (and not count on defaults, or other selects). That would go
> into the kernel-cache.
>
> It would then be something we'd add to the KERNEL_FEATRES triggered off the
> distro feature. Just like we are doing with numa and vfat that is visible in the
> context of the patch.

In my understanding this is already the case. See for example
linux-yocto_5.19.bb which contains the following lines.

KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"

Does that maybe mean I should better add the KERNEL_MODULE_AUTOLOAD
into the same file where the corresponding configuration fragment is
added? But that would mean to duplicate the lines over five recipes.

Alternatively I could move the cfg/sound.scc out of the recipes into
the linux-yocto.inc. But then linux-yocto-tiny_*.bb recipes would also
get it.

Cheers,
Mark

