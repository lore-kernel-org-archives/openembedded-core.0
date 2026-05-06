Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C0ACD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 08:33:57 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13828.1778056432764758457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 01:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=oA8wq4vM;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=cZujmghd;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id C1B56EC011F;
	Wed,  6 May 2026 04:33:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 06 May 2026 04:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778056431; x=1778142831; bh=4bmr38OrCN
	eKBRGVEc/nfynh0dyod4x98yVHdGdfO2k=; b=oA8wq4vMpGLCEH2ZS9jaeFyqGA
	bzOi9LVvT3Z7oeXujFLV7+zAiOjyu+2K4Cq40yIYc0qd32iha/yZGnyCQ5ZEQvgF
	Du7Zk8+FIdd42FMVE7QBeZMOYQ+K4wREsxezKKxlfM1llqMADWAYG3d6httKaBZL
	ybiQgHN3wA0BPyBAkFU9jYBl2TkzYZKePQtTILnTXnKuO0UCUCrqjlcu27rI94gw
	0/dzPIbw26OqbMCSTkH/5POUssU11j16ag8WmmTum8XMG78hUDo0UpV+uJ0bC3Tv
	O2fWpmnmG4p0/d7Nus/Eakg8FTy0dsrzGRh5TmqXKm4a3b3wkvbBvx2MJ47Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778056431; x=1778142831; bh=4bmr38OrCNeKBRGVEc/nfynh0dyod4x98yV
	HdGdfO2k=; b=cZujmghdj6R65w8rkuXQ+m1UaMtlSYLC1wOoGf9/AJzXPYcGKbG
	A5T8+g4Unp6CtTF8se009iyYk/+HBbfpW9yPJ2T7D7pF5rNqa582iuel8CJRkuwn
	fzmWNVTzS+hPr0gNJfKpkwmzFWikCDya20RnqhRH4EWmegBDak0NGsDXxEin2uSl
	31YQZOHHNbOQu8hSY7yngiwPEuSBmCduV0dAOt+ostLV/HYtkmwONDrOH/XL3Rnd
	k4UGk8i1E8kEcLLSTKQcWTmo5krIm/dphO1crDvdctULn4zOBm1dtHQcP4px/lv8
	cxnq+wkFLM/qWV452WFiDSB5+jOADD0OkgQ==
X-ME-Sender: <xms:7_z6aSjNduch3m-h3lLmsN62ARRQVXKHOmsKRaqlxziUjCyLq4kCEg>
    <xme:7_z6aZDpWvPxWWqhc0axFswYhIy7cfXAcmvQMfR1F3hQTNvDyzY3xr_tQYEsqyFix
    lEXc_eOHMbb5LJoCJHPJtNZ5dwYt-g7i83dUaKCfpfgya7nYfnTGIw>
X-ME-Received: <xmr:7_z6aXvIlbA0-0Ul4hfY9YkqYTbP7yMcitX2fL8HGX3E_UuVnLhcol_078b1-yUzGiUOPgFEih933qww9tCu-kOX_EFdpYWq7MB56cQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdeguddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepueegtdeitdekueehvdekffdujeetheekgeevgf
    ejffefieeuleffiedvheehheehnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpugdqphihthhhohhnfedqrhgvqhhuvghsthhsrdhshhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdr
    uggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
    pdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvg
    hnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:7_z6aWYnI2Xso3j_pOQaTyN5PWz22hFTSMuDRnirMi-1FdWIsaMbhA>
    <xmx:7_z6aSXoK1WKxu2_VVQwE7WVxHbaBXfwdG-YljrqXv45s0MAxv_Txw>
    <xmx:7_z6aS4B92vi3vHvm5mdFzysvft2R0Al9Nsht62Omo0Klqo0ZDDz8A>
    <xmx:7_z6aViHN7lXhEXb1Fx2MM0e_S_I36CjAnoZUd9crrpw4uDRfwNGMQ>
    <xmx:7_z6adkkaupohY2muSurT5iKUVJwZB4FpfgvKeIgJbIFmDeNODT6qtsm>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 May 2026 04:33:51 -0400 (EDT)
Message-ID: <5e34a6274b6062a0e1b2b05524e48589501f0c6f.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH 46/62] python3-requests: upgrade 2.32.5 ->
 2.33.1
From: Paul Barker <paul@pbarker.dev>
To: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Date: Wed, 06 May 2026 09:33:48 +0100
In-Reply-To: <20260502162929.1377831-46-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
	 <20260502162929.1377831-46-richard.purdie@linuxfoundation.org>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-A2JEfUqvf9CuU4r4LJOn"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 08:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236534


--=-A2JEfUqvf9CuU4r4LJOn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-05-02 at 17:29 +0100, Richard Purdie via
lists.openembedded.org wrote:
> Drop backported patch now included.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

[snip]

> diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/me=
ta/recipes-devtools/python/python3-requests_2.33.1.bb
> similarity index 82%
> rename from meta/recipes-devtools/python/python3-requests_2.32.5.bb
> rename to meta/recipes-devtools/python/python3-requests_2.33.1.bb
> index 3477a5d83e9..f9c1f1f8ee9 100644
> --- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
> +++ b/meta/recipes-devtools/python/python3-requests_2.33.1.bb
> @@ -5,10 +5,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d7=
10fecd0a2940a0d1658"
> =20
>  inherit pypi python_setuptools_build_meta
> =20
> -SRC_URI[sha256sum] =3D "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a889=
3c3af500cec7d7cf"
> +SRC_URI[sha256sum] =3D "18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e=
307ee8f4250d3517"
> =20
> -SRC_URI +=3D "file://CVE-2026-25645.patch"
> -SRC_URI:append:class-nativesdk =3D " file://environment.d-python3-reques=
ts.sh"
> +SRC_URI +=3D "file://environment.d-python3-requests.sh"

I assume this change is intended, environment.d-python3-requests.sh is
only installed for nativesdk anyway. It's worth a quick mention in the
commit message.

Best regards,

--=20
Paul Barker


--=-A2JEfUqvf9CuU4r4LJOn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCafr87BEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bvYIAQDn+7sBk3Hu9ofIrS7MSsIF8YyujgWvMhvl
Nww6ObnyCwD9E56vbccJeePEVlk4yxn6lfRgB+zNWiNkr5ggv08FIw4=
=9iPI
-----END PGP SIGNATURE-----

--=-A2JEfUqvf9CuU4r4LJOn--

