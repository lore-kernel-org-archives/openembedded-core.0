Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.36129.1629790571048238632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 00:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=FXWlyYAu;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 89D0C805DF;
	Tue, 24 Aug 2021 09:36:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1629790567;
	bh=xRpW0WUxLE/huaLhArKDTC7wsMzmnwiOm/1ldoRjQPk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FXWlyYAuQzpwJuItAQ7Wg89C5sbtg9i7xTdz1lzoSBarJncPAuaRMxHpH1R4C4whF
	 eeHmaERbO0Pbkrl6s0A7N5dCHlTnKAjZSHqcWQpQDEE6n0xBATff1OTVkQIUjVN8f4
	 m0KceHhi1n9iPemr8gsk3CEKw3dTGnCJtf25YrMrZp9vqlm8HjnrUQa9YiSA76WNPO
	 b5HXGEw1D9ovBc52I/B7e12W+RWUZsM+6UCEeKBSF7ZXn5gIjr3ycUFeU3kcWk5o1t
	 Fbz7zcW1EfzTtFETkAMyBw49DYzYE5Ah5Gzgk9SBNFlPTiZKN1GeRE/+nmKlibW0uD
	 +7tKB4ak+5QjQ==
Date: Tue, 24 Aug 2021 09:36:01 +0200
From: "?ukasz Majewski" <lukma@denx.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
Message-ID: <20210824093601.768c0c05@ktm>
In-Reply-To: <CAMKF1sqKH=RiOn-WVp_=ZQmLnSJ43VUUfKyv+E1KR9bCn01j3Q@mail.gmail.com>
References: <20210823150853.2817-1-lukma@denx.de>
	<20210823150853.2817-2-lukma@denx.de>
	<ada9987d-399b-7a73-2aa5-c09dcca41fb3@gmail.com>
	<20210823202414.731c6749@ktm>
	<CAMKF1srLFY_R4KX3gG3hZMhZNtjSN8D4mEp0Wwr78Se9RE_20g@mail.gmail.com>
	<20210823220926.37d87121@ktm>
	<CAMKF1sqKH=RiOn-WVp_=ZQmLnSJ43VUUfKyv+E1KR9bCn01j3Q@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-Groupsio-MsgNum: 155206
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/OEPvScvS_.q3iKmk6VcgH6K"; protocol="application/pgp-signature"

--Sig_/OEPvScvS_.q3iKmk6VcgH6K
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Khem,

> On Mon, Aug 23, 2021 at 1:09 PM Lukasz Majewski <lukma@denx.de> wrote:
> >
> > On Mon, 23 Aug 2021 12:52:44 -0700
> > Khem Raj <raj.khem@gmail.com> wrote:
> > =20
> > > On Mon, Aug 23, 2021 at 11:24 AM Lukasz Majewski <lukma@denx.de>
> > > wrote:
> > > =20
> > > > Hi Khem,
> > > > =20
> > > > > On 8/23/21 8:08 AM, ?ukasz Majewski wrote: =20
> > > > > > This patch introduces new recipe - namely 'glibc-tests',
> > > > > > which builds and installs glibc test suite to OE/Yocto
> > > > > > built image.
> > > > > >
> > > > > > It reuses code from already available 'glibc-testsuite'
> > > > > > recipe, which is run with 'bitbake glibc-testsuite -c
> > > > > > check' and uses qemu to execute remotely (via SSH) tests on
> > > > > > some emulated machine.
> > > > > >
> > > > > > This recipe installs eligible tests on some rootfs image.
> > > > > > Afterwards, either all of them or only time related subset,
> > > > > > those tests can be executed on the real hardware, to
> > > > > > facilitate validation of this platform with for example
> > > > > > Y2038 problem compliance.
> > > > > >
> > > > > > By default all tests are executed, with 'ptest-runner
> > > > > > glibc-tests'. To test only time related subset - one needs
> > > > > > to call: cd /usr/lib/glibc-tests/ptest/; rm run-ptest; \
> > > > > > ln -s run-ptest-time run-ptest; cd -; ptest-runner
> > > > > > glibc-tests
> > > > > >
> > > > > > To facilitate debugging, source files are provided by
> > > > > > default with the unstripped debugging symbols. Such
> > > > > > approach would reduce the already complex recipe (as it
> > > > > > inherits base glibc one), so there is no need to also
> > > > > > install *-dbg and *-src packages. =20
> > > > >
> > > > >
> > > > > does it have to be a separate recipe I wonder if we can have
> > > > > it built as part of glibc itself controlled via ptest knob =20
> > > >
> > > > I've followed the glibc-testsuite recipe to provide tests for
> > > > ptest. Test creation is similar to it, but doesn't require QEMU
> > > > run (tests are executed on the HW).
> > > >
> > > > Another rationale was to have some kind of "features"
> > > > separation in different file (liked glibc-mtrace), which is
> > > > easier to maintain and review.
> > > >
> > > > Last but not least - separate recipe (and built binaries) allow
> > > > some kind of magic with selection of used test programs (this
> > > > may be useful if one would like to have different sets of tests
> > > > in different packages) =20
> > >
> > > That=E2=80=99s seems ok I think the names are quite confusing now not
> > > that it was not so much better before but now we have glibc-tests
> > > and glibc-testsuites which do same things but in very different
> > > way maybe glibc-testsuite should be renamed to something like
> > > glibc-tests-crosd or some such =20
> >
> > I think that glibc-testsuite_2.34.bb shall be renamed to
> > glibc-tests-qemu_2.34.bb as it is more descriptive. =20
>=20
> is it only runnable in qemu ? I thought we could use a read board as
> well with IP address

