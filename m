Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A96C433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 11:10:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.5152.1658574650749000937
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 04:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iVhvxSsg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 i205-20020a1c3bd6000000b003a2fa488efdso794322wma.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yXx+J9FeYsAw1qmCuz8Nvi9o7JrAqJaD4Bif0vFAGDw=;
        b=iVhvxSsgAYMJq1cd5DJGhd8Dj5DFCV2t8pUmIi+llQkaGCxw4PpzTH71tQgAGbSgOW
         Cnv6rPLR2FYmJ2mtLStsoPkJNCuQuODCaeUmCaezNcUVngjWclaI/NoY1w9CSISVLtbZ
         rrbAqj6aqrpgJwSLqW7yUpL43lX1IDjhNychM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yXx+J9FeYsAw1qmCuz8Nvi9o7JrAqJaD4Bif0vFAGDw=;
        b=tIRrgD5LcSeFhJskd2cWUsplVYe/q/9PCzvG8cIACalAWDwFwpKlfRKpb9ONt0bSdq
         2mfbVvx6lvODY4y+TVm190nwFQkSf+5ptRm4w1cDN1odVKeIX81kapCttLGeEpId6ylv
         odH723vGSHr2d6DxWGMWChzBd56bkRaePvoSC/NuCQHYeNrJFfhezNlQDT0vjl9v1BOU
         m26jCDm9/T9kYQwf5MBuE/jK4hJQFDeGbTqQBFgE0SaeU7ZmV81u9WJnGijyDWCkDf2o
         zxNer3XCmEeYypqvlRis1Fc0Y2FRfeXVH/ozZBAB7mT1YxdFM5o+AaHhMW3J+GbvfTVR
         c7xA==
X-Gm-Message-State: AJIora982jS6G2PPsQ9q5pAPysbmj2CSdY83+uUoP5k1gLlIQdUvXU3/
	41K/MGpQc0KzJgy+3KDVsuld7FK9AuXu/A==
X-Google-Smtp-Source: 
 AGRyM1uWjjKlB3bO5I6mdpP8fmiqrZETkbS66+/a35UIFaGjTkX+nH5TOXyZ6IHSof2EEI6qWvwwFQ==
X-Received: by 2002:a1c:7707:0:b0:3a2:fedc:392 with SMTP id
 t7-20020a1c7707000000b003a2fedc0392mr2620354wmi.20.1658574648817;
        Sat, 23 Jul 2022 04:10:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9bb3:b62f:20a1:a32])
        by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b0021e5f32ade7sm3430181wrp.68.2022.07.23.04.10.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 04:10:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] rust-cross/rust-common: Merge arm target handling code to
 fix cross-canadian
Date: Sat, 23 Jul 2022 12:10:44 +0100
Message-Id: <20220723111045.1775562-3-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/168431

rust-cross had special handling for armv7 targets but we also need this
for cross-canadian. Merge the code into the main function so everything is
consistent.

Also then fix the arm definition to be arm-eabi since ABI is correctly
being looked up.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-common.inc | 6 ++++++
 meta/recipes-devtools/rust/rust-cross.inc  | 7 +------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 37abd2cd26d..82ff03b9089 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -297,6 +297,12 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     sys = sys_for(d, thing)
     prefix = prefix_for(d, thing)
 
+    if thing == "TARGET":
+        abi = d.getVar('ABIEXTENSION')
+        # arm and armv7 have different targets in llvm
+        if arch == "arm" and target_is_armv7(d):
+            arch = 'armv7'
+
     rust_arch = oe.rust.arch_to_rust_arch(arch)
 
     if abi:
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index f6babfeedaa..4c026b1f388 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -8,15 +8,10 @@ python do_rust_gen_targets () {
         features = ""
         cpu = "generic"
         arch = d.getVar('{}_ARCH'.format(thing))
-        abi = ""
         if thing is "TARGET":
-            abi = d.getVar('ABIEXTENSION')
-            # arm and armv7 have different targets in llvm
-            if arch == "arm" and target_is_armv7(d):
-                arch = 'armv7'
             features = d.getVar('TARGET_LLVM_FEATURES') or ""
             cpu = d.getVar('TARGET_LLVM_CPU')
-        rust_gen_target(d, thing, wd, features, cpu, arch, abi)
+        rust_gen_target(d, thing, wd, features, cpu, arch)
 }
 
 # Otherwise we'll depend on what we provide
-- 
2.34.1


