Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E61EC54EBF
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 16:33:21 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.18250.1673022792831080162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 08:33:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RNbeCWIR;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id p9so878001iod.13
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 08:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LPA+HWr+zYT04s63ZKIKtGlB6WqxHSF/G+h3ITVgvtI=;
        b=RNbeCWIRoopgMyhta+sw51hO9kCDCNCpkaBitjCfh/zzN0AvtRN6xu0rdMrBpgsFPg
         Oc82gh97CW6tTWrgC+GzmwaaWN1mirvV3+fceQJ56/dSzc4YK3cKEIXs2nsqBRucc/be
         GbLMlT2pLhCw7nvM220VjcLu6XlnU12Z3Thiv1BluueVOjWacQfCIKpr0MWwck1DTY0/
         OEqshM11/pZh49LHhvG4umhvLv4xsGm+EIRqH4YU6VGvMpR9aXT55Kbkiu7Litm8rSHo
         Ef9jWhu4Hr1vtp4HuqRxIvtKQafY9iUuT4M4E9Loj3WiZiS58/YU9+SxOmqb8/bfl4LC
         kA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPA+HWr+zYT04s63ZKIKtGlB6WqxHSF/G+h3ITVgvtI=;
        b=iNEdZDWA7mp+e5bT0YPv6oHcFkyMvHgAbzYalniaVdkJW/RcAqRVJa8AUmK+PK5QEO
         41FdBH5F0kGeMRljeW1UDPSSjOEPFgq4XRPzyG1cw9L/q3kdtW8n1VVjS8FufawIkLQV
         ph9PFwRjaYz8nkeNcfSrPpBhNcCDZca9lGctTkrlEQl/ZxSkGtT4+53+SmThc/UNejXk
         z+3U7CLYQIpcipBY9v2VPKui4TokYhd7JafcHNdCICkvi6kme3KNY+1xiBj298zOl/Zs
         sgtoW02AHXESo48Saj8IWVrdaBmCLjioEfc3bJ0mtYb9dCn68CwxqefMNfAy+MpC1EcX
         5/4w==
X-Gm-Message-State: AFqh2kqrcxHK8c42DbAGFVPypjZLWC5mxMTEAftPW+Pqyc7lAFxvQZVh
	eSILDeRdj3BRcDUPTsclZvCYD7MskMJ5GF3QTWE=
X-Google-Smtp-Source: AMrXdXv/X6BqS6CTQYtYMrzvyoHfFUl+lGH7m3uG3TFPGQkH1eJSszBe83W+NVlaFNa4f8SPUjXuGSewVP3VMwKPle4=
X-Received: by 2002:a5d:9657:0:b0:6e3:628:bec with SMTP id d23-20020a5d9657000000b006e306280becmr4584806ios.83.1673022792083;
 Fri, 06 Jan 2023 08:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20230104121808.1065203-1-toertel@gmail.com> <20230104121808.1065203-3-toertel@gmail.com>
 <CADkTA4OBb1J9Ld19rzvuQntdj04rRUdH9sP=cPSKwvO=U1s-Tw@mail.gmail.com>
 <CAEE5dN1jL4KYpYMz9En=NqiEE-Bu8HsCXhTSUgECekktmjr78A@mail.gmail.com>
 <CADkTA4NhVxONZONVWd9yP4g735Mr5cVThLPcWRUv0vBYkXmc3A@mail.gmail.com>
 <CAEE5dN09OUTNQXNaDBBmVmrC9N2+r96chz4Q8NhtsF7vqZkMcg@mail.gmail.com>
 <a305ae31f8b440d79f66e63b38d1c42c8c6960b6.camel@linuxfoundation.org> <CAEE5dN2RZonxmh18uE97aimG_1+Y6y=7_kcw8SHVj=890B9G9w@mail.gmail.com>
In-Reply-To: <CAEE5dN2RZonxmh18uE97aimG_1+Y6y=7_kcw8SHVj=890B9G9w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Jan 2023 11:33:00 -0500
Message-ID: <CADkTA4NPXg_G1WrAjwfRK-+84gqFX4ndaYBz5L2AaHAnirAuxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] linux-yocto: Autoload sound driver on QEMU x86
To: Mark Jonas <toertel@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, michael.opdenacker@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 16:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175601

