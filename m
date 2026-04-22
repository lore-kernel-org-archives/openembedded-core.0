Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C15AF9B601
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:44:08 +0000 (UTC)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78667.1776851043157303448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 02:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Ap+silLZ;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=u+idcKHe;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 606301D00260;
	Wed, 22 Apr 2026 05:44:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 22 Apr 2026 05:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776851042; x=1776937442; bh=0KcQA/Zsgi
	jcmNNAWWa3o20x+YwlL+L2+egjbDMKf14=; b=Ap+silLZez020DDpxoanFhmZ7s
	TTOoubGQB0kVjX1ezqNRN2XSy1xC/eFxwYeW3yftFKHpSsrkaQQZbF/8Cx4E/RDD
	oGcjmiMNdYkTmYTT+YjcqFoE7694sw8dGJhwZ3n5SsKymGivYftPH9lxNhGV2m8J
	MIaE3GRdlRU75H1uAWaOXeGFGH9jtZrAHwaNhFrRyFC9I0LKG5EydlYBygoEXnVP
	b3eP/EIc4ggvF0RywtKPY9O25uvTGElB+NyH3L3/djduYWZuOtvDd0nM9U8y/sGe
	bxnTRKSrHW5sFqlf8twQHpdcdgtfyWKFUfKkGCQdM1HiFEocSzxPNg8BNmqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776851042; x=1776937442; bh=0KcQA/ZsgijcmNNAWWa3o20x+YwlL+L2+eg
	jbDMKf14=; b=u+idcKHeNtklJJeaUAYmN8uo7okO/090h5SC8xXH5kGK8N0PoOW
	XFJAsmG0eSbgVtqJNWCIb8Zt8Mh68yfp1Uh7PyENflonzqXgvveekJXHKaQ8yhrc
	umUh2mwH665AAxyDLEaHRweKy/Zkmso4uD1S/YM0upTIYFoJIzfvbw3KimGIjBwo
	vT/PTE0VRo6HOzYUSkzYwH4oKAvB7LfU1VVNU9QmQYxZoKGhHle3R7OIQyweP2UJ
	Y/SxQ7J2/r+RW41WOw9YfcoiJX2h9kmTffbE2K+abqA97F8MmWjn9BazuyKDysg9
	y3h72DG37ZDwsHVb109wBCHsh8zAy9pzOJA==
X-ME-Sender: <xms:YZjoaXWeY9Q-qf4od7LlGJBDtTUVsqzjP-B1KSWiqQAuMCxcsx17iA>
    <xme:YZjoaXCNdSqUqpZN31JkyXIfxTnlqLe7V6XPA4z7fyA4bD4IwWvC76fOHXKUTX_Oo
    FeluJHokJ9VzJpFh_0LKaFog1o42h5tLHo71x50AAuF9u8w_1YLSnE>
X-ME-Received: <xmr:YZjoaQzh3WiTbYFAvK3uVAO3aEK5l3YyS8gXHyWEgcFkQUn6zneIJhr9vLR9ecnfkHl5acX451ZG3xwpv92D5Ta-H4AXpnZBZA-IfemGfqES>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeifeelgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    efffdvfeegveekudfhteeuhefhieekvdeiueefveeiffeukedtledutdfggeevheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepqhhirdgthhgvnhesfihinhgurhhivhgvrhdrtghomhdprhgtphhtth
    hopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvggu
    uggvugdrohhrghdprhgtphhtthhopehmnhhssehgohhmshhprggtvgdrtghomh
X-ME-Proxy: <xmx:YZjoacAdhMbjAlc62mZNfHz8js--4xU-USzSZeW2eKA13ViSr1xzqw>
    <xmx:YZjoaVamXJCyPcKKPw4Hb9ltdmgRDs2lXKS7pX8RojZ_c7wjgQF9Qw>
    <xmx:YZjoaciXvaq94N9HLoUQEZBpRp7TfLPV3jo-2UYqNyVoGYVWMJUpKg>
    <xmx:YZjoaf5ZStO3TI_YTO1ciMuXwtilofbdU1zyuaDwa3icDJIIhqHjPw>
    <xmx:YpjoaTS2vLhaa2AkCpgIEsw42mL9ZNb9k1wl1zkmdaQ2rxjohh4LuqE3>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Apr 2026 05:44:00 -0400 (EDT)
Message-ID: <d8f2d6b47fe28deff165d852a9b5d732abfa283f.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] systemd: add osc-context PACKAGECONFIG
From: Paul Barker <paul@pbarker.dev>
To: "Chen, Qi" <Qi.Chen@windriver.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "mns@gomspace.com" <mns@gomspace.com>
Date: Wed, 22 Apr 2026 10:43:58 +0100
In-Reply-To: <PH0PR11MB5611699DC4504F7E5A489A71ED232@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20260415082949.3446677-1-Qi.Chen@windriver.com>
	 <a47f8c392202243c914de017786490472464b556.camel@pbarker.dev>
	 <PH0PR11MB5611699DC4504F7E5A489A71ED232@PH0PR11MB5611.namprd11.prod.outlook.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5qyToSrejrX56f+IN3LP"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 09:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235706


--=-5qyToSrejrX56f+IN3LP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-16 at 03:41 +0000, Chen, Qi wrote:
> Hi Paul,
>=20
> The purpose of this patch is to give vendors/distributions an easy way to=
 disable installing the file.
> Distributions can put something like PACKAGECONFIG:remove:pn-systemd =3D =
"osc-context" in their distro conf file.
>=20
> We have looked into this problem so we know what's going on and how to ha=
ndle it. But how do we convey this information properly to users.
> Users get this messy output from console and they have negative impressio=
n about your product before they go to any doc.
>=20
> I like systemd pioneering things, but for the current status, I guess mos=
t embedded systems will not benefit from this PS0 setting.
> The net effect will be relatively negative. Users get messy output from c=
onsole in some case. They get it every time they type a command or just the=
 "Enter" key. And they get annoyed.
> I got this feedback from two very experienced BSP developers, separately.
>=20
> So could you please give this patch a second thought? I also think disabl=
ing this PACKAGECONFIG for oe-core is a more reasonable default. What do yo=
u think?

Hi Qi,

Thanks for the additional info.

I don't really like this approach, I'd prefer a "proper" fix in systemd
and/or inittab, but that isn't likely to happen quickly. So as a
compromise, yes, we should take this patch for now.

Best regards,

--=20
Paul Barker


--=-5qyToSrejrX56f+IN3LP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeiYXhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bvBPAP0S4R4ucNQHA5fpaBOM5OPFm8PwNKCMimfN
iZGOXM9nqwD/eebXumQEQ6E7VD76Xjkni+afC4PLWAGiPOJCEnCShgQ=
=8HhR
-----END PGP SIGNATURE-----

--=-5qyToSrejrX56f+IN3LP--

