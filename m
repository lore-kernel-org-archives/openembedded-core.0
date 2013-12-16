Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A7FC96E208
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 11:53:17 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VsWjc-0001Bs-Tj from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Dec 2013 03:53:16 -0800
Received: from ykhan.pkl.mentorg.com ([137.202.157.53]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 16 Dec 2013 03:53:16 -0800
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2013 16:51:28 +0500
Message-Id: <1387194688-11022-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.10.4
X-OriginalArrivalTime: 16 Dec 2013 11:53:16.0712 (UTC)
	FILETIME=[682AC280:01CEFA55]
Subject: [PATCH V2] openssl.inc: Install c_rehash utility with openssl
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
X-List-Received-Date: Mon, 16 Dec 2013 11:53:18 -0000

From: mykhani <yasir_khan@mentor.com>

c_rehash utility is not being installed with openssl.It conveniently
generates hash and symbolic links based on it for CA certificates
stored locally for SSL based server authentication

Signed-off-by: mykhani <yasir_khan@mentor.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 78ff7ae..5cb67df 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -34,10 +34,14 @@ export AS = "${CC} -c"
 inherit pkgconfig siteinfo multilib_header
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc"
+
+#Adding RDEPENDS for perl scripts
+RDEPENDS_${PN}-misc +="perl"
+
 FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl.so.*"
 FILES_${PN} =+ " ${libdir}/ssl/*"
-FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
+FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf ${bindir}/c_rehash"
 FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
 
 do_configure_prepend_darwin () {
@@ -148,5 +152,10 @@ do_install () {
 	oe_multilib_header openssl/opensslconf.h
 }
 
+do_install_append() {
+    # The c_rehash utility isn't installed by the normal installation process.
+    install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.10.4


