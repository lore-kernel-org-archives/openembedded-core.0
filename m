Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441A4C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 10:11:22 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.69210.1701339076627159454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 02:11:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6PQs4J2;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a132acb67b5so102105966b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 02:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701339075; x=1701943875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ji+dGUPFBLz19p4K1/58jxud2TAHvrFYQK1jmwW1ibk=;
        b=O6PQs4J28hd3KBb3kDjcsd+yPa7tLS2BG9uMWRvb+RjK50vt+x7D3FG+NjgJCPAi+z
         x5Lfzqg/pFFISpZhQMNB3mEBduFfgz1nAuwNevFVejxmzPQypuqrhi8lWYmb5X4mOmcP
         cj04bdIAUyIAYBoS0ZhqLeQr1ndDG+yXhyxAdcAUhPPssaB8M5eOzXJ6VDFeEb1m9vci
         abSU1iRZ8B1hO85g2yRq+hDbmlHpLsoY6hk8G06A4VJhWQLi3/QHh1ycrW0BUZK6UueD
         fhi+Q78TW79A0aiU0O7fpqP2BIcC9O+k5d4E2lW0AHx3rAYxfgajChoz1mEeBG6pPpFA
         V6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701339075; x=1701943875;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ji+dGUPFBLz19p4K1/58jxud2TAHvrFYQK1jmwW1ibk=;
        b=pS/eEVy1pfnvVD3knJzXOKAAU+usn9/VZTPLU1bz3GPlHgJbnVJMMXAoZDZALvM1u8
         qTkJNlBGyESE8eivTCoNs8yPL+AiueT+1snrzPnhud8kR+z5/cS1a3U8vmUGCgP/fhbz
         yK0aN9Lgp8tBnU9QEOdYNbHavfLVJL6splQEcBp9yWUaxx37oaam32uWjcM9Bu81bXfE
         IUxYPtzik0qLhGI5NtY5JifaTfkQy+A12PnBoMH0/SPxyGjtpF9hD65Pwr4lhhz/msE+
         H7iQXLz66twIbraIf1ooY7H7Au3+LsUbV1svHBxlLhPqORbNWW6Lh7D4WZaQf7swB1Eh
         L0aQ==
X-Gm-Message-State: AOJu0YwPkeihqVaAvByx3f7iwkNAJbVvkzgt3j8pP15c6ubnGZ0zq/Yl
	jYbOvHUNMd1gtu42d8p6LeKzyNuj5Gg=
X-Google-Smtp-Source: AGHT+IGiY+F08Oq0wKROQWZe6s5FZkDreG/urd4hP20pWmmr24LWGFfQPGacHb02tDnwgR/1txnrYA==
X-Received: by 2002:a17:906:8d2:b0:a18:db59:d060 with SMTP id o18-20020a17090608d200b00a18db59d060mr565512eje.66.1701339075026;
        Thu, 30 Nov 2023 02:11:15 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id r18-20020a17090609d200b00a015eac52dcsm497191eje.108.2023.11.30.02.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 02:11:14 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [kirkstone][PATCH 1/2] rust-cross/rust-common: Merge arm target handling code to fix cross-canadian
Date: Thu, 30 Nov 2023 11:08:41 +0100
Message-ID: <20231130101010.1696-3-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231130101010.1696-1-jermain.horsman@nedap.com>
References: <20231130101010.1696-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 10:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191491

From: Richard Purdie <richard.purdie@linuxfoundation.org>

rust-cross had special handling for armv7 targets but we also need this
for cross-canadian. Merge the code into the main function so everything is
consistent.

Also then fix the arm definition to be arm-eabi since ABI is correctly
being looked up.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ff3c3dbbd2bf1bb7bb70b55cca203e9eedcf14a8)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 6 ++++++
 meta/recipes-devtools/rust/rust-cross.inc  | 7 +------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index db0bd8fc1b..3cf8a70470 100644
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
index f6babfeeda..4c026b1f38 100644
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
2.42.0.windows.2


