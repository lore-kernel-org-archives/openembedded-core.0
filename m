Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 334537F2CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 22:58:30 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id g2so28762838pfq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 15:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UcZj4DWP7cLQ5Wur529AV1Zr4DlN5jOIx2FMRVpiT/8=;
	b=hZ4cQP9YWPeBp9ptGn1qKVgoYD0eUGDx6aJPhmZTppvsxNIdPILDb+zyPfhH4vSPAI
	6YCy62G5yQC6F/P9JuAkHH17aMWwrWrHksgiz2HUiO9v3xwB5L6bQh4xrReEeH7v9ed3
	yRo37TIzrghGYvpanzNiQjvIwMF5OlzfJRHc0Xp1LXjIcgI20k4+/GCSFpJUHelkMu4T
	aQHbW/XvTgGpsX3flRtYvs7RmGUNipYR9g1/dJ3eCDciwBhKkgboIigGzqqG9r+691bH
	vb59C5oDzHS/UH8K33q0VuEcuZOZdj5uV3Qn3BpJ971lL3s93oVR21GU1k12Ngg/0d3y
	zytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UcZj4DWP7cLQ5Wur529AV1Zr4DlN5jOIx2FMRVpiT/8=;
	b=JpL8qB26HjqigMBJ0tP4djn6Xy8maG/NphqfEcOrlmLxUEhP8X5l3uIjsfonwF6KnE
	J6oMbTdHnc1mAZQXDKJsJbrRn9nYTyl+pYjmu7hVe5IUoA4ILjgXzZ/AQCikQmwwFzmW
	q1db0n0wlhqHNr/f+9533q53MsTvWJurNr6y2aSEnnosqgtKosQaGhdViuldSndJjagg
	naWenxBG4HqAuAUgKOXPw8hVsAkP3GcQNwZ+UcijFAjIMD+mtQTDSvdKM1mpYHWjJT6o
	YUchtgayn3NdlRNLBiOv9OtHpu44kDm3WK08mHCTO1rbA8e5q4A2+y7J6k1RGGSpf7lc
	JMIA==
X-Gm-Message-State: APjAAAXCeTvxrTYdUPym1714yzh7MSJidxtfNZSnM72SZR7535u0CiAl
	oryfStDPk9JBuR4LhL/ODrNqngYIDzc=
X-Google-Smtp-Source: APXvYqyUhv2chTyy7PFqrGqtVQUxBstp6eI9NfphqIK83xldkY+r6G9Bbtfu3dZOpbVfdnyEp0cupQ==
X-Received: by 2002:a63:20a:: with SMTP id 10mr105357817pgc.226.1564441110682; 
	Mon, 29 Jul 2019 15:58:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	f12sm52537052pgq.52.2019.07.29.15.58.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 15:58:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 15:58:09 -0700
Message-Id: <20190729225809.30710-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] xserver-xorg: Backport patch to remove using sys/io.h
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
X-List-Received-Date: Mon, 29 Jul 2019 22:58:30 -0000
Content-Transfer-Encoding: 8bit

latest glibc dropped support for sys/io.h on arm, which is fixed in
upstream xserver, as a bonus we can drop musl specific patch which was
doing something similar up until now.

Fixes
|In file included from ../../../../xorg-server-1.20.4/hw/xfree86/int10/generic.c:15:
| ../../../../xorg-server-1.20.4/hw/xfree86/common/compiler.h:767:10: fatal error: 'sys/io.h' file not found
| #include <sys/io.h>
|          ^~~~~~~~~~
| 1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-include-sys-io.h-on-ARM-with-glibc.patch | 63 +++++++++++++++++++
 .../xserver-xorg/musl-arm-inb-outb.patch      | 18 ------
 .../xorg-xserver/xserver-xorg_1.20.4.bb       |  4 +-
 3 files changed, 65 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
new file mode 100644
index 0000000000..da9a4f2b25
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
@@ -0,0 +1,63 @@
+From 2ba9510721b7a76cb7fe507449fa0ac997a4cce3 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 1 Jul 2019 13:20:39 +0200
+Subject: [PATCH] compiler.h: Do not include sys/io.h on ARM with glibc
+
+<sys/io.h> on ARM hasn't worked for a long, long time, so it was removed
+it from glibc upstream.
+
+Remove the include to avoid a compilation failure on ARM with glibc.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Closes: https://gitlab.freedesktop.org/xorg/xserver/issues/840
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/commit/fe4cd0e7f5c58fa94db36326aadc1bd4e6d73eba]
+---
+ hw/xfree86/common/compiler.h | 30 ------------------------------
+ 1 file changed, 30 deletions(-)
+
+diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
+index 7144c6a..2b2008b 100644
+--- a/hw/xfree86/common/compiler.h
++++ b/hw/xfree86/common/compiler.h
+@@ -758,36 +758,6 @@ inl(unsigned short port)
+     return xf86ReadMmio32Le((void *) ioBase, port);
+ }
+ 
+-#elif defined(__arm__) && defined(__linux__)
+-
+-/* for Linux on ARM, we use the LIBC inx/outx routines */
+-/* note that the appropriate setup via "ioperm" needs to be done */
+-/*  *before* any inx/outx is done. */
+-
+-#include <sys/io.h>
+-
+-static __inline__ void
+-xf_outb(unsigned short port, unsigned char val)
+-{
+-    outb(val, port);
+-}
+-
+-static __inline__ void
+-xf_outw(unsigned short port, unsigned short val)
+-{
+-    outw(val, port);
+-}
+-
+-static __inline__ void
+-xf_outl(unsigned short port, unsigned int val)
+-{
+-    outl(val, port);
+-}
+-
+-#define outb xf_outb
+-#define outw xf_outw
+-#define outl xf_outl
+-
+ #elif defined(__nds32__)
+ 
+ /*
+-- 
+2.22.0
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch
deleted file mode 100644
index 4be441fb71..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-inb/outb family for arm is only implemented on glibc
-so assumption across linux is wrong
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: xorg-server-1.18.0/hw/xfree86/common/compiler.h
-===================================================================
---- xorg-server-1.18.0.orig/hw/xfree86/common/compiler.h
-+++ xorg-server-1.18.0/hw/xfree86/common/compiler.h
-@@ -758,7 +758,7 @@ inl(unsigned short port)
-     return xf86ReadMmio32Le((void *) ioBase, port);
- }
- 
--#elif defined(__arm__) && defined(__linux__)
-+#elif defined(__arm__) && defined(__GLIBC__)
- 
- /* for Linux on ARM, we use the LIBC inx/outx routines */
- /* note that the appropriate setup via "ioperm" needs to be done */
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
index ad99d6bece..d7c5e6b355 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
@@ -1,9 +1,9 @@
 require xserver-xorg.inc
 
-SRC_URI += "file://musl-arm-inb-outb.patch \
-            file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
+SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
             file://pkgconfig.patch \
             file://0001-test-xtest-Initialize-array-with-braces.patch \
+            file://0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch \
             "
 SRC_URI[md5sum] = "c4841cc24b79420205d082fe82e0a650"
 SRC_URI[sha256sum] = "fe0fd493ebe93bfc56bede382fa204458ff5f636ea54d413a5d1bd58e19166ee"
-- 
2.22.0


