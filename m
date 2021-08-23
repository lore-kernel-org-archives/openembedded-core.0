Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.29438.1629748376522880525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 12:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TSB+VwYi;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id t190so20547774qke.7
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 12:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QgHlS/EsZm20VFWScGCm3HMND22jVfgD5hKCn/9h2m0=;
        b=TSB+VwYi1iOxjaMhT09XiPrmHc+xD6KfIMYZIroBVlwd07064Q0cyO2NQwZsHEjgxA
         M7eRgJwhrS9FIi6w0+IPpudbqRFTDUFXRMaI3gQchdXoyoZlS32FbY+54qYy5HRNKuYX
         YLnAii+OF1IKYNCxCBaDlEZU8sx8MpD/cpYmC/MP/LedA8K4CWbYOicVbXTireLCZVgd
         VQkJdo+f/LgTPID4HE3aY2bL2HFtY/G4YG+IcIxsHpms+a1G8sdC54ezcEeQOoPDd7qS
         mcgxmU1Yuy96CeEQZYk7jbUZYX6LanDnYFuYgrZuBcN7aHABUXGylHFYvIdj9PIJeuyf
         iSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgHlS/EsZm20VFWScGCm3HMND22jVfgD5hKCn/9h2m0=;
        b=i3nhXF5bVWKilvvctb6IsKg8wXdTa3Hl1R/yLKspeOQIRmuKZyuklSJlpYUB5pvJPc
         ilXWqjYpcZrh7wR+H6M1EGnwNlU/yclCm0RzfJJpLLC0BsPW2wF2CklB7psBQ4WveMoj
         27CSQooMTtUi/WUthvNPR/fcq0R/OIt0W9nE3S/EUwOBGmTbXi3uQCaxy/tcuvw9EfqR
         qFjZA0tuRc6UU5dGygAGgKmqqltPxvcdtcUVKLU5yP8eM3WFnefB4aWpo+f+D/n+mVGN
         6qpshhjJYecJUh8sGRR3ZpAU3G4lC3PkOQgUG8Ck790KMKFXh8odhmw1StoKHU7LWfPZ
         4UKA==
X-Gm-Message-State: AOAM532RZbyPHfsCO1t/p6vVMnwUSd7qUrfKpsL7hSh+39h1SZxDzUGm
	cVGLpTds3qabUqtg4VcnKR0p8q/n36lnoi6+xbcjPDPnbFo=
X-Google-Smtp-Source: ABdhPJzFIBMvoEUdJF5sIpiODfD73iKYNgLRXKZIV8i0cq474EZonMTkBkglxVjQ3VGmadDR2jnd8K4pMdRujsst9zM=
X-Received: by 2002:ae9:e204:: with SMTP id c4mr1596214qkc.125.1629748375443;
 Mon, 23 Aug 2021 12:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210823150853.2817-1-lukma@denx.de> <20210823150853.2817-2-lukma@denx.de>
 <ada9987d-399b-7a73-2aa5-c09dcca41fb3@gmail.com> <20210823202414.731c6749@ktm>
In-Reply-To: <20210823202414.731c6749@ktm>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 23 Aug 2021 12:52:44 -0700
Message-ID: <CAMKF1srLFY_R4KX3gG3hZMhZNtjSN8D4mEp0Wwr78Se9RE_20g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
To: Lukasz Majewski <lukma@denx.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fddbc305ca3f5cd4"

--000000000000fddbc305ca3f5cd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 11:24 AM Lukasz Majewski <lukma@denx.de> wrote:

