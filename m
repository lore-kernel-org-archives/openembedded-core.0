Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F55FCD8CA8
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 06:53:52 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148632.1781592822784172198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dDKcGUaA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781592824; x=1813128824;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A/EWg6h0OrRwphbsMADALQpKdQUvbm1+6RXijhe6olo=;
  b=dDKcGUaAVLhroBF9GN28E2RwZYLk75v0IOz9YW0MQ1bbFNr4x26iZCGO
   ddQ6HVe2LhKYpRseHECDyNLt+rlubQa1ptlvgMT8fM7MYah+y2zlPqc80
   WoVyTxHVHrHq8ZVK2ocHn7xCJsL/VMsTw8mjjc2QQ28DYHOcg4KH30VsM
   TMNIEoZNGyN9/8BEJxUj9F1bUPUH573whVopfoe31cS1hAcOc1xiIL+Oz
   zKX3b3zxfEw1Glltzy35kLQuBGeL1dElVPymU+CwgrN3QAiuAcCJqLNs8
   VmjZjkiLpb4N9cqoA+9AAoTaiLNs+rrllaa5K4f5fFXJPH7j5YS5A8km8
   w==;
X-CSE-ConnectionGUID: 2TuEcmPwTDCZFKKvEMLaZg==
X-CSE-MsgGUID: YcofYpF7SY6GRW2Z/0L7Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="244204751"
X-IronPort-AV: E=Sophos;i="6.24,207,1774278000"; 
   d="scan'208";a="244204751"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 15:53:42 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BF955C01818
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:53:40 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7A32D84F49F
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:53:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9C9FE14001FF;
	Tue, 16 Jun 2026 06:53:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] mesa: upgrade 26.0.6 -> 26.1.2
Date: Tue, 16 Jun 2026 14:53:34 +0800
Message-ID: <20260616065334.422-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238870

From: Wang Mingyu <wangmy@fujitsu.com>

Import community patch to fix typed enum compilation error in
src/intel/compiler/jay/jay_ir.h. GCC < 13 does not support the
": uint8_t" enum syntax used in the new version, and the fix
explicitly casts the struct member to uint8_t to avoid layout
mismatches.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...er-jay-jay_ir.h-do-not-used-typed-en.patch | 39 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  5 ++-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch

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
index 15dad6eedd..362be6c3cd 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,10 +18,11 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
            file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
+           file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch \
 "
 
-SRC_URI[sha256sum] = "1d3c3b8a8363b8cc354175bb4a684ad8b035211cc1d6fa17aeb9b9623c513f89"
-PV = "26.0.6"
+SRC_URI[sha256sum] = "bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf914edd85962babdf0"
+PV = "26.1.2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


