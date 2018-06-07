Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 40EE6748AA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 07:30:12 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w577UDg6013882
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2018 09:30:13 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w577UCtw005521;
	Thu, 7 Jun 2018 09:30:13 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id A91E195183E;
	Thu,  7 Jun 2018 09:30:12 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2018 09:25:01 +0200
Message-Id: <20180607072501.27158-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Cc: Marko Peter <pater.marko@siemens.com>
Subject: [PATCH] feat(openssl-1.1): rework packaging
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
X-List-Received-Date: Thu, 07 Jun 2018 07:30:13 -0000

The main ideas is to have libssl and libcrypto in separate packages.
This saves space if only single library is needed and also some recipes
(in other layers) depend on these library packages.
Together with this other packages like in 1.0.x were created.
The only difference is that openssl 1.1 has additional package openssl-bin.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Marko Peter <pater.marko@siemens.com>
---
 .../recipes-connectivity/openssl/openssl_1.1.0h.bb | 29 ++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 94b75eb92a..e5db9cffca 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
 
 S = "${WORKDIR}/openssl-${PV}"
 
-inherit lib_package multilib_header ptest
+inherit lib_package multilib_header ptest relative_symlinks
 
 do_configure () {
 	os=${HOST_OS}
@@ -131,15 +131,25 @@ EXTRA_OECONF_libc-musl += "-DOPENSSL_NO_ASYNC"
 
 do_install () {
         oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
-        oe_multilib_header openssl/opensslconf.h
-}
 
-do_install_append_class-native () {
         # Install a custom version of c_rehash that can handle sysroots properly.
         # This version is used for example when installing ca-certificates during
         # image creation.
         install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
         sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
+
+        oe_multilib_header openssl/opensslconf.h
+
+        # Create SSL structure
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
 
 do_install_ptest() {
@@ -154,8 +164,13 @@ do_install_ptest() {
 
 RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
 
+PACKAGES =+ "libcrypto libssl ${PN}-misc ${PN}-engines openssl-conf"
+FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
+FILES_libssl = "${libdir}/libssl${SOLIBS}"
 FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
-
-PACKAGES =+ "${PN}-engines"
+FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
+RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+RRECOMMENDS_libcrypto += "openssl-conf"
-- 
2.11.0


