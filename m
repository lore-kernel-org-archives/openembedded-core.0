Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 73633789BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 13:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 291E51844B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:44:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id sDjiFAjm8FJF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:44:58 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8C1F5183BC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:44:58 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75A791A07C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:44:58 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AE121A077
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:44:58 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:44:58 +0100 (CET)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by seth.se.axis.com (Postfix) with ESMTP id 5F8DD280A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:44:58 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 5AE21409D1; Tue,  6 Mar 2018 14:44:58 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2018 14:44:58 +0100
Message-Id: <20180306134458.15080-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH] libcgroup: Various fixes
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
X-List-Received-Date: Tue, 06 Mar 2018 13:44:59 -0000

* Use PACKAGECONFIG for pam instead of two bb.utils.contains
* Add leading whitespace to EXTRA_OEMAKE_append_libc_musl
* Usr lnr in do_install_append rather than a sed generated
  ../-sequence.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/recipes-core/libcgroup/libcgroup_0.41.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.41.bb b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
index e4b1782ad4..7ddc81e9b7 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 inherit autotools pkgconfig
 
-DEPENDS = "bison-native flex-native ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "bison-native flex-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v0.41/${BPN}-${PV}.tar.bz2"
 SRC_URI_append_libc-musl = " file://musl-decls-compat.patch"
@@ -20,9 +20,10 @@ SRC_URI[sha256sum] = "e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6d404e17706
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libcg/files/libcgroup/"
 
 DEPENDS_append_libc-musl = " fts "
-EXTRA_OEMAKE_append_libc-musl = "LIBS=-lfts"
+EXTRA_OEMAKE_append_libc-musl = " LIBS=-lfts"
 
-EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG[pam] = "--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes,--enable-pam=no,libpam"
 
 PACKAGES =+ "cgroups-pam-plugin"
 FILES_cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
@@ -33,8 +34,8 @@ do_install_append() {
 	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
 		mkdir -p ${D}/${base_libdir}/
 		mv -f ${D}${libdir}/libcgroup.so.* ${D}${base_libdir}/
-		rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
-		ln -sf ${rel_lib_prefix}${base_libdir}/libcgroup.so.1 ${D}${libdir}/libcgroup.so
+		rm -f ${D}${libdir}/libcgroup.so
+		lnr ${D}${base_libdir}/libcgroup.so.1 ${D}${libdir}/libcgroup.so
 	fi
 	# pam modules in ${base_libdir}/security/ should be binary .so files, not symlinks.
 	if [ -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0 ]; then
-- 
2.11.0


