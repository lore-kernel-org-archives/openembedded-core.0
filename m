Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35B0173B10
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 03:20:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t683Kf12005649
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jul 2015 20:20:41 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 7 Jul 2015 20:20:41 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 11:15:11 +0800
Message-ID: <1436325311-9236-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gdb: Fix detection of 64-bit PPC inferior in gdbserver
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
X-List-Received-Date: Wed, 08 Jul 2015 03:20:44 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

Fix 64-bit detection according to PowerISA Boot III-S.

https://sourceware.org/ml/gdb-patches/2014-12/msg00239.html
Written by: Yao Qi <yao@codesourcery.com>

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/gdb/gdb.inc                  |  1 +
 ...ction-of-64-bit-PPC-inferior-in-gdbserver.patch | 56 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 5466a7d..88c0213 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -4,6 +4,7 @@ inherit gettext
 
 SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
             file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
+            file://fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch b/meta/recipes-devtools/gdb/gdb/fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch
new file mode 100644
index 0000000..2854352
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch
@@ -0,0 +1,56 @@
+From 4fe67dbafa1bee679daecc12ed30621d5c2605de Mon Sep 17 00:00:00 2001
+From: Yao Qi <yao@codesourcery.com>
+Date: Mon, 11 May 2015 10:57:33 +0800
+Subject: [PATCH] Fix detection of 64-bit PPC inferior in gdbserver
+
+Issue #16775
+
+* gdbserver/linux-ppc-low.c (ppc_arch_setup): Change variable msr to type
+'unsigned long'.  Check bit 63 or bit 31 is one.
+
+https://sourceware.org/ml/gdb-patches/2014-12/msg00239.html
+Written by: Yao Qi <yao@codesourcery.com>
+
+Upstream-Status: Pending
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ gdb/gdbserver/linux-ppc-low.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
+index 63d4218..a62cf22 100644
+--- a/gdb/gdbserver/linux-ppc-low.c
++++ b/gdb/gdbserver/linux-ppc-low.c
+@@ -374,7 +374,7 @@ ppc_arch_setup (void)
+ {
+   const struct target_desc *tdesc;
+ #ifdef __powerpc64__
+-  long msr;
++  unsigned long msr;
+   struct regcache *regcache;
+ 
+   /* On a 64-bit host, assume 64-bit inferior process with no
+@@ -384,13 +384,16 @@ ppc_arch_setup (void)
+   current_process ()->tdesc = tdesc;
+   ppc_hwcap = 0;
+ 
+-  /* Only if the high bit of the MSR is set, we actually have
+-     a 64-bit inferior.  */
++  /* We actually have a 64-bit inferior only if the certain bit of the
++     MSR is set.  The PowerISA Book III-S MSR is different from the
++     PowerISA Book III-E MSR.  The Book III-S MSR is 64 bits wide, and
++     its MSR[SF] is the bit 0 of a 64-bit value.  Book III-E MSR is 32
++     bits wide, and its MSR[CM] is the bit 0 of a 32-bit value.  */
+   regcache = new_register_cache (tdesc);
+   fetch_inferior_registers (regcache, find_regno (tdesc, "msr"));
+   collect_register_by_name (regcache, "msr", &msr);
+   free_register_cache (regcache);
+-  if (msr < 0)
++  if (msr & 0x8000000080000000)
+     {
+       ppc_get_hwcap (&ppc_hwcap);
+       if (ppc_hwcap & PPC_FEATURE_CELL)
+-- 
+1.8.5.2.233.g932f7e4
+
-- 
1.9.1


