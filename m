Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006D5CFD640
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 14:05:56 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6537.1767794750416141009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 06:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=VZU9zQ+V;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ZBnluw5B;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 7DEE1EC029D;
	Wed,  7 Jan 2026 09:05:49 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 07 Jan 2026 09:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767794749; x=1767881149; bh=SLCWR6wMrF
	Wo4Gnh4Jz8GzJG+3uo/3VWQBhXpesQwHk=; b=VZU9zQ+V8WXPduLg3BssD6/MDf
	gynYqm2v13FnPMr6MpXUrRzb1axz86xOUhYkGzgJBpavjMv4ut+it62cLrchnRaK
	1pEPdH0+91ybyWEEkFpCSuiaTKCQfj+Dfvc2w5eNPW8XjgpERI8ZVpPLkwXn/xvK
	SkGnbxfncnSyNb/CGkbVFqNgGKnHdRPLX1ezLcU6W/Fw8gbayTQA34fVEMfMS6CQ
	c2bhKSz/Pfys0io+ilHaaqA1h913idiK9c0NPpayaYOw4YZiEznS4PuUzcNzCMza
	ciM+9FE/60RLVcG9P/qZVDrKSTSYwwNtdA+RCLYjNVFJO53RLdeUxHx6kwSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767794749; x=1767881149; bh=SLCWR6wMrFWo4Gnh4Jz8GzJG+3uo/3VWQBh
	XpesQwHk=; b=ZBnluw5BYn0Ay1Q15MCLXSpmZBZfcq8G+GTGVw0q3Lsg2BFBFfS
	0JqiPq8VPxO3qM5HH1WojhPDqQFOKqfL7w2YqkQI+PusTgkXK0ivnEf1a8ENJucO
	qjnbKuivsbuKGRqyUM+DUPaHa96HC9Anu8CEbyeroYikKRUlGtQz1dH4iNX/GCVT
	vjM3wB448UoXYy2/U88aps3EuGfuTrAVkjwu0UosNKHG6p27Wwz1BxbsBPKVPT/4
	FJK3Jmj3IUAg7aa4uEaE6vEQQBj9Ap9ceBAMdKo9xH/CtHmhaUjDKGAaWYaA1j31
	Ci1UToBuzjSgSYCTS+vLmWhx9unEWgrYl7A==
X-ME-Sender: <xms:PGheaWg2pytVwk6F4yXMgwREe4XTAdxbbOl85-PXi1hBqnWV2qlySw>
    <xme:PGheaeBaIoxvLLKoGzcrv6vBYW1obggeOdoTbhPKKHHUYzssMSIQOvTl2UzLvLRoV
    2_T4L2PruVdRIFvIgwzWTKUWLuIhSYTIhXGPdLbOEwfwt9dN2Z7oyGy>
X-ME-Received: <xmr:PGheaTH_r_wxbRhA2Oo2XtA8mq02n3LBJ6o-IaAGRhZtUBk2qvIHZqA2UxheRyST8giSf_Tgg-jMM-bo76R3v_dkyhwcfiurr-gwIsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdefvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlqddutddmnecujfgurhepkffuhffvffgjfhgtfgggsehgtderredtreej
    necuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvg
    hvqeenucggtffrrghtthgvrhhnpefhjedvieeileeiheehgeehjeduteffhefhjefhjeej
    tdeutedulefgudfhuefgjeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorh
    hgpdhnihhsthdrghhovhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepge
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehs
    mhhilhgvrdhfrhdprhgtphhtthhopehpvghtvghrrdhmrghrkhhosehsihgvmhgvnhhsrd
    gtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdr
    ohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepjhhirgihihhnghdrshhonh
    hgrdgtnhesfihinhgurhhivhgvrhdrtghomh
X-ME-Proxy: <xmx:PGheaeK7gU6L645xjdPARPtExTb6awqRPTJW5au-C2vTt51O1Prfiw>
    <xmx:PGheaflAo9lw2n3USi4M1Y6OwcaTeqXIpjr7GwdV_OaAvUfE8tMJDQ>
    <xmx:PGheaeStBHkEjQzfDlHl4Fc8SbAvIeYe6UgeMv-3-Dn0WL6IOv_y5g>
    <xmx:PGheaZL1U0l_4MNLKCeRWR1E-ucVnGUN5uNUexR0-JgNQo_JJasqtA>
    <xmx:PWheaUPF-zI4yWCGdHBG-y84HMmEVS3kCk2Behm1x_4-r8NJvayuqRaw>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 09:05:48 -0500 (EST)
