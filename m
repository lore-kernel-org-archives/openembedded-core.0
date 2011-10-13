Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REHS5-0007JF-H1
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 11:19:45 +0200
Received: by bkat8 with SMTP id t8so308766bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=M5+qoOwBnXKbs8EmSiXr/2I6WKsp+PxBPFYxh4f471M=;
	b=tzIF6wUPHfA/kNiwZ6Sz27iyYAD+YHoblsJVaFEKmuwU9za9PGvNmnHI4oKY6zPk7G
	4HoFHfKj6urURtmEkbd+2mBpwl3egxiU+S8aGs9BC8P7/e6M5bQOYPYthyyDrdlBV9kR
	nDpbPnl2bN1nVnsoW9zTWE07iLCcNd94ZQ7Rk=
Received: by 10.204.140.27 with SMTP id g27mr1984317bku.72.1318497241757;
	Thu, 13 Oct 2011 02:14:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a27sm2798796bku.9.2011.10.13.02.13.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 02:14:00 -0700 (PDT)
Date: Thu, 13 Oct 2011 11:13:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111013091353.GB7661@jama.jama.net>
References: <cover.1318496401.git.kai.kang@windriver.com>
	<57a9134211e3be47d7072ad2b1aa06b443a95927.1318496401.git.kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <57a9134211e3be47d7072ad2b1aa06b443a95927.1318496401.git.kai.kang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/4] mesa-dri/xlib: use target commands in mklib file
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
X-List-Received-Date: Thu, 13 Oct 2011 09:19:45 -0000
X-Groupsio-MsgNum: 10906
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 05:05:33PM +0800, Kang Kai wrote:
> the bin/mklib file in mesa-dri/xlib source code uses commands on
> hosts, this may cause build failed on some platform.
>=20
> Patches are from WindRiver Linux, and CQID are:
>     WIND00266791
>     WIND00266497

Please check my mesa patchset in=20
openembedded-core-contrib/jansa/x11-v4
and please test it if it still applies to mesa-git too

And mesa-use-target-commands-in-mklib.patch doesn't have Upstream-Status

Regards,

>=20
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  .../mesa-use-target-commands-in-mklib.patch        |  104 ++++++++++++++=
++++++
>  meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    3 +-
>  meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    3 +-
>  3 files changed, 108 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-c=
ommands-in-mklib.patch
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-commands=
-in-mklib.patch b/meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-comma=
nds-in-mklib.patch
> new file mode 100644
> index 0000000..1bc2a57
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-commands-in-mkl=
ib.patch
> @@ -0,0 +1,104 @@
> +This patch is merged from WindRiver linux commits, and it is to avoid bu=
ild failed on some platform because of using the commands on host.
> +
> +And original commits are:
> +
> +commit 8d5ccc8113e1b51b0529a00c18a4aba956247e1b
> +Author: Yulong Pei <Yulong.pei@windriver.com>
> +Date:   Tue Apr 12 22:14:10 2011 +0800
> +
> +    fix mesa-dri build fails on x86-64
> +   =20
> +    CQID: WIND00266791
> +   =20
> +    1. mesa-dri uses it's own script (mklib) to generate libraries, and =
it
> +    calls the host's ar/ranlib/gcc/g++. This fixes mklib so that it call=
s the
> +    cross-compiling tools properly.
> +   =20
> +    2. override PYTHON2 with 'python', 'python2' is not available in hos=
t-tools python.
> +    Only 'python' and 'python2.6' are provided. So force configure to us=
e 'python'.
> +   =20
> +    And the above two changes are ported from mesa-xlib.
> +   =20
> +    Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> +
> +commit 5c4212084b871a0c0fb7d174280ec9a634637deb
> +Author: Bowen <Bowen.zhu@windriver.com>
> +Date:   Mon Apr 11 16:25:02 2011 +0800
> +
> +    Fix freeglut build failed for mips64_octeon-glibc_std_xapps
> +   =20
> +    CQID: 266497
> +   =20
> +    freeglut build failed on some hosts, because of mesa-xlib uses host =
ar command,
> +    in some hosts, host ar command can't recognize target library, which=
 will make some
