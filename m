Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6807BD6ACF0
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 11:47:04 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40111.1766058420945084286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 03:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=YNXuTtKO;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=qt3rCkvy;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AE8887A01FD;
	Thu, 18 Dec 2025 06:46:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 18 Dec 2025 06:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1766058419; x=1766144819; bh=94LsRixIZv
	rSuvxePDgc0dfgZTOqg7y7KgVcQeeV3KM=; b=YNXuTtKOrYJJrVUPWoW6S062qW
	HfeccPtCinJsWXij1AEVnTFY/bQfmH2LP2WKN9q2/ne+AVSeBd580YTHi5Ce0CFL
	poU4B+4YY8w6rJGt5XwU7u0rLDOIHoUaBcpWgk8YEuA8MZbXAqciW/CzoEqtNGzE
	ZP0gmOFHOk1lhRKXoiOIm1VOshxSwY1io1dX3x9Qr0pqK8BDnSw0PWnepbtRulgo
	RgaBAAc8NPnM9l4lgRL5aq5fIyMYNyljNiPKeOBuGtJf99IoJTxUNB3xfz4/TArU
	cUIivRXN/uJl3Bif3Ws6Y1gqqJQ048aqp8iLciMvptroD7bUkb7zx1ZPMTxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766058419; x=1766144819; bh=94LsRixIZvrSuvxePDgc0dfgZTOqg7y7KgV
	cQeeV3KM=; b=qt3rCkvy6KZbJdnxrL6bu4f9WldJV5x5N+r3T211M77Mh3qggio
	NcLx3iTKbpURI7pFr+BAE7AgCtrXmlYRgc8mn86xHJo9R8ozJXQdRQUE8c4iJ6Df
	4OF7pjKpi9h01xU8ukTlDlmwZjtVKMiM0wbd2KmaxByNUhZ9rar36vKVCYGVEFWe
	9EMENlsobTEc4kmHAX0jeW9Esiml3n1PhLEsstwsRqpMSw66JjBi4wFfQhZWGjK3
	a/KsaHYMIKuu0GktorHNAy3vHFqLB5dwbUGRfdKLGZcLw5NwgVyFhQcB7WvNeKS9
	QPFkz3Pg3CkKi1R3LQ3FJ1A+Ptv4FD+cG7g==
X-ME-Sender: <xms:s-lDaScmd2dTGPJFViPi-QjMi1uNeKNeYvRgMOEiP5peWXP9cVpbPA>
    <xme:s-lDaSPoifBWGDHPVRaL0DPELfLL_mjg3cC5_NmXvI8MXcAA_KsrsrLpF6q2JiP3b
    TvV3A-FAc-AwVQYMgwboSuyrtkVcRbLthotphvOpFzz1pqqSM8>
X-ME-Received: <xmr:s-lDaRI_1N-WTJZq9RF5TFQSDo_NXkqj9hKmGVaPUHI8IjhcJNFwEMHx6XVGL9JsJuxuzsDUHEWoagyvxZaiIy8wQulVZgVx8pJ298apTmT_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfgggsehgtderredtre
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeegfefhudethfffveehveekjefhgeffgeeikedtfe
    ektdethfduvdffueeiieetffenucffohhmrghinhepohhpvghnvghmsggvugguvggurdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
    gruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopegurghnihgvlhdrughrrghgohhmihhrseifihhnughrih
    hvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhi
    shhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:s-lDabFPe-aDW0hJ62YTdcUXVJgT9UIEq4a036c8SuoT3zJLcwGiIg>
    <xmx:s-lDaRRyDMviB7GZiU4UGOhwNROJ4m-mKPg93SpTzyG2mg9n810TpA>
    <xmx:s-lDafF10sLoRn0d43QNubqW-STZ_u_il_EndiiBkDvRpsu-EN2N8g>
    <xmx:s-lDaV9wU50erD3oHOsCCnb5p96EwTQvzdiOCVkEoGmLnb9T2Yduag>
    <xmx:s-lDaf9jCCmc3shn9NPdEkQxYd7sya7BpqK_CTiwmGNhtdgfMqH4M7qx>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 06:46:58 -0500 (EST)
Message-ID: <a77d83f822d4431d08307570482ebd024bcc5238.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] wic/engine: warn about old host debugfs for
 standalone directory copy
From: Paul Barker <paul@pbarker.dev>
To: daniel.dragomir@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 18 Dec 2025 11:46:54 +0000
In-Reply-To: <494e78c31feaaec6cf5c4c96ad3cbf45ac19dd5d.camel@pbarker.dev>
References: <20251218101524.703244-1-daniel.dragomir@windriver.com>
	 <494e78c31feaaec6cf5c4c96ad3cbf45ac19dd5d.camel@pbarker.dev>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-wa+dnRj3mjhRcAmB6ba8"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 11:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228116


--=-wa+dnRj3mjhRcAmB6ba8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-12-18 at 11:34 +0000, Paul Barker wrote:
> On Thu, 2025-12-18 at 12:15 +0200, Dragomir, Daniel via
> lists.openembedded.org wrote:
> > When wic is used in standalone mode, it relies on host tools such as
> > debugfs. For directory host->image copies into ext* partitions, wic
> > uses scripted debugfs "-f" input with multiple mkdir/write commands.
> >=20
> > Older host debugfs versions (< 1.47) may behave unreliably in this
> > mode and can silently miss files. This does not affect builds using
> > debugfs from OE where the version is known to be sufficiently new.
> >=20
> > Add a debugfs version check and emit a warning when an older host
> > debugfs is detected. The warning is shown once per run and does not
> > alter execution.
>=20
> If the risk here is silently missing files, resulting in a corrupted
> rootfs or worse, I think this should be a hard error.
>=20
> Consider the case where someone relies on a device having a firewall
> enabled, but /etc/nftables.conf is silently missed during construction
> of the rootfs ext4 image. That could result in all ports being open.
>=20
> On the kirkstone branch we have e2fsprogs 1.46.5, does the same debugfs
> issue apply there or has it been patched?

Also, do you have any links to upstream bug reports or the commit(s)
that fixed this? I can't find anything relevant in the recent e2fsprogs
release notes.

Best regards,

--=20
Paul Barker


--=-wa+dnRj3mjhRcAmB6ba8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaUPprhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0biX/AP9PZpDJyGUVaDpctnvNYkjBevYPRVUrW3ki
wla/aRC2OQEAwq+XsKz5Oec/b0Q7LuXJ1gs69Re4DwfVEXx8SHa5AAo=
=KJUE
-----END PGP SIGNATURE-----

--=-wa+dnRj3mjhRcAmB6ba8--

