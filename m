Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09935D39423
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 13:32:25 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15766.1775136741234051602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 06:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=JHidZMRD;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=SNtGEGqW;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 623E6140018A;
	Thu,  2 Apr 2026 09:32:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 02 Apr 2026 09:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775136740; x=1775223140; bh=a3Xtb8c2hG
	1upv+KmATHkwbdOYfcAAxD5ON0FYOwnA8=; b=JHidZMRDmbIS53OECKsVlqrppe
	VYDv1QNhEfyW508Urb5rTj+AVyX6JdcKibaP5511MRkwDmS5GLoz+P6VfmkvnvYm
	98VYyIGRmULk7kjNjBzwrPzPKmKIfJFgFkGBo4WwJKBPUuRLqFC99FlcIPLl1A20
	3Uaq4SoiMrJq9w466uZszUA8Yg0cB94W2etc9ucYZQGFqHuwVn/O8iY++n3ZmtJW
	36AhngI3fUXPIWKTmlvlIWXxJxXdRONkrfPFpjhKCRzUcaCK3dy+oUGS4Npeg6zU
	+AwmbqJPz65XV9F0SBcdWhOAOoKOB3yfeYDpUHVFi4IBblQAq4K2igPy0AoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775136740; x=1775223140; bh=a3Xtb8c2hG1upv+KmATHkwbdOYfcAAxD5ON
	0FYOwnA8=; b=SNtGEGqW6ryyqcBVqefEEyEiVYRzO5eOF/KhyY2QQGt/LuzAdtI
	OcD8XIaXPA9HlnUJeJn/2FCav5SFOEkxgljDxQAXg3q/hg2vzNl1O1JKqofbf1ry
	pOhfWTZvuoHIb/DFtPWJliNZQeGLoPjGeWu1lLWLkyiL1gzHfYY/XItPvr/7kwPe
	yDxi6C63rSTNngx7D1zKyzDfYYrVA+0gkUku8PVblNIFYq+U0WyMWKeZL88Yw2gG
	FZ7Bs2n8Lb6cGq67Dv7RSbqvR4zT06FiNheVES93I35qcTSmE9T8OP7TacGGehp6
	V2mq1+KpzVEcrn+I+LRWP4iaPu5LQCWHWOA==
X-ME-Sender: <xms:5G_OadWxj-rLiDjrVLyKs4z2XC-YL0DCN-I7mJoRtbNFds-zOgpfhQ>
    <xme:5G_OaTm143dumIYLbxCKdZnYCW5OvJuISCFP9QYFSlHgGoEiLxBmIWSBoVOUT015d
    N2yDBq-PZ1y-zto547a257UECp0_Bc__LE26MAweDddFc4ZaGDjU9I>
X-ME-Received: <xmr:5G_OaXBVmlMGgAG4set5I8RVP-4HxL1oL4v-hirbYpju0nIHJvVNFoENkCGkyPec4BX0pIM_Bk4Mx3RKxsgSaIQ1SU-H28vYjeyJJno>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertderje
    enucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggv
    vheqnecuggftrfgrthhtvghrnhepgeefhfdutefhffevheevkeejhfegffegieektdefke
    dttefhuddvffeuieeiteffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
    hulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouh
    hnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhr
    vgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:5G_OabdJk0wOPUfxRgZ9FKl7LMbUude5f6LI5aO0IGdmeYcW69QOzA>
    <xmx:5G_OaaJKa3-uhwXr9tvOeVdu0G4x8PSeAHHwGZiQmoY3EDRo0vA92Q>
    <xmx:5G_OaWc-rIxJ0YQbCDiCozgTOHQtnLyywc9rk4uGyEUSPOKrzw7FJQ>
    <xmx:5G_OaZ3O71kdszkZnXLnE6ljM3X8x9jEokw5CSkXih2FzhaLZUOXhA>
    <xmx:5G_Oaf6yxAm7JCkgYG81Rgm8kVors8pbT4vB_qKAKncqE8ZGvnAvK7Ta>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Apr 2026 09:32:19 -0400 (EDT)
Message-ID: <43da4c441690aef83bad9bee08d5321419d97169.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH 1/3] local.conf.sample.extended: Drop obsolete
 DISTRO_FEATURES comments
From: Paul Barker <paul@pbarker.dev>
To: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Apr 2026 14:32:16 +0100
In-Reply-To: <20260402104434.3525234-1-richard.purdie@linuxfoundation.org>
References: <20260402104434.3525234-1-richard.purdie@linuxfoundation.org>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-HqovdnWbcsCkND3ElIbH"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 13:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234523


--=-HqovdnWbcsCkND3ElIbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-02 at 11:44 +0100, Richard Purdie via
lists.openembedded.org wrote:
> These pieces of config are obsolete and not really what users need any mo=
re,
> just remove them entirely as they are simply confusing.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/templates/default/local.conf.sample.extended | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/meta/conf/templates/default/local.conf.sample.extended b/met=
a/conf/templates/default/local.conf.sample.extended
> index a898b18d59f..999a09dac1c 100644
> --- a/meta/conf/templates/default/local.conf.sample.extended
> +++ b/meta/conf/templates/default/local.conf.sample.extended
> @@ -31,12 +31,6 @@
>  #do_fetch[number_threads] =3D "4"
>  #
> =20
> -
> -#DISTRO_FEATURES =3D "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadge=
t usbhost wifi nfs zeroconf pci"
> -
> -# If you want to get an image based on directfb without x11, Please copy=
 this variable to build/conf/local.conf
> -#DISTRO_FEATURES =3D "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadge=
t usbhost wifi xattr nfs zeroconf pci 3g directfb"
> -
>  # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary loca=
le
>  # packages at build time using qemu-native. Disabling it (by setting it =
to 0)
>  # will save some build time at the expense of breaking i18n on devices w=
ith

This and the two other patches in the series look good to me.

Best regards,

--=20
Paul Barker


--=-HqovdnWbcsCkND3ElIbH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCac5v4BEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bqHsAQCZ0gpT39OYz+zkZbLOABVBzRJJF3fIyZsv
ffj8HsL6pgEAoAd5izyidTVSGGzZTaqXf3OyJUajtF9lC0LigKTIOA0=
=LIPa
-----END PGP SIGNATURE-----

--=-HqovdnWbcsCkND3ElIbH--

