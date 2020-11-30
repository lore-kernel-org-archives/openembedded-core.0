Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.60700.1606747020574668657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 06:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lI3hAzct;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.66, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f66.google.com with SMTP id 38so9127622edr.8
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 06:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fs9RfEhpTy9ITg5HtVgvFzL1D00OpzvbjCfXDr58nSM=;
        b=lI3hAzctDSWKCpPaXKtfvJqXLBcXuwBsBv/daqO8+HpgJU/jlK9VlBEfCin8/cH07t
         SgCWLT1GveqH56OMHz/EjNl2wrWIbkepdmVccz6XZrydaRnsiOhWR2XEaB3QyFTwXp27
         WTBqIWT/z7aKT+Sml9Spzj8G3RsTtvjXAmrGlZDs76oXEeK2it1Cw+wN/r98Wyh0MT32
         zWWFc1C23ZpBvXjHIqagMTPtxMxPezw3DNXkDPe+8ag/lCsSUB8cnksI/nwJNqNVJ56+
         x0WXbkyxeub0V8ajOVvfN+cdleYf6xl/XlosO5MtAyhJ4ymQEW5a4MDLKbHJgonNK2C+
         bVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fs9RfEhpTy9ITg5HtVgvFzL1D00OpzvbjCfXDr58nSM=;
        b=cLyZ/eJOvrf6Zcq1qaHUYN7XPGpJaqew9dXTszraJ7JMnnEXG6DbtGjaArGvsOYDrR
         pzT0wQ9b4wJPghGDXcSRi80SEr5JouEsKTio5DCjG9atB+NuDBlIFtrcpNypkE1nkyXg
         u+vtgs60E2cfM2VqwW42kh5LqyNGyi+Yq/oqlFl33cQCWReCFTNlElASFppyKJBZjqpd
         ZKI3tV9uCttY5BxWSGtHbtov5oU03BLj56n7I34vbbN+eXlSDxGSVDijlwxr61+HzntT
         rSvNtKhrxxbxLxHLEcaGC92uL1el7HkZG9vMvgsdBweUkUjsnlDQGqr6cybKHi8LcfhX
         eKqg==
X-Gm-Message-State: AOAM533LOY0OLIMaIZriLhv/XJ3UEP6LKIADueAqtqBIxDxjoooCA+dc
	0D3ONIyfrS2xBrdSAabQzKwFpZsMGtnZXO7AUWxzvA==
X-Google-Smtp-Source: ABdhPJwwMwmFecjDb8cByuK6j/TAiB/X4mPU9wOwXRausd98xh8qbIb2Sigug34vORbC0/MLkFLd8Oztdi0fyjbZTPo=
X-Received: by 2002:a50:a6c9:: with SMTP id f9mr21760394edc.158.1606747018914;
 Mon, 30 Nov 2020 06:36:58 -0800 (PST)
MIME-Version: 1.0
References: <20201118045633.47396-1-bruce.ashfield@gmail.com>
 <CAP71Wjzp=9QWJLvANLXw2p6YtbgbZbK6yx0sxHVU2zBKB7x1oA@mail.gmail.com> <CADkTA4NxyxdJaCboGLdjE8syqDO+MBVVNOoRe4rTs90Ym_sp_g@mail.gmail.com>
In-Reply-To: <CADkTA4NxyxdJaCboGLdjE8syqDO+MBVVNOoRe4rTs90Ym_sp_g@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 30 Nov 2020 04:36:47 -1000
Message-ID: <CAOSpxdai_zn_6UnPh74q3p=6w-fV9-m3yW=OpiLArrd+ofY4DA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel: relocate copy of module.lds to module compilation task
To: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 3:24 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Mon, Nov 30, 2020 at 2:38 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > hi Steve and Bruce,
> >
> > On Wed, Nov 18, 2020 at 5:56 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > There were two copies of this patch floating around, and the merged
> > > variant has the copy in the wrong place.
> > >
> > > module.lds is only created during modules_prepare, and that target is
> > > not invoked during our main build of the kernel. We aren't about to
> > > change the kernel build (there's no need), so we move the copy into
> > > the compile_kernelmodules task. After that runs, we have module.lds
> > > availble to copy.
> > >
> > > This has been tested against clean kernel + out of tree module
> > > builds, and the dependencies are correct that the file is copied
> > > before the out of tree module build starts.
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> >
> > Can we get this patch into dunfell? This is fixing a bug for BSP using
> > 5.10+ kernel, so I believe this is important for LTS.

Certainly!

> For a backport, you need this patch and also the one that it is tweaking:
> [kernel: provide module.lds for out of tree builds in v5.10+], but I didn't
> check to see if Steve had already grabbed that one.
>
> I also don't see any issue with this, and the backport is simple enough since
> it is additive to what we copy into the artifacts.
>
> Like building on newer distros, we will eventually run into newer kernel
> support that we can't backport or support on dunfell .. but this isn't that
> case!
>
> Steve: it should be a simple cherry pick, if it isn't, let me know and I can
> send the patches.

A simple cherry-pick was successful.  Will start testing later this morning.

Steve

> > >
> > > v2:
> > >
> > > I had done my test builds on a branch that didn't actually contain my
> > > change, hence why 5.8 builds where blowing up.
> > >
> > > I switched to the if [ ] model, since that doesn't run afoul of the
> > > exit handler. I do find it curious that the compile task behaves so
> > > differently than the install ones (even with set +e, I couldn't use
> > > the [ ] method.
> > >
> > > Anyway, this is tested against 5.8 and 5.10 + eternal module builds
> > >
> > > Bruce
> > >
> > >  meta/classes/kernel.bbclass | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > index ccd74e61e8..8b28ee626f 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -391,6 +391,10 @@ do_compile_kernelmodules() {
> > >                 # other kernel modules and will look at this
> > >                 # file to do symbol lookups
> > >                 cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
> > > +               # 5.10+ kernels have module.lds that we need to copy for external module builds
> > > +               if [ -e "${B}/scripts/module.lds" ]; then
> > > +                       install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
> > > +               fi
> > >         else
> > >                 bbnote "no modules to compile"
> > >         fi
> > > @@ -494,7 +498,6 @@ do_shared_workdir () {
> > >         # Copy files required for module builds
> > >         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> > >         [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> > > -       [ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
> > >         cp .config $kerneldir/
> > >         mkdir -p $kerneldir/include/config
> > >         cp include/config/kernel.release $kerneldir/include/config/kernel.release
> > > --
> > > 2.19.1
> > >
> > >
> > > 
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
