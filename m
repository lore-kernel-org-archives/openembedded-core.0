Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D873672DC4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:21:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2016 00:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="974144655"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2016 00:20:57 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:20:33 +0300
Message-Id: <2bbac4509dbdc9102073ac44cec6b7d35f446f60.1463035854.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
References: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
Subject: [PATCH 10/13] pixman: Upgrade 0.32.8 -> 0.34.0
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
X-List-Received-Date: Thu, 12 May 2016 07:21:05 -0000

Remove two patches that are no longer needed.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch | 65 ----------------------
 .../xorg-lib/pixman/mips-export-revert.patch       | 22 --------
 .../{pixman_0.32.8.bb => pixman_0.34.0.bb}         |  6 +-
 3 files changed, 2 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.8.bb => pixman_0.34.0.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
deleted file mode 100644
index 6b7c1e6..0000000
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From fcd5eb9bd0e8674a6f4987a8fce7dc1ba8f9320c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 17 Sep 2015 03:08:36 +0200
-Subject: [PATCH] [v3] test: add a check for FE_DIVBYZERO
-
-Some architectures, such as Microblaze and Nios2, currently do not
-implement FE_DIVBYZERO, even though they have <fenv.h> and
-feenableexcept(). This commit adds a configure.ac check to verify
-whether FE_DIVBYZERO is defined or not, and if not, disables the
-problematic code in test/utils.c.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Backport [commit 4297e9058]
----
-Changes v1 -> v2:
-
- * Use the ac_cv_have_decl_FE_DIVBYZERO variable, which is
-   automatically set by AC_CHECK_DECL, to decide whether or not
-   HAVE_FEDIVBYZERO should be defined.
-
-Changes v2 -> v3:
-
- * Use action-if-yes of AC_CHECK_DECL as suggested in
-   http://lists.freedesktop.org/archives/pixman/2014-February/003176.html
----
- configure.ac | 5 +++++
- test/utils.c | 2 ++
- 2 files changed, 7 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index f93cc30..424bfd3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -891,6 +891,11 @@ if test x$have_feenableexcept = xyes; then
-    AC_DEFINE(HAVE_FEENABLEEXCEPT, 1, [Whether we have feenableexcept()])
- fi
- 
-+AC_CHECK_DECL([FE_DIVBYZERO],
-+	[AC_DEFINE(HAVE_FEDIVBYZERO, 1, [Whether we have FE_DIVBYZERO])],
-+	[],
-+	[[#include <fenv.h>]])
-+
- AC_CHECK_FUNC(gettimeofday, have_gettimeofday=yes, have_gettimeofday=no)
- AC_CHECK_HEADER(sys/time.h, have_sys_time_h=yes, have_sys_time_h=no)
- if test x$have_gettimeofday = xyes && test x$have_sys_time_h = xyes; then
-diff --git a/test/utils.c b/test/utils.c
-index 222d4d5..8657966 100644
---- a/test/utils.c
-+++ b/test/utils.c
-@@ -966,9 +966,11 @@ enable_divbyzero_exceptions (void)
- {
- #ifdef HAVE_FENV_H
- #ifdef HAVE_FEENABLEEXCEPT
-+#ifdef HAVE_FEDIVBYZERO
-     feenableexcept (FE_DIVBYZERO);
-+#endif
- #endif
- #endif
- }
- 
- void
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch b/meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
deleted file mode 100644
index 14a5fd2..0000000
--- a/meta/recipes-graphics/xorg-lib/pixman/mips-export-revert.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Revert a commit in pixman 0.32.6 which breaks compliation on MIPS machines with
-errors such as:
-
-pixman-0.32.6/pixman/pixman-mips-dspr2-asm.S:4267:
-Error: invalid operands `mflo $14,$ac3'
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
---- b/pixman/pixman-mips-dspr2-asm.h
-+++ a/pixman/pixman-mips-dspr2-asm.h
-@@ -72,10 +72,7 @@
- #define LEAF_MIPS32R2(symbol)                           \
-                 .globl  symbol;                         \
-                 .align  2;                              \
--#ifdef __ELF__
--                .hidden symbol;                         \
-                 .type   symbol, @function;              \
--#endif
-                 .ent    symbol, 0;                      \
- symbol:         .frame  sp, 0, ra;                      \
-                 .set    push;                           \
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb b/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
index 553ce36..87da5c2 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
@@ -31,12 +31,10 @@ EXTRA_OECONF_class-nativesdk = "--disable-gtk"
 
 SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
-            file://mips-export-revert.patch \
 	    file://asm_include.patch \
-	    file://0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch \
 "
 
-SRC_URI[md5sum] = "18d6b62abdb7bc0f8e6b0ddf48986b2c"
-SRC_URI[sha256sum] = "5c63dbb3523fc4d86ed4186677815918a941b7cb390d5eec4f55cb5d66b59fb1"
+SRC_URI[md5sum] = "002a4fcb644ddfcb4b0e4191576a0d59"
+SRC_URI[sha256sum] = "39ba3438f3d17c464b0cb8be006dacbca0ab5aee97ebde69fec7ecdbf85794a0"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
2.1.4


