Return-Path: <semc.2042@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907BBC3ABCB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 17:07:56 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.55659.1747069669226840745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 10:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EuKNA/CR;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: semc.2042@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22d95f0dda4so55106495ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 10:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747069668; x=1747674468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dnl8rSw7RuvyuW6Rigk1SfQJMJq/KTegqVQ0B2EC9yc=;
        b=EuKNA/CR9aZ0wQFSfAbxadosYGU5lHbJiGuUHpQhRBI3eBrWKhkhjdQh3noB5447N0
         VC9l4nWd0E8BXzymF+D0Kwgbt02KVXKouNcHPN+LMlsfbP8mKE4ifm7ZkEhOIBTfi+n1
         xBK4hFOqIR8JX4mb7v/jo343UG4UgLqdTIeTshOAwsd5p7buVkXIwvTGoZiNCyyPjqGd
         7zH/87RBaOYiDoite+55RSet6dmzn41RRakOOKRIT6Ur/c9RMzQbCRpn7cMDejfvmxpL
         AM1GEOd/8YvuRZ0iCD/PmEngEnMfQkB/kjCtfgrvqefMAU1Nng51nontdZfpVn1JG/Ar
         fm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747069668; x=1747674468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnl8rSw7RuvyuW6Rigk1SfQJMJq/KTegqVQ0B2EC9yc=;
        b=qgHNBf1oOKEGELoEOSMgKALFV29HKJhATBU6JpFd0zYGEzTZe87f36wwsEB1uPmazv
         INR8D9u/qlMPSA4NcyVI/79K5UD3at0BDxfVBhBNutxSJJwLZPDnxp7Vr8cBydcWFLR7
         SKM882KQb0gEocEsF2Sny9z+ExTlf3xYav2GdnYWFnwnx1e722jtatsMn73ImH+rTYoG
         Q4fAp3itVhOJXkV5+WT2yt1Z98L7TcUwsc5WUoBWK5hNCR1LkiRIFl0QOTdSrWJIpfiA
         7dEV8q7OqUa3P71lMFbrBC+K8azsQdXEQnaAlp+3y84Bnd0Coxi6nLashG17KidmP1ke
         2Dww==
X-Gm-Message-State: AOJu0YwI33kZKtx4ou9uVaOlXqgBKP2DjYZ07V818MiHFequy7QWQwPS
	7wWcyfkdKOr2a7YMKJugKfM6xwj4lpOIrkxBVT9r6MO9KgqNlAzNwwFq4w==
X-Gm-Gg: ASbGncs6c4LDatjfb6qtoOCesnH3/wnCCByNEQdAbC8VeTY+8m2wH96zeND5ENl8YSb
	inEVzbcqz+QgkurJD+u5spl6QyrNbRZvRtv5080rYvXRqWIcy5x5HXMXhTU84I9TXoydoomHKgx
	Po2o5uRthujSpT3FNcaspinw768nUWlONXdWgSU0wB5kndxlGuvVX3sSfzznMSAkSupq86NWpEg
	zCCx7Amnul+RSmvkcWjfiONGK6nRxjlJ5LhaqhTwBruATysk7h5liZ3MasCGHFI4tsIAQZEnTOe
	TjOPl+x24eymYdz1LmX9Yzh4IIZ7yoBy5WPRQVAgfJCUIZaxiGueHYDxfUCPKGOTN2s=
X-Google-Smtp-Source: AGHT+IG7Odr0NGO+A/JQJ23bSx16TTdbNXkHzuxxmJTcuub3IRyIA4n8L27gcyTzryPRuiHa9Gfy7A==
X-Received: by 2002:a17:902:e94d:b0:224:8bf:6d81 with SMTP id d9443c01a7336-22fc918c322mr211138595ad.46.1747069668059;
        Mon, 12 May 2025 10:07:48 -0700 (PDT)
