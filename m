Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.29897.1629751336127187118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 13:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K4ROyn7O;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id bk29so14958923qkb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 13:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G/Ng+q70W72l4wHvJ+b7qzwUW78+Pu+2JAvSIb5LBnQ=;
        b=K4ROyn7O1ydYXkqqcuzuLygQKcpvmww163F3m52q2x6vbWlFV3qgsmkOXgd5C7pQdU
         zQdAytvoRPtSVlWiSl7y9mv4i8Js/Oo5F9fkmjKbrKTJiCvoVrBbKElas0lQrPRpQuEU
         /RzEE/5bM4nET0kDT2+mO9D7e6yHf6lWdp7TZZWudWFFY36umwf8wmZexdzomTv3lgIO
         NtVjiETdZWARCTFKqB7PS9wdCmB3GryDpNc8D/fk/QHGh4SZP1p15Tt2qc7cgKwL0T43
         6bj7BrzF9AagG2tQjdJJZp+EVZXGxjemsPO+lsj6zJlAWjyOOKIHKp0UfFJmRPNv26Qi
         bxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G/Ng+q70W72l4wHvJ+b7qzwUW78+Pu+2JAvSIb5LBnQ=;
        b=aWTXVQaAuKdOitxjcSjr3Fl6Jg48WiI/yWD1SZvaN2K1w+JdJRBc+xwT54DLB5CHs8
         WGGPq09lJGzXDBEUWF6u9qvIlECEk9sXX4uyEbxFsJmvVpm/m58ZuCo/k/Z3qL9a7Tcf
         2XXwpYVeNSc56HNL6s1/zrgGXydmQWVs//3QYXKiZQyL34r7kmTkshRjV1CuKBa9ffku
         hT75OseyyKxus7zycRU9b50VSiCHuBM2P/fatBacMWjXq0iZ9twOLGa1r07/QTNEMpRw
         gzi3B8eUjSuh2ZgaM4wK84gqXGB14knH1/HWShtFygQwnrgrAV0qtKfw8xjVFLxoJZi7
         9gzg==
X-Gm-Message-State: AOAM533OpEvRsE+wTlWgATc8zatB2o8tBWOBViRFE6IWI/WVol5B2v2X
	akuJno6yZewBTXCId5YlJEsX+5VMiO4bwljJT2g=
X-Google-Smtp-Source: ABdhPJxuVyJ7Xlm5xUZ4teEg0EmmBadoM3JPMX5/wRHeDoj79KoLcbpTA0iT+26HIu74eEx6U14/EVL0qvhUBoBQN8c=
X-Received: by 2002:a05:620a:799:: with SMTP id 25mr22760859qka.119.1629751335140;
 Mon, 23 Aug 2021 13:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210823150853.2817-1-lukma@denx.de> <20210823150853.2817-2-lukma@denx.de>
 <ada9987d-399b-7a73-2aa5-c09dcca41fb3@gmail.com> <20210823202414.731c6749@ktm>
 <CAMKF1srLFY_R4KX3gG3hZMhZNtjSN8D4mEp0Wwr78Se9RE_20g@mail.gmail.com> <20210823220926.37d87121@ktm>
