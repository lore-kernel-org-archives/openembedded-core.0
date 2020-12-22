Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.1603.1608669218643180313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 12:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: oC+rZHl760yaTWWmmorwQ0yBHKjzwOJlADTrVEsa7wJM6mdlzu4SXLoHBcmeN9UBnuQjsq6vmQ
 rxzPWtszG5BQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="240005259"
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; 
   d="scan'208";a="240005259"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2020 12:33:30 -0800
IronPort-SDR: 9qXGKuog3Do9DVX3UcWCBtueXxb3evjlRdlA4CkdX3kkmirLJxUhRob5tTbcUiOIiSOoBDhoOh
 yEB4nTsDUZJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; 
   d="scan'208";a="392487170"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 22 Dec 2020 12:33:29 -0800
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: Update 7.73.0 -> 7.74.0
Date: Wed, 23 Dec 2020 04:33:28 +0800
Message-Id: <1608669208-49586-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

update to version 7.74.0

curl 7.74.0 hsts: add experimental support for Strict-Transport-Security with various bug fixes

Reference:
https://curl.se/changes.html#7_74_0

update includes fix for CVE:
CVE-2020-8284
CVE-2020-8285
CVE-2020-8286

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 meta/recipes-support/curl/curl_7.73.0.bb | 85 --------------------------------
 meta/recipes-support/curl/curl_7.74.0.bb | 85 ++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl_7.73.0.bb
 create mode 100644 meta/recipes-support/curl/curl_7.74.0.bb

diff --git a/meta/recipes-support/curl/curl_7.73.0.bb b/meta/recipes-support/curl/curl_7.73.0.bb
deleted file mode 100644
index 0f26b0f..0000000
--- a/meta/recipes-support/curl/curl_7.73.0.bb
+++ /dev/null
@@ -1,85 +0,0 @@
-SUMMARY = "Command line tool and library for client-side URL transfers"
-HOMEPAGE = "http://curl.haxx.se/"
-BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
-SECTION = "console/network"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
-
-SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
-           file://0001-replace-krb5-config-with-pkg-config.patch \
-"
-
-SRC_URI[sha256sum] = "cf34fe0b07b800f1c01a499a6e8b2af548f6d0e044dca4a29d88a4bee146d131"
-
-# Curl has used many names over the years...
-CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-
-inherit autotools pkgconfig binconfig multilib_header
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls libidn proxy threaded-resolver verbose zlib"
-PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
-PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl threaded-resolver verbose zlib"
-
-# 'ares' and 'threaded-resolver' are mutually exclusive
-PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
-PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
-PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
-PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
-PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
-PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
-PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
-PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
-PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
-PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
-PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
-PACKAGECONFIG[mbedtls] = "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
-PACKAGECONFIG[mqtt] = "--enable-mqtt,--disable-mqtt,"
-PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
-PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
-PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
-PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
-PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
-PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
-PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
-PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
-PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
-PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
-PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
-PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
-PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
-PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
-
-EXTRA_OECONF = " \
-    --disable-libcurl-option \
-    --disable-ntlm-wb \
-    --enable-crypto-auth \
-    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-    --without-libmetalink \
-    --without-libpsl \
-    --enable-debug \
-    --enable-optimize \
-    --disable-curldebug \
-"
-
-do_install_append_class-target() {
-	# cleanup buildpaths from curl-config
-	sed -i \
-	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-	    -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
-	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-	    ${D}${bindir}/curl-config
-}
-
-PACKAGES =+ "lib${BPN}"
-
-FILES_lib${BPN} = "${libdir}/lib*.so.*"
-RRECOMMENDS_lib${BPN} += "ca-certificates"
-
-FILES_${PN} += "${datadir}/zsh"
-
-inherit multilib_script
-MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/curl-config"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/curl/curl_7.74.0.bb b/meta/recipes-support/curl/curl_7.74.0.bb
new file mode 100644
index 0000000..873bbe8
--- /dev/null
+++ b/meta/recipes-support/curl/curl_7.74.0.bb
@@ -0,0 +1,85 @@
+SUMMARY = "Command line tool and library for client-side URL transfers"
+HOMEPAGE = "http://curl.haxx.se/"
+BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
+SECTION = "console/network"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
+
+SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
+           file://0001-replace-krb5-config-with-pkg-config.patch \
+"
+
+SRC_URI[sha256sum] = "0f4d63e6681636539dc88fa8e929f934cd3a840c46e0bf28c73be11e521b77a5"
+
+# Curl has used many names over the years...
+CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
+
+inherit autotools pkgconfig binconfig multilib_header
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls libidn proxy threaded-resolver verbose zlib"
+PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
+PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl threaded-resolver verbose zlib"
+
+# 'ares' and 'threaded-resolver' are mutually exclusive
+PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
+PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
+PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
+PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
+PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
+PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
+PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
+PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
+PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
+PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
+PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
+PACKAGECONFIG[mbedtls] = "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
+PACKAGECONFIG[mqtt] = "--enable-mqtt,--disable-mqtt,"
+PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
+PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
+PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
+PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
+PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
+PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
+PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
+PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
+PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
+PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
+PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
+PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
+PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
+PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
+
+EXTRA_OECONF = " \
+    --disable-libcurl-option \
+    --disable-ntlm-wb \
+    --enable-crypto-auth \
+    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
+    --without-libmetalink \
+    --without-libpsl \
+    --enable-debug \
+    --enable-optimize \
+    --disable-curldebug \
+"
+
+do_install_append_class-target() {
+	# cleanup buildpaths from curl-config
+	sed -i \
+	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    ${D}${bindir}/curl-config
+}
+
+PACKAGES =+ "lib${BPN}"
+
+FILES_lib${BPN} = "${libdir}/lib*.so.*"
+RRECOMMENDS_lib${BPN} += "ca-certificates"
+
+FILES_${PN} += "${datadir}/zsh"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/curl-config"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

