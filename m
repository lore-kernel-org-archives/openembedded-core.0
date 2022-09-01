Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC0FECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 20:32:39 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.17651.1662064352721485703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 13:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EIWqgxu8;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id h188so124533pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 13:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=2XWtfCF7odzviwSNhMmv0IH8rnwkAMozHOOpF0IGED0=;
        b=EIWqgxu8xhxKmg0rVwUCMqxsCjQu0s3yoOJ+mFdAQF14w3NAlQ+Cd59foBOa5DEIM4
         /aU/B9Y2LFoToi4UHOwAQII4UR9iecrlgFEPU/XkswXAh2hGr48xzA/6wL//nTeb9QrD
         h2b2gbgJwhJYJUwrHB0IO8ieGF/RbOHAMKyALZx408asbSM2Ra7qbhgr9rifPJ923AQJ
         /lXDiXChDG98cpi0M3N6MLjlqcf08/PQUVICg76Drg4R21CGSeGT3KM9POS8uDiLVMgt
         rHnHCcqjybJiT6wE0djCfnSlNwbsw0DmfcHioAwCkvzjasMFPk9rBXqNuX3/D/KPyR7R
         /IIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=2XWtfCF7odzviwSNhMmv0IH8rnwkAMozHOOpF0IGED0=;
        b=Br1t/z3VzqVXqEvHpPGV8ze9aeSv12lOI/blus5mwAaiIXKKQv1xlM8S+pGuzsajBj
         tSYJXNjL54t9K1HuLH3t6ITtD/Yq6vb9lS/sDY+LLzddloNSbjNTUEFkJF98B48i+mkg
         KNLBq5MluATF9ZTjIffr7Vfq8dwXkWVJhT0y8KqbxAkr43gLefz396nwoOuVxlurY1Sw
         gezjyjYntzzIi6cwfTAAWqyAYsu2Jkc7VEPajzht4wQjcLgtvsEH1SwahVfSGfs4rYSt
         Fjd1l5jRqZIAStq0h8Ibzwwj9COJnL3drI+KJujRtnAtCDABrjDSGkTDXMioTrFxi7GC
         eseA==
X-Gm-Message-State: ACgBeo1AYG2L/Q7xQ8GhlHfpu5aKzfIAbv0z9PWQs4/JLZdiOnLCur6s
	Wztwflt9r8okzJQES9QyNkrRg073BfiRWw==
X-Google-Smtp-Source: 
 AA6agR6FZ+aG5rqK5BQ8PTXVUFaVF2iW8+IjIOUqaTmERKWfbnkYhvdttCfZowHNqrZn58zG9vjKSQ==
X-Received: by 2002:a05:6a00:23c5:b0:535:5c24:68df with SMTP id
 g5-20020a056a0023c500b005355c2468dfmr33009323pfc.62.1662064351859;
        Thu, 01 Sep 2022 13:32:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z188-20020a6233c5000000b00536aa488062sm1099pfz.163.2022.09.01.13.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 13:32:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] rust: Use libc++ runtime when using clang with llvm
 runtime
Date: Thu,  1 Sep 2022 13:32:28 -0700
Message-Id: <20220901203228.274513-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 20:32:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170227

meta-clang has options when it comes to C++ runtime, default is to use
gnu runtime, other options are llvm runtime and android runtime. This
patch helps when a distro is using llvm runtime for C/C++ runtime. It
informs the rust build system about right C++ runtime to configure for
when such a setting is used.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase now that 1.63 is in

 meta/recipes-devtools/rust/rust.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 284347dedc..3a7b993ee8 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -107,6 +107,8 @@ python do_configure() {
     # [llvm]
     config.add_section("llvm")
     config.set("llvm", "static-libstdcpp", e(False))
+    if "llvm" in (d.getVar('RUNTIME', True) or ""):
+        config.set("llvm", "use-libcxx", e(True))
 
     # [rust]
     config.add_section("rust")
-- 
2.37.3