In-Reply-To: <20210823220926.37d87121@ktm>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 23 Aug 2021 13:41:49 -0700
Message-ID: <CAMKF1sqKH=RiOn-WVp_=ZQmLnSJ43VUUfKyv+E1KR9bCn01j3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
To: Lukasz Majewski <lukma@denx.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 1:09 PM Lukasz Majewski <lukma@denx.de> wrote:
>
> On Mon, 23 Aug 2021 12:52:44 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
>
> > On Mon, Aug 23, 2021 at 11:24 AM Lukasz Majewski <lukma@denx.de>
> > wrote:
> >
> > > Hi Khem,
> > >
> > > > On 8/23/21 8:08 AM, ?ukasz Majewski wrote:
> > > > > This patch introduces new recipe - namely 'glibc-tests', which
> > > > > builds and installs glibc test suite to OE/Yocto built image.
> > > > >
> > > > > It reuses code from already available 'glibc-testsuite' recipe,
> > > > > which is run with 'bitbake glibc-testsuite -c check' and uses
> > > > > qemu to execute remotely (via SSH) tests on some emulated
> > > > > machine.
> > > > >
> > > > > This recipe installs eligible tests on some rootfs image.
> > > > > Afterwards, either all of them or only time related subset,
> > > > > those tests can be executed on the real hardware, to facilitate
> > > > > validation of this platform with for example Y2038 problem
> > > > > compliance.
> > > > >
> > > > > By default all tests are executed, with 'ptest-runner
> > > > > glibc-tests'. To test only time related subset - one needs to
> > > > > call: cd /usr/lib/glibc-tests/ptest/; rm run-ptest; \
> > > > > ln -s run-ptest-time run-ptest; cd -; ptest-runner glibc-tests
> > > > >
> > > > > To facilitate debugging, source files are provided by default
> > > > > with the unstripped debugging symbols. Such approach would
> > > > > reduce the already complex recipe (as it inherits base glibc
> > > > > one), so there is no need to also install *-dbg and *-src
> > > > > packages.
> > > >
> > > >
> > > > does it have to be a separate recipe I wonder if we can have it
> > > > built as part of glibc itself controlled via ptest knob
> > >
> > > I've followed the glibc-testsuite recipe to provide tests for ptest.
> > > Test creation is similar to it, but doesn't require QEMU run (tests
> > > are executed on the HW).
> > >
> > > Another rationale was to have some kind of "features" separation in
> > > different file (liked glibc-mtrace), which is easier to maintain and
> > > review.
> > >
> > > Last but not least - separate recipe (and built binaries) allow some
> > > kind of magic with selection of used test programs (this may be
> > > useful if one would like to have different sets of tests in
> > > different packages)
> >
> > That=E2=80=99s seems ok I think the names are quite confusing now not t=
hat it
> > was not so much better before but now we have glibc-tests and
> > glibc-testsuites which do same things but in very different way maybe
> > glibc-testsuite should be renamed to something like glibc-tests-crosd
> > or some such
>
> I think that glibc-testsuite_2.34.bb shall be renamed to
> glibc-tests-qemu_2.34.bb as it is more descriptive.

is it only runnable in qemu ? I thought we could use a read board as
well with IP address

