Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A3DC3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 14:57:51 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.14711.1672930670057557894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 06:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kx6wbm8j;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id g20so19620009iob.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 06:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3hI1B8GkIDLgkaCEs2wlAli7fGwAUtS0nAbQ9A1vAqs=;
        b=kx6wbm8jmCqJFB2T+WKggBgRxZyoWyiaPbvOIHh0kD3ehXL5K9UNfHbbQRFVSIYf7t
         QKtTHBDbXcNi3bg7UWhUQQbOExv3MTevi7gGem2rOFfF/EUWYDeJm8K1jzPenC/tqT9F
         o4TU/YmmqTonJR26edfQAikKDIT/cWB7lfolAlJGDrg9oFJzBKK0wZDEeJ7sil+P1KlV
         Bs6nLsX0Oqwu4CeIAGExTuTwA+PZlwpLAyr4bhXB1Yze2Fk44N6GbUbTsBGFx/bX/faM
         iW4E7SXuvLBfcWYn408PeTblTDskydTBBL56oSOYadm8oWimaoquPeC2rch6buf+Grv0
         n6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hI1B8GkIDLgkaCEs2wlAli7fGwAUtS0nAbQ9A1vAqs=;
        b=TbNbdkokGvQ8+X8znIZlS5vqJIyS/mXtoTxsWgB331/uLXfaSKe5lnsQxWCBjI6Fro
         aUdkZGBgBBKwJukDKrucW3pDP68v4bakqmZfyCQYPYQWxZGXw8sbbx891vu2OBu+ZQjN
         wbSnI0XCXMHWZu5JDhhTlgOFGQV0F+rqQZE/wcnchOUca/GYSdvK09FhyEVWbqlpMrJh
         tWLO1vm9+IWAz0T9wCWia/gPCQgXmIeSpX3hW1os8/LlAh5FcyW6tXNamMxzT0+SEqbl
         TOuGJw1DrSqS+jnvtqpqZXM/9sPlCk9wZ2T9gWcdNU8nXoAqa82TOnTr9gE3gRaLGEB+
         CdOg==
X-Gm-Message-State: AFqh2kpFcYJnBM5vCSQO3cpxBnKuigw24A/t3Shh7V/x4FVUaEZQHFzh
	7GyEW64SjKo496K9iFhueZYYqPhMpdpaMkEqeOM=
X-Google-Smtp-Source: AMrXdXtHmR6xRJ3lckpGsZeBTGIHTGxzwfgqDLQJHY0P5m4IoX2d0rjAfqeKJvFrlaKt6pBkYnSXCEllbGjwowzRUWM=
X-Received: by 2002:a05:6638:1a1:b0:38a:7f45:a5ff with SMTP id
 b1-20020a05663801a100b0038a7f45a5ffmr4269887jaq.9.1672930669320; Thu, 05 Jan
 2023 06:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20230104121808.1065203-1-toertel@gmail.com> <20230104121808.1065203-3-toertel@gmail.com>
 <CADkTA4OBb1J9Ld19rzvuQntdj04rRUdH9sP=cPSKwvO=U1s-Tw@mail.gmail.com> <CAEE5dN1jL4KYpYMz9En=NqiEE-Bu8HsCXhTSUgECekktmjr78A@mail.gmail.com>
In-Reply-To: <CAEE5dN1jL4KYpYMz9En=NqiEE-Bu8HsCXhTSUgECekktmjr78A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Jan 2023 09:57:38 -0500
Message-ID: <CADkTA4NhVxONZONVWd9yP4g735Mr5cVThLPcWRUv0vBYkXmc3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] linux-yocto: Autoload sound driver on QEMU x86
To: Mark Jonas <toertel@gmail.com>
Cc: openembedded-core@lists.openembedded.org, michael.opdenacker@bootlin.com, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 14:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175535

On Thu, Jan 5, 2023 at 8:42 AM Mark Jonas <toertel@gmail.com> wrote:
>
> Hi Bruce,
>
> On Wed, Jan 4, 2023 at 5:07 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Wed, Jan 4, 2023 at 7:18 AM Mark Jonas <toertel@gmail.com> wrote:
> > >
> > > From: Mark Jonas <toertel@gmail.com>
> > >
> > > If DISTRO_FEATURES includes ALSA then automatically load the
> > > snd-intel8x0 kernel module on qemux86 and qemux86-64. This matches the
> > > machine configurations conf/machine/qemux86.conf and qemux86-64.conf.
> > >
> > > Signed-off-by: Mark Jonas <toertel@gmail.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> > > index 091003ed82..c8a9b0a1e3 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > @@ -37,6 +37,11 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
> > >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> > >  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
> > >
> > > +# sound driver recommended by conf/machine/qemux86*.conf
> > > +ALSA_MODULES = "${@bb.utils.contains("DISTRO_FEATURES", "alsa", "snd-intel8x0", "", d)}"
> > > +KERNEL_MODULE_AUTOLOAD:qemux86 += "${ALSA_MODULES}"
> > > +KERNEL_MODULE_AUTOLOAD:qemux86-64 += "${ALSA_MODULES}"
> >
> > This gets us most of the way, but if we are going to do this we should
> > complete the job.
> >
> > We really need to make sure there's a configuration fragment that
> > explicitly enables
> > the modules we need (and not count on defaults, or other selects). That would go
> > into the kernel-cache.
> >
> > It would then be something we'd add to the KERNEL_FEATRES triggered off the
> > distro feature. Just like we are doing with numa and vfat that is visible in the
> > context of the patch.
>
> In my understanding this is already the case. See for example
> linux-yocto_5.19.bb which contains the following lines.
>
> KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>
> Does that maybe mean I should better add the KERNEL_MODULE_AUTOLOAD
> into the same file where the corresponding configuration fragment is
> added? But that would mean to duplicate the lines over five recipes.
>
> Alternatively I could move the cfg/sound.scc out of the recipes into
> the linux-yocto.inc. But then linux-yocto-tiny_*.bb recipes would also
> get it.

I definitely wasn't clear. Sorry about that, I'm still partially on
holidays and didn't have enough coffee when I wrote that.

That is close to what I meant. It is one thing to define the options
in our generic sound "buckets" and another to put a specific module
into the autoload.

If we are going to autoload a module, the option really should be
pulled out of the generic bucket, and put into something smaller /
specific to what we are trying to do, and trigger the inclusion of
that fragment only when the appropriate distro feature is set. The
machine conf files specifying specific modules isn't ideal, since it
is largely "aspirational" unless it is coupled with a KERNEL_FEATURE
that is set based on a machine or distro feature.

If you search the mailing list archives, you'll see me musing about
how I need to change those unconditional appends of option to qemu, as
it makes defining a new qemu machine problematic (if the options are
causing issues). The tweak I'm describing is a small step in that
direction.

One new question comes to mind, what init system were you testing with
(default poky and sysvinit ?) ? If we now have the proper init system,
are no events being triggered to load the modules now that the proper
ones are in the machine files ?

Bruce

>
> Cheers,
> Mark







--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

