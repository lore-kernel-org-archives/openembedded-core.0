Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 460157827B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 15:08:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Aug 2017 08:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,409,1498546800"; d="scan'208";a="1208436245"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2017 08:07:58 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 3909D5803BE;
	Mon, 21 Aug 2017 08:07:57 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 18:09:45 +0300
Message-Id: <1503328185-27586-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v3] pkgconf: add recipe
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
X-List-Received-Date: Mon, 21 Aug 2017 15:08:21 -0000

pkgconf is a better replacement for pkg-config. Fedora 26 replaces the
system pkg-config implementation with pkgconf because it "provides better
support for handling .pc files and a stable library ABI/API for integrating
into applications." and is actively maintained, unlike pkg-config.

pkgconf aims to offer many improvements over pkg-config such as faster/more
efficient dependency resolver which "allows for the user to more conservatively
link their binaries -- which may be helpful in some environments, such as when
prelink(1) is being used.

pkgconf also aims to provide a more complete implementation of pkg-config.
The features most likely to benefit the Yocto Project build system are the
faster/more efficient dependency resolution and linker flag optimisation.

Move pkgconf recipe to oe-core from meta-pkgconf:
https://github.com/kergoth/meta-kergoth-wip/tree/master/meta-pkgconf

Links:
1. http://pkgconf.org
2. https://fedoraproject.org/wiki/Changes/pkgconf_as_system_pkg-config_implementation
3. https://bugzilla.yoctoproject.org/show_bug.cgi?id=11308

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
To test this, after applying these patches, update "local.conf" as below:

PREFERRED_PROVIDER_pkgconfig = "pkgconf"
PREFERRED_PROVIDER_pkgconfig-native = "pkgconf-native"
PREFERRED_PROVIDER_nativesdk-pkgconfig = "nativesdk-pkgconf"

Changes in v2:
    Fixes for mingw

Changes in v3:
    Include the esdk fix
---
 meta/files/common-licenses/pkgconf                 |  10 +
 ...imal-tweaks-to-compile-with-Visual-C-2015.patch | 224 +++++++++++++++++++++
 .../0001-stdinc.h-fix-build-with-mingw.patch       |  48 +++++
 .../pkgconf/pkgconf/pkg-config-esdk.in             |  24 +++
 .../pkgconf/pkgconf/pkg-config-native.in           |   6 +
 .../pkgconf/pkgconf/pkg-config-wrapper             |  16 ++
 meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb     |  73 +++++++
 7 files changed, 401 insertions(+)
 create mode 100644 meta/files/common-licenses/pkgconf
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/0001-stdinc.h-fix-build-with-mingw.patch
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
 create mode 100755 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb

