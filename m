Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D0CEF4EC9
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 09:10:02 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51245.1775466595486002605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 02:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=T9qmJbQh;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=JObz4f3a;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B70DB7A01D3;
	Mon,  6 Apr 2026 05:09:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 06 Apr 2026 05:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775466594; x=1775552994; bh=t/MKsiiD0K
	YOr9jy2/NXKLO4nbMaNiYAkyxqnx57frk=; b=T9qmJbQheCuB4M5j8UqPi5dzDA
	sMwmfFPZhKY2PMVToh5B0xpurQ0p2MayaIQonJpMXy5qcD5n8A47sY6oOkHnFkjk
	15VrnzBJND/uk7dHsxEdxXPsDq3bZwYSE/V7xD+PNi/0b3bzGt7fB4AC6H8t+eEU
	G88fbcj3ZyTjGjIWMMukzVG1DBD+3p5Rmsvh40lxsUdVmX2DmMZXWHyEMvD2zFfn
	e1D8Z8w3cjuQZiPKfw0AykBvd40TTKZ5U0/s1RpcBAKwV7Rksntm10YSFECb1pxw
	5SXwvlXKo06M2KxdDNU+ZBV+te/WUmGMl34ojD0WnoJ4dnblKFxHfDO8tGMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775466594; x=1775552994; bh=t/MKsiiD0KYOr9jy2/NXKLO4nbMaNiYAkyx
	qnx57frk=; b=JObz4f3a5Ss/c9YzL5Q+oMlcvjoELwSavRG/sK+j4UnQWLwRIir
	fQ97LCzM07pf2h/yOGHdKznPhb/wdrWCB0js9t9vDIUVVYPZYFO4MuZ4/v5zauzQ
	9BN+XoWLBgaS5ly/ZP36ax/D1G6rKc6r2CJ2k+qsTzhlzYYtkyxuy93U3QjrUOMB
	3G2zCmxCKP5DUOUTRvbgqot56NTwcAUwKSfNkAXE4iYOoObB0lf6KwIYS3b6b73/
	zvNwsism9/ozj6I6E4wh53MYzagezR+qd4I/+RPRu1QqrR8nBujvZ6JwRb2v1nsm
	8YMRTrvLaWoSYUUDfOQfMYljGbeIUd+Ctdw==
X-ME-Sender: <xms:YXjTacTHHW5Xh9lgZm5drLP9oeIjFdt2BOuBcW8YjOh81KBbr50OJQ>
    <xme:YXjTafzFa5035t78rE49FSJmaKVywHVHU8pkMsgiVWiXS644J8ciqDQQoOy6RqV7e
    mqQkAWCNeQnY9MY2uQhntkM0_Cpa1e9GNR_oEjPkLDP66r8A2r5VKU>
X-ME-Received: <xmr:YXjTaXeqXBtHY83zy7-RLTpBhuh47HNLLmvrYn1NHio35HTojISgeHROf6QITN_AoJBNZwBhr1bhu7YcL61fzivi8fpEH-Dm1jWadmY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddujeeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecufghrlhcuvffnffculddqhedmnecujfgurhepkffuhffvff
    gjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgr
    uhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpefgudetvdduhffhvd
    efudeuffehhfehveduuedtueevudejieefjeeviefhffehveenucffohhmrghinhepohhp
    vghnvghmsggvugguvggurdhorhhgpdhnihhsthdrghhovhdpuggvsghirghnrdhorhhgpd
    hphihthhhonhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvd
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehs
    mhhilhgvrdhfrhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:YnjTabLHKWfdVDPW71VwQDKzHJ5k4r-czFhYSVJsjVdgs4tXOqKXhw>
    <xmx:YnjTaYFwEtTBGyKKXdUmwHQ3aKPd56KqWoFPKUfZQDhv52-ZHxC3aw>
    <xmx:YnjTaVq4cQ_uH54Cu4UrFm3aC1sx5kqS6jJ2mWL2sEr3iEsRa3GXmg>
    <xmx:YnjTaRQNmZkNBn6wA_n5DWkil-8KwrAz5ZAAd5dKnCDo1HiWEINiAA>
    <xmx:YnjTaY08pTmZmt7HmI0IiQwVc5xKEpngeLqxycnclJvgezw13G8xOmRo>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 05:09:53 -0400 (EDT)
Message-ID: <053f62bc5f48a7ef16d955982e64adecf35714be.camel@pbarker.dev>
Subject: Re: [OE-core][kirkstone 08/18] python3: Fix CVE-2025-15282
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Mon, 06 Apr 2026 10:09:50 +0100
In-Reply-To: <c19d97a63c2b9b145a0370a961cbfef90b450010.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
	 <c19d97a63c2b9b145a0370a961cbfef90b450010.1775435063.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-xulFAybGVmSmB6nNO7d0"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 09:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234671


--=-xulFAybGVmSmB6nNO7d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-06 at 08:26 +0200, Yoann Congal via
lists.openembedded.org wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>=20
> Pick patch from 3.10 branch
>=20
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-15282
> [2] https://security-tracker.debian.org/tracker/CVE-2025-15282
>=20
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

The fix for this issue (referred to as gh-143925 upstream) looks to be
part of Python 3.10.20 [1]. Should we take a final Python stable update
instead of this patch?

[1]: https://www.python.org/downloads/release/python-31020/

Best regards,

--=20
Paul Barker


--=-xulFAybGVmSmB6nNO7d0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCadN4XhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0btjgAQDcz1XzE7BCfROLAq1UBltrTqDyu2FNAcZj
o91rs3DJJAD+JczVgwc01xBhXFxCE5GeuAHjgKH3UOd0mWqh6abddgc=
=9YXs
-----END PGP SIGNATURE-----

--=-xulFAybGVmSmB6nNO7d0--

