Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id CD3C06F2C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 09:18:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,533,1389744000"; d="scan'208";a="65620642"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 24 Feb 2014 09:18:40 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>) id 1WHrgM-0002xv-Qk
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Feb 2014 09:18:39 +0000
Resent-From: Mike Crowe <mac@mcrowe.com>
Resent-Date: Mon, 24 Feb 2014 09:18:38 +0000
Resent-Message-ID: <20140224091838.GA11392@mcrowe.com>
Resent-To: openembedded-core@lists.openembedded.org
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on deneb.mcrowe.com
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL, RDNS_NONE,
	T_RCVD_IN_SEMBLACK autolearn=no version=3.3.2
Received: from [86.30.57.232] (helo=elite.brightsigndigital.co.uk)
	by deneb.mcrowe.com with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <mcrowe@brightsign.biz>)
	id 1WHhQ8-00042B-BT
	for mac@mcrowe.com; Sun, 23 Feb 2014 22:21:12 +0000
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WHhQ6-0000oK-G1; Sun, 23 Feb 2014 22:21:10 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WHhQ6-0000cj-Es; Sun, 23 Feb 2014 22:21:10 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2014 22:20:57 +0000
Message-Id: <1393194057-2364-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] curl: upgrade to 7.35.0
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
X-List-Received-Date: Mon, 24 Feb 2014 09:18:44 -0000

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-support/curl/curl_7.34.0.bb |   63 ------------------------------
 meta/recipes-support/curl/curl_7.35.0.bb |   61 +++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl_7.34.0.bb
 create mode 100644 meta/recipes-support/curl/curl_7.35.0.bb

diff --git a/meta/recipes-support/curl/curl_7.34.0.bb b/meta/recipes-support/curl/curl_7.34.0.bb
deleted file mode 100644
index aba6649..0000000
--- a/meta/recipes-support/curl/curl_7.34.0.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-SUMMARY = "Command line tool and library for client-side URL transfers"
-HOMEPAGE = "http://curl.haxx.se/"
-BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
-SECTION = "console/network"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
-
-DEPENDS = "zlib gnutls"
-DEPENDS_class-native = "zlib-native openssl-native"
-DEPENDS_class-nativesdk = "nativesdk-zlib"
-
-SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
-           file://pkgconfig_fix.patch \
-"
-
-# curl likes to set -g0 in CFLAGS, so we stop it
-# from mucking around with debug options
-#
-SRC_URI += " file://configure_ac.patch"
-
-SRC_URI[md5sum] = "88491df2bb32e9146e776ae6ac2f8327"
-SRC_URI[sha256sum] = "10beade56b48311499e444783df3413405b22f20a147ed4a1d8a8125f1cc829b"
-
-inherit autotools pkgconfig binconfig multilib_header
-
-EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
-                --without-libssh2 \
-                --with-random=/dev/urandom \
-                --without-libidn \
-                --enable-crypto-auth \
-                --disable-ldap \
-                --disable-ldaps \
-                --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-                ${CURLGNUTLS} \
-                "
-
-CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../ --without-ssl"
-CURLGNUTLS_class-native = "--without-gnutls --with-ssl"
-CURLGNUTLS_class-nativesdk = "--without-gnutls --without-ssl"
-
-do_configure_prepend() {
-	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g ${S}/configure.ac
-}
-
-do_install_append() {
-	oe_multilib_header curl/curlbuild.h
-}
-
-PACKAGES =+ "libcurl libcurl-dev libcurl-staticdev libcurl-doc"
-
-FILES_lib${BPN} = "${libdir}/lib*.so.*"
-RRECOMMENDS_lib${BPN} += "ca-certificates"
-FILES_lib${BPN}-dev = "${includedir} \
-                      ${libdir}/lib*.so \
-                      ${libdir}/lib*.la \
-                      ${libdir}/pkgconfig \
-                      ${datadir}/aclocal \
-                      ${bindir}/*-config"
-FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
-FILES_lib${BPN}-doc = "${mandir}/man3 \
-                      ${mandir}/man1/curl-config.1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/curl/curl_7.35.0.bb b/meta/recipes-support/curl/curl_7.35.0.bb
new file mode 100644
index 0000000..ddb0384
--- /dev/null
+++ b/meta/recipes-support/curl/curl_7.35.0.bb
@@ -0,0 +1,61 @@
+SUMMARY = "Command line tool and library for client-side URL transfers"
+HOMEPAGE = "http://curl.haxx.se/"
+BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
+SECTION = "console/network"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
+
+DEPENDS = "zlib gnutls"
+DEPENDS_class-native = "zlib-native openssl-native"
+DEPENDS_class-nativesdk = "nativesdk-zlib"
+
+SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
+           file://pkgconfig_fix.patch \
+"
+
+# curl likes to set -g0 in CFLAGS, so we stop it
+# from mucking around with debug options
+#
+SRC_URI += " file://configure_ac.patch"
+
+SRC_URI[md5sum] = "c18fbdd031adb0529ae09fce399f2d10"
+SRC_URI[sha256sum] = "d774d1701454f1b7d331c2075fc4f6dd972bddc2d171f43645ef3647c7fc0d83"
+
+inherit autotools pkgconfig binconfig
+
+EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
+                --without-libssh2 \
+                --with-random=/dev/urandom \
+                --without-libidn \
+                --enable-crypto-auth \
+                --disable-ldap \
+                --disable-ldaps \
+                ${CURLGNUTLS} \
+                "
+
+CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../ --without-ssl"
+CURLGNUTLS_class-native = "--without-gnutls --with-ssl"
+CURLGNUTLS_class-nativesdk = "--without-gnutls --without-ssl"
+
+do_configure_prepend() {
+	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g ${S}/configure.ac
+}
+
+PACKAGES =+ "${PN}-certs libcurl libcurl-dev libcurl-staticdev libcurl-doc"
+
+FILES_${PN}-certs = "${datadir}/curl/curl-*"
+PACKAGE_ARCH_${PN}-certs = "all"
+
+FILES_lib${BPN} = "${libdir}/lib*.so.*"
+RRECOMMENDS_lib${BPN} += "${PN}-certs"
+FILES_lib${BPN}-dev = "${includedir} \
+                      ${libdir}/lib*.so \
+                      ${libdir}/lib*.la \
+                      ${libdir}/pkgconfig \
+                      ${datadir}/aclocal \
+                      ${bindir}/*-config"
+FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
+FILES_lib${BPN}-doc = "${mandir}/man3 \
+                      ${mandir}/man1/curl-config.1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4



