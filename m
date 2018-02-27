Return-Path: <matt@madison.systems>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 16F16786CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:37:01 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id w17so7450584pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GcBPR3coMCjf7AioDqnKeaZ+nqmtS6c5b4QDzgX6x50=;
	b=GwQnxf4P1HpX3RSgIO5i+yU50QKaEDKYGTRVpqisdTl9jR9M2LPKOmBZ2jazth1iP3
	NrOBTmDpx42fu6xDuUztSHKJqOT/XYU9hA6JfcrUmGTJpgwkRSfAeo2M9YXoSJovixEl
	IzzVwUQ0ATfOCMhHWwAQzQU5BM8VVqSx0n6HTNjI4aSXKBeejDMfs9C2rxU6IZspDgL6
	GOls+Tu6N+MFbdcZNeIS7zEUoE0pw4dVhJ/wX5dJz4BuDasJLJfqEhr4GnCiO1AVAkOT
	LTjt6RXco6aHLhIPvfWXdAN0xsBq7zir2GZ3Jes8aUCtGqs4pIsT99kO1TrIClZvN/mn
	+vEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GcBPR3coMCjf7AioDqnKeaZ+nqmtS6c5b4QDzgX6x50=;
	b=MqTG0waigpKL/oVeBekxcHXAug+5og53TsZgbcM9GW4BaJV8+TCFSjoixWNCzs07Fa
	2zfZldZjxJNdetNWFk5x2ggfNGt9T9ZKi7BzA2FVOFyVQEDXm6EwC6e6Z8xH47AlfYLi
	A4xk0b3M7Ta3W/kCHEpIa57xrJC4waGXoCv9dOdsWuKijOVquDXL/kKwGuSlQid1nFuL
	oInCjQ7JzKx5IGLrOtNeiGHiT2WyEVvhKHssh+HoOZ8CdC5ehtzE/jrGyz+x7kdXwwlL
	enaXhxRXNks3LgZCMa3akF5AaVYOk455RYTGEy5rjoXa6U3Cura5zANzRyqQRH0q7dQb
	85WA==
X-Gm-Message-State: APf1xPCxXr5mIceCNx4DvLFF0teKrpSgqYTSQhctquY5qGqhNyrXtXFh
	JaUmAxcXA2eJmlp7WDpPXaYpsMk1
X-Google-Smtp-Source: AH8x227s3lvbPd5cr7oY5ur/dIghsWExSNSWgMpH2MgWpdy/qMDfaw9AcPNi/WcBVMGZUzHvglASiw==
X-Received: by 10.99.158.84 with SMTP id r20mr10841389pgo.296.1519735022973;
	Tue, 27 Feb 2018 04:37:02 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	o82sm1596760pfj.163.2018.02.27.04.37.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 04:37:01 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 04:36:32 -0800
Message-Id: <20180227123634.2812-7-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180227123634.2812-1-matt@madison.systems>
References: <20180227123634.2812-1-matt@madison.systems>
Subject: [PATCH v2 6/8] go.bbclass: ptest cleanup and improvements
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
X-List-Received-Date: Tue, 27 Feb 2018 12:37:02 -0000

* Don't enable verbose test output (-test.v)
  by default, as it generates too much noise
  for automated results parsing

* Override do_install_ptest_base in the bbclass,
  so recipes can provide their own modifications
  with do_install_ptest.

* Improve the generated run-ptest script to better
  handle large numbers of tests, and to generate
  'status: test name' output similar to Automake
  tests.

* Install all non-vendored 'testdata' directories
  from the source into the ptest package, as some
  packages share test data among multiple tests.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 87 +++++++++++++++++++++++++++++--------------------
 1 file changed, 51 insertions(+), 36 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index cd3d9d5bfb..080fb4ae69 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -26,7 +26,7 @@ GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS}"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
-export GOPTESTFLAGS ?= "-test.v"
+export GOPTESTFLAGS ?= ""
 GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
 
 export GO = "${HOST_PREFIX}go"
