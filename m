Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web10.62493.1606754739849849670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 08:45:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hXI67pXo;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id s8so11961780yba.13
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 08:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q12DJ+Ne14cP4sxPOCTqL2Fnxl+ytR5NU7LKonDOlO8=;
        b=hXI67pXo3KuNmwus4sZK1fLMt4Cb3TdetpU7IJ0s9inBWnZwqzvUN7uQYI6WLCkJA8
         BXNIXoNrXEEQky1Y5kmB29PUuvR9QqNKVJ/wvocKxYzjKbnl2++9s7lBV6QHhfl7ikdt
         plWLjbpBYTsIVtPH5/wTjdalnRhuTtEJN9+ODiXNzkljCD2eq7e9lRqKyQNsJwdBiCsu
         CQZt03cyWVSe4JPGlYwYrDAWbOCfzrsiu+vJTqwqg+krKsiz1ELIxtT6m+nwM36KdkUh
         ANQOZir61P2Y2qhWAFD1bcHhtgT6lIV8QFIUUokMVGprGOVvTmEbcVfAPjes4ofXNHEt
         LS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q12DJ+Ne14cP4sxPOCTqL2Fnxl+ytR5NU7LKonDOlO8=;
        b=nOhpVleic5bhCYEoBm/WBpm0DTBwwVxU6qXOpmxTU1YXgX3wmKoGFAeddH2XJ6OfBg
         bXRe5KNGqyfhblbADhPGBt343bKPRBJCNqajwgqC4m3ai2PZ9RH0BMElo+ItZ5RwHuGZ
         K+qc8ulEOOxyv3mEmMKj1qv9TrUZQkYCiEDdZl60J24tvGsLok1YmCKWNgC37SKUXNVE
         ijea3v580Qr+DAK9+j18P//o5YybYdIZpZyPaWYl4MBF4fqVzUDxJX1WWIH79tmHBu6n
         sK7yr/Z6+viGJBnc7OL+jQPFewRe+KCaR8KeevDmUg4bEwGrMFJpIgDHj4/gttEsBhBe
         StbA==
X-Gm-Message-State: AOAM532ras82NBbsyRQsFQeeMDK5ZFM0pnIaN4u0Ij5U70kAqXVh4Usc
	hy2oGCbrPBTsCAOl/0Z86K4CPRsTEiLU3ZkGz8wo/g==
X-Google-Smtp-Source: ABdhPJxJBAVZBjbaBReDE0O5hmyFZOm+4CvmncFlqzNxVQr9AGJ83gAoUaF9umjeRz0m65KJjDtFivk3uEFTyQzVTuU=
X-Received: by 2002:a25:bbc5:: with SMTP id c5mr31195372ybk.373.1606754738886;
 Mon, 30 Nov 2020 08:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20201118045633.47396-1-bruce.ashfield@gmail.com>
 <CAP71Wjzp=9QWJLvANLXw2p6YtbgbZbK6yx0sxHVU2zBKB7x1oA@mail.gmail.com> <CAOSpxdbEu_3ZQOS-YQCFr9Z64CaNuSjPP=YC1FU2nyXc8919CQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbEu_3ZQOS-YQCFr9Z64CaNuSjPP=YC1FU2nyXc8919CQ@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 30 Nov 2020 17:45:28 +0100
Message-ID: <CAP71WjxxrXphMse3iLxWOjEC11jJ888JrLOoCyAdQdNUgJitxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel: relocate copy of module.lds to module compilation task
To: Steve Sakoman <steve@sakoman.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 4:34 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Sun, Nov 29, 2020 at 9:38 PM Nicolas Dechesne
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
> > 5.10+ kernel, so I believe this is important for LTS. I haven't
> > attempted to backport it yet.. but let me know if you need help with
> > the backport.
>
> Is this the only patch you need to fix the 5.10+ kernel issue in dunfell?
>
> In general I haven't been taking patches that claim to be for kernels
> beyond 5.4, so I suspect there may be a handful of other patches you
> might need.

Not that I am aware! Thanks for picking it!

>
> Steve
>
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