On Fri, Jan 6, 2023 at 10:06 AM Mark Jonas <toertel@gmail.com> wrote:
>
> Hi Richard and Bruce,
>
> On Fri, Jan 6, 2023 at 12:27 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2023-01-06 at 11:13 +0100, Mark Jonas wrote:
> > > Hi Bruce,
> > >
> > > On Thu, Jan 5, 2023 at 3:57 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > On Thu, Jan 5, 2023 at 8:42 AM Mark Jonas <toertel@gmail.com> wrote:
> > > > >
> > > > > Hi Bruce,
> > > > >
> > > > > On Wed, Jan 4, 2023 at 5:07 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Jan 4, 2023 at 7:18 AM Mark Jonas <toertel@gmail.com> wrote:
> > > > > > >
> > > > > > > From: Mark Jonas <toertel@gmail.com>
> > > > > > >
> > > > > > > If DISTRO_FEATURES includes ALSA then automatically load the
> > > > > > > snd-intel8x0 kernel module on qemux86 and qemux86-64. This matches the
> > > > > > > machine configurations conf/machine/qemux86.conf and qemux86-64.conf.
> > > > > > >
> > > > > > > Signed-off-by: Mark Jonas <toertel@gmail.com>
> > > > > > > ---
> > > > > > >  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
> > > > > > >  1 file changed, 5 insertions(+)
> > > > > > >
> > > > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > > > index 091003ed82..c8a9b0a1e3 100644
> > > > > > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > > > @@ -37,6 +37,11 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
> > > > > > >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> > > > > > >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
> > > > > > >
> > > > > > > +# sound driver recommended by conf/machine/qemux86*.conf
> > > > > > > +ALSA_MODULES = "${@bb.utils.contains("DISTRO_FEATURES", "alsa", "snd-intel8x0", "", d)}"
> > > > > > > +KERNEL_MODULE_AUTOLOAD:qemux86 += "${ALSA_MODULES}"
> > > > > > > +KERNEL_MODULE_AUTOLOAD:qemux86-64 += "${ALSA_MODULES}"
> > > > > >
> > > > > > This gets us most of the way, but if we are going to do this we should
> > > > > > complete the job.
> > > > > >
> > > > > > We really need to make sure there's a configuration fragment that
> > > > > > explicitly enables
> > > > > > the modules we need (and not count on defaults, or other selects). That would go
> > > > > > into the kernel-cache.
> > > > > >
> > > > > > It would then be something we'd add to the KERNEL_FEATRES triggered off the
> > > > > > distro feature. Just like we are doing with numa and vfat that is visible in the
> > > > > > context of the patch.
> > > > >
> > > > > In my understanding this is already the case. See for example
> > > > > linux-yocto_5.19.bb which contains the following lines.
> > > > >
> > > > > KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > > > > KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > > > >
> > > > > Does that maybe mean I should better add the KERNEL_MODULE_AUTOLOAD
> > > > > into the same file where the corresponding configuration fragment is
> > > > > added? But that would mean to duplicate the lines over five recipes.
> > > > >
> > > > > Alternatively I could move the cfg/sound.scc out of the recipes into
> > > > > the linux-yocto.inc. But then linux-yocto-tiny_*.bb recipes would also
> > > > > get it.
> > > >
> > > > I definitely wasn't clear. Sorry about that, I'm still partially on
> > > > holidays and didn't have enough coffee when I wrote that.
> > > >
> > > > That is close to what I meant. It is one thing to define the options
> > > > in our generic sound "buckets" and another to put a specific module
> > > > into the autoload.
> > > >
> > > > If we are going to autoload a module, the option really should be
> > > > pulled out of the generic bucket, and put into something smaller /
> > > > specific to what we are trying to do, and trigger the inclusion of
> > > > that fragment only when the appropriate distro feature is set. The
> > > > machine conf files specifying specific modules isn't ideal, since it
> > > > is largely "aspirational" unless it is coupled with a KERNEL_FEATURE
> > > > that is set based on a machine or distro feature.
> > >
> > > I have to admit that I feel a bit lost. I am not really sure I
> > > understood what you meant.
> > >
> > > Is the "generic bucket" cfg/sound.scc? But why should we break that
> > > up? A module only ends up in an image if the module is installed. And
> > > the installation is controlled e.g. by MACHINE_EXTRA_RRECOMMENDS in
> > > the machine file.
> >
> > I might also be misunderstanding but I think what Bruce is asking is
> > that the qemux86 sound pieces be broken out of cfg/sound.scc. In case
> > you didn't find them, the files are here:
> >
> > https://git.yoctoproject.org/yocto-kernel-cache/tree/cfg/sound.scc
> > https://git.yoctoproject.org/yocto-kernel-cache/tree/cfg/sound.cfg
> >
> > and the question is which of the options in sound.cfg are the drivers
> > which qemu needs on x86.
> >
> > I think Bruce would like a patch which splits those items out and
> > triggers them on qemux86 specifically.
> >
> > This means if things change in future, we know exactly which module
> > options we need for sound on qemux86.
> >
> > Bruce can correct me if I misunderstand! :)
>
> Yes, that makes sense to me. But I have to admit that I neither have
> the time nor the sound driver knowledge to do this properly. I am
> afraid that it would not be sufficient to simply break out the driver
> needed for QEMU ie., intel8x0 and its dependencies. sound.cfg contains
> support for a lot of different sound cards which share kernel config
> options / modules. It can be done and the scc files support that but
> that is too much time needed for me right now. Sorry.

