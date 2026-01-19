Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA68DD29C59
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 18:25:12 +0000 (UTC)
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41621.1768847109193566464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 10:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=WcHU5deA;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=wBEtnU4G;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5260D140071F;
	Mon, 19 Jan 2026 13:25:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 19 Jan 2026 13:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768847108; x=1768933508; bh=LJe9X5DhWE
	QXqyHeT/42ArI+G8EePMHQCQYLuYHFXWI=; b=WcHU5deABPngtS+BWldgWCZlad
	JskHuo5rd4EzlMKzIsQQnnenKEucQ8FDzffTmNgTt8VOwaddZuE5fNzCVvMOgBfZ
	VoTQqag/8NQ4kWSzMu/LrfrCh059YEfgKitkuO3v5h3ksGh3qsnVGwrdwkoXazcG
	igavSwqwDXq6osAz3hxRJnOhki1XL7Kdp+q2RzwY7bsBP5vxGtA+9hmnt6pLtSnN
	fH3+Mu8pK/7KN3SvVrmCtDYUf9yVFYpoMC8fMF2X4g6v9bPGGo7mq5DOBe0diHvg
	pXa5y5yLoWs4KajSY377K58FHXUMug2Kvqd7PvpU4j0pCoo8eNO+mHKXUduQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768847108; x=1768933508; bh=LJe9X5DhWEQXqyHeT/42ArI+G8EePMHQCQY
	LuYHFXWI=; b=wBEtnU4Gcq2FN2NRg4lmp8GVPXdblG11c04d++tKOdakj8m/Ndo
	69nxA+2tsnI3Dr1cnkrHRMHps9iHChJco34SGfpl6cidPEYklfOsW3b8c+dpC+eD
	UbUSXt59Bkew3ai4Y1gZiaq9T4LB71jdhku7zHjD9kZaORQnOimYjJggNmQZEuud
	5kEYdg2/wKEcjkZSkmCgT4T1kkiWD1VIMcUmCzJn2AFOBM1UVZKq6swg+RdgAl9y
	zm3RIM/ikAEjEaUeDgyEiXZbhufkNtrOscM9CLwhlrbG21YEIFZBJKYFrUa4n0vQ
	tcY0b2u37BxWKLVun2/BcUhKDCS6IDCGjAA==
X-ME-Sender: <xms:BHduaV7Aji1vbFCS03kMs5Iqy5n680GuCzYYWgMDsj45PBVsUvj9aw>
    <xme:BHduaQ2lHqkEAbx4-rVRUWQDF81NhjPv3i7uvbKvlpSbwrazZqw9Kt3hMfC7H5ziY
    cwTGczJv8GSdSj8RiK2a9ppwcHU9e9UEgLTLbuXkPnX9Q4RNZ9cRNM>
X-ME-Received: <xmr:BHduaUByGOKBy85s5nBPA5p49WIo_-atEt3rL0Lx8jGHGx-pX_OHmX44GGVQvGZmhdhQqJX9yIsXIrvRZMcgutntE5KWC_5gsxq6A-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeekvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepgeefhfdutefhffevheevkeejhfegffegieektd
    efkedttefhuddvffeuieeiteffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehoshhsrd
    hquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtgho
    rhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:BHduaa0Qpqv3ppwB9b-X0KbxnNwQC0kNdRG2p5GPATlLgkMF4xyTbg>
    <xmx:BHduaWs6wYm7yiURu2bmqaPZ_BL9Fh7W8hJ0GoOVDQKKfTghbuqy4A>
    <xmx:BHduaS75N5jmD0pH-_6mohtU22FY9y6qOJRiCnQKrDgQ7erFt_fjRg>
    <xmx:BHduafJ0mui4IMS-v3axDLR_ucxBPUuaTFn1brGWPxxOVUxnnVD_1w>
    <xmx:BHduab8KGvtt6shZvhevJ3IDE88kJzMz7CM31QB3UW2PuvTZs_LeTl-a>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jan 2026 13:25:07 -0500 (EST)
Message-ID: <de2a9614df745a20872cbbabb805da7d350efa57.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] uki.bbclass: fix building of UKI images with
 multiple initramfs fstypes
From: Paul Barker <paul@pbarker.dev>
To: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Jan 2026 18:25:04 +0000
In-Reply-To: <20260107042345.2264330-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20260107042345.2264330-1-dmitry.baryshkov@oss.qualcomm.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-VYoB1/l9WaQCVI5ZxtwR"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 18:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229630


--=-VYoB1/l9WaQCVI5ZxtwR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-07 at 06:23 +0200, Dmitry Baryshkov via
lists.openembedded.org wrote:
> If INITRAMFS_FSTYPES contains more than one entry, ukify build command
> will fail as INITRD_ARCHIVE will contain extra strings. Use only the
> first initramfs type, letting the user to specify other fstypes.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/classes-recipe/uki.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
> index a2b1c8a82d6f..7457662f3f5e 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -73,7 +73,8 @@ require ../conf/image-uefi.conf
> =20
>  INITRAMFS_IMAGE ?=3D "core-image-minimal-initramfs"
> =20
> -INITRD_ARCHIVE ?=3D "${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}"
> +UKI_CPIO_FSTYPE ?=3D "${@d.getVar("INITRAMFS_FSTYPES").split()[0]}"
> +INITRD_ARCHIVE ?=3D "${INITRAMFS_IMAGE}-${MACHINE}.${UKI_CPIO_FSTYPE}"

Hi Dmitry, apologies for the delays in review.

The general idea here is ok but we would like to avoid additional
dynamic calls in variable assignments where we can - each time we add
some Python code in a variable assignment it slows down recipe parsing a
little further.

In this case, INITRD_ARCHIVE is only used in the do_uki() Python
function. Can move the parsing of INITRAMFS_FSTYPES into this function?
That would mean it only executes once during the do_uki task and not
during recipe parsing.

Best regards,

--=20
Paul Barker


--=-VYoB1/l9WaQCVI5ZxtwR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaW53ABEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0biu+AQDUhQRSMWoEch10poBWhZ7ImXp6IgPahBSi
7/dlRlgpBAD9F8X4UZkprnMaPd8+ZiIkHlY4rLY/4cyUs8E1CvyP9QU=
=FLba
-----END PGP SIGNATURE-----

--=-VYoB1/l9WaQCVI5ZxtwR--

