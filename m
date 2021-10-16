Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868F5C433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 16:49:06 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.12796.1634402945375887505
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 09:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CVRll5K0;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id np13so9378776pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 09:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n2ukGOFxMO+Drn7Kz5yUUhZyM9wMS3Nf18iTWWNOaUY=;
        b=CVRll5K0IrVkppM9n8fEALTccslGEx6pu7x6tumjvLCnQf+WG894/Mn2qVVzgn5rNx
         zcBOWErYpB6xhBF7urD/diWYN12BiWeVhwS2Ye2xk0j0en14ze35XWq8d1LvxTJvlaHs
         n+K9K8NqCo9H0Kf2WIfyyFlwCTW9yrUkXAgl8hVufI0Ildw8eY/qccx+ge33FvyI9a+s
         jKzAAT7W1QgVNVLEL75VQkuM7XM2/tLmlkIYlWpC0+6cVbVd2t1G6ninyxgviNOgwccG
         WqdtZPYNGwAy0On9ry6iksugG21oGaXwwQKxH9qlcj303ysQvWgWQfCEvxkICiF8rEbz
         bH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n2ukGOFxMO+Drn7Kz5yUUhZyM9wMS3Nf18iTWWNOaUY=;
        b=u07xInJ3SH+O+IRkqYUhinsFUZIS9oKLI9mgE7/2J6c7khQC7TX6qgF63zWy/IOICE
         lppOV1bQVbImfcOIaABYqvBCTzi8/g1jPlWRXtShDKxw5ko4J4K1/mVB8uDol4ENnznw
         Li4gB0huSyPxLC4+IfGbhrwSjhE6sj/Hk0XTH+XpvG5LSf7lV9KPS8d1pvS0WBWZcvqn
         erbvRhvfIUUQf+zJCp7t7rkBW1O5pBFcQu2brcRNzACndwjlAjUe0/0CglhggfwolCaB
         /GkB6UOrksa76UhXixrM03PdFebda4uPTn1gnzdhrFcrNQ1XD/NJ5L4nvYbG/1AGPZLf
         TIpw==
X-Gm-Message-State: AOAM531/74u/nIIADFXmrDTs3Nd1xI97aETYZaPQhkzSarz2WPsNp8vV
	o9Ii5QOS34bPn53jUsw/kQ2DFWnXyFG48A==
X-Google-Smtp-Source: 
 ABdhPJwgiu6b91mXIXyBKkcGidstqcJG5Y3UN8YZFi+F45KAmb9Kg1xm1IPQ7Mx1hk4Ch3jsQWJYug==
X-Received: by 2002:a17:90b:1c06:: with SMTP id
 oc6mr13780016pjb.142.1634402944450;
        Sat, 16 Oct 2021 09:49:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 y20sm8329811pfp.68.2021.10.16.09.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 09:49:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] opensbi-payloads: Add dependency on kernel if fdt is set
Date: Sat, 16 Oct 2021 09:49:01 -0700
Message-Id: <20211016164901.1103361-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Oct 2021 16:49:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157015

fdts are built as part of kernel, so add missing dependency on kernel
deploy task

Fixes opensbi build errors
| make: *** No rule to make target '/mnt/b/yoe/master/build/tmp/deploy/images/unmatched/hifive-unmatched-a00.dtb', needed
 by '/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux-musl/opensbi/0.9+gitAUTOINC+bd355213bf-r0/git/build/platform/gene
ric/firmware/fw_dynamic.o'.  Stop.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/opensbi/opensbi-payloads.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
index ce537c0587..e590a27573 100644
--- a/meta/recipes-bsp/opensbi/opensbi-payloads.inc
+++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
@@ -30,5 +30,7 @@ def riscv_get_do_compile_depends(d):
         return "virtual/kernel:do_deploy"
     if 'u-boot.bin' in sbi_payload:
         return "virtual/bootloader:do_deploy"
+    if sbi_fdt != "":
+        return "virtual/kernel:do_deploy"
 
     return ""
-- 
2.33.1


