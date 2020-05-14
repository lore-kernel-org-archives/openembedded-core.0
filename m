Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.14566.1589469524030044309
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 08:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@stusta.de header.s=default header.b=rqPq2nRi;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=glre=64=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49NFYW6KC2z4X;
	Thu, 14 May 2020 17:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589469520;
	bh=UzRR+lBDbLoXqm+QRZSp0sY4FWmHGclC7OwWLTtiAqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqPq2nRiBLhdkjKK2QrFCP3PBND0wRu+5mx4+rLj4yLjjXLREVcXo3zy/I04oRMq7
	 SBswbegE9flts1/RRX4NTzdwfjgNAglZ0KmYpO7PMeeKIRRGGd6Sd7HAlC5cc/nzq9
	 JzaQPOER7Gq0Xc4n0xk+yzjf4y0gG4ZfD6izC5X37xsjxa/aI/4jg6+aPJ2PQ7ifkj
	 lESqF3S2lo31I5ymh3pVVEsUWJbFMfLCWbPZGqfWVEE39srCGN3DvK9zy/nPVuQF8r
	 OXhVeAJl0CNXz1fsoFr86hsBY3hkqlnYKc+cdNl3E2HKsN7dt7iXfEy0z89bKHULuw
	 QKxALNRQ9izb6FOmBThFioqwlu6xqBCVOfmYGIdJMtnmbow6Yo8zdyH/hWHUcqfQUF
	 zK2UA3JIqOMtmlZrRWC0Jx8I4owKw+Zo9O7IctIi9Pj/vw0j+cpu495oHJgtHdaoGD
	 7hM4VGWpdoJJAMTW0tP2WmqjOPOBjUmzs7WSV3vOCwZ8u+BIAybyxCgI2ibl8Ycl8V
	 6mVNC/BMumuW6e0dv/pyEL73g/BMZ+eB48Oad8ya39EGzry7nx7BSasLFHWgJ4wq4l
	 PY453KzUXKhuro4dTMNX2pntgQDkMbRdC2vRhw3Y2Y7CfuIMkawNkDFyORZ5yIxDeZ
	 j5Tn+f6ksmWw8B0LOTpA8rqQ=
Date: Thu, 14 May 2020 18:18:38 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
Message-ID: <20200514151838.GB21399@localhost>
References: <20200511182812.441561-1-raj.khem@gmail.com>
 <20200511182812.441561-3-raj.khem@gmail.com>
 <20200514073821.GA16323@localhost>
 <CAMKF1sp0G_fz0Jjf5z4=qR5rTVK-miTABZjdkQn2FK2Ypm4v2g@mail.gmail.com>
 <20200514131606.GA17383@localhost>
 <CAMKF1sp_XsD7FSSogPWbYVNTV7uzOr9Ci15g3KgA7dbi7dkb_g@mail.gmail.com>
 <20200514140715.GA20289@localhost>
 <CAMKF1sqscoZndYWRRCb9J2bBKr7Js78dqu_a89rV_Nn9=O5yPg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqscoZndYWRRCb9J2bBKr7Js78dqu_a89rV_Nn9=O5yPg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 07:48:28AM -0700, Khem Raj wrote:
> On Thu, May 14, 2020 at 7:07 AM Adrian Bunk <bunk@stusta.de> wrote:
>=20
> > On Thu, May 14, 2020 at 06:56:07AM -0700, Khem Raj wrote:
> > > On Thu, May 14, 2020 at 6:16 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > > On Thu, May 14, 2020 at 05:47:48AM -0700, Khem Raj wrote:
> > > > > On Thu, May 14, 2020 at 12:38 AM Adrian Bunk <bunk@stusta.de> w=
rote:
> > > > > > On Mon, May 11, 2020 at 11:28:12AM -0700, Khem Raj wrote:
> > > > > > > This was added recently, but it seems be chewing more than =
what
> > it
> > > > > > > should and causes non glibc packages also depend on it.
> > > > > > >...
> > > > > >
> > > > > > Is this only valgrind (there is a upstream bug open for that)=
,
> > > > > > or were there more recipes with a problem?
> > > > >
> > > > > Just valgrind but problem can happen with static linking with n=
o
> > default
> > > > > libs in general
> > > >
> > > > No, it cannot.
> > > > The relevant part of "no default libs" is not linking with libc.
> > > >
> > > > Linking statically with libgcc and then providing own implementat=
ions
> > > > of all libc functions used by libgcc instead of linking with libc=
 is
> > > > not a common situation.
> > >
> > > Take a look At what=E2=80=99s going on in valgrind memcheck build i=
f you are
> > > interested perhaps you will find something which is not yet underst=
ood
> >
> > Memcheck links statically with libgcc, and it does not link with libc=
.
>=20
> Ok what happens when you link it with libc
>...

I do not even want to know how that explodes.

cu
Adrian
