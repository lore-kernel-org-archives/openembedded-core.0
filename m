Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 099F476424
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 03:28:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t743SVRM006842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Aug 2015 20:28:31 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Mon, 3 Aug 2015 20:28:30 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 4 Aug 2015 11:25:36 +0800
Message-ID: <199a59814d297f3574061c24f9d7bd19b5815948.1438658497.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1438658497.git.kai.kang@windriver.com>
References: <cover.1438658497.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: add ptest sub-package
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
X-List-Received-Date: Tue, 04 Aug 2015 03:28:32 -0000
Content-Type: text/plain

Add sub-package ptest which runs all unit tests cases for qemu.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc                | 16 +++++++++++-
 .../qemu/qemu/add-ptest-in-makefile.patch          | 29 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu/run-ptest          |  8 ++++++
 3 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/run-ptest

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6a744c3..c3f73d1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -3,9 +3,10 @@ HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "glib-2.0 zlib pixman"
 RDEPENDS_${PN}_class-target += "bash python"
+RDEPENDS_${PN}-ptest = "bash make"
 
 require qemu-targets.inc
-inherit autotools
+inherit autotools ptest
 BBCLASSEXTEND = "native nativesdk"
 
 PR = "r1"
@@ -18,6 +19,8 @@ SRC_URI = "\
     file://disable-grabs.patch \
     file://exclude-some-arm-EABI-obsolete-syscalls.patch \
     file://wacom.patch \
+    file://add-ptest-in-makefile.patch \
+    file://run-ptest \
     "
 
 SRC_URI_append_class-native = "\
@@ -54,6 +57,17 @@ do_configure() {
     test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
+do_compile_ptest() {
+	make buildtest-TESTS
+}
+
+do_install_ptest() {
+	cp -rL ${B}/tests ${D}${PTEST_PATH}
+	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i rm -rf {}
+
+	cp ${S}/tests/Makefile ${D}${PTEST_PATH}/tests
+}
+
 do_install () {
 	export STRIP="true"
 	autotools_do_install
diff --git a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
new file mode 100644
index 0000000..a99f720
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Pending
+
+Add subpackage -ptest which runs all unit test cases for qemu.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ tests/Makefile |   10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/tests/Makefile b/tests/Makefile
+index 88f7105..3f40b4b 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -405,3 +405,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
+ 
+ -include $(wildcard tests/*.d)
+ -include $(wildcard tests/libqos/*.d)
++
++buildtest-TESTS: $(check-unit-y)
++
++runtest-TESTS:
++	for f in $(check-unit-y); do \
++		nf=$$(echo $$f | sed 's/tests\//\.\//g'); \
++		$$nf; \
++	done
++
+--
+1.7.9.5
+
diff --git a/meta/recipes-devtools/qemu/qemu/run-ptest b/meta/recipes-devtools/qemu/qemu/run-ptest
new file mode 100644
index 0000000..f4b8e97
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/run-ptest
@@ -0,0 +1,8 @@
+#!/bin/sh
+#
+#This script is used to run qemu test suites
+ptestdir=$(pwd)
+cd tests
+
+export SRC_PATH=$ptestdir
+make -k runtest-TESTS | sed '/: OK/ s/^/PASS: /g'
-- 
1.9.1


