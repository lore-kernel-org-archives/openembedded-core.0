Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3C4609B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 07:37:06 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y10so14062691pdj.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 00:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2UNsk3mX01Ri5M5TSMLbVzHOu2m44wctyS2CxgOdzi4=;
	b=PyJbY8wMmGalSs7OiuZ6jFFUVryIPSsfOCrvESUZ3TlGXWVn58iITW2Zl/YtIIZC+p
	Et7gSb6ScAJ4z+yiLMu6l6Rufi3CS86CS7PGYhHAND8p7zeWxxXXX3DbEiIjXs3jHAoj
	1cSgp0N0Wbgt0GWEJDVqqUHCs5tfnT7dcciBLfmlmpsqj3encVPC+z9zVhgtPT+ECWfN
	boieBgDl+AnipqXTx41A98ZxyORBZUN++tDqmi3Msu1syvgV+1gQvon5So5/euEVG2+b
	ZVPeqnqXTjgyN9Qx2Qlbk/VR1s7Q6LqRwvJTwyhUo0DRznlPHizmVtlf9IqWfYJGKyWv
	pvEA==
X-Received: by 10.66.120.176 with SMTP id ld16mr2634882pab.84.1407915427809;
	Wed, 13 Aug 2014 00:37:07 -0700 (PDT)
Received: from localhost.localdomain (c-73-162-180-210.hsd1.ca.comcast.net.
	[73.162.180.210])
	by mx.google.com with ESMTPSA id am2sm1130593pbc.59.2014.08.13.00.37.06
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Aug 2014 00:37:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 00:36:53 -0700
Message-Id: <1407915415-9047-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 1/3] curl: add zlib PACKAGECONFIG and remove hardcoded DEPENDS
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
X-List-Received-Date: Wed, 13 Aug 2014 07:37:08 -0000

Add a zlib PACKAGECONFIG control and update PACKAGECONFIG[ssl] to
include the openssl dependency. Older hardcoded DEPENDS can then
be removed.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/curl_7.37.1.bb | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.37.1.bb b/meta/recipes-support/curl/curl_7.37.1.bb
index dc1d6a6..e51e06d 100644
--- a/meta/recipes-support/curl/curl_7.37.1.bb
+++ b/meta/recipes-support/curl/curl_7.37.1.bb
@@ -5,10 +5,6 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
 
-DEPENDS = "zlib gnutls"
-DEPENDS_class-native = "zlib-native openssl-native"
-DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-openssl"
-
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
 "
@@ -23,22 +19,23 @@ SRC_URI[sha256sum] = "c3ef3cd148f3778ddbefb344117d7829db60656efe1031f9e3065fc0fa
 
 inherit autotools pkgconfig binconfig multilib_header
 
-PACKAGECONFIG ??= "gnutls ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
-PACKAGECONFIG_class-native = "ipv6 ssl"
-PACKAGECONFIG_class-nativesdk = "ipv6 ssl"
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls zlib"
+PACKAGECONFIG_class-native = "ipv6 ssl zlib"
+PACKAGECONFIG_class-nativesdk = "ipv6 ssl zlib"
+
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[ssl] =  "--with-ssl, --without-ssl, ,"
-PACKAGECONFIG[gnutls] =  "--with-gnutls=${STAGING_LIBDIR}/../, --without-gnutls, gnutls,"
+PACKAGECONFIG[ssl] = "--with-ssl,--without-ssl,openssl"
+PACKAGECONFIG[gnutls] = "--with-gnutls=${STAGING_LIBDIR}/../,--without-gnutls,gnutls"
+PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 
-EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
-                --without-libssh2 \
+EXTRA_OECONF = "--without-libssh2 \
                 --with-random=/dev/urandom \
                 --without-libidn \
                 --enable-crypto-auth \
                 --disable-ldap \
                 --disable-ldaps \
                 --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-                "
+"
 
 do_configure_prepend() {
 	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g ${S}/configure.ac
-- 
1.8.3.2


