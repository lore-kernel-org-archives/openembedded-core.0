Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3866CD4851
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 11:00:15 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8122.1778756409877635820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 04:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=kuUqCZSV;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=OZtPY28i;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1CF4B7A00CA;
	Thu, 14 May 2026 07:00:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 14 May 2026 07:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778756408; x=1778842808; bh=4cvdgqEhtD
	jymIGqy9adBZwd4PGf8dqYDrqIhAVqrJ4=; b=kuUqCZSVZbAGLDdLRhVgG2iZmE
	/QJpt6JcFokd0iGnJFyH67BIJPj8LjlkEShYpIUNwNmT82HJ1uF+Fg419lN3DLy6
	eV1ICKwjofjYpEHjNThtvkILXvJm3s5rxspZ9L/mNiYURh6XPTUG2HI3zL87BUV+
	EfTNfG/y6Veqv4mF5msTVBLAoUxyBjr9zOueK5xSHssqAlhTFUUTjP4Ae+4BdSZK
	VpE0NgH6/mQrYYxVNwAtlr7nduMjlOv08YjrbohZBa8jjBsHT/bbrA6ucoI96eo4
	fyHbXi+Y4tCoHWVyCyMHWqoDBP+4yBeLKVywaikOhZbDPkFfpE8YLhvo6+gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778756408; x=1778842808; bh=4cvdgqEhtDjymIGqy9adBZwd4PGf8dqYDrq
	IhAVqrJ4=; b=OZtPY28iJwPPdP4EVhtN8DQlWhFdjbiAPvjJq8P+iX/fKOoGnQN
	XZANzuL2YT22NxNaKGRwrU9VBlpaR162cp3OidWjHcKuGGlrvqkphMBgw5TJdJes
	LvcwKq2/R/dK55Rna+UvmRCeb3LW9AQkPEdSOAf4NVSvlW29V9X8GGG63i4kq69o
	76HXy+noWg36+fkfw/u4XP114jZjwRaESkRzwtiwf3tUSo0gijqz65caq3jgRwsl
	SSqNA1bOyoadS5+qOnSXNWr5TvzbSVhqxCLIK5Abj934hwHrU+yaiQYRsmeaooSz
	HyIDAPtkAxrFtroZhRxD37dHM+A+4zK4mmg==
X-ME-Sender: <xms:OKsFaj08wMaOrMUabm1V6kNBgkKf0jWFcWRRBvb2J0xNFyYBU6NB3Q>
    <xme:OKsFaoETyJz8MGyz1Hq8VhxVi8rwrhKzbJax16h80Es2ehKL9oWmXOQXKtMtnnrb5
    HUivl_GN1UwFFDlK5kDBImStioHQsy4xLY5xxPqmOhH6d7tuxRbHhww>
X-ME-Received: <xmr:OKsFahgq648lyfRKOOy29Ecx6KHtGkicvu4cYEeMVGzhP1O-AvjA6_5LHTjk-b1xG60ytc94GJZ8aL7HzE1s3kdc4WxuBa6XSxGP5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdejfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    efieelheduffdvleejvdfgteeiuefgteetkeeftdeggefgvedtuddtvdehgeefkeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhuughumhgshhgrsegtihhstghordgtohhmpdhrtghpthhtohepoh
    hpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggu
    rdhorhhg
X-ME-Proxy: <xmx:OKsFaj_F7FTeTr-bftO4jfWa88_23PUdL_q0dUOt1CRGnVrMdpt00w>
    <xmx:OKsFaooT4UOHb26gda8QYQm6LQJYvtvovWlOAQYP2-9tSGzvnEjosA>
    <xmx:OKsFai85M2td8t5u049P5zQo9GLvSaU3kYpX7_tnho4ZVvRbbwvVVQ>
    <xmx:OKsFasVFGP8MFO5Fz71zXSrZgYuwC-QfrPQuqzSlyKugcWpEcsmrRg>
    <xmx:OKsFark2ISwIeJHCtJIGVOcbFNREDyVCUiqOn29Zj6IgE6SZKH-SAekX>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 May 2026 07:00:06 -0400 (EDT)
Message-ID: <c10eec7c9793593287d92fdde936f51cd690fb00.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap][PATCH] perl: link to the system zlib
 instead of a vendored copy
From: Paul Barker <paul@pbarker.dev>
To: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	 <sudumbha@cisco.com>, openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2026 12:00:01 +0100
In-Reply-To: <20260514103317.3959488-1-sudumbha@cisco.com>
References: <20260514103317.3959488-1-sudumbha@cisco.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2CPSagJtX3FFJWwodady"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 11:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237025


--=-2CPSagJtX3FFJWwodady
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-05-14 at 03:33 -0700, Sudhir Dumbhare -X (sudumbha - E
INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
> From: Ross Burton <ross.burton@arm.com>
>=20
> The perl module Compress-Raw-Zlib defaults to using a vendored copy of
> the zlib sources which has a number of CVEs.  A newer version of perl
> updates this to zlib 1.3.2 to resolve them, but we should be linking to
> our zlib recipe instead of the vendored code.
>=20
> This mitigates CVE-2026-4176 so mark it as not appropriate.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit bf515229043685d4f00c965eb3e0236c37b6b403)
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>

Hi Sudhir,

The description in the commit message applies to Perl 5.42.0 in our
master branch, have you confirmed this this is also valid for Perl
5.38.x on Scarthgap?

Thanks,

--=20
Paul Barker


--=-2CPSagJtX3FFJWwodady
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagWrMREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0buQQAP4pukaI3/mXFWdGh9W6NmistWwtdO8YNF9L
5S99AVQBbwEA4kK4F4Fieq/JaosBFMR6Nyf1os1hyW4G0Rpgkt+ICw8=
=vo7s
-----END PGP SIGNATURE-----

--=-2CPSagJtX3FFJWwodady--