It looks like by default the QEMU is used in this recipe.=20

This recipe provides custom check-test-wrapper, which can log
into remote board via ssh (when TOOLCHAIN_TEST_TARGET =3D "ssh").

This looks a bit awkward for me, as the goal would be to run built
tests on target (exact) HW without the need of SSH.

It is also easier to debug the code with the real HW.

>=20
> >
> > Then, glibc-tests_2.34.bb could be left as it is now, as inheriting
> > ptest requires it to be added as 'glibc-tests-ptest' in
> > meta/conf/distro/include/ptest-packagelists.inc
> >
> > (I've tried to rename it to glibc-tests-ptest_2.34.bb, but then it
> > was required to add glibc-tests-ptest-ptest to the
> > ptest-packagelist.inc file, which is a bit clumsy IMHO).
> > =20
> > > =20
> > > > =20
> > > > > =20
> > > > > >
> > > > > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > > > > ---
> > > > > >   .../distro/include/ptest-packagelists.inc     |   1 +
> > > > > >   meta/recipes-core/glibc/glibc-tests_2.34.bb   | 101
> > > > > > ++++++++++++++++++
> > > > > > meta/recipes-core/glibc/glibc/run-ptest-all | 25 +++++
> > > > > > meta/recipes-core/glibc/glibc/run-ptest-time  |  30 ++++++
> > > > > > 4 files changed, 157 insertions(+) create mode 100644
> > > > > > meta/recipes-core/glibc/glibc-tests_2.34.bb create mode
> > > > > > 100755 meta/recipes-core/glibc/glibc/run-ptest-all create
> > > > > > mode 100755 meta/recipes-core/glibc/glibc/run-ptest-time
> > > > > >
> > > > > > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> > > > > > b/meta/conf/distro/include/ptest-packagelists.inc index
> > > > > > 3872bdc942..e460ad1c8b 100644 ---
> > > > > > a/meta/conf/distro/include/ptest-packagelists.inc +++
> > > > > > b/meta/conf/distro/include/ptest-packagelists.inc @@ -59,6
> > > > > > +59,7 @@ PTESTS_FAST =3D "\ slang-ptest \
> > > > > >       wayland-ptest \
> > > > > >       zlib-ptest \
> > > > > > +    glibc-tests-ptest \
> > > > > >   "
> > > > > >   PTESTS_FAST:remove:mips64 =3D "qemu-ptest"
> > > > > >   PTESTS_PROBLEMS:append:mips64 =3D "qemu-ptest"
> > > > > > diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb
> > > > > > b/meta/recipes-core/glibc/glibc-tests_2.34.bb new file mode
> > > > > > 100644 index 0000000000..896809f700
> > > > > > --- /dev/null
> > > > > > +++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> > > > > > @@ -0,0 +1,101 @@
> > > > > > +require glibc_${PV}.bb
> > > > > > +require glibc-tests.inc
> > > > > > +
> > > > > > +inherit ptest
> > > > > > +
> > > > > > +SRC_URI:append =3D " \
> > > > > > +   file://run-ptest-all file://run-ptest-time \
> > > > > > +"
> > > > > > +
> > > > > > +SUMMARY =3D "glibc tests to be run with ptest"
> > > > > > +
> > > > > > +# Erase some variables already set by glibc_${PV}
> > > > > > +python __anonymous() {
> > > > > > +       # Remove packages provided by glibc build, we only
> > > > > > need a subset of them
> > > > > > +       d.setVar("PACKAGES", "${PN}")
> > > > > > +
> > > > > > +       d.setVar("PROVIDES", "${PN}")
> > > > > > +       d.setVar("RPROVIDES", "${PN} glibc-ptest")
> > > > > > +
> > > > > > +       d.setVar("RRECOMMENDS", "")
> > > > > > +}
> > > > > > +
> > > > > > +# Remove any lefovers from original glibc recipe
> > > > > > +RPROVIDES:${PN} =3D "${PN}"
> > > > > > +RRECOMMENDS:${PN} =3D ""
> > > > > > +RDEPENDS:${PN} =3D "sed"
> > > > > > +
> > > > > > +# Just build tests for target - do not run them
> > > > > > +do_check:append () {
> > > > > > +   oe_runmake -i check run-built-tests=3Dno
> > > > > > +}
> > > > > > +addtask do_check after do_compile before
> > > > > > do_install_ptest_base +
> > > > > > +glibc_strip_build_directory () {
> > > > > > +   # Delete all non executable files from build directory
> > > > > > +   find ${B} ! -executable -type f -delete
> > > > > > +
> > > > > > +   # Remove build dynamic libraries and links to them as
> > > > > > +   # those are already installed in the target device
> > > > > > +   find ${B} -type f -name "*.so" -delete
> > > > > > +   find ${B} -type l -name "*.so*" -delete
> > > > > > +
> > > > > > +   # Remove headers (installed with glibc)
> > > > > > +   find ${B} -type f -name "*.h" -delete
> > > > > > +
> > > > > > +   find ${B} -type f -name "isomac" -delete
> > > > > > +   find ${B} -type f -name "annexc" -delete
> > > > > > +}
> > > > > > +
> > > > > > +do_install_ptest_base () {
> > > > > > +   glibc_strip_build_directory
> > > > > > +
> > > > > > +   # Install build test programs to the image
> > > > > > +   install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
> > > > > > +   cp -r ${B}/* ${D}${PTEST_PATH}/tests/glibc-ptest/
> > > > > > +
> > > > > > +   install -d ${D}${PTEST_PATH}
> > > > > > +   cp ${WORKDIR}/run-ptest-* ${D}${PTEST_PATH}/
> > > > > > +
> > > > > > +   # By default run all glibc tests
> > > > > > +   cd ${D}${PTEST_PATH}/
> > > > > > +   ln -s run-ptest-all run-ptest
> > > > > > +}
> > > > > > +
> > > > > > +# The datadir directory is required to allow core (and
> > > > > > reused) +# glibc cleanup function to finish correctly, as
> > > > > > this directory +# is not created for ptests
> > > > > > +stash_locale_package_cleanup:prepend () {
> > > > > > +   mkdir -p ${PKGD}${datadir}
> > > > > > +}
> > > > > > +
> > > > > > +stash_locale_sysroot_cleanup:prepend () {
> > > > > > +   mkdir -p ${SYSROOT_DESTDIR}${datadir}
> > > > > > +}
> > > > > > +
> > > > > > +# Prevent the do_package() task to set 'libc6' prefix
> > > > > > +# for glibc tests related packages
> > > > > > +python populate_packages:prepend () {
> > > > > > +    if d.getVar('DEBIAN_NAMES'):
> > > > > > +        d.setVar('DEBIAN_NAMES', '')
> > > > > > +}
> > > > > > +
> > > > > > +FILES:${PN} =3D "${PTEST_PATH}/*
> > > > > > /usr/src/debug/glibc-tests/*" +
> > > > > > +EXCLUDE_FROM_SHLIBS =3D "1"
> > > > > > +
> > > > > > +# Install debug data in .debug and sources in
> > > > > > /usr/src/debug +# It is more handy to have _all_ the
> > > > > > sources and symbols in one +# place (package) as this
> > > > > > recipe will be used for validation and +# debugging.
> > > > > > +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug"
> > > > > > +
> > > > > > +# glibc test cases violate by default some Yocto/OE checks
> > > > > > (staticdev, +# textrel)
> > > > > > +# 'debug-files' - add everything (including debug) into one
> > > > > > package +#                 (no need to install/build *-src
> > > > > > package) +INSANE_SKIP:${PN} +=3D "staticdev textrel
> > > > > > debug-files rpaths" +
> > > > > > +deltask do_stash_locale
> > > > > > +do_install[noexec] =3D "1"
> > > > > > +do_populate_sysroot[noexec] =3D "1"
> > > > > > diff --git a/meta/recipes-core/glibc/glibc/run-ptest-all
> > > > > > b/meta/recipes-core/glibc/glibc/run-ptest-all new file mode
> > > > > > 100755 index 0000000000..47bfe5238c
> > > > > > --- /dev/null
> > > > > > +++ b/meta/recipes-core/glibc/glibc/run-ptest-all
> > > > > > @@ -0,0 +1,25 @@
> > > > > > +#!/bin/sh
> > > > > > +# ptest script for glibc - to run time related tests to
> > > > > > +# facilitate Y2038 validation
> > > > > > +# Run with 'ptest-runner glibc-tests'
> > > > > > +
> > > > > > +output() {
> > > > > > +  retcode=3D$?
> > > > > > +  if [ $retcode -eq 0 ]
> > > > > > +    then echo "PASS: $i"
> > > > > > +  elif [ $retcode -eq 77 ]
> > > > > > +    then echo "SKIP: $i"
> > > > > > +  else echo "FAIL: $i"
> > > > > > +  fi
> > > > > > +}
> > > > > > +
> > > > > > +# Allow altering time on the target
> > > > > > +export GLIBC_TEST_ALLOW_TIME_SETTING=3D"1"
> > > > > > +
> > > > > > +tst=3D$(ls -r ${PWD}/tests/glibc-ptest/*/*)
> > > > > > +
> > > > > > +for i in ${tst}
> > > > > > +do
> > > > > > +   $i >/dev/null 2>&1
> > > > > > +   output
> > > > > > +done
> > > > > > diff --git a/meta/recipes-core/glibc/glibc/run-ptest-time
> > > > > > b/meta/recipes-core/glibc/glibc/run-ptest-time new file mode
> > > > > > 100755 index 0000000000..24dedc6e32
> > > > > > --- /dev/null
> > > > > > +++ b/meta/recipes-core/glibc/glibc/run-ptest-time
> > > > > > @@ -0,0 +1,30 @@
> > > > > > +#!/bin/sh
> > > > > > +# ptest script for glibc - to run time related tests to
> > > > > > +# facilitate Y2038 validation
> > > > > > +# Run with 'ptest-runner glibc-tests'
> > > > > > +
> > > > > > +output() {
> > > > > > +  retcode=3D$?
> > > > > > +  if [ $retcode -eq 0 ]
> > > > > > +    then echo "PASS: $i"
> > > > > > +  elif [ $retcode -eq 77 ]
> > > > > > +    then echo "SKIP: $i"
> > > > > > +  else echo "FAIL: $i"
> > > > > > +  fi
> > > > > > +}
> > > > > > +
> > > > > > +# Allow altering time on the target
> > > > > > +export GLIBC_TEST_ALLOW_TIME_SETTING=3D"1"
> > > > > > +
> > > > > > +tst_time64=3D$(ls -r ${PWD}/tests/glibc-ptest/*/*-time64)
> > > > > > +
> > > > > > +# Remove '-time64' suffix - those tests are also time
> > > > > > +# related
> > > > > > +tst_time_tmp=3D$(sed -e "s/-time64$//" <<< ${tst_time64})
> > > > > > +tst_time=3D"${tst_time_tmp} ${tst_time64}"
> > > > > > +
> > > > > > +for i in ${tst_time}
> > > > > > +do
> > > > > > +   $i >/dev/null 2>&1
> > > > > > +   output
> > > > > > +done
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > =20
> > > >
> > > >
> > > >
> > > >
> > > > Best regards,
> > > >
> > > > Lukasz Majewski
> > > >
> > > > --
> > > >
> > > > DENX Software Engineering GmbH,      Managing Director: Wolfgang
> > > > Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194
> > > > Groebenzell, Germany Phone: (+49)-8142-66989-59 Fax:
> > > > (+49)-8142-66989-80 Email: lukma@denx.de =20
> >
> >
> >
> >
> > Best regards,
> >
> > Lukasz Majewski
> >
> > --
> >
> > DENX Software Engineering GmbH,      Managing Director: Wolfgang
> > Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > Germany Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > lukma@denx.de =20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/OEPvScvS_.q3iKmk6VcgH6K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmEkoWEACgkQAR8vZIA0
zr1uOgf+NFj9ANz/JMP8PmfUtY70TLKP0gIJCkyOKL2oiTlE3993uI+Okp+I6QAy
RNmTEEGYsqm1j+T+Cd5yeDjnoWi6+UF9Aab7ReHCRVZd608LGdG6oHKZXklpMW04
M1+lTwCbG96aq42gUZeBYaE12r0aDLCVhL0wNxS0xn6tx0siQRdhTHbJFfACn2CE
FesVv9BmxHjd0jXoarM7TwPtRs4SPkNteiRq83TV7FKT3+Tmn3YhG0/BWDon8So7
DThJsm61f3iXL0sIzI0xD96pFQvToglIbXE+AdIudHIaSPbuZivonPB2yb0TkV9h
e6d3DXHocZktmbiYvc88gtbxsTeY9g==
=cle7
-----END PGP SIGNATURE-----

--Sig_/OEPvScvS_.q3iKmk6VcgH6K--
