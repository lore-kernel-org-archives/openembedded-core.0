Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgj7-0000Ln-Ti
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:04:46 +0200
Received: by pbbrq2 with SMTP id rq2so1385298pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 13:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CrStIM7aTekXoq3WztfvhpNBPrtMQmXKSY7ahOYbo4g=;
	b=llNhTyMHCwIJIgaGYVE+sj31B+uyTXLQXf7pbIJbxABrzWYEmIaPzysdHZIrchfaJ6
	AuP5As20nFwuy/P6iVPZtOhcduUAik29xiwaOjsoA9cEExAunxFa76w2L2jXu+Y6BoRH
	C6Ha82cSWEXFJ8qbE0V5sofaDfSP9l9srdLQYX06FFBByv9ZAUfPIVCAwrEBwCpUSMFE
	hoUQMuqdvp/9HA9G6mv52GOBMTYjBbyGUVWlXAj8eITWo/Usppof/CyKW4KI3PbRklCT
	ut0jXstvqdSTLEw9xzd0DKc+4m7Q8dxG7NrScbdY24pVyg3dvdTsuRpKWQ+YGCU3/lvI
	J6Lw==
Received: by 10.68.228.106 with SMTP id sh10mr754283pbc.107.1335992100634;
	Wed, 02 May 2012 13:55:00 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pg6sm2949558pbb.41.2012.05.02.13.54.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 13:54:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 13:53:56 -0700
Message-Id: <a3a55198a8b6f40debf754501c5f0f2b317603ed.1335991900.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
References: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335991900.git.raj.khem@gmail.com>
References: <cover.1335991900.git.raj.khem@gmail.com>
Subject: [PATCH 3/7] libatomics-ops: Make it build for SH4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2012 21:04:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libatomics-ops/gentoo/sh4-atomic-ops.patch     |   70 ++++++++++++++++++++
 .../pulseaudio/libatomics-ops_1.2.bb               |    6 +-
 2 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch

diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch b/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch
new file mode 100644
index 0000000..dfdd29c
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch
@@ -0,0 +1,70 @@
+This patch is taken from Gentoo
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libatomic_ops/files/libatomic_ops-1.2-sh4.patch?revision=1.1&view=markup
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libatomic_ops-1.2/src/atomic_ops.h
+===================================================================
+--- libatomic_ops-1.2.orig/src/atomic_ops.h	2012-04-30 13:56:17.000000000 -0700
++++ libatomic_ops-1.2/src/atomic_ops.h	2012-04-30 13:58:28.747602349 -0700
+@@ -223,6 +223,10 @@
+ # if defined(__mips__) 
+ #   include "atomic_ops/sysdeps/gcc/mips.h"
+ # endif
++# if defined(__sh__) || defined(SH4)
++#   include "atomic_ops/sysdeps/gcc/sh.h"
++#   define AO_CAN_EMUL_CAS
++# endif /* __sh__ */
+ #endif /* __GNUC__ && !AO_USE_PTHREAD_DEFS */
+ 
+ #if defined(__INTEL_COMPILER) && !defined(AO_USE_PTHREAD_DEFS)
+Index: libatomic_ops-1.2/src/atomic_ops/sysdeps/Makefile.am
+===================================================================
+--- libatomic_ops-1.2.orig/src/atomic_ops/sysdeps/Makefile.am	2012-04-30 10:52:18.000000000 -0700
++++ libatomic_ops-1.2/src/atomic_ops/sysdeps/Makefile.am	2012-04-30 14:00:11.511609965 -0700
+@@ -28,7 +28,7 @@
+ 	  gcc/powerpc.h gcc/sparc.h \
+ 	  gcc/hppa.h gcc/m68k.h gcc/s390.h \
+ 	  gcc/ia64.h gcc/x86_64.h gcc/cris.h \
+-	  gcc/mips.h \
++	  gcc/mips.h gcc/sh.h \
+ 	\
+ 	  icc/ia64.h \
+ 	\
+Index: libatomic_ops-1.2/src/atomic_ops/sysdeps/gcc/sh.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ libatomic_ops-1.2/src/atomic_ops/sysdeps/gcc/sh.h	2012-04-30 13:58:28.755602350 -0700
+@@ -0,0 +1,31 @@
++/*
++ * Copyright (c) 2009 by Takashi YOSHII. All rights reserved.
++ *
++ * THIS MATERIAL IS PROVIDED AS IS, WITH ABSOLUTELY NO WARRANTY EXPRESSED
++ * OR IMPLIED.  ANY USE IS AT YOUR OWN RISK.
++ *
++ * Permission is hereby granted to use or copy this program
++ * for any purpose,  provided the above notices are retained on all copies.
++ * Permission to modify the code and to distribute modified code is granted,
++ * provided the above notices are retained, and a notice that the code was
++ * modified is included with the above copyright notice.
++ */
++
++#include "../all_atomic_load_store.h"
++#include "../ordered.h"
++
++/* sh has tas.b(byte) only */
++#include "../test_and_set_t_is_char.h"
++
++AO_INLINE AO_TS_VAL_t
++AO_test_and_set_full(volatile AO_TS_t *addr)
++{
++  int oldval;
++  __asm__ __volatile__(
++        "tas.b @%1; movt %0"
++        : "=r" (oldval)
++        : "r" (addr)
++        : "t", "memory");
++  return oldval? AO_TS_CLEAR : AO_TS_SET;
++}
++#define AO_HAVE_test_and_set_full
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
index d0162e6..eba43cd 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
@@ -6,13 +6,15 @@ LICENSE = "GPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab \
 		   "
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-${PV}.tar.gz \
            file://fedora/libatomic_ops-1.2-ppclwzfix.patch \
            file://gentoo/libatomic_ops-1.2-mips.patch \
            file://doublefix.patch \
-           file://libatomics-ops_fix_for_x32.patch"
+           file://libatomics-ops_fix_for_x32.patch \
+           file://gentoo/sh4-atomic-ops.patch \
+          "
 
 SRC_URI[md5sum] = "1b65e48271c81e3fa2d7a9a69bab7504"
 SRC_URI[sha256sum] = "a3d8768aa8fd2f6ae79be2d756b3a6b48816b3889ae906be3d5ffb2de5a5c781"
-- 
1.7.5.4



