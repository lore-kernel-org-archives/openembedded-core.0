Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A43CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 15:24:39 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.887.1778253870854694105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 08:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=PceV4LSV;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=e54UAUoF;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 187CE7A00EB;
	Fri,  8 May 2026 11:24:30 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 08 May 2026 11:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778253869; x=1778340269; bh=qEWiG5Upfp
	Ch1ZEC9BmcAKnsfndQauhfzt+KWBcGP30=; b=PceV4LSVP+o7sUYSA1Nhdjjsx4
	g5f7mOCAzfps/7X+d0SAqNAskq0NpOw6DiAPXRblyedd0FeUaXpWooE+iOpgDYVr
	pcpWptMO/0cJAe7Gyciy+nBtZ4ytj/LV5qBcCXzkLdVMAtjaWjoN4U3pMqmGKYN4
	TcpKL5YpGYIwrj1VTQuptIkyCKGAadOFPG0y3ItX7rwp9GerTAksHz2NLTKQbKrZ
	6ekR73PzuRmt166pKDS7PDlSmvomcQ3JoQwxDy3xaq80QSsqmD+VKbszqePfyVFK
	+wzH1mz+9oKyhfEb5FKS9j5DiRtNOdKE8AskvnIRuW3yfjKBUNb9yCispX+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778253869; x=1778340269; bh=qEWiG5UpfpCh1ZEC9BmcAKnsfndQauhfzt+
	KWBcGP30=; b=e54UAUoFjKa1V5if2IiUoUi9aGiiX/hjuwxRpN1nBaCba1Sk8VM
	sV5a9Uf5P7eow+MTZn8jTJpvk5ocz88ZHH4QLnkxIyCrcydXahTMzuZc0UVcOaam
	ciZxgVR5UZsKJLcm0JEDLWsj/4lU2ZqGhxoYaHRLgN6PEUEgZl0As9fsSu6nG8uU
	RoKaQnPTHzmOKSSE3KF7CrYrHKQD1uGx435C9ip/l2tyqFP/+ZvaF+1sftetZPzI
	UXk23QY6I4DENEbCjtgzdvghPdT3He+uooPOf+4WjODErRxfiTAfTOvjlj0WBo6M
	0T9hwhIdetOiYO0v/gLd6i/yyyGq5u+ydeQ==
X-ME-Sender: <xms:LQD-abRCR0T_DnXccJs5rUNmsNh222zG3aEbz7u8oNjOqax6DujeNg>
    <xme:LQD-aSy-yIb93wrrtGdWd82bMXSuCozQvBEyRgEQsiMRJS8XsisfB-TpItZYVLSLU
    N8R5umGXinKHiLH9dAUy0m-vfPmYbdlECAMrcXbmo3sCWx7NsnCdEo>
X-ME-Received: <xmr:LQD-aed2LWttpUxdfGz2cKYrfuPyhSgAes3X1FgQF_VRjUOzVmMBAfqz8_921qji6vhkOxyKhUrdz7i1EmNGkdU6IPwkl5NOBh5iU5SdIins>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduuddtjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepgeefhfdutefhffevheevkeejhfegffegieektd
    efkedttefhuddvffeuieeiteffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepugifrghgvghnkhhnvggthhhtsegvmhhlihigrdgtoh
    hmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhp
    vghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:LQD-aWJz_ZFEHOqBxErtenJdQUkjqa1bBqm0wQIXm8zU-PQncbYaEA>
    <xmx:LQD-aXGqsiJ-ByG-DAp2y305qgBvIKC1RRoj_5nUCJebA6LI1BkSFQ>
    <xmx:LQD-aYoD-AYfe4TtxZ27eBGFkM22AORdVRTv5aonvKGNPfJ2ut4ROg>
    <xmx:LQD-aYQwlJWS12nUwu2yIFQzdxKAymY0qA-DX83be5GLIq6F9QYHZg>
    <xmx:LQD-aZulXcyG3xpXHyU0BcbWWJd4CPYoiGwq9vTN0ZZh9GBJ5eD6LtKn>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 May 2026 11:24:27 -0400 (EDT)
