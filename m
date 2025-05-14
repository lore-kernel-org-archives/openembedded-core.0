Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E6AC3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:31 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.106299.1747238308694342415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qKWhNUh9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so4527918a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238308; x=1747843108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMkCMpvu1i24OTAPowq87NMQtiK95HyK43FPzx/MLh4=;
        b=qKWhNUh91D34ZFilZx+vz7gr8vGbVbnTkwSBxPw23QW32oqNMBY4Ko4Au+5BNVCN1I
         9VWg7WKnUOKY0Jzui7qx3UsXrF0pXnpD5502ZToCVH2jWDwLwagUL0JdjRMtYfVPirWc
         KQBrKRRvGJ20vizDy1gJKwLZCKYH1/SXWa4oachxgL1cMJIHUe643BC6/PlMbfx1YUu9
         4Jr/tysfdKsFY2kXFOFq4/84pBAmODfxkxcGzNZGAqVhu8QvJFmverchvRGRD79gK5Zj
         l8XPFkXPj+nfJJHHSrr+QQzHQecGmlUrVe4BX9C26hS9ArIrtlq/NHJzocBaDH7hhpLt
         fqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238308; x=1747843108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMkCMpvu1i24OTAPowq87NMQtiK95HyK43FPzx/MLh4=;
        b=Yk+xAX6mYn298g5aasVapeez+ePY5Yg3EdaT4bA0sX7DlpXqvMZaAZ+SUMPshCbSsI
         tkv2v4CnZrVFmsWMzOEfpEbt6/z1tKl1LPWflTT5XXh6i7H13jWMFInRxjpNb+fImZfN
         c1hYHGIurPsbzCvE3NwTkGfIUnmjWzX3BraOfY7O8P5Ou866zs9KAzG/DdqTlzhHlbkJ
         3OoY0t5IrZsSwlRKDzai58WzI0BbBdlD0mLOcAybshxIyVBTi1OtPbokM9R6rFQMbaYs
         ByNCpHWtLrK0WpoGDjCwaWm9rKWW6RQjFK3xG9iyTXSrsUT6rLdBaYtVU4vCCBRriBZV
         ha3A==
X-Gm-Message-State: AOJu0YzLiasd0L2Z9forNm8+LDZEjuvB8tknVsj2TiSEn8BSjM7OLJAp
	NkA9T50X3H9HfQ5WxnuRn6UNfU2OLRV8lTextLl5y9BHpwzMOgA+7jeLfQ9cabAB3Xgw8AEo7bj
	G
X-Gm-Gg: ASbGncveYb5GF+g97bfCWgpDMpNQnLua5sjDkbbnKdrLa0VCzFdElfANMXkpZiImuK3
	e4hLJ2CmYRIxWX8M9hvaSUpj3LcW510RRHfO6lO8YrsNz43NbNVxRgU25yX+Tw9SiTsYEewHHYf
	GZ8CURDZ5JC3vAojM0b9XLlSAT2jRVZ9ttoK4k3lKaqCZRk7O/kRctWIeTYISDlivv2suYLcJUz
	w2kHxlMxysecSdPvsT8cdp2DhOUpFYT/E+12+BPRt1p3yQCPU0vrzJ+szIuSoRAY9dDnpCr4YbD
	0lGi8YG+k2aY0/f2oG9AmN6l040macF/xllT1wsE
X-Google-Smtp-Source: AGHT+IF7hbLXcWgVX7XJQcu1fPmWRmYAXkILJgOgG4J3KcVKv5M/h8OJDZAu5MnUgVebmJwW5tqQ1w==
X-Received: by 2002:a17:903:1984:b0:225:abd2:5e39 with SMTP id d9443c01a7336-2319812558dmr49611095ad.30.1747238307763;
        Wed, 14 May 2025 08:58:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/12] glibc-y2038-tests: remove glibc-y2038-tests_2.41.bb recipe
Date: Wed, 14 May 2025 08:58:00 -0700
Message-ID: <dea859e904d9eacede147a627f4c176433ac9efc.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747238138.git.steve@sakoman.com>
References: <cover.1747238138.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216516

From: rajmohan r <semc.2042@gmail.com>

This recipe takes longer time >20min when bitbake for package
write stage. When cross-verified for longer time duration, found
that do_check() stage taking 20min while other stages completes
before 6min.

This recipe gives only below two test binaries in the packages to
test (ptest: glibc-y2038-tests):
     io/ftwtest
     io/ftwtest-time64

The above test binaries are already included for testing in recipe
glibc-testsuite_2.41.bb.

It is by now well established that glibc itself works as it should,
that all affected 32 bit targets are configured to use 64 bit time_t,
and that any lingering y2038 issues are in components other than the c
library, and usually come from C programming mistakes (e.g. storing
timestamps in long). Maybe we can simply remove the recipe?

Review comments for fixing above longer time duration ended up in
removing this recipe as a proposal is below
https://lists.openembedded.org/g/openembedded-core/topic/112188476#msg214636

Removed lines having reference to glibc-y2038-tests in the files.

Signed-off-by: rajmohan r <semc.2042@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fbe3679ba3c12c52a502511f5dde91fb4de7a6b6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../distro/include/ptest-packagelists.inc     |   2 -
 meta/conf/distro/include/time64.inc           |   2 -
 .../glibc/glibc-y2038-tests_2.41.bb           | 107 ------------------
 meta/recipes-core/glibc/glibc/run-ptest       |  37 ------
 5 files changed, 149 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
 delete mode 100755 meta/recipes-core/glibc/glibc/run-ptest

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2b47d3103c..f1bff80586 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -215,7 +215,6 @@ RECIPE_MAINTAINER:pn-glibc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-glibc-y2038-tests = "Lukasz Majewski <lukma@denx.de>"
 RECIPE_MAINTAINER:pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glslang = "Jose Quaresma <quaresma.jose@gmail.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index f3fdededf6..9fb3332384 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -86,8 +86,6 @@ PTESTS_FAST = "\
     xz \
     zlib \
 "
-PTESTS_FAST:append:libc-glibc = " glibc-y2038-tests"
-PTESTS_PROBLEMS:remove:libc-glibc = "glibc-y2038-tests"
 PTESTS_FAST:remove:mips64 = "qemu"
 PTESTS_PROBLEMS:append:mips64 = " qemu"
 PTESTS_FAST:remove:riscv32 = "qemu"
diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 5122e2a122..24a81c83f1 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -20,7 +20,6 @@ TARGET_CC_ARCH:append:powerpc = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '$
 TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
 
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
-GLIBC_64BIT_TIME_FLAGS:pn-glibc-y2038-tests = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
 # pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
 # both 32 and 64 bit file APIs.  But it does not handle the time side?
@@ -33,7 +32,6 @@ GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 # Caused by the flags exceptions above
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
-INSANE_SKIP:append:pn-glibc-y2038-tests = " 32bit-time"
 
 # Strace has tests that call 32 bit API directly, which is fair enough, e.g.
 # /usr/lib/strace/ptest/tests/ioctl_termios uses 32-bit api 'ioctl'
diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
deleted file mode 100644
index 9ea09a4e12..0000000000
--- a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
+++ /dev/null
@@ -1,107 +0,0 @@
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
-       d.setVar("PACKAGES", "${PN} ${PN}-dbg ${PN}-ptest")
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
-export oe_srcdir = "${exec_prefix}/src/debug/glibc/${PV}/"
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
-	cp ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
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
2.43.0


