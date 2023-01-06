Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBACC5479D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 10:13:59 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.10588.1673000033472448824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 02:13:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DusRNImc;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: toertel@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id g10so706506qvo.12
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 02:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mhf2+DPLXCU0PnBxxRiUAKlHOIgceismz3MACAuaBAc=;
        b=DusRNImcP2FD1Nmb4KePOCktrjpG69Hlb7kOROF1V5VCYhw5NzaK4XHgmJW0rolcNv
         2ZxVbIgvHkmqm3LAMgcYfPmTPR21dj44v9FGf6oq1gAozslMAlCZb9G2cu0dtfIMD66o
         8W6RtARKkjXLZxiC3esOsJklBjS0jZ4QZVoGixIhB0aIki7vwhTlRBO65ome4xFaPtSR
         rupINvqiavssG1g4M4Mv658TsZemWLz6ypZDnK7IVsl5Hpz6roS3IJrIcGWqOESqisXB
         x47ruiH9mOKIhD6TW9td1UOYaPaJUwc5xOvYxZSUFuQtmKVs4MsxNfCVKcXAK1opdNgU
         dsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mhf2+DPLXCU0PnBxxRiUAKlHOIgceismz3MACAuaBAc=;
        b=JejKZ1ajg9RVOwHtbynko0WPbVuWAcUU3mHKootn9bZFPtLCrMpjo6wJPzfmBv+EHy
         b32KiGrsBcx+Ep3gfo9DeonxVOhYRDGBLKfWNlqrbJVeoA4cOD0eb6xdsze3qIfzzdmb
         yiFcOmB+MYxgHoCZOyXwo7KMPQj/Lr911+Hb1pLGnF+CrVI2tcVrD8CVzGt39zA57E+f
         KoLPvqFwXWIdI5E6amAp8DuuAlg27G+nJXA13stqAbnKKKIZZIXIHctC8Ax7c6PO78RO
         ixwKacyZhPv1dYj+cC5iyjByynw3iyq3/IAdRhm3O+emHo3wUv+iNgrlP8ddhEO9rqIs
         yYFQ==
X-Gm-Message-State: AFqh2ko7t7y//EtLlUWz0ECxQYUohU1+KfDE8kJFhloEbkgEe2Z96VU9
	LoLjFHBj6qzbpa42gGc14ETijAhGIZAG6yFShxw=
X-Google-Smtp-Source: AMrXdXv4Pjpd77RmrWbxaa70TfZh3Ix3K6bYOv0jhB5oqzclrhRID4GQbNe/6Wn9IIjmxirWJHRzGnfmu76l3kQhQxA=
X-Received: by 2002:a05:6214:3904:b0:525:1e7e:ae46 with SMTP id
 nh4-20020a056214390400b005251e7eae46mr3036512qvb.49.1673000032493; Fri, 06
 Jan 2023 02:13:52 -0800 (PST)
MIME-Version: 1.0
References: <20230104121808.1065203-1-toertel@gmail.com> <20230104121808.1065203-3-toertel@gmail.com>
 <CADkTA4OBb1J9Ld19rzvuQntdj04rRUdH9sP=cPSKwvO=U1s-Tw@mail.gmail.com>
 <CAEE5dN1jL4KYpYMz9En=NqiEE-Bu8HsCXhTSUgECekktmjr78A@mail.gmail.com> <CADkTA4NhVxONZONVWd9yP4g735Mr5cVThLPcWRUv0vBYkXmc3A@mail.gmail.com>
In-Reply-To: <CADkTA4NhVxONZONVWd9yP4g735Mr5cVThLPcWRUv0vBYkXmc3A@mail.gmail.com>
From: Mark Jonas <toertel@gmail.com>
Date: Fri, 6 Jan 2023 11:13:41 +0100
Message-ID: <CAEE5dN09OUTNQXNaDBBmVmrC9N2+r96chz4Q8NhtsF7vqZkMcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] linux-yocto: Autoload sound driver on QEMU x86
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, michael.opdenacker@bootlin.com, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 10:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175569

Hi Bruce,

