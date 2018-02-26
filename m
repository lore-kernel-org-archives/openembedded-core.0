Return-Path: <matt@madison.systems>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9B184786D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:34:08 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id r26so1333791pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 11:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KUhs8CmqzvmGot7ijenYxxYoSPZeMc0jQLAbLAFo7EQ=;
	b=cwN0oxTclkJwuEItfkEqiEZAVUOXFtcbAMdxlv2f7402hd13a912ffJt6ho/+t8tBh
	1CrqbkjsDazP0pAOajC/oPec5i6L/EwEYAtVjq1VlAmCL63VpK5UXk3Vs2fIXAN0xtkg
	e/e8FtLpVIDSUx1xpo6RHjjz1Tl+vOBxHSyGab9zcTl9cCrq8TAu3s0ppTI3IYrZW3av
	/GoGdQN5fMCIcAnciJNqoI1me5nmIeTEZxgkPmhzDC4Abecu2bw4H5h5ZOUoUSNTkFjg
	EZs/oT6GJ4h/n3ON+L+63mAQPJTb6BypW8U1IIpR14xP9ej3hoR4U95SCbK2Ir4OIbEi
	7/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KUhs8CmqzvmGot7ijenYxxYoSPZeMc0jQLAbLAFo7EQ=;
	b=HMgj/E96he4wCN0FnCjuR+crcLBTccBSncNZFHfz44r2uKdY3srNIw0Dl3vK2ZLuUJ
	bK3uVRrcbh60MMjw5GsygdqSpzBvwbJSEpLdfQ2jeKMNv5EbWdN+aIzTd0OCaDrX77M3
	PmqqTHvHvMx1ixuWhRY77Y69qn3/n+D/0NQF7/TW1K9S7O+uFoxR5W6RDupXgpsRLAmd
	iUHxA0jd55OA9gMo/oUoZNpMGxrSO8L2i7Jpj/10yJaKrlQilmN2zMk46GME9gnyQbu9
	CxiFsW7iE8wHFEGmYk8SjyFNpzbSnTljDrNhzWA9YjbyRMna8QCaOREX49KLas16tCNW
	PHpw==
X-Gm-Message-State: APf1xPBGSCtojwG1W+OWz0OdiFtdKyCOl1MYGTokHu9I2WFK0p1Oru87
	fJ6vEzCZUbgKAundnJ+awTyVIm69
X-Google-Smtp-Source: AH8x224V20MSydHLDD4vidNgpdbzm+eYRCzxhQa9F1WmnoxXIBzehJUmGZcQ/dIZncD2bvBf3pqQ0Q==
X-Received: by 10.99.127.65 with SMTP id p1mr9251220pgn.50.1519673649410;
	Mon, 26 Feb 2018 11:34:09 -0800 (PST)
Received: from ip-172-31-34-104.us-west-2.compute.internal
	(ec2-34-218-58-157.us-west-2.compute.amazonaws.com. [34.218.58.157])
	by smtp.gmail.com with ESMTPSA id 84sm8542736pge.23.2018.02.26.11.34.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Feb 2018 11:34:08 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 19:33:14 +0000
Message-Id: <1519673596-4750-7-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519673596-4750-1-git-send-email-matt@madison.systems>
References: <1519673596-4750-1-git-send-email-matt@madison.systems>
Subject: [PATCH 6/8] go.bbclass: ptest cleanup and improvements
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
X-List-Received-Date: Mon, 26 Feb 2018 19:34:08 -0000

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
index 0e24bd9..70ddb21 100644
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
@@ -94,14 +94,15 @@ go_do_compile() {
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
 
@@ -117,40 +118,54 @@ go_do_install() {
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
2.7.4


