Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7DABA60124
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 02:10:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="102174320"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Oct 2015 10:13:01 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t9N2ABYX021376
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 10:10:11 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 23 Oct 2015 10:10:42 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Oct 2015 10:10:36 +0800
Message-ID: <1445566236-9759-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH] smart/rpm: nativesdk should get RPM_ETCRPM from SDKTARGETSYSROOT not NATIVE_SYSROOT
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
X-List-Received-Date: Fri, 23 Oct 2015 02:10:53 -0000
Content-Type: text/plain

The config file of rpm will be installed into SDKTARGETSYSROOT for each architecture,
so RPM_ETCRPM should be set to SDKTARGETSYSROOT/etc/rpm.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta/recipes-devtools/python/python-smartpm_git.bb | 14 ++++++++++----
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           | 22 ++++++++++++++--------
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            | 22 ++++++++++++++--------
 3 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index d6c378b..21faafe 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -92,20 +92,26 @@ do_install_append() {
    fi
 }
 
-add_native_wrapper() {
+add_native_or_sdk_wrapper() {
+	if [ "$1" = "sdk" ]; then
+		RPM_ETCRPM='$'{RPM_ETCRPM-'$'SDKTARGETSYSROOT/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('base_prefix', True))}/rpm}
+	else
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm}
+	fi
+
         create_wrapper ${D}/${bindir}/smart \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_ETCRPM=${RPM_ETCRPM} \
 		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 }
 
 do_install_append_class-native() {
         sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' ${D}${bindir}/smart
-        add_native_wrapper
+        add_native_or_sdk_wrapper "native"
 }
 
 do_install_append_class-nativesdk() {
-        add_native_wrapper
+        add_native_or_sdk_wrapper "sdk"
 }
 
 PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-doc smartpm \
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 8903f3b..e452445 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -488,41 +488,47 @@ do_install_append() {
 
 }
 
-add_native_wrapper() {
+add_native_or_sdk_wrapper() {
+	if [ $1 = "sdk" ]; then
+		RPM_ETCRPM='$'{RPM_ETCRPM-'$'SDKTARGETSYSROOT/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('base_prefix', True))}/rpm}
+	else
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} 
+	fi
+
         create_wrapper ${D}/${bindir}/rpm \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_ETCRPM=${RPM_ETCRPM} \
 		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpm2cpio \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_ETCRPM=${RPM_ETCRPM} \
 		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpmbuild \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_ETCRPM=${RPM_ETCRPM} \
 		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpmconstant \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_ETCRPM=${RPM_ETCRPM} \
 		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
 	for rpm_binary in ${D}/${libdir}/rpm/bin/rpm* ${D}/${libdir}/rpm/bin/debugedit; do
         	create_wrapper $rpm_binary \
 			RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-			RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+			RPM_ETCRPM=${RPM_ETCRPM} \
 			RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 	done
 }
 
 do_install_append_class-native() {
-	add_native_wrapper
+	add_native_or_sdk_wrapper "native"
 }
 
 do_install_append_class-nativesdk() {
-	add_native_wrapper
+	add_native_or_sdk_wrapper "sdk"
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index b450c6f..75a7c3b 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -477,41 +477,47 @@ do_install_append() {
 
 }
 
-add_native_wrapper() {
+add_native_or_sdk_wrapper() {
+	if [ "$1" = "sdk" ]; then
+		RPM_ETCRPM='$'{RPM_ETCRPM-'$'SDKTARGETSYSROOT/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('base_prefix', True))}/rpm}
+	else
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm}
+	fi
+
         create_wrapper ${D}/${bindir}/rpm \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_ETCRPM=${RPM_ETCRPM} \
 		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpm2cpio \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_ETCRPM=${RPM_ETCRPM} \
 		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpmbuild \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_ETCRPM=${RPM_ETCRPM} \
 		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpmconstant \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_ETCRPM=${RPM_ETCRPM} \
 		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
 	for rpm_binary in ${D}/${libdir}/rpm/bin/rpm* ${D}/${libdir}/rpm/bin/debugedit; do
         	create_wrapper $rpm_binary \
 			RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-			RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+			RPM_ETCRPM=${RPM_ETCRPM} \
 			RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 	done
 }
 
 do_install_append_class-native() {
-	add_native_wrapper
+	add_native_or_sdk_wrapper "native"
 }
 
 do_install_append_class-nativesdk() {
-	add_native_wrapper
+	add_native_or_sdk_wrapper "sdk"
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


