Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C038C43334
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 12:29:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5875.1658579342222701861
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 05:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R5IBXAln;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 i205-20020a1c3bd6000000b003a2fa488efdso867690wma.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g699O/nzZhdiOyqzER2hUHE2w1A4Hx+dKcGZz4Zid64=;
        b=R5IBXAlnwP75rrKVcRcgqCL/TLbgU4UPUgWCmKeDL+bGxx1pvD/aczIByw6tknxJ9D
         sBFvXMKyI+OCgyJN+A2TWNs2D/V2L/+6iJo9jp7BYUdanKbN3OhfXBIfHi+aLRnwZsI7
         JXjonhdT+1bahho6P2MCvLx1BJIjme5rbL9Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g699O/nzZhdiOyqzER2hUHE2w1A4Hx+dKcGZz4Zid64=;
        b=7SnrxjsubvcgQG24+rVOd6kalpGb4BXGxNq++LGxXR7vyOxj02Ytr7W4LVfXvo5WbN
         QJHN/zZGV/H3cX3NfrrngPrF5O90GLMsVHWhUeuSKCY/5VJVLw1hMat8gRYjmjuiM2ez
         HipYK/hrThACvC8blunq1rAcIa8nwihxS6fGBrwIExr4UrwvWjaK5uZz0klSQZnN6oHx
         8mNGqQOLah2IufHYqERsUEBFN7I6pT9k94Jwmk+b6ju7/aQSAw7mTelF/YBLmAYgqJUj
         R11YxUkO2h+Y9OLReoQ3bZLvQHz2BehxGrxVrsgBKb24wgFv8wCjcL9fl1cTPRPOK90d
         C07g==
X-Gm-Message-State: AJIora+TwfMkdVq8sjeqVNmHO6775XZxPm4dVwTGV4U6I3/b/vMMIiKD
	OisHk4vSVmW9rvvmVrTCgrIp0UKCR2sRsw==
X-Google-Smtp-Source: 
 AGRyM1s/eQ99kxnC0X69WOU9dAZCptrZIf7YBIfrF05KDtx6G1teDZ4Hp+smJAFsIdUDgqopQKCs3g==
X-Received: by 2002:a05:600c:35c7:b0:3a3:2612:f823 with SMTP id
 r7-20020a05600c35c700b003a32612f823mr2817248wmq.33.1658579340425;
        Sat, 23 Jul 2022 05:29:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9bb3:b62f:20a1:a32])
        by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm11682195wmn.47.2022.07.23.05.28.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 05:29:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust-common/rust-cross: Clean up target json generation code
Date: Sat, 23 Jul 2022 13:28:59 +0100
Message-Id: <20220723122859.1789373-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 12:29:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168435

Some of the subtleties in the different codepaths for target rust json generation
were not easy to spot. Start to simplfy the code to make this clearer.

This patch should not have any functionality change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cargo/cargo-cross-canadian.inc            |  4 +--
 meta/recipes-devtools/rust/rust-common.inc    | 29 ++++++++-----------
 .../rust/rust-cross-canadian-common.inc       |  6 ++--
 meta/recipes-devtools/rust/rust-cross.inc     |  6 ++--
 4 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
index 01ba151d0a9..d12267db3d5 100644
--- a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
+++ b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
@@ -31,8 +31,8 @@ PN = "cargo-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
 
-    rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
-    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
+    rust_gen_target(d, 'BUILD', wd, d.getVar('BUILD_ARCH'))
+    rust_gen_target(d, 'HOST', wd, d.getVar('HOST_ARCH'))
 }
 
 do_compile:prepend () {
diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index d00b380dbde..be9d1a301bd 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -232,12 +232,6 @@ TARGET_POINTER_WIDTH[riscv64] = "64"
 TARGET_C_INT_WIDTH[riscv64] = "64"
 MAX_ATOMIC_WIDTH[riscv64] = "64"
 
-def sys_for(d, thing):
-    return d.getVar('{}_SYS'.format(thing))
-
-def prefix_for(d, thing):
-    return d.getVar('{}_PREFIX'.format(thing))
-
 # Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to something
 # rust's internals won't choke on.
 def arch_to_rust_target_arch(arch):
@@ -285,20 +279,21 @@ def llvm_cpu(d):
     except:
         return trans.get(target, "generic")
 
-TARGET_LLVM_CPU="${@llvm_cpu(d)}"
-TARGET_LLVM_FEATURES = "${@llvm_features(d)}"
-
-# class-native implies TARGET=HOST, and TUNE_FEATURES only describes the real
-# (original) target.
-TARGET_LLVM_FEATURES:class-native = "${@','.join(llvm_features_from_cc_arch(d))}"
-
-def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
+def rust_gen_target(d, thing, wd, arch):
     import json
-    sys = sys_for(d, thing)
-    prefix = prefix_for(d, thing)
+    sys = d.getVar('{}_SYS'.format(thing))
+    prefix = d.getVar('{}_PREFIX'.format(thing))
+
+    cpu = "generic"
+    features = ""
 
     if thing == "TARGET":
         abi = d.getVar('ABIEXTENSION')
+        cpu = d.getVar('TARGET_LLVM_CPU')
+        if bb.data.inherits_class('native', d):
+            features = ','.join(llvm_features_from_cc_arch(d))
+        else:
+            features = d.getVar('TARGET_LLVM_FEATURES') or ""
         # arm and armv7 have different targets in llvm
         if arch == "arm" and target_is_armv7(d):
             arch = 'armv7'
@@ -362,7 +357,7 @@ do_rust_gen_targets[vardeps] += "DATA_LAYOUT TARGET_ENDIAN TARGET_POINTER_WIDTH
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
     build_arch = d.getVar('BUILD_ARCH')
-    rust_gen_target(d, 'BUILD', wd, "", "generic", build_arch)
+    rust_gen_target(d, 'BUILD', wd, build_arch)
 }
 
 addtask rust_gen_targets after do_patch before do_compile
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
index df4901f1fac..5c0644e92d7 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
@@ -28,9 +28,9 @@ DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDP
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
     # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
-    rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
-    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
-    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
+    rust_gen_target(d, 'BUILD', wd, d.getVar('BUILD_ARCH'))
+    rust_gen_target(d, 'HOST', wd, d.getVar('HOST_ARCH'))
+    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_ARCH'))
 }
 
 INHIBIT_DEFAULT_RUST_DEPS = "1"
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index 2e47a3aa5f3..719857ebbb3 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -1,9 +1,9 @@
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
     # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
-    rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
-    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
-    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
+    rust_gen_target(d, 'BUILD', wd, d.getVar('BUILD_ARCH'))
+    rust_gen_target(d, 'HOST', wd, d.getVar('HOST_ARCH'))
+    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_ARCH'))
 }
 
 # Otherwise we'll depend on what we provide
-- 
2.34.1


