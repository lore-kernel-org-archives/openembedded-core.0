Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC63739C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 09:23:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2A9NGSw014251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 02:23:16 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 02:23:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Mar 2015 02:23:14 -0700
Message-ID: <584bb290c927dd03943546f830510960149177dd.1425979323.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425979323.git.liezhi.yang@windriver.com>
References: <cover.1425979323.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Revert "blktrace: fix and enable parallel build"
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
X-List-Received-Date: Tue, 10 Mar 2015 09:23:15 -0000
Content-Type: text/plain

This reverts commit 2d9763a1c8685e9bd3a6b0aa0995eec5112dc4a7.

There are a few parallel issues:
1)
../rbtree.o: error adding symbols: Invalid operation
collect2: error: ld returned 1 exit status
Makefile:42: recipe for target 'btt' failed

2)
git/blkiomon.c:216: undefined reference to `rb_insert_color'
collect2: error: ld returned 1 exit status
Makefile:27: recipe for target 'blkparse' failed

3)
ld: rbtree.o: invalid string offset 128 >= 125 for section `.strtab'

4)
btreplay.o: file not recognized: File truncated
collect2: error: ld returned 1 exit status

btreplay/btreplay.c:47:18: fatal error: list.h: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../blktrace/blktrace/makefile-fix-parallel.patch  |   41 --------------------
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   17 ++++++--
 2 files changed, 14 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch b/meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch
deleted file mode 100644
index df08770..0000000
--- a/meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 98cb9a95ce536d21be390934bd42dc2abde5959f Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 29 Jan 2015 22:18:06 -0800
-Subject: [PATCH] Makefile: fix for parallel build
-
-Fixed parallel issue:
-* btreplay.o: file not recognized: File truncated
-  collect2: error: ld returned 1 exit status
-
-* btreplay/btreplay.c:47:18: fatal error: list.h: No such file or directory
-  #include "list.h"
-                  ^
-  compilation terminated.
-
-  Don't make btreplay twice will fix the problem
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index fe35d02..e7b1e94 100644
---- a/Makefile
-+++ b/Makefile
-@@ -17,8 +17,8 @@ btt/btt:
- btreplay/btrecord:
- 	$(MAKE) -C btreplay
- 
--btreplay/btreplay:
--	$(MAKE) -C btreplay
-+btreplay/btreplay: btreplay/btrecord
-+	echo Building $@
- 
- %.o: %.c
- 	$(CC) -o $*.o -c $(ALL_CFLAGS) $<
--- 
-1.7.9.5
-
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 29186fc..ef9f737 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -10,9 +10,7 @@ PR = "r6"
 PV = "1.0.5+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git \
-           file://ldflags.patch \
-           file://makefile-fix-parallel.patch \
-           "
+           file://ldflags.patch"
 
 S = "${WORKDIR}/git"
 
@@ -22,6 +20,19 @@ EXTRA_OEMAKE = "\
     'LDFLAGS=${LDFLAGS}' \
 "
 
+# There are a few parallel issues:
+# 1) ../rbtree.o: error adding symbols: Invalid operation
+# collect2: error: ld returned 1 exit status
+# Makefile:42: recipe for target 'btt' failed
+# 2) git/blkiomon.c:216: undefined reference to `rb_insert_color'
+# collect2: error: ld returned 1 exit status
+# Makefile:27: recipe for target 'blkparse' failed
+# 3) ld: rbtree.o: invalid string offset 128 >= 125 for section `.strtab'
+# 4) btreplay.o: file not recognized: File truncated
+# collect2: error: ld returned 1 exit status
+# btreplay/btreplay.c:47:18: fatal error: list.h: No such file or directory
+PARALLEL_MAKE = ""
+
 do_install() {
 	oe_runmake ARCH="${ARCH}" prefix=${prefix} \
 		mandir=${mandir} DESTDIR=${D} install
-- 
1.7.9.5


