Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF50C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 20:59:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2461.1635368374976126520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 13:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C949B1C0005;
	Wed, 27 Oct 2021 20:59:31 +0000 (UTC)
Date: Wed, 27 Oct 2021 22:59:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ?ukasz Majewski <lukma@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nathan Rossi <nathan@nathanrossi.com>,
	Khem Raj <raj.khem@gmail.com>,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] glibc: ptest: Add running glibc time
 related test suite (Y2038) with ptest
Message-ID: <YXm9s2mVGNI+NtzR@piout.net>
References: <20211019124300.16301-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019124300.16301-1-lukma@denx.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 20:59:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157568

Hello,

I'm sorry for the late reply but this still failed on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2719/steps/11/logs/stdio

On 19/10/2021 14:43:00+0200, ?ukasz Majewski wrote:
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
> Changes for v2:
> - Just focus on time related set of tests as those can be run as
>   standalone
> - Reuse of already built tests (from glibc-tests.inc) and depoloy
>   them on the HW target.
> - Provide single 'run-ptest' script.
> - Update the recipe to run with newest poky's -master
> ---
>  .../distro/include/ptest-packagelists.inc     |   1 +
>  meta/recipes-core/glibc/glibc-tests_2.34.bb   | 112 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc/run-ptest       |  37 ++++++
>  3 files changed, 150 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
>  create mode 100755 meta/recipes-core/glibc/glibc/run-ptest
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 2e324f8da4..fd52fa72a4 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -61,6 +61,7 @@ PTESTS_FAST = "\
>      slang-ptest \
>      wayland-ptest \
>      zlib-ptest \
> +    glibc-tests-ptest \
>  "
>  PTESTS_FAST:remove:mips64 = "qemu-ptest"
>  PTESTS_PROBLEMS:append:mips64 = "qemu-ptest"
> diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> new file mode 100644
> index 0000000000..f1d5d073b6
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> @@ -0,0 +1,112 @@
> +require glibc_${PV}.bb
> +require glibc-tests.inc
> +
> +inherit ptest
> +
> +SRC_URI:append = " \
> +	file://run-ptest \
> +"
> +
> +SUMMARY = "glibc tests to be run with ptest"
> +
> +# Erase some variables already set by glibc_${PV}
> +python __anonymous() {
> +       # Remove packages provided by glibc build, we only need a subset of them
> +       d.setVar("PACKAGES", "${PN}")
> +
> +       d.setVar("PROVIDES", "${PN}")
> +       d.setVar("RPROVIDES", "${PN} glibc-ptest")
> +
> +       d.setVar("RRECOMMENDS", "")
> +}
> +
> +# Remove any lefovers from original glibc recipe
> +RPROVIDES:${PN} = "${PN}"
> +RRECOMMENDS:${PN} = ""
> +RDEPENDS:${PN} = " glibc sed"
> +DEPENDS:append = " sed"
> +
> +# Just build tests for target - do not run them
> +do_check:append () {
> +	oe_runmake -i check run-built-tests=no
> +}
> +addtask do_check after do_compile before do_install_ptest_base
> +
> +glibc_strip_build_directory () {
> +	# Delete all non executable files from build directory
> +	find ${B} ! -executable -type f -delete
> +
> +	# Remove build dynamic libraries and links to them as
> +	# those are already installed in the target device
> +	find ${B} -type f -name "*.so" -delete
> +	find ${B} -type l -name "*.so*" -delete
> +
> +	# Remove headers (installed with glibc)
> +	find ${B} -type f -name "*.h" -delete
> +
> +	find ${B} -type f -name "isomac" -delete
> +	find ${B} -type f -name "annexc" -delete
> +}
> +
> +do_install_ptest_base () {
> +	glibc_strip_build_directory
> +
> +	ls -r ${B}/*/*-time64 > ${B}/tst_time64
> +
> +	# Remove '-time64' suffix - those tests are also time related
> +	sed -e "s/-time64$//" ${B}/tst_time64 > ${B}/tst_time_tmp
> +	tst_time=$(cat ${B}/tst_time_tmp ${B}/tst_time64)
> +
> +	rm ${B}/tst_time_tmp ${B}/tst_time64
> +	echo "${tst_time}"
> +
> +	# Install build test programs to the image
> +	install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
> +
> +	for f in "${tst_time}"
> +	do
> +	    cp -r ${f} ${D}${PTEST_PATH}/tests/glibc-ptest/
> +	done
> +
> +	install -d ${D}${PTEST_PATH}
> +	cp ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
> +
> +}
> +
> +# The datadir directory is required to allow core (and reused)
> +# glibc cleanup function to finish correctly, as this directory
> +# is not created for ptests
> +stash_locale_package_cleanup:prepend () {
> +	mkdir -p ${PKGD}${datadir}
> +}
> +
> +stash_locale_sysroot_cleanup:prepend () {
> +	mkdir -p ${SYSROOT_DESTDIR}${datadir}
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
> +	$i >/dev/null 2>&1
> +	output
> +done
> +
> +# Run tests supporting only 64 bit time
> +for i in ${tst_time64}
> +do
> +	$i >/dev/null 2>&1
> +	output
> +done
> -- 
> 2.20.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157113): https://lists.openembedded.org/g/openembedded-core/message/157113
> Mute This Topic: https://lists.openembedded.org/mt/86438618/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

