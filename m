Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYFzs-0007L4-2f
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 13:53:44 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so2744706bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 04:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nPobST6yD1AOkvsetpIBEJFHY+11Nu404fJHjWy1MTw=;
	b=HgyXna1q+OjIInSBvcxVFAVzCq37xVLI3jEQKbxwcYrhfmfcSYMv9IFnslJH2T78C1
	ZPoVyhWqrNjSBTDpvW1AfSGk6d0hw3kvlzugRXhWHTcjpSLNet39tCDZuZWmtiYfopct
	G9rHw8//YmpA71qLcGLw8SIXQhUbJ0F9YzQpudAUTBgrad33o/wavth2R0zkSDaCcawA
	FD2pAfJncCUOX7luxOxle837bAsqmjfRs3Szzt9uLc9p9ZLJ2LsEIHqtjoGk4FNqCO3p
	ggDejc0gtrlU2y/EUfWTtcrqxwq+1kW6QXzqKsyuoSZx0fgizF3o8+zWnxMjS1j7Da9n
	Wn2Q==
Received: by 10.204.0.71 with SMTP id 7mr7879962bka.102.1352810389839;
	Tue, 13 Nov 2012 04:39:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gy18sm5409474bkc.4.2012.11.13.04.39.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Nov 2012 04:39:48 -0800 (PST)
Date: Tue, 13 Nov 2012 13:39:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20121113123959.GD3928@jama.jama.net>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
	<69a45cc5b2e02a92be884bf0e7c8d0d5f6092985.1352808309.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <69a45cc5b2e02a92be884bf0e7c8d0d5f6092985.1352808309.git.laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 07/12] libdrm: upgrade to 2.4.40
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 12:53:44 -0000
X-Groupsio-MsgNum: 31242
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Content-Disposition: inline

--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 02:18:24PM +0200, Laurentiu Palcu wrote:
> Other changes:
>  * removed a backported patch;
>  * activated libdrm-omap helper layer which is needed by the latest
>    xf86-video-omap xorg driver;
>  * split libdrm-drivers package into libdrm-radeon, libdrm-nouveau and
>    libdrm-omap;

Why? What about upgrade path on target?

> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/recipes-graphics/drm/libdrm.inc               |   15 ++--
>  .../drm/libdrm/disable-cairo.patch                 |   74 --------------=
------
>  .../drm/{libdrm_2.4.39.bb =3D> libdrm_2.4.40.bb}     |    5 +-
>  meta/recipes-graphics/drm/libdrm_git.bb            |    4 +-
>  4 files changed, 13 insertions(+), 85 deletions(-)
>  delete mode 100644 meta/recipes-graphics/drm/libdrm/disable-cairo.patch
>  rename meta/recipes-graphics/drm/{libdrm_2.4.39.bb =3D> libdrm_2.4.40.bb=
} (44%)
>=20
> diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics=
/drm/libdrm.inc
> index a64a5df..2584e02 100644
> --- a/meta/recipes-graphics/drm/libdrm.inc
> +++ b/meta/recipes-graphics/drm/libdrm.inc
> @@ -8,20 +8,23 @@ SECTION =3D "x11/base"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://xf86drm.c;beginline=3D9;endline=3D32;md5=3D=
c8a3b961af7667c530816761e949dc71"
>  SRC_URI =3D "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
> -PROVIDES =3D "drm"
> +PROVIDES =3D "drm libdrm-radeon libdrm-nouveau libdrm-omap"

Is this needed at all?

Cheers,

