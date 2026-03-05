Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A54DF3094C
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:49:33 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42370.1772711368438309101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=hDMV5X+y;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=D1bwnFAc;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 8EC94EC063E;
	Thu,  5 Mar 2026 06:49:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 05 Mar 2026 06:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1772711367; x=1772797767; bh=QkZYzjJNT/
	8raXVDqhxOdvPEKZOCM7NnmvbezzZVDuk=; b=hDMV5X+y+n+ceoIrc92wnJsszz
	rVbMylnMlc7mNVQObukX5fF9PjR8niCYeWCCyRrM5dkROh9/GzEKumMAcy+7jJgw
	7DzXTgAlRSpndaZvAH8CMokma6mHl3jJ9GE4G27xM69vVtTznfgFRsuT771w1v0F
	21xpCBR88uAmKGkFLshvOQH060qziN2niz/el8SyMbVf4cx9e63+U/82DhO4V89j
	gKGclcjJNGJehFt8CG7uKA32LL5+3fTrUTd1Mn8gJEoSGigGduvjZI9QoT8FFWj2
	e8ZY9HQ9FrjesMyfJNkgRmlVaUtdslfeqfpTXX6wqI5+6JtVsa95aG+zcF0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772711367; x=1772797767; bh=QkZYzjJNT/8raXVDqhxOdvPEKZOCM7Nnmvb
	ezzZVDuk=; b=D1bwnFAc4F2hOyBZJjAjKzrSmTyynBPIAEX0rb2l58rXi5S7M+Z
	7OTlYxQNfAE+UemNaugGmvDkis2LP2ExrDUdQfh0Ri3aSFmm1b+Jpkdx8AtOIEO3
	uHeI+gbYf/J+8LZPPQ2NvuMfO1MstT2sHclZ3guEi+gZFdypOCR+Tqgz4eoDTXMr
	F/NtzM7qF0L2Z3lZp3opp8/mPmI6zhAoG+4bL+tlNdYuFnvR1xqkBvdZe+Cull+i
	WVzYFuvSEvDszJKOzDrs7SafoJNmOo2eYQdbbNytx/JWrgKvKNW4OKh03/ACr9yc
	5Z7+Cx6Y1RpzRzXXBKceygCM9X5CQYDzXLQ==
X-ME-Sender: <xms:x22paSwNsYnoJHL8TrA1DmbWhTE1IWSET1qEEGf5XloV_3aKVW1tAA>
    <xme:x22paWCnkuetYOjeIt4uuBHCFbv6jlXjaYzl1o39W5tLB0OheBwvB0Xr76RGGc0NP
    6yURahGje2zIGvA3Jocw34PBluDbHOB7lMn3idE1nKMF_V_FQ_2Hg>
X-ME-Received: <xmr:x22paXb_slIgM1v19C6onJeer6mkdKGaeJTUEZoK1g8R7G3OcfGk7xNUhSsGHN1YfJ1fTXP_1kiQIhkrK_y7KMuSW430QB8oHLHrApHp-Zr5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeifedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepgeefhfdutefhffevheevkeejhfegffegieektd
    efkedttefhuddvffeuieeiteffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepgihirghnghihuhdrtghhvghnsegvnhhgrdifihhnug
    hrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvges
    lhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprghrihhnug
    grmhdrnhgrthhhsegrmhgurdgtohhm
X-ME-Proxy: <xmx:x22paWhKFOex4RfSaVRIUTkH5Lkb2AxZVDXU8sceNqPyAjLoJAf_wg>
    <xmx:x22paR4oMNSz-EAoo9yupTvpEDBRwIFiIb-yPAblrLWUKbQgxmS8Wg>
    <xmx:x22paV7JYv_519-Ka1e0F7iXoEtJcmS7FU-0fSwKLnQ671Bm0qqujw>
    <xmx:x22padc-jBLFnnc048YBV1BbYb_AuBRQRV52_Cj8fVSQ_1gEwrZoGg>
    <xmx:x22paeqmOEiF9VFTFF3lV70xL-EyWJWKar5FLvbJllspnQAFrIk2FWba>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Mar 2026 06:49:26 -0500 (EST)
Message-ID: <2c704d3b5aa8852a3d4e24143fdedb8f530517ae.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] grub: update search parameter
From: Paul Barker <paul@pbarker.dev>
To: xiangyu.chen@eng.windriver.com,
 openembedded-core@lists.openembedded.org,  arindam.nath@amd.com
Date: Thu, 05 Mar 2026 11:49:19 +0000
In-Reply-To: <20260226081937.671793-1-xiangyu.chen@eng.windriver.com>
References: <20260226081937.671793-1-xiangyu.chen@eng.windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-uggnqshURR8ed8vncP3E"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 11:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232483


--=-uggnqshURR8ed8vncP3E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-02-26 at 16:19 +0800, Xiangyu Chen via
lists.openembedded.org wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>=20
> Grub would report an error message in boot stage as below:
>=20
>    "error: no such device: ((hd0,gpt1)/EFI/BOOT)/EFI/BOOT/grub.cfg"
>=20
> Consequently, the root variable is not set, and the intended protection
> against cross-device configuration loading (the purpose of the original 2=
014 commit)
> is lost.
>=20
> The most robust fix is to use the --hint parameter.
> This separates the search target from the device hint, avoiding
> fragile string concatenation and supporting both prefixed and
> non-prefixed $cmdpath formats.
>=20
> Fixes: 5ce73b6055ac ("grub: add cmdpath to grub configuration file")
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/recipes-bsp/grub/files/cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-bsp/grub/files/cfg b/meta/recipes-bsp/grub/file=
s/cfg
> index 8ca53d24d7..8fe1a8d0c7 100644
> --- a/meta/recipes-bsp/grub/files/cfg
> +++ b/meta/recipes-bsp/grub/files/cfg
> @@ -1,2 +1,2 @@
> -search.file ($cmdpath)/EFI/BOOT/grub.cfg root
> +search --file --set=3Droot --hint-efi=3D$cmdpath /EFI/BOOT/grub.cfg

I'm not sure that this can work for all use cases. The grub
documentatation for hints says "First try the device HINT" (i.e. it's
explicitly a device), whereas the documentation for cmdpath says that it
is "an absolute directory name".

Best regards,

--=20
Paul Barker


--=-uggnqshURR8ed8vncP3E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaaltvxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjS8AP9mnubMhc5RSNUylwnQkotfalo8mank71cJ
kiFvk0O7mwD/RI8zgMHops9E6N+Q5fhzS2yiasIjS6Wi8JZZr2/gTAQ=
=6uFK
-----END PGP SIGNATURE-----

--=-uggnqshURR8ed8vncP3E--

