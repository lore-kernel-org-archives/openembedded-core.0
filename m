Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A07C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 07:39:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.8859.1635406729263277008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 00:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=BNLlw8xa;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3E5CB82D6F;
	Thu, 28 Oct 2021 09:38:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1635406726;
	bh=4JOh2be5741oNQOOHhO9jfLxtXkqBxvJMzL4lXzH2W0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BNLlw8xa7T3GU0yoopP6UaogdkfFRQlQtieCqttbbS2e+KK9wlRMmcla5L83ZMWqC
	 nQCX7iUY4fThumzKYTu6oTryWn+Wu7Mk6w1TctaJDmviayWQeTLZQn+1ZCUjUbnLQe
	 iv5+/5YzAXLquNFqRUqMzwySeNnqTuoFtAsfBn4Bw9lX2Ek9O+OszhGpmI/ndo+znl
	 s1MqyLl3gn9hFIDa55ihHCcfibeHCU24Rue7UohfQW7Vzc/Dl+gqHmV++Llli6U2q2
	 36TSCHNWHwFeDYFfflbyK5Wd1nBVgETBYYq9xVTv7H4BPbngCeM8cn4+3dK2kRjps1
	 j0YcFFX60mcYw==
Date: Thu, 28 Oct 2021 09:38:39 +0200
From: Lukasz Majewski <lukma@denx.de>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Nathan Rossi
 <nathan@nathanrossi.com>, Khem Raj <raj.khem@gmail.com>, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>, Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] glibc: ptest: Add running glibc time
 related test suite (Y2038) with ptest
Message-ID: <20211028093839.66712b25@ktm>
In-Reply-To: <YXm9s2mVGNI+NtzR@piout.net>
References: <20211019124300.16301-1-lukma@denx.de>
	<YXm9s2mVGNI+NtzR@piout.net>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/yEJiPSGQU7WngN7NyRalUSm"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 07:39:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157577

--Sig_/yEJiPSGQU7WngN7NyRalUSm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

> Hello,
>=20
> I'm sorry for the late reply but this still failed on the AB:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2719/st=
eps/11/logs/stdio
>=20

Thanks for the info. I will fix it and submit v3.

