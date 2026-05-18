Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5428ECD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 17:39:59 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2969.1779125993530724097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 10:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=zAYRUsq3;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=bb3EYhsu;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A35B67A010C;
	Mon, 18 May 2026 13:39:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 18 May 2026 13:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779125992; x=1779212392; bh=pwjEBOoe8B
	6oKUDitEAPJPSw/gTz7ccC22AYY6LYO6Y=; b=zAYRUsq3gpnoFuIhLy5dip6CwT
	O2oVC1X1/neRPH1QCKDXhNLjI9AyhvaEB04oh8bXix6PnY1G8BJDbfDHclBFLB4V
	wMyRr+FbqEDjxEbWt6H/qvTSYAlQTP/kbomrUGxhfv6q+3ZdpVx1yoBZfrDFqDrM
	fZOQFefcBfOZatmSroy0TaEJeCXkZctOAeBqAxKYfo3Y6aNa6AU0uKFRjPFMU1i7
	BqWdma3biiJlxn3xOGrVEGT2KWbpQbGQmUIVlVG79A8mU8SejKZdPNHgJgfVvXli
	zYw41T7LH64eMTCm+t5Xngf5IW0blEI+3p/rLSRmw5+/xwRRfnezDLmmLiTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779125992; x=1779212392; bh=pwjEBOoe8B6oKUDitEAPJPSw/gTz7ccC22A
	YY6LYO6Y=; b=bb3EYhsu9RI5mWysT7brUIMIWN3qXO3//rI9hYkhIM0OccXjq08
	DzPd3H6SB7YXbEBKTeJcYlm28xMlm8xbJNzJbCMAs7KvEZVLQaUv04dPFtvHp9s5
	YH5gwOjTkP2p7VWmXMavMyzjdak/UZiBiK+UrqtiI72T2y3g124ZmgwWqFJY5XFE
	lZtYJzvPErebZUjm2+X3OM3RDFYgGqNSOrX8yiHWUK+uPMdg6Dfb690+EiB5upkb
	zfT+pHWUc+B5Un/InUyddeeDhZpXBznPMrtuY0+1NZ/i9NlWZFNplo9T2BNwNZvB
	hhm8vMib1OeGF9Ru9g3d4QOEOLZWQCxnYYA==
X-ME-Sender: <xms:504LavLt0IaEIiEX6nfSmerEEf67WeNMZBjDOnBZDuspAUcDtMkP6w>
    <xme:504LaqJ8A7eQXbhQChk4irlPJUQ3Al1Q5s8x15IgCC4M8c0cM58S5j_Y_nanmLkhp
    3dcJpepJCToWu1fETzjEEdoOf7E-HPjc4CSjzf9K3hKlzE4zk-EhPc>
X-ME-Received: <xmr:504Lasuqt90Uu9rWXpsqlhpL_jYIseqvDOOO_p9o_aWKlYgQbv8A3MsxOUkfS3-B3G5nhshgBJEgkfnSiKDo_n_v3XnhEg853KKnsqzG21Ze>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeelgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeffvdefgeevkeduhfetueehhfeikedvieeufeevieffueektdeluddtgfegveehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdprh
    gtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgv
    mhgsvgguuggvugdrohhrghdprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguth
    gvtghhrdgtohhmpdhrtghpthhtohepvhhinhgtvggptghhrghnghesrghsphgvvgguthgv
    tghhrdgtohhm
X-ME-Proxy: <xmx:504LanQo6sBMCUvCN3rzXX83fvyCwbpojmKxemoN3-UghnCjlQq_Vg>
    <xmx:504LaiOnPBQ78b5xTroE-Eaf0QpMUkgUA10AWgAE_NmdAh2stcZTVg>
    <xmx:504Lasbp1thaQOrxvP1x0m1X6Ptv0zN5oqjZ2S0WghCHxQx7MeQ4Hw>
    <xmx:504LasyA_CcaecpYZGrzheJ4euxC3oPHX6-nX3nytEz4yv9gRzEk7A>
    <xmx:6E4Lat436wlUI7cfO4f47r0yAlgAR7U6hwao_nqj6ZEok9Hy9h4iaFux>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 May 2026 13:39:50 -0400 (EDT)
Message-ID: <f8757960b4f15bf66d30fad45ab7b0a1512b036a.camel@pbarker.dev>
Subject: Re: [PATCH v1] kernel-fit-image: Check signing key files based on
 algorithm
From: Paul Barker <paul@pbarker.dev>
To: Jamin Lin <jamin_lin@aspeedtech.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Vince Chang
 <vince_chang@aspeedtech.com>
Date: Mon, 18 May 2026 18:39:47 +0100
In-Reply-To: <20260515094251.433364-1-jamin_lin@aspeedtech.com>
References: <20260515094251.433364-1-jamin_lin@aspeedtech.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-alL+wGIqr2lb7bXkK1lG"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 17:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237254


--=-alL+wGIqr2lb7bXkK1lG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-15 at 09:42 +0000, Jamin Lin wrote:
> The key file validation in run_mkimage_sign() unconditionally required
> .key and .crt regardless of the signing algorithm. This prevented ECDSA
> signing which uses a single .pem file.
>=20
> Extract the check into _check_sign_key_files() and detect the algorithm
> from the algo string (e.g. "sha256,ecdsa384") by scanning all
> comma-separated parts so field order does not matter:
> - ECDSA: requires <keyname>.pem
> - RSA  : requires <keyname>.key and <keyname>.crt

Hi Jamin,

This contradicts my understanding of cryptographic algorithms and file
formats. To my knowledge, ECDSA & RSA are algorithms, PEM vs .key/.crt
are file formats. You can have an RSA certificate in PEM format, and you
can store the key & cert for use in ECDSA in .key & .crt files if you
want to.

Am I misunderstanding something here?

Best regards,

--=20
Paul Barker


--=-alL+wGIqr2lb7bXkK1lG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagtO4xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0btUKAQCSI8Qfj2IvPzLOo2CkyxrMLjBtKi83G12T
iBW+ZWZiUwEAiVuUi5zsDtcEdkeLWKEokOu9ieQy7A9CrsyZagdRGgQ=
=8+iN
-----END PGP SIGNATURE-----

--=-alL+wGIqr2lb7bXkK1lG--

