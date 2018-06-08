Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id D74BF7538B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 14:04:29 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w58E4U9k031553
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jun 2018 16:04:30 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w58E4T3F023139;
	Fri, 8 Jun 2018 16:04:30 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id DE725C765B;
	Fri,  8 Jun 2018 16:04:29 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 16:04:03 +0200
Message-Id: <20180608140403.27855-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180608140403.27855-1-andrej.valek@siemens.com>
References: <20180608140403.27855-1-andrej.valek@siemens.com>
In-Reply-To: <24e47452-9ff5-778c-5146-599589458a3f@linux.intel.com>
References: <24e47452-9ff5-778c-5146-599589458a3f@linux.intel.com>
Subject: [PATCH v3 2/2] openssl-1.1: /etc/ssl location compatibility
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
X-List-Received-Date: Fri, 08 Jun 2018 14:04:30 -0000

Some packages has hard-coded path to /etc/ssl location.
Create a symlinks to correct location.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Marko Peter <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index c8e0255b33..bef03c574e 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
 
 S = "${WORKDIR}/openssl-${PV}"
 
-inherit lib_package multilib_header ptest
+inherit lib_package multilib_header ptest relative_symlinks
 
 do_configure () {
 	os=${HOST_OS}
@@ -133,6 +133,18 @@ EXTRA_OECONF_libc-musl += "-DOPENSSL_NO_ASYNC"
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
@@ -162,6 +174,6 @@ FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
 FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
 RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-FILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
-CONFFILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 RRECOMMENDS_libcrypto += "openssl-conf"
-- 
2.11.0


