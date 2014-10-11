Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4007065DA3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 06:46:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 10 Oct 2014 23:36:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="398619916"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.71])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2014 23:39:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Oct 2014 23:46:16 -0700
Message-Id: <1413009976-2176-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] gcc: backport patch for gcc bug 61144
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
X-List-Received-Date: Sat, 11 Oct 2014 06:46:18 -0000

This fixes gcc bug 6144, which in my case exhibited itself as a kernel
module that failed to load. This was because static platform_data
structures were being corrupted with the optimiser being set to any
value other than -O0.

Originally-submitted-by: Peter Urbanec <openembedded-devel@urbanec.net>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
This was tested via a Full MUT Build on the AB with no noticable side-effects, this should
be conidered for 1.7 rc4 which which will be built over the weekend.

Sau!

 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 .../0056-top-level-reorder_gcc-bug-61144.patch     | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61144.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 25778bd..9a66cd2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -70,6 +70,7 @@ SRC_URI = "\
     file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
     file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
     file://0055-PR-rtl-optimization-61801.patch \
+    file://0056-top-level-reorder_gcc-bug-61144.patch \
 "
 SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
 SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61144.patch b/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61144.patch
new file mode 100644
index 0000000..f448932
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61144.patch
@@ -0,0 +1,31 @@
+
+Upstream-Status: Backport
+
+Originally-submitted-by: Peter Urbanec <openembedded-devel@urbanec.net>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+--- /dev/null
++++ b/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61144.patch
+@@ -0,0 +1,21 @@
++--- a/gcc/varpool.c    2014/10/05 02:50:01     215895
+++++ b/gcc/varpool.c    2014/10/05 04:52:19     215896
++@@ -329,8 +329,16 @@
++
++   /* Variables declared 'const' without an initializer
++      have zero as the initializer if they may not be
++-     overridden at link or run time.  */
++-  if (!DECL_INITIAL (real_decl)
+++     overridden at link or run time.
+++
+++     It is actually requirement for C++ compiler to optimize const variables
+++     consistently. As a GNU extension, do not enfore this rule for user defined
+++     weak variables, so we support interposition on:
+++     static const int dummy = 0;
+++     extern const int foo __attribute__((__weak__, __alias__("dummy")));
+++   */
+++  if ((!DECL_INITIAL (real_decl)
+++       || (DECL_WEAK (decl) && !DECL_COMDAT (decl)))
++       && (DECL_EXTERNAL (decl) || decl_replaceable_p (decl)))
++     return error_mark_node;
++ 
+
-- 
1.8.3.1


