Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDaJZ-0003JN-Pt
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 14:20:37 +0200
Received: by wgbdq11 with SMTP id dq11so2288311wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 05:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=L1ylISXjshY+rWeEmoJXHfPGw2Cx1y2UbXWmjAZZzcc=;
	b=YBchZ6rgqSmVD9eCpc5Q7CVcrUMZHkZd+dHB2uPEqbw2Ql2p55g1qwJKZ6T1WsB4B6
	wnIS5A5f/+iBcaNGFG5XrwfIqeFxzEY+z7MZebZzsr38xnYM31RiHGoJfMj1q9ImMki8
	7+mFbvDNqjMPZMqHIHW5tOpzFj5adOUF5cW6oexGcyYbVAwXXT35kzRF6yGeHGnly3AU
	apytCpM+eQ2WiImQmjfhl5pxWSg9V1e24zE1xyqldQW5ClnyF1JX32ghl8/KB1WCvpcH
	6Z0nFzp/mEt+cAJyCXsx/lsZSpwj0CDHNqWhlk7+hsiCJ09VaYOl2WIk7gVoFpDDG7hG
	iMhA==
Received: by 10.216.207.160 with SMTP id n32mr2492226weo.61.1347883679420;
	Mon, 17 Sep 2012 05:07:59 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k20sm17570403wiv.11.2012.09.17.05.07.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 05:07:58 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 14:07:29 +0200
Message-Id: <1347883657-17529-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
References: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmRsUb/LXaIZkkSo/lHO1nuQL9mA1OGz/tmkQ+YVL5t4JP4jhKdNhomKtU6GFOWUvAEiKiH
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][pulseaudio-updates 02/10] libatomics-ops: Make it build for SH4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 12:20:37 -0000

From: Khem Raj <raj.khem@gmail.com>

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
1.7.7.6



