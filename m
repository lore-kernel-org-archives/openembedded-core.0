Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.25296.1608480575273491512
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 08:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OC6sah9q;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id u16so3391730qvl.7
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 08:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QA+P1+cBMC6NuhwzTkjzqYM8JVx2Wd9ZSD2F8rYzr4g=;
        b=OC6sah9qfsQFFG2Cv6CvOMNEVpo8ONT88YJxPyQEszfAaNDJgi2VGM3UUEKcsDA23S
         RCvypitH9pop8wA8oA6Xa2hNpjb8P2j4ImclU2pMZaHD+m79JeCc5wdC//P4CBAB6JNd
         mAcnwvJw70694LfpTtRikcISzB8yj92xL/pluHof/SfS05RHczv7Xz/eRTUTWvACUEQV
         VxbI58HNOQcMXywbamRdZTx5d0GBxBzDIFhbPwjP1a8RVKSdExDAfP2ltReHynJ4KQbk
         t430YV9ROCWMT8ha1jASqZM/028YfNuVVQLWQFpCuIi/7PW6hueYqYsKbCIg+TzEFdrw
         fhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QA+P1+cBMC6NuhwzTkjzqYM8JVx2Wd9ZSD2F8rYzr4g=;
        b=B/hycpitXgJAx911Q1eXKq/wjzSag9f4Bsn8F8NT1JtYiYywTXUhtSyaH1iaDcb3pU
         JXK30GBgjohUsUp5X8sLBQnWuIUPIi/WAsZR2Sj8BC/wVZ//oUTtBRLs3sPxLURyHciW
         nKGadRpDvtxGu6DILnWifj+4N0LILOONwdrNFKo8NSRXEDgSgCUEKbTJDmH2JRgkTj/4
         MPh2q6dFo8MWu72+dmK7h+0ZKCjVxzdmeNMLoOZ7OpMlvmPT2/BBXR4elbrnBK/CnDsN
         WI77UCnna5MJMAloNr4zct+VOaQkoxpl05aQnR/d96cON6tH2rZ1m/Ic6J/4EB2QNtK2
         FKUA==
X-Gm-Message-State: AOAM533KLYSf1lppQgvV8pyDXmeMYntFB9RnbHWgGLyqx1QXaXsk00qW
	cUBvGDOtLGxAewYyGUXtYSiiDYBBVsnx3t8Ld2I=
X-Google-Smtp-Source: ABdhPJx/hYtgtHde1SHDdcIZ2zy28c5bajncbOtGZOeD7tNjbdu1GUNuTT4kqVnFDILsHL/4ivq3Nzu6rrMT+P+9kNo=
X-Received: by 2002:ad4:4431:: with SMTP id e17mr13593104qvt.21.1608480574339;
 Sun, 20 Dec 2020 08:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20201217192738.14311-1-tanuk@iki.fi> <CAMKF1soQmWKFmpaEkcE7E_as0iKDS01e8mwTiGLKYSSQ3_x5bQ@mail.gmail.com>
 <CAMKF1spAAi=rDLYNHQWk3XpsyCv9=qDxJgG0d7nwrpaxSYM6gQ@mail.gmail.com> <d09a75fc25bc9d36c6f9227cc94f4e58d7f985fd.camel@iki.fi>
In-Reply-To: <d09a75fc25bc9d36c6f9227cc94f4e58d7f985fd.camel@iki.fi>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 20 Dec 2020 08:09:08 -0800
Message-ID: <CAMKF1soBt5ifPhNj0h_DE+NY7jVTz4C3Ch13A=xEY-KZ=s4XtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] pulseaudio: Autotools to Meson
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 20, 2020 at 6:26 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
>
> On Sat, 2020-12-19 at 12:36 -0800, Khem Raj wrote:
> > On Sat, Dec 19, 2020 at 9:24 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > On Thu, Dec 17, 2020 at 11:28 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > The PulseAudio project plans to drop Autotools support in 15.0, so let's
> > > > switch to Meson. The first patch removes OE_LT_RPATH_ALLOW, which is
> > > > some old cruft that sounds like it has something to do Libtool, so it's
> > > > perhaps relevant for the goal of dropping Autotools. The next two
> > > > patches disable features that aren't available with Meson. The last
> > > > patch does the build system switch.
> > > >
> > > > Tanu Kaskinen (4):
> > > >   pulseaudio: Remove OE_LT_RPATH_ALLOW
> > > >   pulseaudio: disable EsounD support
> > > >   pulseaudio: disable GConf support
> > > >   pulseaudio: switch build system from Autotools to Meson
> > >
> > > I am seeing build failures with this patch series while using clang
> > > for compiler see.
> > >
> > > https://errors.yoctoproject.org/Errors/Details/539474/
> > >
> >
> > It turns out that new meson checks are a bit different and if
> > -Qunused-arguments is used with clang then the test for neon passes
> > because its a simple compile time check in meson, So a workaround that
> > I have done is to remove using -Qunused-arguments on clang
> > cmdline and then it works ok.
>
> Ok, so the Neon check in Meson is somehow too lax if it passes with
> -Qunused-arguments. Thanks for the initial debugging! I can look into
> the issue, but I can't promise to do it quickly. I see these patches
> are in master already - should the last patch be reverted for now? Or
> can your workaround be applied to master (or meta-clang, if that's
> where clang workarounds belong)?
>

I think its ok, I have added the relevant workaround in meta-clang for
now. there was another
issue I ran into non x86 builds with clang, which I have sent a patch
for. Please review it and see
if its worth upstreaming into PA and help it upstream if you can.

> --
> Tanu
>
