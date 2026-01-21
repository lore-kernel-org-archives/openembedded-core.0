Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD98AD46943
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 14:47:02 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13319.1769006818848956980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 06:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=fz73Jqvk;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=pYW8ZFMU;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B9166140014C;
	Wed, 21 Jan 2026 09:46:57 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 21 Jan 2026 09:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1769006817; x=1769093217; bh=Ycdl+vRR7p
	sf4z4wLQ3JOC/MDOfdShSKL0WLQzU3+LY=; b=fz73Jqvkvo/7JEoqK3/9s+6XcF
	fRS9c7iRVxF2ATwVRfj6Gz0foZ14bm6gbXSRw0AjMmCfKyD8IW4BtSOosxFXHSUW
	37cQiK+FFTepkI3YVxbem9GvCSfdXsqgEKUMB2fFMVteCZn/uB9bzeJYliqy/e+z
	9nYW/t19JXyt3M4EV3RGZALYaSRbgaNxpeosp8lUswymydmKQJiL/vinb6BwRHOc
	HORvqpHvdFk3G+ihLAKTYCdCJAQQpiQ9oJ4jHqxgsYaLJ/C3RNOidCxX7bUDZz1a
	zb0SW+vy2ZcVvRvHRuyEEr+GTtw7cf6jFCqhEIwvvBbj5hJLiol7dWi2wtcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1769006817; x=1769093217; bh=Ycdl+vRR7psf4z4wLQ3JOC/MDOfdShSKL0W
	LQzU3+LY=; b=pYW8ZFMUL5uGCaznaT1k48F4XpOxLjeCNja9zL8P/nHMZ3ei6dd
	qaPe87Mdfw/ObViIK7P6Ewwxtic6dmOqsKFN6luYr1hdt99pQaMRfA+duRChqe3c
	vc8zJMvseb588S5USyEuVJHYszxOliZpXXLyNifdURSAWdyyhUEBCXbmXw6zStou
	kgP1WDBH6tz+si8P3M4DmOp5kh9fpeq4rSTSknYCLqhOWU4onPL2b638h1z+RN4j
	BBtZXFwJjYvApbcPS0davirlhVIPkw8gnsZ8dXv43Q8g3DO41/VsHls0SpxD8jGf
	b06J2QEBgFCUoqaY2/awuQe8FhS6K2rfG3w==
X-ME-Sender: <xms:4eZwae2qMNWqCWgqb3vT9Sc_vbp0TrixMBfxp3ciCjKvG60byyb_9Q>
    <xme:4eZwaYisl0mipqyW8-V_ATpf_YBNRQd7buOmeMSNyrjiZqCCqUfRV4mPJ4zuh4Igi
    bHfjH0erDgfiwSf5fY7JZbo_JJ-tcBQnF69Dzl0Oh0QhxMoNHf1cw>
X-ME-Received: <xmr:4eZwaUSudMzaZ3Krrk52cyEpyz3iVIdXz9t9C-59xqvP1vQ8kuCiULORBBkvdNAxc0n29HuwUrV_WbAoELsQn7BNgwrJuGSnrxoaffM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeefheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpefhkefhuefgleefleduleelhfektedvffeitd
    dtueeukefhieduiedvfeeuhedutdenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeefpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehhvghtphgrthestghishgtohdrtghomhdprhgtph
    htthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgs
    vgguuggvugdrohhrghdprhgtphhtthhopeigvgdqlhhinhhugidqvgigthgvrhhnrghlse
    gtihhstghordgtohhm
X-ME-Proxy: <xmx:4eZwaZjOuWkhJs9DIBFRW6phXi6ycj2UScuiIiZ92m0v2W-2HZJgIw>
    <xmx:4eZwaU4CO6L5jB6fdYXIOIY-JYJTELoKuV5R40nUR6HctBlchQvDzw>
    <xmx:4eZwaWCQq-UlbM0pxi4CCeHRseaqoAKvvb6O4HQNSKAOhyrQlZI8-Q>
    <xmx:4eZwabbCFbQVV7lky8lEzM2irhgaGVdDlCHiyOgFT6cXAK_eli0COQ>
    <xmx:4eZwaZJU_O6aJ0u_XP8nEnU04GsXYpbk_-cg-kcq3Y48yHuBiNVbYCf_>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 09:46:56 -0500 (EST)
Message-ID: <a0397d55c2a7d9f21a237817c62d48a198ff913d.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2] cve-update-nvd2-native: Use maximum CVSS
 score from all sources
From: Paul Barker <paul@pbarker.dev>
To: hetpat@cisco.com, openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Date: Wed, 21 Jan 2026 14:46:52 +0000
In-Reply-To: <20260121100832.448281-1-hetpat@cisco.com>
References: <20260121100832.448281-1-hetpat@cisco.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9kr5FC16Z2J6pq/nKfXM"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 14:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229814


--=-9kr5FC16Z2J6pq/nKfXM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-21 at 02:08 -0800, Het Patel via lists.openembedded.org
wrote:
> From: Het Patel <hetpat@cisco.com>
>=20
> The CVE check system was incorrectly reporting lower CVSS scores when
> multiple scoring sources were available in the NVD database. This
> occurred because the code only extracted the first element from the
> CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary
> source with a lower score instead of the Primary source with the
> actual severity score.
>=20
> This fix iterates through all available sources and takes the maximum
> CVSS score to ensure the highest severity is reported.
>=20
> Fixes [YOCTO #15931]
>=20
> Signed-off-by: Het Patel <hetpat@cisco.com>

Het,

Thanks for the patch!

Why is the highest CVSS score the correct one to take? I think the
commit message needs updating to answer this or point us to a relevant
reference.

Best regards,

--=20
Paul Barker


--=-9kr5FC16Z2J6pq/nKfXM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaXDm3BEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhIMAP0Y1b5WWf2sZ6GVWI8xxLVtk4p95WDdy2Oc
qJoyjuDBnQD+J+P9hRZdG0AElUZmJbkwBk7n1EB4gixHkbaYJOtShQU=
=CwdD
-----END PGP SIGNATURE-----

--=-9kr5FC16Z2J6pq/nKfXM--

