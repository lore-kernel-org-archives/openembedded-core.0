Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBC2E99056
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 08:48:16 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.152174.1775810882938554133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 01:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=CNOcqU12;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=vXjpIVY8;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C4DAF7A0154;
	Fri, 10 Apr 2026 04:48:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 10 Apr 2026 04:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775810881; x=1775897281; bh=mrcHVe8KnI
	ZV7/haWpjYMR3zBd5ywGr9rYiGPV/+P3E=; b=CNOcqU12BKZE6PX3WoiROk6msn
	+c5y73QqmuklLr0H2JZXNN9OhITfhPbpuT96GaM4xuiM+UCYyaOiZ9JZZ7Cl41gS
	0hRjLXyE7FG1ow/uKGVhzhOq/YHi0SHdsL9NMfzt5h4rCGxl0SYps2e5TPj/bY0P
	TUleP0PwN06VA0dgIUjCLdt17IyCE7kifeQ9GxwrACI9Y+QcrromFNXaZOARYjlz
	dbrmP96vVKMRMezg/+rdC9gXYAkYH4pN5CyjmSI9imsmJ4U1DgQt4WkpVdc/CUbW
	gA+m13aFTxe4Ep0oCO+DJHbcM5oAsGKuZIw+f+OqggKau10eDbQjC1fbzyLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775810881; x=1775897281; bh=mrcHVe8KnIZV7/haWpjYMR3zBd5ywGr9rYi
	GPV/+P3E=; b=vXjpIVY88+/QrYyLfAM3JdYcIOPsiMXOvyTcSXx6teaxeQDJHUX
	leQC2rsJyHl2F6odFlRbBsOQrtMKymE+Oi63aSvLozLRuxLNNru8QYlrskjbjUqI
	gZUQF4WV7c5LmyErBKFm23WvJG+UlKSgvRU/3aEaW5TLZqW8B/2kZ916GJDRCDmJ
	ZyqoYdQUZYojA7C4/j/gpC2BxLB51cnE1GjhSlZdOV61uU2lTDfQ3mUiLJPXUFIB
	jNXvZ27czVsAhSoMZVDVYNtuiIEBTnplbvoryQzxfGNEBFTg69sjAZtJhNurVzc7
	f5QBBpdGF56JoLiolIOhImbXju2WLHTVWMw==
X-ME-Sender: <xms:QbnYaRcRHia-j5BPMmyys-I3TCrzmnbJ66et-X16LMjUOsgOWap-Sw>
    <xme:QbnYaVOQ78nbqBd_LhaPiUzwdHpwNqE5Wi8g2WmTQ0_6NrPGTlE6y3Rk-qRlQH7EI
    ZY-rho9w97TjZHB8NdcbcgZtM5tYN8iC0d5yV7oWneGQh2IPFpO4Gc>
X-ME-Received: <xmr:QbnYaYL7d3HZCE602I58EaPot0vJf7U9m_St9b3RfHrpVe9vuG7F5FMue1HqO6t11OSJwVltIwlcQCMAaEM0M7F8OYfU7CT-MHJomYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvkeeliecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfgggsehgtderredtre
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeegkeeufeeuueejteefffevheekieegvdduveevgf
    dvheffgfdtudeggfduudfgffenucffohhmrghinhepohhpvghnvghmsggvugguvggurdho
    rhhgpdhkvghrnhgvlhdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggr
    rhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtohep
    ohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvg
    gurdhorhhg
X-ME-Proxy: <xmx:QbnYaWErv9s8IcwXW6mng3rmYRqTnl2BEVIVVYMDit5eWWQjXQCQzQ>
    <xmx:QbnYaQQckVZV33MGOP-H6pv4dr4qDaS_qEKwC8kqu2UeiH06t6U5Bw>
    <xmx:QbnYaSFxPCQATW2m5_9oFlVWVgbbUGBVGDsJNlBGKCCdARUSlWumWA>
    <xmx:QbnYac-DYH9A7Emk030th0q5ZIBdpqVCK5_5h-itumg4WB6tp2HxzQ>
    <xmx:QbnYaQD7KWS84hxexkebmK--Lu_Q9jcCJ_WllUGD8fcXBj_LtJjVdnJn>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Apr 2026 04:48:00 -0400 (EDT)
Message-ID: <57b26fb3a720eeb42cb7b549f084b53596a83763.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 00/15] Pull request (cover letter only)
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2026 09:47:55 +0100
In-Reply-To: <cover.1775724198.git.yoann.congal@smile.fr>
References: <cover.1775724198.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-bQi0Rfr9bQ1sLtTLJDjy"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 08:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234997


--=-bQi0Rfr9bQ1sLtTLJDjy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-09 at 10:45 +0200, Yoann Congal via
lists.openembedded.org wrote:
> Those are the patches from the last patch review (no changes):
> https://lore.kernel.org/openembedded-core/cover.1775106968.git.yoann.cong=
al@smile.fr/T/#t
>=20
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3571
>=20
> The following changes since commit f74c948779850a9759d8b24bb83bb661ff85de=
f4:
>=20
>   curl: patch CVE-2026-3805 (2026-03-25 08:17:01 +0000)
>=20
> are available in the Git repository at:
>=20
>   https://git.openembedded.org/openembedded-core-contrib stable/whinlatte=
r-next
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
whinlatter-next
>=20
> for you to fetch changes up to e8a3acb03d4c466cd08e358953df15746cb5aaca:
>=20
>   vim: Fix CVE-2026-26269 (2026-04-02 00:08:06 +0200)

Merged, thanks!

--=20
Paul Barker


--=-bQi0Rfr9bQ1sLtTLJDjy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCadi5OxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bl1aAP0TrQqb1drav3MDDFAr/DL8ntKCRe/mxk2c
s4dDUsknAgD/TC/GkFeX9z/YWEleQ3A7T0J+l32Hl1MnBoF60hkuBQY=
=eKW4
-----END PGP SIGNATURE-----

--=-bQi0Rfr9bQ1sLtTLJDjy--

