Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1807E6FA94
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 02:10:42 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id v1so5866982yhn.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 19:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=9X411C9qXk3BJcgjWmshC3QEyDtpnyAGVIz34lCC9Oo=;
	b=NejMV/cHvhI/38fxzZ44P4rjCiAu/P0HFBLYWO2j3D10Pfb6A7ErvYhwPBijQN2kBz
	TxocqkzkUCB8zw7lS/MUbEK4QcKrgvi9GMS/xvzUUcLZ3Q8a/OuypPk4M02rOHhC8KlH
	RkdjuyvcUWOREaGlYg4tts0qx+kHSNqNEHiT6tP2ol5xzWkUa20FPQjUxSzfpQllnjU5
	GupTWa20kE2sGujLMEy16PkXDj51Mhf+vdnzjeWjyIIoBaYZa0UvaxGEOSCZhaaxu9ut
	jq6H2odEaC/2EeKLM5/eDBahU+Pgzc9Up981oRV5zaW1+aX8WSp/2+ML3uB/GbPqPywf
	nqXw==
X-Received: by 10.236.216.16 with SMTP id f16mr41275623yhp.90.1407723043388;
	Sun, 10 Aug 2014 19:10:43 -0700 (PDT)
Received: from localhost.localdomain ([201.53.208.133])
	by mx.google.com with ESMTPSA id q35sm20934214yhb.9.2014.08.10.19.10.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Aug 2014 19:10:42 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 23:09:56 -0300
Message-Id: <1407722996-16278-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] curl: add ssl to PACKAGECONFIG
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
X-List-Received-Date: Mon, 11 Aug 2014 02:10:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will allow curl run as nativesdk and fixes the following:

fatal: unable to access 'https://...': Protocol https not supported or disabled in libcurl

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/recipes-support/curl/curl_7.37.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.37.1.bb b/meta/recipes-support/curl/curl_7.37.1.bb
index 14bdff7..dc1d6a6 100644
--- a/meta/recipes-support/curl/curl_7.37.1.bb
+++ b/meta/recipes-support/curl/curl_7.37.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 
 DEPENDS = "zlib gnutls"
 DEPENDS_class-native = "zlib-native openssl-native"
-DEPENDS_class-nativesdk = "nativesdk-zlib"
+DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-openssl"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
@@ -25,7 +25,7 @@ inherit autotools pkgconfig binconfig multilib_header
 
 PACKAGECONFIG ??= "gnutls ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
 PACKAGECONFIG_class-native = "ipv6 ssl"
-PACKAGECONFIG_class-nativesdk = "ipv6"
+PACKAGECONFIG_class-nativesdk = "ipv6 ssl"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[ssl] =  "--with-ssl, --without-ssl, ,"
 PACKAGECONFIG[gnutls] =  "--with-gnutls=${STAGING_LIBDIR}/../, --without-gnutls, gnutls,"
-- 
1.9.1


