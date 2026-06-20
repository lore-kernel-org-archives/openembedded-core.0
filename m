Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DDECDB46D
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:14 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5947.1781960407711005878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s/58Wyfq;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4645995069bso1646901f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960406; x=1782565206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPYLYkkbF+NLwsjqN6s60MHet/iSnWA1+NGpSySf1Nc=;
        b=s/58WyfqmsRwpOY7M2Iit0kX0MgrgXHUb4WXDskI0P+tdf/VrfWF85XuNPQpRAjWrx
         uTGNNux2wrQi/90TXzkUA3ZNH+Z7lnakKs0LK2sU4CSyttqjieydqFFFhho8b/LzIKBg
         WWSx2/usHRQciOYkhKnIKaT44S2hGd9qNWYSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960406; x=1782565206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPYLYkkbF+NLwsjqN6s60MHet/iSnWA1+NGpSySf1Nc=;
        b=S5WQJTIqH4CoRV+ZJnsrFjQlmd9YphSv9oHtVMLIeZStTNRwg3kdDlO/quoGz1oU9M
         4TAB1AjHvF3TvKDG1O/kfe0rMVVEVyPx5ERSlCbR1sQ2GMly5v8uj5ZavPkiHr0qjGGO
         tb+YVTMpUv+OVkIN9rAqD6PvseIrI7/TfBTqlCbsKNYJLGd+gJvwGxw5jjDLSKfSq52m
         kUVw6lVH/KupNjMSYxZ26dc6EXiaFaQS/EL9tSChv08J2W9iG9EkPg8FnUQv5AzBi5wX
         XagaIIvTemzX4w1r8zYdjPd8MKNEi+MPxkZWHBqAUiu4IQxz5zW+qXRg9Bj++3wBUKZ2
         PZxw==
X-Gm-Message-State: AOJu0YySz1hEY2xcBnbjwOSF6csvx+Pe8ue/YA+QYwcvkMOgNJwCB/AB
	HzYCFNhkqoDldyPEAusZmN2Bz5A4tABs1QCgNiUvVHA/1Y3P+PUH+652qKl59kEh2C6XrMoHnty
	bjBwn
X-Gm-Gg: AfdE7ckJZYUFEMMTEXoz7jcryQn6SisHPYMWr7VbFeoyOEcsMEXGHiDO3s8Dj0u5yLo
	S2KJcdstMa2bQQiWzbg1uLQ691OZqAMQJY1bvg6iQDCPYkYfoTVqawrLgFbmoAhCTjJn4naBBwO
	8MvcUDBm8rf60SzVMjayCN4lSvuS61QB8KgO21l8tv5mkdsIExCy7RZ45YDWiAtym2h6iirGrN9
	Hf7HlAUX/mV0owawB1rNt7CkfHTSZCIc2M5KxeQRdJRUMLUDT3i1cuJVz0br47CyV3Ob7gdHq+d
	q+6K1fRJSPD1GrouLqE9agG8BCCu7lRkK8f1kfn5A2AQGXSw+fLnqkGAo1ZODLLYU6uSnA0At7h
	cMTfvaUNx9VBkUv9UOVdK9R74HKNbKTwTmnEGk0sk+nrnviA/qCiE/N5h86HVVsLt1jZ7TQdBAk
	KHSG8LdgxqsG/HLIuyNcpb4ewBKK8n2W8BPVuxW4sZ9GOt0NKN5ZP+u2gZmlv+Iznx5W0hQ/DLr
	Kj4nGFZ/9bvgwWP
X-Received: by 2002:a05:6000:310f:b0:43b:3e40:2223 with SMTP id ffacd0b85a97d-46500a02fc9mr13215096f8f.19.1781960405664;
        Sat, 20 Jun 2026 06:00:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/36] gcc: Upgrade GCC to 15.3 release
Date: Sat, 20 Jun 2026 14:59:16 +0200
Message-ID: <2dbf14030c8a5c97d67c4eaff22d3ddb97d73d77.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239211

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

- Added support for AVR32EB14/20/28/32, AVR16LA14/20/28/32, and
  AVR32LA14/20/28/32 devices
- Added IEEE double functions sincos and sincosl support

* Drop backports available in this release.

