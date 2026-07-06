Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81C8C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:52:56 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146686.1783331574251511292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=PARQtPjl;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=TmfSVdkH;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 41C4F7A00DB;
	Mon,  6 Jul 2026 05:52:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 06 Jul 2026 05:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1783331573; x=1783417973; bh=2VQ3i7K/Z4
	6w0841Db7yPVu6W6fHrLl25P+jLx970BU=; b=PARQtPjlVTwkBQyIW/hfP78Dro
	E+hInI8W7DT37DoddC6+zgi/ZJejhbu1ontHVFcFIiN7zJeBS+jVGlWs6TWkPKgz
	s70xAvQIK/c9IqClmdTkxVkPbDwBHPE3HeVfF6jNF7et7Rf0OZcSX0GNk2hHOA/9
	/mpGc0RxuS+dlpJ2nofxHRM1y+rnDN9RAg38NoFfoBgSWSRnLWykHzIPcDGKKo4x
	xkLpbJ/pr+nVVwi1U4UMeO/NOAD9fK06JkCcCYk0hPzuf89SowoE7efKLhnAcg+Z
	p5fnvgxUhLTlDwDDzxOVUDAnmnzCSFuJeTxhXaWoSoS0MBM21zcTTSyrlYjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783331573; x=1783417973; bh=2VQ3i7K/Z46w0841Db7yPVu6W6fHrLl25P+
	jLx970BU=; b=TmfSVdkH6mfnKJEoTi1flt9B+lAuuwSicLh3qIRPE/aFVgBU8S9
	Y0IST4cUiAdjYARVqlXpCpmwyZ96xkorNoGX6MEvnY/Gb14N4fJ5kksw3VERozum
	4oVh7UCBcDg/wIke7cEXz6xYSdB1p2qqagm/6C3Laj4h3DFy9qFeReN+WFmku0Ox
	JjX3aphouCDKof3/GIe+/5zVisLGGi1/9wopfuvwBxksJXAu7AzhsDzfUb3fXs0k
	mYSZStEw5h1KzA70G1xOPFRpnuhnHfxts8FH58yfqle3FAZi48GKXhWDxdm9Ct2H
	5+o8kJBpN3tb7Fm8QuDBODxYT0IKNXTW2fA==
X-ME-Sender: <xms:9HpLajAGrJM1IrG0kn21TLQcSyIFWxEfV1CtdkeoT5PSBeb4e-ZBaw>
    <xme:9HpLavhhoZpFFTU7VFm_CR9l3_Y8Cu6noPnHXLA73WhWnPwMcY7PHpA-rHPDubMn5
    PDaJA-Fhc5QW3ylqwp4tbQAOpXtKOL0d7fZxZSCQEwfj_3Go3QKdQM>
X-ME-Received: <xmr:9HpLasN8pGn3EsK6CgBrkiCC5RYPgykuWa62yErBOkMAJ69a8CRdeT0FUAIFACZDwfUZjVL7M_STM0ooe_CBlcw33yp9BpocSVmyS7BKSth0>
X-ME-Proxy-Cause: dmFkZTF7wM2k3mfg/iDGs0/813csj1ZlrlLE/mQq6JIAbGx6xG6ld1HfQ8ejTY5NCN8Q0v
    UwU8+AgEvuXTIKBZTNQDJwej2yNixvyJfhv4zDOMMs4bP49+f8YZEeIRjtCjy17T7dO9tq
    49yTQ+1l1WlHrirZIUyw7fbD0ppXXAQ5VYXMxdWoCTjoD34uoz50o5mPf7pNJlBDr/i7V+
    7WrPSlJWWhbsGv9JYvD3iph62gXMDvwXxT7M4QpM5wsu2SEJxT5W1BfK9MRu2ENA1NNvhF
    O3Jt9oU6xHkGN1Z/1iB8532V5iFE/jUYJgJk26jeD/HQeC4tSIcMplFxrzEcu2iwANltp0
    3Hu/QISJ3uZNltUwZofEMkffFmOKdKn0m0hJu+gDJ7phwa2zAk8K8R4k5HGm2QEi/r87OJ
    6MG8XaHJ2Luy1mGDs44zkFd+LbkT5ZOXGT85aaZDx9mH44GS7DLYnNzLqa5euI3EHOEElB
    ZwW+308loUpqqS4A6TA3KXqaxWGxhclh43CHBssrjEPFCzSjiIew7e9hpC70XhAFVcRPqy
    GDVa9YUJj0UwB3/LC8TE5m7nPtNsbmCdZrZuyVB9EUJGaEYN1SpB9T/R+thf3mhtatASxj
    uHsmtEyyqMdHUeWUTLfczN7tGowqnpz43bIfR32j34oLCA9j89Qae+tu2OiQ
