Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web11.2239.1585246676239388498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 11:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XTl1i0de;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id m18so2494953uap.9
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 11:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZrrAfDxu4s8u9eydiTQeXZ9pG69eXZp1iFNpgX7rhIM=;
        b=XTl1i0deeKO6IYl1Pv4ElrD8PWRN/O8h+voa0Ye5bee1ji87FiTmPnjFDFn6qB6bWS
         /i3JiIwsYtD4mby6+LDbZ+qlrgXHJb0OLAH64Qrk8qu7JpmIE2nQWeYIKfO0hO1Apb+7
         lFb0i3WiC4DkB3Y+DTTKpRVTFOAY9Zmpg42TUFfQ6OrYigByhjD9t8jC8awt/cvOC1UM
         vspBldybDpqF2brZF/PbGcrbMIN2pzc19Obz1DgNTmyolq5mcSP5hg2CIjQnJcK/Lfdx
         8ji43oYrc7HgFeVA7fSInMLOw3eGiPi3elNtjpyJKiPRygQ9zlnf9x3U19cT4uMciZtv
         otBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZrrAfDxu4s8u9eydiTQeXZ9pG69eXZp1iFNpgX7rhIM=;
        b=No2P3nboDcTUgkUYs/2fNlFs9nfPlTtXxv88xQQcHlFqVxPrxOg8ZPhBoARWKAmnlP
         CXcsTSjdWnLEEmGFtGeUE/GFD/AfyWn3Fi0eH3EZPsZwI5EJjSLCxiH7W/jx/JtjE4fJ
         Vf9m7PNbCgz+oDNYXs8+AN/CZnAkOWNGOokJL8uL3EMg3h/lfGy4oskjYGvEc4PIBrOO
         AMGQGBZUM3+0G6ipjPOWilT6OKpwxt8OTcMU8p2g4UHdwh2ImMiNfNcTCrI2hg8HXPvA
         I9Tb4cvCrKioZBVLFoBbHWsqEc/Lyp/bDPeMqYfyZXY2Gt3HFtFgdUUZG/JpxhLP+hdo
         VmJQ==
X-Gm-Message-State: ANhLgQ0uA661c6sLp82eeEnoXxEuxm22b9Djdkl4xqVfp+9sULNPOb5D
	UcCZfuvSRctr6gIpNnhqOrWaRGWA9vSjZsDzg7E=
X-Google-Smtp-Source: ADFU+vuFqV3MDI5FxQvn9HYsv7i8oQEqOtRqhRhUGNgB2qCJSGv3JlL78B5PqkZfmN7Tygm48eqSIItR1ZLIO0d25YY=
X-Received: by 2002:ab0:1869:: with SMTP id j41mr7617262uag.99.1585246675264;
 Thu, 26 Mar 2020 11:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200326085426.117209-1-alex.kiernan@gmail.com>
 <20200326085426.117209-7-alex.kiernan@gmail.com> <20200326145614.GA26693@localhost>
 <CAO5Uq5Qz2EpUZUFGfRy-6BTrLZuK9sm7bTarmkCwZM9RA5eysw@mail.gmail.com> <20200326173258.GA31846@localhost>
In-Reply-To: <20200326173258.GA31846@localhost>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 26 Mar 2020 11:17:49 -0700
Message-ID: <CAJ86T=UWhfdQ9-F8QfbbHHW9r8BYGUgQhWjj_1Q6J4m1g482tg@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH 06/13] systemd: Add PACKAGECONFIG for sysvinit
To: Adrian Bunk <bunk@stusta.de>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 10:33 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Mar 26, 2020 at 03:54:55PM +0000, Alex Kiernan wrote:
> > On Thu, Mar 26, 2020 at 2:56 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > On Thu, Mar 26, 2020 at 08:54:19AM +0000, Alex Kiernan wrote:
> > > > Add sysvinit PACKAGECONFIG which is bound to DISTRO_FEATURES, this
> > > > then disables all sysvinit handling in systemd if it isn't present.
> > > >
> > > > Consolidate sysvinit handling so that when it's disabled we exclude all
> > > > sysvinit features.
> > > >...
> > >
> > > What exactly are "sysvinit handling" and "sysvinit features"?
> > >
> > > It seems to disable systemd-sysv-generator, and this is wrong.
> >
> > Like this it sets HAVE_SYSV_COMPAT which does disable
> > systemd-sysv-generator, but if sysvinit is disabled completely in the
> > distro, I'm missing why that's a bad thing?
> >
> > Or have I misunderstood what sysvinit in DISTRO_FEATURES is meant to
> > mean?
>
> sysvinit in DISTRO_FEATURES means that sysvinit is supported as init system.
>
> > I'd taken in that sysvinit not present in DISTRO_FEATURES meant
> > that packages should install systemd units, not rely on init scripts.
>
> Packages that do provide both are not the relevant ones.
>
> For packages that can provide both, if the init script gets installed
> it is ignored by systemd when there is also a systemd unit.

True but we don't usually reply on that. If sysvinit is not present in
DISTRO_FEATURES and the package includes a systemd service file then
any init scripts will be forcefully removed (see
rm_sysvinit_initddir() in systemd.bbclass).

The behaviour of rm_sysvinit_initddir() seems to suggest that if you
don't have sysvinit in DISTRO_FEATURES you shouldn't expect any
sysvinit related functionality to work... so configuring it out of
systemd in that case seems OK.

> systemd-sysv-generator provides support for packages that do not
> (yet) provide a systemd unit, only an init script.
>
> Disabling this could save a few bytes on a small system when no
> installed package needs it, but this is not in any way related
> to sysvinit in DISTRO_FEATURES.
>
> > Alex Kiernan
>
> cu
> Adrian
> 
