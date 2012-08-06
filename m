Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyM7C-0005Z3-Lg
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 14:08:54 +0200
Received: by weyr6 with SMTP id r6so1775984wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 04:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8jaQbSJdB0exOCzPuOTf7ps8nrJegna7U+FkGzQfmsc=;
	b=jKV7HpHzsQ23yK8FnM3WmhHzPb7GyPo+lv4Q3I6ejUpgo+MyU5cyx1PjgemJqBRiDK
	9udwI69V0XDJ+3ya/kCF7KeXjRn/UV2X33ohDPaxAYCKn/2Dncq4o9OgplqV4+oi+33I
	2mk7d0nTvOYkEsTK3CGo8v/JgxO5h2HOPS9qzEeGuhv9A3+6TGgYM0dCHswBqJYvnnEs
	mGgKf02sRZ4tIRPZ7gkmowosieHdpqzj9YhfViQ4E/to7VBbpchhyfOQc5rBZmFZf2qs
	76m5Kl1SAOudkZXSrGBkG4JyZbz7uXyAlPaP7nV3+uFX6MDDq9DeFs0wlQ08Ta5EQhm0
	3PZw==
Received: by 10.180.75.209 with SMTP id e17mr20678338wiw.0.1344254230092;
	Mon, 06 Aug 2012 04:57:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex20sm22449364wid.7.2012.08.06.04.57.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 04:57:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2012 13:57:04 +0200
Message-Id: <1344254224-29365-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] curl: disable ldap/ldaps explicitly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2012 12:08:54 -0000

* openldap from meta-oe is autodetected and then libldap-2.4-2 runtime dependency added to curl and almost all meta-efl recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/curl/curl_7.26.0.bb |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-support/curl/curl_7.26.0.bb
index f04b400..418e29c 100644
--- a/meta/recipes-support/curl/curl_7.26.0.bb
+++ b/meta/recipes-support/curl/curl_7.26.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_virtclass-native = "zlib-native openssl-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch"
@@ -20,11 +20,13 @@ inherit autotools pkgconfig binconfig
 
 EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 --without-libssh2 \
-		--with-random=/dev/urandom \
-		--without-libidn \
-		--enable-crypto-auth \
+                --with-random=/dev/urandom \
+                --without-libidn \
+                --enable-crypto-auth \
+                --disable-ldap \
+                --disable-ldaps \
                 ${CURLGNUTLS} \
-		"
+                "
 
 CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../ --without-ssl"
 CURLGNUTLS_virtclass-native = "--without-gnutls --with-ssl"
-- 
1.7.8.6