Message-ID: <6164cc2da28a6a9e637b47bde280254af4ed6384.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, "Marko, Peter"
	 <Peter.Marko@siemens.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Jiaying Song
	 <jiaying.song.cn@windriver.com>
Date: Wed, 07 Jan 2026 14:05:43 +0000
In-Reply-To: <04c34334-5342-4711-bcdf-177da37b6fdc@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
	 <34083b26ca1e5a52c627e41a1adbeaacf79dfa6d.1767772757.git.yoann.congal@smile.fr>
	 <c19daed92270797942ebbb4b51c6f6b03fec16b3.camel@pbarker.dev>
	 <AS1PR10MB5697BF5D70C1BCB02E7F1129FD84A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <5549493a25264654b39a48522691b15feece176c.camel@pbarker.dev>
	 <04c34334-5342-4711-bcdf-177da37b6fdc@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-1XMQNi6nvnWwDnSzmfTi"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 14:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229001


--=-1XMQNi6nvnWwDnSzmfTi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-07 at 13:47 +0100, Yoann Congal wrote:
>=20
> Le 07/01/2026 =C3=A0 13:32, Paul Barker a =C3=A9crit=C2=A0:
> > On Wed, 2026-01-07 at 12:19 +0000, Marko, Peter wrote:
> > >=20
> > > > -----Original Message-----
> > > > From: Paul Barker <paul@pbarker.dev>
> > > > Sent: Wednesday, January 7, 2026 12:49
> > > > To: yoann.congal@smile.fr; openembedded-core@lists.openembedded.org=
;
> > > > Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > > > Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
> > > >=20
> > > > On Wed, 2026-01-07 at 09:08 +0100, Yoann Congal via
> > > > lists.openembedded.org wrote:
> > > > > From: Peter Marko <peter.marko@siemens.com>
> > > > >=20
> > > > > Pick patch per [1].
> > > > >=20
> > > > > [1] https://nvd.nist.gov/vuln/detail/CVE-2025-66471
> > > > >=20
> > > > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > > > ---
> > > > >  .../python3-urllib3/CVE-2025-66471.patch      | 930 ++++++++++++=
++++++
> > > > >  .../python/python3-urllib3_2.5.0.bb           |   1 +
> > > > >  2 files changed, 931 insertions(+)
> > > > >  create mode 100644 meta/recipes-devtools/python/python3-urllib3/=
CVE-2025-
> > > > 66471.patch
> > > >=20
> > > > This seems like a very large patch for a CVE issue. The changelog e=
ntry
> > > > in the patch also says that the API of urllib3.response.ContentDeco=
der
> > > > is changed.
> > > >=20
> > > > We should look for a narrower fix, and only take this if there is n=
o
> > > > other option.
> > >=20
> > > I originally didn't want to patch this CVE due to this reason (and di=
dn't patch it in kirkstone).
> > > But since this has landed in scarthgap, I decided for the same in whi=
nlatter for consistency.
> > > Should we revert it from scartghap?
> >=20
> > I don't think we need to rush to a decision.
>=20
> On my side, I need to do the whinlatter 5.3.1 release build on Monday.
> I propose to set this patch aside to not block the release and the other
> patches.

Agreed.

> For scarthgap, we can revert the current fix and add the "proper" fix
> when we have it. I'd rather avoid a patched->applicable transition on a C=
VE.

We don't need to do this immediately, let's take a little time to think
and see if others have any thoughts.

Best regards,

--=20
Paul Barker


--=-1XMQNi6nvnWwDnSzmfTi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV5oNxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhgYAP4xG5IwtRCZAcUuxcvN3gV2waOt0sCG9ruJ
biOoIa+mDQEAsFFrRndwtQPxutvtzdKA4fg87BOkccrFQ4e/GXSgQAE=
=d82m
-----END PGP SIGNATURE-----

--=-1XMQNi6nvnWwDnSzmfTi--