X-ME-Proxy: <xmx:9HpLag6avggOz_mPQMWHm64xKu5N73ASiGe1xk-dcfQqiVKTMd8kdA>
    <xmx:9HpLaq2pPgqBVjUUMoRxp9_x2xEsvlCyafcaVILWNeE3jMFPNTjhYw>
    <xmx:9HpLahaYM7gAMj7lLNL-YOuKFnorWBJi-3BiTO2Lcsaen7vYO_5tDw>
    <xmx:9HpLaiA4eOwKAn8zh2LNdBgBAbyq25RZz-u_r0tvSZ-MXkhDWzueVQ>
    <xmx:9XpLaraBCIH8H25IM_yLNKjbFRuwAELts4EXTNxmY2gwySH92LyLBPxF>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jul 2026 05:52:52 -0400 (EDT)
Message-ID: <40bc682b0d30a05ea7043ca1a5ac1699c72ae268.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] meta: Add pam to the defaults if using systemd
From: Paul Barker <paul@pbarker.dev>
To: leon.anavi@konsulko.com, openembedded-core@lists.openembedded.org
Date: Mon, 06 Jul 2026 10:52:48 +0100
In-Reply-To: <20260703142916.2868287-1-leon.anavi@konsulko.com>
References: <20260703142916.2868287-1-leon.anavi@konsulko.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-C8In9G9W25TmU5LtXG5G"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 09:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240233


--=-C8In9G9W25TmU5LtXG5G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-07-03 at 17:29 +0300, Leon Anavi via lists.openembedded.org
wrote:
> Add pam to the list of DISTRO_FEATURES_DEFAULTS if variable
> VIRTUAL-RUNTIME_init_manager has been set to systemd. Otherwise
> having systemd in conjunction with wayland but without pam leads
> to a conflict with the REQUIRED_DISTRO_FEATURES for weston related
> recipes.
>=20
> This adjustment is required following these recent changes that
> switched VIRTUAL-RUNTIME_init_manager to systemd by default and added
> wayland to DISTRO_FEATURES_DEFAULTS which affects "nodistro":
>=20
> - 159148f4de2595556fef6e8678578df83383857b
>   meta: Support opting out of any distro features
>   (Please note that this commit also extended DISTRO_FEATURES_DEFAULTS
>   with wayland and vulkan.)
>=20
> - 0b4061c5d50261f826d0edb4b478d2d305274b7c
>   conf: Switch to systemd by default and simplify init manager selection
>=20
> This fixes issues with test_machine_world when running the
> yocto-check-layer script for BSP layers that include weston in the
> dependency chain, for example meta-tegra:
>=20
> ERROR: Required build target 'meta-world-pkgdata' has no buildable provid=
ers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'l4t-=
graphics-demos', 'weston']
>=20
> The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is
> enabled. Therefore, it makes sense to also add pam to the defaults
> through DISTRO_FEATURES_DEFAULTS.
>=20
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  meta/conf/distro/include/default-distrovars.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> index 69c6db589b..2eadfcbd74 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -29,6 +29,7 @@ DISTRO_FEATURES_DEFAULTS ?=3D " \
>      acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \
>      wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
>      gobject-introspection-data ldconfig opengl ptest multiarch wayland v=
ulkan \
> +    ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '=
pam', '', d)} \
>      "
>  IMAGE_FEATURES ?=3D ""

Hi Leon,

I'm not sure we want to enable pam for everyone using systemd, there may
be many systemd users who don't use weston.

If we do want to enable pam whenever systemd is in use, the better place
to do it is in meta/conf/distro/include/init-manager-systemd.inc.

An alternative, though not the most satisfying, may be to add a
REQUIRED_DISTRO_FEATURES check to the l4t-graphics-demos recipe in
meta-tegra.

Best regards,

--=20
Paul Barker


--=-C8In9G9W25TmU5LtXG5G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCakt68REccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjq+AQDfErfEw1GeE4WNsgldZvJxz+biChBJT6Z1
wIA1+XRMtwEAnYJt9k9OrhIJOlD5jOD5o8AVv3nW0pTsG0IJHN/IGQo=
=6e7Q
-----END PGP SIGNATURE-----

--=-C8In9G9W25TmU5LtXG5G--

