Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUYgO-0001kR-IU
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 09:30:04 +0200
Received: by werg55 with SMTP id g55so261685wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 00:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wC73lTXIu10LGOqydQLb0gkm0atQVFPe/z0iYwCnEpg=;
	b=NwhWgSZxuOkwKOE3sFEr7DX9wh0d314KlFlYDJ6GZpdL2JLCndhytXFK+2TQIj2gtW
	lRws3FX35tm1NstrW6FjPG9HEtGBC3cdjLRqKEQFvcMDl0j9i5dyMM6bPtOW6/1r97PS
	t0C/Fl8hg8kqSLbHTT8LnuQbUYkWquDGj/MsPKThpdMrEQgPxMVOHVL4ib83+BKoLgqF
	Yw7WjyJjba05ijZ9NqhJW24DnnUwoIpLauQIqH4Cu6AzXwynW2mMjYK3DgKPOrJ3HETM
	abwN36itZ5Ac3ENtR8jIxLsmlPsYHMRK55nS/WJSdsdsKGdMZnC/WErWUtJJTbHmiMDb
	29mA==
Received: by 10.180.92.130 with SMTP id cm2mr5167027wib.4.1337152803096;
	Wed, 16 May 2012 00:20:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id et10sm36381508wib.2.2012.05.16.00.20.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 00:20:01 -0700 (PDT)
Date: Wed, 16 May 2012 09:20:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120516072002.GF3166@jama.jama.net>
References: <20120507154926.7584310217@opal>
MIME-Version: 1.0
In-Reply-To: <20120507154926.7584310217@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Richard Purdie : glib-2.0: Fix issues with libelf dependency creeping in
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
X-List-Received-Date: Wed, 16 May 2012 07:30:05 -0000
X-Groupsio-MsgNum: 22183
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tmoQ0UElFV5VgXgH"
Content-Disposition: inline

--tmoQ0UElFV5VgXgH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 07, 2012 at 03:49:24PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 2929e7d590862d9649458c90804e79a1dce40423
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D2929e7d590862d9649458c90804e79a1dce40423
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Mon May  7 09:49:43 2012 +0000
>=20
> glib-2.0: Fix issues with libelf dependency creeping in
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

FWIW: glib-2.32.3 should now use libelf only for parts which are
actually using that:

http://git.gnome.org/browse/glib/commit/?h=3Dglib-2-32&id=3D7fe1f97a128be5f=
48dcd1232250e96bd581a35c1

but still no configure option for that..

Cheers,

>=20
> ---
>=20
>  meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch |   37 ++++++++++++++=
++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb      |    2 +
>  2 files changed, 39 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch b/meta/re=
cipes-core/glib-2.0/glib-2.0/nolibelf.patch
> new file mode 100644
> index 0000000..e9b3b26
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
> @@ -0,0 +1,37 @@
> +Ideally there would be configureation option for this but there is not. =
We
> +can't allow this code since it could detect the host system's libelf with
> +disasterous effects when cross compiling.
> +
> +RP 2012/5/7
> +
> +Upstream-Status: Pending (would need to be made a configure option to di=
sabe)
> +
> +Index: glib-2.32.2/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- glib-2.32.2.orig/configure.ac	2012-05-07 08:30:04.481149925 +0000
> ++++ glib-2.32.2/configure.ac	2012-05-07 08:31:02.185148588 +0000
> +@@ -1816,23 +1816,7 @@
> + dnl *** check for libelf ***
> + dnl ************************
> +=20
> +-PKG_CHECK_MODULES([LIBELF], [libelf], [have_libelf=3Dyes], [have_libelf=
=3Dmaybe])
> +-
> +-if test $have_libelf =3D maybe; then
> +-  AC_CHECK_LIB([elf], [elf_begin], , [have_libelf=3Dno])
> +-  AC_CHECK_LIB([elf], [elf_getshdrstrndx], , [have_libelf=3Dno])
> +-  AC_CHECK_LIB([elf], [elf_getshdrnum], , [have_libelf=3Dno])
> +-  AC_CHECK_HEADER([libelf.h], , [have_libelf=3Dno])
> +-
> +-  if test $have_libelf !=3D no; then
> +-    LIBELF_LIBS=3D-lelf
> +-    have_libelf =3D yes
> +-  fi
> +-fi
> +-
> +-if test $have_libelf =3D yes; then
> +-  AC_DEFINE(HAVE_LIBELF, 1, [Define if libelf is available])
> +-fi
> ++have_libelf=3Dno
> +=20
> + dnl ****************************************
> + dnl *** platform dependent source checks ***
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.32.2.bb
> index f303cb4..b9b3356 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
> @@ -1,6 +1,7 @@
>  require glib.inc
> =20
>  PE =3D "1"
> +PR =3D "r1"
> =20
>  DEPENDS +=3D "libffi python-argparse-native zlib"
>  DEPENDS_virtclass-native +=3D "libffi-native python-argparse-native"
> @@ -13,6 +14,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
>             file://60_wait-longer-for-threads-to-die.patch \
>             file://glib-2.0_fix_for_x32.patch \
>             file://nodbus.patch \
> +           file://nolibelf.patch \
>            "
>  SRC_URI[md5sum] =3D "5bfdb6197afb90e4dbc7b1bb98f0eae0"
>  SRC_URI[sha256sum] =3D "b1764abf00bac96e0e93e29fb9715ce75f3583579acac406=
48e18771d43d6136"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tmoQ0UElFV5VgXgH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+zVSIACgkQN1Ujt2V2gByFBwCfV0W7D/f8sr5z6/2xa7uc+97c
ytIAnRQoOXXnCL/mzPQA8tcSMYJgAZOm
=GQws
-----END PGP SIGNATURE-----

--tmoQ0UElFV5VgXgH--
