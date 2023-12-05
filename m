Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84980C46CA3
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:29:00 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.101911.1701786539589934596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:28:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jr76r5o/;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-548f853fc9eso7329967a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701786538; x=1702391338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KoQB5UUyalI/tNQk38O1jleqiWnR0V9P4+ctVYd9N1s=;
        b=jr76r5o/Ww0TZtYwtlqEoH7Wk9IRBGGA5wN80ZfEN2Eo9lbqQzz2huijkEM8DJ4khJ
         IjF7sNTLnpCcjKX1j/sh4Igt4xf9OQ4N0osNerIp2vPrlO1hX/GCP+dVKxXX8O854z5Q
         L75A+IRjqw5x18FVoNQo3kX/nW28kMWRGEmylJAEbVU1IcV2YPT4BWjo7t1e2a7kC+WR
         m2U02R/UtmFiF528SDMLCpm3yPDhwmJJ0iEUcLRyUytevoy8J78zXrI+jz8JRmg2BlBS
         w++OvE/VbW2uUjDQFROUBovsA9gneTFb3F5V8jJwQ3gBsalR3ekgW/tWl/AkmWutSyXk
         iPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786538; x=1702391338;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KoQB5UUyalI/tNQk38O1jleqiWnR0V9P4+ctVYd9N1s=;
        b=QHiqlRSKeVcUqJTmTnHzb6vuagg6W3+GOKHPZUEQ+OIAxyyntxyXWbOAb19wv4ZFUr
         0ZZAqnCtCdlG1kppHwOup0Rvz5gDEbWu4zUXTIHD8I8sgMrx1us29t1tatITiiU9rqoh
         Ypgc8m8a48yGDDF+AIZlk8rWiS9z/ZrOKFlaZJhPU6jvzrY5ZEixllXa/Qjksln6K9vj
         7ryx6xXteg5FSAztsgZR+T2IS5YOSo7gRk4UxQOsIem/+Bkz7QKxrgUOPcNnxi43fe/d
         6FIbgEZ0mH1/GnUJdzO3Y1NLwi19mUXEN7jmdesPZBh2zdpwISFSSPrc98rimaPWGGYw
         THug==
X-Gm-Message-State: AOJu0YzTM3Q63Ynyhb3XTxL7z9ALsdeeFEwChnBQOZPL/xy+stCcXWnM
	+gzCN0F1feu5btq9/lXBT5d1QCBzUa4=
X-Google-Smtp-Source: AGHT+IGG8HiNuUi8gvTOu2A33UkdBLjRIT2I0acPJKopF+bOqwU6TIpvAumq2k87XEU3LqUsJHEauA==
X-Received: by 2002:a50:d4c5:0:b0:54b:c09e:ff3f with SMTP id e5-20020a50d4c5000000b0054bc09eff3fmr2025850edj.23.1701786537821;
        Tue, 05 Dec 2023 06:28:57 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id v12-20020aa7cd4c000000b0054c52a78f56sm1174043edw.56.2023.12.05.06.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:28:57 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [kirkstone][PATCH v2 4/5] rust-cross: Simplfy the rust_gen_target calls
Date: Tue,  5 Dec 2023 15:27:19 +0100
Message-ID: <20231205142810.826-5-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231205142810.826-1-jermain.horsman@nedap.com>
References: <20231205142810.826-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191826

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Match the code in rust-cross-canadian so that further simplifications
can be considered in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cb62d0a33777cb9afb1eea5f736a2580ce50dc7)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 12 ++++++------
 meta/recipes-devtools/rust/rust-cross.inc  | 16 ++++------------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 3252827818..a73367bbd5 100644
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
index 4c026b1f38..2e47a3aa5f 100644
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
2.42.0.windows.2


