Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738C4C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:03:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.11089.1744981393295752613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 06:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GcwLjvRC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0A5643A08;
	Fri, 18 Apr 2025 13:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744981391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jf4s4pPxNVhbzgYnth8Nkt+5Gp7Fwi0zkROmuJPAwu8=;
	b=GcwLjvRCXhpfmPsKEiVqC+oguNCkcbYfU9SBAEUMxOT84LZEei2IKRQsT3+6UVAjzcQywq
	MRsoHuheMeasCSXCz0BQCorInNvV8wZjBohraB9XUPeJWN1NKGQLG92Wzf+LIsZN+qWQ3K
	yesSP5zNktYfqa1UmBUlZSI3Jv6uwglLr64ete79jMk3C9azxwER1r9jGfYw/z5sh+//TM
	xw1FZ6imBS7B8RnxCfUR8Axc9xQV+NGdg0bGniW6MwtYuMF01Z783p0o6CXNAp7q7ZaSIN
	NdMsc8WZ3aD4nB50aTO5rgbqIOR6E72FVKjvDLjpx7WNfSWbFxuLWzc4KNbb4w==
Message-ID: <139fe0ffb2208aee9fb03f8ca1ff3f78c677a27f.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] send-error-report: improve debugging
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
Cc: thomas.perrot@bootlin.com
Date: Fri, 18 Apr 2025 15:03:10 +0200
In-Reply-To: <3a3e69de-3714-4810-b9b6-326d44893431@cherry.de>
References: <20250416100149.274800-1-thomas.perrot@bootlin.com>
	 <3a3e69de-3714-4810-b9b6-326d44893431@cherry.de>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-OzZkiZZn8N1htDro9Q21"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomhepvfhhohhmrghsucfrvghrrhhothcuoehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgeevvdevtddvueegkeeiieehveettdegiefgtefhueduleegtdehheehgfeghfenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdguvggsuhhgfhhrvghsphhonhhsvggtohhnthgvnhhtvgdrrhgvrggupdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvdegtdgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvrhhro
 hhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 13:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215130


--=-OzZkiZZn8N1htDro9Q21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Quentin,

On Fri, 2025-04-18 at 13:27 +0200, Quentin Schulz via
lists.openembedded.org wrote:
> Hi Thomas,
>=20
> On 4/16/25 12:01 PM, Thomas Perrot via lists.openembedded.org wrote:
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > - add a debug mode
> > - print the request and the response when an error occurs.
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0 scripts/send-error-report | 28 ++++++++++++++++++++++++----
> > =C2=A0 1 file changed, 24 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/scripts/send-error-report b/scripts/send-error-report
> > index cfbcaa52cbc3..cdc1dfc5613a 100755
> > --- a/scripts/send-error-report
> > +++ b/scripts/send-error-report
> > @@ -6,6 +6,7 @@
> > =C2=A0 # Copyright (C) 2013 Intel Corporation
> > =C2=A0 # Author: Andreea Proca <andreea.b.proca@intel.com>
> > =C2=A0 # Author: Michael Wood <michael.g.wood@intel.com>
> > +# Author: Thomas Perrot <thomas.perrot@bootlin.com>
> > =C2=A0 #
> > =C2=A0 # SPDX-License-Identifier: GPL-2.0-only
> > =C2=A0 #
> > @@ -22,7 +23,7 @@ scripts_lib_path =3D
> > os.path.join(os.path.dirname(os.path.realpath(__file__)), 'li
> > =C2=A0 sys.path.insert(0, scripts_lib_path)
> > =C2=A0 import argparse_oe
> > =C2=A0=20
> > -version =3D "0.3"
> > +version =3D "0.4"
> > =C2=A0=20
> > =C2=A0 log =3D logging.getLogger("send-error-report")
> > =C2=A0 logging.basicConfig(format=3D'%(levelname)s: %(message)s')
> > @@ -140,13 +141,25 @@ def send_data(data, args):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 url =3D args.pro=
tocol+args.server+"/ClientPost/"
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req =3D urllib.request.Request(url, data=
=3Ddata, headers=3Dheaders)
> > +
> > +=C2=A0=C2=A0=C2=A0 if args.debug:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log.debug(f"Request URL: {u=
rl}")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log.debug(f"Request Headers=
: {headers}")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log.debug(f"Request Data: {=
data.decode('utf-8')}")
> > +
>=20
> Why only print log.debug if args.debug is set? Isn't that an
> unnecessary=20
> additional check considering the log.setLevel(logging.DEBUG) in main?

I agree that this check is redundant; it is due to a lack of attention.
Thank you, and I will send a revised version.

Kind regards,
Thomas

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 response =3D url=
lib.request.urlopen(req)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except urllib.error.HTTPError as e:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logging.error(str(e))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log.error(f"HTTP Error {e.c=
ode}: {e.reason}")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log.debug(f"Response Conten=
t: {e.read().decode('utf-8')}")
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sys.exit(1)
> > =C2=A0=20
> > -=C2=A0=C2=A0=C2=A0 print(response.read().decode('utf-8'))
> > +=C2=A0=C2=A0=C2=A0 if args.debug:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log.debug(f"Response Status=
: {response.status}")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log.debug(f"Response Header=
s: {response.getheaders()}")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log.debug(f"Response Conten=
t:
> > {response.read().decode('utf-8')}")
> > +=C2=A0=C2=A0=C2=A0 else:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print(response.read().decod=
e('utf-8'))
>=20
> Same remark here?
>=20
> It's also a bit odd that the same info is going to be in different
> log=20
> levels depending on whether debug was enabled or not.
>=20
> Cheers,
> Quentin
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215127):
> https://lists.openembedded.org/g/openembedded-core/message/215127
> Mute This Topic: https://lists.openembedded.org/mt/112292245/5443093
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> thomas.perrot@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-OzZkiZZn8N1htDro9Q21
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmgCTY4ACgkQn8ALBXH+
Cu1eagv9ESY53Vhgp28aTlB+urHJHxhP2adhuMI6PygO10Km2rrGXRBIaEjjwXDE
mOwfhaiHNRrIIOG8o/b/SCv1i8JJYcV5TEDvi83i3OLQyQ22sA8vpdB7cSyXii98
B3mBhMKAeRqWP8QCpNkmINnedPOSVDvCI+b/dzLlT3rzQWM0azc75SddBHrB/gHK
Zce8M1oaMg4rN+G6b6AwrzJGSIORuLOUgdPAd0KgbRQsdpBXv1HpEQMGoGjc+2I0
yl47frksxyHXk5yws2m3qWjyY7FHDkUZbBSiMGFA3VWpbgFU9atpnu4ysWIQjjrD
5kHytPGW1ILYw6oRv4fq8ld0yO+EjwNqM1WC0s/ZrHxbwvt4hdNc8ag+fPco9Qpk
AsrdGC+sKEG2ZHM2EH0duejRQYGD/WlpaHEhZW6Hhq+tyMh6mcW6CZ7OJbizAqYV
G6djKxPFdENbQXnLO3uB46gOYw59qaLjvQZN7HECFbLaaOwogF1GLAKLaHXMGVN1
X6f6e8xc
=LQUo
-----END PGP SIGNATURE-----

--=-OzZkiZZn8N1htDro9Q21--

