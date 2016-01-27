Return-Path: <mathieu.desnoyers@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [78.47.125.74])
	by mail.openembedded.org (Postfix) with ESMTP id CA9A66FF6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:00:24 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 5B450340492;
	Wed, 27 Jan 2016 15:00:25 +0000 (UTC)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id LqpVUnNvBPU8; Wed, 27 Jan 2016 15:00:20 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 841A8340307;
	Wed, 27 Jan 2016 15:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id GyeRwMYWze-w; Wed, 27 Jan 2016 15:00:20 +0000 (UTC)
Received: from thinkos.internal.efficios.com
	(cable-192.222.213.99.electronicbox.net [192.222.213.99])
	by mail.efficios.com (Postfix) with ESMTPSA id 942853402FA;
	Wed, 27 Jan 2016 15:00:19 +0000 (UTC)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jan 2016 10:00:05 -0500
Message-Id: <1453906805-20539-1-git-send-email-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.1.4
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH poky (OE-core)] Fix: hidden weak symbols by removing buggy openembedded gcc 4.8 patch
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
X-List-Received-Date: Wed, 27 Jan 2016 15:00:25 -0000

Patch 0024-PR-target-32219.patch, which has been proposed to be removed
from the gcc 4.9 patches, should also be removed from gcc 4.8 patches.

Should be applied to fido and dizzy stable branches.

Link: http://lists.openembedded.org/pipermail/openembedded-core/2016-January/116306.html
Link: http://lists.lttng.org/pipermail/lttng-dev/2014-May/023112.html
Link: https://gcc.gnu.org/ml/gcc-help/2014-05/msg00042.html
Link: http://cgit.openembedded.org/openembedded-core/commit/?id=3cb2b003db7371b3a47d02c08352a262e1e419b4
Link: https://sourceware.org/bugzilla/show_bug.cgi?id=15435

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: openembedded-core@lists.openembedded.org
CC: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>
CC: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 -
 .../gcc/gcc-4.8/0024-PR-target-32219.patch         | 67 ----------------------
 2 files changed, 68 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0024-PR-target-32219.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 06e6982..0d0e57d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -47,7 +47,6 @@ SRC_URI = "\
     file://0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
     file://0022-COLLECT_GCC_OPTIONS.patch \
     file://0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
-    file://0024-PR-target-32219.patch \
     file://0025-fortran-cross-compile-hack.patch \
     file://0026-libgcc-sjlj-check.patch \
     file://0027-cpp-honor-sysroot.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0024-PR-target-32219.patch b/meta/recipes-devtools/gcc/gcc-4.8/0024-PR-target-32219.patch
deleted file mode 100644
index b47d841..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.8/0024-PR-target-32219.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From e0d15f4f8bf28c351b9215ca37f1caa24df0e1fd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:18:54 +0400
-Subject: [PATCH 24/35] PR target/32219
-
-* varasm.c (default_binds_local_p_1): Weak data is not local.
-
-Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Backport
----
- gcc/testsuite/gcc.dg/visibility-21.c |   14 ++++++++++++++
- gcc/varasm.c                         |    9 ++++-----
- 2 files changed, 18 insertions(+), 5 deletions(-)
- create mode 100644 gcc/testsuite/gcc.dg/visibility-21.c
-
-diff --git a/gcc/testsuite/gcc.dg/visibility-21.c b/gcc/testsuite/gcc.dg/visibility-21.c
-new file mode 100644
-index 0000000..be7deda
---- /dev/null
-+++ b/gcc/testsuite/gcc.dg/visibility-21.c
-@@ -0,0 +1,14 @@
-+/* PR target/32219 */
-+/* { dg-do run } */
-+/* { dg-require-visibility "" } */
-+/* { dg-options "-fPIC" { target fpic } } */
-+
-+extern void f() __attribute__((weak,visibility("hidden")));
-+extern int puts( char const* );
-+int main()
-+{
-+	if (f)
-+		f();
-+	return 0;
-+}
-+
-diff --git a/gcc/varasm.c b/gcc/varasm.c
-index 6648103..fadba78 100644
---- a/gcc/varasm.c
-+++ b/gcc/varasm.c
-@@ -6675,6 +6675,10 @@ default_binds_local_p_1 (const_tree exp, int shlib)
-   /* Static variables are always local.  */
-   else if (! TREE_PUBLIC (exp))
-     local_p = true;
-+  /* hidden weak can't be overridden by something non-local, all
-+     that is possible is that it is not defined at all. */
-+  else if (DECL_WEAK (exp))
-+    local_p = false;
-   /* A variable is local if the user has said explicitly that it will
-      be.  */
-   else if ((DECL_VISIBILITY_SPECIFIED (exp)
-@@ -6688,11 +6692,6 @@ default_binds_local_p_1 (const_tree exp, int shlib)
-      local.  */
-   else if (DECL_VISIBILITY (exp) != VISIBILITY_DEFAULT)
-     local_p = true;
--  /* Default visibility weak data can be overridden by a strong symbol
--     in another module and so are not local.  */
--  else if (DECL_WEAK (exp)
--	   && !resolved_locally)
--    local_p = false;
-   /* If PIC, then assume that any global name can be overridden by
-      symbols resolved from other modules.  */
-   else if (shlib)
--- 
-1.7.10.4
-
-- 
2.1.4


