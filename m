Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 26E5F6D44C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 19:58:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2013 11:58:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,709,1378882800"; d="scan'208";a="428452437"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2013 11:58:58 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 22:01:12 +0200
Message-Id: <cbf01bbdf88afd667de696bdff94d9da3c74059a.1384545568.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384545568.git.cristian.iorga@intel.com>
References: <cover.1384545568.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1384545568.git.cristian.iorga@intel.com>
References: <cover.1384545568.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] ofono: upgrade to 1.13
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
X-List-Received-Date: Fri, 15 Nov 2013 19:58:57 -0000

obsolete_automake_macros.patch and
missing-ssize_t.patch no longer needed,
included in upstream.
Better support for BlueZ5.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../ofono-1.12/obsolete_automake_macros.patch      | 14 -------------
 .../ofono/ofono/missing-ssize_t.patch              | 23 ----------------------
 .../ofono/{ofono_1.12.bb => ofono_1.13.bb}         |  8 ++------
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono-1.12/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch
 rename meta/recipes-connectivity/ofono/{ofono_1.12.bb => ofono_1.13.bb} (40%)

diff --git a/meta/recipes-connectivity/ofono/ofono-1.12/obsolete_automake_macros.patch b/meta/recipes-connectivity/ofono/ofono-1.12/obsolete_automake_macros.patch
deleted file mode 100644
index 31a102e..0000000
--- a/meta/recipes-connectivity/ofono/ofono-1.12/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Submitted [ofono@ofono.org]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd ofono-1.12/configure.ac ofono-1.12/configure.ac
---- ofono-1.12/configure.ac	2012-12-19 21:28:44.000000000 +0200
-+++ ofono-1.12/configure.ac	2013-01-12 11:18:40.681410757 +0200
-@@ -2,7 +2,7 @@
- AC_INIT(ofono, 1.12)
-
- AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
diff --git a/meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch b/meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch
deleted file mode 100644
index 71903c4..0000000
--- a/meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-include unistd.h for getting ssize_t definitions
-Fixes errors like
-
-| In file included from src/sms.c:38:0:
-| src/storage.h:32:1: error: unknown type name 'ssize_t'
-| src/storage.h:36:1: error: unknown type name 'ssize_t'
-
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: ofono-1.12/src/storage.h
-===================================================================
---- ofono-1.12.org/src/storage.h	2013-01-04 10:01:24.137804178 -0800
-+++ ofono-1.12/src/storage.h	2013-01-04 10:02:09.325806426 -0800
-@@ -26,6 +26,7 @@
- #endif
- 
- #include <fcntl.h>
-+#include <unistd.h>
- 
- int create_dirs(const char *filename, const mode_t mode);
- 
diff --git a/meta/recipes-connectivity/ofono/ofono_1.12.bb b/meta/recipes-connectivity/ofono/ofono_1.13.bb
similarity index 40%
rename from meta/recipes-connectivity/ofono/ofono_1.12.bb
rename to meta/recipes-connectivity/ofono/ofono_1.13.bb
index ad524a0..7a7e65c 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.12.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.13.bb
@@ -3,13 +3,9 @@ require ofono.inc
 SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
   file://ofono \
-  file://missing-ssize_t.patch \
-  file://obsolete_automake_macros.patch \
 "
 
-PR = "r2"
-
-SRC_URI[md5sum] = "aa8924c0e8de3ec7ac5e41fe7df4cb99"
-SRC_URI[sha256sum] = "733b75bfd1b2a1925b6de532989c496b8ae17a746691120ef64cceb00b3ef751"
+SRC_URI[md5sum] = "78112668d8444bc28d4b3359efd866f6"
+SRC_URI[sha256sum] = "3329c0af1e672777122981dfb9728b2c517f30f9d1b997e08e6177eb0109f0d3"
 
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.8.1.2


