Return-Path: <Maxin.John@enea.com>
X-Greylist: delayed 331 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 04 May 2014 14:07:46 UTC
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6AC0D60702
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 May 2014 14:07:46 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Sun, 4 May 2014
	16:02:09 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 1036C28C882;
	Sun,  4 May 2014 16:02:09 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 May 2014 16:02:07 +0200
Message-ID: <1399212127-30830-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] gdbm: enable ptest support
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
X-List-Received-Date: Sun, 04 May 2014 14:07:48 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Install gdbm test-suite and run it as ptest

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/gdbm/files/ptest.patch |   36 +++++++++++++++++++++++++++
 meta/recipes-support/gdbm/files/run-ptest   |    7 ++++++
 meta/recipes-support/gdbm/gdbm_1.11.bb      |   13 ++++++++--
 3 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gdbm/files/ptest.patch
 create mode 100755 meta/recipes-support/gdbm/files/run-ptest

diff --git a/meta/recipes-support/gdbm/files/ptest.patch b/meta/recipes-support/gdbm/files/ptest.patch
new file mode 100644
index 0000000..65236fb
--- /dev/null
+++ b/meta/recipes-support/gdbm/files/ptest.patch
@@ -0,0 +1,36 @@
+Add install-ptest rules.
+
+Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+Upstream-Status: Pending
+
+diff -ur a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2011-08-16 10:13:10.000000000 +0200
++++ b/Makefile.am	2013-04-12 18:02:16.473715873 +0200
+@@ -31,3 +31,8 @@
+ 	d=`date '+%d/%m/%Y'`; \
+ 	sed 's|/\*@DIST_DATE@\*/|"'"$$d"'"|' $(srcdir)/src/version.c > \
+ 		$(distdir)/src/version.c
++
++install-ptest:
++	@for subdir in $(SUBDIRS); do \
++		$(MAKE) -C $$subdir DESTDIR=$(DESTDIR)/$$subdir $@; \
++	done
+diff -ur a/tests/Makefile.am b/tests/Makefile.am
+--- a/tests/Makefile.am	2011-11-11 19:39:42.000000000 +0100
++++ b/tests/Makefile.am	2013-04-12 18:30:57.066301037 +0200
+@@ -132,4 +132,14 @@
+ dtdel_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
+ d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
+ 
++buildtests: $(check_PROGRAMS) $(TESTSUITE)
+ 
++install-ptest: $(check_PROGRAMS) $(TESTSUITE)
++	@$(INSTALL) -d $(DESTDIR)
++	@for file in $^; do \
++		if [ -x .libs/$$file ]; then \
++			$(INSTALL_PROGRAM) .libs/$$file $(DESTDIR)/$$file; \
++		else \
++			$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
++		fi \
++	done
diff --git a/meta/recipes-support/gdbm/files/run-ptest b/meta/recipes-support/gdbm/files/run-ptest
new file mode 100755
index 0000000..615da84
--- /dev/null
+++ b/meta/recipes-support/gdbm/files/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+#
+# This script is used to run the gmdb test suite
+
+cd tests
+
+./testsuite AUTOTEST_PATH=$PWD abs_builddir=$PWD COMPAT=1 | sed 's/^[^0-9]*\([0-9]\+\): \(.*\)\(ok\|pass\|skipped\|fail\|FAILED\)\(.*\)$/\3: \2 \4/;s/ \+/ /g;s/^ok/PASS/;s/^skipped/SKIP/;s/^fail/FAIL/;s/^FAILED/FAIL/'
diff --git a/meta/recipes-support/gdbm/gdbm_1.11.bb b/meta/recipes-support/gdbm/gdbm_1.11.bb
index 3d02594..adf8c5b 100644
--- a/meta/recipes-support/gdbm/gdbm_1.11.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.11.bb
@@ -5,12 +5,15 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
 
 
-SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
+           file://run-ptest \
+           file://ptest.patch \
+          "
 
 SRC_URI[md5sum] = "72c832680cf0999caedbe5b265c8c1bd"
 SRC_URI[sha256sum] = "8d912f44f05d0b15a4a5d96a76f852e905d051bb88022fcdfd98b43be093e3c3"
 
-inherit autotools gettext texinfo lib_package
+inherit autotools gettext texinfo lib_package ptest
 
 # Needed for dbm python module
 EXTRA_OECONF = "-enable-libgdbm-compat"
@@ -28,6 +31,12 @@ do_install_append () {
     ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
 }
 
+RDEPENDS_${PN}-ptest += "diffutils"
+
+do_compile_ptest() {
+    oe_runmake -C tests buildtests
+}
+
 PACKAGES =+ "${PN}-compat \
             "
 FILES_${PN}-compat = "${libdir}/libgdbm_compat${SOLIBS} \
-- 
1.7.10.4