On Thu, Jan 5, 2023 at 3:57 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Jan 5, 2023 at 8:42 AM Mark Jonas <toertel@gmail.com> wrote:
> >
> > Hi Bruce,
> >
> > On Wed, Jan 4, 2023 at 5:07 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Wed, Jan 4, 2023 at 7:18 AM Mark Jonas <toertel@gmail.com> wrote:
> > > >
> > > > From: Mark Jonas <toertel@gmail.com>
> > > >
> > > > If DISTRO_FEATURES includes ALSA then automatically load the
> > > > snd-intel8x0 kernel module on qemux86 and qemux86-64. This matches the
> > > > machine configurations conf/machine/qemux86.conf and qemux86-64.conf.
> > > >
> > > > Signed-off-by: Mark Jonas <toertel@gmail.com>
> > > > ---
> > > >  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > index 091003ed82..c8a9b0a1e3 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > @@ -37,6 +37,11 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
> > > >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> > > >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
> > > >
> > > > +# sound driver recommended by conf/machine/qemux86*.conf
> > > > +ALSA_MODULES = "${@bb.utils.contains("DISTRO_FEATURES", "alsa", "snd-intel8x0", "", d)}"
> > > > +KERNEL_MODULE_AUTOLOAD:qemux86 += "${ALSA_MODULES}"
> > > > +KERNEL_MODULE_AUTOLOAD:qemux86-64 += "${ALSA_MODULES}"
> > >
> > > This gets us most of the way, but if we are going to do this we should
> > > complete the job.
> > >
> > > We really need to make sure there's a configuration fragment that
> > > explicitly enables
> > > the modules we need (and not count on defaults, or other selects). That would go
> > > into the kernel-cache.
> > >
> > > It would then be something we'd add to the KERNEL_FEATRES triggered off the
> > > distro feature. Just like we are doing with numa and vfat that is visible in the
> > > context of the patch.
> >
> > In my understanding this is already the case. See for example
> > linux-yocto_5.19.bb which contains the following lines.
> >
> > KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> >
> > Does that maybe mean I should better add the KERNEL_MODULE_AUTOLOAD
> > into the same file where the corresponding configuration fragment is
> > added? But that would mean to duplicate the lines over five recipes.
> >
> > Alternatively I could move the cfg/sound.scc out of the recipes into
> > the linux-yocto.inc. But then linux-yocto-tiny_*.bb recipes would also
> > get it.
>
> I definitely wasn't clear. Sorry about that, I'm still partially on
> holidays and didn't have enough coffee when I wrote that.
>
> That is close to what I meant. It is one thing to define the options
> in our generic sound "buckets" and another to put a specific module
> into the autoload.
>
> If we are going to autoload a module, the option really should be
> pulled out of the generic bucket, and put into something smaller /
> specific to what we are trying to do, and trigger the inclusion of
> that fragment only when the appropriate distro feature is set. The
> machine conf files specifying specific modules isn't ideal, since it
> is largely "aspirational" unless it is coupled with a KERNEL_FEATURE
> that is set based on a machine or distro feature.

I have to admit that I feel a bit lost. I am not really sure I
understood what you meant.

Is the "generic bucket" cfg/sound.scc? But why should we break that
up? A module only ends up in an image if the module is installed. And
the installation is controlled e.g. by MACHINE_EXTRA_RRECOMMENDS in
the machine file.

> If you search the mailing list archives, you'll see me musing about
> how I need to change those unconditional appends of option to qemu, as
> it makes defining a new qemu machine problematic (if the options are
> causing issues). The tweak I'm describing is a small step in that
> direction.

What I understood is that you propose to change the existing

KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"

in e.g. linux-yocto_5.19.bb to (remove cfg/sound.scc)

KERNEL_FEATURES:append:qemux86=" cfg/paravirt_kvm.scc"
KERNEL_FEATURES:append:qemux86-64=" cfg/paravirt_kvm.scc"

and add (move) the following into linux-yocto.inc

KERNEL_FEATURES:append:qemuall="
${@bb.utils.contains('MACHINE_FEATURES', 'alsa', 'cfg/sound.scc', '',
d)}"

That is, instead of coupling the compilation of QEMU sound driver
modules based on machine name qemux86 and qemux86-64 we activate it
for all QEMU machines which also have alsa as a MACHINE_FEATURE. And
that is set in machine/include/qemu.inc.

> One new question comes to mind, what init system were you testing with
> (default poky and sysvinit ?) ? If we now have the proper init system,
> are no events being triggered to load the modules now that the proper
> ones are in the machine files ?

I was testing on Poky with the default init system i.e, sysvinit.
Without the KERNEL_MODULE_AUTOLOAD line the snd-intel8x0 module is not
loaded.

And it seems you are right: The KERNEL_MODULE_AUTOLOAD is superfluous.
Even when I remove the second patch the modules are still loaded. I am
a little puzzled why it originally seemed to me that it was necessary.

Cheers,
Mark

