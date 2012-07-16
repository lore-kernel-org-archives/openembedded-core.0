Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SqmiT-0004Bp-60
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 16:56:05 +0200
Received: by eaal1 with SMTP id l1so1460993eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 07:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=/lgtHHPjBcSivkZVXZ+MEBUgy7jyrJLnQchy0qmGRDE=;
	b=bUYvhLxG0ViDf10NfinkbxxAkgperBY42w+zMUsQXguErw6vi7XtX7v5SSy63eFA9Z
	2ptRFe1XoEggBv/uEP9vcSVjjztTH/jk6iOUdo+ayU4WASHm5U+Jf5OnCJj50S8vDJk6
	NKL5a9OmaADatmMuPdqeXXHKQ39goHQ2J25biNX2GMDtCJn1cNnG7Om2UkXYSSfRMdjG
	piDDTqyc1wwasuwmFBR11X2wwhvY+vH2gddQ5G73noxQH0+bk+DsBxhoiEZEvsl4DHpL
	dr/2r1oKEFic2Ttnz51HERyPxO2TkFwIEnEh1+BVHFZdJ5IdemmgoPbSblfhcWIMncNG
	M/fA==
Received: by 10.14.201.2 with SMTP id a2mr9503235eeo.10.1342449886708;
	Mon, 16 Jul 2012 07:44:46 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id f45sm19402963eep.12.2012.07.16.07.44.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 07:44:45 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 16:44:22 +0200
Message-Id: <1342449862-26387-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342449862-26387-1-git-send-email-koen@dominion.thruhere.net>
References: <1342449862-26387-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQle6aMg6F1wCAJGQrAd/Prb95dfS/HGQBVGQuFTzNcAq8qioWrwKUl6WR2pEL6JwaSxs1Bk
Subject: [for-denzil][PATCH 2/2] curl: Use gnutls for target and openssl for native
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
X-List-Received-Date: Mon, 16 Jul 2012 14:56:05 -0000

From: Saul Wold <sgw@linux.intel.com>

Since gnutls is available on the target use it, but we do not build gnutls for
the native side as it adds too many dependecies, so use openssl.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/curl/curl_7.24.0.bb |   13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.24.0.bb b/meta/recipes-support/curl/curl_7.24.0.bb
index f9dce7d..2c5369c 100644
--- a/meta/recipes-support/curl/curl_7.24.0.bb
+++ b/meta/recipes-support/curl/curl_7.24.0.bb
@@ -5,10 +5,10 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
 
-DEPENDS = "zlib gnutls openssl"
+DEPENDS = "zlib gnutls"
 DEPENDS_virtclass-native = "zlib-native openssl-native"
-DEPENDS_virtclass-nativesdk = "zlib-nativesdk openssl-nativesdk"
-PR = "r1"
+DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
+PR = "r2"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
@@ -20,7 +20,6 @@ SRC_URI[sha256sum] = "ebdb111088ff8b0e05b1d1b075e9f1608285e8105cc51e21caacf33d01
 inherit autotools pkgconfig binconfig
 
 EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
-		--with-ssl \
                 --without-libssh2 \
 		--with-random=/dev/urandom \
 		--without-libidn \
@@ -28,9 +27,9 @@ EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 ${CURLGNUTLS} \
 		"
 
-CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../"
-CURLGNUTLS_virtclass-native = "--without-gnutls"
-CURLGNUTLS_virtclass-nativesdk = "--without-gnutls"
+CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../ --without-ssl"
+CURLGNUTLS_virtclass-native = "--without-gnutls --with-ssl"
+CURLGNUTLS_virtclass-nativesdk = "--without-gnutls --without-ssl"
 
 do_configure_prepend() {
 	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g configure.ac
-- 
1.7.10



