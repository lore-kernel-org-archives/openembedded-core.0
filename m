Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E45A7F9B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 17:43:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xALHhMKU006833
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 09:43:22 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 21 Nov 2019 09:43:20 -0800
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2019 12:43:18 -0500
Message-ID: <20191121174318.4512-2-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191121174318.4512-1-Trevor.Gamblin@windriver.com>
References: <20191121174318.4512-1-Trevor.Gamblin@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: add ptest
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
X-List-Received-Date: Thu, 21 Nov 2019 17:43:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

coreutils has a large number of tests, (and potential RDEPENDS
to support them), including tests added with the flags
RUN_EXPENSIVE_TESTS and RUN_VERY_EXPENSIVE_TESTS that add
significant run time for their coverage. The RUN_VERY_EXPENSIVE_TESTS
option has been omitted from the run-ptest script to reduce
some of this run time, even though this increases the SKIP count
in the results. Also, the ptest directory for coreutils is given
blanket permissions at runtime with chmod -R 777 to ensure that
the user created for the tests will be able to run the test
scripts and create the necessary files in the process.

There is still room to improve the results of this ptest without
the aforementioned additions. Of the tests marked SKIP, there
are 30 tests that are currently counted as SKIP because they
require root permissions, and another 21 that require membership
in multiple user groups. It is important to know that coreutils
has tests for both root and non-root users. Testing showed that
42 tests are skipped when running as root versus 30 when running
as a non-root user, so the decision was made to run the suite as
the latter.

Finally, note that the ptest suite for coreutils has a short
runtime on x86-64/kvm of approximately 4.5 minutes, in contrast
to the arm64 runtime of ~70 minutes.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../coreutils/coreutils/run-ptest             | 17 +++++++++
 meta/recipes-core/coreutils/coreutils_8.31.bb | 38 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest

diff --git a/meta/recipes-core/coreutils/coreutils/run-ptest b/meta/recipes-core/coreutils/coreutils/run-ptest
new file mode 100755
index 0000000000..683fedee7a
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/bash
+
+COREUTILSLIB=/usr/lib/coreutils
+LOG="${COREUTILSLIB}/ptest/coreutils_ptest_$(date +%Y%m%d-%H%M%S).log"
+
+addgroup usergroup1
+adduser --ingroup usergroup1 tester
+
+su tester -c "make check-TESTS RUN_EXPENSIVE_TESTS=yes top_srcdir=. srcdir=." | tee -a ${LOG}
+deluser tester 
+delgroup usergroup1
+
+passed=`grep PASS ${LOG}|wc -l`
+failed=`grep FAIL ${LOG}|wc -l`
+skipped=`grep -E SKIP ${LOG}|wc -l`
+all=$((passed + failed + skipped))
+
diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index 57b2c1bdba..5ce2730048 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -143,3 +143,41 @@ python __anonymous() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit ptest
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+ 
+SRC_URI += 	"file://run-ptest"
+RDEPENDS_${PN}-ptest += "bash findutils gawk gdb glibc libconvert-asn1-perl liberror-perl libmodule-build-perl libtimedate-perl liburi-perl make perl perl-module-file-stat python strace"
+
+do_install_ptest () {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests
+	sed -i 's/ginstall/install/g'  `grep -R ginstall ${D}${PTEST_PATH}/tests | awk -F: '{print $1}' | uniq`
+	install -d ${D}${PTEST_PATH}/build-aux
+	install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
+	cp ${B}/Makefile ${D}${PTEST_PATH}/
+	cp ${S}/init.cfg ${D}${PTEST_PATH}/
+	cp -r ${B}/src ${D}${PTEST_PATH}/
+	cp -r ${S}/src/*.c ${D}${PTEST_PATH}/src
+	cd ${D}${PTEST_PATH}
+	tar -czvf ${D}${PTEST_PATH}/src.tar.gz ./src
+	cd -
+	sed -i '/^VPATH/s/= .*$/= ./g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^PROGRAMS/s/^/#/g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^Makefile: /s/^.*$/Makefile:/g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^abs_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^abs_top_builddir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^abs_top_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^built_programs/s/ginstall/install/g' ${D}${PTEST_PATH}/Makefile
+   chmod -R 777 ${D}${PTEST_PATH}
+	# Disable subcase stty-pairs.sh, it will cause test framework hang
+	sed -i '/stty-pairs.sh/d' ${D}${PTEST_PATH}/Makefile
+	install ${B}/src/getlimits ${D}/${bindir}
+}
+
+FILES_${PN}-ptest += "${bindir}/getlimits"
+
+INSANE_SKIP_${PN}-ptest += "ldflags"
+INSANE_SKIP_${PN}-ptest += "rpaths"
-- 
2.23.0


