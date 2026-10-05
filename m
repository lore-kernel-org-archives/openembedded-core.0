Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB4FCA5FF5
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 20:31:27 +0000 (UTC)
Received: from imap6.mcr3.codethink.co.uk (imap6.mcr3.codethink.co.uk [46.37.160.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27628.1791226768439996673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 11:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codethink.co.uk header.s=imap6-20260915 header.b=htiRDojH;
 spf=pass (domain: codethink.co.uk, ip: 46.37.160.117, mailfrom: marcel.ziswiler@codethink.co.uk)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap6-20260915; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To; bh=U5hWD0ilAtC5RomBOKxO3WcG70DAvIeo1mgplyL8Dak=; b=htiRDojHB6vnOaNG
	k0uWojUci6MfrM7ISKZvWJgplv/j5vlX1qeme89WaGmrzCzb2lULOLlTXl55BfDkwjZRq/X5aqDbM
	0xHRdL2zvTZtsMLlUv6FmE4p0+zGSG31012oaYLxSpZQOXBHG/ce40xfBV5I+aLtrX6qv+GIXbc0I
	WjT2uRH0cAQbhYTy4JoNSBEabhqLSCKrWOM7ksZEPIOpPpPfzCOgBwXTGY1rUnpjelDxQcWQPD6ky
	R+PCiCcbe4S/D1zvjWJddMfxeGuIWHdIVi3TSl11UqahLJeuG36IPbXiFpsIW+hcp3OwyQCHyAroY
	xz+2vfspbt0yiweJnQ==;
Received: from [10.17.2.146] (helo=toolbx.v.cablecom.net)
	by imap6.mcr3.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1xDnYJ-00Fdbr-GT; Mon, 05 Oct 2026 19:36:43 +0100
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Subject: [PATCH 2/2] mesa: gallivm llvm 23 build fix
Date: Mon,  5 Oct 2026 20:36:27 +0200
Message-ID: <ce4db820d61fa4ff24b1320bdad694c2720b84f4.1791224526.git.marcel.ziswiler@codethink.co.uk>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1791224526.git.marcel.ziswiler@codethink.co.uk>
References: <cover.1791224526.git.marcel.ziswiler@codethink.co.uk>
MIME-Version: 1.0
Sender: marcel.ziswiler@codethink.co.uk
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 20:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247261

More information at

https://gitlab.freedesktop.org/mesa/mesa/-/work_items/16325

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
---
 ...gallivm-adapt-for-JITLink-in-LLVM-23.patch | 51 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
new file mode 100644
index 000000000000..756b68a898e3
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch
@@ -0,0 +1,51 @@
+From cda383625f5d1fd06657fb998b7d1370a7fabd8f Mon Sep 17 00:00:00 2001
+Message-ID: <cda383625f5d1fd06657fb998b7d1370a7fabd8f.1791114851.git.marcel@ziswiler.com>
+From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
+Date: Wed, 30 Sep 2026 14:10:14 +0800
+Subject: [PATCH] gallivm: adapt for JITLink in LLVM 23
+
+In LLVM 23, the ObjectLinkingLayerCreator callback now takes an
+additional memory manager argument.
+
+Adapt for this API change.
+
+This argument eliminates the need to create a InProcessMemoryManager
+by ourselves so a dedicated implementation is added.
+
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/work_items/16325
+Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/work_items/16325]
+---
+ src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
+index 09d56e543ee..bc9d7837ecd 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
+@@ -346,6 +346,13 @@ LPJit::LPJit() :jit_dylib_count(0) {
+          .setJITTargetMachineBuilder(std::move(JTMB))
+ #ifdef USE_JITLINK
+          .setObjectLinkingLayerCreator(
++#if LLVM_VERSION_MAJOR >= 23
++            /* LLVM 23 added a JITLinkMemoryManager argument, use it as our
++             * JITLinkMemoryManager. */
++            [&](ExecutionSession &ES, llvm::jitlink::JITLinkMemoryManager &MM) {
++               return std::make_unique<ObjectLinkingLayer>(ES, MM);
++            })
++#else
+ #if LLVM_VERSION_MAJOR >= 21
+             /* LLVM 21 removed the Triple argument */
+             [&](ExecutionSession &ES) {
+@@ -355,6 +362,7 @@ LPJit::LPJit() :jit_dylib_count(0) {
+                return std::make_unique<ObjectLinkingLayer>(
+                   ES, ExitOnErr(llvm::jitlink::InProcessMemoryManager::Create()));
+             })
++#endif
+ #else
+ #if LLVM_USE_INTEL_JITEVENTS
+          .RegisterJITEventListener(
+-- 
+2.52.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b0ae5016de1a..da71a0bdb0d4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,6 +20,7 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
            file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch \
+           file://0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch \
            "
 
 SRC_URI[sha256sum] = "bce5f7fbebb934373b86c999a064d52fb5065878dc57f287f95346648ec832e9"
-- 
2.53.0


