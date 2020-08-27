Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.9255.1598490994888552984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 18:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,357,1592841600"; 
   d="scan'208";a="98596672"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Aug 2020 09:16:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8407248990DD
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 09:16:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 27 Aug 2020 09:16:27 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libgpg-error:upgrade 1.38 -> 1.39
Date: Thu, 27 Aug 2020 21:16:24 +0800
Message-ID: <1598534184-115749-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598534184-115749-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598534184-115749-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8407248990DD.A3EF9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0003-build-Fix-cross-compiling-into-a-separate-build-dir.patch
0005-src-gen-lock-obj.sh-add-a-file.patch
Removed since these are included in 1.39

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-compiling-into-a-separate-build-dir.patch |  43 ------
 .../0005-src-gen-lock-obj.sh-add-a-file.patch | 134 ------------------
 ...gpg-error_1.38.bb => libgpg-error_1.39.bb} |   4 +-
 3 files changed, 1 insertion(+), 180 deletions(-)
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0003-build-Fix-cross-compiling-into-a-separate-build-dir.patch
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0005-src-gen-lock-obj.sh-add-a-file.patch
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.38.bb => libgpg-error_1.39.bb} (85%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0003-build-Fix-cross-compiling-into-a-separate-build-dir.patch b/meta/recipes-support/libgpg-error/libgpg-error/0003-build-Fix-cross-compiling-into-a-separate-build-dir.patch
deleted file mode 100644
index 20610bee5d..0000000000
--- a/meta/recipes-support/libgpg-error/libgpg-error/0003-build-Fix-cross-compiling-into-a-separate-build-dir.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6efe006e99a7e739afbf7fe8937445c82630fc8f Mon Sep 17 00:00:00 2001
-From: David Michael <fedora.dm0@gmail.com>
-Date: Mon, 1 Jun 2020 10:24:53 -0400
-Subject: [PATCH] build: Fix cross-compiling into a separate build dir.
-
-* configure.ac: Create the src directory before writing into it.
-* src/Makefile.am (EXTRA_DIST): Add gen-lock-obj.sh.
-
---
-
-Upstream-Status: Backport
-Signed-off-by: David Michael <fedora.dm0@gmail.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac    | 1 +
- src/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index def8bba..8c0d845 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -598,6 +598,7 @@ if test x$cross_compiling = xyes; then
-   case $host in
-     *-*-linux*)
-     lock_obj_h_generated=yes
-+    mkdir src
-     LOCK_ABI_VERSION=1 host=$host host_alias=$host_alias \
-         CC=$CC OBJDUMP=$host_alias-objdump \
-         ac_ext=$ac_ext ac_objext=$ac_objext \
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 2fb83c0..d773877 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -102,7 +102,7 @@ EXTRA_DIST = mkstrtable.awk err-sources.h.in err-codes.h.in \
- 	gpg-error.vers gpg-error.def.in \
-         versioninfo.rc.in gpg-error.w32-manifest.in \
- 	gpg-error-config-test.sh gpg-error.pc.in \
--	$(lock_obj_pub)
-+	gen-lock-obj.sh $(lock_obj_pub)
- 
- BUILT_SOURCES = $(srcdir)/err-sources.h $(srcdir)/err-codes.h \
- 	code-to-errno.h code-from-errno.h \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0005-src-gen-lock-obj.sh-add-a-file.patch b/meta/recipes-support/libgpg-error/libgpg-error/0005-src-gen-lock-obj.sh-add-a-file.patch
deleted file mode 100644
index e6f6c09bac..0000000000
--- a/meta/recipes-support/libgpg-error/libgpg-error/0005-src-gen-lock-obj.sh-add-a-file.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From fcb414abb62223e66dba413d0ca86eab3ea5bbc3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 21 Jun 2020 13:54:47 +0000
-Subject: [PATCH] src-gen-lock-obj.sh: add a file
-
-This is erroneously missing from the tarball; it will show
-up in the next release tarball, as upstream has fixed the
-packaging in master.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/gen-lock-obj.sh | 112 ++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 112 insertions(+)
- create mode 100755 src/gen-lock-obj.sh
-
-diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
-new file mode 100755
-index 0000000..13858cf
---- /dev/null
-+++ b/src/gen-lock-obj.sh
-@@ -0,0 +1,112 @@
-+#! /bin/sh
-+#
-+# gen-lock-obj.sh - Build tool to construct the lock object.
-+#
-+# Copyright (C) 2020 g10 Code GmbH
-+#
-+# This file is part of libgpg-error.
-+#
-+# libgpg-error is free software; you can redistribute it and/or
-+# modify it under the terms of the GNU Lesser General Public License
-+# as published by the Free Software Foundation; either version 2.1 of
-+# the License, or (at your option) any later version.
-+#
-+# libgpg-error is distributed in the hope that it will be useful, but
-+# WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+# Lesser General Public License for more details.
-+#
-+# You should have received a copy of the GNU Lesser General Public
-+# License along with this program; if not, see <https://www.gnu.org/licenses/>.
-+#
-+
-+#
-+# Following variables should be defined to invoke this script
-+#
-+#   CC
-+#   OBJDUMP
-+#   AWK
-+#   ac_ext
-+#   ac_object
-+#   host
-+#   LOCK_ABI_VERSION
-+#
-+# An example:
-+#
-+# LOCK_ABI_VERSION=1 host=x86_64-pc-linux-gnu host_alias=x86_64-linux-gnu \
-+#     CC=$host_alias-gcc OBJDUMP=$host_alias-objdump ac_ext=c ac_objext=o \
-+#     AWK=gawk ./gen-lock-obj.sh
-+#
-+
-+AWK_VERSION_OUTPUT=$($AWK 'BEGIN { print PROCINFO["version"] }')
-+if test -n "$AWK_VERSION_OUTPUT"; then
-+    # It's GNU awk, which supports PROCINFO.
-+    AWK_OPTION=--non-decimal-data
-+fi
-+
-+cat <<'EOF' >conftest.$ac_ext
-+#include <pthread.h>
-+pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
-+EOF
-+
-+if $CC -c conftest.$ac_ext; then :
-+  ac_mtx_size=$($OBJDUMP -j .bss -t conftest.$ac_objext \
-+         | $AWK $AWK_OPTION '
-+/mtx$/ { mtx_size = int("0x" $5) }
-+END { print mtx_size }')
-+else
-+    echo "Can't determine mutex size"
-+    exit 1
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
-+cat <<EOF
-+## lock-obj-pub.$host.h
-+## File created by gen-lock-obj.sh - DO NOT EDIT
-+## To be included by mkheader into gpg-error.h
-+
-+typedef struct
-+{
-+  long _vers;
-+  union {
-+    volatile char _priv[$ac_mtx_size];
-+    long _x_align;
-+    long *_xp_align;
-+  } u;
-+} gpgrt_lock_t;
-+
-+EOF
-+
-+# FIXME: Support different alignment conditions of:
-+#
-+#     USE_16BYTE_ALIGNMENT
-+#     USE_DOUBLE_FOR_ALIGNMENT
-+#     USE_LONG_DOUBLE_FOR_ALIGNMENT
-+#
-+
-+echo -n "#define GPGRT_LOCK_INITIALIZER {$LOCK_ABI_VERSION,{{"
-+
-+i=0
-+while test "$i" -lt $ac_mtx_size; do
-+    if test "$i" -ne 0 -a "$(( $i % 8 ))" -eq 0; then
-+        echo ' \'
-+        echo -n "                                    "
-+    fi
-+    echo -n '0'
-+    if test "$i" -lt $(($ac_mtx_size - 1)); then
-+        echo -n ','
-+    fi
-+    i=$(( i + 1 ))
-+done
-+
-+cat <<'EOF'
-+}}}
-+##
-+## Local Variables:
-+## mode: c
-+## buffer-read-only: t
-+## End:
-+##
-+EOF
-+
-+exit 0
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.38.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb
similarity index 85%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.38.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.39.bb
index 9a3ec9b5bd..f53056f5c9 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.38.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb
@@ -16,11 +16,9 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://0001-Do-not-fail-when-testing-config-scripts.patch \
-           file://0003-build-Fix-cross-compiling-into-a-separate-build-dir.patch \
-           file://0005-src-gen-lock-obj.sh-add-a-file.patch \
            "
 
-SRC_URI[sha256sum] = "d8988275aa69d7149f931c10442e9e34c0242674249e171592b430ff7b3afd02"
+SRC_URI[sha256sum] = "4a836edcae592094ef1c5a4834908f44986ab2b82e0824a0344b49df8cdb298f"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.25.1



