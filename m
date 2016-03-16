Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 007F66FF23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 12:08:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 16 Mar 2016 05:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,344,1455004800"; d="scan'208";a="935064217"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 16 Mar 2016 05:08:07 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2016 14:13:45 +0200
Message-Id: <1458130425-15340-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] systemd: Fix and expand ptests
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
X-List-Received-Date: Wed, 16 Mar 2016 12:08:07 -0000

systemd-ptest only runs a couple of tests currently.
* Install all test binaries and required data files
* Add missing runtime dependencies for -ptest
* Fix paths required for on-target testing in do_configure_prepend()
* cleanup do_install_ptest()

For reference, results on current core-image-sato:
  PASS: 109
  SKIP:   5
  FAIL:   2

test-execute failure:
https://github.com/systemd/systemd/issues/2852

test-acl-util failure:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9269

Fixes [YOCTO #8767].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

This is also available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/systemd-testing
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/systemd-testing




 meta/recipes-core/systemd/systemd/run-ptest |  5 ++--
 meta/recipes-core/systemd/systemd_229.bb    | 39 ++++++++++++++++++++---------
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/run-ptest b/meta/recipes-core/systemd/systemd/run-ptest
index a2d61c2..2ae76ff 100644
--- a/meta/recipes-core/systemd/systemd/run-ptest
+++ b/meta/recipes-core/systemd/systemd/run-ptest
@@ -1,5 +1,6 @@
 #!/bin/sh
 
+cd tests
 tar -C test -xJf test/sys.tar.xz
-make test/rules-test.sh.log
-make test/udev-test.pl.log
+make check-TESTS
+cd ..
diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index ae88c89..b16cacb 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -197,6 +197,8 @@ do_configure_prepend() {
 	else
 		cp -r ${S}/units ${S}/units.pre_sed
 	fi
+	sed -i -e 's:-DTEST_DIR=\\\".*\\\":-DTEST_DIR=\\\"${PTEST_PATH}/tests/test\\\":' ${S}/Makefile.am
+	sed -i -e 's:-DCATALOG_DIR=\\\".*\\\":-DCATALOG_DIR=\\\"${PTEST_PATH}/tests/catalog\\\":' ${S}/Makefile.am
 }
 
 do_install() {
@@ -264,19 +266,27 @@ do_install() {
 }
 
 do_install_ptest () {
-       install -d ${D}${PTEST_PATH}/test
-       cp -rfL ${S}/test/* ${D}${PTEST_PATH}/test
-       install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
-       install -d ${D}${PTEST_PATH}/build-aux
-       cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
-       cp -rf ${B}/rules ${D}${PTEST_PATH}/
+       # install data files needed for tests
+       install -d ${D}${PTEST_PATH}/tests/test
+       cp -rfL ${S}/test/* ${D}${PTEST_PATH}/tests/test
+       sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/tests/test/udev-test.pl
+
+       install -d ${D}${PTEST_PATH}/tests/catalog
+       install ${S}/catalog/* ${D}${PTEST_PATH}/tests/catalog/
+
+       install -D ${S}/build-aux/test-driver ${D}${PTEST_PATH}/tests/build-aux/test-driver
+
+       install -d ${D}${PTEST_PATH}/tests/rules
+       install ${B}/rules/* ${D}${PTEST_PATH}/tests/rules/
+
        # This directory needs to be there for udev-test.pl to work.
        install -d ${D}${libdir}/udev/rules.d
-       cp ${B}/Makefile ${D}${PTEST_PATH}/
-       cp ${S}/test/sys.tar.xz ${D}${PTEST_PATH}/test
-       sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/test/udev-test.pl
-       sed -i 's#${S}#${PTEST_PATH}#g' ${D}${PTEST_PATH}/Makefile
-       sed -i 's#${B}#${PTEST_PATH}#g' ${D}${PTEST_PATH}/Makefile
+
+       # install actual test binaries
+       install -m 0755 ${B}/test-* ${D}${PTEST_PATH}/tests/
+       install -m 0755 ${B}/.libs/test-* ${D}${PTEST_PATH}/tests/
+
+       install ${B}/Makefile ${D}${PTEST_PATH}/tests/
 }
 
 python populate_packages_prepend (){
@@ -312,7 +322,12 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
-RDEPENDS_${PN}-ptest += "perl python bash"
+RDEPENDS_${PN}-ptest += "gawk make perl python bash xz \
+                         tzdata tzdata-americas tzdata-asia \
+                         tzdata-europe tzdata-africa tzdata-antarctica \
+                         tzdata-arctic tzdata-atlantic tzdata-australia \
+                         tzdata-pacific tzdata-posix"
+
 FILES_${PN}-ptest += "${libdir}/udev/rules.d"
 
 FILES_${PN}-gui = "${bindir}/systemadm"
-- 
2.1.4


