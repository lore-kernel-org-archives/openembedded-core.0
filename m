Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E8AC41513
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 11:07:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8476.1718190421668671304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 04:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E89B916F2
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 04:07:25 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1879C3F73B
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 04:07:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] curl: rewrite ptest installation
Date: Wed, 12 Jun 2024 11:06:59 +0000
Message-Id: <20240612110659.2750133-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240612110659.2750133-1-ross.burton@arm.com>
References: <20240612110659.2750133-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 11:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200571

The latest libtool upgrade appears to have resulted in intermediate files
containing build paths. This wouldn't normally be a problem but the
curl-ptest package is populated by copying ${B}/tests/ which includes all
of the intermediate objects, so this causes buildpath warnings.

Rewrite the ptest installation to install just the pieces we need: the
test harness, utility scripts, and the test data.  We do not need the
libcurl unit tests nor the HTTP server tests, as we don't run those.

Remove all of the explicitly disabled tests, as many of these were for
tests that run curl-config or scan the source code, neither of which are
available at ptest time.  Instead use keyword exclusions to skip them.

Tell the test runner to use the system curl instead of symlinking in the
binary.

Don't copy curl-config, skipping these minor tests is acceptable.

Remove the RDEPENDS on bash, nothing needs this now we're not shipping a
build tree.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl/disable-tests | 42 --------------------
 meta/recipes-support/curl/curl/run-ptest     |  8 +++-
 meta/recipes-support/curl/curl_8.8.0.bb      | 33 ++++++++-------
 3 files changed, 26 insertions(+), 57 deletions(-)

diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-=
support/curl/curl/disable-tests
index c4aa7783a17..e69de29bb2d 100644
--- a/meta/recipes-support/curl/curl/disable-tests
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -1,42 +0,0 @@
-# Intermittently fails e.g. https://autobuilder.yocto.io/pub/non-release=
/20231220-28/testresults/qemux86-64-ptest/curl.log
-# https://autobuilder.yocto.io/pub/non-release/20231220-27/testresults/q=
emux86-64-ptest/curl.log
-337
-# These CRL test (alt-avc) are failing
-356
-412
-413
-# These CRL tests are scanning docs
-971
-# Intermittently hangs e.g http://autobuilder.yocto.io/pub/non-release/2=
0231228-18/testresults/qemux86-64-ptest/curl.log
-1091
-# Intermittently hangs e.g https://autobuilder.yocto.io/pub/non-release/=
20231220-27/testresults/qemux86-64-ptest/curl.log
-1096
-# These CRL tests are scanning docs
-1119
-1132
-1135
-1478
-# These CRL tests are scanning headers
-1167
-1477
-# These CRL tests are scanning man pages
-1139
-1140
-1173
-1177
-# This CRL test is looking for m4 files
-1165
-# This CRL test is looking for src files
-1185
-# This test is scanning the source tree
-1222
-# These CRL tests need --libcurl option to be enabled
-1279
-1400
-1401
-1402
-1403
-1404
-1405
-1465
-1481
diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-supp=
ort/curl/curl/run-ptest
index 579b3f4587e..597cf92dbbd 100644
--- a/meta/recipes-support/curl/curl/run-ptest
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -10,4 +10,10 @@ cd tests
=20
 # Don't run the flaky or timing dependent tests
 # Until https://github.com/curl/curl/issues/13350 is resolved, don't run=
 FTP tests
-./runtests.pl -a -n -am -j4 -p !flaky !timing-dependent !FTP
+# We don't enable --libcurl
+# Don't assume curl-config exists
+# We don't have the source tree
+./runtests.pl \
+    -a -c curl -vc curl -n -am -j4 -p \
+    !flaky !timing-dependent !FTP \
+    !--libcurl !curl-config !source\ analysis !checksrc !documentation
diff --git a/meta/recipes-support/curl/curl_8.8.0.bb b/meta/recipes-suppo=
rt/curl/curl_8.8.0.bb
index b9325941595..2b058e4e82d 100644
--- a/meta/recipes-support/curl/curl_8.8.0.bb
+++ b/meta/recipes-support/curl/curl_8.8.0.bb
@@ -101,23 +101,28 @@ do_compile_ptest() {
 }
=20
 do_install_ptest() {
-	cat  ${UNPACKDIR}/disable-tests >> ${S}/tests/data/DISABLED
-	rm -f ${B}/tests/configurehelp.pm
-	cp -rf ${B}/tests ${D}${PTEST_PATH}
-        rm -f ${D}${PTEST_PATH}/tests/libtest/.libs/libhostname.la
-        rm -f ${D}${PTEST_PATH}/tests/libtest/libhostname.la
-        mv ${D}${PTEST_PATH}/tests/libtest/.libs/* ${D}${PTEST_PATH}/tes=
ts/libtest/
-        mv ${D}${PTEST_PATH}/tests/libtest/libhostname.so ${D}${PTEST_PA=
TH}/tests/libtest/.libs/
-        mv ${D}${PTEST_PATH}/tests/http/clients/.libs/* ${D}${PTEST_PATH=
}/tests/http/clients/
-	cp -rf ${S}/tests ${D}${PTEST_PATH}
-	find ${D}${PTEST_PATH}/ -type f -name Makefile.am -o -name Makefile.in =
-o -name Makefile -delete
-	install -d ${D}${PTEST_PATH}/src
-	ln -sf ${bindir}/curl   ${D}${PTEST_PATH}/src/curl
-	cp -rf ${D}${bindir}/curl-config ${D}${PTEST_PATH}
+	install -d ${D}${PTEST_PATH}/tests
+	cp ${S}/tests/*.p[lmy] ${D}${PTEST_PATH}/tests/
+
+	install -d ${D}${PTEST_PATH}/tests/libtest
+	for name in $(makefile-getvar ${B}/tests/libtest/Makefile noinst_PROGRA=
MS noinst_LTLIBRARIES); do
+		${B}/libtool --mode=3Dinstall install ${B}/tests/libtest/$name ${D}${P=
TEST_PATH}/tests/libtest
+	done
+	cp ${S}/tests/libtest/notexists.pl ${D}${PTEST_PATH}/tests/libtest
+	rm -f ${D}${PTEST_PATH}/tests/libtest/libhostname.la
+
+	install -d ${D}${PTEST_PATH}/tests/server
+	for name in $(makefile-getvar ${B}/tests/server/Makefile noinst_PROGRAM=
S); do
+		${B}/libtool --mode=3Dinstall install ${B}/tests/server/$name ${D}${PT=
EST_PATH}/tests/server
+	done
+
+	cp -r ${S}/tests/data ${D}${PTEST_PATH}/tests/
+
+	# More tests that we disable for automated QA as they're not reliable
+	cat ${UNPACKDIR}/disable-tests >>${D}${PTEST_PATH}/tests/data/DISABLED
 }
=20
 RDEPENDS:${PN}-ptest +=3D " \
-	bash \
 	locale-base-en-us \
 	perl-module-b \
 	perl-module-base \
--=20
2.34.1


