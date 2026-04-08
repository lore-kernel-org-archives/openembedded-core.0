Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5AAFD5F9E
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 09:18:01 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102313.1775639874757825405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 02:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=lQHvjwLl;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=iFzEibHR;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DD4D0140008F;
	Wed,  8 Apr 2026 05:17:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 08 Apr 2026 05:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775639873; x=1775726273; bh=t4UMziXJlS
	LRHO4aIKKG4HBCyVY06QOmQOPXq5GDN5Q=; b=lQHvjwLlnPusdANGHusghYlLPQ
	Pzr3vAdGmJgGd2vxK60SwHwgGks4R78ZqaDJslNq9MoiZ7d8FBFOjBbqd32jFPwc
	HmBiP6ut93KC132cFZepJP029ooxCcquDNdNVvQynvAcj5ud4vH4apDvW2hMCwIs
	toaJ3sHaNVYTW4GM7zEv51/q80EE6vtFjDysyFD1q2qDoEUCn69b7TCN8dVIi77R
	TSPcnV1v3/cpWq/DVTLphcmV9WGXX2JnTCK4m/9/dhOfJe5beaixRMQh36nbjSd2
	PXFi5vv9EyQU2Tyx6aTTvK+DVkkchklH8/ot06mKZXCGdQxJBGd0R0uImyEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775639873; x=1775726273; bh=t4UMziXJlSLRHO4aIKKG4HBCyVY06QOmQOP
	Xq5GDN5Q=; b=iFzEibHRCr89xnsE7w9NLNlHYAu6L3vRhqHJ+DDNhU3huGlVzo7
	hhGsZguGml+D62eEOhhEPdTuKBbjgITqiL5D7cDUJmvSzCfz8lT98rqG0DJCnnm2
	2vstO6VCV4hFQJPXxBWGcIBIpi+n+tNOrxVL/65GKgi0OYgTkf3Qb/Il7udJh/Xw
	p3s6DKNSGoi08BrHPFh2fd8PmPVet3BDfzDYgl2MLCv7ZPMKYPX3nT8MBKLUtzmt
	OnSW4T1k9LgNURHwEOzDqjBOFzflXYx03lO7+4J173iajL9mquww/EvtIAH0GpKU
	mYM92ftgnrJdRccRTGRE/aX7052UDMMOHGg==
X-ME-Sender: <xms:QR3WaWNj0moJogLYW9swKIisXX4ZenrPERmh97wioRW5awxGxd90nQ>
    <xme:QR3Wab8DUl1e_-PJe1OaCZ0ytH_mSm9K9SBkM7I6t1ion-97w3osCI92Qy22ERYOY
    AcAT0CnFujTJFYTEX3mUO6Wye5mjCSdK_1Nu9U19RygyOdBwXFSHA>
X-ME-Received: <xmr:QR3WaSRAR-8hkMhAPE7STWWH4LHjZXK0OJO9ulVyRjTr3oXn8YBZPFRB17iyAMkpwsDJL5H1Ez4bIjslr9vcKDzC4_O5izHdjzYiLDs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvfedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    etfeetueelhfevveevvddtveegtefgfeekveduueduteeifeekheffueeljeefvdenucff
    ohhmrghinhepuhgrphhiqdhgrhhouhhprdhorhhgpdifkhhsrdhinhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgv
    rhdruggvvhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepphgrvhgvlheslhhovggslhdrtgiipdhrtghpthhtohepohhpvghnvghmsggvuggu
    vgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpth
    htohepmhhitghhvghllhgvrdhlihhnthholedusehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:QR3WaVm1RhchL8qPvnPZThcxyZ61514MlBQFu_nAzhvXMvJFarIvyg>
    <xmx:QR3WaaRiVnloS0qoY1yhRAvmRLg9tNTYsRh9S2wAzP7Qtp_PvQIg3w>
    <xmx:QR3WabOlLbxCuG-fgUmoaiScSgObJFYsjFFVurhG3PQfn-IeELm0iQ>
    <xmx:QR3WabVyPaW6rBqqxpnDvAKiTHXPXM24FRV2VnRlPuZTGR4XhFcWag>
    <xmx:QR3WaTpElPDy_J3hrGgDH5dfwp9UkGPQ6C0m28ejEmKIcG2-VR285lb8>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Apr 2026 05:17:52 -0400 (EDT)
Message-ID: <17687058c3431639fc23a772f4c9c959a2707964.camel@pbarker.dev>
Subject: Re: [OE-core] [RFC PATCH] uki.bbclass: add multi-profile UKI support
From: Paul Barker <paul@pbarker.dev>
To: Pavel =?ISO-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc: openembedded-core@lists.openembedded.org, Michelle Lin
	 <michelle.linto91@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Wed, 08 Apr 2026 10:17:49 +0100
