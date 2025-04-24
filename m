Return-Path: <semc.2042@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40D8C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 14:48:54 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.17161.1745506133259060378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 07:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mXNtCVMh;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: semc.2042@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2255003f4c6so12933065ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745506132; x=1746110932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Riv/CLBXUiW+31Sj60mRdGYXDYwc0wVD9kZoPcWOJ7Q=;
        b=mXNtCVMhx2SisyJF12Jl08twBsjY6AaagIReP28ZVnGnvEnjvZ7noN5Umm2vzvyKZQ
         eKKptTkmjapX6O06zMH9iSzuTWd0F+q84AWTGaUL3Fgp2g2Wh8axhmh26soioP+nJ56L
         seg/PBrMhQzxFlE45oRxp/T/OvfOz7eB4EoYNaxLbJtfRlBXNDGn6iu8+8Qim9pRJwLR
         9Na8hkIi/DvZnQsEx74mngbaR5Awi6mRng88MEj7sYZkfSCSrl3pgDCBmo/SJg2a/kgh
         9CWvnuk2bzytkGUOGg8M/OkFcTaOFdqEMjQLKDeS2a5dew7nYZ1WKM3WUHNblL1MKcM+
         Ltfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745506132; x=1746110932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Riv/CLBXUiW+31Sj60mRdGYXDYwc0wVD9kZoPcWOJ7Q=;
        b=m5R2WaPEckkOjP3J82vueSra2eXJ4DCLS3wU10LDyNuXKXXJt6NT2AzzkmBRAkd4Ua
         CB83+eKw2KCdEoJgWq8ARw0VwUoc+ExpOuGXqKZwMlAdLgYoiv/RxJIy2yWQ48i+3F6R
         KGXAjvYnoN5ZDuG+2qnEg0CiP19VwoWDKJEG77bkDmROZStxEzAIZNVq7RcbapPybx1g
         sajsDDZQhuxfXhnsbHDjxtET+9olszYDtjhZsK5XntYejGfaZhqsyBYnaz7dr5IoYmU4
         uGFpUR6Ltw8E5BvAw9WResthc1srTuDThyEFT4WYQpvNMiMv5OfUrijS40RJSbZ/cr2Y
         ITnw==
X-Gm-Message-State: AOJu0YxvoHcJpU4GlxUd3NoeVZHaQhwYZdHRFR0E/alrpWRu9Uem3FCC
	40g+Onrfu0IJH/uVDids2vJHvKzolpX7WZ1nnY2eMppTY34IKZTV4NAH0Q==
X-Gm-Gg: ASbGnct19UnmklyXg+jttbYXpNu02d5n3kKUbIpbBLUidDKvMz606hh3qa5OD3aoU6s
	EKEgcL4EGZYJLswmf4b1meWEBuX3HqK5iTGj9bHtcUZlVG8bKO1Z0/BbVC2monb0BINNOlR4vhe
	HmBAAMfr7xjhtFTnqx4gSqmg6D5dEsx519Kj9ZkfrFmoTuoYYsoHXtPs/zxjgYEfXQHT0dYi0FU
	ptg14vEjzO/o0FBUZk1oZL5RKPM6zRdKed2IjPjFS3AzUlFM9RyFP3MEl+/Qpg/eNgqxTb7K9mT
	msrdx8D+LRu+3GhktRUWdscwqCYbrKTL9gl2LaGuFj0fBgU=
X-Google-Smtp-Source: AGHT+IFDEtAZD/GMoI7CQuoi/A4f40gwRpC2Ye61hIx6qJQedGH6hr2O2SymSG0ZJ3G7PQpBrv904A==
X-Received: by 2002:a17:902:ce8a:b0:223:501c:7576 with SMTP id d9443c01a7336-22db3c088abmr48035105ad.12.1745506132352;
        Thu, 24 Apr 2025 07:48:52 -0700 (PDT)
Received: from L-16522.kpit.com ([49.207.215.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbcb0dsm14272965ad.73.2025.04.24.07.48.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:48:52 -0700 (PDT)
From: rajmohan r <semc.2042@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc-y2038-tests: remove glibc-y2038-tests_2.41.bb recipe
Date: Thu, 24 Apr 2025 20:18:48 +0530
Message-Id: <20250424144848.790383-1-semc.2042@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 14:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215381

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

Upstream-Status: Pending

Signed-off-by: rajmohan r <semc.2042@gmail.com>
---
 .../glibc/glibc-y2038-tests_2.41.bb           | 107 ------------------
 meta/recipes-core/glibc/glibc/run-ptest       |  37 ------
 2 files changed, 144 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
 delete mode 100755 meta/recipes-core/glibc/glibc/run-ptest

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
2.34.1


