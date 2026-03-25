Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1FF106B527
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:44:05 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21617.1774442642345706435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=AKu0HRfK;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Ak4Yf4l+;
 spf=pass (domain: stwcx.xyz, ip: 202.12.124.155, mailfrom: patrick@stwcx.xyz)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 870A97A00B1;
	Wed, 25 Mar 2026 08:44:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 08:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774442641; x=1774529041; bh=6XSzKSilzU
	uUfjy6m8oYb5CZIN7PKnINREW5V4p6hUE=; b=AKu0HRfK5V30J37MGDFBXGUhYN
	eikh2JQurQv8z19jA5dxpB2uv1W7xcD75rxlRVtinBz45k3w1BYYz51y553mILPu
	2bCMk1gTyjtMuiieMGaoEv5xBmRo5h2gw7IUISPzJQPnje9CByEJhNyW817LbJ7u
	OZSxdRnR7To2/eOV+rhzt0U45/V6s+wlnyb+qVs2Iz3bwoUvVuNDN72l2mftxsSP
	/LDWrlSpIPbATv5/2eZNClPDMnW0DIURVK87YDhTo5nXo69KldqxdJTfqRdgFNMv
	V7HrgQPyyM135kZcNOXnERwtayzLJNxdOFOeBvxmNR+ap2Y4VYllv3pZfeMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774442641; x=1774529041; bh=6XSzKSilzUuUfjy6m8oYb5CZIN7PKnINREW
	5V4p6hUE=; b=Ak4Yf4l+ZGiCey95Cn/momicu6URX7/m1QksxVLCwspzv4tnMcN
	THyCHnU3OfK7xBfCkHwoxGIDzRBYXYo/QY2GYdeUhYv7W1xTVtTMfd1WAxxWrA8N
	0cjb3yivmYFaMITSFmltBT0dn/rj41Bn2bXAtfGIIJOarFWiHpbkdHgOon4fWdSw
	tVqzO6MT6ESKBhz0/3PwVXLkCP3ioKOCp/AyM7fc/3gZqLLAtcSaARCBdEWyqKB0
	XRBKMMa06Vxja5Sd7+QAqDdGJB4OH8C6GfsxvJfPztAxNo+jeMPejWksFf2LA0Eo
	MmWfzfQkjU0dh//ahBuojNnvQdHopZYs/Fg==
X-ME-Sender: <xms:kdjDabKdvtGdMK6gH8eE0-975jUDH4O5EiygqMKXWrW3RwDYSRifYA>
    <xme:kdjDaVKwgiQQs73UTYCuCm7ivpyDGpstZzb4ZOigP2VxNGSuP5iAkQ_w_77_SS8Ro
    WlNYM41cSepGygeeent-zV9qSAdRjvMdT1-OEw3ENew9yxsBaSr4J4>
X-ME-Received: <xmr:kdjDaRW179FmQVvwYL81xk2gX5ywJSrm26H3bTiIkJnbIPv90B5gVJcEvkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdeggeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddu
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtkedvffevleetvedufeeiieeigeek
    hfduueekheetkeffvdeifeehtddtveehleenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhphhhoshhphhhorhdquggvfhgruhhlthhsrdhinhgtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgi
    ihiidpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    rhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpd
    hrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghn
    vghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:kdjDafhA9wwHZ9r2JpT6WUeVeDj0OjvAVrpgD5YJDzM14NRhyb94rA>
    <xmx:kdjDaU_3C4hqHvH7KxXEo6fGIVFbiFCAWyKU0HAlzl0vW6jf2xoS-w>
    <xmx:kdjDaRAytckOucOqmHpcBjYKzb54Qzq4yX6Lhr9R24uMIq88D4MnNA>
    <xmx:kdjDaZJjdY-t93trZNgQX74sYQUX9HF_VDif-unrehWI9EP1GNF2hQ>
    <xmx:kdjDadPggqlfc7l0e95U41ZBPlUWI_fW-9Y2q8NhICt4U8Pr_VyYP-gq>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Mar 2026 08:44:00 -0400 (EDT)
