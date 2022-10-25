Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6867FFA3740
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 18:44:50 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.1793.1666723480107333810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 11:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SkxOvwkr;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id o4so14411967wrq.6
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 11:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dM99KO+aeEKdjboUIC3wcZuW5HOyxkr8z7hIfXXB9Iw=;
        b=SkxOvwkrX89FrpVP4ypUckSwLc7DZjLavjya5nCqUcwn+34PTwaRjBS6dxO+4yfsp+
         8TA+Wc2OAmGtxFeTTPxNlL1Wu+usEmPIyObVNeAmvYwU8ireAuKyVS7n/QJGtwzyZP49
         JUuyXdiYETfzJrAkGGfYIQsvMaXB325uDe6GDpjxt5oHI1u1qztExphBxbxfJuPrkJzz
         HXUIq2ldvE1YOpNHGBd+auWONHEeicv3oLoiBmhGq2aZqbv7jyGveW896DVqTfnTm+u5
         MHd5e4nubKA2cmg5DJjRgw5VMhZUjAWgWMTPtsN8Q1uFSsGS4yV4zRYPzSoCz0Q1Tz3S
         nuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dM99KO+aeEKdjboUIC3wcZuW5HOyxkr8z7hIfXXB9Iw=;
        b=wkE6HxjvOxXlTCOp3A4I+UizzPunp+QRiX7qnd2hCMc86BcLUpSizq8rXaZcdL/nGP
         BVDbtwUf1LeXJ7I3HXpktRF4/aPlf7zhnNvLBRnQmxSnaaEfxm35Jovo/jR81kxO+J64
         ecHpPU90fLecqJLfV523B8XZjh2ZNXOdKgLxINYp3VNMppPfON3gjrPKXp06DuoXXNaZ
         6ej3H9/OADHZ8UR7Obmtmaf4MyLcz5CY+UrW/xeWsDGK2LE9cTG+sYnO2Q3+rX98R0jP
         o1Wu+1tlEBALtX26b6aZdUMgLW2ZXvxXR7svZ8QJ+m0KnpzpXHe6e647jYmq4Ns4JpLV
         YH5Q==
X-Gm-Message-State: ACrzQf3+ELpAVBdZ517erxVyuM04oO9zHK2qkHI1UVqodSc8SXSdyjFt
	pPuUOAQTPehg1pbk6z7Tokg0qMEb5Rk=
X-Google-Smtp-Source: AMsMyM5SgDdn/J3bB4Vx3gZQ13XmMVHl3guzbPVWdQiB/FRRCSMrh7rTDyl/ezR8xWWM8q6O8j+Dyw==
X-Received: by 2002:a05:6000:1d94:b0:22e:34ef:b07f with SMTP id bk20-20020a0560001d9400b0022e34efb07fmr26766027wrb.272.1666723478295;
        Tue, 25 Oct 2022 11:44:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z2-20020adff742000000b00236705daefesm3294310wrp.39.2022.10.25.11.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 11:44:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] rust-target-config: match riscv target names with what rust expects
Date: Tue, 25 Oct 2022 20:44:26 +0200
Message-Id: <20221025184427.399850-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 18:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172141

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
2.30.2


