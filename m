Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DC4B87313B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302212"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:30 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:12 +0200
Message-Id: <cd156b401801409aaa83ff213312ba3bf5901b58.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/24] gnutls: update to 3.5.9
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:30 -0000

Drop 0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch, it's merged upstream.
Rebase 0001-configure.ac-fix-sed-command.patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...cli-args.h-to-cli-args.stamp-Makefile-tar.patch | 27 ----------------------
 .../gnutls/0001-configure.ac-fix-sed-command.patch | 26 ++++++++++-----------
 .../gnutls/{gnutls_3.5.7.bb => gnutls_3.5.9.bb}    |  5 ++--
 3 files changed, 15 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch
 rename meta/recipes-support/gnutls/{gnutls_3.5.7.bb => gnutls_3.5.9.bb} (52%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch b/meta/recipes-support/gnutls/gnutls/0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch
deleted file mode 100644
index 099081022db..00000000000
--- a/meta/recipes-support/gnutls/gnutls/0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 68ef47ab3472472780939671731c295481b5535f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 14 Dec 2016 17:42:45 +0200
-Subject: [PATCH] Do not add cli-args.h to cli-args.stamp Makefile target
-
-Upstream-Status: Submitted [https://gitlab.com/gnutls/gnutls/issues/155]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 49d3af3..827638e 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -261,7 +261,7 @@ cli-debug-args.stamp: $(srcdir)/cli-debug-args.def $(srcdir)/args-std.def
- 
- cli-args.h: cli-args.stamp
- cli-args.c: cli-args.stamp
--cli-args.stamp cli-args.h: $(srcdir)/cli-args.def $(srcdir)/args-std.def
-+cli-args.stamp: $(srcdir)/cli-args.def $(srcdir)/args-std.def
- 	-$(AUTOGEN) $<
- 	touch $@
- 
--- 
-2.10.2
-
diff --git a/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch b/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch
index c5b95eb5bfb..f0b7ca2ec84 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch
@@ -1,6 +1,6 @@
-From 67c638c7e209554d9b19627e9402a20fdabead21 Mon Sep 17 00:00:00 2001
+From eaab55bb6d48643163eebbc9ca575a9ca2a8e03f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 4 Dec 2015 13:19:28 +0200
+Date: Tue, 21 Feb 2017 17:10:07 +0200
 Subject: [PATCH] configure.ac: fix sed command
 
 The "sed 's/.bak//g'" matchs "bitbake", which would cause strange errors
@@ -15,18 +15,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e634236..dc9e6a8 100644
+index 6907b21..7c70d9e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -549,7 +549,7 @@ if test "$enable_tools" != "no" || test "$enable_doc" != "no"; then
- 		dnl replace libopts-generated files with distributed backups, if present
- 		missing_baks=
- 		for i in ${srcdir}/src/*-args.c.bak ${srcdir}/src/*-args.h.bak; do
--			nam=`echo $i|sed 's/.bak//g'`
-+                        nam=`echo $i|sed 's/\.bak$//'`
- 			if test -f $i;then
- 				cp -f $i $nam
- 			else
+@@ -948,7 +948,7 @@ YEAR=`date +%Y`
+ AC_SUBST([YEAR], $YEAR)
+ 
+ for i in ${srcdir}/src/*-args.c.bak ${srcdir}/src/*-args.h.bak; do
+-	nam=$(basename $i|sed 's/.bak//g')
++	nam=$(basename $i|sed 's/\.bak$//')
+ 	if test "$create_libopts_links" = "yes";then
+ 		rm -f "src/$nam"
+ 		AC_CONFIG_LINKS([src/$nam:$i])
 -- 
-2.6.2
+2.11.0
 
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.7.bb b/meta/recipes-support/gnutls/gnutls_3.5.9.bb
similarity index 52%
rename from meta/recipes-support/gnutls/gnutls_3.5.7.bb
rename to meta/recipes-support/gnutls/gnutls_3.5.9.bb
index 9508a8edcf5..8f84dbbf495 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.7.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.9.bb
@@ -3,9 +3,8 @@ require gnutls.inc
 SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
-            file://0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch \
             file://arm_eabi.patch \
            "
-SRC_URI[md5sum] = "08ad2c539bc1d91283f610539deef34e"
-SRC_URI[sha256sum] = "60cbfc119e6268cfa38d712621daa473298a0c5b129c0842caec4c1ed4d7861a"
+SRC_URI[md5sum] = "0ab25eb6a1509345dd085bc21a387951"
+SRC_URI[sha256sum] = "82b10f0c4ef18f4e64ad8cef5dbaf14be732f5095a41cf366b4ecb4050382951"
 
-- 
2.11.0


