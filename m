Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE09C433F5
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 19:10:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.2132.1633893020961494612
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DqgOXkTh;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id r10so48615027wra.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9K5ml8eFVlJ1BReTIEVpdzf2SqIb7YzPeG8+pySDyq0=;
        b=DqgOXkThqVNn2Gc+SycHTrKcyquBnz6VKOyLJClzA+H1QX0RdBThzWsxwlTrtZgaGN
         zT9oAlUcJsQhrYLv8L3EVJVpGq6565iUfMgo421RDM4bj1LYi7sLCbfW+ItAgC2C7Dx8
         YLLRk3/A63QaRns1HnyMqN56WE6/7TrYNFg7+SUItN1OZyEtSW4BOLiG1eWzGOW6lzle
         ugpCkXAJrk0LfglO/guh2dAAKL/yTJ1HL6Z+DEII23Cb9rzXh4p7hLd/U+39U503YdAs
         akhYmoxJcqc/bsq/zdQ7o3FRAntqvDhlN9y/PYwuoqrPYeSdQFTq9nTTZndLIyIYZPtT
         dWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9K5ml8eFVlJ1BReTIEVpdzf2SqIb7YzPeG8+pySDyq0=;
        b=YyGGavg0IbqYxr9HP4cU27GIBU53LO/pVCWenJHu9vldOgEI9EdytYscAH6QUxVjPN
         yxTH8vjKJSGucft2V3e3gc10/nvOtTIj+2V2k25OPi8ArWbsNBMSaVrhVz7NkhunULjM
         ijV4D28zdeneoNY/OwswjgkBIRzVmmqUj4cTAAItaxDB9oiVyKQd92DUo3Ft+Q0Qry49
         MnUXnvVTLt8rAQsUrY07SU37OVhfSsX/UjjV4vAU7hFuthWqrpjDJImLZFaFqkUi3nLI
         jJ48DgniDq1vyoZkOsC/ZD71/pqpV5C1KWvdSCRiDXATctPJipGF5kkJbN72JZKlO/qg
         pCcw==
X-Gm-Message-State: AOAM533wY2ukFGzdcK68zETqbLkoWEE1U/rLAIJsiVS5oVgDT5IRx4Cb
	0kwEzng5/nVTdoY2VUVdXK0GHfzl70g=
X-Google-Smtp-Source: 
 ABdhPJzm2ftULGAOxzenyQsMCW53J5w2s2nS20EG4JIu73lZyrloaVMlM+qA68QEd63/VL3L7XTcSA==
X-Received: by 2002:adf:a3d0:: with SMTP id
 m16mr19839530wrb.265.1633893019609;
        Sun, 10 Oct 2021 12:10:19 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id z6sm7962025wmp.1.2021.10.10.12.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 12:10:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/13] rust: generate target definitions from (arch, abi),
 not just arch
Date: Sun, 10 Oct 2021 21:10:08 +0200
Message-Id: <20211010191008.4122049-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010191008.4122049-1-alex@linutronix.de>
References: <20211010191008.4122049-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 19:10:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156806

This allows to add the missing x32 definition and others in the future.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/rust-common.inc | 57 +++++++++++++---------
 meta/recipes-devtools/rust/rust-cross.inc  |  4 +-
 2 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 797284316e2..7f92602e165 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -119,22 +119,22 @@ def llvm_features(d):
 
 
 ## arm-unknown-linux-gnueabihf
-DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
-LLVM_TARGET[arm] = "${RUST_TARGET_SYS}"
-TARGET_ENDIAN[arm] = "little"
-TARGET_POINTER_WIDTH[arm] = "32"
-TARGET_C_INT_WIDTH[arm] = "32"
-MAX_ATOMIC_WIDTH[arm] = "64"
-FEATURES[arm] = "+v6,+vfp2"
+DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+LLVM_TARGET[arm-eabi] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[arm-eabi] = "little"
+TARGET_POINTER_WIDTH[arm-eabi] = "32"
+TARGET_C_INT_WIDTH[arm-eabi] = "32"
+MAX_ATOMIC_WIDTH[arm-eabi] = "64"
+FEATURES[arm-eabi] = "+v6,+vfp2"
 
 ## armv7-unknown-linux-gnueabihf
