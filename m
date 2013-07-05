Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id BE7656AF13
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:23:06 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r657N4WW020384; 
	Fri, 5 Jul 2013 02:23:06 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 12:23:18 +0500
Message-Id: <1373008998-24899-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] bash: Add ptest
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
X-List-Received-Date: Fri, 05 Jul 2013 07:23:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

ptest support was already added for v4.2 but for the distros
using GPLv2 version of bash (3.2.48) this update is required.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../bash/bash-3.2.48/build-tests.patch             |   44 ++++++++++++++++++++
 meta/recipes-extended/bash/bash-3.2.48/run-ptest   |    2 +
 .../bash/bash-3.2.48/test-output.patch             |   25 +++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |    3 ++
 4 files changed, 74 insertions(+)

diff --git a/meta/recipes-extended/bash/bash-3.2.48/build-tests.patch b/meta/recipes-extended/bash/bash-3.2.48/build-tests.patch
new file mode 100644
index 0000000..91341ee
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/build-tests.patch
@@ -0,0 +1,44 @@
+Add 'ptest' target to Makefile, to run tests without checking dependencies.
+
+Signed-off-by: Anders Roxell <anders.roxell@enea.com>
+Upstream-Status: Pending
+---
+diff -dNaur bash-3.2.48/Makefile.in.orig bash-3.2.48/Makefile.in
+--- bash-3.2.48/Makefile.in.orig	2006-08-17 23:03:35.000000000 +0500
++++ bash-3.2.48/Makefile.in	2013-07-02 20:20:07.512709327 +0500
+@@ -803,17 +803,31 @@
+ 	fi
+ 
+ recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
+-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)recho.c ${LIBS_FOR_BUILD}
++	@$(CC) $(CCFLAGS) -o $@ $<
+ 
+ zecho$(EXEEXT):		$(SUPPORT_SRC)zecho.c
+-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)zecho.c ${LIBS_FOR_BUILD}
++	@$(CC) $(CCFLAGS) -o $@ $<
+ 
+ printenv$(EXEEXT):	$(SUPPORT_SRC)printenv.c
+-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)printenv.c ${LIBS_FOR_BUILD}
++	@$(CC) $(CCFLAGS) -o $@ $<
+ 
+-test tests check:	force $(Program) $(TESTS_SUPPORT)
++test tests check:
++	@$(MAKE) install-test
++	@$(MAKE) runtest
++
++install-test: buildtest
++ifeq ($(origin INSTALL_TEST_DIR), undefined)
+ 	@-test -d tests || mkdir tests
+ 	@cp $(TESTS_SUPPORT) tests
++else
++	@-test -d $(INSTALL_TEST_DIR) || mkdir -p $(INSTALL_TEST_DIR)
++	@cp -r $(srcdir)/tests/* $(INSTALL_TEST_DIR)/
++	@cp $(TESTS_SUPPORT) $(INSTALL_TEST_DIR)
++endif
++
++buildtest: force $(Program) $(TESTS_SUPPORT)
++
++runtest:
+ 	@( cd $(srcdir)/tests && \
+ 		PATH=$(BUILD_DIR)/tests:$$PATH THIS_SH=$(THIS_SH) $(SHELL) ${TESTSCRIPT} )
+ 
diff --git a/meta/recipes-extended/bash/bash-3.2.48/run-ptest b/meta/recipes-extended/bash/bash-3.2.48/run-ptest
new file mode 100644
index 0000000..8dd3b99
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -k THIS_SH=/bin/bash BUILD_DIR=. runtest
diff --git a/meta/recipes-extended/bash/bash-3.2.48/test-output.patch b/meta/recipes-extended/bash/bash-3.2.48/test-output.patch
new file mode 100644
index 0000000..2b09b7d
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/test-output.patch
@@ -0,0 +1,25 @@
+Add FAIL/PASS output to test output.
+
+Signed-off-by: Björn Stenberg <bjst@enea.com>
+Upstream-Status: Pending
+---
+diff -uNr a/tests/run-all b/tests/run-all
+--- a/tests/run-all	1999-10-08 17:07:46.000000000 +0200
++++ b/tests/run-all	2012-10-27 21:04:18.663331887 +0200
+@@ -22,7 +22,15 @@
+ 	case $x in
+ 	$0|run-minimal|run-gprof)	;;
+ 	*.orig|*~) ;;
+-	*)	echo $x ; sh $x ;;
++    *)  echo $x
++         output=`sh $x`
++         if [ -n "$output" ]; then
++             echo "$output"
++             echo "FAIL: $x"
++         else
++             echo "PASS: $x"
++         fi
++         ;;
+ 	esac
+ done
+ 
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 4e6f0f3..fe04b28 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -10,6 +10,9 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=patch002 \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch003 \
            file://mkbuiltins_have_stringize.patch \
+           file://build-tests.patch \
+           file://test-output.patch \
+           file://run-ptest \
           "
 
 SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
-- 
1.7.9.5


