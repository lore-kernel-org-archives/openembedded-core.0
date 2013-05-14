Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1UcAMq-0002Br-MY
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 10:14:00 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4E7teLS006267
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 00:55:40 -0700 (PDT)
Received: from jesse-wrs-desktop.wrs.com (128.224.162.230) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 14 May 2013 00:55:40 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 May 2013 15:57:39 +0800
Message-ID: <52b7eb9a13f023eb8d5987ac14d79ef265be5d5a.1368517957.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1368517957.git.sen.zhang@windriver.com>
References: <cover.1368517957.git.sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] perl-tests: convert to ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 08:15:02 -0000
X-List-Received-Date: Tue, 14 May 2013 08:15:02 -0000
Content-Type: text/plain

[YOCTO #4292]

Replace PERL_TEST_DIR with PTEST_PATH. Also add a run-ptest script and
rename "tests" with "ptest" in various places.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/recipes-devtools/perl/perl-5.14.3/run-ptest   |  2 ++
 .../perl/{perl-tests.inc => perl-ptest.inc}        | 30 +++++++++++-----------
 meta/recipes-devtools/perl/perl_5.14.3.bb          |  2 +-
 3 files changed, 18 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/run-ptest
 rename meta/recipes-devtools/perl/{perl-tests.inc => perl-ptest.inc} (48%)

diff --git a/meta/recipes-devtools/perl/perl-5.14.3/run-ptest b/meta/recipes-devtools/perl/perl-5.14.3/run-ptest
new file mode 100644
index 0000000..28935e1
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.14.3/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+cd t && ./TEST
diff --git a/meta/recipes-devtools/perl/perl-tests.inc b/meta/recipes-devtools/perl/perl-ptest.inc
similarity index 48%
rename from meta/recipes-devtools/perl/perl-tests.inc
rename to meta/recipes-devtools/perl/perl-ptest.inc
index b97b467..a3b19f8 100644
--- a/meta/recipes-devtools/perl/perl-tests.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -1,19 +1,20 @@
-PACKAGES += "perl-tests"
-PERL_TEST_DIR = "/opt/perl-tests"
+inherit ptest
 
-do_install_append () {
-	mkdir -p ${D}${PERL_TEST_DIR}
-	cp -pv TestInit.pm MANIFEST config.sh ${D}${PERL_TEST_DIR}/
+SRC_URI += "file://run-ptest"
 
-	tar -cf - t/ | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
-	ln -sf ${bindir}/perl ${D}${PERL_TEST_DIR}/t/
-	ln -sf ${libdir}/perl/${PV} ${D}${PERL_TEST_DIR}/lib
+do_install_ptest () {
+	mkdir -p ${D}${PTEST_PATH}
+	cp -pv TestInit.pm MANIFEST config.sh ${D}${PTEST_PATH}/
+
+	tar -cf - t/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/
+	ln -sf ${libdir}/perl/${PV} ${D}${PTEST_PATH}/lib
 
 	for dir in `find ext/ dist/ cpan/ -maxdepth 2 -type d -name t ` ; do
-	    tar -cf - $dir | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
+	    tar -cf - $dir | ( cd ${D}${PTEST_PATH} && tar -xf - )
 	done
 	for file in `find ext dist cpan -name \*.t -o -name \test.pl`;  do
-	    tar -cf - $file | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
+	    tar -cf - $file | ( cd ${D}${PTEST_PATH} && tar -xf - )
 	done
 
 	# Tweaks to make tests pass
@@ -27,10 +28,9 @@ do_install_append () {
 	cp -pv lib/auto/XS/APItest/APItest.so ${D}${libdir}/perl/${PV}/auto/XS/APItest/
 	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/Typemap
 	cp -pv lib/auto/XS/Typemap/Typemap.so ${D}${libdir}/perl/${PV}/auto/XS/Typemap/
-	cp -pv cpan/Digest-MD5/README ${D}${PERL_TEST_DIR}/cpan/Digest-MD5/
-	cp -pv cpan/Digest-MD5/MD5.xs ${D}${PERL_TEST_DIR}/cpan/Digest-MD5/
+	cp -pv cpan/Digest-MD5/README ${D}${PTEST_PATH}/cpan/Digest-MD5/
+	cp -pv cpan/Digest-MD5/MD5.xs ${D}${PTEST_PATH}/cpan/Digest-MD5/
 }
 
-FILES_${PN}-tests = "${PERL_TEST_DIR} \
-                     ${libdir}/perl/${PV}/AnyDBM_File.t"
-RDEPENDS_${PN}-tests = "${PN}-modules ${PN}-doc ${PN}-misc"
+FILES_${PN}-ptest += "${libdir}/perl/${PV}/AnyDBM_File.t"
+RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc"
diff --git a/meta/recipes-devtools/perl/perl_5.14.3.bb b/meta/recipes-devtools/perl/perl_5.14.3.bb
index 72efc63..9915042 100644
--- a/meta/recipes-devtools/perl/perl_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.3.bb
@@ -324,7 +324,7 @@ RPROVIDES_perl-lib = "perl-lib"
 require perl-rdepends_${PV}.inc
 require perl-rprovides.inc
 require perl-rprovides_${PV}.inc
-include perl-tests.inc
+require perl-ptest.inc
 
 SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
 
-- 
1.7.11.7



