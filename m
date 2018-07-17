Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 757B1789BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:11:08 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w6H9B8lr027167
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:11:08 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w6H9B8Vk029523;
	Tue, 17 Jul 2018 11:11:08 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 321CA969B09;
	Tue, 17 Jul 2018 11:11:09 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 11:10:35 +0200
Message-Id: <20180717091035.26461-4-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717091035.26461-1-andrej.valek@siemens.com>
References: <20180717091035.26461-1-andrej.valek@siemens.com>
In-Reply-To: <20180709125657.13192-1-andrej.valek@siemens.com>
References: <20180709125657.13192-1-andrej.valek@siemens.com>
Subject: [PATCH v6 3/3] openssl-1.1: /etc/ssl location compatibility
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
X-List-Received-Date: Tue, 17 Jul 2018 09:11:09 -0000

Some packages have hard-coded path to /etc/ssl location.
Create a symlinks to correct location.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Marko Peter <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 7af527ca31..d6ef66ba51 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -22,7 +22,7 @@ SRC_URI_append_class-nativesdk = " \
 SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
 SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
 
-inherit lib_package multilib_header ptest
+inherit lib_package multilib_header ptest relative_symlinks
 
 #| engines/afalg/e_afalg.c: In function 'eventfd':
 #| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
@@ -133,6 +133,18 @@ do_configure () {
 do_install () {
         oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
         oe_multilib_header openssl/opensslconf.h
+
+        # Create SSL structure for PATH hard-coded packages like ca-certificates
+        # Debian is also using this technique
+        install -d ${D}${sysconfdir}/ssl/
+        mv ${D}${libdir}/ssl-1.1/openssl.cnf \
+           ${D}${libdir}/ssl-1.1/certs \
+           ${D}${libdir}/ssl-1.1/private \
+           \
+           ${D}${sysconfdir}/ssl/
+        ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl-1.1/certs
+        ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl-1.1/private
+        ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl-1.1/openssl.cnf
 }
 
 do_install_append_class-native () {
@@ -169,8 +181,8 @@ FILES_${PN}-engines = "${libdir}/engines-1.1"
 FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
 RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
 
-FILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
-CONFFILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf ${libdir}/ssl-1.1/openssl.cnf"
+CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 RRECOMMENDS_libcrypto += "openssl-conf"
 
 RDEPENDS_${PN}-bin = "perl"
-- 
2.11.0