>
> Then, glibc-tests_2.34.bb could be left as it is now, as inheriting
> ptest requires it to be added as 'glibc-tests-ptest' in
> meta/conf/distro/include/ptest-packagelists.inc
>
> (I've tried to rename it to glibc-tests-ptest_2.34.bb, but then it was
> required to add glibc-tests-ptest-ptest to the ptest-packagelist.inc
> file, which is a bit clumsy IMHO).
>
> >
> > >
> > > >
> > > > >
> > > > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > > > ---
> > > > >   .../distro/include/ptest-packagelists.inc     |   1 +
> > > > >   meta/recipes-core/glibc/glibc-tests_2.34.bb   | 101
> > > > > ++++++++++++++++++ meta/recipes-core/glibc/glibc/run-ptest-all
> > > > >  | 25 +++++ meta/recipes-core/glibc/glibc/run-ptest-time  |  30
> > > > > ++++++ 4 files changed, 157 insertions(+)
> > > > >   create mode 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
> > > > >   create mode 100755 meta/recipes-core/glibc/glibc/run-ptest-all
> > > > >   create mode 100755
> > > > > meta/recipes-core/glibc/glibc/run-ptest-time
> > > > >
> > > > > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> > > > > b/meta/conf/distro/include/ptest-packagelists.inc index
> > > > > 3872bdc942..e460ad1c8b 100644 ---
> > > > > a/meta/conf/distro/include/ptest-packagelists.inc +++
> > > > > b/meta/conf/distro/include/ptest-packagelists.inc @@ -59,6
> > > > > +59,7 @@ PTESTS_FAST =3D "\ slang-ptest \
> > > > >       wayland-ptest \
> > > > >       zlib-ptest \
> > > > > +    glibc-tests-ptest \
> > > > >   "
> > > > >   PTESTS_FAST:remove:mips64 =3D "qemu-ptest"
> > > > >   PTESTS_PROBLEMS:append:mips64 =3D "qemu-ptest"
> > > > > diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb
> > > > > b/meta/recipes-core/glibc/glibc-tests_2.34.bb new file mode
> > > > > 100644 index 0000000000..896809f700
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> > > > > @@ -0,0 +1,101 @@
> > > > > +require glibc_${PV}.bb
> > > > > +require glibc-tests.inc
> > > > > +
> > > > > +inherit ptest
> > > > > +
> > > > > +SRC_URI:append =3D " \
> > > > > +   file://run-ptest-all file://run-ptest-time \
> > > > > +"
> > > > > +
> > > > > +SUMMARY =3D "glibc tests to be run with ptest"
> > > > > +
> > > > > +# Erase some variables already set by glibc_${PV}
> > > > > +python __anonymous() {
> > > > > +       # Remove packages provided by glibc build, we only need
> > > > > a subset of them
> > > > > +       d.setVar("PACKAGES", "${PN}")
> > > > > +
> > > > > +       d.setVar("PROVIDES", "${PN}")
> > > > > +       d.setVar("RPROVIDES", "${PN} glibc-ptest")
> > > > > +
> > > > > +       d.setVar("RRECOMMENDS", "")
> > > > > +}
> > > > > +
> > > > > +# Remove any lefovers from original glibc recipe
> > > > > +RPROVIDES:${PN} =3D "${PN}"
> > > > > +RRECOMMENDS:${PN} =3D ""
> > > > > +RDEPENDS:${PN} =3D "sed"
> > > > > +
> > > > > +# Just build tests for target - do not run them
> > > > > +do_check:append () {
> > > > > +   oe_runmake -i check run-built-tests=3Dno
> > > > > +}
> > > > > +addtask do_check after do_compile before do_install_ptest_base
> > > > > +
> > > > > +glibc_strip_build_directory () {
> > > > > +   # Delete all non executable files from build directory
> > > > > +   find ${B} ! -executable -type f -delete
> > > > > +
> > > > > +   # Remove build dynamic libraries and links to them as
> > > > > +   # those are already installed in the target device
> > > > > +   find ${B} -type f -name "*.so" -delete
> > > > > +   find ${B} -type l -name "*.so*" -delete
> > > > > +
> > > > > +   # Remove headers (installed with glibc)
> > > > > +   find ${B} -type f -name "*.h" -delete
> > > > > +
> > > > > +   find ${B} -type f -name "isomac" -delete
> > > > > +   find ${B} -type f -name "annexc" -delete
> > > > > +}
> > > > > +
> > > > > +do_install_ptest_base () {
> > > > > +   glibc_strip_build_directory
> > > > > +
> > > > > +   # Install build test programs to the image
> > > > > +   install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
> > > > > +   cp -r ${B}/* ${D}${PTEST_PATH}/tests/glibc-ptest/
> > > > > +
> > > > > +   install -d ${D}${PTEST_PATH}
> > > > > +   cp ${WORKDIR}/run-ptest-* ${D}${PTEST_PATH}/
> > > > > +
> > > > > +   # By default run all glibc tests
> > > > > +   cd ${D}${PTEST_PATH}/
> > > > > +   ln -s run-ptest-all run-ptest
> > > > > +}
> > > > > +
> > > > > +# The datadir directory is required to allow core (and reused)
> > > > > +# glibc cleanup function to finish correctly, as this directory
> > > > > +# is not created for ptests
> > > > > +stash_locale_package_cleanup:prepend () {
> > > > > +   mkdir -p ${PKGD}${datadir}
> > > > > +}
> > > > > +
> > > > > +stash_locale_sysroot_cleanup:prepend () {
> > > > > +   mkdir -p ${SYSROOT_DESTDIR}${datadir}
> > > > > +}
> > > > > +
> > > > > +# Prevent the do_package() task to set 'libc6' prefix
> > > > > +# for glibc tests related packages
> > > > > +python populate_packages:prepend () {
> > > > > +    if d.getVar('DEBIAN_NAMES'):
> > > > > +        d.setVar('DEBIAN_NAMES', '')
> > > > > +}
> > > > > +
> > > > > +FILES:${PN} =3D "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*"
> > > > > +
> > > > > +EXCLUDE_FROM_SHLIBS =3D "1"
> > > > > +
> > > > > +# Install debug data in .debug and sources in /usr/src/debug
> > > > > +# It is more handy to have _all_ the sources and symbols in one
> > > > > +# place (package) as this recipe will be used for validation
> > > > > and +# debugging.
> > > > > +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug"
> > > > > +
> > > > > +# glibc test cases violate by default some Yocto/OE checks
> > > > > (staticdev, +# textrel)
> > > > > +# 'debug-files' - add everything (including debug) into one
> > > > > package +#                 (no need to install/build *-src
> > > > > package) +INSANE_SKIP:${PN} +=3D "staticdev textrel debug-files
> > > > > rpaths" +
> > > > > +deltask do_stash_locale
> > > > > +do_install[noexec] =3D "1"
> > > > > +do_populate_sysroot[noexec] =3D "1"
> > > > > diff --git a/meta/recipes-core/glibc/glibc/run-ptest-all
> > > > > b/meta/recipes-core/glibc/glibc/run-ptest-all new file mode
> > > > > 100755 index 0000000000..47bfe5238c
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-core/glibc/glibc/run-ptest-all
> > > > > @@ -0,0 +1,25 @@
> > > > > +#!/bin/sh
> > > > > +# ptest script for glibc - to run time related tests to
> > > > > +# facilitate Y2038 validation
> > > > > +# Run with 'ptest-runner glibc-tests'
> > > > > +
> > > > > +output() {
> > > > > +  retcode=3D$?
> > > > > +  if [ $retcode -eq 0 ]
> > > > > +    then echo "PASS: $i"
> > > > > +  elif [ $retcode -eq 77 ]
> > > > > +    then echo "SKIP: $i"
> > > > > +  else echo "FAIL: $i"
> > > > > +  fi
> > > > > +}
> > > > > +
> > > > > +# Allow altering time on the target
> > > > > +export GLIBC_TEST_ALLOW_TIME_SETTING=3D"1"
> > > > > +
> > > > > +tst=3D$(ls -r ${PWD}/tests/glibc-ptest/*/*)
> > > > > +
> > > > > +for i in ${tst}
> > > > > +do
> > > > > +   $i >/dev/null 2>&1
> > > > > +   output
> > > > > +done
> > > > > diff --git a/meta/recipes-core/glibc/glibc/run-ptest-time
> > > > > b/meta/recipes-core/glibc/glibc/run-ptest-time new file mode
> > > > > 100755 index 0000000000..24dedc6e32
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-core/glibc/glibc/run-ptest-time
> > > > > @@ -0,0 +1,30 @@
> > > > > +#!/bin/sh
> > > > > +# ptest script for glibc - to run time related tests to
> > > > > +# facilitate Y2038 validation
> > > > > +# Run with 'ptest-runner glibc-tests'
> > > > > +
> > > > > +output() {
> > > > > +  retcode=3D$?
> > > > > +  if [ $retcode -eq 0 ]
> > > > > +    then echo "PASS: $i"
> > > > > +  elif [ $retcode -eq 77 ]
> > > > > +    then echo "SKIP: $i"
> > > > > +  else echo "FAIL: $i"
> > > > > +  fi
> > > > > +}
> > > > > +
> > > > > +# Allow altering time on the target
> > > > > +export GLIBC_TEST_ALLOW_TIME_SETTING=3D"1"
> > > > > +
> > > > > +tst_time64=3D$(ls -r ${PWD}/tests/glibc-ptest/*/*-time64)
> > > > > +
> > > > > +# Remove '-time64' suffix - those tests are also time
> > > > > +# related
> > > > > +tst_time_tmp=3D$(sed -e "s/-time64$//" <<< ${tst_time64})
> > > > > +tst_time=3D"${tst_time_tmp} ${tst_time64}"
> > > > > +
> > > > > +for i in ${tst_time}
> > > > > +do
> > > > > +   $i >/dev/null 2>&1
> > > > > +   output
> > > > > +done
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > >
> > >
> > >
> > >
> > > Best regards,
> > >
> > > Lukasz Majewski
> > >
> > > --
> > >
> > > DENX Software Engineering GmbH,      Managing Director: Wolfgang
> > > Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > > Germany Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > > lukma@denx.de
>
>
>
>
> Best regards,
>
> Lukasz Majewski
>
> --
>
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de
