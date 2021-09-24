Return-Path: <tom.pollard@codethink.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C120C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Sep 2021 16:00:59 +0000 (UTC)
Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk
 [176.9.8.87])
 by mx.groups.io with SMTP id smtpd.web10.1015.1632499256946714368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 09:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: codethink.co.uk, ip: 176.9.8.87, mailfrom: tom.pollard@codethink.co.uk)
Received: from cpc109023-salf6-2-0-cust777.10-2.cable.virginm.net
 ([82.29.243.10] helo=localhost.localdomain)
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1mTnd1-00084r-Gd; Fri, 24 Sep 2021 17:00:47 +0100
From: Tom Pollard <tom.pollard@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: Tom Pollard <tom.pollard@codethink.co.uk>
Subject: [PATCH] curl: Update tls backend PACKAGECONFIG options
Date: Fri, 24 Sep 2021 17:00:26 +0100
Message-Id: <20210924160026.145611-1-tom.pollard@codethink.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 16:00:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156330

curl 7.77.0 made the tls backend configuration explicit. openssl
is now a specific option replacing the default `--with-ssl`, and
`--without-ssl` is required to build without any tls, overriding any
other tls config. Adding 'without-ssl` as a mutually exclusive
option against the existing tls options should prevent users
silently disabling other enabled tls backends.

https://curl.se/changes.html#7_77_0

Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
---
 meta/recipes-support/curl/curl_7.78.0.bb | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.78.0.bb b/meta/recipes-support/curl/curl_7.78.0.bb
index dece0babb2..315755c9b1 100644
--- a/meta/recipes-support/curl/curl_7.78.0.bb
+++ b/meta/recipes-support/curl/curl_7.78.0.bb
@@ -20,16 +20,17 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 
 inherit autotools pkgconfig binconfig multilib_header
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} ssl libidn proxy threaded-resolver verbose zlib"
-PACKAGECONFIG:class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
-PACKAGECONFIG:class-nativesdk = "ipv6 proxy ssl threaded-resolver verbose zlib"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} openssl libidn proxy threaded-resolver verbose zlib"
+PACKAGECONFIG:class-native = "ipv6 proxy openssl threaded-resolver verbose zlib"
+PACKAGECONFIG:class-nativesdk = "ipv6 proxy openssl threaded-resolver verbose zlib"
 
 # 'ares' and 'threaded-resolver' are mutually exclusive
+# 'without-ssl' explicitly disables tls, silently overriding other tls config and is required if no backend(s) are configured
 PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
 PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
 PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
 PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
-PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
+PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls,,,without-ssl"
 PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
 PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
@@ -39,7 +40,7 @@ PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
 PACKAGECONFIG[libgsasl] = "--with-libgsasl,--without-libgsasl,libgsasl"
 PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
-PACKAGECONFIG[mbedtls] = "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
+PACKAGECONFIG[mbedtls] = "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls,,,without-ssl"
 PACKAGECONFIG[mqtt] = "--enable-mqtt,--disable-mqtt,"
 PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
 PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
@@ -48,12 +49,13 @@ PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
 PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
 PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
-PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
-PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
+PACKAGECONFIG[openssl] = "--with-openssl --with-random=/dev/urandom,,openssl,,,without-ssl"
+PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss,,,without-ssl"
 PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
 PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
 PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
+PACKAGECONFIG[without-ssl] = "--without-ssl,,,,,gnutls mbedtls openssl nss"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 
 EXTRA_OECONF = " \
-- 
2.30.2