>  DEPENDS =3D "libpthread-stubs udev"
> =20
> -INC_PR =3D "r3"
> +INC_PR =3D "r4"
> =20
>  #libpciaccess is required starting from libdrm 2.4.26
>  DEPENDS +=3D " libpciaccess"
> =20
>  inherit autotools pkgconfig
> =20
> -EXTRA_OECONF +=3D "--disable-cairo-tests"
> +EXTRA_OECONF +=3D "--disable-cairo-tests \
> +                 --enable-omap-experimental-api \
> +                "
> =20
> -PACKAGES =3D+ "${PN}-tests ${PN}-drivers ${PN}-kms"
> +PACKAGES =3D+ "${PN}-tests ${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-k=
ms"
>  FILES_${PN}-tests =3D "${bindir}/dr* ${bindir}/mode*"
> -FILES_${PN}-drivers =3D "${libdir}/libdrm_*.so.*"
> +FILES_${PN}-radeon =3D "${libdir}/libdrm_radeon.so.*"
> +FILES_${PN}-nouveau =3D "${libdir}/libdrm_nouveau.so.*"
> +FILES_${PN}-omap =3D "${libdir}/libdrm_omap.so.*"
>  FILES_${PN}-kms =3D "${libdir}/libkms*.so.*"
> -
> diff --git a/meta/recipes-graphics/drm/libdrm/disable-cairo.patch b/meta/=
recipes-graphics/drm/libdrm/disable-cairo.patch
> deleted file mode 100644
> index 90e79d4..0000000
> --- a/meta/recipes-graphics/drm/libdrm/disable-cairo.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -commit c81d1df4926072d24b4dad1b488e618e57eff1c6
> -Author: Daniel Stone <daniel@fooishbar.org>
> -Date:   Thu Oct 4 10:26:37 2012 +1000
> -
> -    configure.ac: Allow forcible disabling of Cairo support
> -   =20
> -    We don't want to build libdrm tests with Cairo support under Poky, s=
ince
> -    they're never used and also cause a build loop from libdrm -> cairo =
->
> -    mesa-dri -> libdrm.
> -   =20
> -    To avoid variance in build results, introduce a --disable-cairo-tests
> -    switch.
> -   =20
> -    Upstream-Status: Backport
> -   =20
> -    Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> -
> -diff --git a/configure.ac b/configure.ac
> -index 290362c..8c28107 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -222,11 +222,23 @@ if test "x$EXYNOS" =3D xyes; then
> - 	AC_DEFINE(HAVE_EXYNOS, 1, [Have EXYNOS support])
> - fi
> -=20
> -+AC_ARG_ENABLE([cairo-tests],
> -+              [AS_HELP_STRING([--enable-cairo-tests],
> -+                              [Enable support for Cairo rendering in te=
sts (default: auto)])],
> -+              [CAIRO=3D$enableval], [CAIRO=3Dauto])
> - PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=3Dyes], [HAVE_CAIRO=3Dno])
> --if test "x$HAVE_CAIRO" =3D xyes; then
> --	AC_DEFINE(HAVE_CAIRO, 1, [Have cairo support])
> -+AC_MSG_CHECKING([whether to enable Cairo tests])
> -+if test "x$CAIRO" =3D xauto; then
> -+	CAIRO=3D"$HAVE_CAIRO"
> - fi
> --AM_CONDITIONAL(HAVE_CAIRO, [test "x$HAVE_CAIRO" =3D xyes])
> -+if test "x$CAIRO" =3D xyes; then
> -+	if ! test "x$HAVE_CAIRO" =3D xyes; then
> -+		AC_MSG_ERROR([Cairo support required but not present])
> -+	fi
> -+	AC_DEFINE(HAVE_CAIRO, 1, [Have Cairo support])
> -+fi
> -+AC_MSG_RESULT([$CAIRO])
> -+AM_CONDITIONAL(HAVE_CAIRO, [test "x$CAIRO" =3D xyes])
> -=20
> - # For enumerating devices in test case
> - PKG_CHECK_MODULES(LIBUDEV, libudev, [HAVE_LIBUDEV=3Dyes], [HAVE_LIBUDEV=
=3Dno])
> -diff --git a/tests/modetest/Makefile.am b/tests/modetest/Makefile.am
> -index b5ec771..065ae13 100644
> ---- a/tests/modetest/Makefile.am
> -+++ b/tests/modetest/Makefile.am
> -@@ -1,8 +1,7 @@
> - AM_CFLAGS =3D \
> - 	-I$(top_srcdir)/include/drm \
> - 	-I$(top_srcdir)/libkms/ \
> --	-I$(top_srcdir) \
> --	$(CAIRO_CFLAGS)
> -+	-I$(top_srcdir)
> -=20
> - noinst_PROGRAMS =3D \
> - 	modetest
> -@@ -12,5 +11,9 @@ modetest_SOURCES =3D \
> -=20
> - modetest_LDADD =3D \
> - 	$(top_builddir)/libdrm.la \
> --	$(top_builddir)/libkms/libkms.la \
> --	$(CAIRO_LIBS)
> -+	$(top_builddir)/libkms/libkms.la
> -+
> -+if HAVE_CAIRO
> -+AM_CFLAGS +=3D $(CAIRO_CFLAGS)
> -+modetest_LDADD +=3D $(CAIRO_LIBS)
> -+endif
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.39.bb b/meta/recipes-gr=
aphics/drm/libdrm_2.4.40.bb
> similarity index 44%
> rename from meta/recipes-graphics/drm/libdrm_2.4.39.bb
> rename to meta/recipes-graphics/drm/libdrm_2.4.40.bb
> index f3ce2b1..42f860a 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.39.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.40.bb
> @@ -4,8 +4,7 @@ PR =3D "${INC_PR}.0"
> =20
>  SRC_URI +=3D "file://installtests.patch \
>              file://GNU_SOURCE_definition.patch \
> -            file://disable-cairo.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "9a299e021d81bab6c82307582c78319d"
> -SRC_URI[sha256sum] =3D "386b17388980504bca16ede81ceed4c77b12c3488f46ecb7=
f4d48e48512a733d"
> +SRC_URI[md5sum] =3D "626a3dc44a40ef37565b61732b688567"
> +SRC_URI[sha256sum] =3D "48c14e4600ea0fde522292893eb4055d2f6d86a69d093d37=
9c827deaccffaa1f"
> diff --git a/meta/recipes-graphics/drm/libdrm_git.bb b/meta/recipes-graph=
ics/drm/libdrm_git.bb
> index 5d7f953..e3051c7 100644
> --- a/meta/recipes-graphics/drm/libdrm_git.bb
> +++ b/meta/recipes-graphics/drm/libdrm_git.bb
> @@ -6,7 +6,7 @@ S =3D "${WORKDIR}/git"
> =20
>  DEFAULT_PREFERENCE =3D "-1"
> =20
> -SRCREV =3D "14db948127e549ea9234e02d8e112de3871f8f9f"
> -PV =3D "2.4.39+git${SRCPV}"
> +SRCREV =3D "e01d68f9f3acfc35fe164283904b5d058c2ab378"
> +PV =3D "2.4.40+git${SRCPV}"
>  PR =3D "${INC_PR}.0"
> =20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCiP58ACgkQN1Ujt2V2gBygsQCgg9U44cBgLVQoslhwT5eJuRp+
jYIAn3VlV32qb6IVdC6E623pf2wZ5EKg
=vLBk
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
