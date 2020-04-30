Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2064.1588285421652345017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 060FD40C0F;
	Thu, 30 Apr 2020 22:23:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jFc4fU9KqSOP; Thu, 30 Apr 2020 22:23:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DC80D400E7;
	Thu, 30 Apr 2020 22:23:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 70E41172D02; Thu, 30 Apr 2020 18:23:36 -0400 (EDT)
Date: Thu, 30 Apr 2020 18:23:36 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: =?utf-8?Q?Bart=C5=82omiej?= Burdukiewicz <bartlomiej.burdukiewicz@gmail.com>
Subject: Re: [OE-core][PATCH 1/2] libva: add PACKAGECONFIG and additonal rules for glx.
Message-ID: <20200430222336.GX11927@denix.org>
References: <20200429202745.3891440-1-bartlomiej.burdukiewicz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200429202745.3891440-1-bartlomiej.burdukiewicz@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 10:27:44PM +0200, Bart=C5=82omiej Burdukiewicz wrot=
e:
> * glx PACKAGECONFIG by default is selected when x11 and opengl
> flag is present in DISTRO_FEATURES.
>=20
> * virtual/mesa is only required when glx driver is selected to
> build.

Thank you so much!

It was very unfortunate that hard dependency on mesa and=20
REQUIRED_DISTRO_FEATURES=3D"opengl" was slapped all over oe-core=20
(not just this recipe) - rather one-sided approach... :)

Very glad to see overall situation improving here. Thanks again!


> Signed-off-by: Bart=C5=82omiej Burdukiewicz <bartlomiej.burdukiewicz@gma=
il.com>
> ---
>  meta/recipes-graphics/libva/libva_2.6.1.bb | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb b/meta/recipes-g=
raphics/libva/libva_2.6.1.bb
> index 92cea83bc1..8c495bad70 100644
> --- a/meta/recipes-graphics/libva/libva_2.6.1.bb
> +++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
> @@ -23,15 +23,21 @@ SRC_URI[sha256sum] =3D "6c57eb642d828af2411aa38f55dc=
10111e8c98976dbab8fd62e4862940
>  
>  UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases"
>  
> -DEPENDS =3D "libdrm virtual/mesa"
> +DEPENDS =3D "libdrm"
>  
>  inherit meson pkgconfig features_check
>  
>  REQUIRED_DISTRO_FEATURES =3D "opengl"
>  
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11=
', d)}"
> -PACKAGECONFIG[x11] =3D "-Dwith_x11=3Dyes, -Dwith_x11=3Dno,virtual/libx1=
1 libxext libxfixes"
> -PACKAGECONFIG[wayland] =3D "-Dwith_wayland=3Dyes, -Dwith_wayland=3Dno,w=
ayland-native wayland"
> +PACKAGECONFIG ??=3D " \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '', d)=
} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)} \
> +"
> +
> +PACKAGECONFIG[x11] =3D "-Dwith_x11=3Dyes,-Dwith_x11=3Dno,virtual/libx11=
 libxext libxfixes"
> +PACKAGECONFIG[glx] =3D "-Dwith_glx=3Dyes,-Dwith_glx=3Dno,virtual/mesa"
> +
> +PACKAGECONFIG[wayland] =3D "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,wa=
yland-native wayland"
>  
>  PACKAGES =3D+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
>  
> --=20
> 2.26.2
>=20

>=20

