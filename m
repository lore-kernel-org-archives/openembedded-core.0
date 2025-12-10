Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB913D3C91B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:39:03 +0000 (UTC)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16951.1765377535534290865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=U3Ykp/z2;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=RCw+PfyQ;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id B58831D00227;
	Wed, 10 Dec 2025 09:38:54 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 10 Dec 2025 09:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1765377534; x=1765463934; bh=148fIuX3Tu
	KbSoQUB2w7x/DmwM9Ua55lVLgM/VVxbCM=; b=U3Ykp/z243wKvnmsvZRH9dG4+p
	F2bl9gSuVV9A+nrZAGiqwgTCrNfBM3gNQPV7aUzSTfycw1MGxwqZf0pTta+RNsL6
	NBHs1g0VYnUWtQBdSuS28NAJc1g9zIEgxTY/Hj5x1Gs5taui8oSDpaE2sIFPuAWB
	1WAuo4TzLP08DM0Kk9wDK7So2U5A256EPrKRlU3httQpaSAMw26bp+wrRX102/O9
	8PRE4tBcFpXPtnzJtsHaJgCuzLObnOOyCGbQlX6b7mEZMqKUz8MInDPiPI3LF24A
	LvXI8iQ2KLO/AhT+Kd9UR2+0ZEkEmy7W5rvbR5R5jn5rUzed5yWVHxtiE/rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765377534; x=1765463934; bh=148fIuX3TuKbSoQUB2w7x/DmwM9Ua55lVLg
	M/VVxbCM=; b=RCw+PfyQTXR3pNXGkIvCqKvmtsl4CYnsIm9SNmQobwjsmIp9mMA
	KeHmDxIStw28i/pkgC4V8QZiVqQUp743wOx9gpPYTcCcusTCU3pJ112oWTC+/omm
	CIL+zb1mY0/ErNcRaY06FNW9zvPLv/3cGgkPdNAVmAyYdppKXOVd33dn98rnT98u
	CeXnSJQAB6o/OWAgX7vBy2lgboYQLKasKyvHWT3YHsliHwyM3t2MZuR/6UO5kAT7
	+ameZ7yYHkISFfCPoY6o98IqkKEPwwkUZXuT8KwWv6KqYQnK/w7Uy37N2y+oKtt7
	M0lj6ZmLLzXLpByO0cZIUyoeLGbH033x7pQ==
X-ME-Sender: <xms:_oU5adNvczRMkAETwh_mInhwOtUhDIQstCBUs_yU0iktsnntZN4fFw>
    <xme:_oU5aV_OtfQrUsf2xeamz--igXsBjq0WIwQNo0phI5wQjtztjp682EqTaLhNrUCyk
    ENNRQWze-wWH3Ks-SNCqav8PVw8fSuLxf7XkPiNk4FJE8vE8btfLxM>
X-ME-Received: <xmr:_oU5aZ4ur14aGXqYUXel-ZHPgHSal-QvAJMGLZ7NHfelbl6c-wOkHwfbZppjYPG5mgo-DmJN1Ko73l9tXR44Nse1mzGVqLo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfgggsehgtderredtre
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeegfefhudethfffveehveekjefhgeffgeeikedtfe
    ektdethfduvdffueeiieetffenucffohhmrghinhepohhpvghnvghmsggvugguvggurdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
    gruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopegruggrmhdrughushhkvghtthesrghmrghruhhlrghsoh
    hluhhtihhonhhsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhr
    vgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:_oU5aU0W-9ms2fw4wkaMblRUN2VGtWmSMX7rXlWdJwKFK1-NBT8HzQ>
    <xmx:_oU5aYAqtKT_pLhsOtwH8JNMIG1HxMwDWTNK526e1eYeFNMJRZUnwQ>
    <xmx:_oU5ae0DfcpCvdj9uq09WRaqLtuNkwjU4MdlnkxV1bQH3MR42dOW-w>
    <xmx:_oU5aatM0ohStOM_sFDsqZ3wflJ5PY3mtTx3jw5WRBtAnhGsX0QlRA>
    <xmx:_oU5aY87LJGVdEcRwEUxty_Xs5WwWSc4oKWL4z8qMCBRStrHWT4FW8pa>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Dec 2025 09:38:53 -0500 (EST)
Message-ID: <658a661c7391d562579964f83e79fbe746ce5ec4.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH 5/5] dnf5: bump to 5.3.0.0
From: Paul Barker <paul@pbarker.dev>
To: adam.duskett@amarulasolutions.com, 
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2025 14:38:49 +0000
In-Reply-To: <20251210110340.3631065-5-adam.duskett@amarulasolutions.com>
References: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
	 <20251210110340.3631065-5-adam.duskett@amarulasolutions.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Famp+QACYfqEWaxVwtjE"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 14:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227478


--=-Famp+QACYfqEWaxVwtjE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adam,

Thanks for your contribution!

On Wed, 2025-12-10 at 12:03 +0100, Adam Duskett via
lists.openembedded.org wrote:
> Completely rewritten in C++, there are several changes needed
> to facilitate moving from DNF4 to DNF5.

[snip]

>  delete mode 100644 meta/recipes-devtools/dnf/dnf_4.24.0.bb
>  create mode 100644 meta/recipes-devtools/dnf/dnf_5.3.0.0.bb

The recipe name is "dnf", but your commit message subject calls it "dnf5". =
When
sending the next version I'd recommend a subject of "dnf: Upgrade to 5.3.0.=
0".

Best regards,

--=20
Paul Barker


--=-Famp+QACYfqEWaxVwtjE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaTmF+REccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnIUAQCfll+LDWe1NoldRkgptQfzPb319Xpfovkv
v15r2DYSXwEAsFe/X4bzPUwhRMDNXdzRF624e20J1U2kWoS9pqSYoAY=
=3rDG
-----END PGP SIGNATURE-----

--=-Famp+QACYfqEWaxVwtjE--

