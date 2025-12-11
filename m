Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D77D41C39
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 13:51:32 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9591.1765461087652742430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 05:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=dfRTEk69;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=ZFk/1kPK;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id D989E1D0007B;
	Thu, 11 Dec 2025 08:51:26 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 11 Dec 2025 08:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1765461086; x=1765547486; bh=Jo3K+k/URB
	Y5ILTEHo0PtkghrmQ4D2ZUSi4DRDJBPiw=; b=dfRTEk69ibHN9i5fjBZz+xv+EA
	DeW5I1H6TmtrX1wRvdeYj83LMSMlXNYZJTkBEDiwMaK2R+eCHPVkMKfP/6CAVYcj
	If19bHACCkA8IvPy2fy8Q/uAFULEO/vil+es0CbFHjdfRDZVrZ0IJMisd7lcLMiq
	N8OYf/N2h3Z8+Anvq6OjN7RUKlVaLwhVeYegMyAvb8mmDwCRzxqk8F2t0RsOGj4J
	FLE7HzfJ3eA4TFWEE9ahwG6Jw+zNQJNeoki6LCxhP+SZTBsW44y30r3lzj3RFE9g
	GFcINhhX9BIAetJMUAVLiFzH/dvUqf7J/wvo7AdyNLf/ROrCCk/6hSaXnpEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765461086; x=1765547486; bh=Jo3K+k/URBY5ILTEHo0PtkghrmQ4D2ZUSi4
	DRDJBPiw=; b=ZFk/1kPKK/9+Mq9saZqxIr/xV5sPE14iqtBGEEwvx2rgK0KJbHX
	9++5VCsLPquNXWMcSgATo9fM4+s3S6XNwy7pE/bSRSRZiFv+qTCMu4agoZxryhMB
	Ow0A6XxEhqs/W1jsGwfKzX8gQwM2rOLXzhih2Hdqve6Jv7AKraIpTFLvg8sPPcGR
	qAmERunGBx3FHyfVQ8nm5bwy855K6HwOuDu8rY5kFaYf3WaDSI6VSHh6k6v04EQU
	K4tZ/XyrOeME1aIdvK9tYPxeoqOCGmttvkmSo9r5Sg+DLm/zZE59RkM6vSpG5gpJ
	AkVD5KWKb/wZIilyhYHav+hlGQowjWAd5xg==
X-ME-Sender: <xms:Xsw6aUhMcb81S_k6svAxGRejKIq-_RR7Ce4f49bxr7zadE2TveD_1w>
    <xme:Xsw6aUci-MH_95uBxXC7MnA7tjGXjXXKJzTJwjNFhRDNzNx7N46616NZfoSmM2qd-
    LqctT7_f_T4EFFTndu9_Z7ISjWmDvH0NxZDq7b2TTdA3BLiS2MBY5E>
X-ME-Received: <xmr:Xsw6aZdqZOU3uX50caNldaS9eQIPUR8GFIPzp0qzd9zVaAoR7VXFmiYeJF5ebVsE1iOYk4m9ztMOrp8QKbl0jDfZ2xMBm-tLA4_WLeWqNMwu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkffuhffvveffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepfeejuedugeffkeegffdvtdeigfeltdfhveeiie
    ejgffggeffvdefleffteeffedvnecuffhomhgrihhnpegssggtlhgrshhsrdhsohenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepqhhirdgthhgvnhesfihinhgurhhivhgvrhdrtghomhdprhgtphhtth
    hopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvggu
    uggvugdrohhrghdprhgtphhtthhopegrlhgvgieslhhinhhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:Xsw6ae-PgwEJMiPoY9JCV_dRWNohJdREz0lF1rrtvjVkdWEs6iOZ3Q>
    <xmx:Xsw6aVl-CjU3VPVXrz406OWsi-MpdOnj8UjP8ex7HB4uz9XDcuP02g>
    <xmx:Xsw6aQ9DmbWNSsFhbEQa4Jii4j6c0CbhWcR2ii3_sLRtSdaGiMBXvw>
    <xmx:Xsw6aTkRKEZ6qqJQKTtk-k9R_E0g5zlJCEMEpUrfWxqMx7H7ofOM4A>
    <xmx:Xsw6aYcLGLRHh1HnujkdP89mgRMme4uXADtfzmRuKHok_UAmljQ1yM2p>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Dec 2025 08:51:25 -0500 (EST)
