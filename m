Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327AAC43334
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 11:10:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.5337.1658574651462257693
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 04:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O3rhHIUD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so6548120wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7gMR912ql6d3XzGNkLBHmKEbKnE947RJPgWEWYrTaio=;
        b=O3rhHIUDGSfw+ScL9regAWd3TdSkrcfd9N2JzjDPqOKUYn/5fzxjjL0sTkHTufN4ka
         9YjAzUWMWk4DDTbdPyxgmydNyNlE3ZFlz77s8pl03Er04gZ1+lraJV/4MJ98w+heT+Lv
         8x3RO+N7zD37GajkcQI19EDb9Cx6VTLnFE8nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7gMR912ql6d3XzGNkLBHmKEbKnE947RJPgWEWYrTaio=;
        b=DebnD8HxjGXfn6fF1QufJ8Npby2UwbaDhltsrWV8S+FjmEaPVpHpeiU82Mw9N8t8+D
         NY4ID8mFiB02EaXMRCHo7vHO4ClZ++AkXr9t23tvfLqgFdprAej+w0orHiTWpxhXtrgS
         YTawRMzoOCK+gxkzjDzdZkBhSFTIdaifuzs5aXR5JbCz/eHS2TcSOauyEj44G7FGWVlV
         O3B+jLqxGM2D/0O7FJqa3U6pd9AXqQ2JbrxaTqVUsAZ2W+7ZSNNBs2KB46l56LYTJaBX
         N/SvaAQBvEcZ6DuyCh6nwKzTRQ7gfdTlndeqtvkc+hp67X0toISY7atlPeNQPzJpaakM
         Ckxg==
X-Gm-Message-State: AJIora9t5agRiIrkU/WxtitK6fxGE+dOkVWXsLASStyCtky4f6GnVLID
	Uh+KJdaJor9R3chku5jn48odKWSBVC1APQ==
X-Google-Smtp-Source: 
 AGRyM1sgOEdRFY7R5aDCN03j3AyhU+iYLi7u8TGdbhRXyyPC7O8E9tB0huO83juWj/j4SzYR7mOtXg==
X-Received: by 2002:a7b:c442:0:b0:3a3:bdb:e84c with SMTP id
 l2-20020a7bc442000000b003a30bdbe84cmr2592189wmi.101.1658574649653;
        Sat, 23 Jul 2022 04:10:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9bb3:b62f:20a1:a32])
        by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b0021e5f32ade7sm3430181wrp.68.2022.07.23.04.10.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 04:10:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] rust-cross: Simplfy the rust_gen_target calls
Date: Sat, 23 Jul 2022 12:10:45 +0100
Message-Id: <20220723111045.1775562-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220723111045.1775562-1-richard.purdie@linuxfoundation.org>
References: <20220723111045.1775562-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 11:10:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168432

Match the code in rust-cross-canadian so that further simplifications
can be considered in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-common.inc | 12 ++++++------
 meta/recipes-devtools/rust/rust-cross.inc  | 16 ++++------------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 82ff03b9089..d00b380dbde 100644
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
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index 4c026b1f388..2e47a3aa5f3 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -1,17 +1,9 @@
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
-    # It is important 'TARGET' is last here so that it overrides our less
-    # informed choices for BUILD & HOST if TARGET happens to be the same as
-    # either of them.
-    for thing in ['BUILD', 'HOST', 'TARGET']:
-        bb.debug(1, "rust_gen_target for " + thing)
-        features = ""
-        cpu = "generic"
-        arch = d.getVar('{}_ARCH'.format(thing))
-        if thing is "TARGET":
-            features = d.getVar('TARGET_LLVM_FEATURES') or ""
-            cpu = d.getVar('TARGET_LLVM_CPU')
-        rust_gen_target(d, thing, wd, features, cpu, arch)
+    # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
+    rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
+    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
+    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
 }
 
 # Otherwise we'll depend on what we provide
-- 
2.34.1


