Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 852F5789B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:10:58 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w6H9AwVs026256
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:10:58 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w6H9Aw4g014751;
	Tue, 17 Jul 2018 11:10:58 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 0CDA5969B09;
	Tue, 17 Jul 2018 11:10:59 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 11:10:34 +0200
Message-Id: <20180717091035.26461-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717091035.26461-1-andrej.valek@siemens.com>
References: <20180717091035.26461-1-andrej.valek@siemens.com>
In-Reply-To: <20180709125657.13192-1-andrej.valek@siemens.com>
References: <20180709125657.13192-1-andrej.valek@siemens.com>
Subject: [PATCH v6 2/3] openssl-1.1: rework packaging
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
X-List-Received-Date: Tue, 17 Jul 2018 09:10:59 -0000

The main idea is to have libssl and libcrypto in separate packages.
This saves space if only single library is needed and also some recipes
(in other layers) depend on these library packages.
Together with this other packages like in 1.0.x were created.
The only difference is that openssl 1.1 has additional package openssl-bin.

Add missing dependency to perl for openssl-bin pkg, c_rehash requires it.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Marko Peter <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index c5de085521..7af527ca31 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -158,12 +158,22 @@ do_install_ptest() {
         sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
 }
 
-PACKAGES =+ "${PN}-engines"
+PACKAGES =+ "libcrypto libssl ${PN}-misc ${PN}-engines openssl-conf"
 
+FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
+FILES_libssl = "${libdir}/libssl${SOLIBS}"
 FILES_${PN} =+ "${libdir}/ssl-1.1/*"
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
 
+FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
+RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
+
+FILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
+CONFFILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
+RRECOMMENDS_libcrypto += "openssl-conf"
+
+RDEPENDS_${PN}-bin = "perl"
 RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


