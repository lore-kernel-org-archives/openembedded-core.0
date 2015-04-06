Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id F0E7C73D18
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:13 +0000 (UTC)
Received: by ierf6 with SMTP id f6so26628091ier.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Rf47JK4J2fvRTW/uEmdlEAAoD+pWRR0ut64y6op7o48=;
	b=Qi+0KMK+6BpEKtM2Qrfx7XVin7RKs7STsPwuWU29/XvXlzgu/xndOcawFq31X/eg/g
	5zICPEefDlYz68g3vuagubwTRfr21dR1cs1HUPOfyKMSsYxwdoCpn4ivbZj8sn9/l9sa
	0cBgO2QSy06nDxmcs3s6pZKz7T5rAX5F7fsZErtRh8VvV9/RsKDBOr8N25uwqJtw5pUE
	U/iwNjccftQfdDWtV5bTwpDX50zWhjiE8K6EIkL/6qrKYf3+i2Ed+dK0kO+2L4LuNh8f
	VWPSrZ5KD4x6h9e1ZcI4UAaRqefT9s1dJ9oycYXMtGxt4E4H9W4YfJL3/SCiJTEroGqD
	SFKQ==
X-Received: by 10.107.153.129 with SMTP id b123mr22963982ioe.63.1428341835481; 
	Mon, 06 Apr 2015 10:37:15 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:49 +0000
Message-Id: <9f19d60d012adbc06ee09c0545439fd112bf6053.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 21/24] pixman,libpciaccess: Fix build on musl
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:14 -0000

The fixes are not specific to musl, however they came
to surface due to musl, these are generic problems which
should be fixed in components

Change-Id: If9aa95968d9dec9c16e3e5819955befcaa38937c
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-lib/libpciaccess/limits.patch             | 17 +++++++++++++
 .../xorg-lib/libpciaccess_0.13.3.bb                |  2 ++
 .../xorg-lib/pixman/asm_include.patch              | 29 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb    |  1 +
 4 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/limits.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/asm_include.patch

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/limits.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/limits.patch
new file mode 100644
index 0000000..498020e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess/limits.patch
@@ -0,0 +1,17 @@
+Add missing include file to get definition of PATH_MAX
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: libpciaccess-0.13.3/src/linux_sysfs.c
+===================================================================
+--- libpciaccess-0.13.3.orig/src/linux_sysfs.c
++++ libpciaccess-0.13.3/src/linux_sysfs.c
+@@ -44,6 +44,7 @@
+ #include <sys/mman.h>
+ #include <dirent.h>
+ #include <errno.h>
++#include <limits.h>
+ 
+ #if defined(__i386__) || defined(__x86_64__) || defined(__arm__)
+ #include <sys/io.h>
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.3.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.3.bb
index bbba24e..4a832e8 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.3.bb
@@ -5,6 +5,8 @@ PCI bus and devices in a platform-independent way."
 
 require xorg-lib-common.inc
 
+SRC_URI += "file://limits.patch"
+
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
 
diff --git a/meta/recipes-graphics/xorg-lib/pixman/asm_include.patch b/meta/recipes-graphics/xorg-lib/pixman/asm_include.patch
new file mode 100644
index 0000000..b52a570
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/asm_include.patch
@@ -0,0 +1,29 @@
+Fixes errors like
+
+Assembler messages:
+Fatal error: can't create .libs/pixman-mips-dspr2-asm.o: No such file or directory
+
+it works with glibc because it uses gcc fixed-headers but thats not right.
+
+We move the include under C block
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: pixman-0.32.6/pixman/pixman-private.h
+===================================================================
+--- pixman-0.32.6.orig/pixman/pixman-private.h
++++ pixman-0.32.6/pixman/pixman-private.h
+@@ -1,4 +1,3 @@
+-#include <float.h>
+ 
+ #ifndef PIXMAN_PRIVATE_H
+ #define PIXMAN_PRIVATE_H
+@@ -17,6 +16,8 @@
+ 
+ #ifndef __ASSEMBLER__
+ 
++#include <float.h>
++
+ #ifndef PACKAGE
+ #  error config.h must be included before pixman-private.h
+ #endif
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb b/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
index 467ba50..eae59b6 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
@@ -30,6 +30,7 @@ EXTRA_OECONF_class-native = "--disable-gtk"
 SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
             file://mips-export-revert.patch \
+	    file://asm_include.patch \
 "
 
 SRC_URI[md5sum] = "8a9e8f14743a39cf303803f369c1f344"
-- 
2.1.4


