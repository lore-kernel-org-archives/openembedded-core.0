Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC11DF33A62
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:47:23 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44421.1772718442733508040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 05:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=pMVFjUuS;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=KTzFgMGM;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6C6947A01D9;
	Thu,  5 Mar 2026 08:47:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 05 Mar 2026 08:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1772718441; x=1772804841; bh=Gl35xPtCTm
	FaD0nBwKCsMV0IKFCX2Wye1BCQTHphjdo=; b=pMVFjUuSLGWGYHGGrwspKGzvRt
	xxZr/aZOyvfIh6ISv/RX/kBo3z86hQ72uBwZuWUYC9jfDS5l728m3QPP63K+Up4R
	tUf/QD1+i+uTJT2WwxLW2VEnLco0kdM6HnYzRG1N0bIH8NQA/crMIJfDgjqrXry8
	GyxLR3x+IafIrkZp7MYV/CyWd62nuvTFhzh4FVS742JW5FSmyxX7B2tN2H6Zaiwd
	GOo/pEsvXkJNkK1C5GAlTl82IE6Q4SCKupWRYyVIEvJfytEaFfseOaxAbFtDs+8e
	XlKRZLPvcCq2wK4PLBh8tNbr3xqM86EyTcohPBpogQqASevywRkkCDrI9EtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772718441; x=1772804841; bh=Gl35xPtCTmFaD0nBwKCsMV0IKFCX2Wye1BC
	QTHphjdo=; b=KTzFgMGMKg3wayLaWnSIlSOOfHscB+d1fspveZattjfgAz20nKF
	km6NwmC3MaX+s5sF8TE9LBgyqwwbGCWw2ychwI7LghFBowqH8OIi19+HwHytqzi7
	LWtg5vVWf084V+USy25w5K/xTEFhV8ycx64N7hidHCxKMlZyDgbIHgULTWxrYNV0
	lJpEjKT5zNPSUuOPUmwglzy/Syf1+6MtQZVOQCPuLTEEGj5KH/ur/orCrmsLrJyr
	qDKz29nnLkSwRddiFGyfUfdvQX9gheNU4dGho0eVvGM6x9z0cKgN59Fnh5QlOlnh
	sT+Tf6xoqYUWKoTwj9vtY/wm8MvWGpP+Faw==
X-ME-Sender: <xms:aImpaV5XOC826RkDDb3dY4C6Lcd0QcOaT_iDE5qBJflBHLwNVB3uuw>
    <xme:aImpaVeH1_pKE7l9kJ5dFFi_CMExTgPObQ9mrENVa5udnPpZkYHYOtEGVb9km4nsj
    6XwlsqiZIxZAbLM67LyqHph66QRH-MT7Xb-12b5eExRKX81H_Vc>
X-ME-Received: <xmr:aImpaQGfri4lfZFLbNZ4T5ptieSn326TCvn0k72gM5M6lmDRyhlC4puWV-tuTx0CA5LWPE8bSfDwtbZNITKchdNYRe68ybaM_tcICdKxVJNO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeiheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpefhkefhuefgleefleduleelhfektedvffeitd
    dtueeukefhieduiedvfeeuhedutdenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeelpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegsvghnjhgrmhhinhdrrhhosghinhessghoohhtlh
    hinhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhs
    thhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehrohhsshdrsghurh
    htohhnsegrrhhmrdgtohhmpdhrtghpthhtohepphgvthgvrhdrmhgrrhhkohesshhivghm
    vghnshdrtghomhdprhgtphhtthhopehjphgvfihhrggtkhgvrhesghhmrghilhdrtghomh
    dprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtgho
    mhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
    dprhgtphhtthhopehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhl
    ihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhoth
    hlihhnrdgtohhm
X-ME-Proxy: <xmx:aImpaeROrUMJZijeRj-gCl_4DurlRGy__xZ1ySwErXmV8dOzb3hofA>
    <xmx:aImpaeaeW3lcKGtbvAXEtSkFkmQzgWjAiczFd21lLaOa0h0lKwzcuw>
    <xmx:aImpaR0Cb_6HXM30X8RbsTdhSb-UKCtNAYS96Mi0_X6cctu6Ofj8uQ>
    <xmx:aImpaZrw7PLMH1tnRn6VoD16AiGbhytK6x7LmCDb7Y4GzlELEUmMfg>
    <xmx:aYmpaYaVgf2dI8k5px4KfoEesToF8_V4VTztm7xmHuQlHq74BLlI5zoj>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Mar 2026 08:47:19 -0500 (EST)
Message-ID: <8fae3195a70bb6b43872b57cb27b6197c08744b8.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v3 6/6] sbom-cve-check.bbclass: Add class for
 post-build CVE analysis
From: Paul Barker <paul@pbarker.dev>
To: benjamin.robin@bootlin.com, openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
	olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com
Date: Thu, 05 Mar 2026 13:47:16 +0000
In-Reply-To: <20260226-add-sbom-cve-check-v3-6-2e60423f4d35@bootlin.com>
References: <20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com>
	 <20260226-add-sbom-cve-check-v3-6-2e60423f4d35@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rgYvAV4Ls63k5tQg18A0"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 13:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232491


--=-rgYvAV4Ls63k5tQg18A0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-02-26 at 18:01 +0100, Benjamin Robin via
lists.openembedded.org wrote:
> By default, the CVE databases are downloaded using the following
> recipes:
>  - sbom-cve-check-update-cvelist-native.bb
>  - sbom-cve-check-update-nvd-native.bb
>=20
> The database download logic is implemented in
> sbom-cve-check-update-db.bbclass. The CVE databases are stored in the
> download directory (`DL_DIR`). Access to the database is managed using
> an exclusive file lock (`flock`) on the directory. During CVE analysis,
> sbom-cve-check acquires a shared lock, allowing multiple analyses to
> run in parallel. However, if the database is being updated, any
> ongoing CVE analysis is temporarily paused.
>=20
> This design ensures that, under normal circumstances, sbom-cve-check
> can run without requiring network access. If a user needs network
> access during execution (e.g., to download annotation databases),
> they can set `SBOM_CVE_CHECK_ALLOW_NETWORK` to "1".
>=20
> Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>

Hi Benjamin,

Patches 1-5 of this series were accepted, but we had some concerns with
this one.

We would prefer not to override do_fetch for sbom-cve-check-update-*.bb.
We should be able to use the standard git fetcher here, with a hardcoded
SRCREV to allow offline parsing to succeed. A config fragment should
then be defined which enables the sbom-cve-check bbclass and sets the
srcrevs for the update recipes to ${AUTOREV}.

Running sbom-cve-check offline should be supported, but manual config
may be needed to set an appropriate srcrev. We should provide an example
of this in the docs.

We should also be able to avoid setting do_sbom_cve_check[nostamp]. With
dependencies set correctly, this should only re-run if the image changes
or the cve database has been updated.

Best regards,

--=20
Paul Barker


--=-rgYvAV4Ls63k5tQg18A0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaamJZBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsUyAP4oBD23gfZRzX/FumoVNPb8VWDk1IWD2twQ
ndybzXFivQD+LX5jxwlt1NioVDfao2aLjuZ2b7N7QEDeFbvwK/aW8gM=
=g7YB
-----END PGP SIGNATURE-----

--=-rgYvAV4Ls63k5tQg18A0--

