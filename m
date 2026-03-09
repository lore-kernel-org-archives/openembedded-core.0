Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD4EEF3711
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 08:18:23 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9331.1773044302555858067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 01:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=SYyAxwTT;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=TegqYF8y;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id CF0571D00111;
	Mon,  9 Mar 2026 04:18:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 09 Mar 2026 04:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1773044301; x=1773130701; bh=x59UIF52Wa
	OdAW8S+s/DEp3wxcsHZWvFu4NqKT3cSq8=; b=SYyAxwTTyA2+EJ1N7d+U4jnsBk
	Ow/WOsGZxYB7xMznUakhYxVN7qKmpGX1Wg9zoyZ6ZmsqnF4QsJtNdxwnGBNu2PqZ
	UZNPYwLjmJyFB5Vc98HThK4aw/Vq0ojC4sXXqq5FifMabe0/cUA0IrD1gEhWdj7n
	PE0Brw8H7l/4yTQh2T39yND4nccrvIvXOMt2e6UIbLEWRwqY2MJWLaD1MJPFx9N6
	PSPoQFzewDNW/g8x3Fe7e50lcDt9Pekg3BTumjm2DribWkNFj0HqsCYTibMhlRNp
	6omjdJp0xXPaFgAAId1emX2OaZP/KvSdt1N8kzGScbZ1UHUGvUBJnmzntV/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773044301; x=1773130701; bh=x59UIF52WaOdAW8S+s/DEp3wxcsHZWvFu4N
	qKT3cSq8=; b=TegqYF8yFXe1AQPSu3eh6xTp2Vxkppq4pf+xNuCK25J4YGzTMI8
	mpfCpTQ/KfQ2ptDvE7XVHKDlGq2B4+iqy0mag+mIoMfgV+qRRlifstikMDR4Boak
	TLbS57TXh1zbSH6MssgBOgzT4dhhImtUNevqwFzv/sklILg5BnRN2P1e6eU778Jm
	QlUxbSTts42WBvfnzHHF9be7fSmHBxnd1kql0m7Aj8U7wfsr8yB+127cWfuU8hko
	XduaBE5EoyavaoUgHLxr/urbDGIvQXa7pgWzGtCICazPaxFquUGNY1FJaTWtNtbH
	dpPupIxFH4duubId1rA5vWzyK5ob4C9HeVg==
X-ME-Sender: <xms:TYKuaVAhu4z-JpgiqoTuRtd3b6D337a3SrjlLqtUQIfjsD5-iUXLMg>
    <xme:TYKuaZiu7vljoZJH10W69O3j1blZP3MiA-o00q5emFJTydXqh-5_pCNpJjrqcwL9Q
    4c4fIoMBTmV1fkWpxhBWKw9UCAS7FGZp-B8AklCU1UOqTNfHhuyTuc>
X-ME-Received: <xmr:TYKuaePc5dODwGQpjp7vsU66JcODIYXmEvpf2syFoN-OMyM_y4UI0eDVA38BrWlZgp17XZLIyxVlKQBxGhexDSNsmWjrblNwRHDwXjf8snJu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeejieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepteefvdevieeiteeiueefvdejueekhfekieetfe
    ejveeludejjeevudejleeljeelnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdphihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhn
    sggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeihohgrnh
    hnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtohepohhpvghnvghmsggvuggu
    vgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:TYKuaa5HcWAEb5dyMOJbvW6gQJSIw1Je0pLDUHDvJON6Cu4KBjZT2w>
    <xmx:TYKuac1W0LgEM4nwPn9a1ZRiJ5DcNNBsED_KSNdxzV5jNZ6r3MmS3g>
    <xmx:TYKuabYORUdUvWIbd9ilkEN6JP_UtocAAXODI2RSvkxzek2-SvHYug>
    <xmx:TYKuaUB6-6JafXGxaxihZdEyQmJSnxvEu0jLs8g0fSDivfD6YTR1ZQ>
    <xmx:TYKuaZmCrGGG04SPZC7xSqG2lmfpwoCINEFuV2rAHzdxIreO79MPRcun>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Mar 2026 04:18:20 -0400 (EDT)
Message-ID: <e12c550949f45ef267fbce33fcc63c922a15a0dc.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 00/11] Patch review
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Mon, 09 Mar 2026 08:18:14 +0000
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-zr/o3hcxO4kU4Qp2j1Ze"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 08:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232689


--=-zr/o3hcxO4kU4Qp2j1Ze
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-03-07 at 23:52 +0100, Yoann Congal via
lists.openembedded.org wrote:
> Note: this series contains a major OpenSSL upgrade (agreed by YP TSC).
>=20
> Please review this set of changes for scarthgap and have comments back by
> end of day Tuesday, March 10.
>=20
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3349
> (Ignore the warning about Centos Stream9, its support is a work in progre=
ss for scarthgap)
>=20
> I also did a full meta-oe build (to check for build failure with the
> OpenSSL upgrade)
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1342
> (the warnings are unrelated to this series)
>=20
> The following changes since commit a9a785d7fa0cfe2a9087dbcde0ef9f0d2a4413=
75:
>=20
>   build-appliance-image: Update to scarthgap head revision (2026-02-27 17=
:45:15 +0000)
>=20
> are available in the Git repository at:
>=20
>   https://git.openembedded.org/openembedded-core-contrib stable/scarthgap=
-nut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
scarthgap-nut
>=20
> for you to fetch changes up to fd8a140eb0742bbc12a23e36c9d24378bc0f462d:
>=20
>   busybox: Fixes CVE-2025-60876 (2026-03-06 23:58:42 +0100)
>=20
> ----------------------------------------------------------------
>=20
> Hugo SIMELIERE (2):
>   zlib: Fix CVE-2026-27171
>   harfbuzz: Fix CVE-2026-22693
>=20
> Livin Sunny (1):
>   busybox: Fixes CVE-2025-60876
>=20
> Paul Barker (1):
>   create-pull-request: Keep commit hash to be pulled in cover email
>=20
> Peter Marko (3):
>   ffmpeg: set status for CVE-2025-10256
>   ffmpeg: set status for CVE-2025-12343
>   openssl: upgrade 3.2.6 -> 3.5.5
>=20
> Shaik Moin (1):
>   gdk-pixbuf: Fix CVE-2025-6199
>=20
> Tom Hochstein (1):
>   uboot-config: Fix devtool modify
>=20
> Yoann Congal (2):
>   scripts/install-buildtools: Update to 5.0.16
>   README: Add scarthgap subject-prefix to git-send-email suggestion

Hi Yoann,

We need to make sure that the openssl update is clearly announced in the
weekly status and the release notes for 5.0.17. Otherwise, all LGTM!

Best regards,

--=20
Paul Barker


--=-zr/o3hcxO4kU4Qp2j1Ze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaa6CRhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkMWAP9LuUTCKew2lZiUXhxEGgj8ozGMgEsW45ST
xk5n92yVqgD9FYxRjOmdiMsBfF0vpojh4x8IK/hA8RXCijgbMfHz8gs=
=pEUv
-----END PGP SIGNATURE-----

--=-zr/o3hcxO4kU4Qp2j1Ze--

