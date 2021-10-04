Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE8AC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 10:37:21 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.7513.1633343840218397570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 03:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id F266D10000F;
	Mon,  4 Oct 2021 10:37:17 +0000 (UTC)
Date: Mon, 4 Oct 2021 12:37:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ?ukasz Majewski <lukma@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nathan Rossi <nathan@nathanrossi.com>,
	Khem Raj <raj.khem@gmail.com>,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH RESEND 2/2] glibc: ptest: Add support for
 running glibc test suite with ptest
Message-ID: <YVrZXeLExh37E5JB@piout.net>
References: <20210930104357.3906-1-lukma@denx.de>
 <20210930104357.3906-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930104357.3906-2-lukma@denx.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 10:37:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156581

Hello Lukasz,


On 30/09/2021 12:43:57+0200, ?ukasz Majewski wrote:
> This patch introduces new recipe - namely 'glibc-tests', which
> builds and installs glibc test suite to OE/Yocto built image.
> 
> It reuses code from already available 'glibc-testsuite' recipe,
> which is run with 'bitbake glibc-testsuite -c check' and uses qemu
> to execute remotely (via SSH) tests on some emulated machine.
> 
> This recipe installs eligible tests on some rootfs image.
> Afterwards, either all of them or only time related subset, those
> tests can be executed on the real hardware, to facilitate validation
> of this platform with for example Y2038 problem compliance.
> 
> By default all tests are executed, with 'ptest-runner glibc-tests'.
> To test only time related subset - one needs to call:
> cd /usr/lib/glibc-tests/ptest/; rm run-ptest; \
> ln -s run-ptest-time run-ptest; cd -; ptest-runner glibc-tests
> 
> To facilitate debugging, source files are provided by default with
> the unstripped debugging symbols. Such approach would reduce the
> already complex recipe (as it inherits base glibc one), so there
> is no need to also install *-dbg and *-src packages.
> 

This ends up with:

ERROR: Nothing RPROVIDES 'glibc-tests-ptest' (but /home/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/recipes-core/images/core-image-ptest-all.bb RDEPENDS on or otherwise requires it)

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2341/steps/11/logs/stdio

> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  .../distro/include/ptest-packagelists.inc     |   1 +
>  meta/recipes-core/glibc/glibc-tests_2.34.bb   | 101 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc/run-ptest-all   |  25 +++++
>  meta/recipes-core/glibc/glibc/run-ptest-time  |  30 ++++++
>  4 files changed, 157 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
>  create mode 100755 meta/recipes-core/glibc/glibc/run-ptest-all
>  create mode 100755 meta/recipes-core/glibc/glibc/run-ptest-time
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index e0ae1dd971..2031c8730a 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -60,6 +60,7 @@ PTESTS_FAST = "\
>      slang-ptest \
>      wayland-ptest \
>      zlib-ptest \
> +    glibc-tests-ptest \
>  "
>  PTESTS_FAST:remove:mips64 = "qemu-ptest"
>  PTESTS_PROBLEMS:append:mips64 = "qemu-ptest"
> diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> new file mode 100644
> index 0000000000..896809f700
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> @@ -0,0 +1,101 @@
> +require glibc_${PV}.bb
> +require glibc-tests.inc
> +
> +inherit ptest
> +
> +SRC_URI:append = " \
> +	file://run-ptest-all file://run-ptest-time \
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
> +RDEPENDS:${PN} = "sed"
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
> +	# Install build test programs to the image
> +	install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
> +	cp -r ${B}/* ${D}${PTEST_PATH}/tests/glibc-ptest/
> +
> +	install -d ${D}${PTEST_PATH}
> +	cp ${WORKDIR}/run-ptest-* ${D}${PTEST_PATH}/
> +
> +	# By default run all glibc tests
> +	cd ${D}${PTEST_PATH}/
> +	ln -s run-ptest-all run-ptest
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
> diff --git a/meta/recipes-core/glibc/glibc/run-ptest-all b/meta/recipes-core/glibc/glibc/run-ptest-all
> new file mode 100755
> index 0000000000..47bfe5238c
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/run-ptest-all
> @@ -0,0 +1,25 @@
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
> +tst=$(ls -r ${PWD}/tests/glibc-ptest/*/*)
> +
> +for i in ${tst}
> +do
> +	$i >/dev/null 2>&1
> +	output
> +done
> diff --git a/meta/recipes-core/glibc/glibc/run-ptest-time b/meta/recipes-core/glibc/glibc/run-ptest-time
> new file mode 100755
> index 0000000000..24dedc6e32
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/run-ptest-time
> @@ -0,0 +1,30 @@
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
> +tst_time64=$(ls -r ${PWD}/tests/glibc-ptest/*/*-time64)
> +
> +# Remove '-time64' suffix - those tests are also time
> +# related
> +tst_time_tmp=$(sed -e "s/-time64$//" <<< ${tst_time64})
> +tst_time="${tst_time_tmp} ${tst_time64}"
> +
> +for i in ${tst_time}
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
> View/Reply Online (#156490): https://lists.openembedded.org/g/openembedded-core/message/156490
> Mute This Topic: https://lists.openembedded.org/mt/85970382/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

