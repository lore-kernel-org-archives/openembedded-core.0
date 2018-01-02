Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A3D47719A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 12:40:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 04:40:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,497,1508828400"; d="scan'208";a="18361700"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2018 04:40:54 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 9351B580319
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 04:40:53 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jan 2018 14:41:45 +0200
Message-Id: <1514896905-36107-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1514896905-36107-1-git-send-email-maxin.john@intel.com>
References: <1514896905-36107-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] pkgconf: upgrade to 1.3.90
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
X-List-Received-Date: Tue, 02 Jan 2018 12:40:53 -0000

1.3.7 -> 1.3.90

Removed following upstreamed and backported patches:
        1. 0001-stdinc.h-fix-build-with-mingw.patch
        2. 0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...imal-tweaks-to-compile-with-Visual-C-2015.patch | 224 ---------------------
 .../0001-stdinc.h-fix-build-with-mingw.patch       |  48 -----
 .../{pkgconf_1.3.7.bb => pkgconf_1.3.90.bb}        |   6 +-
 3 files changed, 2 insertions(+), 276 deletions(-)
 delete mode 100644 meta/recipes-devtools/pkgconf/pkgconf/0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch
 delete mode 100644 meta/recipes-devtools/pkgconf/pkgconf/0001-stdinc.h-fix-build-with-mingw.patch
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.3.7.bb => pkgconf_1.3.90.bb} (91%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf/0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch b/meta/recipes-devtools/pkgconf/pkgconf/0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch
deleted file mode 100644
index 3805ad3..0000000
--- a/meta/recipes-devtools/pkgconf/pkgconf/0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch
+++ /dev/null
@@ -1,224 +0,0 @@
-From 4d7b4d7c8e9966c593f472355607204c6c80fecb Mon Sep 17 00:00:00 2001
-From: Dan Kegel <dank@kegel.com>
-Date: Sun, 4 Jun 2017 19:19:55 -0700
-Subject: [PATCH] Minimal tweaks to compile with Visual C 2015
-
-Upstream-Status: Backport
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- getopt_long.c           |  2 ++
- libpkgconf/bsdstubs.c   |  1 +
- libpkgconf/libpkgconf.h |  2 +-
- libpkgconf/path.c       | 10 +++++-----
- libpkgconf/pkg.c        | 28 +++++++++++++++++++---------
- libpkgconf/stdinc.h     |  9 +++++++--
- 6 files changed, 35 insertions(+), 17 deletions(-)
-
-diff --git a/getopt_long.c b/getopt_long.c
-index afeb68d..5ce9bfd 100644
---- a/getopt_long.c
-+++ b/getopt_long.c
-@@ -62,7 +62,9 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#ifndef _WIN32
- #include <unistd.h>
-+#endif
- 
- #define PKGCONF_HACK_LOGICAL_OR_ALL_VALUES
- 
-diff --git a/libpkgconf/bsdstubs.c b/libpkgconf/bsdstubs.c
-index 8f70ff3..2c000ac 100644
---- a/libpkgconf/bsdstubs.c
-+++ b/libpkgconf/bsdstubs.c
-@@ -17,6 +17,7 @@
-  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-  */
- 
-+#include <stdlib.h>
- #include <sys/types.h>
- #include <string.h>
- 
-diff --git a/libpkgconf/libpkgconf.h b/libpkgconf/libpkgconf.h
-index 404bf0c..551d85d 100644
---- a/libpkgconf/libpkgconf.h
-+++ b/libpkgconf/libpkgconf.h
-@@ -310,7 +310,7 @@ void pkgconf_audit_log_dependency(pkgconf_client_t *client, const pkgconf_pkg_t
- /* path.c */
- void pkgconf_path_add(const char *text, pkgconf_list_t *dirlist, bool filter);
- size_t pkgconf_path_split(const char *text, pkgconf_list_t *dirlist, bool filter);
--size_t pkgconf_path_build_from_environ(const char *environ, const char *fallback, pkgconf_list_t *dirlist, bool filter);
-+size_t pkgconf_path_build_from_environ(const char *envvarname, const char *fallback, pkgconf_list_t *dirlist, bool filter);
- bool pkgconf_path_match_list(const char *path, const pkgconf_list_t *dirlist);
- void pkgconf_path_free(pkgconf_list_t *dirlist);
- bool pkgconf_path_relocate(char *buf, size_t buflen);
-diff --git a/libpkgconf/path.c b/libpkgconf/path.c
-index dddb3bf..59e003e 100644
---- a/libpkgconf/path.c
-+++ b/libpkgconf/path.c
-@@ -20,7 +20,7 @@
- # include <sys/cygwin.h>
- #endif
- 
--#ifdef HAVE_SYS_STAT_H
-+#if defined(HAVE_SYS_STAT_H) && ! defined(_WIN32)
- # include <sys/stat.h>
- # define PKGCONF_CACHE_INODES
- #endif
-@@ -156,12 +156,12 @@ pkgconf_path_split(const char *text, pkgconf_list_t *dirlist, bool filter)
- /*
-  * !doc
-  *
-- * .. c:function:: size_t pkgconf_path_build_from_environ(const char *environ, const char *fallback, pkgconf_list_t *dirlist)
-+ * .. c:function:: size_t pkgconf_path_build_from_environ(const char *envvarname, const char *fallback, pkgconf_list_t *dirlist)
-  *
-  *    Adds the paths specified in an environment variable to a path list.  If the environment variable is not set,
-  *    an optional default set of paths is added.
-  *
-- *    :param char* environ: The environment variable to look up.
-+ *    :param char* envvarname: The environment variable to look up.
-  *    :param char* fallback: The fallback paths to use if the environment variable is not set.
-  *    :param pkgconf_list_t* dirlist: The path list to add the path nodes to.
-  *    :param bool filter: Whether to perform duplicate filtering.
-@@ -169,11 +169,11 @@ pkgconf_path_split(const char *text, pkgconf_list_t *dirlist, bool filter)
-  *    :rtype: size_t
-  */
- size_t
--pkgconf_path_build_from_environ(const char *environ, const char *fallback, pkgconf_list_t *dirlist, bool filter)
-+pkgconf_path_build_from_environ(const char *envvarname, const char *fallback, pkgconf_list_t *dirlist, bool filter)
- {
- 	const char *data;
- 
--	data = getenv(environ);
-+	data = getenv(envvarname);
- 	if (data != NULL)
- 		return pkgconf_path_split(data, dirlist, filter);
- 
-diff --git a/libpkgconf/pkg.c b/libpkgconf/pkg.c
-index 7aebd61..5dacae3 100644
---- a/libpkgconf/pkg.c
-+++ b/libpkgconf/pkg.c
-@@ -30,6 +30,8 @@
- #	define PKG_CONFIG_REG_KEY "Software\\pkgconfig\\PKG_CONFIG_PATH"
- #	undef PKG_DEFAULT_PATH
- #	define PKG_DEFAULT_PATH "../lib/pkgconfig;../share/pkgconfig"
-+#define strncasecmp _strnicmp
-+#define strcasecmp _stricmp
- #endif
- 
- #define PKG_CONFIG_EXT		".pc"
-@@ -134,21 +136,21 @@ static int pkgconf_pkg_parser_keyword_pair_cmp(const void *key, const void *ptr)
- static void
- pkgconf_pkg_parser_tuple_func(const pkgconf_client_t *client, pkgconf_pkg_t *pkg, const ptrdiff_t offset, char *value)
- {
--	char **dest = ((void *) pkg + offset);
-+	char **dest = (char **)((char *) pkg + offset);
- 	*dest = pkgconf_tuple_parse(client, &pkg->vars, value);
- }
- 
- static void
- pkgconf_pkg_parser_fragment_func(const pkgconf_client_t *client, pkgconf_pkg_t *pkg, const ptrdiff_t offset, char *value)
- {
--	pkgconf_list_t *dest = ((void *) pkg + offset);
-+	pkgconf_list_t *dest = (pkgconf_list_t *)((char *) pkg + offset);
- 	pkgconf_fragment_parse(client, dest, &pkg->vars, value);
- }
- 
- static void
- pkgconf_pkg_parser_dependency_func(const pkgconf_client_t *client, pkgconf_pkg_t *pkg, const ptrdiff_t offset, char *value)
- {
--	pkgconf_list_t *dest = ((void *) pkg + offset);
-+	pkgconf_list_t *dest = (pkgconf_list_t *)((char *) pkg + offset);
- 	pkgconf_dependency_parse(client, pkg, dest, value);
- }
- 
-@@ -238,7 +240,7 @@ pkgconf_pkg_validate(const pkgconf_client_t *client, const pkgconf_pkg_t *pkg)
- 
- 	for (i = 0; i < PKGCONF_ARRAY_SIZE(pkgconf_pkg_validations); i++)
- 	{
--		char **p = ((void *) pkg + pkgconf_pkg_validations[i].offset);
-+		char **p = (char **)((char *) pkg + pkgconf_pkg_validations[i].offset);
- 
- 		if (*p != NULL)
- 			continue;
-@@ -587,7 +589,7 @@ pkgconf_scan_all(pkgconf_client_t *client, void *data, pkgconf_pkg_iteration_fun
- 
- #ifdef _WIN32
- static pkgconf_pkg_t *
--pkgconf_pkg_find_in_registry_key(const pkgconf_client_t *client, HKEY hkey, const char *name)
-+pkgconf_pkg_find_in_registry_key(pkgconf_client_t *client, HKEY hkey, const char *name)
- {
- 	pkgconf_pkg_t *pkg = NULL;
- 
-@@ -1048,8 +1050,12 @@ typedef struct {
- 
- static const pkgconf_pkg_provides_vermatch_rule_t pkgconf_pkg_provides_vermatch_rules[] = {
- 	[PKGCONF_CMP_ANY] = {
--		.rulecmp = {},
--		.depcmp = {},
-+		.rulecmp = {
-+			[PKGCONF_CMP_ANY]			= pkgconf_pkg_comparator_none,
-+                },
-+		.depcmp = {
-+			[PKGCONF_CMP_ANY]			= pkgconf_pkg_comparator_none,
-+                },
- 	},
- 	[PKGCONF_CMP_LESS_THAN] = {
- 		.rulecmp = {
-@@ -1121,7 +1127,9 @@ static const pkgconf_pkg_provides_vermatch_rule_t pkgconf_pkg_provides_vermatch_
- 			[PKGCONF_CMP_EQUAL]			= pkgconf_pkg_comparator_eq,
- 			[PKGCONF_CMP_NOT_EQUAL]			= pkgconf_pkg_comparator_ne
- 		},
--		.depcmp = {},
-+		.depcmp = {
-+			[PKGCONF_CMP_ANY]			= pkgconf_pkg_comparator_none,
-+                },
- 	},
- 	[PKGCONF_CMP_NOT_EQUAL] = {
- 		.rulecmp = {
-@@ -1133,7 +1141,9 @@ static const pkgconf_pkg_provides_vermatch_rule_t pkgconf_pkg_provides_vermatch_
- 			[PKGCONF_CMP_EQUAL]			= pkgconf_pkg_comparator_ne,
- 			[PKGCONF_CMP_NOT_EQUAL]			= pkgconf_pkg_comparator_eq
- 		},
--		.depcmp = {},
-+		.depcmp = {
-+			[PKGCONF_CMP_ANY]			= pkgconf_pkg_comparator_none,
-+                },
- 	},
- };
- 
-diff --git a/libpkgconf/stdinc.h b/libpkgconf/stdinc.h
-index 58cc6c7..ac7e53c 100644
---- a/libpkgconf/stdinc.h
-+++ b/libpkgconf/stdinc.h
-@@ -24,9 +24,7 @@
- #include <stdbool.h>
- #include <stdarg.h>
- #include <string.h>
--#include <dirent.h>
- #include <sys/types.h>
--#include <unistd.h>
- #include <stdint.h>
- 
- #ifdef _WIN32
-@@ -34,8 +32,15 @@
- # include <windows.h>
- # include <malloc.h>
- # define PATH_DEV_NULL	"nul"
-+# ifndef ssize_t
-+#  include <BaseTsd.h>
-+#  define ssize_t SSIZE_T
-+# endif
-+# include "win-dirent.h"
- #else
- # define PATH_DEV_NULL	"/dev/null"
-+# include <dirent.h>
-+# include <unistd.h>
- #endif
- 
- #endif
--- 
-2.4.0
-
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/0001-stdinc.h-fix-build-with-mingw.patch b/meta/recipes-devtools/pkgconf/pkgconf/0001-stdinc.h-fix-build-with-mingw.patch
deleted file mode 100644
index 49ebe31..0000000
--- a/meta/recipes-devtools/pkgconf/pkgconf/0001-stdinc.h-fix-build-with-mingw.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ea28c5b34457cf7676181b284e22ea5f79a30d85 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Thu, 13 Jul 2017 14:47:31 +0300
-Subject: [PATCH] stdinc.h: fix build with mingw
-
-Fixes this build error with mingw:
-...
-| compilation terminated.
-| In file included from ../pkgconf-1.3.7/libpkgconf/libpkgconf.h:19:0,
-| from ../pkgconf-1.3.7/libpkgconf/audit.c:16:
-| ../pkgconf-1.3.7/libpkgconf/stdinc.h:36:12: fatal error: BaseTsd.h: No
-such file or directory
-| # include <BaseTsd.h>
-
-Upstream-Status: Submitted
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- libpkgconf/stdinc.h | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/libpkgconf/stdinc.h b/libpkgconf/stdinc.h
-index ac7e53c..d8efcf5 100644
---- a/libpkgconf/stdinc.h
-+++ b/libpkgconf/stdinc.h
-@@ -33,10 +33,18 @@
- # include <malloc.h>
- # define PATH_DEV_NULL	"nul"
- # ifndef ssize_t
-+# ifndef __MINGW32__
- #  include <BaseTsd.h>
-+# else
-+#  include <basetsd.h>
-+# endif
- #  define ssize_t SSIZE_T
- # endif
--# include "win-dirent.h"
-+# ifndef __MINGW32__
-+#  include "win-dirent.h"
-+# else
-+# include <dirent.h>
-+# endif
- #else
- # define PATH_DEV_NULL	"/dev/null"
- # include <dirent.h>
--- 
-2.4.0
-
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.3.90.bb
similarity index 91%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.3.90.bb
index 5da0dd1..a521932 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.3.90.bb
@@ -17,14 +17,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=548a9d1db10cc0a84810c313a0e9266f"
 
 SRC_URI = "\
     https://distfiles.dereferenced.org/pkgconf/pkgconf-${PV}.tar.xz \
-    file://0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch \
-    file://0001-stdinc.h-fix-build-with-mingw.patch \
     file://pkg-config-wrapper \
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[md5sum] = "ac35c34d84eeb6a03d4d61b8555d6197"
-SRC_URI[sha256sum] = "1be7e40900c7467893c65f810211b1e68da3f8d5e70fddb883fc24839cad0339"
+SRC_URI[md5sum] = "d15186f3a688391a8c3a555f128e4db6"
+SRC_URI[sha256sum] = "112db7f957816901b5fe448715c0a9e38f171d4794c44075b0734a0e7fcfba36"
 
 inherit autotools update-alternatives
 
-- 
2.4.0


