Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5F32877026
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 19:28:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2016 12:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,474,1464678000"; d="scan'208";a="1009230215"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2016 12:28:03 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 11:25:20 +0000
Message-Id: <89d7425f80356a4e3a8419f05fe16b3e071c48ac.1470396290.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1470396290.git.mariano.lopez@linux.intel.com>
References: <cover.1470396290.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] Fix use of tar's --exclude option for tar >= 1.29
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
X-List-Received-Date: Fri, 05 Aug 2016 19:28:07 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Starting from tar 1.29 the --exclude option won't work
anymore if is not used before the path. There are some
recipes that copy the ptest using tar and --exclude
option. This fixes these for OE-Core recipes.

[YOCTO #9763]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/recipes-devtools/quilt/quilt.inc                   | 8 ++++----
 meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch | 2 +-
 meta/recipes-support/attr/acl.inc                       | 2 +-
 meta/recipes-support/attr/attr.inc                      | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 4e393c4..512b798 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -48,10 +48,10 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
-	tar -cf - bin/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	tar -cf - compat/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	tar -cf - quilt/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	tar -cf - test/ --exclude mail.test --exclude delete.test | ( cd ${D}${PTEST_PATH} && tar -xf - && chmod 777 test)
+	tar -c --exclude=\*.in bin/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	tar -c --exclude=\*.in compat/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	tar -c --exclude=\*.in quilt/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	tar -c --exclude=mail.test --exclude=delete.test test/ | ( cd ${D}${PTEST_PATH} && tar -xf - && chmod 777 test)
 	cp ${WORKDIR}/Makefile ${D}${PTEST_PATH}
 	cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
 }
diff --git a/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch b/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch
index 105e8b7..0293900 100644
--- a/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch
+++ b/meta/recipes-extended/sed/sed-4.2.2/sed-add-ptest.patch
@@ -54,7 +54,7 @@ index d80e72c..b05f01e 100644
  # dummy targets for $(TESTS) so that make does not complain.
  
 +install-ptest:
-+	cd $(BUILDDIR); tar -cf - $(TESTDIR) --exclude *.o | ( cd $(DESTDIR) && tar -xf - )
++	cd $(BUILDDIR); tar -c --exclude=*.o $(TESTDIR) | ( cd $(DESTDIR) && tar -xf - )
 +	for i in $(EXTRA_DIST) tst-regex2.c; do install $(srcdir)/$$i $(DESTDIR)/$(TESTDIR); done
 +	sed -e 's/^Makefile:/_Makefile:/' -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/bash/sh/' -i $(DESTDIR)/$(TESTDIR)/Makefile
 +	for i in `grep -rl "../sed/sed" $(DESTDIR)/$(TESTDIR)`; do sed -e 's/..\/sed\/sed/sed/' -i $$i; done
diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
index aebebfd..37a0218 100644
--- a/meta/recipes-support/attr/acl.inc
+++ b/meta/recipes-support/attr/acl.inc
@@ -34,7 +34,7 @@ do_install_append() {
 inherit ptest
 
 do_install_ptest() {
-	tar -cf - test/ --exclude nfs | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	tar -c --exclude=nfs test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
 	mkdir ${D}${PTEST_PATH}/include
 	cp ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
 }
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 6860978..a1b0829 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -26,7 +26,7 @@ do_install_append() {
 inherit ptest
 
 do_install_ptest() {
-	tar -cf - test/ --exclude ext | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	tar -c --exclude=ext test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
 	mkdir ${D}${PTEST_PATH}/include
 	for i in builddefs buildmacros buildrules; \
 	  do cp ${S}/include/$i ${D}${PTEST_PATH}/include/; \
-- 
2.6.6


