Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.26291.1629735473053992122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 09:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GBoCQ7aa;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id e15so10447502plh.8
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 09:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=I93X+LUyXFMuA+GzHnynKmzwJZ+4zlJR0vif0iHV7bQ=;
        b=GBoCQ7aac5u5oiOCWYu/pfF0efeRZ4+k2nHlrTyVxAosfbRbTuhgDgXkA3qi1l+ag7
         uasj12o21rLxH3tNw8jAX+vcnH3BDSN1yj5/UjqvSDYj28dXrHwJmyHG2K5Rx+h9fqmf
         55zsx1NcK+jp9f/QvG6GCIz0/icg7E1F2UzMRyy/rJoYJLN8LQMuD95HRY06ZzuDNrcg
         riQTHZSCwjGrwfOK4/qaQtu7TaM4N7akmzdwfNO7bY1BSioTl8BrFbzXr47X1MjP+Dlj
         Ymfyo80iKKUtrHI9QNDte/REbojkyF8vZex3j/EQMAbsxb5U38/W8zwfStMwY8uYkISt
         p6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=I93X+LUyXFMuA+GzHnynKmzwJZ+4zlJR0vif0iHV7bQ=;
        b=klhpXCKwwxMn4ksSkEJwhT40sz5qiTqEoYAndvq1HAJaxnXxOn0+8AegEN6UgCJbsB
         i0McO2ZPfGwiVL311L0/mNAlyI2iSdpxvsxWJA3r1Or0M5fvp9rEUmW9aFYkyLEcm7C2
         4pC5+2bfkJZ/a4qMfddtXkUvrwT4mYX6A/slQmuobhtCBqPQeLAgV7FlAs8l8BVitil6
         dMmFFf0Sn9VLZKMMN2TxeaYsrlBkeOV0Oxzt/6Ns24yGcClqxmiACzPaoBmBk9VHiQy4
         XVqlC+NN0AsWOMuEZFDwb0E4ja7SXhYve7423NAE88YLg9bSS0rIMA6gq7Pr5nSFxLC/
         kY1w==
X-Gm-Message-State: AOAM532UF8LRoNnR/G0SC78O+YlhPxO2/P30cYtHQUiSMxUlSYPZY9Qx
	Y/2dr04/61eN75BbhhHppYA=
X-Google-Smtp-Source: ABdhPJwgc4spDef0d4lTUDbgCCL5pwx5RRONjnTUdVnC9fb6Rso/lWb8Eb/aS0sf0yIesCBLwC2mpw==
X-Received: by 2002:a17:90a:c908:: with SMTP id v8mr13140628pjt.196.1629735472333;
        Mon, 23 Aug 2021 09:17:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:7cf5:888d:b618:582d? ([2601:646:9200:a0f0:7cf5:888d:b618:582d])
        by smtp.gmail.com with UTF8SMTPSA id l2sm15946835pfc.157.2021.08.23.09.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 09:17:51 -0700 (PDT)
Message-ID: <ada9987d-399b-7a73-2aa5-c09dcca41fb3@gmail.com>
Date: Mon, 23 Aug 2021 09:17:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.1
Subject: Re: [OE-core] [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
To: ?ukasz Majewski <lukma@denx.de>, poky@yoctoproject.org,
 openembedded-core@lists.openembedded.org
References: <20210823150853.2817-1-lukma@denx.de>
 <20210823150853.2817-2-lukma@denx.de>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210823150853.2817-2-lukma@denx.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/23/21 8:08 AM, ?ukasz Majewski wrote:
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


does it have to be a separate recipe I wonder if we can have it built as 
part of glibc itself controlled via ptest knob

> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>   .../distro/include/ptest-packagelists.inc     |   1 +
>   meta/recipes-core/glibc/glibc-tests_2.34.bb   | 101 ++++++++++++++++++
>   meta/recipes-core/glibc/glibc/run-ptest-all   |  25 +++++
>   meta/recipes-core/glibc/glibc/run-ptest-time  |  30 ++++++
>   4 files changed, 157 insertions(+)
>   create mode 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
>   create mode 100755 meta/recipes-core/glibc/glibc/run-ptest-all
>   create mode 100755 meta/recipes-core/glibc/glibc/run-ptest-time
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 3872bdc942..e460ad1c8b 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -59,6 +59,7 @@ PTESTS_FAST = "\
>       slang-ptest \
>       wayland-ptest \
>       zlib-ptest \
> +    glibc-tests-ptest \
>   "
>   PTESTS_FAST:remove:mips64 = "qemu-ptest"
>   PTESTS_PROBLEMS:append:mips64 = "qemu-ptest"
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
> 
> 
> 
> 
> 
