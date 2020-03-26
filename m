Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.3555.1585249998518449517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 12:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=CuczG2uH;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rbqv=5l=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48pF4r4sC7z3Q;
	Thu, 26 Mar 2020 20:13:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585249996;
	bh=0R21ciunEjAhwTS2TKXdInQo91ICDufqx1HBhi2AhaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CuczG2uHAQbS6fwWhhmnLtrzyB/xFWlwdC4WaqK2iXbbho3wsSS0Qa6RPNaAP4NQf
	 dOR8TQeoECqwIFd7v3bNgMCC7zjIK8S/WtKdyavJ5KNB7SIVfIvNZcuqUamMPYdjTw
	 BYy00jZ8PUl935/ZG557AI/IGMRfa6tmSl5H+Cc0Ynk67x1YYD31dJFHgwmHVPuoQA
	 zlz/ynXCE3jdv/NVVIMWSEY+4z94IxnvWZDCgmrDb/GQrVr4Ye8ugutY1sRXJMqcdE
	 g5PMcadRLID9+FwvmKjyhGvkGgusqe7eizGnrAFADUXaC66CXHFiNM1L/psFuDGJ7z
	 H/12VXQUlx6BrBx7zTZE8a5IHxOtqx6nBPZWbcyfI54E4QOLElTOcgLz5eWbLXagK5
	 re/asDZ7FJZYwIwZ2gZRNYmt+71xh7t/EnKIk9zjZ8jRYtCbxofreDTtccvV2jXmmV
	 0bIafP6Ajar2mKVzhKpfTBMdoOdcC0tHttq69YxfMosJCgIRq2xC7kRvWoGv1tBzFl
	 7dGhY0IBcTAZNSPsRLUNKfwm7RgU2PkETMszSZKLNmqG263maEriYCcVpRRWGULF6b
	 W7Dk+WvCCPr9ttEHvkf4EKHmDosMd4ehyZu4d0qHZ6cNc+OzSyUeKlieFYBU4M+dfC
	 NuThsHfbJn6+cBc59PbEXidQ=
Date: Thu, 26 Mar 2020 21:13:15 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][RFC PATCH 06/13] systemd: Add PACKAGECONFIG for sysvinit
Message-ID: <20200326191315.GB5401@localhost>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>
 <20200326085426.117209-7-alex.kiernan@gmail.com>
 <20200326145614.GA26693@localhost>
 <CAO5Uq5Qz2EpUZUFGfRy-6BTrLZuK9sm7bTarmkCwZM9RA5eysw@mail.gmail.com>
 <20200326173258.GA31846@localhost>
 <CAO5Uq5R-zAdk06WRwKY3e_4ycNCHcy7oNGbWf8DOfLTY-SHLSw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5R-zAdk06WRwKY3e_4ycNCHcy7oNGbWf8DOfLTY-SHLSw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 26, 2020 at 06:08:52PM +0000, Alex Kiernan wrote:
> On Thu, Mar 26, 2020 at 5:33 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, Mar 26, 2020 at 03:54:55PM +0000, Alex Kiernan wrote:
> > > On Thu, Mar 26, 2020 at 2:56 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > On Thu, Mar 26, 2020 at 08:54:19AM +0000, Alex Kiernan wrote:
> > > > > Add sysvinit PACKAGECONFIG which is bound to DISTRO_FEATURES, this
> > > > > then disables all sysvinit handling in systemd if it isn't present.
> > > > >
> > > > > Consolidate sysvinit handling so that when it's disabled we exclude all
> > > > > sysvinit features.
> > > > >...
> > > >
> > > > What exactly are "sysvinit handling" and "sysvinit features"?
> > > >
> > > > It seems to disable systemd-sysv-generator, and this is wrong.
> > >
> > > Like this it sets HAVE_SYSV_COMPAT which does disable
> > > systemd-sysv-generator, but if sysvinit is disabled completely in the
> > > distro, I'm missing why that's a bad thing?
> > >
> > > Or have I misunderstood what sysvinit in DISTRO_FEATURES is meant to
> > > mean?
> >
> > sysvinit in DISTRO_FEATURES means that sysvinit is supported as init system.
> >
> > > I'd taken in that sysvinit not present in DISTRO_FEATURES meant
> > > that packages should install systemd units, not rely on init scripts.
> >
> > Packages that do provide both are not the relevant ones.
> >
> > For packages that can provide both, if the init script gets installed
> > it is ignored by systemd when there is also a systemd unit.
> >
> > systemd-sysv-generator provides support for packages that do not
> > (yet) provide a systemd unit, only an init script.
> >
> > Disabling this could save a few bytes on a small system when no
> > installed package needs it, but this is not in any way related
> > to sysvinit in DISTRO_FEATURES.
> 
> That's the piece of context I'm missing then... so whilst adding
> sysvinit as a PACKAGECONFIG is valid, it shouldn't be linked to
> DISTRO_FEATURES?

Yes, and it should stay enabled by default.

cu
Adrian