In-Reply-To: <ac9y4JKHSQEMsNo8@alena.lan>
References: <20260402202616.3177283-1-pavel@loebl.cz>
	 <96d932f72af422a6509ac9e6e92a979b75f2f5e7.camel@pbarker.dev>
	 <ac9y4JKHSQEMsNo8@alena.lan>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CbcADEB0oYWpqiFx7lkx"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 09:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234819


--=-CbcADEB0oYWpqiFx7lkx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-04-03 at 10:38 +0200, Pavel L=C3=B6bl wrote:
> On Fri, Apr 03, 2026 at 08:47:17AM +0100, Paul Barker wrote:
> > On Thu, 2026-04-02 at 22:25 +0200, Pavel L=C3=B6bl wrote:
> > > Allow generating multi-profile UKI [1]. This is quite usefull for
> > > dual slot A/B deploymets with secureboot active.
> > >=20
> > > Currently only .cmdline sections are supported. But can be easily
> > > extended with others.
> > >=20
> > > [1] https://uapi-group.org/specifications/specs/unified_kernel_image/=
#multi-profile-ukis
> > >=20
> > > Signed-off-by: Pavel L=C3=B6bl <pavel@loebl.cz>
> > > ---
> > >  meta/classes-recipe/uki.bbclass | 48 +++++++++++++++++++++++++++++--=
--
> > >  1 file changed, 43 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uk=
i.bbclass
> > > index d16f3c95561e..c2d21304c793 100644
> > > --- a/meta/classes-recipe/uki.bbclass
> > > +++ b/meta/classes-recipe/uki.bbclass
> > > @@ -59,6 +59,17 @@
> > >  #   - see efi-uki-bootdisk.wks.in how to create ESP partition which =
hosts systemd-boot,
> > >  #     config file(s) for systemd-boot and the UKI binaries.
> > >  #
> > > +#   - to generate multi-profile UKI (currently only supports .cmdlin=
e section)
> > > +#
> > > +#     UKI_PROFILE[0] =3D "TITLE=3DRecovery boot"
> > > +#     UKI_PROFILE_CMDLINE[0] =3D "rootwait recovery"
> > > +#
> > > +#     UKI_PROFILE[1] =3D "TITLE=3DBoot from slot A"
> > > +#     UKI_PROFILE_CMDLINE[1] =3D "rootwait root=3DLABEL=3Droot_a"
> > > +#
> > > +#     UKI_PROFILE[2] =3D "TITLE=3DBoot from slot B"
> > > +#     UKI_PROFILE_CMDLINE[2] =3D "rootwait root=3DLABEL=3Droot_b"
> > > +#
> >=20
> > Hi Pavel, thanks for the RFC.
> >=20
> > To make things easier to debug and to follow existing conventions, I'd
> > suggest:
> >=20
> >     UKI_PROFILES =3D "slot_a slot_b recovery"
> >=20
> >     UKI_PROFILES[recovery] =3D "TITLE=3DRecovery boot"
> >     UKI_PROFILE_CMDLINE[recovery] =3D "rootwait recovery"
> >=20
> >     UKI_PROFILES[slot_a] =3D "TITLE=3DBoot from slot A"
> >     UKI_PROFILE_CMDLINE[slot_a] =3D "rootwait root=3DLABEL=3Droot_a"
> >=20
> >     UKI_PROFILES[slot_b] =3D "TITLE=3DBoot from slot B"
> >     UKI_PROFILE_CMDLINE[slot_b] =3D "rootwait root=3DLABEL=3Droot_b"
> >=20
> Hi Paul,
>=20
> the idea was to use the same indexes as firmware will be passing to
> stub. As multi-profile UKI only supports numerical ones (actually
> it's just the order in which they appear in PE32 binary).
>=20
> In your example user would have to pass @0 from firmware to select
> slot_a, @1 for slot_b and @2 for recovery.
>=20
> I have no issues with that, just wanted to make that clear.

Ah, this makes sense. I agree that keeping the same indexes as used
during boot is the right design. We want to avoid trying to figure out
how many indexes to expect by looping until we see an error though. So,
perhaps:

    UKI_NUM_PROFILES =3D "3"
    UKI_PROFILE[0] =3D ...
    UKI_PROFILE_CMDLINE[0] =3D ...
    ...
    UKI_PROFILE[2] =3D ...
    UKI_PROFILE_CMDLINE[2] =3D ...

How does that look?

Thanks,

--=20
Paul Barker


--=-CbcADEB0oYWpqiFx7lkx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCadYdPREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bv9PAP94zKbo/60/T6sNMVYJVh2VIOHLlwPEBix9
J45VX/VAUgD/RXEMkTUlcqCsLll7H5xV1tyrxoITvosGsNDYgqYj/gY=
=6aLA
-----END PGP SIGNATURE-----

--=-CbcADEB0oYWpqiFx7lkx--

