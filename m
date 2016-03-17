Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 873A66FF9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:31:49 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3qQnm32ZHgz3hjnb;
	Thu, 17 Mar 2016 13:31:47 +0100 (CET)
X-Auth-Info: 6z2lXtFzbh1Z2NLwkbW1O96v4Suz4JoJJ2YP8ImzVA0=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3qQnm259phzvdWV;
	Thu, 17 Mar 2016 13:31:46 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 13:31:33 +0100
Message-Id: <1458217899-5542-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.7.0
Cc: Marek Vasut <marex@denx.de>, Thomas Chou <thomas@wytron.com.tw>,
	Ley Foon Tan <lftan@altera.com>, Walter Goossens <waltergoossens@home.nl>
Subject: [PATCH 1/7] libatomic-ops: Backport nios2 support
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
X-List-Received-Date: Thu, 17 Mar 2016 12:31:51 -0000

Backport a patch adding nios2 support into libatomic-ops

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ley Foon Tan <lftan@altera.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Thomas Chou <thomas@wytron.com.tw>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 ...01-Add-initial-nios2-architecture-support.patch | 70 ++++++++++++++++++++++
 .../libatomic-ops/libatomic-ops_7.4.2.bb           |  5 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libatomic-ops/libatomic-ops/0001-Add-initial-nios2-architecture-support.patch

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops/0001-Add-initial-nios2-architecture-support.patch b/meta/recipes-support/libatomic-ops/libatomic-ops/0001-Add-initial-nios2-architecture-support.patch
new file mode 100644
index 0000000..c051075
--- /dev/null
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops/0001-Add-initial-nios2-architecture-support.patch
@@ -0,0 +1,70 @@
+From 4b005ee56898309e8afba9b3c48cf94f0f5f78e4 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Tue, 15 Mar 2016 10:09:26 +0300
+Subject: [PATCH] Add initial nios2 architecture support
+
+* src/Makefile.am (nobase_private_HEADERS): Add nios2.h.
+* src/atomic_ops.h: Include nios2.h if __nios2__.
+* src/atomic_ops/sysdeps/gcc/nios2.h: New file.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Backport [ https://github.com/ivmai/libatomic_ops.git 4b005ee56898309e8afba9b3c48cf94f0f5f78e4 ]
+---
+ src/Makefile.am                    |  1 +
+ src/atomic_ops.h                   |  3 +++
+ src/atomic_ops/sysdeps/gcc/nios2.h | 17 +++++++++++++++++
+ 3 files changed, 21 insertions(+)
+ create mode 100644 src/atomic_ops/sysdeps/gcc/nios2.h
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index fc09b27..d463427 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -79,6 +79,7 @@ nobase_private_HEADERS = atomic_ops/ao_version.h \
+           atomic_ops/sysdeps/gcc/ia64.h \
+           atomic_ops/sysdeps/gcc/m68k.h \
+           atomic_ops/sysdeps/gcc/mips.h \
++          atomic_ops/sysdeps/gcc/nios2.h \
+           atomic_ops/sysdeps/gcc/powerpc.h \
+           atomic_ops/sysdeps/gcc/s390.h \
+           atomic_ops/sysdeps/gcc/sh.h \
+diff --git a/src/atomic_ops.h b/src/atomic_ops.h
+index 33fe00e..ec02ba4 100644
+--- a/src/atomic_ops.h
++++ b/src/atomic_ops.h
+@@ -262,6 +262,9 @@
+ # if defined(__m68k__)
+ #   include "atomic_ops/sysdeps/gcc/m68k.h"
+ # endif /* __m68k__ */
++# if defined(__nios2__)
++#   include "atomic_ops/sysdeps/gcc/nios2.h"
++# endif /* __nios2__ */
+ # if defined(__powerpc__) || defined(__ppc__) || defined(__PPC__) \
+      || defined(__powerpc64__) || defined(__ppc64__)
+ #   include "atomic_ops/sysdeps/gcc/powerpc.h"
+diff --git a/src/atomic_ops/sysdeps/gcc/nios2.h b/src/atomic_ops/sysdeps/gcc/nios2.h
+new file mode 100644
+index 0000000..f402cbb
+--- /dev/null
++++ b/src/atomic_ops/sysdeps/gcc/nios2.h
+@@ -0,0 +1,17 @@
++/*
++ * Copyright (C) 2016 Marek Vasut <marex@denx.de>
++ *
++ * THIS MATERIAL IS PROVIDED AS IS, WITH ABSOLUTELY NO WARRANTY EXPRESSED
++ * OR IMPLIED. ANY USE IS AT YOUR OWN RISK.
++ *
++ * Permission is hereby granted to use or copy this program
++ * for any purpose, provided the above notices are retained on all copies.
++ * Permission to modify the code and to distribute modified code is granted,
++ * provided the above notices are retained, and a notice that the code was
++ * modified is included with the above copyright notice.
++ */
++
++#include "../test_and_set_t_is_ao_t.h"
++#include "generic.h"
++
++#define AO_T_IS_INT
+-- 
+2.7.0
+
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb
index 4d0e299..fdb70d8 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
 		   "
 
-SRC_URI = "http://www.ivmaisoft.com/_bin/atomic_ops/libatomic_ops-${PV}.tar.gz"
+SRC_URI = "\
+	http://www.ivmaisoft.com/_bin/atomic_ops/libatomic_ops-${PV}.tar.gz \
+	file://0001-Add-initial-nios2-architecture-support.patch \
+	"
 
 SRC_URI[md5sum] = "1d6538604b314d2fccdf86915e5c0857"
 SRC_URI[sha256sum] = "04fa615f62992547bcbda562260e28b504bc4c06e2f985f267f3ade30304b5dd"
-- 
2.7.0