Date: Wed, 25 Mar 2026 08:44:00 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gcc: fix buildpaths QA with LTO
Message-ID: <acPYkLXfOoJmv2lm@heinlein>
References: <20260325113951.1278864-1-patrick@stwcx.xyz>
 <acPLE7KjSfvxXthX@heinlein>
 <9a222b692f97515655dd8dad792246068410d660.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YgPK6yQ4X84sozdN"
Content-Disposition: inline
In-Reply-To: <9a222b692f97515655dd8dad792246068410d660.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233899


--YgPK6yQ4X84sozdN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 12:34:52PM +0000, Richard Purdie wrote:
> > > With GCC 15.2 this can be noticed by setting many meson-built package=
s,
> > > such as systemd, with:
> > >=20
> > > =A0=A0=A0 EXTRA_OEMESON:append:class-target =3D " -Db_lto=3Dtrue"
> > >=20
=2E..
>=20
> We're not seeing the error with OE-Core today in any of our automated
> testing. Reading the above, it implies that we should see some kind of
> failure with some components auto-selecting it? Something therefore
> isn't adding up.

I tried to give recreate instructions here.  OE-Core doesn't actually do
this so you won't see it unless you enable it.

OpenBMC has a large number of meson-built packages which are generally
safe to enable LTO on (but in the past I've ran into issues with other
packages not building with LTO; now with lto.inc I should revisit this).

We have a global enable for all meson packages:
    https://github.com/openbmc/openbmc/blob/47d900012a93d79ab536ca172fc01cd=
89645a0d8/meta-phosphor/conf/distro/include/phosphor-defaults.inc#L153

When I upgraded to an OE core that had 1797741aad02b8bf429fac4b81e30cdda64b=
5448,
almost all of our packages started failing with buildpaths.  I was able
to track it down to this problem.  systemd and libpam are two that are
OE or meta-openembedded packages that I saw fail this way, so I gave
systemd as a clear example.  Like I said, we have a lot of packages in
meta-phosphor[1] that we have enabled LTO on and they're all failing
with buildpaths QA failures without a change to pass along
DEBUG_PREFIX_MAP.

If it helps, I can upload the objdump content.  There was DWARF data
being inserted by the GIMPLE intermediate which wasn't being stripped by
the linker that had my build path in it.

[1]: https://github.com/openbmc/openbmc/tree/master/meta-phosphor

--=20
Patrick Williams

--YgPK6yQ4X84sozdN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmnD2I4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEKsDR8wtAMEZq+sP/jl447nCAn+8WkhOIrlx
q46OQvEnl2GIPhPlsekTpfX89509YBy9HdnFwXpCDNAn7+yc3VURUvWeywYYbzyd
oFjiRlXfDNM3/oBNe8yji8p5BRfboLVt0VvNDKkzwJiezf22MQFp4CGC99sW4oAZ
pikDMcEdkp+P922WblJT93Z+PLMDBSukTVfztF77Es+j0NsIzq8cy3i0goE8IWav
04Y2zztUwSQTkYlFueABsRr60GXscDZ9Rio3jW07JpznOpOZsfi0hAL44aPgynR/
S1whnZ7+zzIK5QDdK3ETXfEEPJYG1qxtFUYe/gzeJvoUAlBy/h6wWQegKmqznWv+
yPEECZ9PgAgWjnFpwcAef0WUDnzCmOxV/YKW1bH/xbW+WtXzstkuMTmg/HMYMqaY
n1t3WQ/zv9GXt4lhAlpKm3q333u/UEe3j6rr1Tu5NCndYdAq0HxWbwpbzFIY/h4A
YSI7qV8gla0EMV4qs+lf0KQXzI4Xic/Govk7JslVaSYRfHI4xadoIj5pTZPvTb15
5FPKpiLSFRhuCmPOE4mQ7ZDZY41pGr0DSeZy74+fMAreTJIPjDA4p3zIStwkqD/1
czOe8IVkyzRbffUIUosFGd9hD04kCudgd2/VVZS8fJwKUlQoA8ariQ0aBZ2f35+B
JAruDdQF41R8ooH1F5dzdHJj
=ahs0
-----END PGP SIGNATURE-----

--YgPK6yQ4X84sozdN--

