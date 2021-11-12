Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32ABC433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 08:41:29 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.13256.1636706488149428640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 00:41:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=uqZvilJV;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E97FB82F45;
	Fri, 12 Nov 2021 09:41:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1636706485;
	bh=9GfqljcjMSlOZUpl6ZYcDgt6z3iDVuIGy2Gc6rRK/XU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uqZvilJV0c4raqdb/eWGftTnK7GpQKdWAn2sApHUr5NpNXbp9aAMWu00ax147MXS/
	 1ZrRksVWtfUSBYM7vg46qFAreDgUlJY4sYR/utUKe3ShieO+lNtoVKHeKoE5L47b5T
	 YfVHXtyO9hfu7cCUQleEwa+ScNffrsjYPQGtSADz40q8PVZGT1MuTxNhOuUfTiDPRd
	 /v+5zGmG5BnVkg3t4sZvGkicFGltrUJ/TY6cvoc7PINxFMyeUbbprHnK6qWEb9PIXK
	 k+PkCow7f/RvkL+2mKww9DhD22iQNOhD/Qdn+nA81AH92EWHPTLumT2T9xk/ITuOjB
	 yJYkf4mWRSGtA==
Date: Fri, 12 Nov 2021 09:41:16 +0100
From: Lukasz Majewski <lukma@denx.de>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Nathan Rossi
 <nathan@nathanrossi.com>, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Lee Chee Yang <chee.yang.lee@intel.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4] glibc: ptest: Add running glibc time
 related test suite (Y2038) with ptest
Message-ID: <20211112094116.2509d8f3@ktm>
In-Reply-To: 
 <CAMKF1spswf07YOPg4WOHmvnaTi4LQT09GAnXEukBObNawEMyBg@mail.gmail.com>
References: <20211109152851.8137-1-lukma@denx.de>
	<CAMKF1spswf07YOPg4WOHmvnaTi4LQT09GAnXEukBObNawEMyBg@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/hC6WAeC3_Wur+lQw0N21Yao"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 08:41:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158210

--Sig_/hC6WAeC3_Wur+lQw0N21Yao
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Khem,

> seeing this
>=20
> https://errors.yoctoproject.org/Errors/Details/616955/

The error is about autoconf version:

DEBUG: Executing shell function do_configure
aclocal.m4:6: error: Exactly version 2.69 of Autoconf is required but
you have 2.71

aclocal.m4:6: the top level
autom4te: error: m4 failed with exit status: 63

This is strange, as on my setup (qemuarm, qemuarm64, qemux86) the glibc
and glibc-tests are built without any issues with autoconf version 2.71.


I've built the glibc-tests without issues with:

Build Configuration:
BB_VERSION           =3D "1.52.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "riscv64-poky-linux"
MACHINE              =3D "qemuriscv64"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "3.4"
TUNE_FEATURES        =3D "riscv64"
meta
meta-poky
meta-yocto-bsp       =3D
"glibc-ptest_v4:164923f0586ac189f01938a32fa102c2df7cc447"

DISTRO=3Dpoky MACHINE=3Dqemuriscv64 bitbake glibc-tests


Khem, could you help me with setting up environment to reproduce this
issue?

