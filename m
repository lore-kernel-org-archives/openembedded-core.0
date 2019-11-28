Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3DEBE7FAAE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 02:28:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,251,1571673600"; d="scan'208";a="79195943"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Nov 2019 10:28:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B95BF4CE20C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 10:19:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Nov 2019 10:28:02 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Nov 2019 01:12:27 -0800
Message-ID: <1574932348-14525-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574932348-14525-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1574932348-14525-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: B95BF4CE20C3.AAA91
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xserver-xorg 1.20.5 -> 1.20.6
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
X-List-Received-Date: Thu, 28 Nov 2019 02:28:02 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...Do-not-include-sys-io.h-on-ARM-with-glibc.patch | 63 ----------------------
 ...erver-xorg_1.20.5.bb => xserver-xorg_1.20.6.bb} |  5 +-
 2 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.5.bb => xserver-xorg_1.20.6.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
deleted file mode 100644
index da9a4f2..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 2ba9510721b7a76cb7fe507449fa0ac997a4cce3 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Mon, 1 Jul 2019 13:20:39 +0200
-Subject: [PATCH] compiler.h: Do not include sys/io.h on ARM with glibc
-
-<sys/io.h> on ARM hasn't worked for a long, long time, so it was removed
-it from glibc upstream.
-
-Remove the include to avoid a compilation failure on ARM with glibc.
-
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Closes: https://gitlab.freedesktop.org/xorg/xserver/issues/840
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/commit/fe4cd0e7f5c58fa94db36326aadc1bd4e6d73eba]
----
- hw/xfree86/common/compiler.h | 30 ------------------------------
- 1 file changed, 30 deletions(-)
-
-diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
-index 7144c6a..2b2008b 100644
---- a/hw/xfree86/common/compiler.h
-+++ b/hw/xfree86/common/compiler.h
-@@ -758,36 +758,6 @@ inl(unsigned short port)
-     return xf86ReadMmio32Le((void *) ioBase, port);
- }
- 
--#elif defined(__arm__) && defined(__linux__)
--
--/* for Linux on ARM, we use the LIBC inx/outx routines */
--/* note that the appropriate setup via "ioperm" needs to be done */
--/*  *before* any inx/outx is done. */
--
--#include <sys/io.h>
--
--static __inline__ void
--xf_outb(unsigned short port, unsigned char val)
--{
--    outb(val, port);
--}
--
--static __inline__ void
--xf_outw(unsigned short port, unsigned short val)
--{
--    outw(val, port);
--}
--
--static __inline__ void
--xf_outl(unsigned short port, unsigned int val)
--{
--    outl(val, port);
--}
--
--#define outb xf_outb
--#define outw xf_outw
--#define outl xf_outl
--
- #elif defined(__nds32__)
- 
- /*
--- 
-2.22.0
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
index 3de6d22..9218b4f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
@@ -3,11 +3,10 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
             file://pkgconfig.patch \
             file://0001-test-xtest-Initialize-array-with-braces.patch \
-            file://0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch \
             file://sdksyms-no-build-path.patch \
             "
-SRC_URI[md5sum] = "c9fc7e21e11286dbedd22c00df652130"
-SRC_URI[sha256sum] = "a81d8243f37e75a03d4f8c55f96d0bc25802be6ec45c3bfa5cb614c6d01bac9d"
+SRC_URI[md5sum] = "a98170084f2c8fed480d2ff601f8a14b"
+SRC_URI[sha256sum] = "6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.7.4