> Hi Khem,
>
> > On 8/23/21 8:08 AM, ?ukasz Majewski wrote:
> > > This patch introduces new recipe - namely 'glibc-tests', which
> > > builds and installs glibc test suite to OE/Yocto built image.
> > >
> > > It reuses code from already available 'glibc-testsuite' recipe,
> > > which is run with 'bitbake glibc-testsuite -c check' and uses qemu
> > > to execute remotely (via SSH) tests on some emulated machine.
> > >
> > > This recipe installs eligible tests on some rootfs image.
> > > Afterwards, either all of them or only time related subset, those
> > > tests can be executed on the real hardware, to facilitate validation
> > > of this platform with for example Y2038 problem compliance.
> > >
> > > By default all tests are executed, with 'ptest-runner glibc-tests'.
> > > To test only time related subset - one needs to call:
> > > cd /usr/lib/glibc-tests/ptest/; rm run-ptest; \
> > > ln -s run-ptest-time run-ptest; cd -; ptest-runner glibc-tests
> > >
> > > To facilitate debugging, source files are provided by default with
> > > the unstripped debugging symbols. Such approach would reduce the
> > > already complex recipe (as it inherits base glibc one), so there
> > > is no need to also install *-dbg and *-src packages.
> >
> >
> > does it have to be a separate recipe I wonder if we can have it built
> > as part of glibc itself controlled via ptest knob
>
> I've followed the glibc-testsuite recipe to provide tests for ptest.
> Test creation is similar to it, but doesn't require QEMU run (tests are
> executed on the HW).
>
> Another rationale was to have some kind of "features" separation in
> different file (liked glibc-mtrace), which is easier to maintain and
> review.
>
> Last but not least - separate recipe (and built binaries) allow some
> kind of magic with selection of used test programs (this may be useful
> if one would like to have different sets of tests in different packages)
>

That=E2=80=99s seems ok I think the names are quite confusing now not that =
it was
not so much better before but now we have glibc-tests and glibc-testsuites
which do same things but in very different way maybe glibc-testsuite should
be renamed to something like glibc-tests-crosd or some such

