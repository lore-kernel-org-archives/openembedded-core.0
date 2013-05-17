Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1UdDN0-0004Mq-V1
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 07:38:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4H5K6P3004492
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 22:20:06 -0700 (PDT)
Received: from jesse-wrs-desktop.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 16 May 2013 22:20:06 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 May 2013 13:22:02 +0800
Message-ID: <6f982350937c07b4dd73231e4d99322cb86c6fab.1368761545.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1368761545.git.sen.zhang@windriver.com>
References: <cover.1368761545.git.sen.zhang@windriver.com>
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
X-List-Received-Date: Fri, 17 May 2013 05:38:25 -0000
Content-Type: text/plain

[YOCTO #4292]

Replace PERL_TEST_DIR with PTEST_PATH, and rename "tests" with "ptest"
in various places. Add a run-ptest script. Also add a patch to change
the output format.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 .../perl/perl-5.14.3/ptest-format.patch            | 69 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl-5.14.3/run-ptest   |  2 +
 meta/recipes-devtools/perl/perl-ptest.inc          | 50 ++++++++++++++++
 meta/recipes-devtools/perl/perl-tests.inc          | 36 -----------
 meta/recipes-devtools/perl/perl_5.14.3.bb          |  2 +-
 5 files changed, 122 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/ptest-format.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/run-ptest
 create mode 100644 meta/recipes-devtools/perl/perl-ptest.inc
 delete mode 100644 meta/recipes-devtools/perl/perl-tests.inc

diff --git a/meta/recipes-devtools/perl/perl-5.14.3/ptest-format.patch b/meta/recipes-devtools/perl/perl-5.14.3/ptest-format.patch
new file mode 100644
index 0000000..3910269
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.14.3/ptest-format.patch
@@ -0,0 +1,69 @@
+Change test output to ptest format
+
+Change from
+
+    testname........ok
+    testname........failrue
+    testname........skipped
+
+to
+
+    PASS: testname
+    FAIL: testname
+    SKIP: testname
+
+Upstream-Status: Pending
+
+Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
+
+--- a/t/TEST	2013-05-15 23:12:12.705104588 -0400
++++ b/t/TEST	2013-05-15 23:20:20.126104587 -0400
+@@ -511,7 +511,6 @@
+     }
+     my $maxlen = 0;
+     foreach (@::path_to_name{@tests}) {
+-	s/\.\w+\z/./;
+ 	my $len = length ;
+ 	$maxlen = $len if $len > $maxlen;
+     }
+@@ -540,12 +539,12 @@
+ 		next;
+ 	    }
+ 	}
+-	my $te = $::path_to_name{$test} . '.'
+-		    x ($dotdotdot - length($::path_to_name{$test}));
++	my $testname = $::path_to_name{$test};
++	my $te = $testname . '.' x ($dotdotdot - length($testname));
+ 
+ 	if ($^O ne 'VMS') {  # defer printing on VMS due to piping bug
+-	    print $te;
+-	    $te = '';
++	    #print $te;
++	    #$te = '';
+ 	}
+ 
+         (local $Valgrind_Log = "$test.valgrind-current") =~ s/^.*\///;
+@@ -718,7 +717,8 @@
+ 	}
+ 
+ 	if (defined $failure) {
+-	    print "${te}$failure\n";
++	    print "FAIL: $testname\n";
++	    print "$failure\n";
+ 	    $::bad_files = $::bad_files + 1;
+ 	    if ($test =~ /^base/) {
+ 		die "Failed a basic test ($test) -- cannot continue.\n";
+@@ -734,11 +734,11 @@
+ 		else {
+ 		    $elapsed = "";
+ 		}
+-		print "${te}ok$elapsed\n";
++		print "PASS: $testname\n";
+ 		$good_files = $good_files + 1;
+ 	    }
+ 	    else {
+-		print "${te}skipped\n";
++		print "SKIP: $testname\n";
+ 		$tested_files = $tested_files - 1;
+ 	    }
+ 	}
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/run-ptest b/meta/recipes-devtools/perl/perl-5.14.3/run-ptest
new file mode 100644
index 0000000..28935e1
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.14.3/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+cd t && ./TEST
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
new file mode 100644
index 0000000..5d61743
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -0,0 +1,50 @@
+inherit ptest
+
+SRC_URI += "file://run-ptest \
+            file://ptest-format.patch \
+           "
+
+do_install_ptest () {
+	mkdir -p ${D}${PTEST_PATH}
+	cp -pv TestInit.pm MANIFEST config.sh ${D}${PTEST_PATH}/
+
+	tar -cf - t/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/
+	ln -sf ${libdir}/perl/${PV} ${D}${PTEST_PATH}/lib
+
+	for dir in `find ext/ dist/ cpan/ -maxdepth 2 -type d -name t ` ; do
+	    tar -cf - $dir | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	done
+	for file in `find ext dist cpan -name \*.t -o -name \test.pl`;  do
+	    tar -cf - $file | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	done
+
+	# Tweaks to make tests pass
+	cp -pv lib/unicore/TestProp.pl ${D}${libdir}/perl/${PV}/unicore/
+	# Put all *.t files from the lib dir in the ptest package
+	pushd lib
+	for file in `find -name \*.t`; do
+	    tar -cf - $file | ( cd ${D}${libdir}/perl/${PV} && tar -xf - )
+	done
+	popd
+
+	mkdir -p ${D}${libdir}/perl/${PV}/XS
+	cp -pv lib/XS/APItest.pm ${D}${libdir}/perl/${PV}/XS/
+	cp -pv lib/XS/Typemap.pm ${D}${libdir}/perl/${PV}/XS/
+	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/APItest
+	cp -pv lib/auto/XS/APItest/APItest.so ${D}${libdir}/perl/${PV}/auto/XS/APItest/
+	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/Typemap
+	cp -pv lib/auto/XS/Typemap/Typemap.so ${D}${libdir}/perl/${PV}/auto/XS/Typemap/
+	cp -pv cpan/Digest-MD5/README ${D}${PTEST_PATH}/cpan/Digest-MD5/
+	cp -pv cpan/Digest-MD5/MD5.xs ${D}${PTEST_PATH}/cpan/Digest-MD5/
+}
+
+python populate_packages_prepend() {
+    # Put all *.t files from the lib dir in the ptest package
+    # do_split_packages requires a pair of () in the regex, but we have nothing
+    # to match, so use an empty pair.
+    do_split_packages(d, d.expand('${libdir}/perl/${PV}'), '.*\.t()',
+        '${PN}-ptest%s', '%s', recursive=True, match_path=True)
+}
+
+RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc"
diff --git a/meta/recipes-devtools/perl/perl-tests.inc b/meta/recipes-devtools/perl/perl-tests.inc
deleted file mode 100644
index b97b467..0000000
--- a/meta/recipes-devtools/perl/perl-tests.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-PACKAGES += "perl-tests"
-PERL_TEST_DIR = "/opt/perl-tests"
-
-do_install_append () {
-	mkdir -p ${D}${PERL_TEST_DIR}
-	cp -pv TestInit.pm MANIFEST config.sh ${D}${PERL_TEST_DIR}/
-
-	tar -cf - t/ | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
-	ln -sf ${bindir}/perl ${D}${PERL_TEST_DIR}/t/
-	ln -sf ${libdir}/perl/${PV} ${D}${PERL_TEST_DIR}/lib
-
-	for dir in `find ext/ dist/ cpan/ -maxdepth 2 -type d -name t ` ; do
-	    tar -cf - $dir | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
-	done
-	for file in `find ext dist cpan -name \*.t -o -name \test.pl`;  do
-	    tar -cf - $file | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
-	done
-
-	# Tweaks to make tests pass
-	cp -pv lib/unicore/TestProp.pl ${D}${libdir}/perl/${PV}/unicore/
-	cp -pv lib/AnyDBM_File.t ${D}${libdir}/perl/${PV}/
-
-	mkdir -p ${D}${libdir}/perl/${PV}/XS
-	cp -pv lib/XS/APItest.pm ${D}${libdir}/perl/${PV}/XS/
-	cp -pv lib/XS/Typemap.pm ${D}${libdir}/perl/${PV}/XS/
-	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/APItest
-	cp -pv lib/auto/XS/APItest/APItest.so ${D}${libdir}/perl/${PV}/auto/XS/APItest/
-	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/Typemap
-	cp -pv lib/auto/XS/Typemap/Typemap.so ${D}${libdir}/perl/${PV}/auto/XS/Typemap/
-	cp -pv cpan/Digest-MD5/README ${D}${PERL_TEST_DIR}/cpan/Digest-MD5/
-	cp -pv cpan/Digest-MD5/MD5.xs ${D}${PERL_TEST_DIR}/cpan/Digest-MD5/
-}
-
-FILES_${PN}-tests = "${PERL_TEST_DIR} \
-                     ${libdir}/perl/${PV}/AnyDBM_File.t"
-RDEPENDS_${PN}-tests = "${PN}-modules ${PN}-doc ${PN}-misc"
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



