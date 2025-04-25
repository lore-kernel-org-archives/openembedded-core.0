Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B51EC369D7
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 15:02:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8628.1745593365638189900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 08:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IbKpN8/S;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3316543A2E;
	Fri, 25 Apr 2025 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745593363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c7zxHa5pmJs9AyS29cwBxpzp9mwvqeT8G6L9wkontjk=;
	b=IbKpN8/SMc3WmW04S44m0hk9wyTfxrs+j++KJJClVDkWryNWVWwEI92wA1WHn6o03p3gtY
	kZFMEqCPYv8o7xQaoR3UP2GTNjo9hPBYuCsEoP079IrI6r88rKH2DWSR9YCGsLWfwXD3vW
	JbAOoGTzka8gJJ1BkMKfdMg3zA3nUR4190b8UrpQea/nt4gb9TQ6BxtiLV6fgQ/95oMsIX
	khuQIEm+1c+0t0eWfiaHaKHWEqegZr4VGGeZD7TGNVM238DaNknHjmYZAtYTaWEtzuoiZv
	KTiYh6yFHXZFYXmWRPKP9i8/UWgvHW7x8xirESw6hdTC65N505w1chVv9Zm6sg==
Message-ID: <b422d462b12c51ac9f50eb0fe4f673ace665a29d.camel@bootlin.com>
Subject: Re: [OE-core][PATCH v2] send-error-report: improve debugging
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
Cc: thomas.perrot@bootlin.com, yocto@lists.yoctoproject.org
Date: Fri, 25 Apr 2025 17:02:42 +0200
In-Reply-To: <39feaeb4-a937-408d-9e2d-90d2460acbf9@gmail.com>
References: <20250418133504.932848-1-thomas.perrot@bootlin.com>
	 <39feaeb4-a937-408d-9e2d-90d2460acbf9@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-M18JSARLYjY/Ua5AqbFo"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomhepvfhhohhmrghsucfrvghrrhhothcuoehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvudeuhfelheefffelueefueeuhfevleefkeehvdfhfefhieetjeefvdehfefgtdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpuggvsghughhfrhgvshhpohhnshgvtghonhhtvghnthgvrdhrvggrugdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvgedtngdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepshhkrghnughighhrrghunhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtt
 hhopehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohephihotghtoheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 15:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215479


--=-M18JSARLYjY/Ua5AqbFo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, 2025-04-20 at 12:44 +0200, Gyorgy Sarvari via
lists.openembedded.org wrote:
> I noticed that this (or at least v1) was applied on master - would
> like
> to call some attention to a related discussion[1] in a neighboring
> list,
> and some patches[2][3][4] that followed it - at least [3] is a
> pre-requisite for this patch (error-report-web has hardcoded the
> version
> of the script to 0.3).
>=20
> [1]: https://lists.yoctoproject.org/g/yocto/message/65184
> [2]: https://lists.yoctoproject.org/g/yocto/message/65188
> [3]: https://lists.yoctoproject.org/g/yocto/message/65199
> [4]: https://lists.yoctoproject.org/g/yocto/message/65200
>=20

Can you revert the patch v1 and then apply patch v2, at least after
patch [3] has been applied to error-report-web?

Kind regards,
Thomas Perrot

