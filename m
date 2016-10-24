Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id D89BC719BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 18:15:22 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id r16so103037027pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 11:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=HmovN39ycxw6JWVGIyhO/2EUy5GLv9vdnQeKI3Lf5BQ=;
	b=J7wOaxwSmpCviPiyE7PyUY/yoyf/YrSI9i6Y3fEmMCSXjex2Y0DgOzKkN9CPXrGRSH
	ccKhf49twzxT1yAfRRPHx/5n7236x6DTlWoQddMoo2zsLWjevAo00l1RLOKwynUw5yQ+
	DrEDC0ZhB3ovbbHZIGApwXhBSFxUx0r8ogcpNzbGYCSBSvckLMgg43vaxld7VB5ZKP1a
	wgVG7Re2A33BY8MVfki2A3EFEn9P2Sjk/HISDejnlvYAD3c49vY5AvnAA0QinBONVUft
	jCObnjy1Wrm6+rcyXT/2JUAmOVamLt895SEUxGssxG/KQ8OtYcYzJl+485BE3e3CECcE
	fzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HmovN39ycxw6JWVGIyhO/2EUy5GLv9vdnQeKI3Lf5BQ=;
	b=OaJFfVMHTx12VT1z25MS5S7xEtmngcgUNDfG1YLGqFLXp2z22tJPgNlQlG4Tv4NL5B
	NvPYwNV58zcJL8MdFJp5bwuwuqAp/QwPfqqR2b9N2pQrcZE76j9iDRRxN6od6c9PDio8
	EiCb1DC8/wWSwsboCCX5hwhHmJUL1PoejiY8JV8SGmiMb7YjwYI08vN5JiNXeoFs0O7P
	bN73JCNKhiT2bCg1EZ8b5KBr70mVmPKXTN4uhorPo3xlz8G45a7q91mh62gzJZDYjW82
	H5fkKvAzMmhD8LSBGyUWe07AIJdLUu1DM7CJR/S9ylkHyLW2jFrnG8SLlPIHV0FtD1yw
	0+wg==
X-Gm-Message-State: ABUngvd1IOwBDZWjdqxZUm6nS8asN8slFaQZ6nukTiK9T3hihO0g7/xFMryoPOxGUB1R0CP+
X-Received: by 10.98.75.8 with SMTP id y8mr31056771pfa.30.1477332923948;
	Mon, 24 Oct 2016 11:15:23 -0700 (PDT)
Received: from localhost.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	t5sm27025562pfb.58.2016.10.24.11.15.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Oct 2016 11:15:22 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Oct 2016 23:45:15 +0530
Message-Id: <1477332915-2063-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][morty][PATCH] libunwind: add ptest support
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
X-List-Received-Date: Mon, 24 Oct 2016 18:15:23 -0000

The patch include below changes:

1. Add do_compile_ptest task, which compiles and runs builtin
   test cases. The libunwind test scripts has relink commands,
   which needs to be run at host in order to create ELF test
   binaries which can be readily executed at target.
   Hence pass "-i" option to make, to ignore exit status of tests
   executed at host.

2. Some of the libunwind test cases such as run-check-namespace,
   run-coredump-unwind require debug symbols to be present in
   libunwind library. So set INHIBIT_PACKAGE_STRIP to "1".

3. Add do_install_ptest task, which copies necessary
   filesb to execute tests.

4. Add run-ptest script to execute tests at target.

5. Add dependent packages neede to execute test cases via RDEPENDS
   (run-check-namespace test requires "nm" tool, which is given by binutils)

Test result obtained with qemux86-64:
-- snip --
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
FAIL: test-async-sig
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
PASS: run-coredump-unwind
============================================================================
Testsuite summary for libunwind 1.1
============================================================================
# TOTAL: 33
# PASS:  30
# SKIP:  0
# XFAIL: 2
# FAIL:  1
# XPASS: 0
# ERROR: 0
============================================================================
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/recipes-support/libunwind/libunwind/run-ptest |  2 ++
 meta/recipes-support/libunwind/libunwind_git.bb    | 32 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/run-ptest

diff --git a/meta/recipes-support/libunwind/libunwind/run-ptest b/meta/recipes-support/libunwind/libunwind/run-ptest
new file mode 100644
index 0000000..8bf2e11
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -C tests -k LOG_DRIVER="$PWD/tests/test-driver" check-TESTS
diff --git a/meta/recipes-support/libunwind/libunwind_git.bb b/meta/recipes-support/libunwind/libunwind_git.bb
index 4249430..078d3a9 100644
--- a/meta/recipes-support/libunwind/libunwind_git.bb
+++ b/meta/recipes-support/libunwind/libunwind_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://git.sv.gnu.org/libunwind.git \
            file://0001-Fix-build-on-mips-musl.patch \
            file://0001-add-knobs-to-disable-enable-tests.patch \
            file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
+           file://run-ptest \
            "
 
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
@@ -27,3 +28,34 @@ SECURITY_CFLAGS_append_aarch64 = " -fPIE"
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
+    sed -i -e "s|^LIBUNWIND=.*|LIBUNWIND=${libdir}/libunwind.so|g" \
+    -e "s|^LIBUNWIND_GENERIC=.*|LIBUNWIND_GENERIC=${libdir}/libunwind-\${plat}.so|g" ${D}${PTEST_PATH}/tests/check-namespace.sh
+}
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+RDEPENDS_${PN}-ptest += "make bash gawk binutils"
-- 
2.7.4


