Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 598DF7459B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 13:02:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB5D1F4k002601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 05:01:51 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Dec 2018 05:01:26 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 08:00:54 -0500
Message-ID: <c8270bb24c2d49efbbae987b794b70ba8d0a74e0.1544014163.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
In-Reply-To: <cover.1544014163.git.kai.kang@windriver.com>
References: <cover.1544014163.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] glibc-locale: fix installed-vs-shipped qa issue
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
X-List-Received-Date: Wed, 05 Dec 2018 13:02:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Variable PACKAGE_NO_GCONV is set in libc-package.bbclass when none of
libc-charsets, libc-locales and libc-locale-code set in DISTRO_FEATURES.
Then it causes installed-vs-shipped qa issue of glibc-locale:

| ERROR: glibc-locale-2.28-r0 do_package: QA Issue: glibc-locale:
| Files/directories were installed but not shipped in any package:
|   /usr/share/i18n
|   /usr/share/i18n/charmaps
|   /usr/share/i18n/locales
|   /usr/share/i18n/charmaps/CP737.gz
|   ...
|   /usr/share/i18n/locales/ru_RU
|   ...
|   /usr/lib64/gconv/gconv-modules
| Please set FILES such that these items are packaged. Alternatively if they
| are unneeded, avoid installing them or delete them within do_install.
| glibc-locale: 843 installed and not shipped files. [installed-vs-shipped]

So check PACKAGE_NO_GCONV during do_install and not copy those files if
PACKAGE_NO_GCONV has been set.

Simplify call of bb.utils.contains() in libc-package.bbclass as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/libc-package.bbclass        |  4 +---
 meta/recipes-core/glibc/glibc-locale.inc | 15 +++++++++------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 6b1e84ef7e..82d642e15e 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -39,9 +39,7 @@ python __anonymous () {
                 break
 
     # try to fix disable charsets/locales/locale-code compile fail
-    if bb.utils.contains('DISTRO_FEATURES', 'libc-charsets', True, False, d) and \
-            bb.utils.contains('DISTRO_FEATURES', 'libc-locales', True, False, d) and \
-            bb.utils.contains('DISTRO_FEATURES', 'libc-locale-code', True, False, d):
+    if bb.utils.contains('DISTRO_FEATURES', 'libc-charsets libc-locales libc-locale-code', True, False, d):
         d.setVar('PACKAGE_NO_GCONV', '0')
     else:
         d.setVar('PACKAGE_NO_GCONV', '1')
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 57b465dd5d..6384f9cbf1 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -72,7 +72,7 @@ FILES_localedef = "${bindir}/localedef"
 LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
 
 do_install () {
-	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir}
+	mkdir -p ${D}${bindir} ${D}${datadir}
 	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
 		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
 	fi
@@ -80,11 +80,14 @@ do_install () {
 		mkdir -p ${D}${localedir}
 		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
 	fi
-	if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
-		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
-	fi
-	if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
-		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
+	if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
+		mkdir -p ${D}${libdir}
+		if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
+			cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
+		fi
+		if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
+			cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
+		fi
 	fi
 	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
 		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
-- 
2.19.0.rc2


