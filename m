Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RQSnp-0004x3-Bc
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 00:52:33 +0100
Received: by eyd9 with SMTP id 9so6170768eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 15:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yVGVQhYT3BNcjP7vvwz8LNd/6kHtdktrwGigRTK/Qe8=;
	b=Ry3nLsxL9hfVGqh9HOKPiid7xEOddtWlxqfVnASCyboapUEnA58TnuWnyCg3AJlPvG
	WC9dJQza/7V3xu19dZERF++iccUrkdqDB+D678sfQJoMHf1uFNaK1YeR2sU5BCOMeLt5
	XDXwtCFfd8Fiq9tVdfiNOzi1ptHckLJJrCMUE=
Received: by 10.213.105.208 with SMTP id u16mr65596ebo.48.1321400770088;
	Tue, 15 Nov 2011 15:46:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b2sm2445470fao.1.2011.11.15.15.46.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Nov 2011 15:46:08 -0800 (PST)
Date: Wed, 16 Nov 2011 00:45:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111115234557.GD3600@jama.jama.net>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
	<d10d38e320b27bfbbf6d069e820a2b6c013bbbdc.1321028799.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d10d38e320b27bfbbf6d069e820a2b6c013bbbdc.1321028799.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][oe-core 14/22] libsdl: enable alsa/opengl based on PACKAGECONFIG and respect DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Nov 2011 23:52:33 -0000
X-Groupsio-MsgNum: 12516
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline

--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2011 at 05:28:50PM +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |   10 +++++++---
>  1 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes=
-graphics/libsdl/libsdl_1.2.14.bb
> index 17a3103..2f49f16 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7fd83=
877a8e3ef82b82798ef4"
> =20
>  PROVIDES =3D "virtual/libsdl"
> =20
> -DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libg=
l', '', d)} virtual/libx11 libxext libxrandr libxrender alsa-lib tslib"
> +DEPENDS =3D "virtual/libx11 libxext libxrandr libxrender tslib"
>  DEPENDS_virtclass-nativesdk =3D "libx11-nativesdk libxrandr-nativesdk li=
bxrender-nativesdk libxext-nativesdk"

As Saul reported PACKAGECONFIG adds build time depends not only to
DEPENDS but they also ends in DEPENDS_virtclass-nativesdk and nothing
provides virtual/libgl-nativesdk. So I've resend this patch changing
only alsa handling to PACKAGECONFIG and keeping opengl as it was.

Cheers,

>  PR =3D "r1"
> @@ -29,17 +29,21 @@ SRC_URI[sha256sum] =3D "5d927e287034cb6bb0ebccfa382cb=
1d185cb113c8ab5115a0759798642
>  inherit autotools binconfig pkgconfig
> =20
>  EXTRA_OECONF =3D "--disable-static --disable-debug --enable-cdrom --enab=
le-threads --enable-timers --enable-endian \
> -                --enable-file --disable-oss --enable-alsa --disable-esd =
--disable-arts \
> +                --enable-file --disable-oss --disable-esd --disable-arts=
 \
>                  --disable-diskaudio --disable-nas --disable-esd-shared -=
-disable-esdtest \
>                  --disable-mintaudio --disable-nasm --enable-video-x11 --=
disable-video-dga \
>                  --disable-video-fbcon --disable-video-directfb --disable=
-video-ps2gs --disable-video-ps3 \
>                  --disable-video-xbios --disable-video-gem --disable-vide=
o-dummy \
>                  --enable-input-events --enable-input-tslib --enable-pthr=
eads \
> -		${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl',=
 '--disable-video-opengl', d)} \
>  		--disable-video-svga \
>                  --disable-video-picogui --disable-video-qtopia --enable-=
dlopen \
>                  --disable-rpath"
> =20
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'open=
gl', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '=
', d)}"
> +PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib,"
> +PACKAGECONFIG[opengl] =3D "--enable-video-opengl,--disable-video-opengl,=
virtual/libgl,"
> +
>  PARALLEL_MAKE =3D ""
> =20
>  EXTRA_AUTORECONF +=3D "--include=3Dacinclude --exclude=3Dautoheader"
> --=20
> 1.7.8.rc1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7C+bUACgkQN1Ujt2V2gBwhZgCeMUMYTgV0YQ/SrDjK3JSq48rL
sLkAn1szPdKlVrui3kvjYisZ/Tvdlf+L
=xUM7
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
