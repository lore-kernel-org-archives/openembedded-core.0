Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjN-0005b2-PT
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 16:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491810"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:16 -0700
Message-Id: <035f0005e9f4c41b6fe1f5e9450c396d4d5adb6f.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
Subject: [PATCH 09/26] curl: inherit shared_lib class
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
X-List-Received-Date: Mon, 11 Jul 2011 23:17:39 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/curl/curl_7.21.7.bb |   17 ++++++-----------
 1 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.21.7.bb b/meta/recipes-support/curl/curl_7.21.7.bb
index 28344e2..3b41b8d 100644
--- a/meta/recipes-support/curl/curl_7.21.7.bb
+++ b/meta/recipes-support/curl/curl_7.21.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_virtclass-native = "zlib-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
-PR = "r0"
+PR = "r2"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
@@ -17,7 +17,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "5f6d50c4d4ee38c57fe37e3cff75adbd"
 SRC_URI[sha256sum] = "1a50dd17400c042090203eef347e946f29c342c32b6c4843c740c80975e8215a"
 
-inherit autotools pkgconfig binconfig
+inherit autotools pkgconfig binconfig shared_lib
 
 EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 --without-ssl \
@@ -36,7 +36,7 @@ do_configure_prepend() {
 	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g configure.ac
 }
 
-PACKAGES += "${PN}-certs libcurl libcurl-dev libcurl-doc"
+PACKAGES += "${PN}-certs"
 
 FILES_${PN} = "${bindir}/curl"
 
@@ -45,17 +45,12 @@ PACKAGE_ARCH_${PN}-certs = "all"
 
 FILES_${PN}-doc = "${mandir}/man1/curl.1"
 
-FILES_lib${PN} = "${libdir}/lib*.so.*"
 RRECOMMENDS_lib${PN} += "${PN}-certs"
-FILES_lib${PN}-dev = "${includedir} \
-                      ${libdir}/lib*.so \
-                      ${libdir}/lib*.a \
-                      ${libdir}/lib*.la \
-                      ${libdir}/pkgconfig \
+FILES_lib${PN}-dev =+ "${libdir}/pkgconfig \
                       ${datadir}/aclocal \
                       ${bindir}/*-config"
 
-FILES_lib${PN}-doc = "${mandir}/man3 \
-                      ${mandir}/man1/curl-config.1"
+
+FILES_lib${PN}-doc =+ "${mandir}/man1/curl-config.1"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.3.4



