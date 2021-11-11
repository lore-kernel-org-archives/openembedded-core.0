Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634C4C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 13:51:54 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.10739.1636638713416285636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 05:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jQkUbESh;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id z9so5296452qtj.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 05:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KfJvk140tpWL3LzfuLbbUJjZoK7sFTF1X4MbH8gym+Y=;
        b=jQkUbEShttCr7cOmpqf32PF5E6AJv9BSoLLFYzNfMZdChe4E3GrGdLB3x7ma8bOUvK
         iAVEJJtF/Zy4MOkHGtPsL7mGNZGnTPWtYr1iOQRbpQVnluUyl4RAo6zmYrniCwMJaQQx
         3KrCFThtCqKOpBk6BtrwZY7VPK44HA4fSuKTif73B91069OEDLQYLVHuUgyOnPaOKmn7
         GVFtiL7wAwfn9xNj/WaW/mON8wXcJBJOCXRhMy+CTwHfyynuAAgr+ssDqr3rJ95/mmGg
         L1ia2ZHk6JuIqRQ+amdEjRYPBBOXn71LTF8sloEHnW9OTaInaWfcukyrWMAEN2ck8yTW
         pItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KfJvk140tpWL3LzfuLbbUJjZoK7sFTF1X4MbH8gym+Y=;
        b=BTyPcpFf3u2LaRtXMIg+yPnLdAY2wKpUchXV0JgFrCCHZ4aRRDV5DC/xBLa+KW1kxX
         O4mNN6ER7SF98sPbRvh4SCe5rbQ7+zePw7AG1sZyIKwF0mE9bxGpfVKAC4AiFVGQuhXd
         i9NotmjSWhCM//w2rDnF7OJ5bzUHcavJOHFrcuVC/RmkgvEvmfk1NkZZ/Eh+rIGYmbMn
         eXXYrEGbacnN6P136//T/1e6O9VSXoPwktL9tCVMORWnwIsj5CCP91Zi1kN8FKopWDZU
         Y805k7k374Gs68OR8sGUhziQPnWSscRbK3ne5im7QBBc1b+Sq4fkMqjmPW38OvJNORs7
         lVXg==
X-Gm-Message-State: AOAM530nUJoZ3FHlzur8JGqu7/vRYoa9ysMisRSQg3BEaIGv0m9jAxh9
	ymwDmMUlauWHv+rEijerVO/bHbYXG3haXx2DcnU=
X-Google-Smtp-Source: 
 ABdhPJxQBH2KTkyzo6V5k68kmtTlel6NoA6lJaHOTjhvNSx8xTAKvLLYKrKkvzlwugLKRyc77Gi6K4qmOBXsH1YdCBI=
X-Received: by 2002:ac8:45d2:: with SMTP id e18mr7952250qto.112.1636638712459;
 Thu, 11 Nov 2021 05:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20211109152851.8137-1-lukma@denx.de>
In-Reply-To: <20211109152851.8137-1-lukma@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Nov 2021 05:51:26 -0800
Message-ID: 
 <CAMKF1srQjFZ4DfGGVsV47SS0ma1LewE24Luwgtw-FwcCsOU_DQ@mail.gmail.com>
Subject: Re: [PATCH v4] glibc: ptest: Add running glibc time related test
 suite (Y2038) with ptest
To: Lukasz Majewski <lukma@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nathan Rossi <nathan@nathanrossi.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lee Chee Yang <chee.yang.lee@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 13:51:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158179

