Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5234AC76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 12:07:48 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.128101.1680696463163523368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 05:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@stwcx.xyz header.s=fm2 header.b=Eu+uMN1O;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.26, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 602D55C0212;
	Wed,  5 Apr 2023 08:07:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 05 Apr 2023 08:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680696462; x=1680782862; bh=fD
	AjVOmdrwI6XKgIxVCDN6wOCH0EIqmsFp0ZO8wyaD4=; b=Eu+uMN1Oqt7MlE0KKq
	HHcP/NnUhIKdDi3iOFDJ64vE8jtWM/YAeAMOWwbgBNfm7aEX38GVtyVB1zmTtiRg
	Iro+eP6/h2OlLRievSxbEiHFMFNGkTFizl9te8vjQAaOngpHdzPTHVvWjFLdU/Rh
	Uew4LBl2jYSVibY+wycQKA9cblffw5G//WyUhsVZYeQU6cSALJwu94N3mFMiNXNP
	cWizqNk5QOQ52tmndZZA7sGkhy3ZObZDqTFSQ8YE2iEOlfJE0YPfhNpiDidJJysI
	HXHadZF1qZPWGlM4gj204dBCAWFr394b/i1B1barqOJ5G9dq0m9svh6IfuOWT52j
	ibKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680696462; x=1680782862; bh=fDAjVOmdrwI6X
	KgIxVCDN6wOCH0EIqmsFp0ZO8wyaD4=; b=MI+Yeu2ZSHSJF3U6mJ5oEWsg1sVoV
	vCgag5s0sugMnX3+A4ibdqgSOHnmsQwkwZWBYiFEJIHwxA5HocvuTnPJIatn3zBJ
	+kah+OggYm9RdgSBvWZKN5FWSztHDGDGev5de9vMyqMrdaZIY8ItcbJMSRAuYLOU
	EBwfemtcBsnAbT4iDUV4PTjUhW1p28NrB2d2GfkSUlT2hH4qF2Ym/3KU2BUtLlWm
	2BA7u6gMsKPfMGW9z6kzn4Qa/GU0M8EsLMCl6S2u1We12X/TjcuBHnaEeJ+33oJK
	zCy1IVC9FgOOdWnxobvReq2PdTk5uezvZHcy6aW9Y08+/boe5r6Z2dafA==
X-ME-Sender: <xms:jmQtZFUCOZJmsplxxq-CnWZ0uB7C-du8XYRsmSr2Nl8qGB0zpeTSZw>
    <xme:jmQtZFl4sJ5lqoMHe6fI6g7dP8_etvr-gCTYhMoOQAtNNEDcH9tjQCmHx9OJ22QwS
    K-KMM2qLaVWwfS9Mb4>
X-ME-Received: <xmr:jmQtZBaMrzTwZQzROF8xHLoEkQRwuTuLZ8KZN_FHEUOvvMlUhpasxzDZvGyKuUDi2eMzeOM8CgBoBEvwM-5jqk2ApWYlsy78bHM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtgeffjeetffeuueefffehleef
    ledvueeuvddthefgffevheejfffgffeggeeuueenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgpdhophgvnhgsmhgtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:jmQtZIXVxaNskqH194vgCSivOojfj9XUPfa0oI1s_g8pxeZwZm30Lw>
    <xmx:jmQtZPkr8eENCy5ER2vMivhL9wyIxtRJteoEoqXX_9G6awdAeZigYw>
    <xmx:jmQtZFcLpNmK9DKeyO7X4ZEoGgQbQK8-QHvJ2AJTeHmKJ-svWxmCRw>
    <xmx:jmQtZOvVHeTxQebM_WnmWEkJXYw0hjfxybqJ9BI7qNl6nQg00UbIKw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 08:07:41 -0400 (EDT)
Date: Wed, 5 Apr 2023 07:07:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] perl-version: make PERL* assignments
 non-immediate
Message-ID: <ZC1kjBgtNwGDVami@heinlein.vulture-banana.ts.net>
References: <20230405003850.384813-1-patrick@stwcx.xyz>
 <1086f8d17f0b736421d1632ced95933622ce4553.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ASOzZUL9jhgm30t6"
Content-Disposition: inline
In-Reply-To: <1086f8d17f0b736421d1632ced95933622ce4553.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 12:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179734


--ASOzZUL9jhgm30t6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 09:24:24AM +0100, Richard Purdie wrote:
> On Tue, 2023-04-04 at 19:38 -0500, Patrick Williams wrote:
> > =20
> > -PERLVERSION :=3D "${@get_perl_version(d)}"
> > +PERLVERSION =3D "${@get_perl_version(d)}"
> >  PERLVERSION[vardepvalue] =3D ""
> > =20
> > =20
> > @@ -49,7 +49,7 @@ def get_perl_arch(d):
> >              return m.group(1)
> >      return None
> > =20
> > -PERLARCH :=3D "${@get_perl_arch(d)}"
> > +PERLARCH =3D "${@get_perl_arch(d)}"
> >  PERLARCH[vardepvalue] =3D ""
> > =20
>=20
> Most code seems to use ${@get_perl_version(d)} and ${@get_perl_arch(d)}
> directly so perhaps we should just remove the above instead and use
> these in meta-security too?

I submitted the change to meta-security[1] and changed the one in
openbmc/meta-phosphor[2] as well.

Do you want me to go ahead and delete these variables?  Is there any
documentation / change-log that I should update as well?

1. https://lore.kernel.org/yocto/20230405113726.469558-1-patrick@stwcx.xyz/=
T/#u
2. https://gerrit.openbmc.org/c/openbmc/openbmc/+/62164

--=20
Patrick Williams

--ASOzZUL9jhgm30t6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmQtZIoACgkQqwNHzC0A
wRmQhg//dg0rC8k4I0mB2vN4tuQuF7U9AKfW31EuM468/95jAqII4gwauDvVWS1D
qzFxJJnIyekWycdeZUHusE+L66Zl0btWq7MEt0isViM53dGYVuBrIS5xPhia7N/1
i9LKt5zWlSulq7qh90uAkRXN+09TSAHuSEdWlUZDnAwpWBgq+zFJVzT67vJXCcgt
OZnRjYTNBcpXoQCTWYRNDczhxyBkuAnvXyeMx35aDuzcYTwIadSVcarJ19MqtOCc
JELwRiCPrIIQOa2B2Uj7Y3Cw+8U/PVoqC27zY6tt04ljVOpmBgc9qZQSwGz8i6CP
cGWGbbKi4EZG4qv6smETFyZCe6IlOheiC3OmpTAPul4FACM4KiG8uv0/4wurYDTH
LK4dPIN60tS0Rva/GNPWSBQmzPbA6gZs0gQjsm6Jyq4LMk8TW2rAyj71PxUeHlbQ
P9F+mFFsmr3xCO3O+fonpTWMyxid7D5xBx6d7aL2lSVgXqN+8qK33haTSaAYcI8w
qVdadGoi2+KR+mOBupJvTjj+X9b08dxqFypJzmipN3+fCdpKAqw8Ct5dd9ZBSCUJ
GYD2dZ/kHdV8zlgXoEFYsNk62N0Vi9fNK7rl5wMXwKLmc3K+/uiQ3hMfA9VQEz2b
b0E/nu6OP74gb1VzLaEzOq7cWmfwwFpSrWTKT+7aMynCboh0Ank=
=reXQ
-----END PGP SIGNATURE-----

--ASOzZUL9jhgm30t6--

