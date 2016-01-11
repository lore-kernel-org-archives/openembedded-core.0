Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6832D731DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 15:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BF17Yg003663; Mon, 11 Jan 2016 15:01:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eGgCIpb01gl8; Mon, 11 Jan 2016 15:01:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BF12DK003644
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 Jan 2016 15:01:03 GMT
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1aIdxu-0008Cx-QN; Mon, 11 Jan 2016 15:01:02 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 15:00:57 +0000
Message-Id: <1452524461-31509-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 1/5] gdb: upgrade to 7.10.1
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
X-List-Received-Date: Mon, 11 Jan 2016 15:01:09 -0000

The PPC inferior patch was dropped since an equivalent fix was merged
upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 .../gdb/{gdb-7.9.1.inc => gdb-7.10.1.inc}          |  4 +-
 ...adian_7.9.1.bb => gdb-cross-canadian_7.10.1.bb} |  0
 .../{gdb-cross_7.9.1.bb => gdb-cross_7.10.1.bb}    |  0
 meta/recipes-devtools/gdb/gdb.inc                  |  1 -
 ...ction-of-64-bit-PPC-inferior-in-gdbserver.patch | 56 ----------------------
 .../gdb/{gdb_7.9.1.bb => gdb_7.10.1.bb}            |  0
 7 files changed, 3 insertions(+), 60 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.9.1.inc => gdb-7.10.1.inc} (68%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.9.1.bb => gdb-cross-canadian_7.10.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.9.1.bb => gdb-cross_7.10.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch
 rename meta/recipes-devtools/gdb/{gdb_7.9.1.bb => gdb_7.10.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 16507c4..cd9bfaf 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,7 +25,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "5.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.25%"
-GDBVERSION ?= "7.9%"
+GDBVERSION ?= "7.10%"
 GLIBCVERSION ?= "2.22"
 UCLIBCVERSION ?= "1.0%"
 LINUXLIBCVERSION ?= "4.1"
diff --git a/meta/recipes-devtools/gdb/gdb-7.9.1.inc b/meta/recipes-devtools/gdb/gdb-7.10.1.inc
similarity index 68%
rename from meta/recipes-devtools/gdb/gdb-7.9.1.inc
rename to meta/recipes-devtools/gdb/gdb-7.10.1.inc
index 1ca95af..a9267d5 100644
--- a/meta/recipes-devtools/gdb/gdb-7.9.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.10.1.inc
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
 
-SRC_URI[md5sum] = "f3b97de919a9dba84490b2e076ec4cb0"
-SRC_URI[sha256sum] = "4994ad986726ac4128a6f1bd8020cd672e9a92aa76b80736563ef992992764ef"
+SRC_URI[md5sum] = "b93a2721393e5fa226375b42d567d90b"
+SRC_URI[sha256sum] = "ff14f8050e6484508c73cbfa63731e57901478490ca1672dc0b5e2b03f6af622"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.9.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.9.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.10.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.9.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.9.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 2162cad..e970450 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -4,7 +4,6 @@ inherit gettext
 
 SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
             file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
-            file://fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch \
             file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
            "
 #LDFLAGS_append = " -s"
diff --git a/meta/recipes-devtools/gdb/gdb/fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch b/meta/recipes-devtools/gdb/gdb/fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch
deleted file mode 100644
index 2854352..0000000
--- a/meta/recipes-devtools/gdb/gdb/fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4fe67dbafa1bee679daecc12ed30621d5c2605de Mon Sep 17 00:00:00 2001
-From: Yao Qi <yao@codesourcery.com>
-Date: Mon, 11 May 2015 10:57:33 +0800
-Subject: [PATCH] Fix detection of 64-bit PPC inferior in gdbserver
-
-Issue #16775
-
-* gdbserver/linux-ppc-low.c (ppc_arch_setup): Change variable msr to type
-'unsigned long'.  Check bit 63 or bit 31 is one.
-
-https://sourceware.org/ml/gdb-patches/2014-12/msg00239.html
-Written by: Yao Qi <yao@codesourcery.com>
-
-Upstream-Status: Pending
-
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
----
- gdb/gdbserver/linux-ppc-low.c | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
-index 63d4218..a62cf22 100644
---- a/gdb/gdbserver/linux-ppc-low.c
-+++ b/gdb/gdbserver/linux-ppc-low.c
-@@ -374,7 +374,7 @@ ppc_arch_setup (void)
- {
-   const struct target_desc *tdesc;
- #ifdef __powerpc64__
--  long msr;
-+  unsigned long msr;
-   struct regcache *regcache;
- 
-   /* On a 64-bit host, assume 64-bit inferior process with no
-@@ -384,13 +384,16 @@ ppc_arch_setup (void)
-   current_process ()->tdesc = tdesc;
-   ppc_hwcap = 0;
- 
--  /* Only if the high bit of the MSR is set, we actually have
--     a 64-bit inferior.  */
-+  /* We actually have a 64-bit inferior only if the certain bit of the
-+     MSR is set.  The PowerISA Book III-S MSR is different from the
-+     PowerISA Book III-E MSR.  The Book III-S MSR is 64 bits wide, and
-+     its MSR[SF] is the bit 0 of a 64-bit value.  Book III-E MSR is 32
-+     bits wide, and its MSR[CM] is the bit 0 of a 32-bit value.  */
-   regcache = new_register_cache (tdesc);
-   fetch_inferior_registers (regcache, find_regno (tdesc, "msr"));
-   collect_register_by_name (regcache, "msr", &msr);
-   free_register_cache (regcache);
--  if (msr < 0)
-+  if (msr & 0x8000000080000000)
-     {
-       ppc_get_hwcap (&ppc_hwcap);
-       if (ppc_hwcap & PPC_FEATURE_CELL)
--- 
-1.8.5.2.233.g932f7e4
-
diff --git a/meta/recipes-devtools/gdb/gdb_7.9.1.bb b/meta/recipes-devtools/gdb/gdb_7.10.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.9.1.bb
rename to meta/recipes-devtools/gdb/gdb_7.10.1.bb
-- 
2.5.0


