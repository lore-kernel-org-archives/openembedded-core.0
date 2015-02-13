Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8432C73433
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8FdtV020953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:39 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:32 -0800
Message-ID: <66ee962d6fe6a3696168ef99cece9b849691e3ba.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/12] blktrace: fix and enable parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:38 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../blktrace/blktrace/makefile-fix-parallel.patch  |   41 ++++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb       |    5 ++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch b/meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch
new file mode 100644
index 0000000..df08770
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch
@@ -0,0 +1,41 @@
+From 98cb9a95ce536d21be390934bd42dc2abde5959f Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 29 Jan 2015 22:18:06 -0800
+Subject: [PATCH] Makefile: fix for parallel build
+
+Fixed parallel issue:
+* btreplay.o: file not recognized: File truncated
+  collect2: error: ld returned 1 exit status
+
+* btreplay/btreplay.c:47:18: fatal error: list.h: No such file or directory
+  #include "list.h"
+                  ^
+  compilation terminated.
+
+  Don't make btreplay twice will fix the problem
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fe35d02..e7b1e94 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,8 +17,8 @@ btt/btt:
+ btreplay/btrecord:
+ 	$(MAKE) -C btreplay
+ 
+-btreplay/btreplay:
+-	$(MAKE) -C btreplay
++btreplay/btreplay: btreplay/btrecord
++	echo Building $@
+ 
+ %.o: %.c
+ 	$(CC) -o $*.o -c $(ALL_CFLAGS) $<
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 7a32993..29186fc 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -10,7 +10,9 @@ PR = "r6"
 PV = "1.0.5+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git \
-           file://ldflags.patch"
+           file://ldflags.patch \
+           file://makefile-fix-parallel.patch \
+           "
 
 S = "${WORKDIR}/git"
 
@@ -19,7 +21,6 @@ EXTRA_OEMAKE = "\
     'CFLAGS=${CFLAGS}' \
     'LDFLAGS=${LDFLAGS}' \
 "
-PARALLEL_MAKE = ""
 
 do_install() {
 	oe_runmake ARCH="${ARCH}" prefix=${prefix} \
-- 
1.7.9.5


