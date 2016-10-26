Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 57C09719C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 17:36:02 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id 197so601319pfu.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VowgkKDIIoBLg5bU6k+soxwcLycZGD5FTnGgiSd9ndc=;
	b=mWFgPcDE3Eiboq7ntWDrccM1cav8CwOeoXkL8V3xUTxY2IP/BQbdm1ISQ4es8pL0VU
	136nyWWypfx8RLNo8xfFaNHEWUr7L/TfYJuJKs82pf2Y0zQk/yA3wOMpLDpJ073lEJHT
	KoZyWI6sllK4U5frsasAs57MgNNaq6D1sIPET1S3pQYnbqIv+B1R4J85GVkWu2S82vGE
	HmVWNUPFoNNDU3LjVLDAGcbKUpscTSRb4ceM2uftMDzExWfxzTUeZ9EkeAfQpw00XxOe
	z6o90bMpRS27liOZTZKaXEP5OGnd4UaXybsDdjWoN0q2sTN00dw5z+ZVsli9LXDyEefo
	ysfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VowgkKDIIoBLg5bU6k+soxwcLycZGD5FTnGgiSd9ndc=;
	b=VyOPk5yJUP0DHpDL6oa7rEcsZsO2T5stNNMmqDi5M0j9lDyHFUosKltVl6Z1FdeP84
	d1vNm6vuah2XACC8kF0Rt1vZN17AhoIrocOl8RYhtOZu9xspj66ncNrEPTiqY/oOOPKv
	0Nf1L33JtL599OIsZMJrw945ZgKVIS9p5ZgMovPC2IfCOS+414jmigBdeuCFFso84wYX
	BmrqZFjeVEzcYrb+x91sqldSMu0tvdnYNqeykQK0K5ZJDGbrzaSybLCZG0Q4SQu+ms8c
	GXephBfBzv3Otk05lx1hHnzO1ElCgo2E+w7mC+levOH0gC9wCH5akGyOe3EhZSVe4ZpN
	laWQ==
X-Gm-Message-State: ABUngvev5knc+kbvs0aefXcKjM9NOS0eJr/wokLNAyg5HUj9Zda/G/bkREkhlimBC8KU6eh/
X-Received: by 10.99.1.23 with SMTP id 23mr5094818pgb.37.1477503364316;
	Wed, 26 Oct 2016 10:36:04 -0700 (PDT)
Received: from localhost.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	sc10sm5659537pac.28.2016.10.26.10.36.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Oct 2016 10:36:03 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 23:05:53 +0530
Message-Id: <1477503353-9579-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.6.4
Subject: [master][morty][PATCH v2] libunwind: add ptest support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Oct 2016 17:36:03 -0000

The patch include below changes:

1. Add do_compile_ptest task, which compiles and runs builtin
   test cases. The libunwind test scripts has relink commands,
   which needs to be run at host in order to create ELF test
   binaries which can be readily executed at target.
   Hence pass "-i" option to make, to ignore exit status of tests
   executed at host.

2. run-check-namespace test require libunwind library containing
   debug symbols to pass. Hence made ${PN}-ptest to
   RDEPENDS on ${PN}-dbg package, and added "debug-deps" in to
   INSANE_SKIP to avoid packaging error; due to dependency on
   ${PN}-dbg package.

3. Add do_install_ptest task, which copies necessary
   filesb to execute tests.

4. Add run-ptest script to execute tests at target.

5. Add dependent packages neede to execute test cases via RDEPENDS
   (run-check-namespace test requires "nm" tool, which is given by binutils)

6. Made run-coredump-unwind and run-coredump-unwind-mdi testcases as
   expected failures, due to unavailability of unstripped crasher binary.

Test result obtained with qemux86-64:
PASS: test-proc-info
PASS: test-static-link
PASS: test-strerror
PASS: Gtest-bt
PASS: Ltest-bt
PASS: Gtest-exc
PASS: Ltest-exc
PASS: Gtest-init
PASS: Ltest-init
PASS: Gtest-concurrent
PASS: Ltest-concurrent
PASS: Gtest-resume-sig
PASS: Ltest-resume-sig
PASS: Gtest-resume-sig-rt
PASS: Ltest-resume-sig-rt
XFAIL: Gtest-dyn1
XFAIL: Ltest-dyn1
PASS: Gtest-trace
PASS: Ltest-trace
PASS: test-async-sig
PASS: test-flush-cache
PASS: test-init-remote
PASS: test-mem
PASS: Ltest-varargs
PASS: Ltest-nomalloc
PASS: Ltest-nocalloc
PASS: Lrs-race
PASS: test-ptrace
PASS: test-setjmp
PASS: run-check-namespace
PASS: run-ptrace-mapper
PASS: run-ptrace-misc
XFAIL: run-coredump-unwind
============================================================================
Testsuite summary for libunwind 1.1
============================================================================
# TOTAL: 33
# PASS:  30
# SKIP:  0
# XFAIL: 3
# FAIL:  0
# XPASS: 0
# ERROR: 0
============================================================================

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../make-coredump-testcases-as-XFAIL.patch         | 21 ++++++++++++++
 meta/recipes-support/libunwind/libunwind/run-ptest |  2 ++
 meta/recipes-support/libunwind/libunwind_git.bb    | 33 ++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/make-coredump-testcases-as-XFAIL.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/run-ptest

