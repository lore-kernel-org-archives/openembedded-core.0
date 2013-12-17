Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4B846610B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 08:29:44 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Vsq2B-0002Nd-8g from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Dec 2013 00:29:43 -0800
Received: from ykhan.pkl.mentorg.com ([137.202.157.53]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 17 Dec 2013 00:29:42 -0800
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2013 13:28:35 +0500
Message-Id: <1387268915-28265-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.10.4
X-OriginalArrivalTime: 17 Dec 2013 08:29:43.0004 (UTC)
	FILETIME=[22A491C0:01CEFB02]
Subject: [PATCH V3] openssl.inc: Install c_rehash utility with openssl
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
X-List-Received-Date: Tue, 17 Dec 2013 08:29:46 -0000

From: mykhani <yasir_khan@mentor.com>

c_rehash utility is not being installed with openssl.It conveniently
generates hash and symbolic links based on it for CA certificates
stored locally for SSL based server authentication

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 3bfe569..cdb1809 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -13,6 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
 DEPENDS = "perl-native-runtime"
 
+# Adding RDEPENDS for perl scripts
+RDEPENDS_${PN}-misc +="perl"
+
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
           "
 S = "${WORKDIR}/openssl-${PV}"
@@ -37,7 +40,7 @@ PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
 FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl.so.*"
 FILES_${PN} =+ " ${libdir}/ssl/*"
-FILES_${PN}-misc = "${libdir}/ssl/misc"
+FILES_${PN}-misc = "${libdir}/ssl/misc ${bindir}/c_rehash"
 FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
 
 # Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
@@ -157,6 +160,8 @@ do_install () {
 	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
 
 	oe_multilib_header openssl/opensslconf.h
+	# The c_rehash utility isn't installed by the normal installation process.
+	install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4


