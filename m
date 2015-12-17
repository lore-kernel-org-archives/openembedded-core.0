Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 580626FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 16:18:37 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tBHGIc8R001667 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 10:18:38 -0600
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015121710183788-1251463 ;
	Thu, 17 Dec 2015 10:18:37 -0600 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 10:18:19 -0600
Message-Id: <1450369099-11220-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAJTo0LZ9VCCnpeTBK1noUrO8twF3UJ3WGN0-2BmsS2O6R1snzw@mail.gmail.com>
References: <CAJTo0LZ9VCCnpeTBK1noUrO8twF3UJ3WGN0-2BmsS2O6R1snzw@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/17/2015 10:18:37 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/17/2015 10:18:37 AM,
	Serialize complete at 12/17/2015 10:18:37 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-17_02:, , signatures=0
Subject: [PATCH v2] opkg: upgrade to v0.3.1
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
X-List-Received-Date: Thu, 17 Dec 2015 16:18:38 -0000

* Drop merged patches
* Add patch to fix crash when using the libsolv backend
* Add patch to add pkgconfig support for libsolv
* Add libsolv support via a PACKAGECONFIG option.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...1-configure.ac-use-pkg-config-for-libsolv.patch |  36 ++++++
 ...-include-stdio.h-for-getting-FILE-defined.patch |  45 --------
 ...ver_set_arch_policy-use-correct-logic-dur.patch |  35 ++++++
 ...ve-add-support-for-empty-compressed-files.patch |  64 -----------
 ...ng_util-New-file-with-bin_to_hex-function.patch | 122 ---------------------
 .../opkg/0002-md5-Add-md5_to_string-function.patch | 110 -------------------
 ...0003-sha256-Add-sha256_to_string-function.patch | 110 -------------------
 ...4-opkg_download-Use-short-cache-file-name.patch |  85 --------------
 .../opkg/{opkg_0.3.0.bb => opkg_0.3.1.bb}          |  13 +--
 9 files changed, 76 insertions(+), 544 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-support-for-empty-compressed-files.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
 rename meta/recipes-devtools/opkg/{opkg_0.3.0.bb => opkg_0.3.1.bb} (81%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch b/meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch
new file mode 100644
index 0000000..e67ec74
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch
@@ -0,0 +1,36 @@
+From 2a43027f7ecf2bb3ce73f95bcf575c56bc495d07 Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Wed, 9 Dec 2015 17:38:05 -0600
+Subject: [PATCH] configure.ac: use pkg-config for libsolv
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ configure.ac | 12 +-----------
+ 1 file changed, 1 insertion(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 52e1025..d17dc5c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -159,17 +159,7 @@ if test "x$want_solver" != "xno"; then
+                  AC_MSG_ERROR(Specify which solver with --enable-solver=<SOLVER>)],
+             [libsolv],
+                 [AC_MSG_RESULT(libsolv)
+-
+-                SOLVER_CFLAGS="-I/usr/local/include/"
+-                SOLVER_LIBS="-lsolv -lsolvext"
+-                AC_CHECK_LIB([solv],
+-                             [solver_solve],
+-                             [],
+-                             [AC_MSG_ERROR(libsolv not found)])
+-                dnl TODO: remove previous 6 lines and uncomment line below to use
+-                dnl pkg-config once there is a release of libsolv with pkg-config:
+-                dnl PKG_CHECK_MODULES(SOLVER, libsolv)
+-
++                PKG_CHECK_MODULES(SOLVER, libsolv)
+                 AC_DEFINE(HAVE_SOLVER_LIBSOLV,1,[Define if you want to use libsolv])],
+             # default
+             [AC_MSG_RESULT(no)
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/opkg/opkg/0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch b/meta/recipes-devtools/opkg/opkg/0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch
deleted file mode 100644
index acc1338..0000000
--- a/meta/recipes-devtools/opkg/opkg/0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 58f4d3d63cd6097154205ea7ee042005036659b3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 10 Sep 2015 21:43:32 -0700
-Subject: [PATCH] libopkg: include stdio.h for getting FILE defined
-To: opkg-devel@googlegroups.com
-Cc: paul@paulbarker.me.uk
-
-For some libc(musl) stdio.h may not get included indirectly which means
-we need to mention it in explicit include list
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- libopkg/opkg_verify.c | 1 +
- libopkg/pkg_src.c     | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libopkg/opkg_verify.c b/libopkg/opkg_verify.c
-index 41dc3f4..a71591d 100644
---- a/libopkg/opkg_verify.c
-+++ b/libopkg/opkg_verify.c
-@@ -18,6 +18,7 @@
- 
- #include <malloc.h>
- #include <string.h>
-+#include <stdio.h>
- 
- #include "file_util.h"
- #include "opkg_conf.h"
-diff --git a/libopkg/pkg_src.c b/libopkg/pkg_src.c
-index e31ec21..6b49a00 100644
---- a/libopkg/pkg_src.c
-+++ b/libopkg/pkg_src.c
-@@ -20,6 +20,7 @@
- 
- #include <malloc.h>
- #include <unistd.h>
-+#include <stdio.h>
- 
- #include "file_util.h"
- #include "opkg_conf.h"
--- 
-2.5.1
-
diff --git a/meta/recipes-devtools/opkg/opkg/0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch b/meta/recipes-devtools/opkg/opkg/0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch
new file mode 100644
index 0000000..1ab1790
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch
@@ -0,0 +1,35 @@
+From 3e562bed7dced25eb3e9174ca9395324b6c873c1 Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Wed, 9 Dec 2015 13:36:14 -0600
+Subject: [PATCH] libsolv_solver_set_arch_policy: use correct logic during
+ archs resizing
+
+If there are more than INITIAL_ARCH_LIST_SIZE archs defined in the
+configuration, libsolv_solver_set_arch_policy crashes due to flawed
+logic when resizing the archs array.
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ libopkg/opkg_solver_libsolv.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libopkg/opkg_solver_libsolv.c b/libopkg/opkg_solver_libsolv.c
+index 1cdcf1f..b5af0fa 100644
+--- a/libopkg/opkg_solver_libsolv.c
++++ b/libopkg/opkg_solver_libsolv.c
+@@ -66,8 +66,10 @@ static void libsolv_solver_set_arch_policy(libsolv_solver_t *libsolv_solver)
+     nv_pair_list_elt_t *arch_info;
+ 
+     list_for_each_entry(arch_info, &opkg_config->arch_list.head, node) {
+-        if (arch_count > arch_list_size)
+-            archs = xrealloc(archs, arch_list_size *= 2);
++        if (arch_count >= arch_list_size) {
++            arch_list_size *= 2;
++            archs = xrealloc(archs, arch_list_size * sizeof(arch_data_t));
++        }
+ 
+         archs[arch_count].arch = ((nv_pair_t *)(arch_info->data))->name;
+         archs[arch_count].priority = atoi(((nv_pair_t *)
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-support-for-empty-compressed-files.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-support-for-empty-compressed-files.patch
deleted file mode 100644
index dabd196..0000000
--- a/meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-support-for-empty-compressed-files.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From bd32bb8646459508bb0b0ce54a14bd6fe0e19b75 Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Thu, 27 Aug 2015 15:52:16 -0500
-Subject: [PATCH] opkg_archive: add support for empty compressed files
-
-Regression from 0.2.x: opkg used to support empty Package.gz files.
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-
-Upstream-Status: Accepted
----
- libopkg/opkg_archive.c | 15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
-index be903e4..7e91e48 100644
---- a/libopkg/opkg_archive.c
-+++ b/libopkg/opkg_archive.c
-@@ -121,6 +121,9 @@ static int copy_to_stream(struct archive *a, FILE * stream)
-     int eof;
-     size_t len = EXTRACT_BUFFER_LEN;
- 
-+    if (archive_format(a) == ARCHIVE_FORMAT_EMPTY)
-+        return 0;
-+
-     buffer = xmalloc(len);
- 
-     while (1) {
-@@ -654,6 +657,13 @@ static struct archive *open_compressed_file(const char *filename)
-         goto err_cleanup;
-     }
- 
-+    r = archive_read_support_format_empty(ar);
-+    if (r != ARCHIVE_OK) {
-+        opkg_msg(ERROR, "Empty format not supported: %s\n",
-+                 archive_error_string(ar));
-+        goto err_cleanup;
-+    }
-+
-     /* Open input file and prepare for reading. */
-     r = archive_read_open_filename(ar, filename, EXTRACT_BUFFER_LEN);
-     if (r != ARCHIVE_OK) {
-@@ -723,6 +733,7 @@ struct opkg_ar *ar_open_compressed_file(const char *filename)
- {
-     struct opkg_ar *ar;
-     struct archive_entry *entry;
-+    int eof;
- 
-     ar = (struct opkg_ar *)xmalloc(sizeof(struct opkg_ar));
- 
-@@ -737,8 +748,8 @@ struct opkg_ar *ar_open_compressed_file(const char *filename)
-      * header. We skip over this header here so that the caller doesn't need
-      * to know about it.
-      */
--    entry = read_header(ar->ar, NULL);
--    if (!entry)
-+    entry = read_header(ar->ar, &eof);
-+    if (!entry && !eof)
-         goto err_cleanup;
- 
-     return ar;
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch b/meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
deleted file mode 100644
index fb3ac46..0000000
--- a/meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 646b80024567a6245c598be3374653fa1fa09a12 Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Sat, 7 Nov 2015 10:23:49 +0000
-Subject: [PATCH 1/4] string_util: New file with bin_to_hex function
-
-This function does very simple conversion from binary data to a hex string.
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-
-Upstream-Status: Accepted
----
- libopkg/Makefile.am   |  4 ++--
- libopkg/string_util.c | 42 ++++++++++++++++++++++++++++++++++++++++++
- libopkg/string_util.h | 24 ++++++++++++++++++++++++
- 3 files changed, 68 insertions(+), 2 deletions(-)
- create mode 100644 libopkg/string_util.c
- create mode 100644 libopkg/string_util.h
-
-diff --git a/libopkg/Makefile.am b/libopkg/Makefile.am
-index ee3fbee..3e62c24 100644
---- a/libopkg/Makefile.am
-+++ b/libopkg/Makefile.am
-@@ -13,7 +13,7 @@ opkg_headers = active_list.h cksum_list.h conffile.h conffile_list.h \
- 	pkg_depends.h pkg_dest.h pkg_dest_list.h pkg_extract.h pkg_hash.h \
- 	pkg_parse.h pkg_src.h pkg_src_list.h pkg_vec.h release.h \
- 	release_parse.h sha256.h sprintf_alloc.h str_list.h void_list.h \
--	xregex.h xsystem.h xfuncs.h opkg_verify.h
-+	xregex.h xsystem.h xfuncs.h opkg_verify.h string_util.h
- 
- opkg_sources = opkg_cmd.c opkg_configure.c opkg_download.c \
- 	opkg_install.c opkg_remove.c opkg_conf.c release.c \
-@@ -23,7 +23,7 @@ opkg_sources = opkg_cmd.c opkg_configure.c opkg_download.c \
- 	pkg_src.c pkg_src_list.c str_list.c void_list.c active_list.c \
- 	file_util.c opkg_message.c md5.c parse_util.c cksum_list.c \
- 	sprintf_alloc.c xregex.c xsystem.c xfuncs.c opkg_archive.c \
--	opkg_verify.c
-+	opkg_verify.c string_util.c
- 
- if HAVE_CURL
- opkg_sources += opkg_download_curl.c
-diff --git a/libopkg/string_util.c b/libopkg/string_util.c
-new file mode 100644
-index 0000000..822cab6
---- /dev/null
-+++ b/libopkg/string_util.c
-@@ -0,0 +1,42 @@
-+/* vi: set expandtab sw=4 sts=4: */
-+/* string_util.c - convenience routines for common string operations
-+
-+   Copyright (C) 2015 Paul Barker
-+
-+   This program is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU General Public License as
-+   published by the Free Software Foundation; either version 2, or (at
-+   your option) any later version.
-+
-+   This program is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+*/
-+
-+#include "config.h"
-+
-+#include "string_util.h"
-+#include "xfuncs.h"
-+
-+char *bin_to_hex(const void *bin_data, size_t len)
-+{
-+    const unsigned char *src = (const unsigned char *)bin_data;
-+    char *buf = xmalloc(2 * len + 1);
-+    int i;
-+
-+    static const unsigned char bin2hex[16] = {
-+        '0', '1', '2', '3',
-+        '4', '5', '6', '7',
-+        '8', '9', 'a', 'b',
-+        'c', 'd', 'e', 'f'
-+    };
-+
-+    for (i = 0; i < len; i++) {
-+        buf[i * 2] = bin2hex[src[i] >> 4];
-+        buf[i * 2 + 1] = bin2hex[src[i] & 0xf];
-+    }
-+
-+    buf[len * 2] = '\0';
-+    return buf;
-+}
-diff --git a/libopkg/string_util.h b/libopkg/string_util.h
-new file mode 100644
-index 0000000..a920e2a
---- /dev/null
-+++ b/libopkg/string_util.h
-@@ -0,0 +1,24 @@
-+/* vi: set expandtab sw=4 sts=4: */
-+/* string_util.h - convenience routines for common file operations
-+
-+   Copyright (C) 2015 Paul Barker
-+
-+   This program is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU General Public License as
-+   published by the Free Software Foundation; either version 2, or (at
-+   your option) any later version.
-+
-+   This program is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+*/
-+
-+#ifndef STRING_UTIL_H
-+#define STRING_UTIL_H
-+
-+#include <stddef.h>
-+
-+char *bin_to_hex(const void *bin_data, size_t len);
-+
-+#endif /* STRING_UTIL_H */
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch b/meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
deleted file mode 100644
index 3b823c6..0000000
--- a/meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From ecad8afab377d8be95eeaafc08afa228c8e030c3 Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Sat, 7 Nov 2015 10:23:50 +0000
-Subject: [PATCH 2/4] md5: Add md5_to_string function
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-
-Upstream-Status: Accepted
----
- libopkg/file_util.c | 28 +++-------------------------
- libopkg/md5.c       |  7 +++++++
- libopkg/md5.h       |  3 +++
- 3 files changed, 13 insertions(+), 25 deletions(-)
-
-diff --git a/libopkg/file_util.c b/libopkg/file_util.c
-index 5eff469..cb3dbf0 100644
---- a/libopkg/file_util.c
-+++ b/libopkg/file_util.c
-@@ -349,27 +349,13 @@ int file_mkdir_hier(const char *path, long mode)
- 
- char *file_md5sum_alloc(const char *file_name)
- {
--    static const int md5sum_bin_len = 16;
--    static const int md5sum_hex_len = 32;
--
--    static const unsigned char bin2hex[16] = {
--        '0', '1', '2', '3',
--        '4', '5', '6', '7',
--        '8', '9', 'a', 'b',
--        'c', 'd', 'e', 'f'
--    };
--
--    int i, err;
-+    int err;
-     FILE *file;
--    char *md5sum_hex;
--    unsigned char md5sum_bin[md5sum_bin_len];
--
--    md5sum_hex = xcalloc(1, md5sum_hex_len + 1);
-+    unsigned char md5sum_bin[16];
- 
-     file = fopen(file_name, "r");
-     if (file == NULL) {
-         opkg_perror(ERROR, "Failed to open file %s", file_name);
--        free(md5sum_hex);
-         return NULL;
-     }
- 
-@@ -377,20 +363,12 @@ char *file_md5sum_alloc(const char *file_name)
-     if (err) {
-         opkg_msg(ERROR, "Could't compute md5sum for %s.\n", file_name);
-         fclose(file);
--        free(md5sum_hex);
-         return NULL;
-     }
- 
-     fclose(file);
- 
--    for (i = 0; i < md5sum_bin_len; i++) {
--        md5sum_hex[i * 2] = bin2hex[md5sum_bin[i] >> 4];
--        md5sum_hex[i * 2 + 1] = bin2hex[md5sum_bin[i] & 0xf];
--    }
--
--    md5sum_hex[md5sum_hex_len] = '\0';
--
--    return md5sum_hex;
-+    return md5_to_string(md5sum_bin);
- }
- 
- #ifdef HAVE_SHA256
-diff --git a/libopkg/md5.c b/libopkg/md5.c
-index d476b8b..bc2b229 100644
---- a/libopkg/md5.c
-+++ b/libopkg/md5.c
-@@ -30,6 +30,8 @@
- #include <string.h>
- #include <sys/types.h>
- 
-+#include "string_util.h"
-+
- #if USE_UNLOCKED_IO
- #include "unlocked-io.h"
- #endif
-@@ -431,3 +433,8 @@ void md5_process_block(const void *buffer, size_t len, struct md5_ctx *ctx)
-     ctx->C = C;
-     ctx->D = D;
- }
-+
-+char *md5_to_string(const void *md5sum_bin)
-+{
-+    return bin_to_hex(md5sum_bin, 16);
-+}
-diff --git a/libopkg/md5.h b/libopkg/md5.h
-index 01320f5..2a7274d 100644
---- a/libopkg/md5.h
-+++ b/libopkg/md5.h
-@@ -118,6 +118,9 @@ extern int __md5_stream(FILE * stream, void *resblock) __THROW;
- extern void *__md5_buffer(const char *buffer, size_t len,
-                           void *resblock) __THROW;
- 
-+/* Convert a binary md5sum value to an ASCII string. */
-+char *md5_to_string(const void *md5sum_bin);
-+
- #ifdef __cplusplus
- }
- #endif
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch b/meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
deleted file mode 100644
index 16e82d7..0000000
--- a/meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 92e8378103bba3b91f2dec4e6fda3e1755a7c0fd Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Sat, 7 Nov 2015 10:23:51 +0000
-Subject: [PATCH 3/4] sha256: Add sha256_to_string function
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-
-Upstream-Status: Accepted
----
- libopkg/file_util.c | 28 +++-------------------------
- libopkg/sha256.c    |  7 +++++++
- libopkg/sha256.h    |  3 +++
- 3 files changed, 13 insertions(+), 25 deletions(-)
-
-diff --git a/libopkg/file_util.c b/libopkg/file_util.c
-index cb3dbf0..864aedb 100644
---- a/libopkg/file_util.c
-+++ b/libopkg/file_util.c
-@@ -374,27 +374,13 @@ char *file_md5sum_alloc(const char *file_name)
- #ifdef HAVE_SHA256
- char *file_sha256sum_alloc(const char *file_name)
- {
--    static const int sha256sum_bin_len = 32;
--    static const int sha256sum_hex_len = 64;
--
--    static const unsigned char bin2hex[16] = {
--        '0', '1', '2', '3',
--        '4', '5', '6', '7',
--        '8', '9', 'a', 'b',
--        'c', 'd', 'e', 'f'
--    };
--
--    int i, err;
-+    int err;
-     FILE *file;
--    char *sha256sum_hex;
--    unsigned char sha256sum_bin[sha256sum_bin_len];
--
--    sha256sum_hex = xcalloc(1, sha256sum_hex_len + 1);
-+    unsigned char sha256sum_bin[32];
- 
-     file = fopen(file_name, "r");
-     if (file == NULL) {
-         opkg_perror(ERROR, "Failed to open file %s", file_name);
--        free(sha256sum_hex);
-         return NULL;
-     }
- 
-@@ -402,20 +388,12 @@ char *file_sha256sum_alloc(const char *file_name)
-     if (err) {
-         opkg_msg(ERROR, "Could't compute sha256sum for %s.\n", file_name);
-         fclose(file);
--        free(sha256sum_hex);
-         return NULL;
-     }
- 
-     fclose(file);
- 
--    for (i = 0; i < sha256sum_bin_len; i++) {
--        sha256sum_hex[i * 2] = bin2hex[sha256sum_bin[i] >> 4];
--        sha256sum_hex[i * 2 + 1] = bin2hex[sha256sum_bin[i] & 0xf];
--    }
--
--    sha256sum_hex[sha256sum_hex_len] = '\0';
--
--    return sha256sum_hex;
-+    return sha256_to_string(sha256sum_bin);
- }
- 
- #endif
-diff --git a/libopkg/sha256.c b/libopkg/sha256.c
-index 0816858..bceed72 100644
---- a/libopkg/sha256.c
-+++ b/libopkg/sha256.c
-@@ -29,6 +29,8 @@
- #include <stddef.h>
- #include <string.h>
- 
-+#include "string_util.h"
-+
- #if USE_UNLOCKED_IO
- #include "unlocked-io.h"
- #endif
-@@ -517,3 +519,8 @@ void sha256_process_block(const void *buffer, size_t len,
-         h = ctx->state[7] += h;
-     }
- }
-+
-+char *sha256_to_string(const void *sha256sum_bin)
-+{
-+    return bin_to_hex(sha256sum_bin, 32);
-+}
-diff --git a/libopkg/sha256.h b/libopkg/sha256.h
-index 734ab54..0d1e9e5 100644
---- a/libopkg/sha256.h
-+++ b/libopkg/sha256.h
-@@ -85,6 +85,9 @@ extern int sha224_stream(FILE * stream, void *resblock);
- extern void *sha256_buffer(const char *buffer, size_t len, void *resblock);
- extern void *sha224_buffer(const char *buffer, size_t len, void *resblock);
- 
-+/* Convert a binary sha256sum value to an ASCII string. */
-+char *sha256_to_string(const void *sha256sum_bin);
-+
- #ifdef __cplusplus
- }
- #endif
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch b/meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
deleted file mode 100644
index 7ea661d..0000000
--- a/meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 61636f15718edc7ea17b91f22f1d97b905eaf951 Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Sat, 7 Nov 2015 10:23:52 +0000
-Subject: [PATCH 4/4] opkg_download: Use short cache file name
-
-Source URIs can be very long. The cache directory itself may already have a very
-long path, especially if we're installing packages into an offline rootfs.
-Therefore it's not a good idea to simply tag the source URI onto the cache
-directory path to create a cache file name.
-
-To create shorter cache file names which are deterministic and very likely to be
-unique, we use the md5sum of the source URI along with the basename of the
-source URI. The basename is length limited to ensure that it the resulting
-filename length is always reasonable.
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-
-Upstream-Status: Accepted
----
- libopkg/opkg_download.c | 35 ++++++++++++++++++++++++++++-------
- 1 file changed, 28 insertions(+), 7 deletions(-)
-
-diff --git a/libopkg/opkg_download.c b/libopkg/opkg_download.c
-index e9b86a5..a37b10d 100644
---- a/libopkg/opkg_download.c
-+++ b/libopkg/opkg_download.c
-@@ -29,10 +29,18 @@
- #include "opkg_verify.h"
- #include "opkg_utils.h"
- 
-+#include "md5.h"
- #include "sprintf_alloc.h"
- #include "file_util.h"
- #include "xfuncs.h"
- 
-+/* Limit the short file name used to generate cache file names to 90 characters
-+ * so that when added to the md5sum (32 characters) and an underscore, the
-+ * resulting length is below 128 characters. The maximum file name length
-+ * differs between plaforms but 128 characters should be reasonable.
-+ */
-+#define MAX_SHORT_FILE_NAME_LENGTH 90
-+
- static int opkg_download_set_env()
- {
-     int r;
-@@ -135,15 +143,28 @@ int opkg_download_internal(const char *src, const char *dest,
-  */
- char *get_cache_location(const char *src)
- {
--    char *cache_name = xstrdup(src);
--    char *cache_location, *p;
-+    unsigned char md5sum_bin[16];
-+    char *md5sum_hex;
-+    char *cache_location;
-+    char *short_file_name;
-+    char *tmp = xstrdup(src);
- 
--    for (p = cache_name; *p; p++)
--        if (*p == '/')
--            *p = '_';
-+    md5_buffer(src, strlen(src), md5sum_bin);
-+    md5sum_hex = md5_to_string(md5sum_bin);
- 
--    sprintf_alloc(&cache_location, "%s/%s", opkg_config->cache_dir, cache_name);
--    free(cache_name);
-+    /* Generate a short file name which will be used along with an md5sum of the
-+     * full src URI in the cache file name. This short file name is limited to
-+     * MAX_SHORT_FILE_NAME_LENGTH to ensure that the total cache file name
-+     * length is reasonable.
-+     */
-+    short_file_name = basename(tmp);
-+    if (strlen(short_file_name) > MAX_SHORT_FILE_NAME_LENGTH)
-+        short_file_name[MAX_SHORT_FILE_NAME_LENGTH] = '\0';
-+
-+    sprintf_alloc(&cache_location, "%s/%s_%s", opkg_config->cache_dir,
-+                  md5sum_hex, short_file_name);
-+    free(md5sum_hex);
-+    free(tmp);
-     return cache_location;
- }
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.0.bb b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
similarity index 81%
rename from meta/recipes-devtools/opkg/opkg_0.3.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.3.1.bb
index 5ad3e92..577f495 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
@@ -14,17 +14,13 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg-configure.service \
            file://opkg.conf \
-           file://0001-opkg_archive-add-support-for-empty-compressed-files.patch \
-           file://0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://0001-string_util-New-file-with-bin_to_hex-function.patch \
-           file://0002-md5-Add-md5_to_string-function.patch \
-           file://0003-sha256-Add-sha256_to_string-function.patch \
-           file://0004-opkg_download-Use-short-cache-file-name.patch \
+           file://0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch \
+           file://0001-configure.ac-use-pkg-config-for-libsolv.patch \
 "
 
-SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
-SRC_URI[sha256sum] = "7f735d1cdb8ef3718fb0f9fba44ca0d9a5c90d3a7f014f37a6d2f9474f54988f"
+SRC_URI[md5sum] = "43735e5dc1ebf46bd6ce56a7cdfdc720"
+SRC_URI[sha256sum] = "d2c6c02a8384ec21168a1f0a186cb5e9f577d1452f491d02ed3e56b2ea8b87df"
 
 inherit autotools pkgconfig systemd
 
@@ -41,6 +37,7 @@ PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
 PACKAGECONFIG[pathfinder] = "--enable-pathfinder,--disable-pathfinder,pathfinder"
+PACKAGECONFIG[libsolv] = "--enable-solver=libsolv,--disable-solver,libsolv"
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/opkg
-- 
1.9.1


