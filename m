Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DFBC10F04
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:29:00 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.101908.1701786537337315572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:28:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N3N/0Vpp;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54cde11d0f4so2651962a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701786536; x=1702391336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UYSh2pPU5ePpuh1G8HklnMGdnlM0RFj8BrVpBlu823k=;
        b=N3N/0VppEXXO0+A3rLFd2iF/jXaCJdHs69al63otB+UZY6jutByv7/z1w8xSmJjyIF
         BICFlYPjQfJdNFH9YGfHNaoEJ+Vxrl+uNLqWHF0VeH8c0BFtY3k9CiHydLI7yqR4DyvG
         OWWb0gAKluxH3/97nLlzbDjHxxzcckjDTnKDonsmBTlMyqx5aLujQwBwxHinyTN/gjw+
         sqOk0GhPGWZNPtiX41k1jUGnyKu84hpw5GOI40R2mpBVZZ+5oFtILZ39wccaH6kTN8f3
         6qzeUE9TTSX94aIN7tbs0imcVoFGnKfD0dWz7hBYwVLPHYChbHzvw+ZgcPCQbKv7BDvB
         TQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786536; x=1702391336;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYSh2pPU5ePpuh1G8HklnMGdnlM0RFj8BrVpBlu823k=;
        b=m+XzduEVnk5DQT71xh9sm4VLpL44Aih+/gfFLMthzSXIyPcQGIdBqonk28LV5wgkZx
         Eneg1CKHeYggF8TOtgH88bJlVU7Gt5aXw3WgebZfLPEAzcjnLEuZv3+Bi+4d5dn4JdUn
         1Vn4Woua9B1eN6wQJuZbYseSs82Z6NfUrPwj70MVS39R/rCxdJ5dBFN/py3x4G+1nZow
         LmFG73OTDXYYjTjnh/4L93AsGCg3E2amo+rlVQsyNkwMsJIMkYVFoR6Wz2jX6UcYG2H9
         cQNKce2+txqVB8im1gvWc+/Zm/Xdxa7MLsGv35Jsakp/W/C0Skhd1aWiMmWOR7/PP5lz
         Ts9g==
X-Gm-Message-State: AOJu0Yw9Kg5I5xx69r+ij55DqfidJQfCR86TXAXasudD0/2a26Ls3ZPt
	ZDewYnTgzEKEd7OTiNR7zyv6CQ5mv30=
X-Google-Smtp-Source: AGHT+IGjDgTks7GWTIwuXRxX6IX0z0sORFlmnC4ObtkK3H3opHIgB1j9FQ7Kf1h168Hibp6zJPBaDA==
X-Received: by 2002:a50:9b12:0:b0:54c:312a:c393 with SMTP id o18-20020a509b12000000b0054c312ac393mr5166305edi.1.1701786535429;
        Tue, 05 Dec 2023 06:28:55 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id v12-20020aa7cd4c000000b0054c52a78f56sm1174043edw.56.2023.12.05.06.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:28:55 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [kirkstone][PATCH v2 3/5] rust-cross/rust-common: Merge arm target handling code to fix cross-canadian
Date: Tue,  5 Dec 2023 15:27:18 +0100
Message-ID: <20231205142810.826-4-jermain.horsman@nedap.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191825

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
index ac00fd3d43..3252827818 100644
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


