Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D41CD4F52
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 08:33:45 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17041.1779179605170263510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 01:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=oMFYzKzy;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Hl1uuao9;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 33AAEEC023E;
	Tue, 19 May 2026 04:33:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 19 May 2026 04:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779179604; x=1779266004; bh=GodOmPzPw7
	XZlotkevce7fDq8dT2P0NLVJ53arl+nV0=; b=oMFYzKzyhksrrpKczx1K2TyS+h
	gJpKHRLGP9egQ887fNXYVudsINfDcAQFa9iGRK4dB+q2tqp7SWUHRBxnc+76zdMx
	Xr4hUaDsD0peBsKNjL7shap9U9o/PIka2/PW7SY0tXig1MXs1wPrBpfi5whkxxdR
	dAQhlpq9JPcjLdZgXnQI90EsynLnNpbbe+PiLxFFVLswZus7/prnEPpDYHVA9G9Y
	P6hW6687wUbQpwQ3ooY+c+9QCfzdnvIhASD0GJVyMhY48DdcCjlGE+W73sZVUER9
	NNW2BJLrzBl308l4D8R7YHXYj7CQIE4kjvePMzpv/oW7suKYFxoaGR3Pm2Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779179604; x=1779266004; bh=GodOmPzPw7XZlotkevce7fDq8dT2P0NLVJ5
	3arl+nV0=; b=Hl1uuao9SmLlYp9vC/knrxF1MctB+Hzw13pcbyWxAkqFa6j9dYi
	eC0PfyFnE5xVPxb8mgsrh6k+f2AySfKxuOaIMMV15oiFfJB06IbIwa0PSrRenJ21
	dSUE953jwoQZyiIgq5ps+OfoWgtThB0jNS52++X7NzCWOL3uLhJEPYQ8IclvUeFH
	i+7pNL1fnW0FJ+LE/O3ASApK8cpgVaIVbRGE5eh82ejY4sxa9AS6KLx+zm+E3iDL
	3jwUEpkFzbdKL18p6XxLzbk6f4ct9lulVcX3sYKUCj8EAM+lOrtuBMr1qvkR1N0g
	+wkt0sD0vC5KyKQSt5j+y7Y/ir5IViSnO9g==
X-ME-Sender: <xms:UyAMasVC6p13HxFWvgDPtCWNGXcgKQb8LZq2mGtkn5xik1MqjtlDpA>
    <xme:UyAMandShDOQYZpp-sSyNM44cN1q-4R-dkTcX7Ll0I4i4roOE6CV9LR83Q8yd9E3Z
    Izc5QU6KwXt0FwtdX6ujsXS4pyV1wyTd5CwEbIbFbKfQCjvcomwVQ>
X-ME-Received: <xmr:UyAMaouZNKz9v21yD82SDRS2WJrfl_0oyITP61qGXqKttEcezWLzrBZ1SxPU7Xbt47fyagtWXQV9PAuCHhLfpdc6Rvkg8enlxmdZDuYwDoDX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeduvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    ephfekhfeugfelfeeludellefhkeetvdffiedttdeuueekhfeiudeivdefueehuddtnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprg
    gurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohep
    jhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohepohhpvg
    hnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdho
    rhhgpdhrtghpthhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdprh
    gtphhtthhopehvihhntggvpggthhgrnhhgsegrshhpvggvughtvggthhdrtghomh
X-ME-Proxy: <xmx:UyAMam9sHTBuGZs-DPwbvfgQW208A0y17pgI4VroqQlYNVOCMu7VKg>
    <xmx:UyAMaj2iXFnBwkeHGTAgrbEl_vJaQN0GK2nMVJujd2adumHwnLLfnA>
    <xmx:UyAMarA7bMDj5QHUK9tngTtWwmGQo1q4Zq4ziHA58DpmzOUfX1ROfg>
    <xmx:UyAMavfRLig_FAzXNgpdduz-HwiV0RA0Z5CJ8LUaepjAmPTqou3g5g>
    <xmx:VCAMalgZPg1neRMBF51sm4gJRKsJ4XhSwd5A4udWxLMQRKwn8E0bkevG>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 May 2026 04:33:22 -0400 (EDT)
Message-ID: <6ced517cf6e836d0cfdadcab83cc595317b27cd2.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v1] kernel-fit-image: Check signing key files
 based on algorithm
From: Paul Barker <paul@pbarker.dev>
To: adrian.freihofer@siemens.com, "jamin_lin@aspeedtech.com"
	 <jamin_lin@aspeedtech.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Troy Lee
	 <troy_lee@aspeedtech.com>, Vince Chang <vince_chang@aspeedtech.com>
Date: Tue, 19 May 2026 09:33:19 +0100
In-Reply-To: <ee619ab87ee5000ebc6aa4ffbd66a46f406d5c58.camel@siemens.com>
References: <20260515094251.433364-1-jamin_lin@aspeedtech.com>
	 <f8757960b4f15bf66d30fad45ab7b0a1512b036a.camel@pbarker.dev>
	 <CAB3asfiuneQrWbw28UeBf_+63xyuGdM0F6GdKE6wa+sSPoKqRg@mail.gmail.com>
	 <TYPPR06MB8206B723A776C8C292BE4876FC002@TYPPR06MB8206.apcprd06.prod.outlook.com>
	 <TYPPR06MB82067560309D2AE88ED0DD62FC002@TYPPR06MB8206.apcprd06.prod.outlook.com>
	 <ee619ab87ee5000ebc6aa4ffbd66a46f406d5c58.camel@siemens.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7JAeSASUmRo2iurqoC/0"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 08:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237291


--=-7JAeSASUmRo2iurqoC/0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-05-19 at 07:34 +0000, Adrian Freihofer via
lists.openembedded.org wrote:
> Hi Jamin, hi Paul
>=20
> After looking into the code of mkimage, I agree with the patch. It is
> correct that rsa-sign.c needs key + crt files but ecdsa-libcrypto.c
> uses a pem file.
>=20
> My conclusion is: The patch can be merged.

Hi Jamin and Adrian,

Thanks both for the extra information. I think the commit message and
comments should be updated to say that this is due to the formats
expected by mkimage and fitimage.py, then we should be able to accept
this.

Best regards,

--=20
Paul Barker


--=-7JAeSASUmRo2iurqoC/0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagwgTxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnHIAQCwJRxtImaXO6QVIYhbebNB1mgPk6lebU98
6OsYmnh8HAD/QvxMZdpfdCi3vwVIhcoQJ9Hjgi+D5dJnrJCei7nXgAk=
=y6sg
-----END PGP SIGNATURE-----

--=-7JAeSASUmRo2iurqoC/0--

