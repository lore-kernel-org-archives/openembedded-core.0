Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F33B36C72C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 11:37:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rATBbO2E026758
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 03:37:25 -0800 (PST)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 03:37:25 -0800
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 19:37:19 +0800
Message-ID: <1385725039-5387-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] perl: fixed ptest cases failed
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
X-List-Received-Date: Fri, 29 Nov 2013 11:37:26 -0000
Content-Type: text/plain

From: Chong Lu <Chong.Lu@windriver.com>

Some ptest cases failed, because perl ptest depends on source code.
In order to make test cases to pass, we copy source code to target
to resolve dependence issue.
perl-dev provides some files for test cases, so we make perl ptest
relies on it.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/perl/perl-5.14.3/config.sh |    4 +--
 meta/recipes-devtools/perl/perl-ptest.inc        |   37 ++++------------------
 2 files changed, 8 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-5.14.3/config.sh b/meta/recipes-devtools/perl/perl-5.14.3/config.sh
index dc507cf..628a3ce 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.14.3/config.sh
@@ -1082,7 +1082,7 @@ vendorprefixexp='/usr'
 vendorscript='@USRBIN@'
 vendorscriptexp='@USRBIN@'
 version='5.14.3'
-version_patchlevel_string='version 14 subversion 2'
+version_patchlevel_string='version 14 subversion 3'
 versiononly='undef'
 vi=''
 voidflags='15'
@@ -1093,7 +1093,7 @@ zcat=''
 zip='zip'
 PERL_REVISION=5
 PERL_VERSION=14
-PERL_SUBVERSION=2
+PERL_SUBVERSION=3
 PERL_API_REVISION=5
 PERL_API_VERSION=14
 PERL_API_SUBVERSION=0
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 6999e6b..4a4b15b 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -5,37 +5,11 @@ SRC_URI += "file://run-ptest \
 
 do_install_ptest () {
 	mkdir -p ${D}${PTEST_PATH}
-	cp -pv TestInit.pm MANIFEST config.sh ${D}${PTEST_PATH}/
-
-	tar -cf - t/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
+	sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
+	tar -cf - * --exclude \*.o --exclude Makefile --exclude makefile --exclude hostperl --exclude miniperl | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	cp -pv cpan/Module-Metadata/lib/Module/Metadata.pm ${D}${PTEST_PATH}/lib/Module/
 	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/
-	ln -sf ${libdir}/perl/${PV} ${D}${PTEST_PATH}/lib
-
-	for dir in `find ext/ dist/ cpan/ -maxdepth 2 -type d -name t ` ; do
-	    tar -cf - $dir | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	done
-	for file in `find ext dist cpan -name \*.t -o -name \test.pl`;  do
-	    tar -cf - $file | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	done
-
-	# Tweaks to make tests pass
-	cp -pv lib/unicore/TestProp.pl ${D}${libdir}/perl/${PV}/unicore/
-	# Put all *.t files from the lib dir in the ptest package
-	cd lib
-	for file in `find -name \*.t`; do
-	    tar -cf - $file | ( cd ${D}${libdir}/perl/${PV} && tar -xf - )
-	done
-	cd ..
-
-	mkdir -p ${D}${libdir}/perl/${PV}/XS
-	cp -pv lib/XS/APItest.pm ${D}${libdir}/perl/${PV}/XS/
-	cp -pv lib/XS/Typemap.pm ${D}${libdir}/perl/${PV}/XS/
-	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/APItest
-	cp -pv lib/auto/XS/APItest/APItest.so ${D}${libdir}/perl/${PV}/auto/XS/APItest/
-	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/Typemap
-	cp -pv lib/auto/XS/Typemap/Typemap.so ${D}${libdir}/perl/${PV}/auto/XS/Typemap/
-	cp -pv cpan/Digest-MD5/README ${D}${PTEST_PATH}/cpan/Digest-MD5/
-	cp -pv cpan/Digest-MD5/MD5.xs ${D}${PTEST_PATH}/cpan/Digest-MD5/
 }
 
 python populate_packages_prepend() {
@@ -47,4 +21,5 @@ python populate_packages_prepend() {
             '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
 
-RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc"
+RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc ${PN}-dev"
+INSANE_SKIP_${PN}-ptest += "dev-deps"
-- 
1.7.9.5


