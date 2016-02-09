Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7E448731C2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 13:07:51 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q04Jk2XT6z3hjjw;
	Tue,  9 Feb 2016 14:07:50 +0100 (CET)
X-Auth-Info: t7Vnps0YL9TsKL+I66wl2n1Wk4FdBArUykbT2LcdRnk=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3q04Jk0cPPzvdWV;
	Tue,  9 Feb 2016 14:07:50 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 14:07:40 +0100
Message-Id: <1455023260-8075-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455017471-6682-1-git-send-email-marex@denx.de>
References: <1455017471-6682-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH V2 1/7] strace: Fix build for arc, metag, nios2, or1k, tile
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
X-List-Received-Date: Tue, 09 Feb 2016 13:07:51 -0000

Upstream strace 4.11 does not build for arc, metag, nios2, or1k, tile.
Backport patch from strace git master to fix the build issue.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Robert Yang <liezhi.yang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-arc-metag-nios2-or1k-tile-fix-build.patch | 117 +++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.11.bb        |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch

V2: Add missing SoB line to the backported patch

diff --git a/meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch b/meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch
new file mode 100644
index 0000000..a9d3203
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch
@@ -0,0 +1,117 @@
+From dd1a80c8d213eed95fe55b7ebcb07ee165dd8e4b Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Thu, 24 Dec 2015 15:40:55 +0000
+Subject: [PATCH] arc, metag, nios2, or1k, tile: fix build
+
+Fix build regression introduced by commit
+34683e3926d8c2daa368afb805da422ee7043396.
+
+* linux/32/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap.
+* linux/arc/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap_pgoff.
+* linux/nios2/syscallent.h: Likewise.
+* linux/or1k/syscallent.h: Likewise.
+* linux/tile/syscallent1.h: Add sys_ prefix to ARCH_mmap and sys_mmap_4koff.
+* pathtrace.c (pathtrace_match): Handle SEN_ARCH_mmap.
+* NEWS: Mention this build fix.
+
+Reported-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Backport
+---
+ NEWS                     | 3 +++
+ linux/32/syscallent.h    | 6 +++---
+ linux/arc/syscallent.h   | 2 +-
+ linux/nios2/syscallent.h | 2 +-
+ linux/or1k/syscallent.h  | 2 +-
+ linux/tile/syscallent1.h | 2 +-
+ pathtrace.c              | 1 +
+ 7 files changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index fe40ca4..09263eb 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,9 @@
++Noteworthy changes in release ?.?? (????-??-??)
++===============================================
++
++* Bug fixes
++  * Fixed build on arc, metag, nios2, or1k, and tile architectures.
++
+ Noteworthy changes in release 4.11 (2015-12-21)
+ ===============================================
+ 
+diff --git a/linux/32/syscallent.h b/linux/32/syscallent.h
+index 5f997e7..e6f895c 100644
+--- a/linux/32/syscallent.h
++++ b/linux/32/syscallent.h
+@@ -1,5 +1,5 @@
+-#ifndef ARCH_mmap
+-# define ARCH_mmap mmap
++#ifndef sys_ARCH_mmap
++# define sys_ARCH_mmap sys_mmap
+ #endif
+ [  0] = { 2,	0,		SEN(io_setup),			"io_setup"		},
+ [  1] = { 1,	0,		SEN(io_destroy),		"io_destroy"		},
+@@ -276,5 +276,5 @@
+ [283] = { 2,	0,		SEN(membarrier),		"membarrier",		},
+ [284] = { 3,	TM,		SEN(mlock2),			"mlock2"		},
+ 
+-#undef ARCH_mmap
++#undef sys_ARCH_mmap
+ #undef ARCH_WANT_SYNC_FILE_RANGE2
+diff --git a/linux/arc/syscallent.h b/linux/arc/syscallent.h
+index 5847dc4..1100008 100644
+--- a/linux/arc/syscallent.h
++++ b/linux/arc/syscallent.h
+@@ -1,4 +1,4 @@
+-#define ARCH_mmap mmap_pgoff
++#define sys_ARCH_mmap sys_mmap_pgoff
+ #include "32/syscallent.h"
+ [244] = { 3,	0,	SEN(printargs),	"arc_cacheflush"},
+ [245] = { 1,	0,	SEN(printargs),	"arc_settls"	},
+diff --git a/linux/nios2/syscallent.h b/linux/nios2/syscallent.h
+index 8a4b70e..01efe3a 100644
+--- a/linux/nios2/syscallent.h
++++ b/linux/nios2/syscallent.h
+@@ -1,4 +1,4 @@
+-#define ARCH_mmap mmap_pgoff
++#define sys_ARCH_mmap sys_mmap_pgoff
+ #include "32/syscallent.h"
+ [244] = {4,    0,	SEN(cacheflush), "cacheflush"},
+ [245 ... 259] = { },
+diff --git a/linux/or1k/syscallent.h b/linux/or1k/syscallent.h
+index ed84b3b..351fe25 100644
+--- a/linux/or1k/syscallent.h
++++ b/linux/or1k/syscallent.h
+@@ -1,4 +1,4 @@
+-#define ARCH_mmap mmap_pgoff
++#define sys_ARCH_mmap sys_mmap_pgoff
+ #include "32/syscallent.h"
+ [244] = { 3,	NF,	SEN(or1k_atomic),	"or1k_atomic"	},
+ [245 ... 259] = { },
+diff --git a/linux/tile/syscallent1.h b/linux/tile/syscallent1.h
+index c86f059..28dbab4 100644
+--- a/linux/tile/syscallent1.h
++++ b/linux/tile/syscallent1.h
+@@ -1,4 +1,4 @@
+-#define ARCH_mmap mmap_4koff
++#define sys_ARCH_mmap sys_mmap_4koff
+ #define ARCH_WANT_SYNC_FILE_RANGE2 1
+ #include "32/syscallent.h"
+ [244] = { 1,	0,	SEN(printargs),	"cmpxchg_badaddr"	},
+diff --git a/pathtrace.c b/pathtrace.c
+index d530ec2..e72cdf7 100644
+--- a/pathtrace.c
++++ b/pathtrace.c
+@@ -216,6 +216,7 @@ pathtrace_match(struct tcb *tcp)
+ 	case SEN_mmap:
+ 	case SEN_mmap_4koff:
+ 	case SEN_mmap_pgoff:
++	case SEN_ARCH_mmap:
+ 		/* x, x, x, x, fd */
+ 		return fdmatch(tcp, tcp->u_arg[4]);
+ 
+-- 
+2.6.4
+
diff --git a/meta/recipes-devtools/strace/strace_4.11.bb b/meta/recipes-devtools/strace/strace_4.11.bb
index a72a1f9..6b889de 100644
--- a/meta/recipes-devtools/strace/strace_4.11.bb
+++ b/meta/recipes-devtools/strace/strace_4.11.bb
@@ -8,6 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://disable-git-version-gen.patch \
            file://more-robust-test-for-m32-mx32-compile-support.patch \
            file://update-gawk-paths.patch \
+           file://0001-arc-metag-nios2-or1k-tile-fix-build.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
           "
-- 
2.1.4