Message-ID: <93102958cda7288847f11ee797480f16ba36962f.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] classes: image-buildinfo: allow deploying the
 buildinfo file
From: Paul Barker <paul@pbarker.dev>
To: dwagenknecht@emlix.com, openembedded-core@lists.openembedded.org
Date: Fri, 08 May 2026 16:24:23 +0100
In-Reply-To: <20260420174404.122964-2-dwagenknecht@emlix.com>
References: <20260420174404.122964-2-dwagenknecht@emlix.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-gJCWNPlOiPkkCm8QjC2q"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236728


--=-gJCWNPlOiPkkCm8QjC2q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-20 at 19:43 +0200, Daniel Wagenknecht via
lists.openembedded.org wrote:
> The `buildinfo` file generated by the `image-buildinfo` class
> contains useful information to identify an image. Having it in the
> rootfs of the image as well as deployed alongside the image artifact
> can be useful. Allow to deploy it alongside the image by setting
> 'IMAGE_BUILDINFO_DEPLOY' to '1'.
>=20
> I use this in an automated testing workflow with unreliable deploy step
> to ensure the deployment succeeded. With
>     IMAGE_BUILDINFO_VARS +=3D "IMAGE_NAME"
>     IMAGE_BUILDINFO_DEPLOY =3D "1"
> the generated buidinfo file is unique and the deploy step can be
> verified by comparing (the hash of) the file on the booted system and in
> `IMAGE_DEPLOY_DIR`.
>=20
> Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
> ---
>=20
> I have prepared a patch for yocto-docs to add the variable to the glossar=
y.
> I did not find guidance on how to do simultanious changes to OE-Core and
> yocto-docs so I'll send them once this has been merged.

Hi Daniel,

Thanks for the patch. Sending patches separately for openembedded-core
and yocto-docs is correct.

>  meta/classes/image-buildinfo.bbclass | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-bu=
ildinfo.bbclass
> index b83ce650ad..1dce50b376 100644
> --- a/meta/classes/image-buildinfo.bbclass
> +++ b/meta/classes/image-buildinfo.bbclass
> @@ -16,6 +16,9 @@ IMAGE_BUILDINFO_VARS ?=3D "DISTRO DISTRO_VERSION"
>  IMAGE_BUILDINFO_FILE ??=3D "${sysconfdir}/buildinfo"
>  SDK_BUILDINFO_FILE ??=3D "/buildinfo"
> =20
> +# Deploy the file alongside the images.
> +IMAGE_BUILDINFO_DEPLOY ??=3D "0"
> +
>  # From buildhistory.bbclass
>  def image_buildinfo_outputvars(vars, d):
>      vars =3D vars.split()
> @@ -70,12 +73,20 @@ python buildinfo_image () {
>      bb.build.exec_func("buildinfo", d)
>  }
> =20
> +python buildinfo_deploy() {
> +    d.setVar("BUILDINFODEST", "${IMGDEPLOYDIR}/")
> +    d.setVar("IMAGE_BUILDINFO_FILE", "${IMAGE_NAME}.buildinfo")
> +    bb.build.exec_func("buildinfo", d)
> +}

Rather than conditionally adding a new pre-process command which re-runs
the buildinfo function, can we conditionally copy the file to
${IMGDEPLOYDIR} after it is created in buildinfo_image?

> +do_image[postfuncs] +=3D "create_symlinks"
> +do_image[subimages] +=3D "buildinfo"

These two shouldn't be unconditionally added.

Best regards,

--=20
Paul Barker


--=-gJCWNPlOiPkkCm8QjC2q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaf4AJxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0blUlAQDqu2I5tPYaWtJ3vAHGD1dJGYoZBQEb91up
olGpTtJnTAEAt3BzDLJW35SQTF3lri31w4Y28sG5fdYx+BCZEfaJNQo=
=psnL
-----END PGP SIGNATURE-----

--=-gJCWNPlOiPkkCm8QjC2q--