> On 19/10/2021 14:43:00+0200, ?ukasz Majewski wrote:
> > This patch introduces new recipe - namely 'glibc-tests', which
> > builds and installs time related (to check if Y2038 support works)
> > glibc test suite to OE/Yocto built image.
> >=20
> > It reuses code from already available 'glibc-testsuite' recipe,
> > which is run with 'bitbake glibc-testsuite -c check' and uses qemu
> > to execute remotely (via SSH) tests on some emulated machine.
> >=20
> > This recipe installs time related glibc tests on some rootfs image.
> > Afterwards, those tests can be executed on the real hardware, to
> > facilitate validation of it with Y2038 problem compliance.
> >=20
> > To test time related subset - one needs to call:
> > ptest-runner glibc-tests
> > then change the date after Y2038 threshold for 32 bit systems:
> > date -s "20 JAN 2038 18:00:00"
> > and then run ptest-runner again.
> >=20
> > To facilitate debugging, source files are provided by default with
> > the unstripped debugging symbols. Such approach would reduce the
> > already complex recipe (as it inherits base glibc one), so there
> > is no need to also install *-dbg and *-src packages.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >=20
> > ---
> > Changes for v2:
> > - Just focus on time related set of tests as those can be run as
> >   standalone
> > - Reuse of already built tests (from glibc-tests.inc) and depoloy
> >   them on the HW target.
> > - Provide single 'run-ptest' script.
> > - Update the recipe to run with newest poky's -master
> > ---
> >  .../distro/include/ptest-packagelists.inc     |   1 +
> >  meta/recipes-core/glibc/glibc-tests_2.34.bb   | 112
> > ++++++++++++++++++ meta/recipes-core/glibc/glibc/run-ptest       |
> > 37 ++++++ 3 files changed, 150 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
> >  create mode 100755 meta/recipes-core/glibc/glibc/run-ptest
> >=20
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> > b/meta/conf/distro/include/ptest-packagelists.inc index
> > 2e324f8da4..fd52fa72a4 100644 ---
> > a/meta/conf/distro/include/ptest-packagelists.inc +++
> > b/meta/conf/distro/include/ptest-packagelists.inc @@ -61,6 +61,7 @@
> > PTESTS_FAST =3D "\ slang-ptest \
> >      wayland-ptest \
> >      zlib-ptest \
> > +    glibc-tests-ptest \
> >  "
> >  PTESTS_FAST:remove:mips64 =3D "qemu-ptest"
> >  PTESTS_PROBLEMS:append:mips64 =3D "qemu-ptest"
> > diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb
> > b/meta/recipes-core/glibc/glibc-tests_2.34.bb new file mode 100644
> > index 0000000000..f1d5d073b6
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> > @@ -0,0 +1,112 @@
> > +require glibc_${PV}.bb
> > +require glibc-tests.inc
> > +
> > +inherit ptest
> > +
> > +SRC_URI:append =3D " \
> > +	file://run-ptest \
> > +"
> > +
> > +SUMMARY =3D "glibc tests to be run with ptest"
> > +
> > +# Erase some variables already set by glibc_${PV}
> > +python __anonymous() {
> > +       # Remove packages provided by glibc build, we only need a
> > subset of them
> > +       d.setVar("PACKAGES", "${PN}")
> > +
> > +       d.setVar("PROVIDES", "${PN}")
> > +       d.setVar("RPROVIDES", "${PN} glibc-ptest")
> > +
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
> > +	oe_runmake -i check run-built-tests=3Dno
> > +}
> > +addtask do_check after do_compile before do_install_ptest_base
> > +
> > +glibc_strip_build_directory () {
> > +	# Delete all non executable files from build directory
> > +	find ${B} ! -executable -type f -delete
> > +
> > +	# Remove build dynamic libraries and links to them as
> > +	# those are already installed in the target device
> > +	find ${B} -type f -name "*.so" -delete
> > +	find ${B} -type l -name "*.so*" -delete
> > +
> > +	# Remove headers (installed with glibc)
> > +	find ${B} -type f -name "*.h" -delete
> > +
> > +	find ${B} -type f -name "isomac" -delete
> > +	find ${B} -type f -name "annexc" -delete
> > +}
> > +
> > +do_install_ptest_base () {
> > +	glibc_strip_build_directory
> > +
> > +	ls -r ${B}/*/*-time64 > ${B}/tst_time64
> > +
> > +	# Remove '-time64' suffix - those tests are also time
> > related
> > +	sed -e "s/-time64$//" ${B}/tst_time64 > ${B}/tst_time_tmp
> > +	tst_time=3D$(cat ${B}/tst_time_tmp ${B}/tst_time64)
> > +
> > +	rm ${B}/tst_time_tmp ${B}/tst_time64
> > +	echo "${tst_time}"
> > +
> > +	# Install build test programs to the image
> > +	install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
> > +
> > +	for f in "${tst_time}"
> > +	do
> > +	    cp -r ${f} ${D}${PTEST_PATH}/tests/glibc-ptest/
> > +	done
> > +
> > +	install -d ${D}${PTEST_PATH}
> > +	cp ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
> > +
> > +}
> > +
> > +# The datadir directory is required to allow core (and reused)
> > +# glibc cleanup function to finish correctly, as this directory
> > +# is not created for ptests
> > +stash_locale_package_cleanup:prepend () {
> > +	mkdir -p ${PKGD}${datadir}
> > +}
> > +
> > +stash_locale_sysroot_cleanup:prepend () {
> > +	mkdir -p ${SYSROOT_DESTDIR}${datadir}
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
> > +	$i >/dev/null 2>&1
> > +	output
> > +done
> > +
> > +# Run tests supporting only 64 bit time
> > +for i in ${tst_time64}
> > +do
> > +	$i >/dev/null 2>&1
> > +	output
> > +done
> > --=20
> > 2.20.1
> >  =20
>=20
> >=20
> >=20
> >  =20
>=20
>=20



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/yEJiPSGQU7WngN7NyRalUSm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmF6U38ACgkQAR8vZIA0
zr3JCggAtWa9o/Blb8zE9nlLiTdq0E98A0Y+lCGF7WFvzvzCQYtftxv46jF1zPf3
q29rOtUp/kWW025mJDtfkxy/zg7vH3QOSLMW6WkwGPipBJIwIMId+DY9qkTX7lAD
7YwfHH58UpdgXEhSEJtugJ3E0pwdX4YOUOuNi1CzDesw9eFR2xYr/c+E/MDZEP8Z
/8F/fMPyMIFf8dQNviwxGNPauOEs298q5vW7xR570Ylq5C6nt3nAhlehTIIpY6pv
dl6aYbNHXjUN0afWaVl48rpYNz5v6S1cuI1H5rQB9Zosyon9E8/8xmBzdAWJdtUk
TX9pDOIRJaL4WBNVlefYcFatC54UNw==
=r6Fd
-----END PGP SIGNATURE-----

--Sig_/yEJiPSGQU7WngN7NyRalUSm--

