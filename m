Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E50B471DA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 23:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYaEM000371; Wed, 8 Feb 2017 23:34:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VQDc9xFaBrXQ; Wed,  8 Feb 2017 23:34:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYY1m000340
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Feb 2017 23:34:35 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cbbkw-0006QD-DS; Wed, 08 Feb 2017 23:34:34 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 23:34:23 +0000
Message-Id: <1486596869-24628-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/7] glibc-package: Avoid race sstate races with do_stash_locale
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
X-List-Received-Date: Wed, 08 Feb 2017 23:34:39 -0000

The change to make do_stash_locale an sstate task between do_install and
do_package has some unforeseen problems since the function deletes part of
${D} but may or may not run depending on whether the task is installed from
sstate.

This cleans up the current "pre packaging" function to be more deterministic
and result in the same set of files, whichever code path we end up reaching
that point by. Its not an ideal sitation but it should avoid the race
failures we've seen on some builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-package.inc | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 557b958..f0fc9c1 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -192,18 +192,23 @@ python do_stash_locale_setscene () {
 }
 addtask do_stash_locale_setscene
 
-PACKAGE_PREPROCESS_FUNCS += "glibc_package_preprocess"
-
-glibc_package_preprocess () {
+do_poststash_install_cleanup () {
+	# Remove all files which do_stash_locale would remove (mv)
+	# since that task could have come from sstate and not get run.
 	for i in ${bashscripts}; do
-	    rm -f ${PKGD}${bindir}/$i
+	    rm -f ${D}${bindir}/$i
 	done
-	rm -rf ${PKGD}/${localedir}
+	rm -f ${D}${bindir}/localedef
+	rm -rf ${D}${datadir}/i18n
+	rm -rf ${D}${libdir}/gconv
+	rm -rf ${D}/${localedir}
+	rm -rf ${D}${datadir}/locale
 	if [ "${libdir}" != "${exec_prefix}/lib" ]; then
 		# This dir only exists to hold locales
-		rm -rf ${PKGD}${exec_prefix}/lib
+		rm -rf ${D}${exec_prefix}/lib
 	fi
 }
+addtask do_poststash_install_cleanup after do_stash_locale do_install before do_populate_sysroot do_package
 
 pkg_postinst_nscd () {
 	if [ -z "$D" ]; then
-- 
2.7.4


