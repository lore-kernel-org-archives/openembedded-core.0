Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813A3E99071
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:19:31 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153254.1775816361520316087
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=VaigGuGi;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=XGL7ois7;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id B16F31D0026C;
	Fri, 10 Apr 2026 06:19:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 10 Apr 2026 06:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775816360; x=1775902760; bh=ehtZd23cyt
	HELw3xAtyfiTKpiCVFMfCbU1CQg+ibSJs=; b=VaigGuGiuuqD9KHS1hnosrNBJk
	rvpvp49I/39D03yxy0bGN5/RAtTVoLcc0a+hruZrRS/7r/y0fySGLnUj5+tUj0cG
	mG49yNTT6vAhJuCVLp8fCDQPew+R3DGeAq3isU8NeOYDxphTPmo4yPIzhACoLuSS
	mBj+Kgcgu/emrSwq5HVT1cGA4TKTHUgsGfRYa/JsfNWeJtXr5VAb+OdtarGm5cg2
	hCtOuV8eqHgWA3C9V1jmSxhVbrMHHDmWcnKzuJugpAKV8PYTx3bF/FAAesPTmQyz
	njqIQPwQbnmQzdMpEu/C5BoP3e8+94ViY61n5uDPiFslVwrgAUwH+De6MEhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775816360; x=1775902760; bh=ehtZd23cytHELw3xAtyfiTKpiCVFMfCbU1C
	Qg+ibSJs=; b=XGL7ois7QpYgfTd4eOM9UzYzo1Qwp9XlnEMKCG7ZBpC7Sa9D+SN
	6jq+xQNN9acJCh0aH7KSbOJoH/Q03Isu1UvtGDp6Upya6SW6gr7jlsDjdeV0+3lw
	pDGg/IFjKtBUdPehcUz+lTu6jzZfEYwF5R/ngy4PlCBW43tBPPiXemn2ZnvMmzaa
	pilR6GC9V2At4PQJwJQgGSoflKli+7t5tXAbI2ns+VEZ9Y6fm7rTmTvw1ighOPFP
	cET5fjjePOEJRhhm7cHx1Fy8l6XWgZKCfbOge9dXVFfcABHz2bjmGTiqq6DUd0XQ
	AF1TnPHB0WDbd2/xn5AtXIa+WXd0FXWaLWQ==
X-ME-Sender: <xms:qM7YaWdGgPOFfw1Q33FgW2-S2eHDoQ_VhfoimT5IQkbKL3Y5V2ZmEw>
    <xme:qM7YaWMjZv6cy9hdwFvbpSMjcxBau6LKiBipb5PRdNo9hZ0RwUosbAC4AprURc5m_
    PX83PQ41mZwWsd-H0oAA6sGDf4q6-Fr8l4n7b25KCVdWxxiPy4xHY2D>
X-ME-Received: <xmr:qM7YaVL51ML1s6UZz90B6J2JBFDaobOjXgyWsB6pAO3LB8WFtVAj7ncbK-bc6az-li3nn7W6jo6tH28pOBj9a3xk9GnD61zCiCuLjqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvleduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfgggsehgtderredtre
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeetfedvveeiieetieeufedvjeeukefhkeeiteefje
    evledujeejvedujeelleejleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdho
    rhhgpdihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgs
    pghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhitghhrg
    hrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthht
    ohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvug
    guvggurdhorhhg
X-ME-Proxy: <xmx:qM7YafEcIGjrKnyxO0q1ckMVlLUqYLg_Op8k8Z3nL9VDGQX7_1h61Q>
    <xmx:qM7YaVRWn8VWCux8E7eIcvSwwTdSRARhGGkxRIe-uHNlR5Wf6H79Yw>
    <xmx:qM7YaTElb1dp66-SoF63miV-2wffSUVC_e4UI5B2cHf7nfR3TGmnhA>
    <xmx:qM7YaZ-OfbhreeJvA552IXR5GbiZqxRDvtZBqL3Nt9PxZj7zsuhDuQ>
    <xmx:qM7YacDFuQ6U-Uy3r4EzgZKZfuvtK4AGuasruJxSs4hxtK8KxTxMfguM>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Apr 2026 06:19:19 -0400 (EDT)
Message-ID: <df8b2055ed6e231251a9bed7ee4fc6a698e095bf.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] oeqa/reproducibility: Work around subunit
 protocol limitations/bugs
From: Paul Barker <paul@pbarker.dev>
To: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2026 11:19:16 +0100
In-Reply-To: <c54c4aa98d2e22d8e40abe24c74897cb8296d291.camel@linuxfoundation.org>
References: <18A4CA9DFD58F4F1.777565@lists.openembedded.org>
	 <c54c4aa98d2e22d8e40abe24c74897cb8296d291.camel@linuxfoundation.org>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+WyWwrM96pqspee8l2RQ"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235012


--=-+WyWwrM96pqspee8l2RQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-09 at 22:54 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2026-04-09 at 21:35 +0100, Richard Purdie via lists.openembedded.=
org wrote:
> > We've seen reproducibility failures with:
> >=20
> > =C2=A0 File "/usr/lib/python3/dist-packages/subunit/chunked.py", line 1=
08, in _read_length
> > =C2=A0=C2=A0=C2=A0 raise ValueError("chunk header invalid: %r" % count_=
str)
> > ValueError: chunk header invalid: b'\n'
> >=20
> > which leads to:
> >=20
> > 2026-04-09 01:18:20,886 - oe-selftest - INFO - ERROR: broken-runner
> >=20
> > and UNKNOWN status for builds queued in that runner.
> >=20
> > This appears to be when reproducibility builds fail with:
> >=20
> > Traceback (most recent call last):
> > =C2=A0 File "/srv/pokybuild/yocto-worker/bringup-fast/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/cases/reproducible.py", line 407, in t=
est_reproducible_builds
> > =C2=A0=C2=A0=C2=A0 self.fail('\n'.join(fails))
> > =C2=A0=C2=A0=C2=A0 ~~~~~~~~~^^^^^^^^^^^^^^^^^^
> > =C2=A0 File "/usr/lib/python3.14/unittest/case.py", line 750, in fail
> > =C2=A0=C2=A0=C2=A0 raise self.failureException(msg)
> >=20
> > which is possibly from bad placement of '\n' in the byte stream. It doe=
sn't
> > 100% reproduce since the placement is critical but from the subunit cod=
e, it
> > does use <int>\n as a header in the protocol.
> >=20
> > I've wondered if the presence of "\n" in the traceback code is part of =
the issue
> > so remove "\n" from the traceback by writing the python code differentl=
y just in
> > case it helps.
> >=20
> > Ideally we'd report the issue and fix subunit but I was unable to work =
out the
> > exact sequence to reproduce and any fix would take time to propogate an=
yway.
>=20
> There are other better ideas about what is going on here to cause this
> and this patch won't help. The issue is thankfully rare so we can drop
> this for now until we come up with something better. We can open a bug
> to track the issue.

For anyone following along, I've filed an issue in bugzilla:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16242

Best regards,

--=20
Paul Barker


--=-+WyWwrM96pqspee8l2RQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCadjOpBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkGUAPwPGwlii92mo4FmN3GBoDHnHR+mh01E64FU
i2c1GzilngEAwby+m252Kak6qGtX4Ml7S1k7gecjrRAtEy9HaO1E4wE=
=HYK0
-----END PGP SIGNATURE-----

--=-+WyWwrM96pqspee8l2RQ--

