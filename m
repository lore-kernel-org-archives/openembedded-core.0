Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FA4D59D68
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 15:37:25 +0000 (UTC)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15294.1765553838442511494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=xbD/4trJ;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=yBDx4XZ+;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 9347BEC04C7;
	Fri, 12 Dec 2025 10:37:17 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 12 Dec 2025 10:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1765553837; x=1765640237; bh=/ZANz9RIZ5
	3+ab5ewi8DnDz0FI9K8REOpX0m4Nsa0Ro=; b=xbD/4trJZwVOHl/BT3yqaHdzpU
	ZZWwmFYWnTbJ0fleJSjW1GvAWLfmuZfLaxgQTpsFasRKhF3KvHqU+hYNqknvJOSF
	jfJ4gVPoGZ2C5X70ofiMfPZ18csc1FMJhLz2IhBMju6WvsBqDkxeXUKZ5MHl4L4D
	+1cC2v1JwKRhXS8acVzBCZr3ecm+ZXiUowbOof+o5WlGh89RrAPAhEqzMqNtA8PQ
	qOtNFZFBcaqqEtEIrSFnJGrVcJIvSmoQIBETqbBgTLcdUrIPoBJtk85GiNTz2iGL
	SDnBfUoPkiSc50b2Exx2uRJb/5twcvPG4GVIwc5K1L8aQUKNA+/IgwUcYy1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765553837; x=1765640237; bh=/ZANz9RIZ53+ab5ewi8DnDz0FI9K8REOpX0
	m4Nsa0Ro=; b=yBDx4XZ+nl3hdmbzh5jD3oLk/sRGVUjIKi8+UVojWDrgNkiCRmh
	HjuVLJWu9zJSuzElp/Cx1p4X7j/BoXdSsxG4BbtmF3zdzQ7wz/CPPcCc1vXCkCSP
	G9+SyfTZVbhuAIMpip/hWs2SLrjIfmqW5wgpjWH5cMVzggciZNj5+PYCEyrRtYK4
	BHNxUMSgw9HekqjLugaR3GvOK94fJBwt2jzFhlY7VIgpZHVfPgytEfdeX70AaX0C
	YKZ37Oo2f/UfT3tgkvJPsVVXQhWcrTfW8l8wlS5wWMa+NRm0/0VB0pdJuKqaZ1b0
	52YUd4URueJXDQRjmiH8bAus+ntpErti48w==
X-ME-Sender: <xms:rTY8adBkjNz_-Fyut4MxV3EurS-cuDkPLgWu__gXkfAQifeufmcwQQ>
    <xme:rTY8aZXaOTMKX5c9YZGZJyVTGWRy_T10mku02EcyDgvn6IiQ4UKL8QU04J0z7IJpJ
    GbBNQL5nD5g2ToAwvcS4hoad0n88y800MZYpG3Qa6FeaVPB4xbxDQQ>
X-ME-Received: <xmr:rTY8aTAloS5I8Lu3qaB2iMdxxlpkUYaUSEa6KjboDWYdMZiIp0WV3iXTzoJ4mIK0w4l_tmJ8tF5k1imRMyrXiAERIW9c-rrB7T5Ht_RZ_jmf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecufghrlhcuvffnffculddqiedmnecujfgurhepkffuhffvve
    ffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehp
    rghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhepveekvdffffeugf
    fgtefghffgleeigfetheelteefjeetueefleefteelveevuedvnecuffhomhgrihhnpeho
    phgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdhmih
    htrhgvrdhorhhgpdhnihhsthdrghhovhenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtg
    hpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepqhhuvghnthhinhdr
    shgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepshhkrghnughighhrrghunh
    esghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgv
    sehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeihohgtth
    hoqdhsvggtuhhrihhthieslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:rTY8aU9D3Ni_0jEOe6kYqDnZgfKdj-XtnNTVYxHpxIXCaApDc_-SyQ>
    <xmx:rTY8aSG2AFFhNi2ubC2CN5bKR-0ckLD8IBX4rLzwsrDR7kZO-NRdGg>
    <xmx:rTY8aaMYiMCWkRxNlMxRYe_GA6InmcHQ6-NBXtQEFyH0ERCkOgs1Dw>
    <xmx:rTY8aUeCa_NBCZez5YSqRBOOh5Yvd0LxswARDAUYh7KayE_SdyrGKQ>
    <xmx:rTY8aUkceafNTV76Ik7hTsYkR4LuQGSggbmlNKeNFSaG-jCyLCBk7XJS>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Dec 2025 10:37:16 -0500 (EST)
