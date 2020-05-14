Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.12912.1589465240868704491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 07:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@stusta.de header.s=default header.b=O0KO3B8u;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=glre=64=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49NCz9180Hz2k;
	Thu, 14 May 2020 16:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589465237;
	bh=0S+Q9Cb3yxfmUtJsV/fHnL/ledfn7g4e3fwf5i4wNxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0KO3B8uYgOc0r4PhyYCI6Xpc49LmLbom27COhS+r81wn8cuYnf6W/xRjJwtJyykY
	 ospFWja+i1ukIjQ9uR7iwugEt76ibsbVNn2dCC93LEXSZ6HuU9dhwQG6GkVq1lhzNc
	 A9Kedz84xLf7e7cPRKAd4x7RAFcCs0tPIlgMHkCohDQbMarEzeI/bpC3ro4sEbk7RN
	 16/aPfBTIZaVGVZHV6VlnDrJje1WmisOFtn6Q011v3uL8SeOpOBBxrZ59+reJCDhWM
	 RUYT7J9ZL2ZaL29TXqI6oVUUWXkQ3vx0HGIVylzSEf6BRXL91MQs54atzGr/S2zl9O
	 iqAAnK8560wP6qf2c8Fe8p1VtX4ZshFsoygtD0hSCjN09NShUY26fDeNCryLZTgd5r
	 Gg5O4vsmOdWZamTAjqE2WANg2i6nr5y8sLYdndgJZ64mctHIbepqoirQjdeLKc3HzV
	 Eevvf06zQxgC6InkagspUpcRRd65Kox2lsQj9WXWaVZOEI5yPP7vDmX2x21yscA4WB
	 loI9KwOrmdBnFh289xyT62xYZ7cbUHWJcfQy1hJ2CdrSM9KbTYYODExmSIlgq0niiv
	 ZF23yvaM/IEgK6sKIYn10EPz0oGYOIqZZLPfjTQD9xZ8yDeLMu4ofbcz6VUxNF+f2w
	 tQ+De7IWRnEVhCbjx+Cq9bB4=
Date: Thu, 14 May 2020 17:07:15 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
Message-ID: <20200514140715.GA20289@localhost>
References: <20200511182812.441561-1-raj.khem@gmail.com>
 <20200511182812.441561-3-raj.khem@gmail.com>
 <20200514073821.GA16323@localhost>
 <CAMKF1sp0G_fz0Jjf5z4=qR5rTVK-miTABZjdkQn2FK2Ypm4v2g@mail.gmail.com>
 <20200514131606.GA17383@localhost>
 <CAMKF1sp_XsD7FSSogPWbYVNTV7uzOr9Ci15g3KgA7dbi7dkb_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp_XsD7FSSogPWbYVNTV7uzOr9Ci15g3KgA7dbi7dkb_g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 06:56:07AM -0700, Khem Raj wrote:
> On Thu, May 14, 2020 at 6:16 AM Adrian Bunk <bunk@stusta.de> wrote:
>=20
> > On Thu, May 14, 2020 at 05:47:48AM -0700, Khem Raj wrote:
> > > On Thu, May 14, 2020 at 12:38 AM Adrian Bunk <bunk@stusta.de> wrote=
:
> > > > On Mon, May 11, 2020 at 11:28:12AM -0700, Khem Raj wrote:
> > > > > This was added recently, but it seems be chewing more than what=
 it
> > > > > should and causes non glibc packages also depend on it.
> > > > >...
> > > >
> > > > Is this only valgrind (there is a upstream bug open for that),
> > > > or were there more recipes with a problem?
> > >
> > > Just valgrind but problem can happen with static linking with no de=
fault
> > > libs in general
> >
> > No, it cannot.
> > The relevant part of "no default libs" is not linking with libc.
> >
> > Linking statically with libgcc and then providing own implementations
> > of all libc functions used by libgcc instead of linking with libc is
> > not a common situation.
>=20
> Take a look At what=E2=80=99s going on in valgrind memcheck build if yo=
u are
> interested perhaps you will find something which is not yet understood

Memcheck links statically with libgcc, and it does not link with libc.

This is not a general static linking problem,
normal userspace code links with libc (shared or static).

cu
Adrian
