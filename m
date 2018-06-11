Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 17CB574BF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 13:30:43 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w5BDUhPu015134
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 15:30:44 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w5BDUhuY010508;
	Mon, 11 Jun 2018 15:30:43 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 9A5A88ED3C5;
	Mon, 11 Jun 2018 15:30:43 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 15:30:04 +0200
Message-Id: <20180611133005.27521-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180611133005.27521-1-andrej.valek@siemens.com>
References: <20180611133005.27521-1-andrej.valek@siemens.com>
In-Reply-To: <20180608140403.27855-1-andrej.valek@siemens.com>
References: <20180608140403.27855-1-andrej.valek@siemens.com>
Subject: [PATCH v4 2/3] openssl-1.1: rework packaging
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
X-List-Received-Date: Mon, 11 Jun 2018 13:30:44 -0000

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
index eddf53c992..df05f3a2b7 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -155,8 +155,14 @@ do_install_ptest() {
 
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


