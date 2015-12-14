Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB196AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064196"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:12 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:22 +0200
Message-Id: <b1355e6ab66d1ef033ef17e03ce5682649ebaf95.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/20] mtd-utils: update to 1.5.2
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:11 -0000

Drop 0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch,
the problem has been fixed upstream.
Drop backported 0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch
Rebase 0001-Fix-build-with-musl.patch (2 out of 3 fixes have been made upstream)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   | 24 --------
 ...emove-duplicate-hashtable_iterator_value-.patch | 64 ----------------------
 ...ibfec-use-standard-C-type-instead-of-u_lo.patch | 56 -------------------
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  6 +-
 4 files changed, 2 insertions(+), 148 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
index d3699c6..305be52 100644
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
+++ b/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
@@ -24,30 +24,6 @@ index f09c0b2..ed2dc43 100644
  
  #include "rbtree.h"
  #include "common.h"
-diff --git a/recv_image.c b/recv_image.c
-index 26a8361..0093831 100644
---- a/recv_image.c
-+++ b/recv_image.c
-@@ -4,7 +4,6 @@
- #define _BSD_SOURCE	/* struct ip_mreq */
- 
- #include <errno.h>
--#include <error.h>
- #include <stdio.h>
- #include <netdb.h>
- #include <stdlib.h>
-diff --git a/serve_image.c b/serve_image.c
-index 38549a1..4f0e946 100644
---- a/serve_image.c
-+++ b/serve_image.c
-@@ -3,7 +3,6 @@
- 
- #include <time.h>
- #include <errno.h>
--#include <error.h>
- #include <netdb.h>
- #include <stdio.h>
- #include <stdlib.h>
 -- 
 2.6.1
 
diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
deleted file mode 100644
index 2d36158..0000000
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b856ff35c20124ceae40bbc4d32584df47618c96 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Feb 2015 09:28:26 +0000
-Subject: [PATCH] hashtable: Remove duplicate hashtable_iterator_value/hashtable_iterator_key
-
-gcc5 is defaulting to gnu11 instead of gnu89 like previous versions
-as a result the semantics of 'extern inline' changes where in gnu89 for 'extern inline' no external
-visible function is generated,in c99 'external inline' generates externally visible function
-there is no equivalent in c99+ because redefinitions arent allowed
-but 'static inline' remains same for for c89 and c99+, thats why we change the semantics
-so we make the functions static inline, and achieve the same effect
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: pending
-
----
- mkfs.ubifs/hashtable/hashtable_itr.c | 12 ------------
- 1 file changed, 12 deletions(-)
-
-Index: git/mkfs.ubifs/hashtable/hashtable_itr.h
-===================================================================
---- git.orig/mkfs.ubifs/hashtable/hashtable_itr.h
-+++ git/mkfs.ubifs/hashtable/hashtable_itr.h
-@@ -28,7 +28,7 @@ hashtable_iterator(struct hashtable *h);
- /* hashtable_iterator_key
-  * - return the value of the (key,value) pair at the current position */
- 
--extern inline void *
-+static inline void *
- hashtable_iterator_key(struct hashtable_itr *i)
- {
-     return i->e->k;
-@@ -37,7 +37,7 @@ hashtable_iterator_key(struct hashtable_
- /*****************************************************************************/
- /* value - return the value of the (key,value) pair at the current position */
- 
--extern inline void *
-+static inline void *
- hashtable_iterator_value(struct hashtable_itr *i)
- {
-     return i->e->v;
-Index: git/mkfs.ubifs/hashtable/hashtable_itr.c
-===================================================================
---- git.orig/mkfs.ubifs/hashtable/hashtable_itr.c
-+++ git/mkfs.ubifs/hashtable/hashtable_itr.c
-@@ -35,18 +35,6 @@ hashtable_iterator(struct hashtable *h)
- }
- 
- /*****************************************************************************/
--/* key      - return the key of the (key,value) pair at the current position */
--/* value    - return the value of the (key,value) pair at the current position */
--
--void *
--hashtable_iterator_key(struct hashtable_itr *i)
--{ return i->e->k; }
--
--void *
--hashtable_iterator_value(struct hashtable_itr *i)
--{ return i->e->v; }
--
--/*****************************************************************************/
- /* advance - advance the iterator to the next element
-  *           returns zero if advanced to end of table */
- 
diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch
deleted file mode 100644
index 46ed956..0000000
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 26cc709291fc6c5d2e45b26c602407706d9142df Mon Sep 17 00:00:00 2001
-From: Imre Kaloz <kaloz@openwrt.org>
-Date: Mon, 4 May 2015 15:36:34 +0200
-Subject: [PATCH] mtd-utils: libfec: use standard C type instead of u_long
-
-Fixes compilation on hosts with the musl C library.
-Also drops the unused u_short typedef.
-
-Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
-Signed-off-by: Brian Norris <computersforpeace@gmail.com>
----
-Upstream-Status: Backport
-
- lib/libfec.c | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/lib/libfec.c b/lib/libfec.c
-index ff5a127..bf68381 100644
---- a/lib/libfec.c
-+++ b/lib/libfec.c
-@@ -61,8 +61,6 @@ struct timeval {
- };
- #define gettimeofday(x, dummy) { (x)->ticks = clock() ; }
- #define DIFF_T(a,b) (1+ 1000000*(a.ticks - b.ticks) / CLOCKS_PER_SEC )
--typedef unsigned long u_long ;
--typedef unsigned short u_short ;
- #else /* typically, unix systems */
- #include <sys/time.h>
- #define DIFF_T(a,b) \
-@@ -75,12 +73,12 @@ typedef unsigned short u_short ;
- 	t = x.tv_usec + 1000000* (x.tv_sec & 0xff ) ; \
- 	}
- #define TOCK(t) \
--	{ u_long t1 ; TICK(t1) ; \
-+	{ unsigned long t1 ; TICK(t1) ; \
- 	  if (t1 < t) t = 256000000 + t1 - t ; \
- 	  else t = t1 - t ; \
- 	  if (t == 0) t = 1 ;}
- 
--u_long ticks[10];	/* vars for timekeeping */
-+unsigned long ticks[10];	/* vars for timekeeping */
- #else
- #define DEB(x)
- #define DDB(x)
-@@ -625,7 +623,7 @@ init_fec(void)
- #define FEC_MAGIC	0xFECC0DEC
- 
- struct fec_parms {
--    u_long magic ;
-+    unsigned long magic ;
-     int k, n ;		/* parameters of the code */
-     gf *enc_matrix ;
- } ;
--- 
-2.6.0
-
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index bc15ddd..cd9ae06 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -7,16 +7,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "zlib lzo e2fsprogs util-linux"
 
-PV = "1.5.1+git${SRCPV}"
+PV = "1.5.2"
 
-SRCREV = "9f107132a6a073cce37434ca9cda6917dd8d866b"
+SRCREV = "aea36417067dade75192bafa03af70b6eb2677b1"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            file://fix-armv7-neon-alignment.patch \
-           file://0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch \
            file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch \
            file://0001-Fix-build-with-musl.patch \
-           file://0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch \
 "
 
 SRC_URI_append_libc-musl = " file://010-fix-rpmatch.patch "
-- 
2.6.2


