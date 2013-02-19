Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U7nIN-0000Kc-2A
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 14:31:43 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 19 Feb 2013 14:14:48 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id EBE81291D52;
	Tue, 19 Feb 2013 14:14:17 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 14:14:03 +0100
Message-ID: <1361279644-17675-8-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1361279644-17675-1-git-send-email-bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 7/8] openssl: Add ptest
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
X-List-Received-Date: Tue, 19 Feb 2013 13:31:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 .../openssl/openssl-1.0.0j/Makefiles-ptest.patch   |   74 ++++++++++++++++=
++++
 .../openssl/openssl-1.0.0j/run-ptest               |    2 +
 meta/recipes-connectivity/openssl/openssl.inc      |   19 +++++-
 .../recipes-connectivity/openssl/openssl_1.0.0j.bb |    2 +
 4 files changed, 96 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/Makefi=
les-ptest.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/run-pt=
est

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/Makefiles-pte=
st.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/Makefiles-ptest=
.patch
new file mode 100644
index 0000000..e65f17b
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.0j/Makefiles-ptest.patc=
h
@@ -0,0 +1,74 @@
+Add 'buildtest' and 'runtest' targets to Makefile, to build and run tests
+cross-compiled.
+
+Signed-off-by: Anders Roxell <anders.roxell@enea.com>
+Upstream-Status: Pending
+---
+diff -uNr a/Makefile b/Makefile
+--- a/Makefile.org	2012-05-10 17:06:02.000000000 +0200
++++ b/Makefile.org	2012-10-27 00:05:55.359424024 +0200
+@@ -411,8 +411,16 @@
+ test:   tests
+=20
+ tests: rehash
++	$(MAKE) buildtest
++	$(MAKE) runtest
++
++buildtest:
++	@(cd test && \
++	$(CLEARENV) && $(MAKE) -e $(BUILDENV) TOP=3D.. TESTS=3D'$(TESTS)' OPENSS=
L_DEBUG_MEMORY=3Don OPENSSL_CONF=3D../apps/openssl.cnf exe apps);
++
++runtest:
+ 	@(cd test && echo "testing..." && \
+-	$(CLEARENV) && $(MAKE) -e $(BUILDENV) TOP=3D.. TESTS=3D'$(TESTS)' OPENSS=
L_DEBUG_MEMORY=3Don OPENSSL_CONF=3D../apps/openssl.cnf tests );
++	$(CLEARENV) && $(MAKE) -e $(BUILDENV) TOP=3D.. TESTS=3D'$(TESTS)' OPENSS=
L_DEBUG_MEMORY=3Don OPENSSL_CONF=3D../apps/openssl.cnf alltests );
+ 	OPENSSL_CONF=3Dapps/openssl.cnf util/opensslwrap.sh version -a
+=20
+ report:
+diff --git a/test/Makefile b/test/Makefile
+index 3912f82..1696767 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -128,7 +128,7 @@ tests:	exe apps $(TESTS)
+ apps:
+ 	@(cd ..; $(MAKE) DIRS=3Dapps all)
+=20
+-alltests: \
++all-tests=3D \
+ 	test_des test_idea test_sha test_md4 test_md5 test_hmac \
+ 	test_md2 test_mdc2 test_wp \
+ 	test_rmd test_rc2 test_rc4 test_rc5 test_bf test_cast test_aes \
+@@ -138,6 +138,11 @@ alltests: \
+ 	test_ss test_ca test_engine test_evp test_ssl test_tsa test_ige \
+ 	test_jpake test_cms
+=20
++alltests:
++	@(for i in $(all-tests); do \
++	( $(MAKE) $$i && echo "PASS: $$i" ) || echo "FAIL: $$i"; \
++	done)
++
+ test_evp:
+ 	../util/shlib_wrap.sh ./$(EVPTEST) evptests.txt
+=20
+@@ -203,7 +208,7 @@ test_x509:
+ 	echo test second x509v3 certificate
+ 	sh ./tx509 v3-cert2.pem 2>/dev/null
+=20
+-test_rsa: $(RSATEST)$(EXE_EXT)
++test_rsa:
+ 	@sh ./trsa 2>/dev/null
+ 	../util/shlib_wrap.sh ./$(RSATEST)
+=20
+@@ -298,11 +303,11 @@ test_tsa:
+ 	  sh ./testtsa; \
+ 	fi
+=20
+-test_ige: $(IGETEST)$(EXE_EXT)
++test_ige:
+ 	@echo "Test IGE mode"
+ 	../util/shlib_wrap.sh ./$(IGETEST)
+=20
+-test_jpake: $(JPAKETEST)$(EXE_EXT)
++test_jpake:
+ 	@echo "Test JPAKE"
+ 	../util/shlib_wrap.sh ./$(JPAKETEST)
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/run-ptest b/m=
eta/recipes-connectivity/openssl/openssl-1.0.0j/run-ptest
new file mode 100644
index 0000000..3b20fce
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.0j/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -k runtest
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-c=
onnectivity/openssl/openssl.inc
index e1e7b65..62acf95 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -33,7 +33,7 @@ export DIRS =3D "crypto ssl apps"
 export EX_LIBS =3D "-lgcc -ldl"
 export AS =3D "${CC} -c"
=20
-inherit pkgconfig siteinfo
+inherit pkgconfig siteinfo ptest
=20
 PACKAGES =3D+ "libcrypto libssl ${PN}-misc"
 FILES_libcrypto =3D "${base_libdir}/libcrypto${SOLIBS}"
@@ -42,6 +42,8 @@ FILES_${PN} =3D+ " ${libdir}/ssl/*"
 FILES_${PN}-misc =3D "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
 FILES_${PN}-dev +=3D "${base_libdir}/libcrypto${SOLIBSDEV}"
=20
+RDEPENDS_${PN}-ptest =3D "openssl-misc"
+
 do_configure_prepend_darwin () {
 	sed -i -e '/version-script=3Dopenssl\.ld/d' Configure
 }
@@ -125,6 +127,9 @@ do_configure () {
=20
 do_compile () {
 	oe_runmake
+	if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ] ; then
+	    oe_runmake buildtest
+	fi
 }
=20
 do_install () {
@@ -144,6 +149,18 @@ do_install () {
 	cp --dereference -R include/openssl ${D}${includedir}
 	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
=20
+        if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+            ptest_do_install
+            cp -r Makefile test ${D}${PTEST_PATH}
+            mkdir -p ${D}${PTEST_PATH}/apps
+            ln -s /usr/lib/ssl/misc/CA.sh  ${D}${PTEST_PATH}/apps
+            ln -s /usr/lib/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
+            ln -s /usr/bin/openssl         ${D}${PTEST_PATH}/apps
+            cp apps/server2.pem            ${D}${PTEST_PATH}/apps
+            mkdir -p ${D}${PTEST_PATH}/util
+            install util/opensslwrap.sh    ${D}${PTEST_PATH}/util
+            install util/shlib_wrap.sh     ${D}${PTEST_PATH}/util
+        fi
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.0.0j.bb
index 8c0166a..7b2d167 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
@@ -29,7 +29,9 @@ SRC_URI +=3D "file://configure-targets.patch \
             file://debian/no-symbolic.patch \
             file://debian/debian-targets.patch \
             file://openssl_fix_for_x32.patch \
+            file://Makefiles-ptest.patch \
             file://find.pl \
+            file://run-ptest \
            "
=20
 SRC_URI[md5sum] =3D "cbe4ac0d8f598680f68a951e04b0996b"
--=20
1.7.5.4



