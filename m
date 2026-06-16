Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097C0CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 10:17:47 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150839.1781605056675568525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 03:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O0v1GCSv;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781605057; x=1813141057;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4rxsEjFNgoYIXRxZtHPG+jQ8AVsyDqyOUvLd9T6jUIM=;
  b=O0v1GCSv9Um8W6zI+35nzLwzXk8o0v0ceJoHGGY24+czJKLoCt/6LeHh
   ++hMRj6yCUxk5L/y52WBdhr+DTsWqREcvSmxN6bZzsZhnP2alrH7M/5RA
   qaYnEZwynf7+3eQTHjDEE014xEO03O1gkGbNmPvrzUHZ4F1Kf2B7F8dkc
   37dyHhUOGptiBp4QSTw+OZZ/Ex0JOL0J0yi1qfjlpjknFO+pEGqlFoz0Z
   YeLy6bLrq4PUsykB0g865wJqgRt6Msvcdlkr6U3nXkYhRyxsL+if52ow2
   1be1Ii69SeGQZK+yLmsBDpRfPURF8vvoJvLcwFJp2eWK/8qA0pd1TYuMC
   Q==;
X-CSE-ConnectionGUID: hmPdthNtQ6+M85NNZbbkfg==
X-CSE-MsgGUID: OpKOp8JJRKSdcO5qJsCygg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="230445486"
X-IronPort-AV: E=Sophos;i="6.24,208,1774278000"; 
   d="scan'208";a="230445486"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 19:17:32 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7E1435C39
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 10:17:32 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 321721032BA5
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 10:17:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 458FF1800A50;
	Tue, 16 Jun 2026 10:17:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v3] [PATCH] mesa: upgrade 26.0.6 -> 26.1.2,26.0.6 -> 26.1.2
Date: Tue, 16 Jun 2026 18:17:24 +0800
Message-ID: <20260616101724.462-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 10:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238885

From: Wang Mingyu <wangmy@fujitsu.com>

add patches to fix compilation with GCC < 13

Add two patches to fix build failures when using older GCC:
- Fix typed enum syntax not supported by GCC 11.
- Fix variable declaration after case label not allowed by GCC 10.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...er-jay-fix-GCC-10-case-label-declara.patch | 42 +++++++++++++++++++
 ...er-jay-jay_ir.h-do-not-used-typed-en.patch | 39 +++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  6 ++-
 3 files changed, 85 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
new file mode 100644
index 0000000000..b8b8718979
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
@@ -0,0 +1,42 @@
+From 0b4b577b7fc926d374234c80267a4bf9dcccb7ef Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Tue, 16 Jun 2026 09:12:34 +0000
+Subject: [PATCH] src/intel/compiler/jay: fix GCC 10 case label declaration
+ error
+
+GCC 10 (and earlier) does not allow a variable declaration immediately
+after a case label, because a label must be followed by a statement.
+
+  error: a label can only be part of a statement and a declaration is not a statement
+
+Wrap the case block for JAY_OPCODE_DESWIZZLE_ODD in braces to make the
+declaration a valid statement inside the block.
+
+Upstream-Status: Inappropriate [yocto host distro requirements]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ src/intel/compiler/jay/jay_to_binary.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/intel/compiler/jay/jay_to_binary.c b/src/intel/compiler/jay/jay_to_binary.c
+index 62b9576..a0a9498 100644
+--- a/src/intel/compiler/jay/jay_to_binary.c
++++ b/src/intel/compiler/jay/jay_to_binary.c
+@@ -362,11 +362,12 @@ emit(struct brw_codegen *p,
+       brw_BFN(p, dst, SRC(0), SRC(1), SRC(2), brw_imm_ud(jay_bfn_ctrl(I)));
+       break;
+ 
+-   case JAY_OPCODE_DESWIZZLE_ODD:
++   case JAY_OPCODE_DESWIZZLE_ODD: {
+       bool hi = simd_offs ? true : jay_deswizzle_odd_src2_hi(I);
+       brw_MOV(p, dst,
+               byte_offset(to_brw_reg(f, I, simd_offs, 0, false), hi ? 64 : 0));
+       break;
++   }
+ 
+    case JAY_OPCODE_DESWIZZLE_EVEN:
+       brw_set_default_exec_size(p, BRW_EXECUTE_16);
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
new file mode 100644
index 0000000000..904b20d440
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -0,0 +1,39 @@
+From 3adae0d97f655c2991d5b428a3bc95a972e6228b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 14 Jun 2026 17:42:19 +0200
+Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
+
+This is a C23 feature and not supported by gcc < 13, which
+many host distros still have (e.g. Debian 12).
+
+Upstream-Status: Inappropriate [yocto host distro requirements]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/intel/compiler/jay/jay_ir.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/intel/compiler/jay/jay_ir.h b/src/intel/compiler/jay/jay_ir.h
+index 8307044..abf175a 100644
+--- a/src/intel/compiler/jay/jay_ir.h
++++ b/src/intel/compiler/jay/jay_ir.h
+@@ -579,7 +579,7 @@ jay_type_is_any_float(enum jay_type t)
+    return jay_base_type(t) == JAY_TYPE_F || jay_base_type(t) == JAY_TYPE_BF;
+ }
+ 
+-enum jay_predication : uint8_t {
++enum jay_predication {
+    /** No predication. */
+    JAY_NOT_PREDICATED = 0,
+ 
+@@ -634,7 +634,7 @@ typedef struct jay_inst {
+    bool decrement_dep:1;
+    unsigned padding  :12;
+ 
+-   enum jay_predication predication;
++   uint8_t predication;
+    enum jay_conditional_mod conditional_mod;
+ 
+    jay_def cond_flag; /**< conditional flag */
+-- 
+2.47.3
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 15dad6eedd..67b740f9e9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,10 +18,12 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
            file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
+           file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch \
+           file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch \
 "
 
-SRC_URI[sha256sum] = "1d3c3b8a8363b8cc354175bb4a684ad8b035211cc1d6fa17aeb9b9623c513f89"
-PV = "26.0.6"
+SRC_URI[sha256sum] = "bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf914edd85962babdf0"
+PV = "26.1.2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


