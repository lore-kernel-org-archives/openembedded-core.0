Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AF44460589
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 14:43:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2015 06:43:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,403,1444719600"; d="scan'208";a="837661865"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2015 06:43:07 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 16:40:22 +0200
Message-Id: <eabd8b5e8f190284202546c171b0893fe39cc3a6.1449671297.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/10] gnutls: update to 3.4.7
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
X-List-Received-Date: Wed, 09 Dec 2015 14:43:07 -0000

libidn is needed by the new version to compare hostnames.
Openssl compatibility is no longer enabled by default, but is
required by other packages in oe-core.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc             |  3 ++-
 ...tch => 0001-configure.ac-fix-sed-command.patch} | 29 +++++++++++-----------
 .../gnutls/{gnutls_3.3.17.1.bb => gnutls_3.4.7.bb} |  6 ++---
 3 files changed, 20 insertions(+), 18 deletions(-)
 rename meta/recipes-support/gnutls/gnutls/{configure.ac-fix-sed-command.patch => 0001-configure.ac-fix-sed-command.patch} (40%)
 rename meta/recipes-support/gnutls/{gnutls_3.3.17.1.bb => gnutls_3.4.7.bb} (42%)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index e9b138a..c1ec120 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -1,7 +1,7 @@
 SUMMARY = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
-DEPENDS = "nettle"
+DEPENDS = "nettle libidn"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -26,6 +26,7 @@ EXTRA_OECONF="--disable-rpath \
               --disable-guile \
               --disable-crywrap \
               --without-p11-kit \
+              --enable-openssl-compatibility \
               "
 
 do_configure_prepend() {
diff --git a/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch b/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch
similarity index 40%
rename from meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
rename to meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch
index 44a9934..c5b95eb 100644
--- a/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch
@@ -1,6 +1,6 @@
-From eb93aa7b986c84da60a3db40afb29d1a70c50223 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sat, 17 Jan 2015 17:02:15 +0000
+From 67c638c7e209554d9b19627e9402a20fdabead21 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 4 Dec 2015 13:19:28 +0200
 Subject: [PATCH] configure.ac: fix sed command
 
 The "sed 's/.bak//g'" matchs "bitbake", which would cause strange errors
@@ -9,23 +9,24 @@ when the S contains "bitbake", fix to "sed 's/\.bak$//'`"
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c6818a0..1c4582d 100644
+index e634236..dc9e6a8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -466,7 +466,7 @@ if test "$NEED_LIBOPTS_DIR" = "true";then
- 	dnl replace libopts-generated files with distributed backups, if present
- 	missing_baks=
- 	for i in ${srcdir}/src/*-args.c.bak ${srcdir}/src/*-args.h.bak; do
--		nam=`echo $i|sed 's/.bak//g'`
-+		nam=`echo $i|sed 's/\.bak$//'`
- 		if test -f $i;then
- 			cp -f $i $nam
- 		else
+@@ -549,7 +549,7 @@ if test "$enable_tools" != "no" || test "$enable_doc" != "no"; then
+ 		dnl replace libopts-generated files with distributed backups, if present
+ 		missing_baks=
+ 		for i in ${srcdir}/src/*-args.c.bak ${srcdir}/src/*-args.h.bak; do
+-			nam=`echo $i|sed 's/.bak//g'`
++                        nam=`echo $i|sed 's/\.bak$//'`
+ 			if test -f $i;then
+ 				cp -f $i $nam
+ 			else
 -- 
-2.0.1
+2.6.2
 
diff --git a/meta/recipes-support/gnutls/gnutls_3.3.17.1.bb b/meta/recipes-support/gnutls/gnutls_3.4.7.bb
similarity index 42%
rename from meta/recipes-support/gnutls/gnutls_3.3.17.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.4.7.bb
index 0185797..c90b44a 100644
--- a/meta/recipes-support/gnutls/gnutls_3.3.17.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.4.7.bb
@@ -1,8 +1,8 @@
 require gnutls.inc
 
 SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
-            file://configure.ac-fix-sed-command.patch \
+            file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
            "
-SRC_URI[md5sum] = "8d01c7e7f2cbc5871fdca832d2260b6b"
-SRC_URI[sha256sum] = "b40f158030a92f450a07b20300a3996710ca19800848d9f6fd62493170c5bbb4"
+SRC_URI[md5sum] = "e7556cec73c8b34fd2ff0b591e24e44c"
+SRC_URI[sha256sum] = "c1be9e4b30295d7b5f96fa332c6a908e6fa2254377b67811301fca92eb882e5a"
-- 
2.6.2


