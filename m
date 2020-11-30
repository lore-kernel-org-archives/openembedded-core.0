Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.59843.1606742654246625984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 05:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=en55zYOt;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id n24so13951608edb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 05:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xWME1qzg7amN9VK9ni1H4mOeTlnE4rAhB07W2StIPPA=;
        b=en55zYOtxuoWsgI+SRnPvvA2rp6CmxvjTyWgiENwdbAJvqkkTSRAbVX8dg8/AkkX+Y
         aqt+jQFvce/8HKrzKbX4QYkjxXxIXQQ/KDreKRfzZIHE6YLdGZCWlsml86upTquQZjFl
         YBYiC41TomRvu9gcZo2ZfcL5MqMdbI1wZC66VIGQkdQaSGPPFnnHWspXgPkTHz2Q1XGw
         SEQGncXjyR7wNFPGChHUPbhizq1URN66tGn4KAfuy68HNPUKoGSWp8vfef/KNsH62TkM
         MqgsMAy4DqFKqcTNgXOqIoCM5RK4svM+D156Fql0Qigdpo2WaEAQCLJ/xkP68Fcwk9xz
         WhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xWME1qzg7amN9VK9ni1H4mOeTlnE4rAhB07W2StIPPA=;
        b=GLTr0riKP67HH6Mq1h4s8UMtu58Lgu9sQHusoK4CBAXvgxg26Y2UCvBY7WF7Irt3jc
         3/+sg0AM8xX9g01rzS6qFKtzdUToy0USoCKKfxaSHM3yC5ISLweegP3CPPNnOoRITXbQ
         Svx3ait1RwoP2e5wy2BdDPHNnStkeRGdLBwqnYkZJOGPlC3/wHxJ94cuCM4RD8rCYb37
         frBiDKYSRByuzo0oK9N8igI70pQRby/HP6DeSHDn01YUIQRpChEBu5HQH60q/Tbm056y
         0Tq93VtqcVr1Nfv3VaOa7jVNSPSdHV2VUH7IrMZrAG2LvPq7+kmcbPCQ2c7EIAFEDDw4
         UXqQ==
X-Gm-Message-State: AOAM530Uo6RYG7AAgukth8ONZbiyBCPVK/t3f0VoWMwZClZ7wqP0fFCL
	5YNKCWd+K3x6G4c/e/L76kGMly0Gmojd8d38dmw=
X-Google-Smtp-Source: ABdhPJwjD/kXN7/T4FOwihpQubyZichT+rbjHRwi01oIaaJ4oM0dIvsDWIjYsURiwsrsT3KxX45hxTmr2uDWLwU9Xro=
X-Received: by 2002:a05:6402:17ad:: with SMTP id j13mr21817623edy.347.1606742652662;
 Mon, 30 Nov 2020 05:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20201118045633.47396-1-bruce.ashfield@gmail.com> <CAP71Wjzp=9QWJLvANLXw2p6YtbgbZbK6yx0sxHVU2zBKB7x1oA@mail.gmail.com>
In-Reply-To: <CAP71Wjzp=9QWJLvANLXw2p6YtbgbZbK6yx0sxHVU2zBKB7x1oA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 30 Nov 2020 08:24:01 -0500
Message-ID: <CADkTA4NxyxdJaCboGLdjE8syqDO+MBVVNOoRe4rTs90Ym_sp_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel: relocate copy of module.lds to module compilation task
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Steve Sakoman <steve@sakoman.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 2:38 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hi Steve and Bruce,
>
> On Wed, Nov 18, 2020 at 5:56 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > There were two copies of this patch floating around, and the merged
> > variant has the copy in the wrong place.
> >
> > module.lds is only created during modules_prepare, and that target is
> > not invoked during our main build of the kernel. We aren't about to
> > change the kernel build (there's no need), so we move the copy into
> > the compile_kernelmodules task. After that runs, we have module.lds
> > availble to copy.
> >
> > This has been tested against clean kernel + out of tree module
> > builds, and the dependencies are correct that the file is copied
> > before the out of tree module build starts.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>
>
> Can we get this patch into dunfell? This is fixing a bug for BSP using
> 5.10+ kernel, so I believe this is important for LTS. I haven't
> attempted to backport it yet.. but let me know if you need help with
> the backport.

For a backport, you need this patch and also the one that it is tweaking:
[kernel: provide module.lds for out of tree builds in v5.10+], but I didn't
check to see if Steve had already grabbed that one.

I also don't see any issue with this, and the backport is simple enough since
it is additive to what we copy into the artifacts.

Like building on newer distros, we will eventually run into newer kernel
support that we can't backport or support on dunfell .. but this isn't that
case!

Steve: it should be a simple cherry pick, if it isn't, let me know and I can
send the patches.

Cheers,

Bruce

>
>
> > ---
> >
> > v2:
> >
> > I had done my test builds on a branch that didn't actually contain my
> > change, hence why 5.8 builds where blowing up.
> >
> > I switched to the if [ ] model, since that doesn't run afoul of the
> > exit handler. I do find it curious that the compile task behaves so
> > differently than the install ones (even with set +e, I couldn't use
> > the [ ] method.
> >
> > Anyway, this is tested against 5.8 and 5.10 + eternal module builds
> >
> > Bruce
> >
> >  meta/classes/kernel.bbclass | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index ccd74e61e8..8b28ee626f 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -391,6 +391,10 @@ do_compile_kernelmodules() {
> >                 # other kernel modules and will look at this
> >                 # file to do symbol lookups
> >                 cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
> > +               # 5.10+ kernels have module.lds that we need to copy for external module builds
> > +               if [ -e "${B}/scripts/module.lds" ]; then
> > +                       install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
> > +               fi
> >         else
> >                 bbnote "no modules to compile"
> >         fi
> > @@ -494,7 +498,6 @@ do_shared_workdir () {
> >         # Copy files required for module builds
> >         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> >         [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> > -       [ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
> >         cp .config $kerneldir/
> >         mkdir -p $kerneldir/include/config
> >         cp include/config/kernel.release $kerneldir/include/config/kernel.release
> > --
> > 2.19.1
> >
> >
> > 
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
