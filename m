Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1NEQ-00021H-5D
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 20:24:34 +0100
Received: by eaae1 with SMTP id e1so52774eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 11:16:10 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.97.70 as permitted sender) client-ip=10.14.97.70; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.97.70 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.97.70])
	by 10.14.97.70 with SMTP id s46mr1188458eef.59.1330197370199 (num_hops
	= 1); Sat, 25 Feb 2012 11:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zk3pnchILAq8a5CENSux0+Mep9Ph+xOUNHCbK9bUfRQ=;
	b=ipJO0q9POJLfoL1cZm0PmjQINhiMaOxJfMdK6b06mFyOrQQioh437wCwE3MzLwT54j
	lljmPtCZE6FADegwP3CKkFGU2a4+qfN7AvvSTtMet7deOW/6ddDrTCgrYDAa7BjsXqFq
	LjgdKDfGXs+bP8Rb9y111j5zFeir4aDgNJiVg=
Received: by 10.14.97.70 with SMTP id s46mr878320eef.59.1330197369869;
	Sat, 25 Feb 2012 11:16:09 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm35059566eei.3.2012.02.25.11.16.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Feb 2012 11:16:09 -0800 (PST)
Date: Sat, 25 Feb 2012 20:16:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120225191607.GQ3769@jama.jama.net>
References: <1330185446.13788.40.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1330185446.13788.40.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] glib: Drop dbus dependency, it isn't useful
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
X-List-Received-Date: Sat, 25 Feb 2012 19:24:34 -0000
X-Groupsio-MsgNum: 17970
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRVuaM4kMZyzPyLG"
Content-Disposition: inline

--jRVuaM4kMZyzPyLG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2012 at 03:57:26PM +0000, Richard Purdie wrote:
> dbus is only needed for some of the glib tests which we don't use. We can
> therefore drop the dependency and gain some small parallelism gains.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/dist=
ro/poky-tiny.conf
> index 411347a..5d1d67a 100644
> --- a/meta-yocto/conf/distro/poky-tiny.conf
> +++ b/meta-yocto/conf/distro/poky-tiny.conf
> @@ -108,3 +108,5 @@ IMAGE_FSTYPES =3D "ext2 cpio.gz"
>  #        variants of all compatible machines, but that leads to a lot
>  #        more machine configs to maintain long term.
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS =3D ""
> +
> +ASSUME_PROVIDED +=3D "pkgconfig$"

^^ this doesn't seem related to this patch and what's meaning of trailing $=
, or just typo?

> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch b/meta/reci=
pes-core/glib-2.0/glib-2.0/nodbus.patch
> new file mode 100644
> index 0000000..1486203
> --- a/dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch
> @@ -0,0 +1,23 @@
> +Disable dbus dependency. Autodetecting isn't deterministic, we don't hav=
e the DEPENDS
> +and we don't want to built this piece so hardcode it off.
> +
> +RP 2012/2/25
> +
> +Index: glib-2.30.2/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- glib-2.30.2.orig/configure.ac	2012-02-25 14:50:07.444242397 +0000
> ++++ glib-2.30.2/configure.ac	2012-02-25 14:51:28.096240485 +0000
> +@@ -3769,10 +3769,9 @@
> + # Check for libdbus1 - Optional - is only used in the GDBus test cases
> + #
> + # 1.2.14 required for dbus_message_set_serial
> +-PKG_CHECK_MODULES(DBUS1,
> +-                  dbus-1 >=3D 1.2.14,
> +-                  [AC_DEFINE(HAVE_DBUS1, 1, [Define if dbus-1 is availa=
ble]) have_dbus1=3Dyes],
> +-                  have_dbus1=3Dno)
> ++DBUS1_CFLAGS=3D
> ++DBUS1_LIBS=3D
> ++$have_dbus1=3Dno     =20
> + AC_SUBST(DBUS1_CFLAGS)
> + AC_SUBST(DBUS1_LIBS)
> + AM_CONDITIONAL(HAVE_DBUS1, [test "x$have_dbus1" =3D "xyes"])
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.30.2.bb
> index e2170bc..0b26575 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
> @@ -1,6 +1,6 @@
>  require glib.inc
> =20
> -PR =3D "r5"
> +PR =3D "r6"
>  PE =3D "1"
> =20
>  DEPENDS +=3D "libffi python-argparse-native zlib"
> @@ -14,6 +14,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.bz2 \
>             file://60_wait-longer-for-threads-to-die.patch \
>             file://g_once_init_enter.patch \
>             file://glib-2.0_fix_for_x32.patch \
> +           file://nodbus.patch \
>            "
>  SRC_URI[md5sum] =3D "b40f3889e8d24e1b367763673ca6deb5"
>  SRC_URI[sha256sum] =3D "94b1f1a1456c67060ca868d299bef3f7268a2c1c5c360aab=
b7149d4d9b2fdcd3"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index d553869..6eddf8f 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -13,8 +13,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd=
002f49e7bb854063f7e7 \
>  BUGTRACKER =3D "http://bugzilla.gnome.org"
>  SECTION =3D "libs"
> =20
> -DEPENDS =3D "glib-2.0-native gtk-doc-native zip dbus"
> -DEPENDS_virtclass-native =3D "gtk-doc-native pkgconfig-native gettext-na=
tive dbus-native"
> +DEPENDS =3D "glib-2.0-native gtk-doc-native zip"
> +DEPENDS_virtclass-native =3D "gtk-doc-native pkgconfig-native gettext-na=
tive"
>  DEPENDS_virtclass-nativesdk =3D "libtool-nativesdk"
>  PACKAGES =3D+ "${PN}-utils "
> =20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jRVuaM4kMZyzPyLG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9JM3cACgkQN1Ujt2V2gByX9QCfeA3jSSeS5Cgh4RmzkQCJWI09
L/wAnRSosDf18ShRGky+ycBLhRiZblaI
=kICq
-----END PGP SIGNATURE-----

--jRVuaM4kMZyzPyLG--