Message-ID: <09078a17ec73a43bfbda989cdc9f4a2ece5d4384.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH V5 2/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
From: Paul Barker <paul@pbarker.dev>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex@linutronix.de
Date: Thu, 11 Dec 2025 13:51:17 +0000
In-Reply-To: <20251204083208.1046464-2-Qi.Chen@windriver.com>
References: <20251204083208.1046464-1-Qi.Chen@windriver.com>
	 <20251204083208.1046464-2-Qi.Chen@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-kOZ7EBOT/T4Pc1JCwvuQ"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 13:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227530


--=-kOZ7EBOT/T4Pc1JCwvuQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-12-04 at 08:32 +0000, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> It's possible that users use EXTRA_USERS_PARAMS to set password
> for root or explicitly expire root password. So we need to check
> these two cases to ensure the 'no password' banner is not misleading.
>=20
> As an example, below are configurations to make an image requiring
> setting a root password on first boot, but without having to first enter
> a static initial password:
>=20
>   In conf/toolcfg.cfg:
>   OE_FRAGMENTS +=3D "distro/poky core/yocto/root-login-with-empty-passwor=
d
>   In local.conf:
>   INHERIT +=3D "extrausers"
>   EXTRA_USERS_PARAMS +=3D " passwd-expire root;"
>=20
> Checking and adding such a banner is ensured to run as last steps of
> ROOTFS_POSTPROCESS_COMMAND, regardless of IMAGE_FEATURES. In particualr,
> we want to ensure that the function runs after set_user_group function
> from extrausers.bbclass. So unlike other commands in this bbclass using
> the '+=3D', this function uses ':append'.
>=20
> Besides, adding such banner is only meaningful when base-passwd and
> baes-files are installed. In case of container image, they might not
> be installed (e.g., container-test-image). So add extra checking for it.
> With the above logic, we avoid breaking the following oe-selftest test ca=
se:
> containerimage.ContainerImageTests.test_expected_files
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes-recipe/rootfs-postcommands.bbclass | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/class=
es-recipe/rootfs-postcommands.bbclass
> index f4fbc4c57e..8d7e5e7652 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -5,7 +5,7 @@
>  #
> =20
>  # Zap the root password if empty-root-password feature is not enabled
> -ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"empty-root-password", "add_empty_root_password_note", "zap_empty_root_pass=
word ",d)}'
> +ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"empty-root-password", "", "zap_empty_root_password ",d)}'
> =20
>  # Allow dropbear/openssh to accept logins from accounts with an empty pa=
ssword string if allow-empty-password is enabled
>  ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"allow-empty-password", "ssh_allow_empty_password ", "",d)}'
> @@ -64,6 +64,10 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${SORT_PASSWD_POSTPRO=
CESS_COMMAND}'
>  #
>  ROOTFS_POSTPROCESS_COMMAND +=3D 'rootfs_reproducible'
> =20
> +# Check and add 'no root password' banner.
> +# This needs to done at the end of ROOTFS_POSTPROCESS_COMMAND, thus usin=
g :append.
> +ROOTFS_POSTPROCESS_COMMAND:append =3D " add_empty_root_password_note"

We should use +=3D instead of :append in all cases unless the semantics of
append are actually needed. My understanding is that we just need to
ensure that add_empty_root_password_note appears after
zap_empty_root_password in ROOTFS_POSTPROCESS_COMMAND, and we don't need
to use append to do that.

It would also be better to keep the root password related modifications
of ROOTFS_POSTPROCESS_COMMAND together, so please move these lines up so
they are immediately after the zap_empty_root_password change above.

Thanks,

--=20
Paul Barker


--=-kOZ7EBOT/T4Pc1JCwvuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaTrMVREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgb3AP9KLWAedLbX4OKivKYJXB7dDa+G3WEXdjP+
z+E2akSdNgD+I97y1IEBymk+XgEXZRkmRsH91IHBQw79aO2n/dMhrQc=
=5koE
-----END PGP SIGNATURE-----

--=-kOZ7EBOT/T4Pc1JCwvuQ--

