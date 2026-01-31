Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CA0D7975A
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5101.1769846219368142794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kYeykjEa;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so37243345e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846217; x=1770451017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBz8AmmkyEv4VEBCAQD+5lOrHG+lLejeiYnfrTRlDwg=;
        b=kYeykjEabXmntEWwYvQV8N/maEkDWjlYyx4rg2l81avZlJWWWxbBiWHoBy3KQ2eVGY
         zHD82PhnEJEim+JxaFZplwVuBwzCuWuiQ1OCJWeHEx+1lxMv0g66TjIar0Canu885pEW
         3+untiYXB/Qdiy+SwwMiw7kBWtxDi+nyYJVSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846217; x=1770451017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rBz8AmmkyEv4VEBCAQD+5lOrHG+lLejeiYnfrTRlDwg=;
        b=f0dcPttizNiPwyazqwaKGZc9SoFMm7B8MAOgIsxAptYudaIuCd1zlLGzODNO6Dyu/U
         SUX+CiYzDrRvfm5AbipzMocBtMuSg0G6XofGJM+/uD4z73zCzdEnz+Gq+Ax9cZQ9bc1x
         GxEyxCmOyC0A9/pWhfWPxF+NRBYvqF/EzhJqT//QrqELsHL4x7VWcXvWtRctRqDTGNDU
         rAhcoxsS1Fi4dE6KolAG016QjCXm4cINRLuYcvwiYMK4J6KClhs4nqCL04NhAF3onuXG
         GC4qAZwNGewKi/ebdy0vO+YHYg5QSuCAwV/WriGEPVlteq9phkZwP/cfxiAQ2Di1+t+s
         d5/A==
X-Gm-Message-State: AOJu0Yz05zHDkJxz3NmK9Qzmlhf+GQIu0+Yn5UgFfFTf7/kHUWkId1fF
	9ggnLDwlW8s27gKgNdlJxxUATvM0XG6goRLSzlJ355DX8wPVNcwceRIW9y2dXaFptjDF4zsbiRW
	bKM5FRL4=
X-Gm-Gg: AZuq6aJzKJqIfz3o/Bjd3syeRhf54EKO05vdO7YNCiza0AWcSgWErmrT2gY7SAL1X/2
	3a5x6I/zX3+vJsQNyffylLz8UaWG47ud7kwZ4dEO6wA57/yh7EVskLcr5vvR/eeSUgoI8ujxsNe
	XVSHYjzJFq1PmDQe/b6yEgXt7dHWVlohrQAJX+p+BVgnwMUj0AOlqmG35H93kXTu4kvBaMWVMji
	TAW4KzTZHI0/N6kdyFZRzAyh46rsY9Cl+3FWGJYQU2xHmNfiqVh0pDe0ZTvJqJKH0tnAw2P8hgt
	Sl1zLbWP3qXi2d4Sv0HKPeFqGjRe3DU0UVdNoJAL3DMEP4aidNnUGN8TvcxbVCijil/XCrPwEu8
	OYBI8QZf0lKf7JsFMe+08rdqLIGf4AfJBC6u0txPL5ruicXIWWA1WWugilVvtEMB4+YLQ2xznGH
	C3IwAUPy10W6C5nW3ViiRCpriioLdGb71RwS+i+2Cndpjm/xYFtBxR+B6yY8RAuiGtDPZlP8bhX
	OXv7UQb29CWYkkf
X-Received: by 2002:a05:600c:3f16:b0:477:54cd:200e with SMTP id 5b1f17b1804b1-482db4569c0mr64262665e9.1.1769846217511;
        Fri, 30 Jan 2026 23:56:57 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.56.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:56:57 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 05/22] mesa: fix build error with llvmpipe gallium driver
Date: Sat, 31 Jan 2026 08:56:16 +0100
Message-ID: <0b4dabed3345944da878326baed133dab8c8af5b.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230210

From: João Marcos Costa <joaomarcos.costa@bootlin.com>

For RISC-V, and if the PACKAGECONFIG 'gallium-llvm' is enabled, mesa's
do_compile fails due to a change in setObjectLinkingLayerCreator's
signature. This change was first included in LLVM v21.

This issue is further described below:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/13852

Backport the fix - from upstream - to Whinlatter.

Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../files/0001-gallivm-support-LLVM-21.patch  | 56 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch
new file mode 100644
index 00000000000..cf3bdd36cf9
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch
@@ -0,0 +1,56 @@
+From cd129dbf8af2d16b1243f2ce287ff69c6a5dc557 Mon Sep 17 00:00:00 2001
+From: no92 <no92.mail@gmail.com>
+Date: Wed, 27 Aug 2025 16:02:31 +0200
+Subject: gallivm: support LLVM 21
+
+LLVM PR#146819 changed the signature of `setObjectLinkingLayerCreator`,
+dropping the Triple argument. The PR was first included in the LLVM 21
+series, and the new signature is gated behind a version check for that.
+
+`LLVMOrcThreadSafeContextGetContext` was removed in LLVM commit b18e5b6,
+and the ORC examples in the LLVM tree seem to just create a context
+instead, which we replicate here.
+
+With this commit, mesa successfully builds the llvmpipe gallium driver
+on riscv64 with LLVM 21.1.0.
+
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13785
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13852
+
+Reviewed-by: David Heidelberg <david@ixit.cz>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37027>
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/mesa/mesa/commit/?id=cd129dbf8af2d16b1243f2ce287ff69c6a5dc557]
+---
+ src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
+index 6651ea439da..e5d8e461dd6 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
+@@ -339,7 +339,12 @@ LPJit::LPJit() :jit_dylib_count(0) {
+          .setJITTargetMachineBuilder(std::move(JTMB))
+ #ifdef USE_JITLINK
+          .setObjectLinkingLayerCreator(
++#if LLVM_VERSION_MAJOR >= 21
++            /* LLVM 21 removed the Triple argument */
++            [&](ExecutionSession &ES) {
++#else
+             [&](ExecutionSession &ES, const llvm::Triple &TT) {
++#endif
+                return std::make_unique<ObjectLinkingLayer>(
+                   ES, ExitOnErr(llvm::jitlink::InProcessMemoryManager::Create()));
+             })
+@@ -551,7 +556,7 @@ init_gallivm_state(struct gallivm_state *gallivm, const char *name,
+    gallivm->cache = cache;
+ 
+    gallivm->_ts_context = context->ref;
+-   gallivm->context = LLVMOrcThreadSafeContextGetContext(context->ref);
++   gallivm->context = LLVMContextCreate();
+ 
+    gallivm->module_name = LPJit::get_unique_name(name);
+    gallivm->module = LLVMModuleCreateWithNameInContext(gallivm->module_name,
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cf2c2a57a07..d880673f273 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
+           file://0001-gallivm-support-LLVM-21.patch \
 "
 
 SRC_URI[sha256sum] = "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"

