Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9CD610ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 18:47:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Dec 2013 10:47:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,522,1384329600"; d="scan'208";a="453473389"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.132])
	by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2013 10:47:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2013 10:47:26 -0800
Message-Id: <1387565248-18457-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1387565248-18457-1-git-send-email-sgw@linux.intel.com>
References: <1387565248-18457-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/3 v2] openssl: use PACKAGECONFIG to disable perl bits
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
X-List-Received-Date: Fri, 20 Dec 2013 18:47:28 -0000

Adding perl to the RDEPENDS caused a performance hit to the overall build time since this was
the only package that depended on perl.  The openssl-misc package is not installed by default
so use a PACKAGECONFIG which can be overridden to allow the perl scripts along with  perl to
 be installed.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index cdb1809..da19831 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -13,9 +13,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
 DEPENDS = "perl-native-runtime"
 
-# Adding RDEPENDS for perl scripts
-RDEPENDS_${PN}-misc +="perl"
-
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
           "
 S = "${WORKDIR}/openssl-${PV}"
@@ -41,6 +38,7 @@ FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl.so.*"
 FILES_${PN} =+ " ${libdir}/ssl/*"
 FILES_${PN}-misc = "${libdir}/ssl/misc ${bindir}/c_rehash"
+RDEPENDS_${PN}-misc = "${@base_contains('PACKAGECONFIG', 'perl', 'perl', '', d)}"
 FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
 
 # Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
@@ -157,11 +155,18 @@ do_install () {
 
 	install -d ${D}${includedir}
 	cp --dereference -R include/openssl ${D}${includedir}
-	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
 
 	oe_multilib_header openssl/opensslconf.h
-	# The c_rehash utility isn't installed by the normal installation process.
-	install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
+	if [ "${@base_contains('PACKAGECONFIG', 'perl', 'perl', '', d)}" = "perl" ]; then
+		install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
+		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${bindir}/c_rehash
+		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
+		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/tsget
+		# The c_rehash utility isn't installed by the normal installation process.
+	else
+		rm -f ${D}${bindir}/c_rehash
+		rm -f ${D}${libdir}/ssl/misc/CA.pl ${D}${libdir}/ssl/misc/tsget
+	fi
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.1