diff --git a/meta/recipes-support/libunwind/libunwind/make-coredump-testcases-as-XFAIL.patch b/meta/recipes-support/libunwind/libunwind/make-coredump-testcases-as-XFAIL.patch
new file mode 100644
index 0000000..169692e
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/make-coredump-testcases-as-XFAIL.patch
@@ -0,0 +1,21 @@
+Testcases run-coredump-unwind and run-coredump-unwind-mdi require unstripped
+crasher binary to get procedure names via libunwind APIs. But in libunwind 
+recipe of OE-core, we remove debug symbols from crasher binary, this 
+results in failure of run-coredump-unwind and run-coredump-unwind-mdi tests.
+Hence, mark them as expected failures (XFAIL).
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+--- git_org/tests/Makefile.am	2016-10-26 15:52:23.587571091 +0530
++++ git/tests/Makefile.am	2016-10-26 15:51:10.154790372 +0530
+@@ -113,6 +113,8 @@ if ARCH_ARM
+ XFAIL_TESTS += $(XFAIL_TESTS_PTRACE_SINGLESTEP)
+ endif
+ 
++XFAIL_TESTS += run-coredump-unwind run-coredump-unwind-mdi
++
+ noinst_PROGRAMS = $(noinst_PROGRAMS_common) $(noinst_PROGRAMS_cdep) \
+ 	$(noinst_PROGRAMS_arch)
+ 
diff --git a/meta/recipes-support/libunwind/libunwind/run-ptest b/meta/recipes-support/libunwind/libunwind/run-ptest
new file mode 100644
index 0000000..8bf2e11
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -C tests -k LOG_DRIVER="$PWD/tests/test-driver" check-TESTS
diff --git a/meta/recipes-support/libunwind/libunwind_git.bb b/meta/recipes-support/libunwind/libunwind_git.bb
index 4249430..cd747f2 100644
--- a/meta/recipes-support/libunwind/libunwind_git.bb
+++ b/meta/recipes-support/libunwind/libunwind_git.bb
@@ -11,6 +11,8 @@ SRC_URI = "git://git.sv.gnu.org/libunwind.git \
            file://0001-Fix-build-on-mips-musl.patch \
            file://0001-add-knobs-to-disable-enable-tests.patch \
            file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
+           file://make-coredump-testcases-as-XFAIL.patch \
+           file://run-ptest \
            "
 
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
@@ -27,3 +29,34 @@ SECURITY_CFLAGS_append_aarch64 = " -fPIE"
 S = "${WORKDIR}/git"
 
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+
+inherit ptest
+
+do_compile_ptest() {
+    # Build tests
+    oe_runmake -C ${B}/tests LOG_DRIVER="${S}/config/test-driver" -i check
+}
+
+do_install_ptest() {
+    # copy binaries excluding "*.o" and "*.log" files
+    install -d ${D}${PTEST_PATH}
+    cp -a ${B}/tests ${D}${PTEST_PATH}
+    rm -f `find ${D}${PTEST_PATH} | egrep "\.o$|\.log$"`
+
+    # copy dependent files for testing
+    [ -f ${S}/config/test-driver ] && cp ${S}/config/test-driver ${D}${PTEST_PATH}/tests/
+    cp ${S}/tests/run-* ${D}${PTEST_PATH}/tests/
+
+    # Use libunwind libraries present in standard path and tweak Makefile
+    # to run only tests at target
+    [ -f ${D}${PTEST_PATH}/tests/Makefile ] && \
+    sed -i -e "s|^\(.*\)\.log: .*(EXEEXT)|\1\.log:|" ${D}${PTEST_PATH}/tests/Makefile
+
+    [ -f ${D}${PTEST_PATH}/tests/check-namespace.sh ] && \
+    sed -i -e "s|^LIBUNWIND=.*|LIBUNWIND=\$(ls -1 \${libdir}/.debug/libunwind.so*)|g" \
+    -e "s|^LIBUNWIND_GENERIC=.*|LIBUNWIND_GENERIC=\$(ls -1 \${libdir}/.debug/libunwind-\${plat}.so*)|g" ${D}${PTEST_PATH}/tests/check-namespace.sh
+}
+
+INSANE_SKIP_${PN}-ptest += "debug-deps"
+
+RDEPENDS_${PN}-ptest += "make bash gawk binutils ${PN}-dbg"
-- 
2.7.4


