Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E0FC3DA6F
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 14:48:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16939.1721314116825043107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 07:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD4F91063
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 07:49:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C1773F762
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 07:48:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] openssl: rewrite ptest installation
Date: Thu, 18 Jul 2024 15:48:29 +0100
Message-Id: <20240718144829.2504384-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718144829.2504384-1-ross.burton@arm.com>
References: <20240718144829.2504384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 14:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202228

Rewrite (again) the openssl test suite installation.

Depend on and reuse already installed libraries and modules instead of
installing them twice.

Be more selective when installing from the build tree so we don't install
intermediate .c .d .o files.

This further reduces the size of openssl-dbg from ~120MB to ~18MB.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../openssl/openssl/run-ptest                 | 19 ++++--
 .../openssl/openssl_3.3.1.bb                  | 67 +++++++++----------
 2 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/r=
ecipes-connectivity/openssl/openssl/run-ptest
index c89ec5afa1b..cd29bb14461 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -1,12 +1,19 @@
 #!/bin/sh
=20
-set -e
+set -eu
=20
-# Optional arguments are 'list' to lists all tests, or the test name (ba=
se name
-# ie test_evp, not 03_test_evp.t).
+# Optional arguments are 'list' to lists the tests, or the test name (ba=
se name
+# ie test_evp, not 03_test_evp.t). Without any arguments we run all test=
s.
+
+if test $# -gt 0; then
+    TESTS=3D$*
+else
+    # Skip test_symbol_presence as this is for developers
+    TESTS=3D"alltests -test_symbol_presence"
+fi
=20
 export TOP=3D.
-# OPENSSL_ENGINES is relative from the test binaries
-export OPENSSL_ENGINES=3D../engines
+# Run four jobs in parallel
+export HARNESS_JOBS=3D4
=20
-{ HARNESS_JOBS=3D4 perl ./test/run_tests.pl $* || echo "FAIL: openssl" ;=
 } | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/F=
AIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
+{ perl ./test/run_tests.pl $TESTS || echo "FAIL: openssl" ; } | sed -u -=
r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '=
/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
diff --git a/meta/recipes-connectivity/openssl/openssl_3.3.1.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.3.1.bb
index 36d2f87c265..3bc0153429d 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.3.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.3.1.bb
@@ -191,44 +191,43 @@ do_install:append:class-nativesdk () {
=20
 PTEST_BUILD_HOST_FILES +=3D "configdata.pm"
 PTEST_BUILD_HOST_PATTERN =3D "perl_version =3D"
-do_install_ptest () {
-	install -d ${D}${PTEST_PATH}/test
-	install -m755 ${B}/test/p_test.so ${D}${PTEST_PATH}/test
-	install -m755 ${B}/test/p_minimal.so ${D}${PTEST_PATH}/test
-	install -m755 ${B}/test/provider_internal_test.cnf ${D}${PTEST_PATH}/te=
st
-
-	# Prune the build tree
-	rm -f ${B}/fuzz/*.* ${B}/test/*.*
-
-	cp ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
-	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/configdata.pm
-	cp -r ${S}/external ${B}/test ${S}/test ${B}/fuzz ${S}/util ${B}/util $=
{D}${PTEST_PATH}
-
-	# For test_shlibload
-	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/
-	ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/
+do_install_ptest() {
+	install -m644 ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
+	cp -rf ${S}/Configurations ${S}/external ${D}${PTEST_PATH}/
=20
 	install -d ${D}${PTEST_PATH}/apps
 	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
-	install -m644 ${S}/apps/*.pem ${S}/apps/*.srl ${S}/apps/openssl.cnf ${D=
}${PTEST_PATH}/apps
-	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
-
-	install -d ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/loader_attic.so ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
-
-	install -d ${D}${PTEST_PATH}/providers
-	install -m755 ${B}/providers/legacy.so ${D}${PTEST_PATH}/providers
=20
-	install -d ${D}${PTEST_PATH}/Configurations
-	cp -rf ${S}/Configurations/* ${D}${PTEST_PATH}/Configurations/
+	cd ${S}
+	find test/certs test/ct test/d2i-tests test/recipes test/ocsp-tests tes=
t/ssl-tests test/smime-certs -type f -exec install -m644 -D {} ${D}${PTES=
T_PATH}/{} \;
+	find apps test -name \*.cnf -exec install -m644 -D {} ${D}${PTEST_PATH}=
/{} \;
+	find apps test -name \*.der -exec install -m644 -D {} ${D}${PTEST_PATH}=
/{} \;
+	find apps test -name \*.pem -exec install -m644 -D {} ${D}${PTEST_PATH}=
/{} \;
+	find util -name \*.p[lm] -exec install -m644 -D {} ${D}${PTEST_PATH}/{}=
 \;
+
+	cd ${B}
+	# Everything but .? (.o and .d)
+	find test -type f -name \*[^.]? -exec install -m755 -D {} ${D}${PTEST_P=
ATH}/{} \;
+	find apps test -name \*.cnf -exec install -m644 -D {} ${D}${PTEST_PATH}=
/{} \;
+	find apps test -name \*.pem -exec install -m644 -D {} ${D}${PTEST_PATH}=
/{} \;
+	find apps test -name \*.srl -exec install -m644 -D {} ${D}${PTEST_PATH}=
/{} \;
+	install -m755 ${B}/util/*wrap.* ${D}${PTEST_PATH}/util/
+
+	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps/
+	install -m755 ${S}/test/*.pl ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/shibboleth.pfx ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/*.bin ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/dane*.in ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/smcont*.txt ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/ssl_test.tmpl ${D}${PTEST_PATH}/test/
+
+	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/configdata.pm ${D}${P=
TEST_PATH}/util/wrap.pl
=20
-	# seems to be needed with perl 5.32.1
-	install -d ${D}${PTEST_PATH}/util/perl/recipes
-	cp ${D}${PTEST_PATH}/test/recipes/tconversion.pl ${D}${PTEST_PATH}/util=
/perl/recipes/
-
-	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/util/wrap.pl
+	install -d ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines/
+	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines/
+	ln -s ${libdir}/engines-3/loader_attic.so ${D}${PTEST_PATH}/engines/
+	ln -s ${libdir}/ossl-modules/ ${D}${PTEST_PATH}/providers
 }
=20
 # Add the openssl.cnf file to the openssl-conf package. Make the libcryp=
to
@@ -255,7 +254,7 @@ CONFFILES:openssl-conf =3D "${sysconfdir}/ssl/openssl=
.cnf"
=20
 RRECOMMENDS:libcrypto +=3D "openssl-conf ${PN}-ossl-module-legacy"
 RDEPENDS:${PN}-misc =3D "perl"
-RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed"
+RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed openss=
l-engines openssl-ossl-module-legacy"
=20
 RDEPENDS:${PN}-bin +=3D "openssl-conf"
=20
--=20
2.34.1