On Tue, Nov 9, 2021 at 7:29 AM Lukasz Majewski <lukma@denx.de> wrote:
>
> This patch introduces new recipe - namely 'glibc-tests', which
> builds and installs time related (to check if Y2038 support works) glibc
> test suite to OE/Yocto built image.
>
> It reuses code from already available 'glibc-testsuite' recipe,
> which is run with 'bitbake glibc-testsuite -c check' and uses qemu
> to execute remotely (via SSH) tests on some emulated machine.
>
> This recipe installs time related glibc tests on some rootfs image.
> Afterwards, those tests can be executed on the real hardware, to
> facilitate validation of it with Y2038 problem compliance.
>
> To test time related subset - one needs to call:
> ptest-runner glibc-tests
> then change the date after Y2038 threshold for 32 bit systems:
> date -s "20 JAN 2038 18:00:00"
> and then run ptest-runner again.
>
> To facilitate debugging, source files are provided by default with
> the unstripped debugging symbols. Such approach would reduce the
> already complex recipe (as it inherits base glibc one), so there
> is no need to also install *-dbg and *-src packages.
>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>
> ---
> Changes for v4:
> - Add entry for 'glibc-tests' in the maintainers.inc file
> - Remove nativesdk from BBCLASSEXTEND as this resipe is not supposed
>   to be the part of SDK
>
> Changes for v3:
> - Provide missing ${PN}-ptest for PACKAGES, PROVIDES and
>   RPROVIDES variables
>
> Changes for v2:
> - Just focus on time related set of tests as those can be run as
>   standalone
> - Reuse of already built tests (from glibc-tests.inc) and depoloy
>   them on the HW target.
> - Provide single 'run-ptest' script.
> - Update the recipe to run with newest poky's -master
> ---
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  .../distro/include/ptest-packagelists.inc     |   1 +
>  meta/recipes-core/glibc/glibc-tests_2.34.bb   | 113 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc/run-ptest       |  37 ++++++
>  4 files changed, 152 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
>  create mode 100755 meta/recipes-core/glibc/glibc/run-ptest
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index baec2bef4d..7104e091fc 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -209,6 +209,7 @@ RECIPE_MAINTAINER:pn-glibc = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-glibc-tests = "Lukasz Majewski <lukma@denx.de>"
>  RECIPE_MAINTAINER:pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glide = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
>  RECIPE_MAINTAINER:pn-gmp = "Khem Raj <raj.khem@gmail.com>"
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 2e324f8da4..fd52fa72a4 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -61,6 +61,7 @@ PTESTS_FAST = "\
>      slang-ptest \
>      wayland-ptest \
>      zlib-ptest \
> +    glibc-tests-ptest \

this will break musl. So lets change this to

PTESTS_FAST:append:libc-glibc = " glibc-tests-ptest"

>  "
>  PTESTS_FAST:remove:mips64 = "qemu-ptest"
>  PTESTS_PROBLEMS:append:mips64 = "qemu-ptest"
> diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> new file mode 100644
> index 0000000000..d2d3cfff91
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> @@ -0,0 +1,113 @@
> +require glibc_${PV}.bb
> +require glibc-tests.inc
> +
> +inherit ptest
> +
> +SRC_URI:append = " \
> +       file://run-ptest \
> +"
> +
> +SUMMARY = "glibc tests to be run with ptest"
> +
> +# Erase some variables already set by glibc_${PV}
> +python __anonymous() {
> +       # Remove packages provided by glibc build, we only need a subset of them
> +       d.setVar("PACKAGES", "${PN} ${PN}-ptest")
> +
> +       d.setVar("PROVIDES", "${PN} ${PN}-ptest")
> +       d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
> +
> +       d.setVar("BBCLASSEXTEND", "")
> +       d.setVar("RRECOMMENDS", "")
> +}
> +
> +# Remove any lefovers from original glibc recipe
                              ^^^^^^
typo

