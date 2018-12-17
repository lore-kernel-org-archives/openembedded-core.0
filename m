Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE4116C485
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 08:47:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBH8ldUq002352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 00:47:39 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 17 Dec 2018 00:47:39 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 17 Dec 2018 00:47:39 -0800
Message-ID: <20181217084739.115773-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] nfs-utils: fix build error under tests folder
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
X-List-Received-Date: Mon, 17 Dec 2018 08:47:42 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Redefine the reference path of libnfs.a to
  ../support/nfs/.libs/libnfs.a to fix below
  error when run "make -C tests statdb_dump".
  | make: *** No rule to make target '../support/nfs/libnfs.a', needed by 'statdb_dump'.  Stop.
  | make: *** No rule to make target '../../support/nfs/libnfs.a', needed by 'nsm_client'.  Stop.

* The function generic_make_pathname is introduced in
  nfs-utils 2.3.1.
  Add the source file which defines function generic_make_pathname to
  libnsm_a_SOURCES of libnsm.a to fix the undefined reference
  when run "make -C tests statdb_dump"
  | ../support/nsm/libnsm.a(file.o): In function `nsm_make_pathname':
  | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-2.3.1/support/nsm/file.c:175: undefined reference to `generic_make_pathname'
  | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-2.3.1/support/nsm/file.c:175: undefined reference to `generic_make_pathname'
  | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-2.3.1/support/nsm/file.c:175: undefined reference to `generic_make_pathname'
  | ../support/nsm/libnsm.a(file.o): In function `nsm_setup_pathnames':
  | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-2.3.1/support/nsm/file.c:280: undefined reference to `generic_setup_basedir'
  | collect2: error: ld returned 1 exit status

* After the logic of commit[dbb643e Removed missing-prototypes warnings.]
  introduced, there comes below error when run
  "make -C tests/nsm_client nsm_client"
  | nlm_sm_inter_svc.c:20:1: error: no previous prototype for 'nlm_sm_prog_3' [-Werror=missing-prototypes]

  It is because rpcgen doesn't generate -Wmissing-prototypes
  free code for nlm_sm_inter_svc.c with below logic
  in tests/nsm_client/Makefile.am
  [snip]
  GENFILES_SVC    = nlm_sm_inter_svc.c
  [snip]
  $(GENFILES_SVC): %_svc.c: %.x $(RPCGEN)
        test -f $@ && rm -rf $@ || true
        $(RPCGEN) -m -o $@ $<
 So add the patch to not fatalize -Wmissing-prototypes.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...-fix-undefined-function-for-libnsm.a.patch | 295 ++++++++++++++++++
 ...efile.am-update-the-path-of-libnfs.a.patch |  50 +++
 ...-Do-not-fatalize-Wmissing-prototypes.patch |  43 +++
 .../nfs-utils/nfs-utils_2.3.3.bb              |   3 +
 4 files changed, 391 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-update-the-path-of-libnfs.a.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
