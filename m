Return-Path: <jwessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 185AE6C10F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 19:16:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x68JGQDd026409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jul 2019 12:16:36 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 8 Jul 2019 12:16:16 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 0CD8AAA4795;
	Mon,  8 Jul 2019 12:16:16 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jul 2019 12:16:12 -0700
Message-ID: <20190708191612.128430-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] glibc / glibc-locale: Fix stash_locale determinism problems
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
X-List-Received-Date: Mon, 08 Jul 2019 19:16:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When using sstate, or performing an incremental build any change to
the do_stash_locale() will cause a build failure because
do_stash_locale() was destroying the results obtained from the
do_install() with several mv operations.  A recent change to
do_stash_locale() for a different problem illustrated a number of
build failures for users in the community.

To fix the problem, do_stash_locale() must use copy operations instead
of the mv operations.  Because this is changed to a copy, the sysroot
and package stage need to remove the files that would have been
previously removed.  The correct "fixup" code to deal with the removal
already existed in the previous do_poststash_install_cleanup().  All
that needed change was the path to where to remove the files
from the sysroot and package stages.

In order to force a re-compilation of glibc some unused white space
was removed from do_compile() for glibc.  I could not find any other
way around this and we don't want to have all the community folks to
have another iteration where they have to remove their tmp directories
or purge some portion of the sstate.  It also makes this change
bisectable. If the change to the glibc is not included, it will fail
with the following message:

=====
| DEBUG: Executing shell function do_prep_locale_tree
| tar: i18n: Cannot stat: No such file or directory
| tar: Exiting with failure status due to previous errors
| gzip: /poky/build/tmp/work/core2-64-poky-linux/glibc-locale/2.29-r0/locale-tree//usr/share/i18n/charmaps/*gz.gz: No such file or directory
=====

After this one time change I tested changing only the
do_stash_locale() function and it now works well because it is
deterministically operating off the sstate data or a local build.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 40 ++++++++++++++---------
 meta/recipes-core/glibc/glibc_2.29.bb     |  1 -
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index ff17a193c3..5cfb1b6ab9 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -164,13 +164,13 @@ do_stash_locale () {
 	install -d ${dest}${base_libdir} ${dest}${bindir} ${dest}${libdir} ${dest}${datadir}
 	# Hide away the locale data from the deployment
 	if [ -e ${D}${bindir}/localedef ]; then
-		mv -f ${D}${bindir}/localedef ${dest}${bindir}
+		cp -a ${D}${bindir}/localedef ${dest}${bindir}
 	fi
 	if [ -e ${D}${libdir}/gconv ]; then
-		mv -f ${D}${libdir}/gconv ${dest}${libdir}
+		cp -a ${D}${libdir}/gconv ${dest}${libdir}
 	fi
 	if [ -e ${D}${datadir}/i18n ]; then
-		mv ${D}${datadir}/i18n ${dest}${datadir}
+		cp -a  ${D}${datadir}/i18n ${dest}${datadir}
 	fi
 
 	# Make a copy of all the libraries into the locale stash
@@ -210,30 +210,38 @@ python do_stash_locale_setscene () {
 }
 addtask do_stash_locale_setscene
 
-do_poststash_install_cleanup () {
-	# Remove all files which do_stash_locale would remove (mv)
-	# since that task could have come from sstate and not get run.
+PACKAGE_PREPROCESS_FUNCS += "stash_locale_package_cleanup"
+SYSROOT_PREPROCESS_FUNCS += "stash_locale_sysroot_cleanup"
+stash_locale_cleanup () {
+	cleanupdir=$1
+	# Remove all files which do_stash_locale() copies
 	for i in ${bashscripts}; do
-	    rm -f ${D}${bindir}/$i
+	    rm -f ${cleanupdir}${bindir}/$i
 	done
-	rm -f ${D}${bindir}/localedef
-	rm -rf ${D}${datadir}/i18n
-	rm -rf ${D}${libdir}/gconv
-	rm -rf ${D}/${localedir}
-	rm -rf ${D}${datadir}/locale
+	rm -f ${cleanupdir}${bindir}/localedef
+	rm -rf ${cleanupdir}${datadir}/i18n
+	rm -rf ${cleanupdir}${libdir}/gconv
+	rm -rf ${cleanupdir}/${localedir}
+	rm -rf ${cleanupdir}${datadir}/locale
 	if [ "${libdir}" != "${exec_prefix}/lib" ] && [ "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then
-	    if [ -d "${D}${exec_prefix}/lib" ]; then
+	    if [ -d "${cleanupdir}${exec_prefix}/lib" ]; then
 		if [ -z "${ARCH_DYNAMIC_LOADER}" -o \
-		     ! -e "${D}${exec_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
+		     ! -e "${cleanupdir}${exec_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
 			# error out if directory isn't empty
 			# this dir should only contain locale dir
 			# which has been deleted in the previous step
-			rmdir ${D}${exec_prefix}/lib
+			rmdir ${cleanupdir}${exec_prefix}/lib
 		fi
 	    fi
 	fi
 }
-addtask do_poststash_install_cleanup after do_stash_locale do_install before do_populate_sysroot do_package
+
+stash_locale_sysroot_cleanup() {
+	stash_locale_cleanup ${SYSROOT_DESTDIR}
+}
+stash_locale_package_cleanup() {
+	stash_locale_cleanup ${PKGD}
+}
 
 pkg_postinst_nscd () {
 	if [ -z "$D" ]; then
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index 073d1533e3..c6b2caad42 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -121,7 +121,6 @@ do_compile () {
 		echo "ldd \"${prevrtld} ${RTLDLIST}\" -> \"${newrtld}\""
 		sed -i ${B}/elf/ldd -e "s#^RTLDLIST=.*\$#RTLDLIST=\"${newrtld}\"#"
 	fi
-
 }
 
 require glibc-package.inc
-- 
2.21.0


