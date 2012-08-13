Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T12B1-0005Kt-NZ
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 23:27:55 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 75AC63042C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 17:15:58 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 14:14:56 -0700
Message-Id: <9f7e9fb6cd08b3048e97dd1011f0510416beb103.1344892361.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 75AC63042C.C9856
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 15/32] curl: enable ssl support
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
X-List-Received-Date: Mon, 13 Aug 2012 21:27:55 -0000

From: Saul Wold <sgw@linux.intel.com>

This patch enables ssl support for curl to allow git to clone from
https / ssl sites. We do not want to enable gnutls for native or
nativesdk, as it adds additional dependency and increase build time

[YOCTO #2532]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/curl/curl_7.24.0.bb |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.24.0.bb b/meta/recipes-support/curl/curl_7.24.0.bb
index 12e95c9..f9dce7d 100644
--- a/meta/recipes-support/curl/curl_7.24.0.bb
+++ b/meta/recipes-support/curl/curl_7.24.0.bb
@@ -5,10 +5,10 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
 
-DEPENDS = "zlib gnutls"
-DEPENDS_virtclass-native = "zlib-native"
-DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
-PR = "r0"
+DEPENDS = "zlib gnutls openssl"
+DEPENDS_virtclass-native = "zlib-native openssl-native"
+DEPENDS_virtclass-nativesdk = "zlib-nativesdk openssl-nativesdk"
+PR = "r1"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "ebdb111088ff8b0e05b1d1b075e9f1608285e8105cc51e21caacf33d01
 inherit autotools pkgconfig binconfig
 
 EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
-                --without-ssl \
+		--with-ssl \
                 --without-libssh2 \
 		--with-random=/dev/urandom \
 		--without-libidn \
-- 
1.7.9.5