new file mode 100644
index 00000000000..aa551ebd191
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
@@ -0,0 +1,295 @@
+From 690a90a5b7786e40b5447ad7c5f19a7657d27405 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Fri, 14 Dec 2018 17:44:32 +0800
+Subject: [PATCH] Makefile.am: fix undefined function for libnsm.a
+
+The source file of libnsm.a uses some function
+in ../support/misc/file.c, add ../support/misc/file.c
+to libnsm_a_SOURCES to fix build error when run
+"make -C tests statdb_dump":
+| ../support/nsm/libnsm.a(file.o): In function `nsm_make_pathname':
+| /usr/src/debug/nfs-utils/2.3.3-r0/nfs-utils-2.3.3/support/nsm/file.c:175: undefined reference to `generic_make_pathname'
+| /usr/src/debug/nfs-utils/2.3.3-r0/nfs-utils-2.3.3/support/nsm/file.c:175: undefined reference to `generic_make_pathname'
+| /usr/src/debug/nfs-utils/2.3.3-r0/nfs-utils-2.3.3/support/nsm/file.c:175: undefined reference to `generic_make_pathname'
+| ../support/nsm/libnsm.a(file.o): In function `nsm_setup_pathnames':
+| /usr/src/debug/nfs-utils/2.3.3-r0/nfs-utils-2.3.3/support/nsm/file.c:280: undefined reference to `generic_setup_basedir'
+| collect2: error: ld returned 1 exit status
+
+As there is already one source file named file.c
+as support/nsm/file.c in support/nsm/Makefile.am,
+so rename ../support/misc/file.c to ../support/misc/misc.c.
+
+Upstream-Status: Submitted[https://marc.info/?l=linux-nfs&m=154502780423058&w=2]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ support/misc/Makefile.am |   2 +-
+ support/misc/file.c      | 111 -----------------------------------------------
+ support/misc/misc.c      | 111 +++++++++++++++++++++++++++++++++++++++++++++++
+ support/nsm/Makefile.am  |   2 +-
+ 4 files changed, 113 insertions(+), 113 deletions(-)
+ delete mode 100644 support/misc/file.c
+ create mode 100644 support/misc/misc.c
+
+diff --git a/support/misc/Makefile.am b/support/misc/Makefile.am
+index 8936b0d..d4c1f76 100644
+--- a/support/misc/Makefile.am
++++ b/support/misc/Makefile.am
+@@ -1,6 +1,6 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+ noinst_LIBRARIES = libmisc.a
+-libmisc_a_SOURCES = tcpwrapper.c from_local.c mountpoint.c file.c
++libmisc_a_SOURCES = tcpwrapper.c from_local.c mountpoint.c misc.c
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+diff --git a/support/misc/file.c b/support/misc/file.c
+deleted file mode 100644
+index e7c3819..0000000
+--- a/support/misc/file.c
++++ /dev/null
+@@ -1,111 +0,0 @@
+-/*
+- * Copyright 2009 Oracle.  All rights reserved.
+- * Copyright 2017 Red Hat, Inc.  All rights reserved.
+- *
+- * This file is part of nfs-utils.
+- *
+- * nfs-utils is free software; you can redistribute it and/or modify
+- * it under the terms of the GNU General Public License as published by
+- * the Free Software Foundation; either version 2 of the License, or
+- * (at your option) any later version.
+- *
+- * nfs-utils is distributed in the hope that it will be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+- * GNU General Public License for more details.
+- *
+- * You should have received a copy of the GNU General Public License
+- * along with nfs-utils.  If not, see <http://www.gnu.org/licenses/>.
+- */
+-
+-#include <sys/stat.h>
+-
+-#include <string.h>
+-#include <libgen.h>
+-#include <stdio.h>
+-#include <errno.h>
+-#include <dirent.h>
+-#include <stdlib.h>
+-#include <stdbool.h>
+-#include <limits.h>
+-
+-#include "xlog.h"
+-#include "misc.h"
+-
+-/*
+- * Returns a dynamically allocated, '\0'-terminated buffer
+- * containing an appropriate pathname, or NULL if an error
+- * occurs.  Caller must free the returned result with free(3).
+- */
+-__attribute__((__malloc__))
+-char *
+-generic_make_pathname(const char *base, const char *leaf)
+-{
+-	size_t size;
+-	char *path;
+-	int len;
+-
+-	size = strlen(base) + strlen(leaf) + 2;
+-	if (size > PATH_MAX)
+-		return NULL;
+-
+-	path = malloc(size);
+-	if (path == NULL)
+-		return NULL;
+-
+-	len = snprintf(path, size, "%s/%s", base, leaf);
+-	if ((len < 0) || ((size_t)len >= size)) {
+-		free(path);
+-		return NULL;
+-	}
+-
+-	return path;
+-}
+-
+-
+-/**
+- * generic_setup_basedir - set up basedir
+- * @progname: C string containing name of program, for error messages
+- * @parentdir: C string containing pathname to on-disk state, or NULL
+- * @base: character buffer to contain the basedir that is set up
+- * @baselen: size of @base in bytes
+- *
+- * This runs before logging is set up, so error messages are directed
+- * to stderr.
+- *
+- * Returns true and sets up our basedir, if @parentdir was valid
+- * and usable; otherwise false is returned.
+- */
+-_Bool
+-generic_setup_basedir(const char *progname, const char *parentdir, char *base,
+-		      const size_t baselen)
+-{
+-	static char buf[PATH_MAX];
+-	struct stat st;
+-	char *path;
+-
+-	/* First: test length of name and whether it exists */
+-	if ((strlen(parentdir) >= baselen) || (strlen(parentdir) >= PATH_MAX)) {
+-		(void)fprintf(stderr, "%s: Directory name too long: %s",
+-				progname, parentdir);
+-		return false;
+-	}
+-	if (lstat(parentdir, &st) == -1) {
+-		(void)fprintf(stderr, "%s: Failed to stat %s: %s",
+-				progname, parentdir, strerror(errno));
+-		return false;
+-	}
+-
+-	/* Ensure we have a clean directory pathname */
+-	strncpy(buf, parentdir, sizeof(buf)-1);
+-	path = dirname(buf);
+-	if (*path == '.') {
+-		(void)fprintf(stderr, "%s: Unusable directory %s",
+-				progname, parentdir);
+-		return false;
+-	}
+-
+-	xlog(D_CALL, "Using %s as the state directory", parentdir);
+-	strcpy(base, parentdir);
+-	return true;
+-}
+diff --git a/support/misc/misc.c b/support/misc/misc.c
+new file mode 100644
+index 0000000..e7c3819
+--- /dev/null
++++ b/support/misc/misc.c
+@@ -0,0 +1,111 @@
++/*
++ * Copyright 2009 Oracle.  All rights reserved.
++ * Copyright 2017 Red Hat, Inc.  All rights reserved.
++ *
++ * This file is part of nfs-utils.
++ *
++ * nfs-utils is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * nfs-utils is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with nfs-utils.  If not, see <http://www.gnu.org/licenses/>.
++ */
++
++#include <sys/stat.h>
++
++#include <string.h>
++#include <libgen.h>
++#include <stdio.h>
++#include <errno.h>
++#include <dirent.h>
++#include <stdlib.h>
++#include <stdbool.h>
++#include <limits.h>
++
++#include "xlog.h"
++#include "misc.h"
++
++/*
++ * Returns a dynamically allocated, '\0'-terminated buffer
++ * containing an appropriate pathname, or NULL if an error
++ * occurs.  Caller must free the returned result with free(3).
++ */
++__attribute__((__malloc__))
++char *
++generic_make_pathname(const char *base, const char *leaf)
++{
++	size_t size;
++	char *path;
++	int len;
++
++	size = strlen(base) + strlen(leaf) + 2;
++	if (size > PATH_MAX)
++		return NULL;
++
++	path = malloc(size);
++	if (path == NULL)
++		return NULL;
++
++	len = snprintf(path, size, "%s/%s", base, leaf);
++	if ((len < 0) || ((size_t)len >= size)) {
++		free(path);
++		return NULL;
++	}
++
++	return path;
++}
++
++
++/**
++ * generic_setup_basedir - set up basedir
++ * @progname: C string containing name of program, for error messages
++ * @parentdir: C string containing pathname to on-disk state, or NULL
++ * @base: character buffer to contain the basedir that is set up
++ * @baselen: size of @base in bytes
++ *
++ * This runs before logging is set up, so error messages are directed
++ * to stderr.
++ *
++ * Returns true and sets up our basedir, if @parentdir was valid
++ * and usable; otherwise false is returned.
++ */
++_Bool
++generic_setup_basedir(const char *progname, const char *parentdir, char *base,
++		      const size_t baselen)
++{
++	static char buf[PATH_MAX];
++	struct stat st;
++	char *path;
++
++	/* First: test length of name and whether it exists */
++	if ((strlen(parentdir) >= baselen) || (strlen(parentdir) >= PATH_MAX)) {
++		(void)fprintf(stderr, "%s: Directory name too long: %s",
++				progname, parentdir);
++		return false;
++	}
++	if (lstat(parentdir, &st) == -1) {
++		(void)fprintf(stderr, "%s: Failed to stat %s: %s",
++				progname, parentdir, strerror(errno));
++		return false;
++	}
++
++	/* Ensure we have a clean directory pathname */
++	strncpy(buf, parentdir, sizeof(buf)-1);
++	path = dirname(buf);
++	if (*path == '.') {
++		(void)fprintf(stderr, "%s: Unusable directory %s",
++				progname, parentdir);
++		return false;
++	}
++
++	xlog(D_CALL, "Using %s as the state directory", parentdir);
++	strcpy(base, parentdir);
++	return true;
++}
+diff --git a/support/nsm/Makefile.am b/support/nsm/Makefile.am
+index 8f5874e..68f1a46 100644
+--- a/support/nsm/Makefile.am
++++ b/support/nsm/Makefile.am
+@@ -10,7 +10,7 @@ GENFILES	= $(GENFILES_CLNT) $(GENFILES_SVC) $(GENFILES_XDR) $(GENFILES_H)
+ EXTRA_DIST	= sm_inter.x
+ 
+ noinst_LIBRARIES = libnsm.a
+-libnsm_a_SOURCES = $(GENFILES) file.c rpc.c
++libnsm_a_SOURCES = $(GENFILES) ../misc/misc.c file.c rpc.c
+ 
+ BUILT_SOURCES = $(GENFILES)
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-update-the-path-of-libnfs.a.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-update-the-path-of-libnfs.a.patch
new file mode 100644
index 00000000000..906ac0f9054
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-update-the-path-of-libnfs.a.patch
@@ -0,0 +1,50 @@
+From fcece65d1b713eaeef41706898440302f8ce92d9 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Thu, 12 Jul 2018 15:19:41 +0800
+Subject: [PATCH] Makefile.am: update the path of libnfs.a
+
+The libnfs.a is under ../support/nfs/.libs/ now,
+update the reference path accordingly to fix below
+build error when run "make -C tests statdb_dump":
+| make: *** No rule to make target '../support/nfs/libnfs.a', needed by 'statdb_dump'.  Stop.
+
+And below error when run "make -C tests/nsm_client nsm_client"
+| make: *** No rule to make target '../../support/nfs/libnfs.a', needed by 'nsm_client'.  Stop.
+
+Upstream-Status: Submitted[https://marc.info/?l=linux-nfs&m=154502636522745&w=2]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ tests/Makefile.am            | 2 +-
+ tests/nsm_client/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1f96264..74aa629 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -3,7 +3,7 @@
+ check_PROGRAMS = statdb_dump
+ statdb_dump_SOURCES = statdb_dump.c
+ 
+-statdb_dump_LDADD = ../support/nfs/libnfs.a \
++statdb_dump_LDADD = ../support/nfs/.libs/libnfs.a \
+ 		    ../support/nsm/libnsm.a $(LIBCAP)
+ 
+ SUBDIRS = nsm_client
+diff --git a/tests/nsm_client/Makefile.am b/tests/nsm_client/Makefile.am
+index a8fc131..43db9c2 100644
+--- a/tests/nsm_client/Makefile.am
++++ b/tests/nsm_client/Makefile.am
+@@ -13,7 +13,7 @@ check_PROGRAMS	= nsm_client
+ nsm_client_SOURCES = $(GENFILES) nsm_client.c
+ 
+ BUILT_SOURCES = $(GENFILES)
+-nsm_client_LDADD = ../../support/nfs/libnfs.a \
++nsm_client_LDADD = ../../support/nfs/.libs/libnfs.a \
+ 		   ../../support/nsm/libnsm.a $(LIBCAP) $(LIBTIRPC)
+ 
+ if CONFIG_RPCGEN
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch
new file mode 100644
index 00000000000..17aabb9e4dc
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch
@@ -0,0 +1,43 @@
+From 66471fbf7106917da7a1536b18a0a77d07479779 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Mon, 17 Dec 2018 15:29:47 +0800
+Subject: [PATCH] configure.ac: Do not fatalize -Wmissing-prototypes
+
+There comes below error when run "make -C tests/nsm_client nsm_client"
+| nlm_sm_inter_svc.c:20:1: error: no previous prototype for 'nlm_sm_prog_3' [-Werror=missing-prototypes]
+
+It is because rpcgen doesn't generate -Wmissing-prototypes
+free code for nlm_sm_inter_svc.c with below logic
+in tests/nsm_client/Makefile.am
+[snip]
+GENFILES_SVC    = nlm_sm_inter_svc.c
+[snip]
+$(GENFILES_SVC): %_svc.c: %.x $(RPCGEN)
+        test -f $@ && rm -rf $@ || true
+        $(RPCGEN) -m -o $@ $<
+
+So add the logic not to fatalize -Wmissing-prototypes.
+
+Upstream-Status: Submitted[https://marc.info/?l=linux-nfs&m=154503260323936&w=2]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e82ff14..d0cc5d5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -548,7 +548,7 @@ my_am_cflags="\
+  -Wall \
+  -Wextra \
+  -Werror=strict-prototypes \
+- -Werror=missing-prototypes \
++ -Wmissing-prototypes \
+  -Werror=missing-declarations \
+  -Werror=format=2 \
+  -Werror=undef \
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
index 6be2aab47c1..cabfc02c7e4 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
@@ -33,6 +33,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-cacheio-use-intmax_t-for-formatted-IO.patch \
            file://0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch \
            file://clang-format-string.patch \
+           file://0001-Makefile.am-update-the-path-of-libnfs.a.patch \
+           file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
+           file://0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch \
 "
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
 
-- 
2.17.1


