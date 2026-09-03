Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08EFC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:12:39 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3344.1788426756829165885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.53 with ESMTP; 3 Sep 2026 18:12:34 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.125 with ESMTP; 3 Sep 2026 18:12:34 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH v3] openssl: use nonarch_libdir for openssldir
Date: Thu,  3 Sep 2026 18:12:32 +0900
Message-ID: <20260903091232.71708-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 09:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245019

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Set openssldir to ${nonarch_libdir}/ssl-3 instead of ${libdir}/ssl-3
as the contents of this directory do not vary between non-multilib and
multilib builds.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 .../openssl/openssl_4.0.1.bb                  | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_4.0.1.bb b/meta/recipes-connectivity/openssl/openssl_4.0.1.bb
index a669de1b22..3c154fce55 100644
--- a/meta/recipes-connectivity/openssl/openssl_4.0.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_4.0.1.bb
@@ -150,7 +150,7 @@ do_configure () {
 	PERLEXTERNAL="$(realpath ${S}/external/perl/Text-Template-*/lib)"
 	test -d "$PERLEXTERNAL" || bberror "PERLEXTERNAL '$PERLEXTERNAL' not found!"
 	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="$PERLEXTERNAL" \
-	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=${prefix} --openssldir=${libdir}/ssl-3 --libdir=${baselib} $target
+	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=${prefix} --openssldir=${nonarch_libdir}/ssl-3 --libdir=${baselib} $target
 	perl ${B}/configdata.pm --dump
 }
 
@@ -172,20 +172,20 @@ do_install () {
 	# Create SSL structure for packages such as ca-certificates which
 	# contain hard-coded paths to /etc/ssl. Debian does the same.
 	install -d ${D}${sysconfdir}/ssl
-	mv ${D}${libdir}/ssl-3/certs \
-	   ${D}${libdir}/ssl-3/private \
-	   ${D}${libdir}/ssl-3/openssl.cnf \
+	mv ${D}${nonarch_libdir}/ssl-3/certs \
+	   ${D}${nonarch_libdir}/ssl-3/private \
+	   ${D}${nonarch_libdir}/ssl-3/openssl.cnf \
 	   ${D}${sysconfdir}/ssl/
 
 	# Although absolute symlinks would be OK for the target, they become
 	# invalid if native or nativesdk are relocated from sstate.
-	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-3/certs
-	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-3/private
-	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-3/openssl.cnf
+	ln -sf ${@oe.path.relative('${nonarch_libdir}/ssl-3', '${sysconfdir}/ssl/certs')} ${D}${nonarch_libdir}/ssl-3/certs
+	ln -sf ${@oe.path.relative('${nonarch_libdir}/ssl-3', '${sysconfdir}/ssl/private')} ${D}${nonarch_libdir}/ssl-3/private
+	ln -sf ${@oe.path.relative('${nonarch_libdir}/ssl-3', '${sysconfdir}/ssl/openssl.cnf')} ${D}${nonarch_libdir}/ssl-3/openssl.cnf
 
 	# Generate fipsmodule.cnf in pkg_postinst_ontarget
 	if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
-		rm -f ${D}${libdir}/ssl-3/fipsmodule.cnf
+		rm -f ${D}${nonarch_libdir}/ssl-3/fipsmodule.cnf
 	fi
 }
 
@@ -198,9 +198,9 @@ do_install:append:class-target () {
 
 do_install:append:class-native () {
 	create_wrapper ${D}${bindir}/openssl \
-	    OPENSSL_CONF=\${OPENSSL_CONF:-${libdir}/ssl-3/openssl.cnf} \
-	    SSL_CERT_DIR=\${SSL_CERT_DIR:-${libdir}/ssl-3/certs} \
-	    SSL_CERT_FILE=\${SSL_CERT_FILE:-${libdir}/ssl-3/cert.pem} \
+	    OPENSSL_CONF=\${OPENSSL_CONF:-${nonarch_libdir}/ssl-3/openssl.cnf} \
+	    SSL_CERT_DIR=\${SSL_CERT_DIR:-${nonarch_libdir}/ssl-3/certs} \
+	    SSL_CERT_FILE=\${SSL_CERT_FILE:-${nonarch_libdir}/ssl-3/cert.pem} \
 	    OPENSSL_MODULES=\${OPENSSL_MODULES:-${libdir}/ossl-modules}
 
 	# Setting MODULESDIR to invalid paths prevents host contamination,
@@ -252,7 +252,7 @@ do_install_ptest() {
 
 pkg_postinst_ontarget:${PN}-ossl-module-fips () {
 	if test -f ${libdir}/ossl-modules/fips.so; then
-		${bindir}/openssl fipsinstall -out ${libdir}/ssl-3/fipsmodule.cnf -module ${libdir}/ossl-modules/fips.so
+		${bindir}/openssl fipsinstall -out ${nonarch_libdir}/ssl-3/fipsmodule.cnf -module ${libdir}/ossl-modules/fips.so
 	fi
 }
 
@@ -266,12 +266,12 @@ PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-misc ${PN}-ossl-module-legacy $
 FILES:libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES:libssl = "${libdir}/libssl${SOLIBS}"
 FILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf* \
-                      ${libdir}/ssl-3/openssl.cnf* \
+                      ${nonarch_libdir}/ssl-3/openssl.cnf* \
                       "
-FILES:${PN}-misc = "${libdir}/ssl-3/misc"
+FILES:${PN}-misc = "${nonarch_libdir}/ssl-3/misc"
 FILES:${PN}-ossl-module-legacy = "${libdir}/ossl-modules/legacy.so"
 FILES:${PN}-ossl-module-fips = "${libdir}/ossl-modules/fips.so"
-FILES:${PN} =+ "${libdir}/ssl-3/* ${libdir}/ossl-modules/"
+FILES:${PN} =+ "${nonarch_libdir}/ssl-3/* ${libdir}/ossl-modules/"
 FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
 CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"

