Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C0CC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 10:11:32 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.69215.1701339087641105000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 02:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g8W9MVZg;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-54bb9024378so683847a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 02:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701339086; x=1701943886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cZnA3OdapVlfVZRspIl/k+98G3N552tMVRfF4jeAiUs=;
        b=g8W9MVZgTOasxTF0ups4ysF41/nBcxF50CipXD/goG2M44E2wQfkX1wv2c5s8emKd8
         ruJjzU7yyXGbvUbj+QJc87GxFcjWjG2VZpBF1W+CbYI4cz1Zb+veqLDkt81K7msEKtRK
         5VANLYgEbOTMCNzavcMBv53dMXUlwiDOT1CsvajRYnaZTkEd9hjwK3gNHAKMoHlnxYEW
         laBzwX7hS+QzrTuz93hKBZ31R26WZ/larAQLxIQYYNYHl3FekRXA6h017p2LWSRRd2PP
         HfZssH7I09QgwqnIwEDkntaL96f5e+T0VkinkVNohLbL3r/HhU64DOC6XLtLc5c9Y3zI
         LoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701339086; x=1701943886;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZnA3OdapVlfVZRspIl/k+98G3N552tMVRfF4jeAiUs=;
        b=P7h+XQ0Od3ap60waVjq0yd2JA70Hm0ShekrpWc8+STeJYydFMtXLdCBqqFulSxrsCs
         3LeUze2ceKpe5ZTRYiNP7AUQJJuIG7NNq8WVGyFQHrBbYj+uFcWuD6sDgbaUvhHaGTfb
         YSnyI9jDcgK88dS+xSQB5IPuo0fLwGC9qpBh5uJCkxpmcXcJ3uiBFkIk9+d1oANe5ljG
         WT2O8fEx3FEpSBR5DBoV+p0vNGpLokmTzsrcZyF46RmVFC2N2CPmzLFsIHH6Lt4hysRG
         zvow/S3I+T/R/79hyCzgi+uSZHgRqsNkWYcyP010x+byWAcKrwIlISQoM7nMViG/4oEt
         stWw==
X-Gm-Message-State: AOJu0YyLLp3CmoqUBCWfpCqaUhfYTLy7xanXGwAPbbhbgcx+lF3nx3WH
	S3PafqxzQ6at71WIF9qHl2Tl4b3itOM=
X-Google-Smtp-Source: AGHT+IGYOnoibOFSbUwRZ56ed4OOZr10Pm9YtO8L0Ed8q1dmcoNU2NzeeUx+Bq8ZA7XA7DY34YCtpQ==
X-Received: by 2002:a17:906:24c:b0:a18:5d42:991e with SMTP id 12-20020a170906024c00b00a185d42991emr1380854ejl.11.1701339085734;
        Thu, 30 Nov 2023 02:11:25 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id r18-20020a17090609d200b00a015eac52dcsm497191eje.108.2023.11.30.02.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 02:11:25 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [kirkstone][PATCH 2/2] rust-cross: Simplfy the rust_gen_target calls
Date: Thu, 30 Nov 2023 11:08:43 +0100
Message-ID: <20231130101010.1696-5-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231130101010.1696-1-jermain.horsman@nedap.com>
References: <20231130101010.1696-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 10:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191492

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
index 3cf8a70470..3efec3e72d 100644
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