Release notes: https://gcc.gnu.org/gcc-15/changes.html
Docs: https://gcc.gnu.org/onlinedocs/15.3.0/
Bug fixes: https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=522382&resolution=FIXED&target_milestone=15.3

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../gcc/{gcc-15.2.inc => gcc-15.3.inc}        |  11 +-
 ...ian_15.2.bb => gcc-cross-canadian_15.3.bb} |   0
 .../{gcc-cross_15.2.bb => gcc-cross_15.3.bb}  |   0
 ...-crosssdk_15.2.bb => gcc-crosssdk_15.3.bb} |   0
 ...cc-runtime_15.2.bb => gcc-runtime_15.3.bb} |   0
 ...itizers_15.2.bb => gcc-sanitizers_15.3.bb} |   0
 ...{gcc-source_15.2.bb => gcc-source_15.3.bb} |   0
 .../gcc/gcc/0026-fix-pr90579-testcases.patch  |  40 ---
 .../gcc/gcc/0027-gcc15-pr122394.patch         |  88 ------
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 ------------------
 .../gcc/{gcc_15.2.bb => gcc_15.3.bb}          |   0
 ...initial_15.2.bb => libgcc-initial_15.3.bb} |   0
 .../gcc/{libgcc_15.2.bb => libgcc_15.3.bb}    |   0
 ...ibgfortran_15.2.bb => libgfortran_15.3.bb} |   0
 15 files changed, 5 insertions(+), 393 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-15.3.inc} (92%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_15.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_15.3.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 07e840ac34d..99242af484a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -200,7 +200,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-15.2.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-15.3.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcompat = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-15.3.inc
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-15.2.inc
rename to meta/recipes-devtools/gcc/gcc-15.3.inc
index a96f2b84111..2f743510850 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.3.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "15.2.0"
+PV = "15.3.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "15.2.0"
+BINV = "15.3.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -44,7 +44,7 @@ LIC_FILES_CHKSUM = "\
 RELEASE ?= "${PV}"
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SOURCEDIR ?= "gcc-${PV}"
-SRC_URI[sha256sum] = "438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e"
+SRC_URI[sha256sum] = "fa59c1beef8995f27c4d71c1df227587189315d3e6faff1bb4306e61b0c530eb"
 
 SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -71,12 +71,9 @@ SRC_URI = "${BASEURI} \
            file://0022-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
-           file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-           file://0026-fix-pr90579-testcases.patch \
-           file://0027-gcc15-pr122394.patch \
            file://0028-fix-gcc-libitm-false-postives-01.patch \
            file://0028-fix-gcc-libitm-false-postives-02.patch \
-           file://0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
+	    file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_15.2.bb b/meta/recipes-devtools/gcc/gcc-source_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
deleted file mode 100644
index 6ada61b74ff..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 679e24f5a751663998ff7202149a749e0f7251f9 Mon Sep 17 00:00:00 2001
-From: Harish Sadineni <Harish.Sadineni@windriver.com>
-Date: Sun, 10 Aug 2025 20:28:00 +0800
-Subject: [PATCH] testsuite: i386: Fix gcc.target/i386/pr90579.c when PIE is
- enabled [PR118885]
-
-When gcc build with --enable-deafult-pie the following tests
-were getting failed:
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+40
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+32
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+24
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+16
-
-    PR target/118885
-
-gcc/testsuite/ChangeLog:
-
-    * gcc.target/i386/pr90579.c: add -fno-pie to dg-options
-    to fix tests when PIE is enabled.
-
-Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=679e24f5a751663998ff7202149a749e0f7251f9]
-
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- gcc/testsuite/gcc.target/i386/pr90579.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gcc/testsuite/gcc.target/i386/pr90579.c b/gcc/testsuite/gcc.target/i386/pr90579.c
-index ab48a44063c..19081ec9fdf 100644
---- a/gcc/testsuite/gcc.target/i386/pr90579.c
-+++ b/gcc/testsuite/gcc.target/i386/pr90579.c
-@@ -1,5 +1,5 @@
- /* { dg-do compile } */
--/* { dg-options "-O3 -mavx2 -mfpmath=sse" } */
-+/* { dg-options "-O3 -mavx2 -mfpmath=sse -fno-pie" } */
- 
- extern double r[6];
- extern double a[];
--- 
-2.49.0
diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch b/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
deleted file mode 100644
index 9ee371cef75..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From e55dcff97708a4937dc4d8736b8b3074ebbff6f3 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Mon, 27 Oct 2025 17:43:17 +0100
-Subject: phiopt: Fix up DEBUG_EXPR_DECL creation in spaceship_replacement
- [PR122394]
-
-The following testcase ICEs in gcc 15 (and is at least latent in 12-14 too),
-because the DEBUG_EXPR_DECL has incorrect mode.  It has
-TREE_TYPE (orig_use_lhs) type, but TYPE_MODE (type) rather than
-TYPE_MODE (TREE_TYPE (orig_use_lhs)) where the two types are sometimes
-the same, but sometimes different (same if !has_cast_debug_uses, different
-otherwise).
-
-Though, there wouldn't be the this issue if it used the proper API to create
-the DEBUG_EXPR_DECL which takes care of everything.  This is the sole
-spot that doesn't use that API.
-
-Doesn't affect the trunk because the code has been removed and replaced with
-different stuff after the libstdc++ ABI change in r16-3474.
-Before r15-5557 the mode has been always wrong because this was done only
-for has_cast_debug_uses.  And the bug has been introduced with r12-5490.
-
-Enough archeology, while it could be fixed by changing the second
-SET_DECL_MODE argument, I think it is better to use build_debug_expr_decl.
-
-2025-10-27  Jakub Jelinek  <jakub@redhat.com>
-
-	PR tree-optimization/122394
-	* tree-ssa-phiopt.cc (spaceship_replacement): Use
-	build_debug_expr_decl instead of manually building DEBUG_EXPR_DECL
-	and getting SET_DECL_MODE wrong.
-
-	* g++.dg/opt/pr122394.C: New test.
-
-Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=e55dcff97708a4937dc4d8736b8b3074ebbff6f3]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gcc/testsuite/g++.dg/opt/pr122394.C | 20 ++++++++++++++++++++
- gcc/tree-ssa-phiopt.cc              |  6 ++----
- 2 files changed, 22 insertions(+), 4 deletions(-)
- create mode 100644 gcc/testsuite/g++.dg/opt/pr122394.C
-
-diff --git a/gcc/testsuite/g++.dg/opt/pr122394.C b/gcc/testsuite/g++.dg/opt/pr122394.C
-new file mode 100644
-index 000000000000..1f84bebd74c2
---- /dev/null
-+++ b/gcc/testsuite/g++.dg/opt/pr122394.C
-@@ -0,0 +1,20 @@
-+// PR tree-optimization/122394
-+// { dg-do compile { target c++23 } }
-+// { dg-options "-O1 -g" }
-+
-+#include <compare>
-+
-+struct A {
-+  friend auto operator<=> (A, A) = default;
-+  double a;
-+};
-+void foo ();
-+A b, c;
-+
-+void
-+bar ()
-+{
-+  bool d = c >= b;
-+  if (d)
-+    foo ();
-+}
-diff --git a/gcc/tree-ssa-phiopt.cc b/gcc/tree-ssa-phiopt.cc
-index aaebae6b38c0..3e0ad9d3bb09 100644
---- a/gcc/tree-ssa-phiopt.cc
-+++ b/gcc/tree-ssa-phiopt.cc
-@@ -2995,10 +2995,8 @@ spaceship_replacement (basic_block cond_bb, basic_block middle_bb,
- 	      if (has_cast_debug_uses
- 		  || (HONOR_NANS (TREE_TYPE (lhs1)) && !is_cast))
- 		{
--		  tree temp3 = make_node (DEBUG_EXPR_DECL);
--		  DECL_ARTIFICIAL (temp3) = 1;
--		  TREE_TYPE (temp3) = TREE_TYPE (orig_use_lhs);
--		  SET_DECL_MODE (temp3, TYPE_MODE (type));
-+		  tree temp3
-+		    = build_debug_expr_decl (TREE_TYPE (orig_use_lhs));
- 		  if (has_cast_debug_uses)
- 		    t = fold_convert (TREE_TYPE (temp3), temp2);
- 		  else
--- 
-cgit 
-
diff --git a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
deleted file mode 100644
index 431facb0110..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 0ffe3c9af4e5d5468df742512b6e930fe7039230 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Fri, 21 Nov 2025 16:25:58 +0100
-Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
-
-The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
-and c++26.
-
-I see the u8 string literals are mixed e.g. with strerror, so in
--fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
-the u8 literals everywhere are worth it either.
-
-2025-11-21  Jakub Jelinek  <jakub@redhat.com>
-
-	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
-	char in argument type.
-	(MessageBuffer::Space): Revert 2025-11-15 change.
-	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
-	with char8_t const * type of first argument.
-	(Packet::Packet): Similarly for first argument.
-	* client.cc (CommunicationError, Client::ProcessResponse,
-	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
-	IncludeTranslateResponse): Cast u8 string literals to (const char *)
-	where needed.
-	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7]
----
- libcody/client.cc | 36 +++++++++++++++++++-----------------
- libcody/cody.hh   | 22 ++++++++++++++++++++++
- libcody/server.cc | 28 ++++++++++++++--------------
- 3 files changed, 55 insertions(+), 31 deletions(-)
-
-diff --git a/libcody/client.cc b/libcody/client.cc
-index ae69d190cb77..147fecdbe500 100644
---- a/libcody/client.cc
-+++ b/libcody/client.cc
-@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
- 
- static Packet CommunicationError (int err)
- {
--  std::string e {u8"communication error:"};
-+  std::string e {(const char *) u8"communication error:"};
-   e.append (strerror (err));
- 
-   return Packet (Client::PC_ERROR, std::move (e));
-@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
-     {
-       if (e == EINVAL)
- 	{
--	  std::string msg (u8"malformed string '");
-+	  std::string msg ((const char *) u8"malformed string '");
- 	  msg.append (words[0]);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  return Packet (Client::PC_ERROR, std::move (msg));
- 	}
-       else
--	return Packet (Client::PC_ERROR, u8"missing response");
-+	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
-     }
- 
-   Assert (!words.empty ());
--  if (words[0] == u8"ERROR")
-+  if (words[0] == (const char *) u8"ERROR")
-     return Packet (Client::PC_ERROR,
--		   words.size () == 2 ? words[1]: u8"malformed error response");
-+		   words.size () == 2 ? words[1]
-+		   : (const char *) u8"malformed error response");
- 
-   if (isLast && !read.IsAtEnd ())
-     return Packet (Client::PC_ERROR,
--		   std::string (u8"unexpected extra response"));
-+		   std::string ((const char *) u8"unexpected extra response"));
- 
-   Assert (code < Detail::RC_HWM);
-   Packet result (responseTable[code] (words));
-   result.SetRequest (code);
-   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
-     {
--      std::string msg {u8"malformed response '"};
-+      std::string msg {(const char *) u8"malformed response '"};
- 
-       read.LexedLine (msg);
--      msg.append (u8"'");
-+      msg.append ((const char *) u8"'");
-       result.GetString () = std::move (msg);
-     }
-   else if (result.GetCode () == Client::PC_CONNECT)
-@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
- 			  size_t alen, size_t ilen)
- {
-   write.BeginLine ();
--  write.AppendWord (u8"HELLO");
-+  write.AppendWord ((const char *) u8"HELLO");
-   write.AppendInteger (Version);
-   write.AppendWord (agent, true, alen);
-   write.AppendWord (ident, true, ilen);
-@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
- // HELLO $version $agent [$flags]
- Packet ConnectResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
-+  if (words[0] == (const char *) u8"HELLO"
-+      && (words.size () == 3 || words.size () == 4))
-     {
-       char *eptr;
-       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
-@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
- // PATHNAME $dir | ERROR
- Packet PathnameResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"PATHNAME" && words.size () == 2)
-+  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
-     return Packet (Client::PC_PATHNAME, std::move (words[1]));
- 
-   return Packet (Client::PC_ERROR, u8"");
-@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
- // OK or ERROR
- Packet OKResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"OK")
-+  if (words[0] == (const char *) u8"OK")
-     return Packet (Client::PC_OK);
-   else
-     return Packet (Client::PC_ERROR,
-@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
- // PATHNAME $cmifile
- Packet IncludeTranslateResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"BOOL" && words.size () == 2)
-+  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
-     {
--      if (words[1] == u8"FALSE")
--	return Packet (Client::PC_BOOL, 0);
--      else if (words[1] == u8"TRUE")
-+      if (words[1] == (const char *) u8"FALSE")
-+	return Packet (Client::PC_BOOL);
-+      else if (words[1] == (const char *) u8"TRUE")
- 	return Packet (Client::PC_BOOL, 1);
-       else
- 	return Packet (Client::PC_ERROR, u8"");
-diff --git a/libcody/cody.hh b/libcody/cody.hh
-index 789ce9e70b75..93bce93aa94d 100644
---- a/libcody/cody.hh
-+++ b/libcody/cody.hh
-@@ -47,12 +47,21 @@ namespace Detail  {
- 
- // C++11 doesn't have utf8 character literals :(
- 
-+#if __cpp_char8_t >= 201811
-+template<unsigned I>
-+constexpr char S2C (char8_t const (&s)[I])
-+{
-+  static_assert (I == 2, "only single octet strings may be converted");
-+  return s[0];
-+}
-+#else
- template<unsigned I>
- constexpr char S2C (char const (&s)[I])
- {
-   static_assert (I == 2, "only single octet strings may be converted");
-   return s[0];
- }
-+#endif
- 
- /// Internal buffering class.  Used to concatenate outgoing messages
- /// and Lex incoming ones.
-@@ -123,6 +132,13 @@ public:
-       Space ();
-     Append (str, maybe_quote, len);
-   }
-+#if __cpp_char8_t >= 201811
-+  void AppendWord (char8_t const *str, bool maybe_quote = false,
-+		   size_t len = ~size_t (0))
-+  {
-+    AppendWord ((const char *) str, maybe_quote, len);
-+  }
-+#endif
-   /// Add a word as with AppendWord
-   /// @param str the string to append
-   /// @param maybe_quote string might need quoting, as for Append
-@@ -264,6 +280,12 @@ public:
-     : string (s), cat (STRING), code (c)
-   {
-   }
-+#if __cpp_char8_t >= 201811
-+  Packet (unsigned c, const char8_t *s)
-+    : string ((const char *) s), cat (STRING), code (c)
-+  {
-+  }
-+#endif
-   Packet (unsigned c, std::vector<std::string> &&v)
-     : vector (std::move (v)), cat (VECTOR), code (c)
-   {
-diff --git a/libcody/server.cc b/libcody/server.cc
-index e2fa069bb933..c18469fae843 100644
---- a/libcody/server.cc
-+++ b/libcody/server.cc
-@@ -36,12 +36,12 @@ static RequestPair
-   const requestTable[Detail::RC_HWM] =
-   {
-     // Same order as enum RequestCode
--    RequestPair {u8"HELLO", nullptr},
--    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
--    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
--    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
--    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
--    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-+    RequestPair {(const char *) u8"HELLO", nullptr},
-+    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
-+    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
-+    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
-+    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
-+    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-   };
- }
- 
-@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
- 	  std::string msg;
- 
- 	  if (err > 0)
--	    msg = u8"error processing '";
-+	    msg = (const char *) u8"error processing '";
- 	  else if (ix >= Detail::RC_HWM)
--	    msg = u8"unrecognized '";
-+	    msg = (const char *) u8"unrecognized '";
- 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
--	    msg = u8"already connected '";
-+	    msg = (const char *) u8"already connected '";
- 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
--	    msg = u8"not connected '";
-+	    msg = (const char *) u8"not connected '";
- 	  else
--	    msg = u8"malformed '";
-+	    msg = (const char *) u8"malformed '";
- 
- 	  read.LexedLine (msg);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  if (err > 0)
- 	    {
--	      msg.append (u8" ");
-+	      msg.append ((const char *) u8" ");
- 	      msg.append (strerror (err));
- 	    }
- 	  resolver->ErrorResponse (this, std::move (msg));
-@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
-     return nullptr;
- 
-   if (words.size () == 3)
--    words.emplace_back (u8"");
-+    words.emplace_back ((const char *) u8"");
-   unsigned version = ParseUnsigned (words[1]);
-   if (version == ~0u)
-     return nullptr;
diff --git a/meta/recipes-devtools/gcc/gcc_15.2.bb b/meta/recipes-devtools/gcc/gcc_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_15.2.bb
rename to meta/recipes-devtools/gcc/gcc_15.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_15.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_15.2.bb b/meta/recipes-devtools/gcc/libgcc_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc_15.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_15.2.bb b/meta/recipes-devtools/gcc/libgfortran_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_15.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_15.3.bb

