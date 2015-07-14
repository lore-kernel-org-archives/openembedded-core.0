Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9393575874
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 06:19:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6E6J3NJ002130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 23:19:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Mon, 13 Jul 2015 23:19:03 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jul 2015 14:17:34 +0800
Message-ID: <abe3468e72b4aa366b92cc9df9ac5cc1ee068fe1.1436854516.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1436854516.git.kai.kang@windriver.com>
References: <cover.1436854516.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/1] bash: fix for QA buildpaths check
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
X-List-Received-Date: Tue, 14 Jul 2015 06:19:06 -0000
Content-Type: text/plain

When enable QA check 'buildpaths', it shows warnings/errors:

WARNING: QA Issue: File
/work/core2-64-poky-linux/bash/4.3-r1/packages-split/bash-ptest/usr/lib64/bash/ptest/Makefile
in package contained reference to tmpdir [buildpaths]
WARNING: QA Issue: File
/work/core2-64-poky-linux/bash/4.3-r1/packages-split/bash/usr/bin/bashbug
in package contained reference to tmpdir [buildpaths]

bashbug is a utility for reporting bugs in Bash to the maintainers. It
sends the build informations such as CC and CFLAGS which contain build
directories to maintainer to analysis the bug. It should not be treated
as a failure. So just skip buildpaths check for package bash.

And it uses target runtest in /usr/lib64/bash/ptest/Makefile to run
ptest. Rewrite script run-ptest and remove Makefile file to pass
buildpaths QA check.

For file y.tab.c. in bash 3.2.48, it has lines such as:

  #line 21 "...tmp/work/core2-64-poky-linux/bash/3.2.48-r11/bash-3.2.48/parse.y"

Remove $S from file y.tab.c to fix buildpaths check too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/bash/bash-3.2.48/run-ptest | 2 --
 meta/recipes-extended/bash/bash.inc              | 8 ++------
 meta/recipes-extended/bash/bash/run-ptest        | 5 ++++-
 meta/recipes-extended/bash/bash_3.2.48.bb        | 6 ++++++
 4 files changed, 12 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash-3.2.48/run-ptest

diff --git a/meta/recipes-extended/bash/bash-3.2.48/run-ptest b/meta/recipes-extended/bash/bash-3.2.48/run-ptest
deleted file mode 100644
index 8dd3b99..0000000
--- a/meta/recipes-extended/bash/bash-3.2.48/run-ptest
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-make -k THIS_SH=/bin/bash BUILD_DIR=. runtest
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index c06f157..68c9470 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -23,6 +23,8 @@ RDEPENDS_${PN} += "base-files"
 RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-ptest += "make"
 
+INSANE_SKIP_${PN} = "buildpaths"
+
 do_configure_prepend () {
 	if [ ! -e ${S}/acinclude.m4 ]; then
 		cat ${S}/aclocal.m4 > ${S}/acinclude.m4
@@ -40,15 +42,9 @@ do_install_append () {
 		mv ${D}${bindir}/bash ${D}${base_bindir}
 	fi
 }
-do_install_append_class-target () {
-	# Clean host path in bashbug
-	sed -i -e "s,${STAGING_DIR_TARGET},,g" ${D}${bindir}/bashbug
-}
 
 do_install_ptest () {
 	make INSTALL_TEST_DIR=${D}${PTEST_PATH}/tests install-test
-	cp ${B}/Makefile ${D}${PTEST_PATH}
-        sed -i 's/^Makefile/_Makefile/' ${D}${PTEST_PATH}/Makefile
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-extended/bash/bash/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
index 8dd3b99..5dee19e 100644
--- a/meta/recipes-extended/bash/bash/run-ptest
+++ b/meta/recipes-extended/bash/bash/run-ptest
@@ -1,2 +1,5 @@
 #!/bin/sh
-make -k THIS_SH=/bin/bash BUILD_DIR=. runtest
+
+TESTDIR=$(dirname `readlink -f $0`)
+cd $TESTDIR/tests
+THIS_SH=/bin/bash /bin/sh run-all
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 34272d1..3b4eceb 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -43,3 +43,9 @@ SRC_URI[patch057.md5sum] = "47d98e3e042892495c5efe54ec6e5913"
 SRC_URI[patch057.sha256sum] = "5fc689394d515990f5ea74e2df765fc6e5e42ca44b4591b2c6f9be4b0cadf0f0"
 
 PARALLEL_MAKE = ""
+
+# Fix for buildpaths check
+do_compile_prepend() {
+	oe_runmake y.tab.c
+	sed -i 's,${S}/,,' ${B}/y.tab.c
+}
-- 
1.9.1


