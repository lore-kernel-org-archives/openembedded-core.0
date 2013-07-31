Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C689E6B1C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 14:47:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2013 07:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="379514428"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2013 07:47:40 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 17:49:18 +0300
Message-Id: <58040721b55aa0c6b26a4b4224819ff8de34c31f.1375282034.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375282034.git.cristian.iorga@intel.com>
References: <cover.1375282034.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375282034.git.cristian.iorga@intel.com>
References: <cover.1375282034.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] alsa-lib: upgrade to v1.0.27.2
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
X-List-Received-Date: Wed, 31 Jul 2013 14:47:41 -0000

fix-O0-Optimize-unable-inline-function.patch,
obsolete_automake_macros.patch patches
included in upstream; removed.
unbreak_plugindir.patch not used, removed.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../fix-O0-Optimize-unable-inline-function.patch   | 63 ----------------------
 .../alsa/alsa-lib/obsolete_automake_macros.patch   | 15 ------
 .../alsa/alsa-lib/unbreak_plugindir.patch          | 14 -----
 .../{alsa-lib_1.0.26.bb => alsa-lib_1.0.27.2.bb}   | 12 ++---
 4 files changed, 4 insertions(+), 100 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-function.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/unbreak_plugindir.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.26.bb => alsa-lib_1.0.27.2.bb} (84%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-function.patch b/meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-function.patch
deleted file mode 100644
index 1e43c25..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-function.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Change function type from "extern __inline__" to "static __inline__"
-
-"extern __inline__ function()" is the inlined version that
-can be used in this compilation unit, but there will be another
-definition of this function somewhere, so compiler will not emit
-any code for the function body. This causes problem in -O0,
-where functions are never inlined, the function call is preserved,
-but linker can't find the symbol, thus the error happens.
-
-since no packages provide atomic_add and atomic_sub, and -O0
-Optimize is hoped to keep for debug, we can change extern to
-static to fix this problem.
-
-Upstream-Status: Pending
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- include/iatomic.h |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/include/iatomic.h b/include/iatomic.h
-index e92dbfd..364bc5c 100644
---- a/include/iatomic.h
-+++ b/include/iatomic.h
-@@ -720,7 +720,7 @@ typedef struct { volatile int counter; } atomic_t;
-  * Atomically adds @i to @v.  Note that the guaranteed useful range
-  * of an atomic_t is only 24 bits.
-  */
--extern __inline__ void atomic_add(int i, atomic_t * v)
-+static __inline__ void atomic_add(int i, atomic_t * v)
- {
- 	unsigned long temp;
- 
-@@ -744,7 +744,7 @@ extern __inline__ void atomic_add(int i, atomic_t * v)
-  * Atomically subtracts @i from @v.  Note that the guaranteed
-  * useful range of an atomic_t is only 24 bits.
-  */
--extern __inline__ void atomic_sub(int i, atomic_t * v)
-+static __inline__ void atomic_sub(int i, atomic_t * v)
- {
- 	unsigned long temp;
- 
-@@ -763,7 +763,7 @@ extern __inline__ void atomic_sub(int i, atomic_t * v)
- /*
-  * Same as above, but return the result value
-  */
--extern __inline__ int atomic_add_return(int i, atomic_t * v)
-+static __inline__ int atomic_add_return(int i, atomic_t * v)
- {
- 	unsigned long temp, result;
- 
-@@ -784,7 +784,7 @@ extern __inline__ int atomic_add_return(int i, atomic_t * v)
- 	return result;
- }
- 
--extern __inline__ int atomic_sub_return(int i, atomic_t * v)
-+static __inline__ int atomic_sub_return(int i, atomic_t * v)
- {
- 	unsigned long temp, result;
- 
--- 
-1.7.4.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/obsolete_automake_macros.patch b/meta/recipes-multimedia/alsa/alsa-lib/obsolete_automake_macros.patch
deleted file mode 100644
index 95c29da..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted [alsa-devel@alsa-project.org]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd alsa-lib-1.0.25/configure.in alsa-lib-1.0.25/configure.in
---- alsa-lib-1.0.25/configure.in	2012-01-25 09:56:56.000000000 +0200
-+++ alsa-lib-1.0.25/configure.in	2013-01-02 17:00:31.468090167 +0200
-@@ -53,7 +53,7 @@
-
- dnl Checks for header files.
- AC_HEADER_STDC
--AM_CONFIG_HEADER(include/config.h)
-+AC_CONFIG_HEADERS(include/config.h)
-
- dnl Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/unbreak_plugindir.patch b/meta/recipes-multimedia/alsa/alsa-lib/unbreak_plugindir.patch
deleted file mode 100644
index 1f3edd0..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/unbreak_plugindir.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -Nur alsa-lib-1.0.14.orig/configure.in alsa-lib-1.0.14/configure.in
---- alsa-lib-1.0.14.orig/configure.in	2007-05-31 03:05:13.000000000 -0500
-+++ alsa-lib-1.0.14/configure.in	2007-08-18 13:05:49.000000000 -0500
-@@ -93,7 +93,7 @@
-     esac
-     plugindir="$dir/$PACKAGE"
- fi
--AC_DEFINE_UNQUOTED(ALSA_PLUGIN_DIR, "plugindir", [directory containing ALSA add-on modules])
-+AC_DEFINE_UNQUOTED(ALSA_PLUGIN_DIR, "${plugindir}", [directory containing ALSA add-on modules])
- ALSA_PLUGIN_DIR="$plugindir"
- AC_SUBST(ALSA_PLUGIN_DIR)
- 
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
similarity index 84%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
index 6f22d06..5455944 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Alsa sound library"
+DESCRIPTION = "ALSA sound library"
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "libs/multimedia"
@@ -14,16 +14,12 @@ BBCLASSEXTEND = "native nativesdk"
 #FIXME: remove the following
 ARM_INSTRUCTION_SET = "arm"
 
-PR = "r0"
-
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
-           file://fix-tstamp-declaration.patch \
-           file://obsolete_automake_macros.patch \
-           file://fix-O0-Optimize-unable-inline-function.patch \
            file://Check-if-wordexp-function-is-supported.patch \
+           file://fix-tstamp-declaration.patch \
           "
-SRC_URI[md5sum] = "2dfa35d28471d721e592b616beedf965"
-SRC_URI[sha256sum] = "8c9f8161603cc3db640619650401292c3e110da63429ab6938aac763319f6e7d"
+SRC_URI[md5sum] = "69129a7c37697f81ac092335e9fa452b"
+SRC_URI[sha256sum] = "690ed393e7efd4fc7e3a2d2cda5449298ca0c895197e5914e350882012430d19"
 
 inherit autotools pkgconfig
 
-- 
1.8.1.2