>=20
> On Tue, Nov 9, 2021 at 7:29 AM Lukasz Majewski <lukma@denx.de> wrote:
> >
> > This patch introduces new recipe - namely 'glibc-tests', which
> > builds and installs time related (to check if Y2038 support works)
> > glibc test suite to OE/Yocto built image.
> >
> > It reuses code from already available 'glibc-testsuite' recipe,
> > which is run with 'bitbake glibc-testsuite -c check' and uses qemu
> > to execute remotely (via SSH) tests on some emulated machine.
> >
> > This recipe installs time related glibc tests on some rootfs image.
> > Afterwards, those tests can be executed on the real hardware, to
> > facilitate validation of it with Y2038 problem compliance.
> >
> > To test time related subset - one needs to call:
> > ptest-runner glibc-tests
> > then change the date after Y2038 threshold for 32 bit systems:
> > date -s "20 JAN 2038 18:00:00"
> > and then run ptest-runner again.
> >
> > To facilitate debugging, source files are provided by default with
> > the unstripped debugging symbols. Such approach would reduce the
> > already complex recipe (as it inherits base glibc one), so there
> > is no need to also install *-dbg and *-src packages.
> >
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >
> > ---
> > Changes for v4:
> > - Add entry for 'glibc-tests' in the maintainers.inc file
> > - Remove nativesdk from BBCLASSEXTEND as this resipe is not supposed
> >   to be the part of SDK
> >
> > Changes for v3:
> > - Provide missing ${PN}-ptest for PACKAGES, PROVIDES and
> >   RPROVIDES variables
> >
> > Changes for v2:
> > - Just focus on time related set of tests as those can be run as
> >   standalone
> > - Reuse of already built tests (from glibc-tests.inc) and depoloy
> >   them on the HW target.
> > - Provide single 'run-ptest' script.
> > - Update the recipe to run with newest poky's -master
> > ---
> >  meta/conf/distro/include/maintainers.inc      |   1 +
> >  .../distro/include/ptest-packagelists.inc     |   1 +
> >  meta/recipes-core/glibc/glibc-tests_2.34.bb   | 113
> > ++++++++++++++++++ meta/recipes-core/glibc/glibc/run-ptest       |
> > 37 ++++++ 4 files changed, 152 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
> >  create mode 100755 meta/recipes-core/glibc/glibc/run-ptest
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> > b/meta/conf/distro/include/maintainers.inc index
> > baec2bef4d..7104e091fc 100644 ---
> > a/meta/conf/distro/include/maintainers.inc +++
> > b/meta/conf/distro/include/maintainers.inc @@ -209,6 +209,7 @@
> > RECIPE_MAINTAINER:pn-glibc =3D "Khem Raj <raj.khem@gmail.com>"
> > RECIPE_MAINTAINER:pn-glibc-locale =3D "Khem Raj <raj.khem@gmail.com>"
> > RECIPE_MAINTAINER:pn-glibc-mtrace =3D "Khem Raj <raj.khem@gmail.com>"
> > RECIPE_MAINTAINER:pn-glibc-scripts =3D "Khem Raj
> > <raj.khem@gmail.com>" +RECIPE_MAINTAINER:pn-glibc-tests =3D "Lukasz
> > Majewski <lukma@denx.de>" RECIPE_MAINTAINER:pn-glibc-testsuite =3D
> > "Khem Raj <raj.khem@gmail.com>" RECIPE_MAINTAINER:pn-glide =3D
> > "Otavio Salvador <otavio.salvador@ossystems.com.br>"
> > RECIPE_MAINTAINER:pn-gmp =3D "Khem Raj <raj.khem@gmail.com>" diff
> > --git a/meta/conf/distro/include/ptest-packagelists.inc
> > b/meta/conf/distro/include/ptest-packagelists.inc index
> > 2e324f8da4..fd52fa72a4 100644 ---
> > a/meta/conf/distro/include/ptest-packagelists.inc +++
> > b/meta/conf/distro/include/ptest-packagelists.inc @@ -61,6 +61,7 @@
> > PTESTS_FAST =3D "\ slang-ptest \ wayland-ptest \ zlib-ptest \
> > +    glibc-tests-ptest \
> >  "
> >  PTESTS_FAST:remove:mips64 =3D "qemu-ptest"
> >  PTESTS_PROBLEMS:append:mips64 =3D "qemu-ptest"
> > diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb
> > b/meta/recipes-core/glibc/glibc-tests_2.34.bb new file mode 100644
> > index 0000000000..d2d3cfff91
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> > @@ -0,0 +1,113 @@
> > +require glibc_${PV}.bb
> > +require glibc-tests.inc
> > +
> > +inherit ptest
> > +
> > +SRC_URI:append =3D " \
> > +       file://run-ptest \
> > +"
> > +
> > +SUMMARY =3D "glibc tests to be run with ptest"
> > +
> > +# Erase some variables already set by glibc_${PV}
> > +python __anonymous() {
> > +       # Remove packages provided by glibc build, we only need a
> > subset of them
> > +       d.setVar("PACKAGES", "${PN} ${PN}-ptest")
> > +
> > +       d.setVar("PROVIDES", "${PN} ${PN}-ptest")
> > +       d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
> > +
> > +       d.setVar("BBCLASSEXTEND", "")
> > +       d.setVar("RRECOMMENDS", "")
> > +}
> > +
> > +# Remove any lefovers from original glibc recipe
> > +RPROVIDES:${PN} =3D "${PN}"
> > +RRECOMMENDS:${PN} =3D ""
> > +RDEPENDS:${PN} =3D " glibc sed"
> > +DEPENDS:append =3D " sed"
> > +
> > +# Just build tests for target - do not run them
> > +do_check:append () {
> > +       oe_runmake -i check run-built-tests=3Dno
> > +}
> > +addtask do_check after do_compile before do_install_ptest_base
> > +
> > +glibc_strip_build_directory () {
> > +       # Delete all non executable files from build directory
> > +       find ${B} ! -executable -type f -delete
> > +
> > +       # Remove build dynamic libraries and links to them as
> > +       # those are already installed in the target device
> > +       find ${B} -type f -name "*.so" -delete
> > +       find ${B} -type l -name "*.so*" -delete
> > +
> > +       # Remove headers (installed with glibc)
> > +       find ${B} -type f -name "*.h" -delete
> > +
> > +       find ${B} -type f -name "isomac" -delete
> > +       find ${B} -type f -name "annexc" -delete
> > +}
> > +
> > +do_install_ptest_base () {
> > +       glibc_strip_build_directory
> > +
> > +       ls -r ${B}/*/*-time64 > ${B}/tst_time64
> > +
> > +       # Remove '-time64' suffix - those tests are also time
> > related
> > +       sed -e "s/-time64$//" ${B}/tst_time64 > ${B}/tst_time_tmp
> > +       tst_time=3D$(cat ${B}/tst_time_tmp ${B}/tst_time64)
> > +
> > +       rm ${B}/tst_time_tmp ${B}/tst_time64
> > +       echo "${tst_time}"
> > +
> > +       # Install build test programs to the image
> > +       install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
> > +
> > +       for f in "${tst_time}"
> > +       do
> > +           cp -r ${f} ${D}${PTEST_PATH}/tests/glibc-ptest/
> > +       done
> > +
> > +       install -d ${D}${PTEST_PATH}
> > +       cp ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
> > +
> > +}
> > +
> > +# The datadir directory is required to allow core (and reused)
> > +# glibc cleanup function to finish correctly, as this directory
> > +# is not created for ptests
> > +stash_locale_package_cleanup:prepend () {
> > +       mkdir -p ${PKGD}${datadir}
> > +}
> > +
> > +stash_locale_sysroot_cleanup:prepend () {
> > +       mkdir -p ${SYSROOT_DESTDIR}${datadir}
> > +}
> > +
> > +# Prevent the do_package() task to set 'libc6' prefix
> > +# for glibc tests related packages
> > +python populate_packages:prepend () {
> > +    if d.getVar('DEBIAN_NAMES'):
> > +        d.setVar('DEBIAN_NAMES', '')
> > +}
> > +
> > +FILES:${PN} =3D "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*"
> > +
> > +EXCLUDE_FROM_SHLIBS =3D "1"
> > +
> > +# Install debug data in .debug and sources in /usr/src/debug
> > +# It is more handy to have _all_ the sources and symbols in one
> > +# place (package) as this recipe will be used for validation and
> > +# debugging.
> > +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug"
> > +
> > +# glibc test cases violate by default some Yocto/OE checks
> > (staticdev, +# textrel)
> > +# 'debug-files' - add everything (including debug) into one package
> > +#                 (no need to install/build *-src package)
> > +INSANE_SKIP:${PN} +=3D "staticdev textrel debug-files rpaths"
> > +
> > +deltask do_stash_locale
> > +do_install[noexec] =3D "1"
> > +do_populate_sysroot[noexec] =3D "1"
> > diff --git a/meta/recipes-core/glibc/glibc/run-ptest
> > b/meta/recipes-core/glibc/glibc/run-ptest new file mode 100755
> > index 0000000000..f637986105
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc/run-ptest
> > @@ -0,0 +1,37 @@
> > +#!/bin/sh
> > +# ptest script for glibc - to run time related tests to
> > +# facilitate Y2038 validation
> > +# Run with 'ptest-runner glibc-tests'
> > +
> > +output() {
> > +  retcode=3D$?
> > +  if [ $retcode -eq 0 ]
> > +    then echo "PASS: $i"
> > +  elif [ $retcode -eq 77 ]
> > +    then echo "SKIP: $i"
> > +  else echo "FAIL: $i"
> > +  fi
> > +}
> > +
> > +# Allow altering time on the target
> > +export GLIBC_TEST_ALLOW_TIME_SETTING=3D"1"
> > +
> > +tst_time64=3D$(ls -r ${PWD}/tests/glibc-ptest/*-time64)
> > +
> > +# Remove '-time64' suffix - those tests are also time
> > +# related
> > +tst_time_tmp=3D$(sed -e "s/-time64$//" <<< ${tst_time64})
> > +
> > +# Run tests supporting only 32 bit time
> > +for i in ${tst_time_tmp}
> > +do
> > +       $i >/dev/null 2>&1
> > +       output
> > +done
> > +
> > +# Run tests supporting only 64 bit time
> > +for i in ${tst_time64}
> > +do
> > +       $i >/dev/null 2>&1
> > +       output
> > +done
> > --
> > 2.20.1
> > =20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/hC6WAeC3_Wur+lQw0N21Yao
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmGOKKwACgkQAR8vZIA0
zr0CxQgAx5hpRTNPMFxaZxQf/GntRTmmz9e8GLY81n1p1OXwQqOEiJ9U1yR6u/i4
ZpZbzJMLQnIdmHPRdHtWI8/WuCrQ9uW/QAijzqFw3Hysd9T85DleWZVvr2pdZK2n
3IbUobkoWHYDq5Obvmj98RQ7S3NT0VzG7zQovJXIinmbRGGeEJly+glZi4lfdBX8
RaEGT+KvccVI98Lh7oAUwhMDKgSotsCGoTUr/xm+I+8SDFfoKS4fXweybNBFiR40
5TZEMowfzNaAR7OIhpPl2D4hQxE/LjwWrd76LmboFLf97/Wdd5RkKsbw7sHLunwN
RakMc2ZqjBHROxC42NP87KxWRFtxQg==
=H7MF
-----END PGP SIGNATURE-----

--Sig_/hC6WAeC3_Wur+lQw0N21Yao--