Message-ID: <93b6f0d389078f51a88571aab24a90c60b6f9db1.camel@pbarker.dev>
Subject: Re: [OE-core] [PoC 0/1] LLM enriched CVE entries
From: Paul Barker <paul@pbarker.dev>
To: quentin.schulz@cherry.de, skandigraun@gmail.com, 
	openembedded-core@lists.openembedded.org
Cc: yocto-security@lists.yoctoproject.org
Date: Fri, 12 Dec 2025 15:37:13 +0000
In-Reply-To: <85c873ac-7ce6-463c-8a85-c7847ff842d8@cherry.de>
References: <20251205091632.1268768-1-skandigraun@gmail.com>
	 <85c873ac-7ce6-463c-8a85-c7847ff842d8@cherry.de>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2WkHC6QeS0WbWsWCng7y"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 15:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227599


--=-2WkHC6QeS0WbWsWCng7y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-12-12 at 13:40 +0100, Quentin Schulz via
lists.openembedded.org wrote:
> Hi Gyorgy,
>=20
> On 12/5/25 10:16 AM, Gyorgy Sarvari via lists.openembedded.org wrote:
> > Hello,
> >=20
> > tl;dr: This is a proof of concept about using an LLM to enrich CVE feed=
s.
> > Links are somewhere down below to see the difference. If you think it's
> > useful, please say so. If you think it's not useful, please say so too.
> >=20
> > Motivation: the CVE checker associates CVEs with recipes based on the
> > CPE information in the CVE entry. Unfortunately there are quite a few
> > CVE entries missing this information entirely, making it impossible to
> > associate them with any recipes. Looking at this year so far there are
> > over 66000 CVE's opened, of which over 15000 are missing CPEs. Though
> > older entries seem to have better CPE-to-CVE ratio, but for this PoC
> > I'm mostly interested in the latest vulnerabilities.
> >=20
> > The idea: in case CPE information is missing, try to derive it from
> > the human language description and the reference links of the CVE,
> > using an LLM. The intuition would be that a good portion of the derived
> > data would be usable, and even though it wouldn't be perfect, it would
> > catch more valid CVEs than without it.
> >=20
> [...]
> > This patch is just a proof of concept.
> > I'm not sure if/how it could be integrated in the project's
> > infra - especially the initial load is very heavy, and the patch requir=
es GPU(s).
> >=20
>=20
> I've no interest in the technical implementation of this, just=20
> commenting on the reason for this to exist in the first place.
>=20
> This all comes from "CVEs without CPE exist". This is not a Yocto=20
> problem, and it doesn't seem right for Yocto to be the one fixing it.=20
> Someone should fix the database everyone is using. This suggested=20
> approach may be a way to fix the current content of the database, though=
=20
> I don't know if *we* want this in Yocto for helping and maintain it to=
=20
> some degree, or if living outside of it in a fork or something is better=
=20
> suited.
>=20
> I don't know what will be the stance of NIST, MITRE or whatever entity=
=20
> is responsible for the database(s) wrt using LLMs to identify CPE for=20
> CVEs. I don't understand how they can even accept CVEs without a CPE:=20
> "here's a vuln, figure out which piece of software in the world this=20
> applies to" is madness to me.
>=20
> I'm Cc'ing the security folks as that would probably be the people with=
=20
> the most to say about this and with some idea on how to fix processes or=
=20
> bring up issues with the impacted entities.

To give another idea here: When I was looking at bug #15932 [1] where we
wanted the CPE to be added for CVE-2025-26519, the CPE information was
available via the MITRE API [2] but not in the NVD entry [3].

So, before we consult a stochastic parrot, we may want to automate the
process of collecting data from other available sources. We may want to
cache that additional data within our metadata layers as well as sending
it to NIST to get the NVD updated.

Over time we need to move away from relying on the NVD as a single point
of failure.

[1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15932
[2]: https://cveawg.mitre.org/api/cve/CVE-2025-26519
[3]: https://nvd.nist.gov/vuln/detail/CVE-2025-26519

Best regards,

--=20
Paul Barker


--=-2WkHC6QeS0WbWsWCng7y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaTw2qhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkF0AP9jafxhoFEfBbAb6/170qUSshJjeqTNcEKG
viMc4loJowEAtsSGlCwj3gvWPaUcMjETSCrAbfuXyfLY/qmxrAebSwM=
=fzrY
-----END PGP SIGNATURE-----

--=-2WkHC6QeS0WbWsWCng7y--

