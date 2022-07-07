Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AF2CCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 17:19:17 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.394.1657214350074276955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 10:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: otavio.salvador@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id k2so9327800vsc.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 10:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yxe8s8lRPRa9Cun1oAAEKkZDQb+UBmXIhJgkrd0P0Rg=;
        b=6/igEEP3HvATtgP6zAgZUv9tDxmYPR6v4qgRbZrb+PpYEs3YAvIuV81ysLvBS6o0t/
         pYdvxc9j+O9TZEV5h/r0zMBqeY5B+7MdD5//bi7Uc2Y6q36DiDQBmj9ZHteYjQbJd0hH
         wpwhNRZrBSwDZXksX0guxXZnhdes6k74E8mD+oMtQ4IAP4gXQK/9vwgYfGcPVuea/ILf
         KeyTHQs6w2+vAnz8Uae1j9JHhqionBIpsxVJ0A2zA+tvK9x9EYnLX+K7KF2AqB89lyOq
         Bvj6dpK8t9ocoUD8v74df4B5LwqT+y/iS3WDXps3sFUgmpNFGoLmv8gAt0G1H39U/yMN
         sJ5g==
X-Gm-Message-State: AJIora+OYUI+h124A8W5wvD8foh1z5NF7STS23HVVV1OyNNK/8wbJl/h
	OYugQtRjG0IMMt+dVkMDN8CJXq0XnXUm8mld
X-Google-Smtp-Source: 
 AGRyM1tb9Jec3F5Ld5wBJ68P34mSnv1wKVpFcSxgC/v80gNPgrJKZrZXKuAYx1UvL5EeaUhZ1WElWw==
X-Received: by 2002:a05:6102:2407:b0:356:2318:b743 with SMTP id
 j7-20020a056102240700b003562318b743mr26327541vsi.61.1657214348677;
        Thu, 07 Jul 2022 10:19:08 -0700 (PDT)
Received: from localhost (177-4-253-164.user3p.brasiltelecom.net.br.
 [177.4.253.164])
        by smtp.gmail.com with ESMTPSA id
 y8-20020a67f248000000b00353f98c3f49sm9976668vsm.22.2022.07.07.10.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 10:19:07 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] rust-common: Fix use of target definitions for SDK
 generation
Date: Thu,  7 Jul 2022 14:19:02 -0300
Message-Id: <20220707171904.338441-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 17:19:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167794

We need full target passed for build so we changed the
rust-cross-canadian to use same code used in regular rust recipes and
added support to use specific llvm-target for the building host.

Fixes: ef566af964 ("rust: fix issue building cross-canadian tools for aarch64 on x86_64")
Fixes: bd36593ba3 ("rust-common: Drop LLVM_TARGET and simplify")
Fixes: 8ed000debb ("rust-common: Fix for target definitions returning 'NoneType' for arm")
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/rust/rust-common.inc    | 21 ++++++++++++------
 .../rust/rust-cross-canadian-common.inc       | 22 ++++++++++++++++---
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index ef70c48d0f..f8d365ecf8 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -119,12 +119,12 @@ def llvm_features(d):
 
 
 ## arm-unknown-linux-gnueabihf
-DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
-TARGET_ENDIAN[arm] = "little"
-TARGET_POINTER_WIDTH[arm] = "32"
-TARGET_C_INT_WIDTH[arm] = "32"
-MAX_ATOMIC_WIDTH[arm] = "64"
-FEATURES[arm] = "+v6,+vfp2"
+DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+TARGET_ENDIAN[arm-eabi] = "little"
+TARGET_POINTER_WIDTH[arm-eabi] = "32"
+TARGET_C_INT_WIDTH[arm-eabi] = "32"
+MAX_ATOMIC_WIDTH[arm-eabi] = "64"
+FEATURES[arm-eabi] = "+v6,+vfp2"
 
 ## armv7-unknown-linux-gnueabihf
 DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
@@ -304,12 +304,19 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     else:
         arch_abi = rust_arch
 
+    # When building for the building system we need to return the HOST target
+    # or wrong flags are used.
+    if thing is "BUILD":
+        llvm_target = d.getVar('RUST_HOST_SYS', arch_abi)
+    else:
+        llvm_target = d.getVar('RUST_TARGET_SYS', arch_abi)
+
     features = features or d.getVarFlag('FEATURES', arch_abi) or ""
     features = features.strip()
 
     # build tspec
     tspec = {}
-    tspec['llvm-target'] = d.getVar('RUST_TARGET_SYS', arch_abi)
+    tspec['llvm-target'] = llvm_target
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
     tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
index 1f21c8af26..eff9212648 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
@@ -27,9 +27,23 @@ DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDP
 
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
-    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
-    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
-    rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
+    # It is important 'TARGET' is last here so that it overrides our less
+    # informed choices for BUILD & HOST if TARGET happens to be the same as
+    # either of them.
+    for thing in ['BUILD', 'HOST', 'TARGET']:
+        bb.debug(1, "rust_gen_target for " + thing)
+        features = ""
+        cpu = "generic"
+        arch = d.getVar('{}_ARCH'.format(thing))
+        abi = ""
+        if thing is "TARGET":
+            abi = d.getVar('ABIEXTENSION')
+            # arm and armv7 have different targets in llvm
+            if arch == "arm" and target_is_armv7(d):
+                arch = 'armv7'
+            features = d.getVar('TARGET_LLVM_FEATURES') or ""
+            cpu = d.getVar('TARGET_LLVM_CPU')
+        rust_gen_target(d, thing, wd, features, cpu, arch, abi)
 }
 
 INHIBIT_DEFAULT_RUST_DEPS = "1"
@@ -45,6 +59,8 @@ python do_configure:prepend() {
     hosts = ["{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH", True))]
 }
 
+INSANE_SKIP:${PN} = "libdir"
+
 INSANE_SKIP:${RUSTLIB_TARGET_PN} = "file-rdeps arch ldflags"
 SKIP_FILEDEPS:${RUSTLIB_TARGET_PN} = "1"
 
-- 
2.36.1


