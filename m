Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5325FC433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 19:09:27 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.21354.1641755365932241021
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 11:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.178.231, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id C4BE9100003;
	Sun,  9 Jan 2022 19:09:23 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH 2/3] curl: Rework openssl and random PACKAGECONFIGs
Date: Sun,  9 Jan 2022 11:08:04 -0800
Message-Id: <20220109190805.2409880-2-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220109190805.2409880-1-robert.joslyn@redrectangle.org>
References: <20220109190805.2409880-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 19:09:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160288

The existing ssl PACKAGECONFIG makes it slightly annoying to use another
crypto provider while removing openssl. Since --with-ssl is just a
deprecated version of --with-openssl, rename the PACKAGECONFIG to use
the newer preferred name. Note that --without-ssl implies no crypto
provider at all, and should only be used when trying to disable all
crypto support.

Move --with-random to it's own option, since it is useful for other
crypto providers, not just openssl.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/curl_7.81.0.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.81.0.bb b/meta/recipes-support/curl/curl_7.81.0.bb
index 30bd928751..c22a13cfea 100644
--- a/meta/recipes-support/curl/curl_7.81.0.bb
+++ b/meta/recipes-support/curl/curl_7.81.0.bb
@@ -17,9 +17,12 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 
 inherit autotools pkgconfig binconfig multilib_header
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} ssl libidn proxy threaded-resolver verbose zlib"
-PACKAGECONFIG:class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
-PACKAGECONFIG:class-nativesdk = "ipv6 proxy ssl threaded-resolver verbose zlib"
+# Entropy source for random PACKAGECONFIG option
+RANDOM = "/dev/urandom"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib"
+PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib"
+PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib"
 
 # 'ares' and 'threaded-resolver' are mutually exclusive
 PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
@@ -39,13 +42,14 @@ PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
 PACKAGECONFIG[mbedtls] = "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
 PACKAGECONFIG[mqtt] = "--enable-mqtt,--disable-mqtt,"
 PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
 PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
+PACKAGECONFIG[random] = "--with-random=${RANDOM},--without-random"
 PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
 PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
 PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
-PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
 PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
 PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
 PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
-- 
2.34.1


