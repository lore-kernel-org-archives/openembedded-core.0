Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CD8A07DF61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 05:38:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,219,1569254400"; d="scan'208";a="77350311"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Oct 2019 13:38:36 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 955A84CE1507
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 13:30:43 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 13:38:36 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 23 Oct 2019 13:38:35 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Oct 2019 13:38:26 +0800
Message-ID: <1571809106-125886-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202)
X-yoursite-MailScanner-ID: 955A84CE1507.A5DA0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libx11: Upgrade to 1.6.9
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
X-List-Received-Date: Wed, 23 Oct 2019 05:38:37 -0000
Content-Type: text/plain

1) Upgrade libx11 from 1.6.8 to 1.6.9.
2) Delete patches for they have been meraged in new version.
   no-host-libtool.patch
   no-host-x.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/xorg-lib/libx11.inc          |  7 ++--
 .../xorg-lib/libx11/no-host-libtool.patch          | 45 ----------------------
 .../xorg-lib/libx11/no-host-x.patch                | 40 -------------------
 .../xorg-lib/{libx11_1.6.8.bb => libx11_1.6.9.bb}  |  0
 4 files changed, 3 insertions(+), 89 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/no-host-libtool.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.8.bb => libx11_1.6.9.bb} (100%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index cce0cb9..d3cf5d9 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -11,11 +11,10 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 PE = "1"
 
 SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
-            file://no-host-libtool.patch \
-            file://no-host-x.patch"
+            "
 
-SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
-SRC_URI[sha256sum] = "b289a845c189e251e0e884cc0f9269bbe97c238df3741e854ec4c17c21e473d5"
+SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
+SRC_URI[sha256sum] = "9cc7e8d000d6193fa5af580d50d689380b8287052270f5bb26a5fb6b58b2bed1"
 
 PROVIDES = "virtual/libx11"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11/no-host-libtool.patch b/meta/recipes-graphics/xorg-lib/libx11/no-host-libtool.patch
deleted file mode 100644
index 56d9983..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11/no-host-libtool.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/merge_requests/22]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From edc7680ed5a03cedb5facf14693823455e12c29c Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 6 Aug 2019 14:53:43 +0100
-Subject: [PATCH libX11] src/util/Makefile: explicitly reset LINK to not use
- libtool
-
-Simply looking at libtool redefines LINK globally to use libtool, which when
-you're trying to cross-compile to Windows can cause complications.
-
-As in src/util/ we're simply building a small binary for the build host, reset
-LINK to the automake default so that the traditional compile/link steps occur
-without libtool.
-
-Also remove -all-static from LDFLAGS as that is a libtool-specific argument
-intended to solve this problem.
-
-Closes: #100
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- src/util/Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/util/Makefile.am b/src/util/Makefile.am
-index 37314370..b7236530 100644
---- a/src/util/Makefile.am
-+++ b/src/util/Makefile.am
-@@ -7,10 +7,11 @@ AM_CFLAGS = \
- AM_CPPFLAGS = \
- 	-I$(top_srcdir)/include
- 
-+LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
- CC = @CC_FOR_BUILD@
- CPPFLAGS = @CPPFLAGS_FOR_BUILD@
- CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@ -all-static
-+LDFLAGS = @LDFLAGS_FOR_BUILD@
- LIBS =
- EXEEXT = @EXEEXT_FOR_BUILD@
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch b/meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch
deleted file mode 100644
index 803f8b4..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From cf2ef27831173c5ed6f98be3c39caff18fd4e7f1 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Mon, 17 Jun 2019 13:36:08 -0400
-Subject: [PATCH 1/2] makekeys: Detach ourselves from X headers entirely
-
-Subsequent to a121b7b0c210efe10bf93453b29050282324c906 we are no longer
-building makekeys with enough -I/foo/bar to find the X11 headers, so if
-they're not in a system include path, things fail. Since this utility is
-only needed at build time, there's no real reason to demand the X
-headers be installed for both the build and target machines if cross-
-compiling, we can just assume a vaguely ANSI environment instead.
-
-Tested-by: Niclas Zeising <zeising@daemonic.se>
-Reviewed-by: Keith Packard <keithp@keithp.com>
-Reviewed-by: Matt Turner <mattst88@gmail.com>
----
- src/util/makekeys.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/util/makekeys.c b/src/util/makekeys.c
-index bcb5b7d5..07563315 100644
---- a/src/util/makekeys.c
-+++ b/src/util/makekeys.c
-@@ -35,8 +35,10 @@ from The Open Group.
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <stdint.h>
-+#include <inttypes.h>
- 
--#include "../Xresinternal.h"
-+typedef uint32_t Signature;
- 
- #define KTNUM 4000
- 
--- 
-2.20.1
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
-- 
2.7.4




