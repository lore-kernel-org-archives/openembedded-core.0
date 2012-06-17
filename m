Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8O1-0008Qv-LF
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103318"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:40:06 -0700
Message-Id: <fce618c6c0a07ee6939b0e59112c1e837428a194.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 22/23] curl: Use gnutls for target and openssl for native
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
X-List-Received-Date: Sun, 17 Jun 2012 05:51:02 -0000

Since gnutls is available on the target use it, but we do not build gnutls for
the native side as it adds too many dependecies, so use openssl.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/curl/curl_7.24.0.bb |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

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
1.7.7.6



