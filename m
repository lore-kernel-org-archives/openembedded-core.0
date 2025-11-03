Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51799CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 19:43:47 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.524.1762199026608369219
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 11:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Jlj9oLbq;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=AO6Wtu1a;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9B5737A03C6;
	Mon,  3 Nov 2025 14:43:45 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 03 Nov 2025 14:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1762199025; x=1762285425; bh=iOA0cuCI/P
	6k2QZs/nrz8N0cCWohjo+9nh2XOCBjglk=; b=Jlj9oLbqIjYSuoGaGjH9GrnPTc
	AEFUHIuTIeVpIGP5Hy6nY0i3Az0UHePGALDOp75Il8QWL0MVCkUH9VZ8qryysHh2
	BtTd+uuM1NEzMNP45Ejsf12XaaeuWALjDirkqypoAToPibuYLfmGAuGUfhx/rFEW
	EGdAlmxdE/vYHNm6ddbapydA6DjgHz39XZ2M6mO+q46d9jfT0AY2c5+RDRkDLDkg
	+qiOq/F7Z0Ng3WDxPlfKDePs3+baD+KIPqVlTRptR3bHes+jh6G68qQAL5mnFDwr
	rs5T8NGhrEKlkEhNRMBONBiaV4/PRnBUwM5k8a/PvhtrqAMxP5u9nWXF2xwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762199025; x=1762285425; bh=iOA0cuCI/P6k2QZs/nrz8N0cCWohjo+9nh2
	XOCBjglk=; b=AO6Wtu1arskVUqAmEyUk92RJUZBItIn2fiLXvHtCkLRVI/DTyne
	rpnJ18h5G4nNTThZ6LMwe8315dv59X5gG3DfOfGKiNEOlHHjoXhIUm/Bi074uT/5
	vHnvDuR4XBPSyqp9EkLuEr6A8zj5xy9Bd9gVZlA5AWy6H4xIo74LlbSMfIrM6cIy
	9sVjaGB85Zj/alAFVNLuw7O3rMWfXJm4omk1i0aSp3jVsCRyxnk3hu6RmIV9P/68
	E6mhGhSrm+mgVzKSBeh5ufH9CinoK/YZz4CsprlEYIaMUNpp91iDPk2eIqgCT0Zv
	upwtgN9Vec3MEIPJbW5cnGm9lCEowyAIz1A==
X-ME-Sender: <xms:8QUJafMH1J-QB99MrIAZKq6xOPjMpWV5zsl-mEH9Zcny2cuVkElApA>
    <xme:8QUJaQ91nv1h65MfowfDsc2d0AVNaI2NALy0TLfsVGT-GzIfcVYklccPbZfu8R36X
    WAHnSl3vfkBE5Ad5r9fcyu5B-_KJItEAgMfesOP5iI_znEPuytIfIk>
X-ME-Received: <xmr:8QUJaTRfYbNuQCWRth_kV07el_JzUo8oGtnloeUvED8t5NlelDqQ6elUTnn70Y7mXIAHB5wmTJTDpEDj9iyRVbsWtuB-rA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeltddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epgeffveeffefgledvteekhfevleelfeelleegtddvfeejvddugeefkedukeelhfeknecu
    ffhomhgrihhnpegrrhgthhhlihhnuhigrdhorhhgpdhgnhhurdhorhhgpdhkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepgedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepjhhorghohhhfsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsg
    gvugguvggurdhorhhgpdhrtghpthhtohepqhhurghrvghsmhgrrdhjohhsvgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:8QUJaSlPDpGLsD73y4RiP7_mR-mmCtaYIbaFETRtixuSiJRYvs0nfQ>
    <xmx:8QUJaTTAQ9OKYzYvmJypyYm9ggJ6zr1ysVlyzjeU52QL3DC44VefwA>
    <xmx:8QUJaQPcDWkttIojnviyWGcF141eFTm53lBslCxs5m_jPUrR-t9MMg>
    <xmx:8QUJacVyQCOoJCEPgz8d5SmdLtNzNzatnfWcMtOczrPmqV56ac1gTg>
    <xmx:8QUJaQhqF69ihauuP3g94ZYgSgjBakxTprbLipCcTZ-EtgTCy3KVzmtd>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Nov 2025 14:43:44 -0500 (EST)
Message-ID: <b7a795596ef99c4360902d5ec5d2db2d24d6a660.camel@pbarker.dev>
Subject: Re: [PATCH v3] readline: backport a patch to fix for caller setting
 rl_prompt to NULL
From: Paul Barker <paul@pbarker.dev>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>,
 	openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 03 Nov 2025 19:43:38 +0000
In-Reply-To: <20251103181409.3191690-1-joaohf@gmail.com>
References: <20251103181409.3191690-1-joaohf@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-mN+t05WRcZS4DmFJqvqc"
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 19:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225693


--=-mN+t05WRcZS4DmFJqvqc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-11-03 at 15:14 -0300, Jo=C3=A3o Henrique Ferreira de Freitas
wrote:
> I've observed this issue affecting iwctl and connmanctl.
>=20
> Patching readline solves the issue.
>=20
> The original patch from [5] mixes many fixes in one commit. I've extract
> only what matters to solve the issues observed with connman and iwd. The
> final patch is the same patch sent by readline author to readline's mail =
list [6].
>=20
> References:
>=20
> 1: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/i=
ssues/1
> 2: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/c=
ommit/b30636dc66fc783a091af51b049dc5240f861dd0
> 3: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
> 4: https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold=
-front.org/
> 5: https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=
=3Ddevel&id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd
> 6: https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi.=
txt
>=20
> Fixes [YOCTO #16047]
>=20
> CC: Jose Quaresma <quaresma.jose@gmail.com>
> CC: Khem Raj <raj.khem@gmail.com>
> CC  Paul Barker <paul@pbarker.dev>
> Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>

Reviewed-by: Paul Barker <paul@pbarker.dev>

Thanks,

--=20
Paul Barker

--=-mN+t05WRcZS4DmFJqvqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaQkF6hEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsXwAQCch+nhp/+OPebXpsj0IcWeHVeZIF2pW09e
ufWM4Y5xvwEArxfozSnug1AfK0gAesCaksyGzascvXZVV/t1RDZ1sw0=
=T21U
-----END PGP SIGNATURE-----

--=-mN+t05WRcZS4DmFJqvqc--

