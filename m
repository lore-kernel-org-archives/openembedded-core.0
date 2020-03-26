Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.952.1585243984982803283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 10:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=PqAtfMiS;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rbqv=5l=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48pBs85lF5z3Q;
	Thu, 26 Mar 2020 18:33:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585243981;
	bh=9Yd4yJlOztNwt70BfOdagvh5wb9m9T2G/dNAdgIElwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PqAtfMiSntjG0cuWBfnuGTCaYl1DgYNy64dE3FX+DXzQJOfM90l7JqNnfZmCqeMXN
	 iZ+5dPzt51nfzHHfOzTLGodNdfZUNocDzTMRdbkAbQrbDsKGd/saziSS/pkvEkOBHg
	 TESz/nO9ZO/QUTESs6+iz2nJkzKnyqvQHLBooOm+O22ymxindrJHiKQYk1PM04XJ1T
	 nWgKMVKfqDl44gNH/fIzUZ7rWzT8konq4k1Vvz4iuNzRZkWs5HCoa02+qoBtumRRcP
	 7ikpmDhoEkSSzTJU2jZfZGG5j1os38Z1TESNgOSGpu1YA0mavhQJQG8JMigmwlnADE
	 mEA3sFK72yVmWJVL+fnva9iDh5inPBu+uStfu1Adqp0XOlLwSLjAUtKRBYEDvQqBZ5
	 xECtlnYqmX4pMPItKx5/BJ0lpIUnTbWmxNi/S2KAOl4zYuK0ck2WiXi/NA2axl9e3D
	 s7H7Pf9DG4EXwt1VbjMh8347VpVA4HBqGf6CaxgE9jNP97/2j33PtoBcjN/38oRkRK
	 1NpGs9Bf3oI8YsgYOIFcqaBTJ7fTLga35mmj/uThtPTwx7mSndtv5f2y1UxQw50Xrq
	 to7Aec4DvkTDvlzjtRaxA2vLA5LgafrIBJuPyr6ZmF8iKRRqbpdcusKchkQCYta2il
	 BQLVOyFRX+ferdUm7Bn6EYm0=
Date: Thu, 26 Mar 2020 19:32:58 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][RFC PATCH 06/13] systemd: Add PACKAGECONFIG for sysvinit
Message-ID: <20200326173258.GA31846@localhost>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>
 <20200326085426.117209-7-alex.kiernan@gmail.com>
 <20200326145614.GA26693@localhost>
 <CAO5Uq5Qz2EpUZUFGfRy-6BTrLZuK9sm7bTarmkCwZM9RA5eysw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5Qz2EpUZUFGfRy-6BTrLZuK9sm7bTarmkCwZM9RA5eysw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 26, 2020 at 03:54:55PM +0000, Alex Kiernan wrote:
> On Thu, Mar 26, 2020 at 2:56 PM Adrian Bunk <bunk@stusta.de> wrote:
> > On Thu, Mar 26, 2020 at 08:54:19AM +0000, Alex Kiernan wrote:
> > > Add sysvinit PACKAGECONFIG which is bound to DISTRO_FEATURES, this
> > > then disables all sysvinit handling in systemd if it isn't present.
> > >
> > > Consolidate sysvinit handling so that when it's disabled we exclude all
> > > sysvinit features.
> > >...
> >
> > What exactly are "sysvinit handling" and "sysvinit features"?
> >
> > It seems to disable systemd-sysv-generator, and this is wrong.
> 
> Like this it sets HAVE_SYSV_COMPAT which does disable
> systemd-sysv-generator, but if sysvinit is disabled completely in the
> distro, I'm missing why that's a bad thing?
> 
> Or have I misunderstood what sysvinit in DISTRO_FEATURES is meant to
> mean?

sysvinit in DISTRO_FEATURES means that sysvinit is supported as init system.

> I'd taken in that sysvinit not present in DISTRO_FEATURES meant
> that packages should install systemd units, not rely on init scripts.

Packages that do provide both are not the relevant ones.

For packages that can provide both, if the init script gets installed
it is ignored by systemd when there is also a systemd unit.

systemd-sysv-generator provides support for packages that do not
(yet) provide a systemd unit, only an init script.

Disabling this could save a few bytes on a small system when no 
installed package needs it, but this is not in any way related
to sysvinit in DISTRO_FEATURES.

> Alex Kiernan

cu
Adrian
