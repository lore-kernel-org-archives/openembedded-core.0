Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2234273182
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 17:03:02 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tBGH33fj032653 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 11:03:03 -0600
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015121611030292-1211584 ;
	Wed, 16 Dec 2015 11:03:02 -0600 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 11:02:58 -0600
Message-Id: <1450285378-21007-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/16/2015 11:03:02 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/16/2015 11:03:02 AM,
	Serialize complete at 12/16/2015 11:03:02 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-16_07:, , signatures=0
Subject: [PATCH] opkg: upgrade to v0.3.1
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
X-List-Received-Date: Wed, 16 Dec 2015 17:03:03 -0000

* Drop merged patches
* Add patch to fix crash when using the libsolv backend
* Add patch to add pkgconfig support for libsolv
* Add libsolv support via a PACKAGECONFIG option.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...1-configure.ac-use-pkg-config-for-libsolv.patch | 38 +++++++++++++
 ...-include-stdio.h-for-getting-FILE-defined.patch | 45 ---------------
 ...ver_set_arch_policy-use-correct-logic-dur.patch | 37 +++++++++++++
 ...ve-add-support-for-empty-compressed-files.patch | 64 ----------------------
 .../opkg/{opkg_0.3.0.bb => opkg_0.3.1.bb}          |  9 +--
 5 files changed, 80 insertions(+), 113 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-support-for-empty-compressed-files.patch
 rename meta/recipes-devtools/opkg/{opkg_0.3.0.bb => opkg_0.3.1.bb} (87%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch b/meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch
new file mode 100644
index 0000000..85e55e1
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch
@@ -0,0 +1,38 @@
+From 2a43027f7ecf2bb3ce73f95bcf575c56bc495d07 Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Wed, 9 Dec 2015 17:38:05 -0600
+Subject: [PATCH] configure.ac: use pkg-config for libsolv
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+Upstream-Status: Accepted
+
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
index 0000000..310e77b
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch
@@ -0,0 +1,37 @@
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
+Upstream-Status: Accepted
+
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
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.0.bb b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
similarity index 87%
rename from meta/recipes-devtools/opkg/opkg_0.3.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.3.1.bb
index e0e8a62..fe650db 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
@@ -14,13 +14,13 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg-configure.service \
            file://opkg.conf \
-           file://0001-opkg_archive-add-support-for-empty-compressed-files.patch \
-           file://0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch \
+           file://0001-configure.ac-use-pkg-config-for-libsolv.patch \
 "
 
-SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
-SRC_URI[sha256sum] = "7f735d1cdb8ef3718fb0f9fba44ca0d9a5c90d3a7f014f37a6d2f9474f54988f"
+SRC_URI[md5sum] = "43735e5dc1ebf46bd6ce56a7cdfdc720"
+SRC_URI[sha256sum] = "d2c6c02a8384ec21168a1f0a186cb5e9f577d1452f491d02ed3e56b2ea8b87df"
 
 inherit autotools pkgconfig systemd
 
@@ -37,6 +37,7 @@ PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
 PACKAGECONFIG[pathfinder] = "--enable-pathfinder,--disable-pathfinder,pathfinder"
+PACKAGECONFIG[libsolv] = "--enable-solver=libsolv,--disable-solver,libsolv"
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/opkg
-- 
1.9.1


