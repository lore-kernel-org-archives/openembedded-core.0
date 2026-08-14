Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3DFC5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 07:38:58 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8177.1786693137372747377
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 00:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 14 Aug 2026 16:38:54 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.121 with ESMTP; 14 Aug 2026 16:38:53 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH] openssl: use nonarch_libdir for openssldir
Date: Fri, 14 Aug 2026 16:38:51 +0900
Message-ID: <20260814073851.3797172-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 07:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243426

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Set openssldir to ${nonarch_libdir}/ssl-3 instead of ${libdir}/ssl-3
since files in this directory are architecture-independent.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 .../openssl/openssl_3.5.7.bb                  | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
index b95c734f1d..2dd23c9da0 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
@@ -153,7 +153,7 @@ do_configure () {
 	PERLEXTERNAL="$(realpath ${S}/external/perl/Text-Template-*/lib)"
 	test -d "$PERLEXTERNAL" || bberror "PERLEXTERNAL '$PERLEXTERNAL' not found!"
 	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="$PERLEXTERNAL" \
-	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=${prefix} --openssldir=${libdir}/ssl-3 --libdir=${baselib} $target
+	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=${prefix} --openssldir=${nonarch_libdir}/ssl-3 --libdir=${baselib} $target
 	perl ${B}/configdata.pm --dump
 }
 
@@ -175,20 +175,20 @@ do_install () {
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
 
@@ -201,9 +201,9 @@ do_install:append:class-target () {
 
 do_install:append:class-native () {
 	create_wrapper ${D}${bindir}/openssl \
-	    OPENSSL_CONF=\${OPENSSL_CONF:-${libdir}/ssl-3/openssl.cnf} \
-	    SSL_CERT_DIR=\${SSL_CERT_DIR:-${libdir}/ssl-3/certs} \
-	    SSL_CERT_FILE=\${SSL_CERT_FILE:-${libdir}/ssl-3/cert.pem} \
+	    OPENSSL_CONF=\${OPENSSL_CONF:-${nonarch_libdir}/ssl-3/openssl.cnf} \
+	    SSL_CERT_DIR=\${SSL_CERT_DIR:-${nonarch_libdir}/ssl-3/certs} \
+	    SSL_CERT_FILE=\${SSL_CERT_FILE:-${nonarch_libdir}/ssl-3/cert.pem} \
 	    OPENSSL_ENGINES=\${OPENSSL_ENGINES:-${libdir}/engines-3} \
 	    OPENSSL_MODULES=\${OPENSSL_MODULES:-${libdir}/ossl-modules}
 
@@ -275,15 +275,15 @@ PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${PN}-ossl-m
 FILES:libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES:libssl = "${libdir}/libssl${SOLIBS}"
 FILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf* \
-                      ${libdir}/ssl-3/openssl.cnf* \
+                      ${nonarch_libdir}/ssl-3/openssl.cnf* \
                       "
 FILES:${PN}-engines = "${libdir}/engines-3"
 # ${prefix} comes from what we pass into --prefix at configure time (which is used for INSTALLTOP)
 FILES:${PN}-engines:append:mingw32:class-nativesdk = " ${prefix}${libdir}/engines-3"
-FILES:${PN}-misc = "${libdir}/ssl-3/misc ${bindir}/c_rehash"
+FILES:${PN}-misc = "${nonarch_libdir}/ssl-3/misc ${bindir}/c_rehash"
 FILES:${PN}-ossl-module-legacy = "${libdir}/ossl-modules/legacy.so"
 FILES:${PN}-ossl-module-fips = "${libdir}/ossl-modules/fips.so"
-FILES:${PN} =+ "${libdir}/ssl-3/* ${libdir}/ossl-modules/"
+FILES:${PN} =+ "${nonarch_libdir}/ssl-3/* ${libdir}/ossl-modules/"
 FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
 CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"

