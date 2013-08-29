Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 97DEA6BD00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 13:37:05 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Aug 2013 06:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,983,1367996400"; d="scan'208";a="288418920"
Received: from unknown (HELO localhost) ([10.255.15.104])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Aug 2013 06:37:05 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 08:37:02 -0500
Message-Id: <dbccbe87863a44d42568745cb82923ef2e1afaca.1377782855.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <adf271c181c7618690d25cd694af75e8183575ed.1377782855.git.tom.zanussi@linux.intel.com>
References: <adf271c181c7618690d25cd694af75e8183575ed.1377782855.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1377782855.git.tom.zanussi@linux.intel.com>
References: <cover.1377782855.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/2] lttng-ust: Update to version 2.2.1
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
X-List-Received-Date: Thu, 29 Aug 2013 13:37:05 -0000

Update lttng-ust to version 2.2.1 to correspond to the LTTng 2.2
"Cuda" - Tracer toolchain stable release.

This also removes all the local lttng-ust patches, which are now
upstream.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../lttng-ust/build-Fix-out-of-tree-build.patch    | 28 --------------------
 .../lttng-ust/depends-liblttng-ust-tracepoin.patch | 30 ----------------------
 .../{lttng-ust_2.2.0.bb => lttng-ust_2.2.1.bb}     |  6 ++---
 3 files changed, 2 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/build-Fix-out-of-tree-build.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.2.0.bb => lttng-ust_2.2.1.bb} (84%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/build-Fix-out-of-tree-build.patch b/meta/recipes-kernel/lttng/lttng-ust/build-Fix-out-of-tree-build.patch
deleted file mode 100644
index cc3220a..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust/build-Fix-out-of-tree-build.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d5a822fbeaec69e86c6af1f0ab8db0ff030f6678 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Tue, 2 Jul 2013 10:25:06 -0300
-Subject: [PATCH] build: Fix out-of-tree build
-
-To allow out-of-tree build, we need to include top_buildir in include
-directories or the generated config header won't be found.
-
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- liblttng-ust-comm/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/liblttng-ust-comm/Makefile.am b/liblttng-ust-comm/Makefile.am
-index 2ae997c..065dbbf 100644
---- a/liblttng-ust-comm/Makefile.am
-+++ b/liblttng-ust-comm/Makefile.am
-@@ -1,4 +1,4 @@
--AM_CPPFLAGS = -I$(top_srcdir)/include
-+AM_CPPFLAGS = -I$(top_builddir)/include -I$(top_srcdir)/include
- 
- noinst_LTLIBRARIES = liblttng-ust-comm.la
- 
--- 
-1.8.3.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch b/meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch
deleted file mode 100644
index 458a8d4..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-liblttng_ust.la should depend on liblttng-ust-tracepoint.la
-
-liblttng_ust.la should depend on liblttng-ust-tracepoint.la, otherwise
-there maybe a parallel build issue:
-
-ld: cannot find -llttng-ust-tracepoint
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- liblttng-ust/Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/liblttng-ust/Makefile.am b/liblttng-ust/Makefile.am
---- a/liblttng-ust/Makefile.am
-+++ b/liblttng-ust/Makefile.am
-@@ -67,7 +67,8 @@ liblttng_ust_la_LIBADD = \
- 	-llttng-ust-tracepoint \
- 	$(top_builddir)/snprintf/libustsnprintf.la \
- 	$(top_builddir)/liblttng-ust-comm/liblttng-ust-comm.la \
--	liblttng-ust-runtime.la liblttng-ust-support.la
-+	liblttng-ust-runtime.la liblttng-ust-support.la \
-+	liblttng-ust-tracepoint.la
- 
- if LTTNG_UST_BUILD_WITH_LIBUUID
- liblttng_ust_la_LIBADD += -luuid
--- 
-1.7.11.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb
similarity index 84%
rename from meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb
index d03f207..601aabb 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb
@@ -17,13 +17,11 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "cfaee541fea7f5760b5501913c6902f5e4da9dba"
-PV = "2.2.0"
+SRCREV = "481d245409b1caef7fc29790e53584eeb7d1d25d"
+PV = "2.2.1"
 PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git \
-	   file://depends-liblttng-ust-tracepoin.patch \
-	   file://build-Fix-out-of-tree-build.patch \
 	   "
 
 S = "${WORKDIR}/git"
-- 
1.7.11.4