I can help with this part, since I don't want to lose the contribution by
asking for too much!

It really is just putting the =m configuration for the modules into a
separate config, with any direct dependencies in that same file.

If you send a patch that does the tweaking of the enablement, I can
pull it into my queue and split out the fragments to something
specific to what we need, and submit them all as a series.

Bruce

>
> What I actually wanted to achieve is to build Doom with YP and run it
> in QEMU. And even though the correct sound drivers are now loaded I do
> not get sound using e.g., aplay
> /usr/share/sounds/alsa/Front_Center.wav.
>
> > > > If you search the mailing list archives, you'll see me musing about
> > > > how I need to change those unconditional appends of option to qemu, as
> > > > it makes defining a new qemu machine problematic (if the options are
> > > > causing issues). The tweak I'm describing is a small step in that
> > > > direction.
> > >
> > > What I understood is that you propose to change the existing
> > >
> > > KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > > KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > >
> > > in e.g. linux-yocto_5.19.bb to (remove cfg/sound.scc)
> > >
> > > KERNEL_FEATURES:append:qemux86=" cfg/paravirt_kvm.scc"
> > > KERNEL_FEATURES:append:qemux86-64=" cfg/paravirt_kvm.scc"
> > >
> > > and add (move) the following into linux-yocto.inc
> > >
> > > KERNEL_FEATURES:append:qemuall="
> > > ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', 'cfg/sound.scc', '',
> > > d)}"
> > >
> > > That is, instead of coupling the compilation of QEMU sound driver
> > > modules based on machine name qemux86 and qemux86-64 we activate it
> > > for all QEMU machines which also have alsa as a MACHINE_FEATURE. And
> > > that is set in machine/include/qemu.inc.
> > >
> > > > One new question comes to mind, what init system were you testing with
> > > > (default poky and sysvinit ?) ? If we now have the proper init system,
> > > > are no events being triggered to load the modules now that the proper
> > > > ones are in the machine files ?
> > >
> > > I was testing on Poky with the default init system i.e, sysvinit.
> > > Without the KERNEL_MODULE_AUTOLOAD line the snd-intel8x0 module is not
> > > loaded.
> > >
> > > And it seems you are right: The KERNEL_MODULE_AUTOLOAD is superfluous.
> > > Even when I remove the second patch the modules are still loaded. I am
> > > a little puzzled why it originally seemed to me that it was necessary.
> >
> > I'm not sure on that. The kernel will try and autoprobe for drivers for
> > hardware it has present where it can though.
>
> I'll wait for Bruce's feedback and then send an updated patch which
> fixes the QEMU machine file.
>
> Cheers,
> Mark



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

