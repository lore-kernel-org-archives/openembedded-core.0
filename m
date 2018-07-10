Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 79D967557B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 07:47:55 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w6A7ltBM020542
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 09:47:55 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w6A7ltRp020526;
	Tue, 10 Jul 2018 09:47:55 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 5BD6762539B;
	Tue, 10 Jul 2018 09:47:55 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 09:46:54 +0200
Message-Id: <20180710074654.16213-4-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180710074654.16213-1-andrej.valek@siemens.com>
References: <20180710074654.16213-1-andrej.valek@siemens.com>
In-Reply-To: <20180709125657.13192-1-andrej.valek@siemens.com>
References: <20180709125657.13192-1-andrej.valek@siemens.com>
Subject: [PATCH v5 3/3] openssl-1.1: /etc/ssl location compatibility
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
X-List-Received-Date: Tue, 10 Jul 2018 07:47:55 -0000

Some packages have hard-coded path to /etc/ssl location.
Create a symlinks to correct location.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Marko Peter <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index e2d3020a28..ca6224165a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -26,7 +26,7 @@ SRC_URI_append_class-nativesdk = " \
 
 S = "${WORKDIR}/openssl-${PV}"
 
-inherit lib_package multilib_header ptest
+inherit lib_package multilib_header ptest relative_symlinks
 
 do_configure () {
 	os=${HOST_OS}
@@ -137,6 +137,18 @@ EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
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
@@ -174,6 +186,6 @@ FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
 FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
 RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-FILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
-CONFFILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf ${libdir}/ssl-1.1/openssl.cnf"
+CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 RRECOMMENDS_libcrypto += "openssl-conf"
-- 
2.11.0