>
> >
> > >
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > ---
> > >   .../distro/include/ptest-packagelists.inc     |   1 +
> > >   meta/recipes-core/glibc/glibc-tests_2.34.bb   | 101
> > > ++++++++++++++++++ meta/recipes-core/glibc/glibc/run-ptest-all   |
> > > 25 +++++ meta/recipes-core/glibc/glibc/run-ptest-time  |  30 ++++++
> > >   4 files changed, 157 insertions(+)
> > >   create mode 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
> > >   create mode 100755 meta/recipes-core/glibc/glibc/run-ptest-all
> > >   create mode 100755 meta/recipes-core/glibc/glibc/run-ptest-time
> > >
> > > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> > > b/meta/conf/distro/include/ptest-packagelists.inc index
> > > 3872bdc942..e460ad1c8b 100644 ---
> > > a/meta/conf/distro/include/ptest-packagelists.inc +++
> > > b/meta/conf/distro/include/ptest-packagelists.inc @@ -59,6 +59,7 @@
> > > PTESTS_FAST =3D "\ slang-ptest \
> > >       wayland-ptest \
> > >       zlib-ptest \
> > > +    glibc-tests-ptest \
> > >   "
> > >   PTESTS_FAST:remove:mips64 =3D "qemu-ptest"
> > >   PTESTS_PROBLEMS:append:mips64 =3D "qemu-ptest"
> > > diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb
> > > b/meta/recipes-core/glibc/glibc-tests_2.34.bb new file mode 100644
> > > index 0000000000..896809f700
> > > --- /dev/null
> > > +++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> > > @@ -0,0 +1,101 @@
> > > +require glibc_${PV}.bb
> > > +require glibc-tests.inc
> > > +
> > > +inherit ptest
> > > +
> > > +SRC_URI:append =3D " \
> > > +   file://run-ptest-all file://run-ptest-time \
> > > +"
> > > +
> > > +SUMMARY =3D "glibc tests to be run with ptest"
> > > +
> > > +# Erase some variables already set by glibc_${PV}
> > > +python __anonymous() {
> > > +       # Remove packages provided by glibc build, we only need a
> > > subset of them
> > > +       d.setVar("PACKAGES", "${PN}")
> > > +
> > > +       d.setVar("PROVIDES", "${PN}")
> > > +       d.setVar("RPROVIDES", "${PN} glibc-ptest")
> > > +
> > > +       d.setVar("RRECOMMENDS", "")
> > > +}
> > > +
> > > +# Remove any lefovers from original glibc recipe
> > > +RPROVIDES:${PN} =3D "${PN}"
> > > +RRECOMMENDS:${PN} =3D ""
> > > +RDEPENDS:${PN} =3D "sed"
> > > +
> > > +# Just build tests for target - do not run them
> > > +do_check:append () {
> > > +   oe_runmake -i check run-built-tests=3Dno
> > > +}
> > > +addtask do_check after do_compile before do_install_ptest_base
> > > +
> > > +glibc_strip_build_directory () {
> > > +   # Delete all non executable files from build directory
> > > +   find ${B} ! -executable -type f -delete
> > > +
> > > +   # Remove build dynamic libraries and links to them as
> > > +   # those are already installed in the target device
> > > +   find ${B} -type f -name "*.so" -delete
> > > +   find ${B} -type l -name "*.so*" -delete
> > > +
> > > +   # Remove headers (installed with glibc)
> > > +   find ${B} -type f -name "*.h" -delete
> > > +
> > > +   find ${B} -type f -name "isomac" -delete
> > > +   find ${B} -type f -name "annexc" -delete
> > > +}
> > > +
> > > +do_install_ptest_base () {
> > > +   glibc_strip_build_directory
> > > +
> > > +   # Install build test programs to the image
> > > +   install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
> > > +   cp -r ${B}/* ${D}${PTEST_PATH}/tests/glibc-ptest/
> > > +
> > > +   install -d ${D}${PTEST_PATH}
> > > +   cp ${WORKDIR}/run-ptest-* ${D}${PTEST_PATH}/
> > > +
> > > +   # By default run all glibc tests
> > > +   cd ${D}${PTEST_PATH}/
> > > +   ln -s run-ptest-all run-ptest
> > > +}
> > > +
> > > +# The datadir directory is required to allow core (and reused)
> > > +# glibc cleanup function to finish correctly, as this directory
> > > +# is not created for ptests
> > > +stash_locale_package_cleanup:prepend () {
> > > +   mkdir -p ${PKGD}${datadir}
> > > +}
> > > +
> > > +stash_locale_sysroot_cleanup:prepend () {
> > > +   mkdir -p ${SYSROOT_DESTDIR}${datadir}
> > > +}
> > > +
> > > +# Prevent the do_package() task to set 'libc6' prefix
> > > +# for glibc tests related packages
> > > +python populate_packages:prepend () {
> > > +    if d.getVar('DEBIAN_NAMES'):
> > > +        d.setVar('DEBIAN_NAMES', '')
> > > +}
> > > +
> > > +FILES:${PN} =3D "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*"
> > > +
> > > +EXCLUDE_FROM_SHLIBS =3D "1"
> > > +
> > > +# Install debug data in .debug and sources in /usr/src/debug
> > > +# It is more handy to have _all_ the sources and symbols in one
> > > +# place (package) as this recipe will be used for validation and
> > > +# debugging.
> > > +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug"
> > > +
> > > +# glibc test cases violate by default some Yocto/OE checks
> > > (staticdev, +# textrel)
> > > +# 'debug-files' - add everything (including debug) into one package
> > > +#                 (no need to install/build *-src package)
> > > +INSANE_SKIP:${PN} +=3D "staticdev textrel debug-files rpaths"
> > > +
> > > +deltask do_stash_locale
> > > +do_install[noexec] =3D "1"
> > > +do_populate_sysroot[noexec] =3D "1"
> > > diff --git a/meta/recipes-core/glibc/glibc/run-ptest-all
> > > b/meta/recipes-core/glibc/glibc/run-ptest-all new file mode 100755
> > > index 0000000000..47bfe5238c
> > > --- /dev/null
> > > +++ b/meta/recipes-core/glibc/glibc/run-ptest-all
> > > @@ -0,0 +1,25 @@
> > > +#!/bin/sh
> > > +# ptest script for glibc - to run time related tests to
> > > +# facilitate Y2038 validation
> > > +# Run with 'ptest-runner glibc-tests'
> > > +
> > > +output() {
> > > +  retcode=3D$?
> > > +  if [ $retcode -eq 0 ]
> > > +    then echo "PASS: $i"
> > > +  elif [ $retcode -eq 77 ]
> > > +    then echo "SKIP: $i"
> > > +  else echo "FAIL: $i"
> > > +  fi
> > > +}
> > > +
> > > +# Allow altering time on the target
> > > +export GLIBC_TEST_ALLOW_TIME_SETTING=3D"1"
> > > +
> > > +tst=3D$(ls -r ${PWD}/tests/glibc-ptest/*/*)
> > > +
> > > +for i in ${tst}
> > > +do
> > > +   $i >/dev/null 2>&1
> > > +   output
> > > +done
> > > diff --git a/meta/recipes-core/glibc/glibc/run-ptest-time
> > > b/meta/recipes-core/glibc/glibc/run-ptest-time new file mode 100755
> > > index 0000000000..24dedc6e32
> > > --- /dev/null
> > > +++ b/meta/recipes-core/glibc/glibc/run-ptest-time
> > > @@ -0,0 +1,30 @@
> > > +#!/bin/sh
> > > +# ptest script for glibc - to run time related tests to
> > > +# facilitate Y2038 validation
> > > +# Run with 'ptest-runner glibc-tests'
> > > +
> > > +output() {
> > > +  retcode=3D$?
> > > +  if [ $retcode -eq 0 ]
> > > +    then echo "PASS: $i"
> > > +  elif [ $retcode -eq 77 ]
> > > +    then echo "SKIP: $i"
> > > +  else echo "FAIL: $i"
> > > +  fi
> > > +}
> > > +
> > > +# Allow altering time on the target
> > > +export GLIBC_TEST_ALLOW_TIME_SETTING=3D"1"
> > > +
> > > +tst_time64=3D$(ls -r ${PWD}/tests/glibc-ptest/*/*-time64)
> > > +
> > > +# Remove '-time64' suffix - those tests are also time
> > > +# related
> > > +tst_time_tmp=3D$(sed -e "s/-time64$//" <<< ${tst_time64})
> > > +tst_time=3D"${tst_time_tmp} ${tst_time64}"
> > > +
> > > +for i in ${tst_time}
> > > +do
> > > +   $i >/dev/null 2>&1
> > > +   output
> > > +done
> > >
> > >
> > >
> > >
> > >
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
>

--000000000000fddbc305ca3f5cd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Aug 23, 2021 at 11:24 AM Lukasz Majewski &lt;<a hre=
f=3D"mailto:lukma@denx.de">lukma@denx.de</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)">Hi Khem,<br>
<br>
&gt; On 8/23/21 8:08 AM, ?ukasz Majewski wrote:<br>
&gt; &gt; This patch introduces new recipe - namely &#39;glibc-tests&#39;, =
which<br>
&gt; &gt; builds and installs glibc test suite to OE/Yocto built image.<br>
&gt; &gt; <br>
&gt; &gt; It reuses code from already available &#39;glibc-testsuite&#39; r=
ecipe,<br>
&gt; &gt; which is run with &#39;bitbake glibc-testsuite -c check&#39; and =
uses qemu<br>
&gt; &gt; to execute remotely (via SSH) tests on some emulated machine.<br>
&gt; &gt; <br>
&gt; &gt; This recipe installs eligible tests on some rootfs image.<br>
&gt; &gt; Afterwards, either all of them or only time related subset, those=
<br>
&gt; &gt; tests can be executed on the real hardware, to facilitate validat=
ion<br>
&gt; &gt; of this platform with for example Y2038 problem compliance.<br>
&gt; &gt; <br>
&gt; &gt; By default all tests are executed, with &#39;ptest-runner glibc-t=
ests&#39;.<br>
&gt; &gt; To test only time related subset - one needs to call:<br>
&gt; &gt; cd /usr/lib/glibc-tests/ptest/; rm run-ptest; \<br>
&gt; &gt; ln -s run-ptest-time run-ptest; cd -; ptest-runner glibc-tests<br=
>
&gt; &gt; <br>
&gt; &gt; To facilitate debugging, source files are provided by default wit=
h<br>
&gt; &gt; the unstripped debugging symbols. Such approach would reduce the<=
br>
&gt; &gt; already complex recipe (as it inherits base glibc one), so there<=
br>
&gt; &gt; is no need to also install *-dbg and *-src packages.=C2=A0 <br>
&gt; <br>
&gt; <br>
&gt; does it have to be a separate recipe I wonder if we can have it built<=
br>
&gt; as part of glibc itself controlled via ptest knob<br>
<br>
I&#39;ve followed the glibc-testsuite recipe to provide tests for ptest.<br=
>
Test creation is similar to it, but doesn&#39;t require QEMU run (tests are=
<br>
executed on the HW).<br>
<br>
Another rationale was to have some kind of &quot;features&quot; separation =
in<br>
different file (liked glibc-mtrace), which is easier to maintain and<br>
review.<br>
<br>
Last but not least - separate recipe (and built binaries) allow some<br>
kind of magic with selection of used test programs (this may be useful<br>
if one would like to have different sets of tests in different packages)<br=
>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That=E2=80=99s s=
eems ok I think the names are quite confusing now not that it was not so mu=
ch better before but now we have glibc-tests and glibc-testsuites which do =
same things but in very different way maybe glibc-testsuite should be renam=
ed to something like glibc-tests-crosd or some such=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)"><br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Lukasz Majewski &lt;<a href=3D"mailto:lukma@denx.d=
e" target=3D"_blank">lukma@denx.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc-tests=
_2.34.bb" rel=3D"noreferrer" target=3D"_blank">glibc-tests_2.34.bb</a>=C2=
=A0 =C2=A0| 101<br>
&gt; &gt; ++++++++++++++++++ meta/recipes-core/glibc/glibc/run-ptest-all=C2=
=A0 =C2=A0|<br>
&gt; &gt; 25 +++++ meta/recipes-core/glibc/glibc/run-ptest-time=C2=A0 |=C2=
=A0 30 ++++++<br>
&gt; &gt;=C2=A0 =C2=A04 files changed, 157 insertions(+)<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/glibc/<a href=3D=
"http://glibc-tests_2.34.bb" rel=3D"noreferrer" target=3D"_blank">glibc-tes=
ts_2.34.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0create mode 100755 meta/recipes-core/glibc/glibc/run-=
ptest-all<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100755 meta/recipes-core/glibc/glibc/run-=
ptest-time<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; &gt; b/meta/conf/distro/include/ptest-packagelists.inc index<br>
&gt; &gt; 3872bdc942..e460ad1c8b 100644 ---<br>
&gt; &gt; a/meta/conf/distro/include/ptest-packagelists.inc +++<br>
&gt; &gt; b/meta/conf/distro/include/ptest-packagelists.inc @@ -59,6 +59,7 =
@@<br>
&gt; &gt; PTESTS_FAST =3D &quot;\ slang-ptest \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wayland-ptest \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0zlib-ptest \<br>
&gt; &gt; +=C2=A0 =C2=A0 glibc-tests-ptest \<br>
&gt; &gt;=C2=A0 =C2=A0&quot;<br>
&gt; &gt;=C2=A0 =C2=A0PTESTS_FAST:remove:mips64 =3D &quot;qemu-ptest&quot;<=
br>
&gt; &gt;=C2=A0 =C2=A0PTESTS_PROBLEMS:append:mips64 =3D &quot;qemu-ptest&qu=
ot;<br>
&gt; &gt; diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc-test=
s_2.34.bb" rel=3D"noreferrer" target=3D"_blank">glibc-tests_2.34.bb</a><br>
&gt; &gt; b/meta/recipes-core/glibc/<a href=3D"http://glibc-tests_2.34.bb" =
rel=3D"noreferrer" target=3D"_blank">glibc-tests_2.34.bb</a> new file mode =
100644<br>
&gt; &gt; index 0000000000..896809f700<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-core/glibc/<a href=3D"http://glibc-tests_2.34.=
bb" rel=3D"noreferrer" target=3D"_blank">glibc-tests_2.34.bb</a><br>
&gt; &gt; @@ -0,0 +1,101 @@<br>
&gt; &gt; +require glibc_${PV}.bb<br>
&gt; &gt; +require glibc-tests.inc<br>
&gt; &gt; +<br>
&gt; &gt; +inherit ptest<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI:append =3D &quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0file://run-ptest-all file://run-ptest-time \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SUMMARY =3D &quot;glibc tests to be run with ptest&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# Erase some variables already set by glibc_${PV}<br>
&gt; &gt; +python __anonymous() {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove packages provided by glibc b=
uild, we only need a<br>
&gt; &gt; subset of them<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;PACKAGES&quot;, &quot;=
${PN}&quot;)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;PROVIDES&quot;, &quot;=
${PN}&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;RPROVIDES&quot;, &quot=
;${PN} glibc-ptest&quot;)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;RRECOMMENDS&quot;, &qu=
ot;&quot;)<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +# Remove any lefovers from original glibc recipe<br>
&gt; &gt; +RPROVIDES:${PN} =3D &quot;${PN}&quot;<br>
&gt; &gt; +RRECOMMENDS:${PN} =3D &quot;&quot;<br>
&gt; &gt; +RDEPENDS:${PN} =3D &quot;sed&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# Just build tests for target - do not run them<br>
&gt; &gt; +do_check:append () {<br>
&gt; &gt; +=C2=A0 =C2=A0oe_runmake -i check run-built-tests=3Dno<br>
&gt; &gt; +}<br>
&gt; &gt; +addtask do_check after do_compile before do_install_ptest_base<b=
r>
&gt; &gt; +<br>
&gt; &gt; +glibc_strip_build_directory () {<br>
&gt; &gt; +=C2=A0 =C2=A0# Delete all non executable files from build direct=
ory<br>
&gt; &gt; +=C2=A0 =C2=A0find ${B} ! -executable -type f -delete<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0# Remove build dynamic libraries and links to them =
as<br>
&gt; &gt; +=C2=A0 =C2=A0# those are already installed in the target device<=
br>
&gt; &gt; +=C2=A0 =C2=A0find ${B} -type f -name &quot;*.so&quot; -delete<br=
>
&gt; &gt; +=C2=A0 =C2=A0find ${B} -type l -name &quot;*.so*&quot; -delete<b=
r>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0# Remove headers (installed with glibc)<br>
&gt; &gt; +=C2=A0 =C2=A0find ${B} -type f -name &quot;*.h&quot; -delete<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0find ${B} -type f -name &quot;isomac&quot; -delete<=
br>
&gt; &gt; +=C2=A0 =C2=A0find ${B} -type f -name &quot;annexc&quot; -delete<=
br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +do_install_ptest_base () {<br>
&gt; &gt; +=C2=A0 =C2=A0glibc_strip_build_directory<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0# Install build test programs to the image<br>
&gt; &gt; +=C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests/glibc-ptest/<br>
&gt; &gt; +=C2=A0 =C2=A0cp -r ${B}/* ${D}${PTEST_PATH}/tests/glibc-ptest/<b=
r>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0install -d ${D}${PTEST_PATH}<br>
&gt; &gt; +=C2=A0 =C2=A0cp ${WORKDIR}/run-ptest-* ${D}${PTEST_PATH}/<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0# By default run all glibc tests<br>
&gt; &gt; +=C2=A0 =C2=A0cd ${D}${PTEST_PATH}/<br>
&gt; &gt; +=C2=A0 =C2=A0ln -s run-ptest-all run-ptest<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +# The datadir directory is required to allow core (and reused)<b=
r>
&gt; &gt; +# glibc cleanup function to finish correctly, as this directory<=
br>
&gt; &gt; +# is not created for ptests<br>
&gt; &gt; +stash_locale_package_cleanup:prepend () {<br>
&gt; &gt; +=C2=A0 =C2=A0mkdir -p ${PKGD}${datadir}<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +stash_locale_sysroot_cleanup:prepend () {<br>
&gt; &gt; +=C2=A0 =C2=A0mkdir -p ${SYSROOT_DESTDIR}${datadir}<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +# Prevent the do_package() task to set &#39;libc6&#39; prefix<br=
>
&gt; &gt; +# for glibc tests related packages<br>
&gt; &gt; +python populate_packages:prepend () {<br>
&gt; &gt; +=C2=A0 =C2=A0 if d.getVar(&#39;DEBIAN_NAMES&#39;):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;DEBIAN_NAMES&#39;, &#3=
9;&#39;)<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +FILES:${PN} =3D &quot;${PTEST_PATH}/* /usr/src/debug/glibc-tests=
/*&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +EXCLUDE_FROM_SHLIBS =3D &quot;1&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# Install debug data in .debug and sources in /usr/src/debug<br>
&gt; &gt; +# It is more handy to have _all_ the sources and symbols in one<=
br>
&gt; &gt; +# place (package) as this recipe will be used for validation and=
<br>
&gt; &gt; +# debugging.<br>
&gt; &gt; +PACKAGE_DEBUG_SPLIT_STYLE =3D &quot;debug&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# glibc test cases violate by default some Yocto/OE checks<br>
&gt; &gt; (staticdev, +# textrel)<br>
&gt; &gt; +# &#39;debug-files&#39; - add everything (including debug) into =
one package<br>
&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
no need to install/build *-src package)<br>
&gt; &gt; +INSANE_SKIP:${PN} +=3D &quot;staticdev textrel debug-files rpath=
s&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +deltask do_stash_locale<br>
&gt; &gt; +do_install[noexec] =3D &quot;1&quot;<br>
&gt; &gt; +do_populate_sysroot[noexec] =3D &quot;1&quot;<br>
&gt; &gt; diff --git a/meta/recipes-core/glibc/glibc/run-ptest-all<br>
&gt; &gt; b/meta/recipes-core/glibc/glibc/run-ptest-all new file mode 10075=
5<br>
&gt; &gt; index 0000000000..47bfe5238c<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-core/glibc/glibc/run-ptest-all<br>
&gt; &gt; @@ -0,0 +1,25 @@<br>
&gt; &gt; +#!/bin/sh<br>
&gt; &gt; +# ptest script for glibc - to run time related tests to<br>
&gt; &gt; +# facilitate Y2038 validation<br>
&gt; &gt; +# Run with &#39;ptest-runner glibc-tests&#39;<br>
&gt; &gt; +<br>
&gt; &gt; +output() {<br>
&gt; &gt; +=C2=A0 retcode=3D$?<br>
&gt; &gt; +=C2=A0 if [ $retcode -eq 0 ]<br>
&gt; &gt; +=C2=A0 =C2=A0 then echo &quot;PASS: $i&quot;<br>
&gt; &gt; +=C2=A0 elif [ $retcode -eq 77 ]<br>
&gt; &gt; +=C2=A0 =C2=A0 then echo &quot;SKIP: $i&quot;<br>
&gt; &gt; +=C2=A0 else echo &quot;FAIL: $i&quot;<br>
&gt; &gt; +=C2=A0 fi<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +# Allow altering time on the target<br>
&gt; &gt; +export GLIBC_TEST_ALLOW_TIME_SETTING=3D&quot;1&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +tst=3D$(ls -r ${PWD}/tests/glibc-ptest/*/*)<br>
&gt; &gt; +<br>
&gt; &gt; +for i in ${tst}<br>
&gt; &gt; +do<br>
&gt; &gt; +=C2=A0 =C2=A0$i &gt;/dev/null 2&gt;&amp;1<br>
&gt; &gt; +=C2=A0 =C2=A0output<br>
&gt; &gt; +done<br>
&gt; &gt; diff --git a/meta/recipes-core/glibc/glibc/run-ptest-time<br>
&gt; &gt; b/meta/recipes-core/glibc/glibc/run-ptest-time new file mode 1007=
55<br>
&gt; &gt; index 0000000000..24dedc6e32<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-core/glibc/glibc/run-ptest-time<br>
&gt; &gt; @@ -0,0 +1,30 @@<br>
&gt; &gt; +#!/bin/sh<br>
&gt; &gt; +# ptest script for glibc - to run time related tests to<br>
&gt; &gt; +# facilitate Y2038 validation<br>
&gt; &gt; +# Run with &#39;ptest-runner glibc-tests&#39;<br>
&gt; &gt; +<br>
&gt; &gt; +output() {<br>
&gt; &gt; +=C2=A0 retcode=3D$?<br>
&gt; &gt; +=C2=A0 if [ $retcode -eq 0 ]<br>
&gt; &gt; +=C2=A0 =C2=A0 then echo &quot;PASS: $i&quot;<br>
&gt; &gt; +=C2=A0 elif [ $retcode -eq 77 ]<br>
&gt; &gt; +=C2=A0 =C2=A0 then echo &quot;SKIP: $i&quot;<br>
&gt; &gt; +=C2=A0 else echo &quot;FAIL: $i&quot;<br>
&gt; &gt; +=C2=A0 fi<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +# Allow altering time on the target<br>
&gt; &gt; +export GLIBC_TEST_ALLOW_TIME_SETTING=3D&quot;1&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +tst_time64=3D$(ls -r ${PWD}/tests/glibc-ptest/*/*-time64)<br>
&gt; &gt; +<br>
&gt; &gt; +# Remove &#39;-time64&#39; suffix - those tests are also time<br=
>
&gt; &gt; +# related<br>
&gt; &gt; +tst_time_tmp=3D$(sed -e &quot;s/-time64$//&quot; &lt;&lt;&lt; ${=
tst_time64})<br>
&gt; &gt; +tst_time=3D&quot;${tst_time_tmp} ${tst_time64}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +for i in ${tst_time}<br>
&gt; &gt; +do<br>
&gt; &gt; +=C2=A0 =C2=A0$i &gt;/dev/null 2&gt;&amp;1<br>
&gt; &gt; +=C2=A0 =C2=A0output<br>
&gt; &gt; +done<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0<br>
<br>
<br>
<br>
<br>
Best regards,<br>
<br>
Lukasz Majewski<br>
<br>
--<br>
<br>
DENX Software Engineering GmbH,=C2=A0 =C2=A0 =C2=A0 Managing Director: Wolf=
gang Denk<br>
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany<br>
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: <a href=3D"mailt=
o:lukma@denx.de" target=3D"_blank">lukma@denx.de</a><br>
</blockquote></div></div>

--000000000000fddbc305ca3f5cd4--
