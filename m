Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 134327820F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 22:45:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jul 2017 15:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,378,1496127600"; d="scan'208";a="1152851441"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 18 Jul 2017 15:45:03 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jul 2017 15:45:01 -0700
Message-Id: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Tue, 18 Jul 2017 22:45:02 -0000

Suppose we have an autotools project that looks like it is using the cross
compiler but is actually reaching out to the host compiler instead.
On an x86-64 build, you may not even notice.
To be able to prevent this, this patch implements a new gcc warning
"Wnot-cross-compiler". The intention here is to intentionally break a build
if we are not using a cross-compiler when one is expected to be used.

Expected usage: " -Wnot-cross-compiler -Werror=not-cross-compiler "

[YOCTO #11587]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/gcc/gcc-7.1.inc              |  1 +
 .../gcc/gcc-7.1/0051-warn-not-cross-compiler.patch | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/gcc/gcc-7.1.inc
index 3f1c06d..e9b1f21 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
@@ -75,6 +75,7 @@ SRC_URI = "\
            file://0048-gcc-Enable-static-PIE.patch \
            file://0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch \
            file://0050-replace-struct-ucontext-with-ucontext_t.patch \
+           file://0051-warn-not-cross-compiler.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch b/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
new file mode 100644
index 0000000..78671ed
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
@@ -0,0 +1,39 @@
+ 
+This patch implements an additional gcc command line option warning 
+"Wnot-cross-compiler". The option (if specified) will simply generate 
+a warning if gcc being used is not a cross-compiler. 
+
+Upstream-Status: Pending
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+
+diff --git a/gcc/common.opt b/gcc/common.opt
+--- a/gcc/common.opt
++++ b/gcc/common.opt
+@@ -801,6 +801,10 @@
+ Common Var(warn_vector_operation_performance) Warning
+ Warn when a vector operation is compiled outside the SIMD.
+ 
++Wnot-cross-compiler
++Common Warning
++Warn when not-cross-compiling.
++
+ Xassembler
+ Driver Separate
+ 
+diff --git a/gcc/opts.c b/gcc/opts.c
+--- a/gcc/opts.c
++++ b/gcc/opts.c
+@@ -2334,6 +2334,12 @@
+       opts->x_flag_ipa_icf_variables = value;
+       break;
+ 
++    case OPT_Wnot_cross_compiler:
++#ifndef CROSS_DIRECTORY_STRUCTURE
++      warning (OPT_Wnot_cross_compiler, "Not using cross-compiler!");
++#endif
++      break;
++
+     default:
+       /* If the flag was handled in a standard way, assume the lack of
+ 	 processing here is intentional.  */
-- 
2.7.4


