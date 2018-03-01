Return-Path: <matt@madison.systems>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 460BA78911
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:11 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a16so3144525pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GcBPR3coMCjf7AioDqnKeaZ+nqmtS6c5b4QDzgX6x50=;
	b=hp6HLXyEfQwkotCLBgwN2Z24v6fDLMoQ9j/CMjJNKqBC7DvM5FAcfkZ1DihCquQMN5
	HcP8by5XDZLYEbKhYMVKsRpBsrml/SpybM8ZHul5YYGF0BJTeBGMDE8KhLVp/BOVtq3c
	Xl52Fevh8GEzkQXtsnv54MeWEi+FK8iiCxaLIhqJFRL11FErQ0eRvKY2ijhQcDtjL0L1
	cXKbHLgPTi4YYvvXSlVF9wl+eQgmt+vv1Ok3GQVsSHCt/5U+A8wmGDGViKbHMyhhCpVT
	ubmL4kuA0T7vFOJDB5rMNer5ImwO0SEt1dn5o8euu+ESidHvu1Q32d6AAKP1V2NI1zou
	6IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GcBPR3coMCjf7AioDqnKeaZ+nqmtS6c5b4QDzgX6x50=;
	b=ZcmDh1CP1MAG9i4Dh1ZgFDyuRcKY3dYSNc75qcVGunB13/9RYyv3x5SSGWf0QfbKXZ
	0/Q70SeDHxul5aHvMIZ3iX7gotImz5ZuMRCYrTBD6fL0AR5iD5JMrg+D1WC+2gRkEuPY
	PczYbPrV+3RhCmNziJ6MHzxd3mGFh85kI22FnBUK4Upz4uYYBj39ZNEWbz0MS6Jv3QX/
	7P1a0i1f63XEYIP3S2nvN0ydYDxvixjHbYO6rt0bhwyhehL0efmNH6FK1e5RGhRZYpGX
	u+WZOPOBDlh3s5+VijdAFVMg32KZRq0a0lA8dycy1QAXwvUV74BRA3A8cQpq2KM5RC+N
	MIew==
X-Gm-Message-State: APf1xPAq+dAPlTFtWic0WPF+x+1IBDQqvlDHfXzXeSi3tDI1Md3RxDqi
	pH36makJrhOiEj2uA99tn+LWExeG
X-Google-Smtp-Source: AG47ELv8zgWVCyKdCXJrCo2IKJr355YhxGq9EUxqk3KuEHFi4yQXS9HrTw5neUtxJQdfLoNA//8vWg==
X-Received: by 10.98.75.18 with SMTP id y18mr3634880pfa.124.1519946232159;
	Thu, 01 Mar 2018 15:17:12 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:10 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:47 -0800
Message-Id: <20180301231654.24018-7-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 06/13] go.bbclass: ptest cleanup and improvements
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:11 -0000

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


