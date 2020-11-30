Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.61429.1606750442288863892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 07:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=guu+fjzT;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id u19so15366291edx.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 07:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Aw2Oo2lgOBb0KSF+jfou9WUj66Alh2SRZQT4rloSEds=;
        b=guu+fjzT3LU/3OfhCzaXWnvC6lTqRoP7BXs2zd77fEJI1Z/c4Tb6/TaY/Rh5Tvv9vY
         f0WBYhM8GsrMMKI81wwNljJdgpjQSXkA5HsKGw5eC1PtNxdKBzsWDPNaJQXocdR1rwSs
         5DYquPsVNAfQw53ZKpLJyPUPbUNMIKaaIeaf+i92q9bnzLPDBF9wEeNN+Lf8X9fQtmCv
         1Ot8+iVfBc+O4RJc+slpwg61YMlP8wZlvR9T+AiDeHsafly5titFbsf0xAYBiuf/L17l
         GbQjfrRKbG7SqQSLdpGzzI3ioWaRmzxkSOOnQcbFxfimxU7hDdh4RhODYIeZJHrp1VN/
         Em6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Aw2Oo2lgOBb0KSF+jfou9WUj66Alh2SRZQT4rloSEds=;
        b=BYd3UNQE1KU4gS3O6dbue34VsADtEMU9uGYCnJZqiAdoAakOS2J6TDAWUfIH1pUJ36
         6k4hGVR+ezhCAL2dLAmbYFHeOs3q/qCYaC+ztdxoik8cwtIMMq06FbSNvqhY5LVEwsqR
         /0npUBV5Ev32waL7Jzxd4EawJezOVuiBNpE5CUy2kEJakTm6m9y3JQa34mlM15yUGCg/
         FsdcPChL6XaaOEXeNxjVYajEnAFVocLWYRO/28pGBwAh+yOIs+xlZi6OxYvqseFourv6
         pCDmxZgPB01UHvcvYtPrZ/Ny+oMpBekAEwvGQDpxy1tFPaTZijlH+bfN/33QH4PPuEaG
         PAJA==
X-Gm-Message-State: AOAM532wNoDoPRfycVRLdM/3csrj7LKbSY2z8h3OCkUqozYjnnThJNrj
	yYupOwWeM1RMarHpM1e8DqRPKCJ5nJ7+JjCWbYd7XA==
X-Google-Smtp-Source: ABdhPJxjWYD7TE5PDCutgvZtAvnD073agqGgLXc8MqI1T6sfGV1eMlrd4VWuhwPTXRzD/phVUiTJjJ1CwvHCfcHkCI0=
X-Received: by 2002:aa7:da53:: with SMTP id w19mr9483370eds.190.1606750440457;
 Mon, 30 Nov 2020 07:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20201118045633.47396-1-bruce.ashfield@gmail.com> <CAP71Wjzp=9QWJLvANLXw2p6YtbgbZbK6yx0sxHVU2zBKB7x1oA@mail.gmail.com>
In-Reply-To: <CAP71Wjzp=9QWJLvANLXw2p6YtbgbZbK6yx0sxHVU2zBKB7x1oA@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 30 Nov 2020 05:33:49 -1000
Message-ID: <CAOSpxdbEu_3ZQOS-YQCFr9Z64CaNuSjPP=YC1FU2nyXc8919CQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel: relocate copy of module.lds to module compilation task
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 29, 2020 at 9:38 PM Nicolas Dechesne
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

Is this the only patch you need to fix the 5.10+ kernel issue in dunfell?

In general I haven't been taking patches that claim to be for kernels
beyond 5.4, so I suspect there may be a handful of other patches you
might need.

Steve

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
