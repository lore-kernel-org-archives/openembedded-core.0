Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB9265D42
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:13:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2014 17:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,541,1400050800"; d="scan'208";a="560482025"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2014 17:13:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 17:13:20 -0700
Message-Id: <e33bb2eefbdda30378a55346ff60fb0fb90baff2.1403654908.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
Subject: [PATCH 10/10] curl: Convert CURLGNUTL to PACKAGECONFIG
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
X-List-Received-Date: Wed, 25 Jun 2014 00:13:41 -0000

This will allow for easier configuration of curl for SSL vs gnutls

[YOCTO #6329]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/curl/curl_7.37.0.bb | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.37.0.bb b/meta/recipes-support/curl/curl_7.37.0.bb
index 1dc4ff3..f6b05a7 100644
--- a/meta/recipes-support/curl/curl_7.37.0.bb
+++ b/meta/recipes-support/curl/curl_7.37.0.bb
@@ -23,6 +23,13 @@ SRC_URI[sha256sum] = "24502492de3168b0556d8e1a06f14f7589e57b204917d602a572e14239
 
 inherit autotools pkgconfig binconfig multilib_header
 
+PACKAGECONFIG ??= "gnutls ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
+PACKAGECONFIG_class-native = "ipv6 ssl"
+PACKAGECONFIG_class-nativesdk = "ipv6"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[ssl] =  "--with-ssl, --without-ssl, ,"
+PACKAGECONFIG[gnutls] =  "--with-gnutls=${STAGING_LIBDIR}/../, --without-gnutls, gnutls,"
+
 EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 --without-libssh2 \
                 --with-random=/dev/urandom \
@@ -31,19 +38,8 @@ EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 --disable-ldap \
                 --disable-ldaps \
                 --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-                ${CURLGNUTLS} \
                 "
 
-CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../ --without-ssl"
-CURLGNUTLS_class-native = "--without-gnutls --with-ssl"
-CURLGNUTLS_class-nativesdk = "--without-gnutls --without-ssl"
-
-PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
-PACKAGECONFIG_class-native = "ipv6"
-PACKAGECONFIG_class-nativesdk = "ipv6"
-
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-
 do_configure_prepend() {
 	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g ${S}/configure.ac
 }
-- 
1.8.3.1