> On 4/18/25 15:35, Thomas Perrot via lists.openembedded.org wrote:
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > - add a debug mode
> > - print the request and the response when an error occurs.
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> >=20
> > Changes in version 2:
> > - Drop the redundant checks
> >=20
> > scripts/send-error-report | 25 ++++++++++++++++++++-----
> > =C2=A01 file changed, 20 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/scripts/send-error-report b/scripts/send-error-report
> > index cfbcaa52cbc3..9ea7160f52c4 100755
> > --- a/scripts/send-error-report
> > +++ b/scripts/send-error-report
> > @@ -6,6 +6,7 @@
> > =C2=A0# Copyright (C) 2013 Intel Corporation
> > =C2=A0# Author: Andreea Proca <andreea.b.proca@intel.com>
> > =C2=A0# Author: Michael Wood <michael.g.wood@intel.com>
> > +# Author: Thomas Perrot <thomas.perrot@bootlin.com>
> > =C2=A0#
> > =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> > =C2=A0#
> > @@ -22,7 +23,7 @@ scripts_lib_path =3D
> > os.path.join(os.path.dirname(os.path.realpath(__file__)), 'li
> > =C2=A0sys.path.insert(0, scripts_lib_path)
> > =C2=A0import argparse_oe
> >=20
> > -version =3D "0.3"
> > +version =3D "0.4"
> >=20
> > =C2=A0log =3D logging.getLogger("send-error-report")
> > =C2=A0logging.basicConfig(format=3D'%(levelname)s: %(message)s')
> > @@ -140,14 +141,21 @@ def send_data(data, args):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 url =3D args.protocol+=
args.server+"/ClientPost/"
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 req =3D urllib.request.Request(url, data=3Ddat=
a, headers=3Dheaders)
> > +
> > +=C2=A0=C2=A0=C2=A0 log.debug(f"Request URL: {url}")
> > +=C2=A0=C2=A0=C2=A0 log.debug(f"Request Headers: {headers}")
> > +=C2=A0=C2=A0=C2=A0 log.debug(f"Request Data: {data.decode('utf-8')}")
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 try:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 response =3D urllib.re=
quest.urlopen(req)
> > =C2=A0=C2=A0=C2=A0=C2=A0 except urllib.error.HTTPError as e:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logging.error(str(e))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log.error(f"HTTP Error {e.c=
ode}: {e.reason}")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log.debug(f"Response Conten=
t: {e.read().decode('utf-8')}")
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sys.exit(1)
> >=20
> > -=C2=A0=C2=A0=C2=A0 print(response.read().decode('utf-8'))
> > -
> > +=C2=A0=C2=A0=C2=A0 log.debug(f"Response Status: {response.status}")
> > +=C2=A0=C2=A0=C2=A0 log.debug(f"Response Headers: {response.getheaders(=
)}")
> > +=C2=A0=C2=A0=C2=A0 log.info(response.read().decode('utf-8'))
> >=20
> > =C2=A0if __name__ =3D=3D '__main__':
> > =C2=A0=C2=A0=C2=A0=C2=A0 arg_parse =3D argparse_oe.ArgumentParser(descr=
iption=3D"This
> > scripts will send an error report to your specified error-report-
> > web server.")
> > @@ -195,13 +203,20 @@ if __name__ =3D=3D '__main__':
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dest=3D"protocol",
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 action=3D"store_const", const=3D"http://",
> > default=3D"https://")
> >=20
> > -
> > +=C2=A0=C2=A0=C2=A0 arg_parse.add_argument("-d",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "--debug",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 help=3D"Enable debug mode to print
> > request/response details",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 action=3D"store_true")
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 args =3D arg_parse.parse_args()
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (args.json =3D=3D False):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print("Preparing to se=
nd errors to: "+args.server)
> >=20
> > +=C2=A0=C2=A0=C2=A0 # Enable debugging if requested
> > +=C2=A0=C2=A0=C2=A0 if args.debug:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log.setLevel(logging.DEBUG)
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 data =3D prepare_data(args)
> > =C2=A0=C2=A0=C2=A0=C2=A0 send_data(data, args)
> >=20
> > --
> > 2.49.0
> >=20
> >=20
> >=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215153):
> https://lists.openembedded.org/g/openembedded-core/message/215153
> Mute This Topic: https://lists.openembedded.org/mt/112330994/5443093
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


--=-M18JSARLYjY/Ua5AqbFo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmgLpBIACgkQn8ALBXH+
Cu1dawv+JD5oMKeLm6PFG1MQ+++pTgy0l8/VQKheNeKmTl39/SS2MCOfvI2Y0mDW
EMHwQHIbHEvhaQaV4PihSyAArB7GoQSLDZKOw/NiLfvzYL5jjsPWrvx39cU28hR5
xICM0PXwafqQIFIIsLiiALNb8eeGsL8GibMddTmxg9ekmWC7cWnzzWEA/ipKwai1
Pe09Bhjq1gMZfp2Dab85TFEqpfe7M/MnbmxdQ2oxfc97/2O4gqYBuy+6nbJG1PsL
qFRq6fo+JiwXmbK6Bk78KE6n9JcRwAGRcPktB7gwfx6bpMrIFxcpB+fydpLgktvS
NIsRBWHBNoJ7sWjhhKBb+QRw6YKmvITxyHvGEr7+HdX40QhpYLldPmzTH4p61ta1
3nofPV8JThPoMLiqdY+xZN50561A5L73gBroJcihYpfRoxpweCEvXZqLz+5H1DSf
PVl3E81pxGw/uK7DjdreG8dv3Yhawi6I8ua4FgIbJJCYBWX+H6h1je5mX/gbDRb3
tOfJx9SS
=vwkm
-----END PGP SIGNATURE-----

--=-M18JSARLYjY/Ua5AqbFo--

