Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id E50086E253
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 17:35:33 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so1725447ead.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 09:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LQbL2WqU21ShT6J1lGivuWwmU4vnyB+pO3KG5iMkl/8=;
	b=g+igTv+CjC2PNATWPHUL3gL3b6MebfFKuS6XpKKR4SSMP3phGZDX9IOVYw8JEKr5Gk
	ro+z1COA7ldVbmJjfhXHAk8eLV4RB5/pdeiRziPD+zTpcfPQa+KyTB4qcdutCv8YUrbA
	yKAoqizY/sb8zg+zJ0QQvoLbAOQ4BJVFpi7RlL8ssnfWK8OFJZUvKFVRVna9x9/ozKGv
	m2b5uvxV9+INH1G/qCFQEIFVrPLaZ4P0BTcCWUZuB4BHLqRzt8cYR+qOK63kUOqD2YC8
	+ahYKUvYSVI7LlyHjQWuNEFmrtG+Jt9OIjIvTI6FuLJvdBhXHmhD5hSJQApX82ZF5fe1
	8G8w==
X-Received: by 10.14.113.199 with SMTP id a47mr13884200eeh.41.1386610533115;
	Mon, 09 Dec 2013 09:35:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm1388959eed.14.2013.12.09.09.35.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Dec 2013 09:35:32 -0800 (PST)
Date: Mon, 9 Dec 2013 18:35:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20131209173551.GC3713@jama>
References: <1386608307-4348-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1386608307-4348-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libxcb: fix rebuild when MACHINE changes
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
X-List-Received-Date: Mon, 09 Dec 2013 17:35:35 -0000
X-Groupsio-MsgNum: 48031
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline

--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2013 at 04:58:27PM +0000, Ross Burton wrote:
> This recipe was patching the sysroot path directly into configure.ac, whi=
ch
> fails when the same source tree is re-used for another machine.
>=20
> Instead, patch in $PKG_CONFIG_SYSROOT_DIR which is already exported for u=
se by
> pkg-config.

Does it make libxcb signature MACHINE-specific or is sysroot path
excluded from PKG_CONFIG_SYSROOT_DIR like with STAGING_DIR_HOST?

Maybe I fail to see how it fixes the issue with re-used configured
directory.

> Also remove some commented-out lines that have no purpose.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/xorg-lib/libxcb.inc          |   16 ++------------
>  .../xorg-lib/libxcb/xcbincludedir.patch            |   23 ++++++++++++++=
++----
>  2 files changed, 21 insertions(+), 18 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libxcb.inc b/meta/recipes-gra=
phics/xorg-lib/libxcb.inc
> index 91df1be..7f9b0af 100644
> --- a/meta/recipes-graphics/xorg-lib/libxcb.inc
> +++ b/meta/recipes-graphics/xorg-lib/libxcb.inc
> @@ -12,10 +12,9 @@ LICENSE =3D "MIT-X"
> =20
>  PARALLEL_MAKE =3D ""
>  DEPENDS =3D "xcb-proto xproto libxau libxslt-native xcb-proto-native lib=
pthread-stubs"
> -# DEPENDS +=3D "xsltproc-native gperf-native"
> =20
> -SRC_URI =3D "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2"
> -#           file://xcbincludedir.patch"
> +SRC_URI =3D "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
> +           file://xcbincludedir.patch"
> =20
>  PACKAGES =3D+ "libxcb-composite libxcb-damage libxcb-dpms libxcb-glx \
>               libxcb-randr libxcb-record libxcb-render libxcb-res \
> @@ -25,7 +24,6 @@ PACKAGES =3D+ "libxcb-composite libxcb-damage libxcb-dp=
ms libxcb-glx \
>               libxcb-dri2 libxcb-dri3 libxcb-present"
> =20
>  FILES_${PN} =3D "${libdir}/libxcb.so.*"
> -#FILES_${PN}-dev =3D "${libdir}/libxcb.* ${libdir}/pkgconfig/*.pc ${incl=
udedir}/xcb/*.h"
>  FILES_libxcb-dri2 =3D "${libdir}/libxcb-dri2.so.*"
>  FILES_libxcb-dri3 =3D "${libdir}/libxcb-dri3.so.*"
>  FILES_libxcb-composite =3D "${libdir}/libxcb-composite.so.*"
> @@ -52,13 +50,3 @@ FILES_libxcb-xvmc =3D "${libdir}/libxcb-xvmc.so.*"
>  FILES_libxcb-present =3D "${libdir}/libxcb-present.so.*"
> =20
>  inherit autotools pkgconfig pythonnative
> -
> -# XCBPROTO_XCBINCLUDEDIR is set based on `pkg-config --variable=3Dxcbinc=
ludedir xcb-proto`
> -# but the xcbincludedir variable doesn't point into the staging area, so=
 it needs some
> -# tweaking here:
> -do_configure_prepend () {
> -    sed -i "s|XCBPROTO_XCBINCLUDEDIR=3D\`|XCBPROTO_XCBINCLUDEDIR=3D${STA=
GING_DIR_HOST}/\`|" \
> -        ${S}/configure.ac
> -    sed -i "s|XCBPROTO_XCBPYTHONDIR=3D\`|XCBPROTO_XCBPYTHONDIR=3D${STAGI=
NG_DIR_HOST}/\`|" \
> -        ${S}/configure.ac
> -}
> diff --git a/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch b/=
meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
> index d858a63..46297c3 100644
> --- a/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
> +++ b/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
> @@ -1,8 +1,14 @@
> -Upstream-Status: Inappropriate [configuration]
> +As pkg-config --variable doesn't respect the sysroot, add the pkg-config=
 sysroot
> +to the beginning of variables that are used later on the host.
> =20
> ---- libxcb-1.0.orig/configure.ac	2006-11-23 15:33:01.000000000 +0000
> -+++ libxcb-1.0/configure.ac	2008-09-10 20:29:12.000000000 +0100
> -@@ -50,7 +50,7 @@
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/configure.ac b/configure.ac
> +index 94da4f7..d29cd6a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -64,7 +64,7 @@ AC_SUBST(NEEDED)
>  =20
>   # Find the xcb-proto protocol descriptions
>   AC_MSG_CHECKING(XCBPROTO_XCBINCLUDEDIR)
> @@ -11,3 +17,12 @@ Upstream-Status: Inappropriate [configuration]
>   AC_MSG_RESULT($XCBPROTO_XCBINCLUDEDIR)
>   AC_SUBST(XCBPROTO_XCBINCLUDEDIR)
>  =20
> +@@ -74,7 +74,7 @@ AC_SUBST(XCBPROTO_VERSION)
> +=20
> + # Find the xcbgen Python package
> + AC_MSG_CHECKING(XCBPROTO_XCBPYTHONDIR)
> +-XCBPROTO_XCBPYTHONDIR=3D`$PKG_CONFIG --variable=3Dpythondir xcb-proto`
> ++XCBPROTO_XCBPYTHONDIR=3D$PKG_CONFIG_SYSROOT_DIR/`$PKG_CONFIG --variable=
=3Dpythondir xcb-proto`
> + AC_MSG_RESULT($XCBPROTO_XCBPYTHONDIR)
> + AC_SUBST(XCBPROTO_XCBPYTHONDIR)
> +=20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKl/3cACgkQN1Ujt2V2gByDoQCfX+5l6nUq693qKyn2MAxBzLvo
H8kAn0+HrMYUCY5gqw8xgo5oy7attCKm
=Z9SO
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
