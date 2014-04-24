Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 291A465D0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 17:28:27 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 24 Apr 2014 19:28:26 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 8B4B528C69A;
	Thu, 24 Apr 2014 19:28:26 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 19:28:25 +0200
Message-ID: <1398360505-45987-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] openssl: enable ptest support
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
X-List-Received-Date: Thu, 24 Apr 2014 17:28:30 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Install openssl test suite and run it as ptest.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-connectivity/openssl/openssl.inc      |   19 ++++-
 .../openssl/openssl/Makefiles-ptest.patch          |   75 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl/run-ptest |    2 +
 .../recipes-connectivity/openssl/openssl_1.0.1g.bb |    2 +
 4 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/Makefiles-ptest.patch
 create mode 100755 meta/recipes-connectivity/openssl/openssl/run-ptest

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index ee02fb7..6ef7e3e 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -30,7 +30,7 @@ export DIRS = "crypto ssl apps"
 export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
 
-inherit pkgconfig siteinfo multilib_header
+inherit pkgconfig siteinfo multilib_header ptest
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
 FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
@@ -47,6 +47,7 @@ FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
 FILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
 CONFFILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
 RRECOMMENDS_libcrypto += "openssl-conf"
+RDEPENDS_${PN}-ptest += "${PN}-misc make"
 
 do_configure_prepend_darwin () {
 	sed -i -e '/version-script=openssl\.ld/d' Configure
@@ -140,6 +141,10 @@ do_compile () {
 	oe_runmake
 }
 
+do_compile_ptest () {
+	oe_runmake buildtest
+}
+
 do_install () {
 	oe_runmake INSTALL_PREFIX="${D}" MANDIR="${mandir}" install
 
@@ -169,5 +174,17 @@ do_install () {
 	fi
 }
 
+do_install_ptest () {
+	cp -r Makefile test ${D}${PTEST_PATH}
+	mkdir -p ${D}${PTEST_PATH}/apps
+	ln -sf /usr/lib/ssl/misc/CA.sh  ${D}${PTEST_PATH}/apps
+	ln -sf /usr/lib/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
+	ln -sf /usr/bin/openssl         ${D}${PTEST_PATH}/apps
+	cp apps/server2.pem             ${D}${PTEST_PATH}/apps
+	mkdir -p ${D}${PTEST_PATH}/util
+	install util/opensslwrap.sh    ${D}${PTEST_PATH}/util
+	install util/shlib_wrap.sh     ${D}${PTEST_PATH}/util
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-connectivity/openssl/openssl/Makefiles-ptest.patch b/meta/recipes-connectivity/openssl/openssl/Makefiles-ptest.patch
new file mode 100644
index 0000000..ac53a91
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/Makefiles-ptest.patch
@@ -0,0 +1,75 @@
+Add 'buildtest' and 'runtest' targets to Makefile, to build and run tests
+cross-compiled.
+
+Signed-off-by: Anders Roxell <anders.roxell@enea.com>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+Upstream-Status: Pending
+---
+diff -uNr a/Makefile b/Makefile
+--- a/Makefile.org	2012-05-10 17:06:02.000000000 +0200
++++ b/Makefile.org	2012-10-27 00:05:55.359424024 +0200
+@@ -411,8 +411,16 @@
+ test:   tests
+ 
+ tests: rehash
++	$(MAKE) buildtest
++	$(MAKE) runtest
++
++buildtest:
++	@(cd test && \
++	$(CLEARENV) && $(MAKE) -e $(BUILDENV) TOP=.. TESTS='$(TESTS)' OPENSSL_DEBUG_MEMORY=on OPENSSL_CONF=../apps/openssl.cnf exe apps);
++
++runtest:
+ 	@(cd test && echo "testing..." && \
+-	$(CLEARENV) && $(MAKE) -e $(BUILDENV) TOP=.. TESTS='$(TESTS)' OPENSSL_DEBUG_MEMORY=on OPENSSL_CONF=../apps/openssl.cnf tests );
++	$(CLEARENV) && $(MAKE) -e $(BUILDENV) TOP=.. TESTS='$(TESTS)' OPENSSL_DEBUG_MEMORY=on OPENSSL_CONF=../apps/openssl.cnf alltests );
+ 	OPENSSL_CONF=apps/openssl.cnf util/opensslwrap.sh version -a
+ 
+ report:
+diff --git a/test/Makefile b/test/Makefile
+index 3912f82..1696767 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -128,7 +128,7 @@ tests:	exe apps $(TESTS)
+ apps:
+ 	@(cd ..; $(MAKE) DIRS=apps all)
+ 
+-alltests: \
++all-tests= \
+ 	test_des test_idea test_sha test_md4 test_md5 test_hmac \
+ 	test_md2 test_mdc2 test_wp \
+ 	test_rmd test_rc2 test_rc4 test_rc5 test_bf test_cast test_aes \
+@@ -138,6 +138,11 @@ alltests: \
+ 	test_ss test_ca test_engine test_evp test_ssl test_tsa test_ige \
+ 	test_jpake test_cms
+ 
++alltests:
++	@(for i in $(all-tests); do \
++	( $(MAKE) $$i && echo "PASS: $$i" ) || echo "FAIL: $$i"; \
++	done)
++
+ test_evp:
+ 	../util/shlib_wrap.sh ./$(EVPTEST) evptests.txt
+ 
+@@ -203,7 +208,7 @@ test_x509:
+ 	echo test second x509v3 certificate
+ 	sh ./tx509 v3-cert2.pem 2>/dev/null
+ 
+-test_rsa: $(RSATEST)$(EXE_EXT)
++test_rsa:
+ 	@sh ./trsa 2>/dev/null
+ 	../util/shlib_wrap.sh ./$(RSATEST)
+ 
+@@ -298,11 +303,11 @@ test_tsa:
+ 	  sh ./testtsa; \
+ 	fi
+ 
+-test_ige: $(IGETEST)$(EXE_EXT)
++test_ige:
+ 	@echo "Test IGE mode"
+ 	../util/shlib_wrap.sh ./$(IGETEST)
+ 
+-test_jpake: $(JPAKETEST)$(EXE_EXT)
++test_jpake:
+ 	@echo "Test JPAKE"
+ 	../util/shlib_wrap.sh ./$(JPAKETEST)
diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
new file mode 100755
index 0000000..3b20fce
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -k runtest
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
index f3c20e8..5ca29d0 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
@@ -34,6 +34,8 @@ SRC_URI += "file://configure-targets.patch \
             file://initial-aarch64-bits.patch \
             file://find.pl \
             file://openssl-fix-des.pod-error.patch \
+            file://Makefiles-ptest.patch \
+            file://run-ptest \
            "
 
 SRC_URI[md5sum] = "de62b43dfcd858e66a74bee1c834e959"
-- 
1.7.10.4


