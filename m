Return-Path: <matt@madison.systems>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id EDEEB78918
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:39 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id bb3-v6so6338771plb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YkthHgfU6+Zv4ZNzCJG5UzrGz5jqczCU/gvTa+UQRj0=;
	b=FI3SOe1LYK929FZ5rGgWtbT5tOWw4dP0PxyJarXhMG6SHljV3HIAH6mhdm56Kbi7AP
	c/cPulDssWjvrzqolTUjW/8sGps9qkJOmy2CeJinAezlrckYfFYdjXuA65DdLFaNqeMu
	ariPYl1Pr55h3xJ94L6u/L3SsfNkFSD8+0c1U2APYKimjS9r2xqUtveUVGmplu/FlJv4
	5npsCHxoNipq2XD9P01tcYGgzHuxKEfY1gPlWykEA2vTALKoihkOlJxQQmKb2/Yje58y
	WlT5aJ8Sm/ooF4ZvU8+K3fJHHAaBHsTmpWbrhpi9T1NzjAA27M3JmvTIQTMPkymus+/y
	WJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YkthHgfU6+Zv4ZNzCJG5UzrGz5jqczCU/gvTa+UQRj0=;
	b=JdqhHs5RCyGyqO7qogEEfIfbp7j1tP6htA0atbHv/qBqOUeIfBQWOg7KZwX48vWEVU
	4y4whfQ8wHv+yhKiqB0JM8jqOZjgo6MLPA+QIc28NihYw2cOtYWlo6EiYEi3ga/urCqE
	lBcQrTJ1XTevCBGYHdO5lK68IYn96z7HkAu7Njw6BydZRUkrf47PdS9pGTwzhC+6lM2v
	DZZOjPsw1qDJInuHgqB47N55fiorq30Xy/6WOcvdsDtGBe7H45jgDjCY1szCGbK4mrZr
	9LCHvvLhXhbKKdC5bsQ26LDzPEsdZ98j+N4RIwCtYh4abnaEba3fuBj/n0HS/suamTBj
	jKHA==
X-Gm-Message-State: APf1xPAuQHcb0AX6WVOIyRZcBEFcaFWCi2WJasHz73j5ntgbHmRLak12
	cr8MjfK1MxDPBKEkRvM4rO+9P9Dm
X-Google-Smtp-Source: AG47ELtIO5VpVvd4Lc/s5qcpTiw0YLLwJOmLSA5pBGJTIulzUP/mmk29Cvb8IQ2QwguNc/Yvn4EaBA==
X-Received: by 2002:a17:902:8ec6:: with SMTP id
	x6-v6mr6432576plo.402.1520022820759; 
	Fri, 02 Mar 2018 12:33:40 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:39 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:07 -0800
Message-Id: <20180302203314.32737-7-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 06/13] go.bbclass: ptest cleanup and improvements
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:40 -0000

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
index 2f196b487c..010914c307 100644
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
@@ -99,14 +99,15 @@ go_do_compile() {
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
 
@@ -122,40 +123,54 @@ go_do_install() {
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