> +RPROVIDES:${PN} = "${PN}"
> +RRECOMMENDS:${PN} = ""
> +RDEPENDS:${PN} = " glibc sed"
> +DEPENDS:append = " sed"
> +
> +# Just build tests for target - do not run them
> +do_check:append () {
> +       oe_runmake -i check run-built-tests=no
> +}
> +addtask do_check after do_compile before do_install_ptest_base
> +
> +glibc_strip_build_directory () {
> +       # Delete all non executable files from build directory
> +       find ${B} ! -executable -type f -delete
> +
> +       # Remove build dynamic libraries and links to them as
> +       # those are already installed in the target device
> +       find ${B} -type f -name "*.so" -delete
> +       find ${B} -type l -name "*.so*" -delete
> +
> +       # Remove headers (installed with glibc)
> +       find ${B} -type f -name "*.h" -delete
> +
> +       find ${B} -type f -name "isomac" -delete
> +       find ${B} -type f -name "annexc" -delete
> +}
> +
> +do_install_ptest_base () {
> +       glibc_strip_build_directory
> +
> +       ls -r ${B}/*/*-time64 > ${B}/tst_time64
> +
> +       # Remove '-time64' suffix - those tests are also time related
> +       sed -e "s/-time64$//" ${B}/tst_time64 > ${B}/tst_time_tmp
> +       tst_time=$(cat ${B}/tst_time_tmp ${B}/tst_time64)
> +
> +       rm ${B}/tst_time_tmp ${B}/tst_time64
> +       echo "${tst_time}"
> +
> +       # Install build test programs to the image
> +       install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
> +
> +       for f in "${tst_time}"
> +       do
> +           cp -r ${f} ${D}${PTEST_PATH}/tests/glibc-ptest/
> +       done
> +
> +       install -d ${D}${PTEST_PATH}
> +       cp ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
> +
> +}
> +
> +# The datadir directory is required to allow core (and reused)
> +# glibc cleanup function to finish correctly, as this directory
> +# is not created for ptests
> +stash_locale_package_cleanup:prepend () {
> +       mkdir -p ${PKGD}${datadir}
> +}
> +
> +stash_locale_sysroot_cleanup:prepend () {
> +       mkdir -p ${SYSROOT_DESTDIR}${datadir}
> +}
> +
> +# Prevent the do_package() task to set 'libc6' prefix
> +# for glibc tests related packages
> +python populate_packages:prepend () {
> +    if d.getVar('DEBIAN_NAMES'):
> +        d.setVar('DEBIAN_NAMES', '')
> +}
> +
> +FILES:${PN} = "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*"
> +
> +EXCLUDE_FROM_SHLIBS = "1"
> +
> +# Install debug data in .debug and sources in /usr/src/debug
> +# It is more handy to have _all_ the sources and symbols in one
> +# place (package) as this recipe will be used for validation and
> +# debugging.
> +PACKAGE_DEBUG_SPLIT_STYLE = "debug"
> +
> +# glibc test cases violate by default some Yocto/OE checks (staticdev,
> +# textrel)
> +# 'debug-files' - add everything (including debug) into one package
> +#                 (no need to install/build *-src package)
> +INSANE_SKIP:${PN} += "staticdev textrel debug-files rpaths"
> +
> +deltask do_stash_locale
> +do_install[noexec] = "1"
> +do_populate_sysroot[noexec] = "1"
> diff --git a/meta/recipes-core/glibc/glibc/run-ptest b/meta/recipes-core/glibc/glibc/run-ptest
> new file mode 100755
> index 0000000000..f637986105
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/run-ptest
> @@ -0,0 +1,37 @@
> +#!/bin/sh
> +# ptest script for glibc - to run time related tests to
> +# facilitate Y2038 validation
> +# Run with 'ptest-runner glibc-tests'
> +
> +output() {
> +  retcode=$?
> +  if [ $retcode -eq 0 ]
> +    then echo "PASS: $i"
> +  elif [ $retcode -eq 77 ]
> +    then echo "SKIP: $i"
> +  else echo "FAIL: $i"
> +  fi
> +}
> +
> +# Allow altering time on the target
> +export GLIBC_TEST_ALLOW_TIME_SETTING="1"
> +
> +tst_time64=$(ls -r ${PWD}/tests/glibc-ptest/*-time64)
> +
> +# Remove '-time64' suffix - those tests are also time
> +# related
> +tst_time_tmp=$(sed -e "s/-time64$//" <<< ${tst_time64})
> +
> +# Run tests supporting only 32 bit time
> +for i in ${tst_time_tmp}
> +do
> +       $i >/dev/null 2>&1
> +       output
> +done
> +
> +# Run tests supporting only 64 bit time
> +for i in ${tst_time64}
> +do
> +       $i >/dev/null 2>&1
> +       output
> +done
> --
> 2.20.1
>

