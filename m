Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 459597830D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 765501844F;
	Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id r_DfeSUfwgni; Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id ACE6F18430;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A3001E096;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EDAE1E094;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 62DBF2198;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLf5R030192;
	Tue, 29 Aug 2017 23:21:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLf0j030191;
	Tue, 29 Aug 2017 23:21:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:00 +0200
Message-Id: <38807672b40c9ed9ca1021410139f351f51f6c2d.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 04/25] libxml2: Make ptest run the Python tests if Python support is enabled
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:44 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Since we go through the trouble of copying the Python tests, we may as
well actually run them...

This also avoids the following QA issue:

  ERROR: libxml2-2.9.4-r0 do_package_qa: QA Issue:
  /usr/lib/libxml2/ptest/python/tests/push.py contained in package
  libxml2-ptest requires /usr/bin/python, but no providers found in
  RDEPENDS_libxml2-ptest? [file-rdeps]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...run-the-python-tests-if-python-is-enabled.patch | 99 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          | 11 ++-
 2 files changed, 108 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch

diff --git a/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch b/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
new file mode 100644
index 0000000000..d1ad55116a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
@@ -0,0 +1,99 @@
+From 78dbd4c09d617a9cb730d796f94ee4d93840d3cc Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Fri, 9 Jun 2017 17:50:46 +0200
+Subject: [PATCH] Make ptest run the python tests if python is enabled
+
+One of the tests (tstLastError.py) needed a minor correction. It might
+be due to the fact that the tests are forced to run with Python 3.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ Makefile.am                  |  2 +-
+ python/Makefile.am           |  9 +++++++++
+ python/tests/Makefile.am     | 12 ++++++++++--
+ python/tests/tstLastError.py |  2 +-
+ 4 files changed, 21 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e181ee0..7960e7d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -207,9 +207,9 @@ install-ptest:
+ 	install $(noinst_PROGRAMS) $(DESTDIR))
+ 	cp -r $(srcdir)/test $(DESTDIR)
+ 	cp -r $(srcdir)/result $(DESTDIR)
+-	cp -r $(srcdir)/python $(DESTDIR)
+ 	cp Makefile $(DESTDIR)
+ 	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
++	$(MAKE) -C python install-ptest
+ 
+ runtests:
+ 	[ -d test   ] || $(LN_S) $(srcdir)/test   .
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 34aed96..ba3ec6a 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -48,7 +48,16 @@ GENERATED = libxml2class.py libxml2class.txt $(BUILT_SOURCES)
+ 
+ $(GENERATED): $(srcdir)/generator.py $(API_DESC)
+ 	$(PYTHON) $(srcdir)/generator.py $(srcdir)
++
++install-ptest:
++	cp -r $(srcdir) $(DESTDIR)
++	sed -e 's|^Makefile:|_Makefile:|' \
++	    -e 's|^\(tests test:\) all|\1|' Makefile >$(DESTDIR)/python/Makefile
++	$(MAKE) -C tests install-ptest
++else
++install-ptest:
+ endif
+ 
++.PHONY: tests test
+ tests test: all
+ 	cd tests && $(MAKE) tests
+diff --git a/python/tests/Makefile.am b/python/tests/Makefile.am
+index 95ebead..418e21e 100644
+--- a/python/tests/Makefile.am
++++ b/python/tests/Makefile.am
+@@ -59,6 +59,11 @@ XMLS=		\
+ CLEANFILES = core tmp.xml *.pyc
+ 
+ if WITH_PYTHON
++install-ptest:
++	cp -r $(srcdir) $(DESTDIR)/python
++	sed -e 's|^Makefile:|_Makefile:|' \
++	    -e 's|^\(srcdir = \).*|\1.|' Makefile >$(DESTDIR)/python/tests/Makefile
++
+ tests: $(PYTESTS)
+ 	@for f in $(XMLS) ; do test -f $$f || $(LN_S) $(srcdir)/$$f . ; done
+ 	@echo "## running Python regression tests"
+@@ -68,8 +73,11 @@ tests: $(PYTESTS)
+ 	   export LD_LIBRARY_PATH; \
+ 	   for test in $(PYTESTS) ; \
+ 	   do log=`$(PYTHON) $(srcdir)/$$test` ; \
+-	   if [ "`echo $$log | grep OK`" = "" ] ; then \
+-	   echo "-- $$test" ; echo "$$log" ; fi ; done)
++	   if [ "`echo $$log | grep OK`" ]; then \
++	   echo "PASS: $$test"; else \
++	   echo "$$log"; echo "FAIL: $$test"; fi; done)
+ else
++install-ptest:
++
+ tests:
+ endif
+diff --git a/python/tests/tstLastError.py b/python/tests/tstLastError.py
+index d5f9be7..3e5bef8 100755
+--- a/python/tests/tstLastError.py
++++ b/python/tests/tstLastError.py
+@@ -25,7 +25,7 @@ class TestCase(unittest.TestCase):
+         when the exception is raised, check the libxml2.lastError for
+         expected values."""
+         # disable the default error handler
+-        libxml2.registerErrorHandler(None,None)
++        libxml2.registerErrorHandler(lambda ctx,str: None,None)
+         try:
+             f(*args)
+         except exc:
+-- 
+2.12.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 4de88d39a4..677d8c9bb5 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -29,7 +29,8 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-CVE-2017-5969.patch \
            file://libxml2-CVE-2017-0663.patch \
            file://CVE-2016-9318.patch \
-          "
+           file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
+           "
 
 SRC_URI[libtar.md5sum] = "ae249165c173b1ff386ee8ad676815f5"
 SRC_URI[libtar.sha256sum] = "ffb911191e509b966deb55de705387f14156e1a56b21824357cdf0053233633c"
@@ -48,7 +49,7 @@ inherit autotools pkgconfig binconfig-disabled ptest
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
-RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
+RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-argparse python3-logging python3-shell python3-signal python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
 
 RDEPENDS_${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
 
@@ -82,6 +83,12 @@ do_configure_prepend () {
 
 do_install_ptest () {
 	cp -r ${WORKDIR}/xmlconf ${D}${PTEST_PATH}
+	if [ "${@bb.utils.filter('PACKAGECONFIG', 'python', d)}" ]; then
+		sed -i -e 's|^\(PYTHON = \).*|\1${USRBINPATH}/${PYTHON_PN}|' \
+		    ${D}${PTEST_PATH}/python/tests/Makefile
+		grep -lrZ '#!/usr/bin/python' ${D}${PTEST_PATH}/python |
+			xargs -0 sed -i -e 's|/usr/bin/python|${USRBINPATH}/${PYTHON_PN}|'
+	fi
 }
 
 do_install_append_class-native () {
-- 
2.12.0


