Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id BA6C66E668
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 11:10:55 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l65so92457254wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 03:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=180Md9jIvryVHfFKNJLF2fVuGIFPFHsAEulpfh8BN0k=;
	b=LapFgRIXW1d/4mcom8iC4WZZANZmCoTK/C6b3G52dRVkNXVyKm5FwdbgZeaoc3io0e
	6J3c2eSzMGXArsk5K2HqHM6wWaN2+VRBol7ffnZBk4I4rh87WJbeUHxofxTSMCbJEnPx
	xjrHENx/xCwdPl900s9PFZ2fyRH2DfmLmwjn6ePUMXFgNAjanH3CizeaaNjLfSMJX5XP
	UvpRGO6d8RiR3ioEOZsbLWLRrwR5CgDku3NHVBC/1WYI0lQmbQNvh0ecGRxVqFgtOWcv
	oRnliHNWM2QFHo6kUa39MMXCUoSEZSWkd5/nEjvhmU89xcMy5M5uOOoL5h3DXKg8kjXc
	6D9A==
X-Received: by 10.28.55.209 with SMTP id e200mr16696415wma.2.1452165056500;
	Thu, 07 Jan 2016 03:10:56 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ft4sm100353019wjb.37.2016.01.07.03.10.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 03:10:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Jan 2016 12:11:20 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20160107111120.GC2512@jama>
References: <cover.1452152689.git.liezhi.yang@windriver.com>
	<228ce5dac7d96467f7165add45a39cfcd12c7bfc.1452152689.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <228ce5dac7d96467f7165add45a39cfcd12c7bfc.1452152689.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] liberation-fonts: can't be allarch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jan 2016 11:10:57 -0000
X-Groupsio-MsgNum: 75559
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Content-Disposition: inline

--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2016 at 11:45:24PM -0800, Robert Yang wrote:
> liberation-fonts inherit fontcache which would depend on fontconfig, and
> fontconfig is not allarch, so that liberation-fonts can't be allarch.
>=20
> It caused a problem:
> $ bitbake lib32-core-image-sato
>=20
> Both lib32-fontconfig and fontconfig would be built, but fontconfig
> shouldn't, this patch can fix the problem.
>=20
> [YOCTO #8882]

liberation-fonts excludes fontconfig dependency since:
commit 0b5e868d160faca041cda42b670066facd4db531
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Tue Aug 25 17:58:12 2015 +0100

    layer.conf: Add several allarch dependency exclusions

If it doesn't work then you probably should remove the entry from
layer.conf as well.

>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../ttf-fonts/liberation-fonts_1.04.bb             |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/m=
eta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> index bda82e7..f64748c 100644
> --- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> +++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f"
>  PR =3D "r4"
>  PE =3D "1"
> =20
> -inherit allarch fontcache
> +inherit fontcache
> =20
>  FONT_PACKAGES =3D "${PN}"
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaOR9cACgkQN1Ujt2V2gBxpJACeJLVOF5aYvVSj9PNOsDFYjU6A
RicAmwXBCKhx8qNDYYkrkYV3QnL6UKyc
=MIiR
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
