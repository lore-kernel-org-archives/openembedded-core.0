Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8101B7198D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 15:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16FqMuE019020; Mon, 6 Feb 2017 15:52:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id p5MUPpyYcLdA; Mon,  6 Feb 2017 15:52:22 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16FqGla018997
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 6 Feb 2017 15:52:17 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1calaS-00026Q-8c; Mon, 06 Feb 2017 15:52:16 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 15:52:09 +0000
Message-Id: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/6] glibc: Separate locale files to their own sstate task
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
X-List-Received-Date: Mon, 06 Feb 2017 15:52:24 -0000

Putting the locale and script files into the sysroot for use by their
specific recipes used to be a simple way to share the files. With RSS,
we don't want to copy these into many different recipes so put these
files in their own sstate task.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-collateral.inc |  2 +-
 meta/recipes-core/glibc/glibc-initial.inc    |  7 +------
 meta/recipes-core/glibc/glibc-locale.inc     |  2 +-
 meta/recipes-core/glibc/glibc-package.inc    | 30 +++++++++++++++++-----------
 meta/recipes-core/glibc/glibc-scripts.inc    |  2 +-
 5 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index 6b32e4a..37f27ca 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -15,7 +15,7 @@ deltask do_patch
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
-do_install[depends] += "virtual/${MLPREFIX}libc:do_populate_sysroot"
+do_install[depends] += "virtual/${MLPREFIX}libc:do_stash_locale"
 
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 COMPATIBLE_HOST_libc-uclibc_class-target = "null"
diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
index 7380bdb..f94603c 100644
--- a/meta/recipes-core/glibc/glibc-initial.inc
+++ b/meta/recipes-core/glibc/glibc-initial.inc
@@ -43,7 +43,7 @@ do_install () {
 	fi
 }
 
-do_install_locale() {
+do_stash_locale() {
 	:
 }
 
@@ -51,9 +51,4 @@ do_siteconfig () {
 	:
 }
 
-# We don't install any scripts so there is nothing to evacuate
-do_evacuate_scripts () {
-	:
-}
-
 inherit nopackages
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 50b191c..9c99741 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -66,7 +66,7 @@ DESCRIPTION_localedef = "glibc: compile locale definition files"
 FILES_${MLPREFIX}glibc-gconv = "${libdir}/gconv/*"
 FILES_localedef = "${bindir}/localedef"
 
-LOCALETREESRC = "${STAGING_INCDIR}/glibc-locale-internal-${MULTIMACH_TARGET_SYS}"
+LOCALETREESRC = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
 
 do_install () {
 	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir}
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 481a00e..557b958 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -145,8 +145,11 @@ do_install_append_aarch64 () {
 	fi
 }
 
-do_install_locale () {
-	dest=${D}/${includedir}/glibc-locale-internal-${MULTIMACH_TARGET_SYS}
+LOCALESTASH = "${WORKDIR}/stashed-locale"
+bashscripts = "mtrace sotruss xtrace"
+
+do_stash_locale () {
+	dest=${LOCALESTASH}
 	install -d ${dest}${base_libdir} ${dest}${bindir} ${dest}${libdir} ${dest}${datadir}
 	if [ "${base_libdir}" != "${libdir}" ]; then
 		cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
@@ -166,14 +169,8 @@ do_install_locale () {
 	cp -fpPR ${D}${datadir}/* ${dest}${datadir}
 	rm -rf ${D}${datadir}/locale/
 	cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
-}
-
-addtask do_install_locale after do_install before do_populate_sysroot do_package
 
-bashscripts = "mtrace sotruss xtrace"
-
-do_evacuate_scripts () {
-	target=${D}${includedir}/glibc-scripts-internal-${MULTIMACH_TARGET_SYS}
+	target=${dest}/scripts
 	mkdir -p $target
 	for i in ${bashscripts}; do
 		if [ -f ${D}${bindir}/$i ]; then
@@ -182,13 +179,22 @@ do_evacuate_scripts () {
 	done
 }
 
-addtask evacuate_scripts after do_install before do_populate_sysroot do_package
+addtask do_stash_locale after do_install before do_populate_sysroot do_package
+do_stash_locale[dirs] = "${B}"
+do_stash_locale[cleandirs] = "${LOCALESTASH}"
+SSTATETASKS += "do_stash_locale"
+do_stash_locale[sstate-inputdirs] = "${LOCALESTASH}"
+do_stash_locale[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
+do_stash_locale[sstate-fixmedir] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
+
+python do_stash_locale_setscene () {
+    sstate_setscene(d)
+}
+addtask do_stash_locale_setscene
 
 PACKAGE_PREPROCESS_FUNCS += "glibc_package_preprocess"
 
 glibc_package_preprocess () {
-	rm -rf ${PKGD}/${includedir}/glibc-locale-internal-${MULTIMACH_TARGET_SYS}
-	rm -rf ${PKGD}/${includedir}/glibc-scripts-internal-${MULTIMACH_TARGET_SYS}
 	for i in ${bashscripts}; do
 	    rm -f ${PKGD}${bindir}/$i
 	done
diff --git a/meta/recipes-core/glibc/glibc-scripts.inc b/meta/recipes-core/glibc/glibc-scripts.inc
index 66fdee4..42616f0 100644
--- a/meta/recipes-core/glibc/glibc-scripts.inc
+++ b/meta/recipes-core/glibc/glibc-scripts.inc
@@ -4,7 +4,7 @@ SUMMARY = "utility scripts provided by glibc"
 DESCRIPTION = "utility scripts provided by glibc"
 RDEPENDS_${PN} = "bash glibc-mtrace"
 
-SRC = "${STAGING_INCDIR}/glibc-scripts-internal-${MULTIMACH_TARGET_SYS}"
+SRC = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale/scripts"
 
 bashscripts = "sotruss xtrace"
 
-- 
2.7.4