-DATA_LAYOUT[armv7] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
-LLVM_TARGET[armv7] = "${RUST_TARGET_SYS}"
-TARGET_ENDIAN[armv7] = "little"
-TARGET_POINTER_WIDTH[armv7] = "32"
-TARGET_C_INT_WIDTH[armv7] = "32"
-MAX_ATOMIC_WIDTH[armv7] = "64"
-FEATURES[armv7] = "+v7,+vfp2,+thumb2"
+DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+LLVM_TARGET[armv7-eabi] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[armv7-eabi] = "little"
+TARGET_POINTER_WIDTH[armv7-eabi] = "32"
+TARGET_C_INT_WIDTH[armv7-eabi] = "32"
+MAX_ATOMIC_WIDTH[armv7-eabi] = "64"
+FEATURES[armv7-eabi] = "+v7,+vfp2,+thumb2"
 
 ## aarch64-unknown-linux-{gnu, musl}
 DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
@@ -152,6 +152,14 @@ TARGET_POINTER_WIDTH[x86_64] = "64"
 TARGET_C_INT_WIDTH[x86_64] = "32"
 MAX_ATOMIC_WIDTH[x86_64] = "64"
 
+## x86_64-unknown-linux-gnux32
+DATA_LAYOUT[x86_64-x32] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
+LLVM_TARGET[x86_64-x32] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[x86_64-x32] = "little"
+TARGET_POINTER_WIDTH[x86_64-x32] = "32"
+TARGET_C_INT_WIDTH[x86_64-x32] = "32"
+MAX_ATOMIC_WIDTH[x86_64-x32] = "64"
+
 ## i686-unknown-linux-{gnu, musl}
 DATA_LAYOUT[i686] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
 LLVM_TARGET[i686] = "${RUST_TARGET_SYS}"
@@ -292,22 +300,27 @@ TARGET_LLVM_FEATURES = "${@llvm_features(d)}"
 # (original) target.
 TARGET_LLVM_FEATURES:class-native = "${@','.join(llvm_features_from_cc_arch(d))}"
 
-def rust_gen_target(d, thing, wd, features, cpu, arch):
+def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     import json
     sys = sys_for(d, thing)
     prefix = prefix_for(d, thing)
 
-    features = features or d.getVarFlag('FEATURES', arch) or ""
+    if abi:
+        arch_abi = "{}-{}".format(arch, abi)
+    else:
+        arch_abi = arch
+
+    features = features or d.getVarFlag('FEATURES', arch_abi) or ""
     features = features.strip()
 
     # build tspec
     tspec = {}
-    tspec['llvm-target'] = d.getVarFlag('LLVM_TARGET', arch)
-    tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch)
-    tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch))
-    tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch)
-    tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch)
-    tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch)
+    tspec['llvm-target'] = d.getVarFlag('LLVM_TARGET', arch_abi)
+    tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
+    tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
+    tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
+    tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
+    tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch_abi)
     tspec['arch'] = arch_to_rust_target_arch(arch)
     tspec['os'] = "linux"
     if "musl" in tspec['llvm-target']:
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index bee7c9f12f3..42163f7b819 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -11,13 +11,15 @@ python do_rust_gen_targets () {
         features = ""
         cpu = "generic"
         arch = d.getVar('{}_ARCH'.format(thing))
+        abi = ""
         if thing is "TARGET":
+            abi = d.getVar('ABIEXTENSION')
             # arm and armv7 have different targets in llvm
             if arch == "arm" and target_is_armv7(d):
                 arch = 'armv7'
             features = d.getVar('TARGET_LLVM_FEATURES') or ""
             cpu = d.getVar('TARGET_LLVM_CPU')
-        rust_gen_target(d, thing, wd, features, cpu, arch)
+        rust_gen_target(d, thing, wd, features, cpu, arch, abi)
 }
 
 # Otherwise we'll depend on what we provide
-- 
2.20.1


