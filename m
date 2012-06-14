Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfFsG-0005lC-KV
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 21:38:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jun 2012 12:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180153901"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.138])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2012 12:27:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 12:27:17 -0700
Message-Id: <5a1646b267619919186d5b12e59207d3251cf2dd.1339701375.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339701375.git.sgw@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339701375.git.sgw@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 13/17] curl: enable ssl support
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
X-List-Received-Date: Thu, 14 Jun 2012 19:38:32 -0000

This patch enables ssl support for curl to allow git to clone from
https / ssl sites. We do not want to enable gnutls for native or
nativesdk, as it adds additional dependency and increase build time

[YOCTO #2532]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/curl/curl_7.24.0.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

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
1.7.7.6



