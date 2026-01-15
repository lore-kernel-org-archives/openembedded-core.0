Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105D4D44C4C
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 13:42:04 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35921.1768484515567035848
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 05:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=iwdI8Tql;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=q9BGjG7S;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D3EE57A0090;
	Thu, 15 Jan 2026 08:41:54 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 15 Jan 2026 08:41:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768484514; x=1768570914; bh=y5ed834gYe
	xdVVuP+Kzds1YeHPE1+03PQkmmo4g1AvI=; b=iwdI8TqlTQS2AWEMdsoPwpfiiY
	Sak7VKknci5B0uXf9C+XVoDk2/5mK3Pj9RZKqOJpUiCLv7aa4nqFeaA/Xb5i3iq+
	77YyJMgmggun/5rLOHSdiTzeKpl+NuO56E2B/VD9AV4xMycLbXsHAZcxEYvwkXp1
	WAlXvU3hV58+Dtyv0Yb6nlw8FXGZUqf6UzWPdZmNo1o3DEEr1ioZYduL8/fPKTcA
	4+E4mlvVFfB4o4MwpLENo+appVaiGu2IDLkbeANmdwFPHVjdlpqaiRWbgKiOAcEH
	5+1MRVxpIAvN+FB1155SZjprVqMVOaGYCwTmkr684KfC8zIigeRIlSo9r+/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768484514; x=1768570914; bh=y5ed834gYexdVVuP+Kzds1YeHPE1+03PQkm
	mo4g1AvI=; b=q9BGjG7SlNY6lHBnkiYetEBUdjWnP9DYU5VX5dupt4GCLwUZTzW
	1TwrztLwtk6hTkYU/DQBjWha4XfGHRRLXhiLSXsU/Rusya4FgcBcU1bwrE/2nGRO
	QGKx6pSVz08AdjvRJ10Mv+37Ne0ydVNhQXjPkfGqzyei9UaYxBaEDtpBlId3if7E
	slBAhtkzEKLIflffICFsIVCADVMMSQ8G0dEKTjCPP2qWoifBVLVzJWhifZQuCT/q
	NcyVyp+ojUT6+VrnBARRP/RnoUJ0St1tMw/ig6V2u79e23rGdpUVE2qIr5Ss7odx
	DGchXrSS78CpW7g6Cfp449qgjJUeW1iRgWA==
X-ME-Sender: <xms:ou5oaTGCVRuw2ynAQ7I_7x3msUKE2atqpBvYmOaHWuDzXRhNLDyEzQ>
    <xme:ou5oaWUUINIloB6mYRI2mwxj7EAp3RIJHiVK5ctsfVhqFcn9rKlfNS0i110FjTtAy
    OV2H0D8o0BTDpzUvYkoqAbUNdUMSuhq7FzgMaaCU3CWm1uN-K3Wqg0>
X-ME-Received: <xmr:ou5oaSxjYOFSgHjky4qM_T8y74OOyIRvXNVn3BWqDAE036rdFb95hcTyWoy4llurkM8theUNtE0pc4ZFLQI-jQwZI91BnQlTut7yJoV14nQ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeivdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepgeefhfdutefhffevheevkeejhfegffegieektd
    efkedttefhuddvffeuieeiteffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepuhhvvhdrmhgrihhlsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghm
    sggvugguvggurdhorhhg
X-ME-Proxy: <xmx:ou5oacMKjkvCC_VsqUmF3hnVCFkXTqegQhxmGmHBreo1q9M0sKg3fg>
    <xmx:ou5oab5EsLjxQaAX7HVI9P_xqBiCMybxWSET1yftN22gCgApj3398g>
    <xmx:ou5oaVPkj8GQDeGDCRErFmsyhjWM0lyRrh2slz4uY5WZ-ijh6jGrGQ>
    <xmx:ou5oaRl8fwOA6CJF_eALFZe1QdDgs3HylfVnjqlq43n607jskmE72w>
    <xmx:ou5oacWBRs78abxdxa18FavLDrUer25WKLpW16jdqWa41TjYu53NUDq6>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 08:41:53 -0500 (EST)
Message-ID: <4c89ce299fb704382932a367669852b0617c9232.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v3 1/3] overlayfs: Fix the QA skip for ignored
 mounts
From: Paul Barker <paul@pbarker.dev>
To: uvv.mail@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2026 13:41:47 +0000
In-Reply-To: <20260114185508.380709-2-uvv.mail@gmail.com>
References: <20260114185508.380709-1-uvv.mail@gmail.com>
	 <20260114185508.380709-2-uvv.mail@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ZEDxneCphA4VtlzNpgn9"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 13:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229411


--=-ZEDxneCphA4VtlzNpgn9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-14 at 18:54 +0000, Vyacheslav Yurkov via
lists.openembedded.org wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>=20
> The supressing of QA check for mounts should happens twice, at parsing st=
age
> and at rootfs postprocessing. If the mount point is configured to be skip=
ped,
> but it is still present in the configuration (machine or distro), then th=
e
> parsing would complain.

Thanks for respinning these patches.

I'm still unsure why the check is being performed twice. Are we checking
for different errors at parse time and rootfs time?

Also, can we convert this to fit in our existing QA framework so that it
is controlled by the WARN_QA/ERROR_QA variables?

>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/lib/oe/overlayfs.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
> index 5a5ea03d45..3805746d90 100644
> --- a/meta/lib/oe/overlayfs.py
> +++ b/meta/lib/oe/overlayfs.py
> @@ -33,7 +33,8 @@ def unitFileList(d):
>      # check that we have required mount points set first
>      requiredMountPoints =3D d.getVarFlags('OVERLAYFS_WRITABLE_PATHS')
>      for mountPoint in requiredMountPoints:
> -        if mountPoint not in overlayMountPoints:
> +        qaSkip =3D (d.getVarFlag("OVERLAYFS_QA_SKIP", mountPoint) or "")=
.split()
> +        if mountPoint not in overlayMountPoints and not "mount-configure=
d" in qaSkip:
>              bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_P=
OINT[%s] in your MACHINE configuration" % mountPoint)
> =20
>      for mountPoint in overlayMountPoints:
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229369): https://lists.openembedded.org/g/openembedde=
d-core/message/229369
> Mute This Topic: https://lists.openembedded.org/mt/117266570/1826184
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pa=
ul@pbarker.dev]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

Best regards,

--=20
Paul Barker


--=-ZEDxneCphA4VtlzNpgn9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaWjumxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjN3AQDd6u6163FGbo3Wby/8qgUsL4oXTphiEkjk
yn3J9+p5PgEAoeO80UQmOFZ7p8Sqk+35nAkHq5TEhTxnOeWA9hx5oAc=
=kjw3
-----END PGP SIGNATURE-----

--=-ZEDxneCphA4VtlzNpgn9--