Received: from L-16522.kpit.com ([49.207.205.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82bd34bsm65700635ad.243.2025.05.12.10.07.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 10:07:47 -0700 (PDT)
From: rajmohan r <semc.2042@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] glibc-y2038-tests: remove glibc-y2038-tests_2.39.bb recipe
Date: Mon, 12 May 2025 22:37:43 +0530
Message-Id: <20250512170743.108621-1-semc.2042@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 17:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216381

This recipe takes longer time >20min when bitbake for package
write stage. When cross-verified for longer time duration, found
that do_check() stage taking 20min while other stages completes
before 6min.

This recipe gives only below two test binaries in the packages to
test (ptest: glibc-y2038-tests):
     io/ftwtest
     io/ftwtest-time64

The above test binaries are already included for testing in recipe
glibc-testsuite_2.39.bb.

It is by now well established that glibc itself works as it should,
that all affected 32 bit targets are configured to use 64 bit time_t,
and that any lingering y2038 issues are in components other than the c
library, and usually come from C programming mistakes (e.g. storing
timestamps in long). So this recipe seems to be redundant and
can be removed.

Review comments for fixing above longer time duration ended up in
removing this recipe as a proposal is below
https://lists.openembedded.org/g/openembedded-core/topic/112188476#msg214636

Removed lines having reference to glibc-y2038-tests in the files.

For master branch requested for integration and below is the link
https://lists.openembedded.org/g/openembedded-core/message/215655

Signed-off-by: rajmohan r <semc.2042@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../distro/include/ptest-packagelists.inc     |   2 -
 meta/conf/distro/include/time64.inc           |   2 -
 .../glibc/glibc-y2038-tests_2.39.bb           | 119 ------------------
 meta/recipes-core/glibc/glibc/run-ptest       |  37 ------
 5 files changed, 161 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
 delete mode 100755 meta/recipes-core/glibc/glibc/run-ptest

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index baaf971a9a..9548fcd258 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -210,7 +210,6 @@ RECIPE_MAINTAINER:pn-glibc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-glibc-y2038-tests = "Lukasz Majewski <lukma@denx.de>"
 RECIPE_MAINTAINER:pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glslang = "Jose Quaresma <quaresma.jose@gmail.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5975db25cc..3387e19191 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -81,8 +81,6 @@ PTESTS_FAST = "\
     zlib \
     libexif \
 "
-PTESTS_FAST:append:libc-glibc = " glibc-y2038-tests"
-PTESTS_PROBLEMS:remove:libc-glibc = "glibc-y2038-tests"
 PTESTS_FAST:remove:mips64 = "qemu"
 PTESTS_PROBLEMS:append:mips64 = " qemu"
 PTESTS_FAST:remove:riscv32 = "qemu"
diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 2e85753e55..dd29105db4 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -19,7 +19,6 @@ TARGET_CC_ARCH:append:powerpc = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '$
 TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
 
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
-GLIBC_64BIT_TIME_FLAGS:pn-glibc-y2038-tests = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
 # pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
 # both 32 and 64 bit file APIs.  But it does not handle the time side?
@@ -36,7 +35,6 @@ GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 # Caused by the flags exceptions above
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
-INSANE_SKIP:append:pn-glibc-y2038-tests = " 32bit-time"
 INSANE_SKIP:append:pn-pulseaudio = " 32bit-time"
 
 # Strace has tests that call 32 bit API directly, which is fair enough, e.g.
diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
deleted file mode 100644
index be49ca4cb7..0000000000
--- a/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
+++ /dev/null
@@ -1,119 +0,0 @@
-require glibc_${PV}.bb
-require glibc-tests.inc
-
-inherit ptest features_check
-REQUIRED_DISTRO_FEATURES = "ptest"
-
-SRC_URI += "\
-	file://run-ptest \
-"
-
-SUMMARY = "glibc tests using time32/time64 interfaces to be run with ptest for the purpose of checking y2038 compatiblity"
-
-# Erase some variables already set by glibc_${PV}
-python __anonymous() {
-       # Remove packages provided by glibc build, we only need a subset of them
-       d.setVar("PACKAGES", "${PN} ${PN}-ptest")
-
-       d.setVar("PROVIDES", "${PN} ${PN}-ptest")
-
-       bbclassextend = d.getVar("BBCLASSEXTEND").replace("nativesdk", "").strip()
-       d.setVar("BBCLASSEXTEND", bbclassextend)
-       d.setVar("RRECOMMENDS", "")
-       d.setVar("SYSTEMD_SERVICE:nscd", "")
-       d.setVar("SYSTEMD_PACKAGES", "")
-}
-
-# Remove any leftovers from original glibc recipe
-RPROVIDES:${PN} = "${PN}"
-RRECOMMENDS:${PN} = ""
-RDEPENDS:${PN} = "glibc libgcc sed bash"
-RDEPENDS:${PN}-ptest = "${PN}"
-DEPENDS += "sed"
-
-export oe_srcdir="${exec_prefix}/src/debug/glibc/${PV}/"
-
-# Just build tests for target - do not run them
-do_check:append () {
-	oe_runmake -i check run-built-tests=no
-}
-addtask do_check after do_compile before do_install_ptest_base
-
-glibc_strip_build_directory () {
-	# Delete all non executable files from build directory
-	find ${B} ! -executable -type f -delete
-
-	# Remove build dynamic libraries and links to them as
-	# those are already installed in the target device
-	find ${B} -type f -name "*.so" -delete
-	find ${B} -type l -name "*.so*" -delete
-
-	# Remove headers (installed with glibc)
-	find ${B} -type f -name "*.h" -delete
-
-	find ${B} -type f -name "isomac" -delete
-	find ${B} -type f -name "annexc" -delete
-}
-
-do_install_ptest_base () {
-	glibc_strip_build_directory
-
-	ls -r ${B}/*/*-time64 > ${B}/tst_time64
-
-	# Remove '-time64' suffix - those tests are also time related
-	sed -e "s/-time64$//" ${B}/tst_time64 > ${B}/tst_time_tmp
-	tst_time=$(cat ${B}/tst_time_tmp ${B}/tst_time64)
-
-	rm ${B}/tst_time_tmp ${B}/tst_time64
-	echo "${tst_time}"
-
-	# Install build test programs to the image
-	install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
-
-	for f in "${tst_time}"
-	do
-	    cp -r ${f} ${D}${PTEST_PATH}/tests/glibc-ptest/
-	done
-
-	install -d ${D}${PTEST_PATH}
-	cp ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
-
-}
-
-# The datadir directory is required to allow core (and reused)
-# glibc cleanup function to finish correctly, as this directory
-# is not created for ptests
-stash_locale_package_cleanup:prepend () {
-	mkdir -p ${PKGD}${datadir}
-}
-
-stash_locale_sysroot_cleanup:prepend () {
-	mkdir -p ${SYSROOT_DESTDIR}${datadir}
-}
-
-# Prevent the do_package() task to set 'libc6' prefix
-# for glibc tests related packages
-python populate_packages:prepend () {
-    if d.getVar('DEBIAN_NAMES'):
-        d.setVar('DEBIAN_NAMES', '')
-}
-
-FILES:${PN} = "${PTEST_PATH}/* /usr/src/debug/${PN}/*"
-
-EXCLUDE_FROM_SHLIBS = "1"
-
-# Install debug data in .debug and sources in /usr/src/debug
-# It is more handy to have _all_ the sources and symbols in one
-# place (package) as this recipe will be used for validation and
-# debugging.
-PACKAGE_DEBUG_SPLIT_STYLE = ".debug"
-
-# glibc test cases violate by default some Yocto/OE checks (staticdev,
-# textrel)
-# 'debug-files' - add everything (including debug) into one package
-#                 (no need to install/build *-src package)
-INSANE_SKIP:${PN} += "staticdev textrel debug-files rpaths"
-
-deltask do_stash_locale
-do_install[noexec] = "1"
-do_populate_sysroot[noexec] = "1"
diff --git a/meta/recipes-core/glibc/glibc/run-ptest b/meta/recipes-core/glibc/glibc/run-ptest
deleted file mode 100755
index cb71c75682..0000000000
--- a/meta/recipes-core/glibc/glibc/run-ptest
+++ /dev/null
@@ -1,37 +0,0 @@
-#!/bin/bash
-# ptest script for glibc - to run time related tests to
-# facilitate Y2038 validation
-# Run with 'ptest-runner glibc-tests'
-
-output() {
-  retcode=$?
-  if [ $retcode -eq 0 ]
-    then echo "PASS: $i"
-  elif [ $retcode -eq 77 ]
-    then echo "SKIP: $i"
-  else echo "FAIL: $i"
-  fi
-}
-
-# Allow altering time on the target
-export GLIBC_TEST_ALLOW_TIME_SETTING="1"
-
-tst_time64=$(ls -r ${PWD}/tests/glibc-ptest/*-time64)
-
-# Remove '-time64' suffix - those tests are also time
-# related
-tst_time_tmp=$(sed -e "s/-time64$//" <<< ${tst_time64})
-
-# Do not run tests supporting only 32 bit time
-#for i in ${tst_time_tmp}
-#do
-#	$i >/dev/null 2>&1
-#	output
-#done
-
-# Run tests supporting only 64 bit time
-for i in ${tst_time64}
-do
-	$i >/dev/null 2>&1
-	output
-done
-- 
2.34.1


