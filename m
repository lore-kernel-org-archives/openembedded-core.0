Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1377557B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 07:47:45 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w6A7ljvw013224
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 09:47:45 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w6A7lj7H019864;
	Tue, 10 Jul 2018 09:47:45 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 6CECB62539B;
	Tue, 10 Jul 2018 09:47:45 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 09:46:53 +0200
Message-Id: <20180710074654.16213-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180710074654.16213-1-andrej.valek@siemens.com>
References: <20180710074654.16213-1-andrej.valek@siemens.com>
In-Reply-To: <20180709125657.13192-1-andrej.valek@siemens.com>
References: <20180709125657.13192-1-andrej.valek@siemens.com>
Subject: [PATCH v5 2/3] openssl-1.1: rework packaging
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
X-List-Received-Date: Tue, 10 Jul 2018 07:47:45 -0000

The main idea is to have libssl and libcrypto in separate packages.
This saves space if only single library is needed and also some recipes
(in other layers) depend on these library packages.
Together with this other packages like in 1.0.x were created.
The only difference is that openssl 1.1 has additional package openssl-bin.

Add missing dependency to perl for openssl-bin pkg, c_rehash requires it.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Marko Peter <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 3e068669b7..e2d3020a28 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -166,8 +166,14 @@ do_install_ptest() {
 
 RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
 
+PACKAGES =+ "libcrypto libssl ${PN}-misc ${PN}-engines openssl-conf"
+RDEPENDS_${PN}-bin = "perl"
+FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
+FILES_libssl = "${libdir}/libssl${SOLIBS}"
 FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
-
-PACKAGES =+ "${PN}-engines"
+FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
+RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-
+FILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
+CONFFILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
+RRECOMMENDS_libcrypto += "openssl-conf"
-- 
2.11.0