> +    symbols in libGL undefined.
> +   =20
> +    The fix is modifing mklib script in mesa-xlib, change fixed "ar" com=
mand to variable
> +    $AR that set by our LDAT.
> +
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +
> +--- Mesa-7.10.2/bin/mklib.orig	2011-09-28 16:15:34.170000074 +0800
> ++++ Mesa-7.10.2/bin/mklib	2011-09-28 16:15:42.370000073 +0800
> +@@ -49,8 +49,8 @@
> +                     /*) ;;
> +                     *)  FILE=3D"$ORIG_DIR/$FILE" ;;
> +                 esac
> +-                MEMBERS=3D`ar t $FILE`
> +-                ar x $FILE
> ++                MEMBERS=3D`${AR} t $FILE`
> ++                ${AR} x $FILE
> +                 for MEMBER in $MEMBERS ; do
> +                     NEWFILES=3D"$NEWFILES $DIR/$MEMBER"
> +                 done
> +@@ -77,7 +77,7 @@
> + make_ar_static_lib() {
> +     OPTS=3D$1
> +     shift;
> +-    RANLIB=3D$1
> ++    USE_RANLIB=3D$1
> +     shift;
> +     LIBNAME=3D$1
> +     shift;
> +@@ -87,11 +87,11 @@
> +     rm -f ${LIBNAME}
> +=20
> +     # make static lib
> +-    ar ${OPTS} ${LIBNAME} ${OBJECTS}
> ++    ${AR} ${OPTS} ${LIBNAME} ${OBJECTS}
> +=20
> +     # run ranlib
> +-    if [ ${RANLIB} =3D 1 ] ; then
> +-        ranlib ${LIBNAME}
> ++    if [ ${USE_RANLIB} =3D 1 ] ; then
> ++        ${RANLIB} ${LIBNAME}
> +     fi
> +=20
> +     echo ${LIBNAME}
> +@@ -313,9 +313,9 @@
> + 	if [ "x$LINK" =3D "x" ] ; then
> + 	    # -linker was not specified so set default link command now
> +             if [ $CPLUSPLUS =3D 1 ] ; then
> +-                LINK=3Dg++
> ++                LINK=3D$CXX
> +             else
> +-                LINK=3Dgcc
> ++                LINK=3D$CC
> +             fi
> + 	fi
> +=20
> +@@ -531,9 +531,9 @@
> + 	if [ "x$LINK" =3D "x" ] ; then
> + 	    # -linker was not specified so set default link command now
> +             if [ $CPLUSPLUS =3D 1 ] ; then
> +-                LINK=3Dg++
> ++                LINK=3D${CXX}
> +             else
> +-                LINK=3Dgcc
> ++                LINK=3D${CC}
> +             fi
> + 	fi
> +=20
> diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-g=
raphics/mesa/mesa-dri_7.11.bb
> index 6fc8d95..0f026b1 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> +++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> @@ -9,11 +9,12 @@ LIB_DEPS =3D "libdrm virtual/libx11 libxext libxxf86vm =
libxdamage libxfixes expat
>  DEPENDS =3D "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native python-native"
>  DEPENDS +=3D "mesa-dri-glsl-native"
> =20
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.=
bz2 \
>             file://crossfix.patch \
>             file://uclibc.patch \
> +           file://mesa-use-target-commands-in-mklib.patch \
>            "
> =20
>  SRC_URI[md5sum] =3D "ff03aca82d0560009a076a87c888cf13"
> diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-=
graphics/mesa/mesa-xlib_7.11.bb
> index ea4acc6..3301068 100644
> --- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
> +++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
> @@ -4,6 +4,7 @@ FILESPATH =3D. "${FILE_DIRNAME}/mesa-dri:"
> =20
>  SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.=
bz2 \
>             file://uclibc.patch \
> +           file://mesa-use-target-commands-in-mklib.patch \
>             "
> =20
>  SRC_URI[md5sum] =3D "ff03aca82d0560009a076a87c888cf13"
> @@ -17,7 +18,7 @@ LIB_DEPS =3D "virtual/libx11 libxext libxxf86vm libxdam=
age libxfixes libxml2-nativ
>  DEPENDS =3D "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
> =20
>  PE =3D "1"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  EXTRA_OECONF +=3D "--with-driver=3Dxlib --without-gallium-drivers"
> =20
> --=20
> 1.7.5.1.300.gc565c
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6Wq9EACgkQN1Ujt2V2gBzi9gCgpOUdkXUodrkGsu6/YIsFAWsc
5O0An06qo0OORW/Sc09OTCzswOCEablf
=NodM
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
