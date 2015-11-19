Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 36C326072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:06 +0000 (UTC)
Received: by qgec40 with SMTP id c40so55290267qge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=G+LgQG6gvUMG3mLW615kzDk6toFaoEmtnmQZnxDDTBc=;
	b=oOqztrPAfV39Zv0nWI2X0RD9NFTy/+S32F0t57I3XGArl7vRnavD4wW7OPyFR1oeCn
	keq5QXjDoItA5TGzQFay7pEKdoDZMmJAA7Ph6FiRYbnafUKzhWOu9d023oykAa8w9EUT
	SPJk9hOjw3NICU3FjWMfR0Eq8QX5SPRnd1LNytHGDrHJuPi1kQmuK34LAqwEFxUwCVBo
	9inp942l511twG8tzNr15whp0psG3Ev8lIjLtlZ1CLTYNTR+Cn371xx7CiZJ56FfU/Er
	hs01O3nic3tE2rDcsG0D6Ahzt1k0RUAwD2eFOPq3GzkrM4ZCpqXAi2iWMT9HORMF2T5Y
	MPlQ==
X-Received: by 10.140.29.195 with SMTP id b61mr8084693qgb.50.1447953067320;
	Thu, 19 Nov 2015 09:11:07 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:51 +0000
Message-Id: <9114985824d8abc4dc3e19a75dac51d3a5710264.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
Subject: [PATCH 04/13] mtd-utils: Backport and create patches to support musl
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   | 53 ++++++++++++++++++++
 ...ibfec-use-standard-C-type-instead-of-u_lo.patch | 56 ++++++++++++++++++++++
 .../mtd/mtd-utils/010-fix-rpmatch.patch            | 24 ++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  4 ++
 4 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
new file mode 100644
index 0000000..e683e90
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
@@ -0,0 +1,53 @@
+From e16fa28bc57c29923ab60af2ac343da83e1992d8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Oct 2015 23:51:34 +0000
+Subject: [PATCH] Fix build with musl
+
+upstream status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mkfs.jffs2.c  | 44 ++++++++++++++++++++++++++++++++++++++++++--
+ recv_image.c  |  1 -
+ serve_image.c |  1 -
+ 3 files changed, 42 insertions(+), 4 deletions(-)
+
+diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
+index f09c0b2..ed2dc43 100644
+--- a/mkfs.jffs2.c
++++ b/mkfs.jffs2.c
+@@ -72,6 +72,7 @@
+ #include <byteswap.h>
+ #include <crc32.h>
+ #include <inttypes.h>
++#include <limits.h>
+ 
+ #include "rbtree.h"
+ #include "common.h"
+diff --git a/recv_image.c b/recv_image.c
+index 26a8361..0093831 100644
+--- a/recv_image.c
++++ b/recv_image.c
+@@ -4,7 +4,6 @@
+ #define _BSD_SOURCE	/* struct ip_mreq */
+ 
+ #include <errno.h>
+-#include <error.h>
+ #include <stdio.h>
+ #include <netdb.h>
+ #include <stdlib.h>
+diff --git a/serve_image.c b/serve_image.c
+index 38549a1..4f0e946 100644
+--- a/serve_image.c
++++ b/serve_image.c
+@@ -3,7 +3,6 @@
+ 
+ #include <time.h>
+ #include <errno.h>
+-#include <error.h>
+ #include <netdb.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-- 
+2.6.1
+
diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch
new file mode 100644
index 0000000..46ed956
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch
@@ -0,0 +1,56 @@
+From 26cc709291fc6c5d2e45b26c602407706d9142df Mon Sep 17 00:00:00 2001
+From: Imre Kaloz <kaloz@openwrt.org>
+Date: Mon, 4 May 2015 15:36:34 +0200
+Subject: [PATCH] mtd-utils: libfec: use standard C type instead of u_long
+
+Fixes compilation on hosts with the musl C library.
+Also drops the unused u_short typedef.
+
+Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
+Signed-off-by: Brian Norris <computersforpeace@gmail.com>
+---
+Upstream-Status: Backport
+
+ lib/libfec.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/lib/libfec.c b/lib/libfec.c
+index ff5a127..bf68381 100644
+--- a/lib/libfec.c
++++ b/lib/libfec.c
+@@ -61,8 +61,6 @@ struct timeval {
+ };
+ #define gettimeofday(x, dummy) { (x)->ticks = clock() ; }
+ #define DIFF_T(a,b) (1+ 1000000*(a.ticks - b.ticks) / CLOCKS_PER_SEC )
+-typedef unsigned long u_long ;
+-typedef unsigned short u_short ;
+ #else /* typically, unix systems */
+ #include <sys/time.h>
+ #define DIFF_T(a,b) \
+@@ -75,12 +73,12 @@ typedef unsigned short u_short ;
+ 	t = x.tv_usec + 1000000* (x.tv_sec & 0xff ) ; \
+ 	}
+ #define TOCK(t) \
+-	{ u_long t1 ; TICK(t1) ; \
++	{ unsigned long t1 ; TICK(t1) ; \
+ 	  if (t1 < t) t = 256000000 + t1 - t ; \
+ 	  else t = t1 - t ; \
+ 	  if (t == 0) t = 1 ;}
+ 
+-u_long ticks[10];	/* vars for timekeeping */
++unsigned long ticks[10];	/* vars for timekeeping */
+ #else
+ #define DEB(x)
+ #define DDB(x)
+@@ -625,7 +623,7 @@ init_fec(void)
+ #define FEC_MAGIC	0xFECC0DEC
+ 
+ struct fec_parms {
+-    u_long magic ;
++    unsigned long magic ;
+     int k, n ;		/* parameters of the code */
+     gf *enc_matrix ;
+ } ;
+-- 
+2.6.0
+
diff --git a/meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch b/meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
new file mode 100644
index 0000000..7d783e7
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
@@ -0,0 +1,24 @@
+Replace rpmatch() usage with checking first character of line
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/include/common.h
++++ b/include/common.h
+@@ -122,10 +122,12 @@
+ 		}
+ 
+ 		if (strcmp("\n", line) != 0) {
+-			switch (rpmatch(line)) {
+-			case 0: ret = false; break;
+-			case 1: ret = true; break;
+-			case -1:
++			switch (line[0]) {
++			case 'N':
++			case 'n': ret = false; break;
++			case 'Y':
++			case 'y': ret = true; break;
++			default:
+ 				puts("unknown response; please try again");
+ 				continue;
+ 			}
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 17dca77..bc15ddd 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -15,8 +15,12 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://fix-armv7-neon-alignment.patch \
            file://0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch \
            file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch \
+           file://0001-Fix-build-with-musl.patch \
+           file://0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch \
 "
 
+SRC_URI_append_libc-musl = " file://010-fix-rpmatch.patch "
+
 S = "${WORKDIR}/git/"
 
 # xattr support creates an additional compile-time dependency on acl because
-- 
2.6.3


