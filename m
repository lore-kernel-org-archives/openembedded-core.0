Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE8EC77B7A
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 23:39:57 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.34212.1750203587888285719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 16:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55HNdjaU026548
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 18:39:47 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 7/7] rust-target-config.bbclass: Update for new riscv TUNE_FEATURES
Date: Tue, 17 Jun 2025 18:39:44 -0500
Message-Id: <1750203584-32065-8-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 23:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218953

From: Mark Hatle <mark.hatle@amd.com>

Add the new TUNE_FEATURES to the 'features:' list, based on matching output
with:

   rustc --target=riscv32i-unknown-none-elf -Ctarget-feature=help

Use the TUNE_RISCV_ABI instead of guessing for the ABI.

Pass the arch "as-is", since it should now be riscv32 or riscv64.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 .../classes-recipe/rust-target-config.bbclass | 65 ++++++++++++-------
 meta/lib/oe/rust.py                           |  2 -
 2 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index c04940ce54..906a5083d7 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -77,8 +77,33 @@ def llvm_features_from_tune(d):
         f.append("+a15")
     if 'cortexa17' in feat:
         f.append("+a17")
-    if ('riscv64' in feat) or ('riscv32' in feat):
-        f.append("+a,+c,+d,+f,+m")
+    if 'rv' in feat:
+        if 'm' in feat:
+            f.append("+m")
+        if 'a' in feat:
+            f.append("+a")
+        if 'f' in feat:
+            f.append("+f")
+        if 'd' in feat:
+            f.append("+d")
+        if 'c' in feat:
+            f.append("+c")
+        if 'v' in feat:
+            f.append("+v")
+        if 'zicbom' in feat:
+            f.append("+zicbom")
+        if 'zicsr' in feat:
+            f.append("+zicsr")
+        if 'zifencei' in feat:
+            f.append("+zifencei")
+        if 'zba' in feat:
+            f.append("+zba")
+        if 'zbb' in feat:
+            f.append("+zbb")
+        if 'zbc' in feat:
+            f.append("+zbc")
+        if 'zbs' in feat:
+            f.append("+zbs")
     return f
 llvm_features_from_tune[vardepvalue] = "${@llvm_features_from_tune(d)}"
 
@@ -236,19 +261,19 @@ TARGET_POINTER_WIDTH[powerpc64le] = "64"
 TARGET_C_INT_WIDTH[powerpc64le] = "32"
 MAX_ATOMIC_WIDTH[powerpc64le] = "64"
 
-## riscv32gc-unknown-linux-{gnu, musl}
-DATA_LAYOUT[riscv32gc] = "e-m:e-p:32:32-i64:64-n32-S128"
-TARGET_ENDIAN[riscv32gc] = "little"
-TARGET_POINTER_WIDTH[riscv32gc] = "32"
-TARGET_C_INT_WIDTH[riscv32gc] = "32"
-MAX_ATOMIC_WIDTH[riscv32gc] = "32"
+## riscv32-unknown-linux-{gnu, musl}
+DATA_LAYOUT[riscv32] = "e-m:e-p:32:32-i64:64-n32-S128"
+TARGET_ENDIAN[riscv32] = "little"
+TARGET_POINTER_WIDTH[riscv32] = "32"
+TARGET_C_INT_WIDTH[riscv32] = "32"
+MAX_ATOMIC_WIDTH[riscv32] = "32"
 
-## riscv64gc-unknown-linux-{gnu, musl}
-DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
-TARGET_ENDIAN[riscv64gc] = "little"
-TARGET_POINTER_WIDTH[riscv64gc] = "64"
-TARGET_C_INT_WIDTH[riscv64gc] = "32"
-MAX_ATOMIC_WIDTH[riscv64gc] = "64"
+## riscv64-unknown-linux-{gnu, musl}
+DATA_LAYOUT[riscv64] = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
+TARGET_ENDIAN[riscv64] = "little"
+TARGET_POINTER_WIDTH[riscv64] = "64"
+TARGET_C_INT_WIDTH[riscv64] = "32"
+MAX_ATOMIC_WIDTH[riscv64] = "64"
 
 ## loongarch64-unknown-linux-{gnu, musl}
 DATA_LAYOUT[loongarch64] = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
@@ -271,19 +296,11 @@ def arch_to_rust_target_arch(arch):
         return "arm"
     elif arch == "powerpc64le":
         return "powerpc64"
-    elif arch == "riscv32gc":
-        return "riscv32"
-    elif arch == "riscv64gc":
-        return "riscv64"
     else:
         return arch
 
 # Convert a rust target string to a llvm-compatible triplet
 def rust_sys_to_llvm_target(sys):
-    if sys.startswith('riscv32gc-'):
-        return sys.replace('riscv32gc-', 'riscv32-', 1)
-    if sys.startswith('riscv64gc-'):
-        return sys.replace('riscv64gc-', 'riscv64-', 1)
     return sys
 
 # generates our target CPU value
@@ -380,9 +397,9 @@ def rust_gen_target(d, thing, wd, arch):
     else:
         tspec['env'] = "gnu"
     if "riscv64" in tspec['llvm-target']:
-        tspec['llvm-abiname'] = "lp64d"
+        tspec['llvm-abiname'] = d.getVar('TUNE_RISCV_ABI')
     if "riscv32" in tspec['llvm-target']:
-        tspec['llvm-abiname'] = "ilp32d"
+        tspec['llvm-abiname'] = d.getVar('TUNE_RISCV_ABI')
     if "loongarch64" in tspec['llvm-target']:
         tspec['llvm-abiname'] = "lp64d"
     tspec['vendor'] = "unknown"
diff --git a/meta/lib/oe/rust.py b/meta/lib/oe/rust.py
index 185553eeeb..1dc9cf150d 100644
--- a/meta/lib/oe/rust.py
+++ b/meta/lib/oe/rust.py
@@ -8,6 +8,4 @@
 def arch_to_rust_arch(arch):
     if arch == "ppc64le":
         return "powerpc64le"
-    if arch in ('riscv32', 'riscv64'):
-        return arch + 'gc'
     return arch
-- 
2.34.1


