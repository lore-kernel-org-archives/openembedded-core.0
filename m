Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC85CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 10:22:02 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14588.1762251711591140323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 02:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=nsFgDqqu;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Vthor7/7;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 87D75EC01E5;
	Tue,  4 Nov 2025 05:21:50 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 04 Nov 2025 05:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1762251710; x=1762338110; bh=vE/ktWRFAg
	zLmrJFxyHjT0YWFc84HQzny5i111ajCqo=; b=nsFgDqquhIyYOv5ccmeKXdrxEj
	Z6xEkAcEauASV4a1gkzPEi+rgdeDS5nWXjTMipf1CqgY6h2qmMy6urODLoPD2saA
	w/DXBK7zeWLHfu81ar+tiSEnb65fbNDpmEHzENHIe8PwZ9wpiR1Fhj92/i1D4HRU
	sO3yVMDBfq6ssItLPg+i5ad7Gls1Pq1HRkNFSJB9L+TAxwvt7tdW6llHN/DAKbQJ
	g9Q4lkwVwAAlEc0htRC1FocpRiLgYWCkVO4n4LZkQGRF/wT8ZlmHCG1fWREF0poZ
	9q9C0Dx3IQAuDTu45JSiq0ppyzAx+MwmPfQzfiG4lwrs+wz3k6FOEFWywQnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762251710; x=1762338110; bh=vE/ktWRFAgzLmrJFxyHjT0YWFc84HQzny5i
	111ajCqo=; b=Vthor7/7XJzUUQobNwyiw/As66n4VCu2UuykywGfJdpPXHXjf4F
	umI9FOWE2/r1eLhZljnKibdqe130D8ADbJosdh1n8oL2AIaYUr+9OGyj/aJKsVX/
	Sl4rSXLWz2C/3AOYRKdYmqCe+PJ1iLtguJrYzuo7IU+ySgjIurA4lt2nJsSEAHgn
	BdELpHoXtpR9h0soyOil+dOe6sle4jzD938KcQs+HNBmffnmG+cnWAerCCXm4Xby
	Gh5xISqG/6jPjzmKpE8A0oALMgM0TQVmqiMUGrFiezQpT7TmfO06Q7LMxvifXHk6
	JzBtv7PKnsfy0u70tpKE6ZLum07GvzeVkHg==
X-ME-Sender: <xms:vdMJaXj8uoXrAMQkf3CtjW27f4yvXtjNGzM0qrSX_awL6yFSv_M2zA>
    <xme:vdMJabdG428U-DydVSwSskzQREXvGZPc4wejtjJ_WVhkQaAZpmpgiD14FOSBWNRgB
    phseqO-5EAAYuwXxUCNBX9oXYMnsYrm8DX0tQaJkkJcKWgYbt_tUNs>
X-ME-Received: <xmr:vdMJaUeOf-wcoOPr03GRH3FeyC7j4b66ID-KXOzqRHSu5EY60-iJrlF-izOxbLcBZUfs-ds4ja8Qkp2OEPx91NmEkfMxlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukedtjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epffefveegtdffleegvdeljefhveegtdffieejfefgheeuhfetieejffekuddtkeeinecu
    ffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdphhgrrhgufigrrhgvrdhmug
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghu
    lhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepphgvthgvrhdrmhgrrhhkohesshhivghmvghnshdrtghomhdp
    rhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnh
    gvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegsrhhutggvrdgrshhhfhhivghluges
    ghhmrghilhdrtghomh
X-ME-Proxy: <xmx:vdMJad_hYfD04x8GX_2A8skIOkluYgDlDlKwmCwjLANPEhKoKzgQaw>
    <xmx:vdMJaYkBkVDftAVcVtRXzVujBVIFIQ-Po_1hoSujQ6y430koldA3SQ>
    <xmx:vdMJaX8-_NcfYuYpj9OWIZjLygzvyR4JidYFoyLUAgci3ATw1vQyJw>
    <xmx:vdMJaem_c8P3ihZ_2fd4uzlYHgOxuyimJEcoyjWGpHKIY5Xa8dR5iw>
    <xmx:vtMJabfbUD0a6f8gzFdrcEYTfNxn5-prdr04SZRFK4hA5AxYsDR-Dt-7>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Nov 2025 05:21:49 -0500 (EST)
Message-ID: <23b497fd64dc5414580260ac676d7c05d45d953a.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] yocto-bsp/6.17: correct branch name
From: Paul Barker <paul@pbarker.dev>
To: Peter Marko <peter.marko@siemens.com>, 
	openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 04 Nov 2025 10:21:45 +0000
In-Reply-To: <20251104073805.8102-1-peter.marko@siemens.com>
References: <20251104073805.8102-1-peter.marko@siemens.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-M3pePxCiVNMyZJOD6jlu"
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 10:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225719


--=-M3pePxCiVNMyZJOD6jlu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-11-04 at 08:38 +0100, Peter Marko wrote:
> 6.16 in branch name for 6.17 kernel does not look correct.
> $ git branch -r --contains 459fdea93914f4db040bd8ebf8bce134a4cd6388
>   linux-yocto/v6.17/standard/genericarm64
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappen=
d b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
> index 51b61b1552..603a967f2a 100644
> --- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
> +++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
> @@ -7,5 +7,5 @@ KMACHINE:beaglebone-yocto ?=3D "beaglebone"
>  KMACHINE:genericx86 ?=3D "common-pc"
>  KMACHINE:genericx86-64 ?=3D "common-pc-64"
> =20
> -KBRANCH:genericarm64 ?=3D "v6.16/standard/genericarm64"
> +KBRANCH:genericarm64 ?=3D "v6.17/standard/genericarm64"
>  SRCREV_machine:genericarm64 ?=3D "459fdea93914f4db040bd8ebf8bce134a4cd63=
88"

Thanks for the patch!

As this is for meta-yocto-bsp, it should go to the poky@lists.yoctoproject.=
org
list. See the meta-yocto-bsp README [1] for more info.

[1]: https://git.yoctoproject.org/meta-yocto/tree/meta-yocto-bsp/README.har=
dware.md

Best regards,

--=20
Paul Barker

--=-M3pePxCiVNMyZJOD6jlu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaQnTuREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhzQAP4uQYuOl4CwH1pgery4XTRG3vH1XberVpnF
z6N1om6o7QEAoF/ib3JWr8wRmZUPulhKUh7ss6m90COO0x779wS51wQ=
=BHKy
-----END PGP SIGNATURE-----

--=-M3pePxCiVNMyZJOD6jlu--

