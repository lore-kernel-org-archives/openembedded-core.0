Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TQDfs-00026z-Le; Mon, 22 Oct 2012 10:47:52 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1263238wey.6
	for <multiple recipients>; Mon, 22 Oct 2012 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SmV5L5Z+8kw3/EB5qNCkRCihjJpNWnUWLXIASB2QOMs=;
	b=TRiRWO6p7tlEggIsOED0gQVofggdn1QlvIVIRcV2iuKGO5B7B49G2N7545qTgpKXqA
	p3I5bcyh1eNoB9TpI2ghvQz/qZOq7JpO842AQ4aVEeevExujOv0OouO5PmyHp5rNoJHG
	iXhyxTstXCfDoSby7ymDlUX4nkza9cTpAnwPOEsFX5xL5SyWZ7JxY8tGP0p44uCEMeFV
	DrFecx+9eNrlLBa9wSrXHIDuS8POqG7azXIx7kt5P0Cn0U5pkxVGPScGjWoQ7YOOxh8n
	zPr4fm0DhbBEhuByrmrsHdAiqdxLtO6eyCP8tI5M0hKfBvC9w/pzJ714kZMKm5aEXZXG
	QHUQ==
Received: by 10.216.71.202 with SMTP id r52mr4659514wed.108.1350894868089;
	Mon, 22 Oct 2012 01:34:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm20724224wib.8.2012.10.22.01.34.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 01:34:27 -0700 (PDT)
