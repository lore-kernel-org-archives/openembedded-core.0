Return-Path: <matt@madison.systems>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC0E78A86
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:50 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id j2so4204893pff.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A3a1zXoE59x2pBYKcFvGuWSba5FLxQ+lONvHB2pC2Uo=;
	b=bngl2kt86ANqjrJ6eW4ll/bcX8xaKLylZJLpy/s3ggZBC3obvlkR3zARUh2D8pfcg1
	iHtOeArxf5UZNj33d+Ifeq7x6Ll2BXMAkLtUY+sRGNj+FMmcPgRkSN2tkNKSHReY9rvq
	yL1pWblKciTYf6kXrwe+0ROHxhWxH/NFzR3v1mWpqY9Jo7caZGSHHI/91MpxozysE+YK
	z81IwdsU+VNypCPA4bLcItYz+nHcSpFaIZ3jamO3MNKGsG6Czj3laW8oMFJ7hKFqJWAj
	BUJ0llHHPwVxLyDjLL3zloqxe3GhfqZWBaRrsV8RUV/6kc7HgG6F33Y+HmxGWU4dYfg1
	GCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A3a1zXoE59x2pBYKcFvGuWSba5FLxQ+lONvHB2pC2Uo=;
	b=KmN+wZMH0dG6jEVV0SjRjcynrdjMUbFYrMaCT9IYReCuL698nr/LzXW48zWPBjU3Xi
	WeLrVBFozLe8KyZFkQpOhp15o43EhR1gz/GSD5MK6ZOQSv8ivUY7auHbmv9/WE2Yquh2
	bKx5DOb1SxptLV8BvgyqZqy41Aie/+2ZbWgplfeLO/3YBKmBkNzkmiysJb4zBSx48Yfj
	EMUZPmo9nNOyJi/FJU3pZW9rqPh3eTeFMSVTbpmGo3JNJVd3gZ5Kb1dXSS+RrLyABwml
	yUoQHy9Fi8aZ0WC1er2Lk+uOyQ80aRvVZBh5zTXZoUd1ULZ7zJNz8pa4a7EJnaxGG5k7
	iyXQ==
X-Gm-Message-State: APf1xPBAAwfVhiiwbLwpggZRZsrFyT/Rxc1sYCIPi/O1p1SdYuyruVqC
	23vAhix5HueA/QR+FGs9z1THxfpi
X-Google-Smtp-Source: AG47ELtCPqnlnwhqmTsNGPzZkjTYfbribeBjmGJhA445oQWXcOfkaxejaQlq25uX/+NMfERxEh5tnw==
X-Received: by 10.99.128.195 with SMTP id j186mr10397272pgd.15.1520197791915; 
	Sun, 04 Mar 2018 13:09:51 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:50 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:30 -0800
Message-Id: <20180304210937.29727-7-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 06/13] go.bbclass: ptest cleanup and improvements
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:51 -0000

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
index afd68b5951..a51ba3e9f0 100644
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
@@ -100,15 +100,16 @@ go_do_compile() {
 do_compile[dirs] =+ "${GOTMPDIR}"
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
 
-do_compile_ptest() {
+do_compile_ptest_base() {
 	export TMPDIR="${GOTMPDIR}"
-    rm -f ${B}/.go_compiled_tests.list
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
 
@@ -124,40 +125,54 @@ go_do_install() {
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


