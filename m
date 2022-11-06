Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8615C43217
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.16502.1667744314615138557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=a6eZkHQq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id l2so8891470pld.13
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kliEPE/n/b08dU1MpQc7C3lVvCaA9HUTGoCMN6LrY2k=;
        b=a6eZkHQqybgxTlHpUSWnbaMBGkwL2dmv8Y7lB0CrsOTdu9C9965pgJH/kCXOp91Bq8
         x2vuVbBhJdLTa4jX6F7BpPPFWFMjmhLJ0SBilI8FXBlU5/TnW4P/b/9dMceQEzTWrlGJ
         G9j6RLndRLGMgRS9lwlSv0kLma47yNlNoAjmb0VIMWcQmEsZ5ILoopLwDQgGJHHO+22m
         YI2OZ/NlBg4GL3NMf2wsd6QLNRfakabnh2QHsZdTU/BuFSmDnC81JDNq/Pph3AJXiGDY
         EnqUVy+JowrIi0gx86gt+wT1YeMOfKU/8WEB5MTNZHGFN8q7BlwVpinYebRRHeHYwTQU
         svEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kliEPE/n/b08dU1MpQc7C3lVvCaA9HUTGoCMN6LrY2k=;
        b=ZcLDDueJeIQoElWYUg/vUxHmH3CFCcx3q+8+kbexVaRtzeW5futgDVqj+3YFaUSpnY
         s57idDgpFMvm7bifHeFPXjWSQRZIA9LC57bIiZQaajeZ9Z/0a8cwN3lSAt2yMyh34976
         6AuoRn1+V1eBLgDy/RSYeLum5Qd8WgV1We+t59wv0djNUytyUzGfmfBeQLwhTbfULxWM
         x59zL1F+a0rgi/R4dBCcCLp+J7C4fJBjgD9+RLuDXwX4s43S5oj7GairVGn6C2cydo6W
         Ekjw/zXPgL+kbNjI0ri5rs6HsKc8ViSG8/b4OLPj19dTUOtBoE8A+aa+H2EmcnhyCsFT
         EO+Q==
X-Gm-Message-State: ACrzQf3CZ0H5ENHB94qaD1+Nwn3gvTD0cwSPHy42MSI4Fci5tJ0XEcO3
	BnXM1xBz9LdhGGyaN7THbP7QRpy7Q1Drg8MU
X-Google-Smtp-Source: AMsMyM5fRkI5WMZbXmeSctronTBt7xy9PHmVDANpqclF+ZmfVXFBqn+v2E8/uV8mmQQ+JxDgh505iw==
X-Received: by 2002:a17:902:d2d0:b0:186:9e90:699 with SMTP id n16-20020a170902d2d000b001869e900699mr46418805plc.172.1667744313654;
        Sun, 06 Nov 2022 06:18:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 32/34] rust-target-config: match riscv target names with what rust expects
Date: Sun,  6 Nov 2022 04:17:15 -1000
Message-Id: <2daa8d76369cd06e5c357e393e3145e08f3d6760.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172800

From: Alexander Kanavin <alex.kanavin@gmail.com>

Official rust risc-v targets are prefixed with riscv32gc- and riscv64gc-:
https://doc.rust-lang.org/nightly/rustc/platform-support.html

Particularly crossbeam-utils make important build time decisions
for atomics based on those names, and so we need to match ours
with official targets.

On the other hand, the actual definitions for those targets do not
use the 'gc' suffix in 'arch' and 'llvm-target' fields, and so we
need to follow that too, to avoid cryptic mismatch errors from rust-llvm:
https://github.com/rust-lang/rust/blob/master/compiler/rustc_target/src/spec/riscv32gc_unknown_linux_gnu.rs

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1cfb9c8a59d98ccc9b0510cd28fb933f72fb6b6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../classes-recipe/rust-target-config.bbclass | 40 ++++++++++++-------
 meta/lib/oe/rust.py                           |  2 +
 2 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 9e1d81bf5c..2710b4325d 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -231,19 +231,19 @@ TARGET_POINTER_WIDTH[powerpc64le] = "64"
 TARGET_C_INT_WIDTH[powerpc64le] = "64"
 MAX_ATOMIC_WIDTH[powerpc64le] = "64"
 
-## riscv32-unknown-linux-{gnu, musl}
-DATA_LAYOUT[riscv32] = "e-m:e-p:32:32-i64:64-n32-S128"
-TARGET_ENDIAN[riscv32] = "little"
-TARGET_POINTER_WIDTH[riscv32] = "32"
-TARGET_C_INT_WIDTH[riscv32] = "32"
-MAX_ATOMIC_WIDTH[riscv32] = "32"
-
-## riscv64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[riscv64] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
-TARGET_ENDIAN[riscv64] = "little"
-TARGET_POINTER_WIDTH[riscv64] = "64"
-TARGET_C_INT_WIDTH[riscv64] = "64"
-MAX_ATOMIC_WIDTH[riscv64] = "64"
+## riscv32gc-unknown-linux-{gnu, musl}
+DATA_LAYOUT[riscv32gc] = "e-m:e-p:32:32-i64:64-n32-S128"
+TARGET_ENDIAN[riscv32gc] = "little"
+TARGET_POINTER_WIDTH[riscv32gc] = "32"
+TARGET_C_INT_WIDTH[riscv32gc] = "32"
+MAX_ATOMIC_WIDTH[riscv32gc] = "32"
+
+## riscv64gc-unknown-linux-{gnu, musl}
+DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
+TARGET_ENDIAN[riscv64gc] = "little"
+TARGET_POINTER_WIDTH[riscv64gc] = "64"
+TARGET_C_INT_WIDTH[riscv64gc] = "64"
+MAX_ATOMIC_WIDTH[riscv64gc] = "64"
 
 # Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to something
 # rust's internals won't choke on.
@@ -258,9 +258,21 @@ def arch_to_rust_target_arch(arch):
         return "arm"
     elif arch == "powerpc64le":
         return "powerpc64"
+    elif arch == "riscv32gc":
+        return "riscv32"
+    elif arch == "riscv64gc":
+        return "riscv64"
     else:
         return arch
 
+# Convert a rust target string to a llvm-compatible triplet
+def rust_sys_to_llvm_target(sys):
+    if sys.startswith('riscv32gc-'):
+        return sys.replace('riscv32gc-', 'riscv32-', 1)
+    if sys.startswith('riscv64gc-'):
+        return sys.replace('riscv64gc-', 'riscv64-', 1)
+    return sys
+
 # generates our target CPU value
 def llvm_cpu(d):
     cpu = d.getVar('PACKAGE_ARCH')
@@ -334,7 +346,7 @@ def rust_gen_target(d, thing, wd, arch):
 
     # build tspec
     tspec = {}
-    tspec['llvm-target'] = rustsys
+    tspec['llvm-target'] = rust_sys_to_llvm_target(rustsys)
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
     if tspec['data-layout'] is None:
         bb.fatal("No rust target defined for %s" % arch_abi)
diff --git a/meta/lib/oe/rust.py b/meta/lib/oe/rust.py
index 1dc9cf150d..185553eeeb 100644
--- a/meta/lib/oe/rust.py
+++ b/meta/lib/oe/rust.py
@@ -8,4 +8,6 @@
 def arch_to_rust_arch(arch):
     if arch == "ppc64le":
         return "powerpc64le"
+    if arch in ('riscv32', 'riscv64'):
+        return arch + 'gc'
     return arch
-- 
2.25.1