diff --git a/meta/files/common-licenses/pkgconf b/meta/files/common-licenses/pkgconf
new file mode 100644
index 0000000..81a5221
--- /dev/null
+++ b/meta/files/common-licenses/pkgconf
@@ -0,0 +1,10 @@
+Copyright (c) 2011, 2012, 2013, 2014, 2015, 2016, 2017
+    pkgconf authors (see AUTHORS file in source directory).
+
+Permission to use, copy, modify, and/or distribute this software for any
+purpose with or without fee is hereby granted, provided that the above
+copyright notice and this permission notice appear in all copies.
+
+This software is provided 'as is' and without any warranty, express or
+implied.  In no event shall the authors be liable for any damages arising
+from the use of this software.
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch b/meta/recipes-devtools/pkgconf/pkgconf/0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch
new file mode 100644
index 0000000..3805ad3
--- /dev/null
+++ b/meta/recipes-devtools/pkgconf/pkgconf/0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch
@@ -0,0 +1,224 @@
+From 4d7b4d7c8e9966c593f472355607204c6c80fecb Mon Sep 17 00:00:00 2001
+From: Dan Kegel <dank@kegel.com>
+Date: Sun, 4 Jun 2017 19:19:55 -0700
+Subject: [PATCH] Minimal tweaks to compile with Visual C 2015
+
+Upstream-Status: Backport
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ getopt_long.c           |  2 ++
+ libpkgconf/bsdstubs.c   |  1 +
+ libpkgconf/libpkgconf.h |  2 +-
+ libpkgconf/path.c       | 10 +++++-----
+ libpkgconf/pkg.c        | 28 +++++++++++++++++++---------
+ libpkgconf/stdinc.h     |  9 +++++++--
+ 6 files changed, 35 insertions(+), 17 deletions(-)
+
+diff --git a/getopt_long.c b/getopt_long.c
+index afeb68d..5ce9bfd 100644
+--- a/getopt_long.c
++++ b/getopt_long.c
+@@ -62,7 +62,9 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#ifndef _WIN32
+ #include <unistd.h>
++#endif
+ 
+ #define PKGCONF_HACK_LOGICAL_OR_ALL_VALUES
+ 
+diff --git a/libpkgconf/bsdstubs.c b/libpkgconf/bsdstubs.c
+index 8f70ff3..2c000ac 100644
+--- a/libpkgconf/bsdstubs.c
++++ b/libpkgconf/bsdstubs.c
+@@ -17,6 +17,7 @@
+  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+  */
+ 
++#include <stdlib.h>
+ #include <sys/types.h>
+ #include <string.h>
+ 
+diff --git a/libpkgconf/libpkgconf.h b/libpkgconf/libpkgconf.h
+index 404bf0c..551d85d 100644
+--- a/libpkgconf/libpkgconf.h
++++ b/libpkgconf/libpkgconf.h
+@@ -310,7 +310,7 @@ void pkgconf_audit_log_dependency(pkgconf_client_t *client, const pkgconf_pkg_t
+ /* path.c */
+ void pkgconf_path_add(const char *text, pkgconf_list_t *dirlist, bool filter);
+ size_t pkgconf_path_split(const char *text, pkgconf_list_t *dirlist, bool filter);
+-size_t pkgconf_path_build_from_environ(const char *environ, const char *fallback, pkgconf_list_t *dirlist, bool filter);
++size_t pkgconf_path_build_from_environ(const char *envvarname, const char *fallback, pkgconf_list_t *dirlist, bool filter);
+ bool pkgconf_path_match_list(const char *path, const pkgconf_list_t *dirlist);
+ void pkgconf_path_free(pkgconf_list_t *dirlist);
+ bool pkgconf_path_relocate(char *buf, size_t buflen);
+diff --git a/libpkgconf/path.c b/libpkgconf/path.c
+index dddb3bf..59e003e 100644
+--- a/libpkgconf/path.c
++++ b/libpkgconf/path.c
+@@ -20,7 +20,7 @@
+ # include <sys/cygwin.h>
+ #endif
+ 
+-#ifdef HAVE_SYS_STAT_H
++#if defined(HAVE_SYS_STAT_H) && ! defined(_WIN32)
+ # include <sys/stat.h>
+ # define PKGCONF_CACHE_INODES
+ #endif
+@@ -156,12 +156,12 @@ pkgconf_path_split(const char *text, pkgconf_list_t *dirlist, bool filter)
+ /*
+  * !doc
+  *
+- * .. c:function:: size_t pkgconf_path_build_from_environ(const char *environ, const char *fallback, pkgconf_list_t *dirlist)
++ * .. c:function:: size_t pkgconf_path_build_from_environ(const char *envvarname, const char *fallback, pkgconf_list_t *dirlist)
+  *
+  *    Adds the paths specified in an environment variable to a path list.  If the environment variable is not set,
+  *    an optional default set of paths is added.
+  *
+- *    :param char* environ: The environment variable to look up.
++ *    :param char* envvarname: The environment variable to look up.
+  *    :param char* fallback: The fallback paths to use if the environment variable is not set.
+  *    :param pkgconf_list_t* dirlist: The path list to add the path nodes to.
+  *    :param bool filter: Whether to perform duplicate filtering.
+@@ -169,11 +169,11 @@ pkgconf_path_split(const char *text, pkgconf_list_t *dirlist, bool filter)
+  *    :rtype: size_t
+  */
+ size_t
+-pkgconf_path_build_from_environ(const char *environ, const char *fallback, pkgconf_list_t *dirlist, bool filter)
++pkgconf_path_build_from_environ(const char *envvarname, const char *fallback, pkgconf_list_t *dirlist, bool filter)
+ {
+ 	const char *data;
+ 
+-	data = getenv(environ);
++	data = getenv(envvarname);
+ 	if (data != NULL)
+ 		return pkgconf_path_split(data, dirlist, filter);
+ 
+diff --git a/libpkgconf/pkg.c b/libpkgconf/pkg.c
+index 7aebd61..5dacae3 100644
+--- a/libpkgconf/pkg.c
++++ b/libpkgconf/pkg.c
+@@ -30,6 +30,8 @@
+ #	define PKG_CONFIG_REG_KEY "Software\\pkgconfig\\PKG_CONFIG_PATH"
+ #	undef PKG_DEFAULT_PATH
+ #	define PKG_DEFAULT_PATH "../lib/pkgconfig;../share/pkgconfig"
++#define strncasecmp _strnicmp
++#define strcasecmp _stricmp
+ #endif
+ 
+ #define PKG_CONFIG_EXT		".pc"
+@@ -134,21 +136,21 @@ static int pkgconf_pkg_parser_keyword_pair_cmp(const void *key, const void *ptr)
+ static void
+ pkgconf_pkg_parser_tuple_func(const pkgconf_client_t *client, pkgconf_pkg_t *pkg, const ptrdiff_t offset, char *value)
+ {
+-	char **dest = ((void *) pkg + offset);
++	char **dest = (char **)((char *) pkg + offset);
+ 	*dest = pkgconf_tuple_parse(client, &pkg->vars, value);
+ }
+ 
+ static void
+ pkgconf_pkg_parser_fragment_func(const pkgconf_client_t *client, pkgconf_pkg_t *pkg, const ptrdiff_t offset, char *value)
+ {
+-	pkgconf_list_t *dest = ((void *) pkg + offset);
++	pkgconf_list_t *dest = (pkgconf_list_t *)((char *) pkg + offset);
+ 	pkgconf_fragment_parse(client, dest, &pkg->vars, value);
+ }
+ 
+ static void
+ pkgconf_pkg_parser_dependency_func(const pkgconf_client_t *client, pkgconf_pkg_t *pkg, const ptrdiff_t offset, char *value)
+ {
+-	pkgconf_list_t *dest = ((void *) pkg + offset);
++	pkgconf_list_t *dest = (pkgconf_list_t *)((char *) pkg + offset);
+ 	pkgconf_dependency_parse(client, pkg, dest, value);
+ }
+ 
+@@ -238,7 +240,7 @@ pkgconf_pkg_validate(const pkgconf_client_t *client, const pkgconf_pkg_t *pkg)
+ 
+ 	for (i = 0; i < PKGCONF_ARRAY_SIZE(pkgconf_pkg_validations); i++)
+ 	{
+-		char **p = ((void *) pkg + pkgconf_pkg_validations[i].offset);
++		char **p = (char **)((char *) pkg + pkgconf_pkg_validations[i].offset);
+ 
+ 		if (*p != NULL)
+ 			continue;
+@@ -587,7 +589,7 @@ pkgconf_scan_all(pkgconf_client_t *client, void *data, pkgconf_pkg_iteration_fun
+ 
+ #ifdef _WIN32
+ static pkgconf_pkg_t *
+-pkgconf_pkg_find_in_registry_key(const pkgconf_client_t *client, HKEY hkey, const char *name)
++pkgconf_pkg_find_in_registry_key(pkgconf_client_t *client, HKEY hkey, const char *name)
+ {
+ 	pkgconf_pkg_t *pkg = NULL;
+ 
+@@ -1048,8 +1050,12 @@ typedef struct {
+ 
+ static const pkgconf_pkg_provides_vermatch_rule_t pkgconf_pkg_provides_vermatch_rules[] = {
+ 	[PKGCONF_CMP_ANY] = {
+-		.rulecmp = {},
+-		.depcmp = {},
++		.rulecmp = {
++			[PKGCONF_CMP_ANY]			= pkgconf_pkg_comparator_none,
++                },
++		.depcmp = {
++			[PKGCONF_CMP_ANY]			= pkgconf_pkg_comparator_none,
++                },
+ 	},
+ 	[PKGCONF_CMP_LESS_THAN] = {
+ 		.rulecmp = {
+@@ -1121,7 +1127,9 @@ static const pkgconf_pkg_provides_vermatch_rule_t pkgconf_pkg_provides_vermatch_
+ 			[PKGCONF_CMP_EQUAL]			= pkgconf_pkg_comparator_eq,
+ 			[PKGCONF_CMP_NOT_EQUAL]			= pkgconf_pkg_comparator_ne
+ 		},
+-		.depcmp = {},
++		.depcmp = {
++			[PKGCONF_CMP_ANY]			= pkgconf_pkg_comparator_none,
++                },
+ 	},
+ 	[PKGCONF_CMP_NOT_EQUAL] = {
+ 		.rulecmp = {
+@@ -1133,7 +1141,9 @@ static const pkgconf_pkg_provides_vermatch_rule_t pkgconf_pkg_provides_vermatch_
+ 			[PKGCONF_CMP_EQUAL]			= pkgconf_pkg_comparator_ne,
+ 			[PKGCONF_CMP_NOT_EQUAL]			= pkgconf_pkg_comparator_eq
+ 		},
+-		.depcmp = {},
++		.depcmp = {
++			[PKGCONF_CMP_ANY]			= pkgconf_pkg_comparator_none,
++                },
+ 	},
+ };
+ 
+diff --git a/libpkgconf/stdinc.h b/libpkgconf/stdinc.h
+index 58cc6c7..ac7e53c 100644
+--- a/libpkgconf/stdinc.h
++++ b/libpkgconf/stdinc.h
+@@ -24,9 +24,7 @@
+ #include <stdbool.h>
+ #include <stdarg.h>
+ #include <string.h>
+-#include <dirent.h>
+ #include <sys/types.h>
+-#include <unistd.h>
+ #include <stdint.h>
+ 
+ #ifdef _WIN32
+@@ -34,8 +32,15 @@
+ # include <windows.h>
+ # include <malloc.h>
+ # define PATH_DEV_NULL	"nul"
++# ifndef ssize_t
++#  include <BaseTsd.h>
++#  define ssize_t SSIZE_T
++# endif
++# include "win-dirent.h"
+ #else
+ # define PATH_DEV_NULL	"/dev/null"
++# include <dirent.h>
++# include <unistd.h>
+ #endif
+ 
+ #endif
+-- 
+2.4.0
+
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/0001-stdinc.h-fix-build-with-mingw.patch b/meta/recipes-devtools/pkgconf/pkgconf/0001-stdinc.h-fix-build-with-mingw.patch
new file mode 100644
index 0000000..49ebe31
--- /dev/null
+++ b/meta/recipes-devtools/pkgconf/pkgconf/0001-stdinc.h-fix-build-with-mingw.patch
@@ -0,0 +1,48 @@
+From ea28c5b34457cf7676181b284e22ea5f79a30d85 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Thu, 13 Jul 2017 14:47:31 +0300
+Subject: [PATCH] stdinc.h: fix build with mingw
+
+Fixes this build error with mingw:
+...
+| compilation terminated.
+| In file included from ../pkgconf-1.3.7/libpkgconf/libpkgconf.h:19:0,
+| from ../pkgconf-1.3.7/libpkgconf/audit.c:16:
+| ../pkgconf-1.3.7/libpkgconf/stdinc.h:36:12: fatal error: BaseTsd.h: No
+such file or directory
+| # include <BaseTsd.h>
+
+Upstream-Status: Submitted
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ libpkgconf/stdinc.h | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/libpkgconf/stdinc.h b/libpkgconf/stdinc.h
+index ac7e53c..d8efcf5 100644
+--- a/libpkgconf/stdinc.h
++++ b/libpkgconf/stdinc.h
+@@ -33,10 +33,18 @@
+ # include <malloc.h>
+ # define PATH_DEV_NULL	"nul"
+ # ifndef ssize_t
++# ifndef __MINGW32__
+ #  include <BaseTsd.h>
++# else
++#  include <basetsd.h>
++# endif
+ #  define ssize_t SSIZE_T
+ # endif
+-# include "win-dirent.h"
++# ifndef __MINGW32__
++#  include "win-dirent.h"
++# else
++# include <dirent.h>
++# endif
+ #else
+ # define PATH_DEV_NULL	"/dev/null"
+ # include <dirent.h>
+-- 
+2.4.0
+
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
new file mode 100644
index 0000000..4fc9b0a
--- /dev/null
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
@@ -0,0 +1,24 @@
+#! /bin/sh
+
+# Orignal pkg-config-native action when called as pkg-config-native
+# NO Change here
+if [ "pkg-config-native" = "`basename $0`" ] ; then
+	PKG_CONFIG_PATH="@PATH_NATIVE@"
+	PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
+	unset PKG_CONFIG_SYSROOT_DIR
+else
+	# in this case check if we are in the esdk
+	if [ "$OE_SKIP_SDK_CHECK" = "1" ] ; then
+		parentpid=`ps -o ppid= -p $$`
+		parentpid_info=`ps -wo comm= -o args= -p $parentpid`
+
+		# check if we are being called from  the kernel's make menuconfig
+		if ( echo $parentpid_info | grep -q check-lxdialog ) ; then
+			PKG_CONFIG_PATH="@PATH_NATIVE@"
+			PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
+			unset PKG_CONFIG_SYSROOT_DIR
+		fi
+	fi
+fi
+
+pkg-config.real "$@"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
new file mode 100644
index 0000000..9ed30a0
--- /dev/null
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
@@ -0,0 +1,6 @@
+#! /bin/sh
+
+PKG_CONFIG_PATH="@PATH_NATIVE@"
+unset PKG_CONFIG_SYSROOT_DIR
+
+pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
new file mode 100755
index 0000000..695f349
--- /dev/null
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
@@ -0,0 +1,16 @@
+#!/bin/sh
+# pkgconf wrapper to deal with pkg-config/pkgconf compatibility issues
+#
+# Copyright (C) 2015 Christopher Larson <chris_larson@mentor.com>
+# License: MIT (see COPYING.MIT at the root of the repository for terms)
+
+for arg; do
+    case "$arg" in
+        --variable|--variable=*)
+            # pkg-config doesn't sysroot-prefix user variables
+            unset PKG_CONFIG_SYSROOT_DIR
+            ;;
+    esac
+done
+
+exec pkgconf "$@"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
new file mode 100644
index 0000000..5da0dd1
--- /dev/null
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
@@ -0,0 +1,73 @@
+SUMMARY = "pkgconf provides compiler and linker configuration for development frameworks."
+DESCRIPTION = "pkgconf is a program which helps to configure compiler and linker \
+flags for development frameworks. It is similar to pkg-config from \
+freedesktop.org, providing additional functionality while also maintaining \
+compatibility."
+HOMEPAGE = "http://pkgconf.org"
+BUGTRACKER = "https://github.com/pkgconf/pkgconf/issues"
+SECTION = "devel"
+PROVIDES += "pkgconfig"
+RPROVIDES_${PN} += "pkgconfig"
+DEFAULT_PREFERENCE = "-1"
+
+# The pkgconf license seems to be functionally equivalent to BSD-2-Clause or
+# ISC, but has different wording, so needs its own name.
+LICENSE = "pkgconf"
+LIC_FILES_CHKSUM = "file://COPYING;md5=548a9d1db10cc0a84810c313a0e9266f"
+
+SRC_URI = "\
+    https://distfiles.dereferenced.org/pkgconf/pkgconf-${PV}.tar.xz \
+    file://0001-Minimal-tweaks-to-compile-with-Visual-C-2015.patch \
+    file://0001-stdinc.h-fix-build-with-mingw.patch \
+    file://pkg-config-wrapper \
+    file://pkg-config-native.in \
+    file://pkg-config-esdk.in \
+"
+SRC_URI[md5sum] = "ac35c34d84eeb6a03d4d61b8555d6197"
+SRC_URI[sha256sum] = "1be7e40900c7467893c65f810211b1e68da3f8d5e70fddb883fc24839cad0339"
+
+inherit autotools update-alternatives
+
+EXTRA_OECONF += "--with-pkg-config-dir='${libdir}/pkgconfig:${datadir}/pkgconfig'"
+
+do_install_append () {
+    # Install a wrapper which deals, as much as possible with pkgconf vs
+    # pkg-config compatibility issues.
+    install -m 0755 "${WORKDIR}/pkg-config-wrapper" "${D}${bindir}/pkg-config"
+}
+
+do_install_append_class-native () {
+    # Install a pkg-config-native wrapper that will use the native sysroot instead
+    # of the MACHINE sysroot, for using pkg-config when building native tools.
+    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
+        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
+        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
+        < ${WORKDIR}/pkg-config-esdk.in > ${B}/pkg-config-esdk
+    install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
+}
+
+ALTERNATIVE_${PN} = "pkg-config"
+
+# When using the RPM generated automatic package dependencies, some packages
+# will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
+# specifying an appropriate provide.
+RPROVIDES_${PN} += "pkgconfig(pkg-config)"
+
+# Include pkg.m4 in the main package, leaving libpkgconf dev files in -dev
+FILES_${PN}-dev_remove = "${datadir}/aclocal"
+FILES_${PN} += "${datadir}/aclocal"
+
+BBCLASSEXTEND += "native nativesdk"
+
+pkgconf_sstate_fixup_esdk () {
+   if [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" -a "${WITHIN_EXT_SDK}" = "1" ] ; then
+       pkgconfdir="${SSTATE_INSTDIR}/recipe-sysroot-native/${bindir_native}"
+       mv $pkgconfdir/pkg-config $pkgconfdir/pkg-config.real
+       lnr $pkgconfdir/pkg-config-esdk $pkgconfdir/pkg-config
+       sed -i -e "s|^pkg-config|pkg-config.real|" $pkgconfdir/pkg-config-native
+   fi
+}
+
+SSTATEPOSTUNPACKFUNCS_append_class-native = " pkgconf_sstate_fixup_esdk"
-- 
2.4.0


