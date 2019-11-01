Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9717FCB2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 18:37:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA1IbQP7005724
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2019 11:37:26 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 1 Nov 2019 11:37:25 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Nov 2019 14:37:24 -0400
Message-ID: <20191101183724.32131-2-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191101183724.32131-1-Trevor.Gamblin@windriver.com>
References: <20191101183724.32131-1-Trevor.Gamblin@windriver.com>
MIME-Version: 1.0
Subject: [RFC 1/1] coreutils: add ptest
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
X-List-Received-Date: Fri, 01 Nov 2019 18:37:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../coreutils/coreutils/run-ptest             | 21 ++++++++++
 meta/recipes-core/coreutils/coreutils_8.31.bb | 39 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest

diff --git a/meta/recipes-core/coreutils/coreutils/run-ptest b/meta/recipes-core/coreutils/coreutils/run-ptest
new file mode 100755
index 0000000000..07f34a8d3e
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/run-ptest
@@ -0,0 +1,21 @@
+#!/bin/bash
+
+COREUTILSLIB=/usr/lib/coreutils
+LOG="${COREUTILSLIB}/ptest/coreutils_ptest_$(date +%Y%m%d-%H%M%S).log"
+
+addgroup usergroup1
+sleep 1
+adduser --ingroup usergroup1 tester
+chmod -R 777 ../ptest
+sleep 2
+
+su tester -c "make check-TESTS top_srcdir=. srcdir=." | tee -a ${LOG}
+sleep 1
+deluser tester 
+delgroup usergroup1
+
+passed=`grep PASS ${LOG}|wc -l`
+failed=`grep FAIL ${LOG}|wc -l`
+skipped=`grep -E SKIP ${LOG}|wc -l`
+all=$((passed + failed + skipped))
+
diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index 57b2c1bdba..c9c9df0cfa 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -143,3 +143,42 @@ python __anonymous() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit ptest
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+ 
+SRC_URI += 	"file://run-ptest"
+RDEPENDS_${PN}-ptest += "bash gdb perl gawk strace perl-module-file-stat libconvert-asn1-perl liberror-perl libmodule-build-perl libtimedate-perl liburi-perl"
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
+	rm -rf ${D}${PTEST_PATH}/src
+	sed -i '/^VPATH/s/= .*$/= ./g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^PROGRAMS/s/^/#/g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^Makefile: /s/^.*$/Makefile:/g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^abs_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^abs_top_builddir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^abs_top_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
+	sed -i '/^built_programs/s/ginstall/install/g' ${D}${PTEST_PATH}/Makefile
+
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
2.21.0


