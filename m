Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A663C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 13:21:00 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web08.8707.1632921659886278885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 06:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cT1s7qsB;
 spf=pass (domain: gmail.com, ip: 209.85.166.49,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id e144so3074101iof.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DBfs5T2yWKdM7hDvLODlq3FlLwnPE70BT+ZSkOKJP9M=;
        b=cT1s7qsBH4aOeehrEjT++SxXj2M/L5ZVQxCO5cvBUpozHvKiEQeNaYAj3TXE7ga6SL
         8bXLkEWZJXvJuajFs7NfaRWNtdb+aqVZ0JXqrWWsqMgxFLbxSFBHX7sW5nlZtBGOh5Z3
         SHz+G53KgrvCwi4recxPTBNbS1wMjr5dcr6GMIOGEwKVeFAXZfH3QwsYxO8QqoZz540H
         8A53Rh+pImjSyDl2TUXWQj5Mc6pJ4T2Erms290CYKHZGlkcUb6tq943zPO6ziqNns67Z
         ZsIuJT96qJkhCbm7kua9Gg7msdl+sqL67cytCNzohoV3vsyW2UnmuC4zElv5bbuXs2uZ
         UnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DBfs5T2yWKdM7hDvLODlq3FlLwnPE70BT+ZSkOKJP9M=;
        b=25cBOwTnOqMgeD2faC4kAG46T767w69IF2HZaV7Cia/swSL8uCA+iTnHwToUy+DxfA
         x8yaOhsQO9IhcIuhG1pgTRx+6rbpM5UitvHi+RD27VNxoJ/4I7RyoO7EGdobxM5BasTt
         vSJQSyOndamzq61OzMhRmFSjMv2hiHlpiQQi/RSLqGzDM5JW6OartA9HsS8Ksmles7P0
         S+ryj8oXbXZfINcbPkRLYc7tCRbCbvMsNq9nFN9oxJtAnrD/mWWgQVujFqllyz+Vdym3
         kachcyIvnFUbCArZDUphsf3h7i5ogcAtQGGeFr8mNATNKtQd9rQPMEezMKXN9vwBB7rP
         JJVQ==
X-Gm-Message-State: AOAM530kuVxaKflLVufv+89ZqrRTD1nZjwSUtjbWysSqbpMBT51jjRC0
	WQI4JcWed77ozfxuhDL+iZUdiK6QnKsaGg==
X-Google-Smtp-Source: 
 ABdhPJxOt+X5bpqrVMzH+1wrhLdjsaJS5YntFMbJTPGScGFFw7lqvqIosahyGFSsAdUaAs5gmtPWew==
X-Received: by 2002:a02:8804:: with SMTP id r4mr9437553jai.55.1632921659050;
        Wed, 29 Sep 2021 06:20:59 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id 67sm1431132iou.4.2021.09.29.06.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 06:20:58 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	alex.kanavin@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] Fix rust-native build issue when debug is enabled
Date: Wed, 29 Sep 2021 06:20:54 -0700
Message-Id: <20210929132054.117151-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 13:21:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156454

When DEBUG_BUILD is set for building rust-native, it generated
error as follows:-
=========================================================
Building : rustdoc, rustdoc-json-types
error[E0463]: can't find crate for `rustc_llvm`
which `rustc_driver` depends on
  --> src/librustdoc/lib.rs:37:1
   |
37 | extern crate rustc_driver;
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^ can't find crate
=========================================================
On analyzing the issue, it was found that rustc_llvm crate was present
at required path. However, it was very huge due to the presence of
debugging information. Hence, it was somehow not recognized as a valid
crate. The following patch removes the debug information from
rust-llvm-native which is built prior to rust-native but retains debug
information as required in rust-native binaries.

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust-llvm.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtools/rust/rust-llvm.inc
index d7f445385b..0f8fb785b7 100644
--- a/meta/recipes-devtools/rust/rust-llvm.inc
+++ b/meta/recipes-devtools/rust/rust-llvm.inc
@@ -15,6 +15,11 @@ DEPENDS += "ninja-native rust-llvm-native"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
 
+# rustc_llvm with debug info is not recognized as a valid crate that's
+# generated by rust-llvm-native.
+CFLAGS:remove = "-g"
+CXXFLAGS:remove = "-g"
+
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 EXTRA_OECMAKE = " \
-- 
2.31.1


