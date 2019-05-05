Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 668747D088
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 10:04:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x45A4Rut008364
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 May 2019 03:04:27 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 5 May 2019 03:04:26 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Sun, 5 May 2019 18:04:24 +0800
Message-ID: <1557050664-19389-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] cpio/tar/native.bbclass: move rmt to sbindir and add a prefix to avoid native clashing
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
X-List-Received-Date: Sun, 05 May 2019 10:04:27 -0000
Content-Type: text/plain

The rmt in cpio-native and tar-native is clashing, since
tar-native has set var-NATIVE_PACKAGE_PATH_SUFFIX, we move rmt
to sbindir, and add suffix NATIVE_PACKAGE_PATH_SUFFIX to sbindir
could avoid the clashing.

And in Ubuntu, rmt is in sbindir
$ which rmt
/usr/sbin/rmt

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/native.bbclass             | 1 +
 meta/recipes-extended/cpio/cpio_2.12.bb | 6 +++---
 meta/recipes-extended/tar/tar_1.32.bb   | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index e9f6c74..d5b6f6a 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -89,6 +89,7 @@ export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir} /lib /lib64
 
 NATIVE_PACKAGE_PATH_SUFFIX ?= ""
 bindir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
+sbindir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 base_libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libexecdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
index cb845c3..3713bf0 100644
--- a/meta/recipes-extended/cpio/cpio_2.12.bb
+++ b/meta/recipes-extended/cpio/cpio_2.12.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "08a35e92deb3c85d269a0059a27d4140a9667a6369459299d08c17f713
 
 inherit autotools gettext texinfo
 
-EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
+EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
 do_install () {
     autotools_do_install
@@ -34,7 +34,7 @@ do_install () {
 
 PACKAGES =+ "${PN}-rmt"
 
-FILES_${PN}-rmt = "${base_sbindir}/rmt*"
+FILES_${PN}-rmt = "${sbindir}/rmt*"
 
 inherit update-alternatives
 
@@ -46,6 +46,6 @@ ALTERNATIVE_${PN}-rmt = "rmt"
 ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
 
 ALTERNATIVE_PRIORITY[rmt] = "50"
-ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
+ALTERNATIVE_LINK_NAME[rmt] = "${sbindir}/rmt"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index d14aeb8..7240fdb 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG_append_class-target = " ${@bb.utils.filter('DISTRO_FEATURES', 'acl
 
 PACKAGECONFIG[acl] = "--with-posix-acls,--without-posix-acls,acl"
 
-EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
+EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since tar has a lot of m4 files, otherwise there might
@@ -45,7 +45,7 @@ do_install_append_class-target() {
 
 PACKAGES =+ "${PN}-rmt"
 
-FILES_${PN}-rmt = "${base_sbindir}/rmt*"
+FILES_${PN}-rmt = "${sbindir}/rmt*"
 
 inherit update-alternatives
 
@@ -57,7 +57,7 @@ ALTERNATIVE_${PN}_class-nativesdk = ""
 ALTERNATIVE_${PN}-rmt_class-nativesdk = ""
 
 ALTERNATIVE_LINK_NAME[tar] = "${base_bindir}/tar"
-ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
+ALTERNATIVE_LINK_NAME[rmt] = "${sbindir}/rmt"
 
 PROVIDES_append_class-native = " tar-replacement-native"
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
-- 
2.7.4