Date: Mon, 22 Oct 2012 10:34:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20121022083441.GA3269@jama.jama.net>
References: <20121019163541.436A0103AB@opal>
MIME-Version: 1.0
In-Reply-To: <20121019163541.436A0103AB@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : perl: fix dependecies
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
X-List-Received-Date: Mon, 22 Oct 2012 08:47:53 -0000
X-Groupsio-MsgNum: 30777
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2012 at 04:35:40PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: d50be1876f7a41822ef7e73207fdf8cccd39e400
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dd50be1876f7a41822ef7e73207fdf8cccd39e400
>=20
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Fri Oct 19 19:22:04 2012 +0800
>=20
> perl: fix dependecies
>=20
> This patch fixes 2 problems.
>=20
> The first one is that when run "perl -V" on target, it fails with lack
> of some .pm files. So add these perl module files to package perl itself
> to fix this failure.
>=20
> The second problem is that package nativesdk-perl-modules doesn't depends
> on the single perl modules.
>=20
> In the .bb file, dependencies of perl-modules are set by:
>=20
> RRECOMMENDS_perl-modules =3D "${@d.getVar('PACKAGES', True)...}"
>=20
> The PACKAGES would be reset by do_split_packages since:
>=20
> PACKAGES_DYNAMIC =3D "perl-module-*"
> PACKAGES_DYNAMIC_virtclass-nativesdk =3D "nativesdk-perl-module-*"
>=20
> Then:
> 1) The target perl-modules RRECOMMENDS on perl-module-*, this is what
>    we expect.
>=20
> 2) But the nativesdk-perl-modules doesn't RRECOMMENDS on
>    nativesdk-perl-module-*, this is not what we expect.
>=20
> The value of PACKAGES after do_split_packages has been set correctly (it
> contains the nativesdk-perl-module-* packages)
>=20
> But the:
>=20
> RRECOMMENDS_perl-modules =3D "${@d.getVar('PACKAGES', True)...}"
>=20
> doesn't work correctly for nativesdk, the
>=20
> d.getVar('RRECOMMENDS_perl-modules', True)
>=20
> doesn't get the new value of the PACKAGES, it gets the value of PACKAGES
> before the do_split_packages.
>=20
> This patch will fix the problem.
>=20
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-devtools/perl/perl_5.14.2.bb |   12 +++++++++---
>  1 files changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-dev=
tools/perl/perl_5.14.2.bb
> index d9206d8..d566a79 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbde=
e469f02565f253d81a \
>  # We need gnugrep (for -I)
>  DEPENDS =3D "virtual/db grep-native"
>  DEPENDS +=3D "gdbm zlib"
> -PR =3D "r11"
> +PR =3D "r12"
> =20
>  # 5.10.1 has Module::Build built-in
>  PROVIDES +=3D "libmodule-build-perl"
> @@ -243,7 +243,13 @@ perl_package_preprocess () {
> =20
>  PACKAGES =3D "perl-dbg perl perl-misc perl-dev perl-pod perl-doc perl-li=
b \
>              perl-module-cpan perl-module-cpanplus perl-module-unicore"
> -FILES_${PN} =3D "${bindir}/perl ${bindir}/perl${PV}"
> +FILES_${PN} =3D "${bindir}/perl ${bindir}/perl${PV} \
> +               ${libdir}/perl/${PV}/Config.pm \
> +               ${libdir}/perl/${PV}/strict.pm \
> +               ${libdir}/perl/${PV}/warnings.pm \
> +               ${libdir}/perl/${PV}/warnings \
> +               ${libdir}/perl/${PV}/vars.pm \
> +              "

I think this breaks at least automake, tiobench and libtimedate-perl

OE @ ~/openembedded-core $ git grep perl-module-strict
meta/recipes-devtools/automake/automake_1.12.3.bb:    perl-module-strict \
meta/recipes-extended/perl/libtimedate-perl_1.20.bb:RDEPENDS_${PN} +=3D "pe=
rl-module-carp perl-module-exporter perl-module-strict perl-module-time-loc=
al"
OE @ ~/meta-openembedded $ git grep perl-module-strict
meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb:    perl-module-strict=
 \
OE @ ~/openembedded-core $ git grep perl-module-vars
meta/recipes-devtools/automake/automake_1.12.3.bb:    perl-module-vars "

perl-module-strict and perl-module-vars are not created now, probably empty.

>  FILES_${PN}-dev =3D "${libdir}/perl/${PV}/CORE"
>  FILES_${PN}-lib =3D "${libdir}/libperl.so* \
>                     ${libdir}/perl5 \
> @@ -294,7 +300,6 @@ FILES_perl-module-unicore +=3D "${libdir}/perl/${PV}/=
unicore"
>  # packages (actually the non modules packages and not created too)
>  ALLOW_EMPTY_perl-modules =3D "1"
>  PACKAGES_append =3D " perl-modules "
> -RRECOMMENDS_perl-modules =3D "${@d.getVar('PACKAGES', True).replace('${P=
N}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').repl=
ace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', '')}"
> =20
>  python populate_packages_prepend () {
>      libdir =3D d.expand('${libdir}/perl/${PV}')
> @@ -302,6 +307,7 @@ python populate_packages_prepend () {
>      do_split_packages(d, libdir, 'auto/([^/]*)/.*', 'perl-module-%s', 'p=
erl module %s', recursive=3DTrue, allow_dirs=3DFalse, match_path=3DTrue, pr=
epend=3DFalse)
>      do_split_packages(d, libdir, 'Module/([^\/]*).*', 'perl-module-%s', =
'perl module %s', recursive=3DTrue, allow_dirs=3DFalse, match_path=3DTrue, =
prepend=3DFalse)
>      do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unico=
re\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', re=
cursive=3DTrue, allow_dirs=3DFalse, match_path=3DTrue, prepend=3DFalse)
> +    d.setVar("RRECOMMENDS_${PN}-modules", d.getVar('PACKAGES', True).rep=
lace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ',=
 '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc=
 ', ''))
>  }
> =20
>  PACKAGES_DYNAMIC =3D "perl-module-*"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCFBSEACgkQN1Ujt2V2gByUxQCdE50eX11T6zdrR9PzZX64Sf26
TroAnjdNPdIDaOwjbAVZd2GZybXT8H2f
=2vCa
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
