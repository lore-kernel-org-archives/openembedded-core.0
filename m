Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 588346C10F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 09:00:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6590T1T004682
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Jul 2019 02:00:29 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 5 Jul 2019 02:00:23 -0700
From: <mingli.yu@windriver.com>
To: <matt@madison.systems>, <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
Date: Fri, 5 Jul 2019 02:00:23 -0700
Message-ID: <20190705090023.113429-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <CAGgRHJofXoz2j3qYU9CiiBpYA7iLhc=-aQMWoE7t_=uFDH0KMg@mail.gmail.com>
References: <CAGgRHJofXoz2j3qYU9CiiBpYA7iLhc=-aQMWoE7t_=uFDH0KMg@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3] go.bbclass: separate the ptest logic to go-ptest class
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
X-List-Received-Date: Fri, 05 Jul 2019 09:00:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The current go class includes ptest logic by default
and will make the recipe which inherits go class
to support ptest automatically though maybe the
recipe which inherits go class doesn't plan to
support the ptest.

So separate the ptest logic to another specified
class go-ptest to make the recipe which needs to
inherit go class more flexible with regards to
ptest support.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/classes/go-ptest.bbclass | 54 +++++++++++++++++++++++++++++++++++
 meta/classes/go.bbclass       | 52 +--------------------------------
 2 files changed, 55 insertions(+), 51 deletions(-)
 create mode 100644 meta/classes/go-ptest.bbclass

diff --git a/meta/classes/go-ptest.bbclass b/meta/classes/go-ptest.bbclass
new file mode 100644
index 0000000000..e230a80587
--- /dev/null
+++ b/meta/classes/go-ptest.bbclass
@@ -0,0 +1,54 @@
+inherit go ptest
+
+do_compile_ptest_base() {
+	export TMPDIR="${GOTMPDIR}"
+	rm -f ${B}/.go_compiled_tests.list
+	go_list_package_tests | while read pkg; do
+		cd ${B}/src/$pkg
+		${GO} test ${GOPTESTBUILDFLAGS} $pkg
+		find . -mindepth 1 -maxdepth 1 -type f -name '*.test' -exec echo $pkg/{} \; | \
+			sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
+	done
+	do_compile_ptest
+}
+
+do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
+
+go_make_ptest_wrapper() {
+	cat >${D}${PTEST_PATH}/run-ptest <<EOF
+#!/bin/sh
+RC=0
+run_test() (
+    cd "\$1"
+    ((((./\$2 ${GOPTESTFLAGS}; echo \$? >&3) | sed -r -e"s,^(PASS|SKIP|FAIL)\$,\\1: \$1/\$2," >&4) 3>&1) | (read rc; exit \$rc)) 4>&1
+    exit \$?)
+EOF
+
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
+}
+
+INSANE_SKIP_${PN}-ptest += "ldflags"
+
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index e05a5c641c..f303a15eaf 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,4 +1,4 @@
-inherit goarch ptest
+inherit goarch
 
 GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"
 
@@ -114,19 +114,6 @@ go_do_compile() {
 do_compile[dirs] =+ "${GOTMPDIR}"
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
 
-do_compile_ptest_base() {
-	export TMPDIR="${GOTMPDIR}"
-	rm -f ${B}/.go_compiled_tests.list
-	go_list_package_tests | while read pkg; do
-		cd ${B}/src/$pkg
-		${GO} test ${GOPTESTBUILDFLAGS} $pkg
-		find . -mindepth 1 -maxdepth 1 -type f -name '*.test' -exec echo $pkg/{} \; | \
-			sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
-	done
-	do_compile_ptest
-}
-do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
-
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
 	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
@@ -139,18 +126,6 @@ go_do_install() {
 	fi
 }
 
-go_make_ptest_wrapper() {
-	cat >${D}${PTEST_PATH}/run-ptest <<EOF
-#!/bin/sh
-RC=0
-run_test() (
-    cd "\$1"
-    ((((./\$2 ${GOPTESTFLAGS}; echo \$? >&3) | sed -r -e"s,^(PASS|SKIP|FAIL)\$,\\1: \$1/\$2," >&4) 3>&1) | (read rc; exit \$rc)) 4>&1
-    exit \$?)
-EOF
-
-}
-
 go_stage_testdata() {
 	oldwd="$PWD"
 	cd ${S}/src
@@ -165,37 +140,12 @@ go_stage_testdata() {
 	cd "$oldwd"
 }
 
-do_install_ptest_base() {
-	test -f "${B}/.go_compiled_tests.list" || exit 0
-	install -d ${D}${PTEST_PATH}
-	go_stage_testdata
-	go_make_ptest_wrapper
-	havetests=""
-	while read test; do
-		testdir=`dirname $test`
-		testprog=`basename $test`
-		install -d ${D}${PTEST_PATH}/$testdir
-		install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
-	echo "run_test $testdir $testprog || RC=1" >> ${D}${PTEST_PATH}/run-ptest
-		havetests="yes"
-	done < ${B}/.go_compiled_tests.list
-	if [ -n "$havetests" ]; then
-		echo "exit \$RC" >> ${D}${PTEST_PATH}/run-ptest
-		chmod +x ${D}${PTEST_PATH}/run-ptest
-	else
-		rm -rf ${D}${PTEST_PATH}
-	fi
-	do_install_ptest
-	chown -R root:root ${D}${PTEST_PATH}
-}
-
 EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
 
 FILES_${PN}-dev = "${libdir}/go/src"
 FILES_${PN}-staticdev = "${libdir}/go/pkg"
 
 INSANE_SKIP_${PN} += "ldflags"
-INSANE_SKIP_${PN}-ptest += "ldflags"
 
 # Add -buildmode=pie to GOBUILDFLAGS to satisfy "textrel" QA checking, but mips
 # doesn't support -buildmode=pie, so skip the QA checking for mips and its
-- 
2.21.0