@@ -76,7 +76,7 @@ go_list_packages() {
 }
 
 go_list_package_tests() {
-    ${GO} list -f '{{.ImportPath}} {{.TestGoFiles}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
+	${GO} list -f '{{.ImportPath}} {{.TestGoFiles}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
 		grep -v '\[\]$' | \
 		egrep -v '${GO_INSTALL_FILTEROUT}' | \
 		awk '{ print $1 }'
@@ -95,14 +95,15 @@ go_do_compile() {
 do_compile[dirs] =+ "${GOTMPDIR}"
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
 
-do_compile_ptest() {
-    rm -f ${B}/.go_compiled_tests.list
+do_compile_ptest_base() {
+	rm -f ${B}/.go_compiled_tests.list
 	go_list_package_tests | while read pkg; do
 		cd ${B}/src/$pkg
 		${GO} test ${GOPTESTBUILDFLAGS} $pkg
 		find . -mindepth 1 -maxdepth 1 -type f -name '*.test' -exec echo $pkg/{} \; | \
 			sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
 	done
+	do_compile_ptest
 }
 do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
 
@@ -118,40 +119,54 @@ go_do_install() {
 	fi
 }
 
-do_install_ptest_base() {
-    test -f "${B}/.go_compiled_tests.list" || exit 0
-    tests=""
-    while read test; do
-        tests="$tests${tests:+ }${test%.test}"
-        testdir=`dirname $test`
-        install -d ${D}${PTEST_PATH}/$testdir
-        install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
-        if [ -d "${B}/src/$testdir/testdata" ]; then
-            cp --preserve=mode,timestamps -R "${B}/src/$testdir/testdata" ${D}${PTEST_PATH}/$testdir
-        fi
-    done < ${B}/.go_compiled_tests.list
-    if [ -n "$tests" ]; then
-        install -d ${D}${PTEST_PATH}
-        cat >${D}${PTEST_PATH}/run-ptest <<EOF
+go_make_ptest_wrapper() {
+	cat >${D}${PTEST_PATH}/run-ptest <<EOF
 #!/bin/sh
-ANYFAILED=0
-for t in $tests; do
-    testdir=\`dirname \$t.test\`
-    if ( cd "${PTEST_PATH}/\$testdir"; "${PTEST_PATH}/\$t.test" ${GOPTESTFLAGS} | tee /dev/fd/9 | grep -q "^FAIL" ) 9>&1; then
-        ANYFAILED=1
-    fi
-done
-if [ \$ANYFAILED -ne 0 ]; then
-    echo "FAIL: ${PN}"
-    exit 1
-fi
-echo "PASS: ${PN}"
-exit 0
+RC=0
+run_test() (
+    cd "\$1"
+    ((((./\$2 ${GOPTESTFLAGS}; echo \$? >&3) | sed -r -e"s,^(PASS|SKIP|FAIL)\$,\\1: \$1/\$2," >&4) 3>&1) | (read rc; exit \$rc)) 4>&1
+    exit \$?)
 EOF
-        chmod +x ${D}${PTEST_PATH}/run-ptest
-    else
-        rm -rf ${D}${PTEST_PATH}
-    fi
+
+}
+
+go_stage_testdata() {
+	oldwd="$PWD"
+	cd ${S}/src
+	find ${GO_IMPORT} -depth -type d -name testdata | while read d; do
+		if echo "$d" | grep -q '/vendor/'; then
+			continue
+		fi
+		parent=`dirname $d`
+		install -d ${D}${PTEST_PATH}/$parent
+		cp --preserve=mode,timestamps -R $d ${D}${PTEST_PATH}/$parent/
+	done
+	cd "$oldwd"
+}
+
+do_install_ptest_base() {
+	test -f "${B}/.go_compiled_tests.list" || exit 0
+	install -d ${D}${PTEST_PATH}
+	go_stage_testdata
+	go_make_ptest_wrapper
+	havetests=""
+	while read test; do
+		testdir=`dirname $test`
+		testprog=`basename $test`
+		install -d ${D}${PTEST_PATH}/$testdir
+		install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
+	echo "run_test $testdir $testprog || RC=1" >> ${D}${PTEST_PATH}/run-ptest
+		havetests="yes"
+	done < ${B}/.go_compiled_tests.list
+	if [ -n "$havetests" ]; then
+		echo "exit \$RC" >> ${D}${PTEST_PATH}/run-ptest
+		chmod +x ${D}${PTEST_PATH}/run-ptest
+	else
+		rm -rf ${D}${PTEST_PATH}
+	fi
+	do_install_ptest
+	chown -R root:root ${D}${PTEST_PATH}
 }
 
 EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
-- 
2.14.1


