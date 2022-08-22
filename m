Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F09BC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 21:10:37 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.23962.1661202627839088870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 14:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p7ZIyIsT;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso12619943pjo.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 14:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=A+lZp+lCm0fmXbjgEfvPNkSZ8rN4NRxx4Eh1Nv8Ua14=;
        b=p7ZIyIsTmKtylwMTFvd46L4W+siP/2x7AuzwXxy/EZvD7jG/SPrHgjVGWIIR8ndwPN
         yH6VDUQh8ubmaaXzUlbBytI7dYqg6jnBnDIUPSZ7IWa/eX6GLR5kG1AWSqcIDOT5SZmA
         eKGFZfKQje2lbb+4ppodE7lIocnrt0fl7NQ2DUy514/9eR+2I+E4ny4z3HFS1xQtevpS
         jgKhaTkdpoymsjp73WH62RwlxZXHB1zdwWGTAY/6hnZvhsKtssZbZ/0GU6T/IVHVi8M5
         cIEuDzCmAQCqoPvcWP0BaAQebrfGeXe54//RQ3KsHr7UsRWgWg6s2Jdz/3dwen79AR0w
         3HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=A+lZp+lCm0fmXbjgEfvPNkSZ8rN4NRxx4Eh1Nv8Ua14=;
        b=zTM/8LtNdb57Z0L/LYZFYXuTvc+wjnAqVqqryVLk5BrQ7wM3pLZ1dmHreWzPntzMUH
         6RzOeC+bDt6P+CkBTlmkWsmPAo7Fjx0Ho3JfZAh1V9xWoIrXHWYmE9IRErTP7ye5Wbtq
         aZDAUZQ07EuDEPNLStWWgJMCsrJufyEhDewvSFtfQewIUS8nHnKGejdealXuvBC5bXMF
         YiPCMU91kaMaAtv5S8O08dnQHDUvXTcjgFJayLCnSlrUmRpoJHkQ2OMM1jwx7l98wTm8
         myYry88b8xGl9UXUO0bHHW0watN+yTVkfv1zbAEeof+bQjWjY4L7rdtc/msT6kiEB2R/
         j9Dg==
X-Gm-Message-State: ACgBeo3gv2+00RN//ZR5x/Rucn6+YTVNbDQ59dSDCuySvksXDgT4JetY
	ZVOH0Qww+xaJ0a/BxfPRf6CnBhenLZ93Zg==
X-Google-Smtp-Source: 
 AA6agR741h7CKJLGyqIPeeeEZ9QJI3VJzpKWMD5FAQbij5Tq2+fHWRhkbf5pWEO43l7YvluIAbabow==
X-Received: by 2002:a17:903:32c3:b0:172:f1c7:732d with SMTP id
 i3-20020a17090332c300b00172f1c7732dmr4585680plr.143.1661202626828;
        Mon, 22 Aug 2022 14:10:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 y3-20020aa793c3000000b00536562f4c03sm5224191pff.146.2022.08.22.14.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 14:10:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rust: Use libc++ runtime when using clang with llvm runtime
Date: Mon, 22 Aug 2022 14:10:23 -0700
Message-Id: <20220822211023.424801-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 21:10:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169685

meta-clang has options when it comes to C++ runtime, default is to use
gnu runtime, other options are llvm runtime and android runtime. This
patch helps when a distro is using llvm runtime for C/C++ runtime. It
informs the rust build system about right C++ runtime to configure for
when such a setting is used.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rust/rust.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 284347dedc..c288903c9b 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -73,6 +73,7 @@ python do_configure() {
 
     # [target.ARCH-poky-linux]
     host_section = "target.{}".format(d.getVar('RUST_HOST_SYS', True))
+    runtime = "target.{}".format(d.getVar('RUNTIME', True))
     config.add_section(host_section)
 
     llvm_config_target = d.expand("${RUST_ALTERNATE_EXE_PATH}")
@@ -107,6 +108,8 @@ python do_configure() {
     # [llvm]
     config.add_section("llvm")
     config.set("llvm", "static-libstdcpp", e(False))
+    if "llvm" in runtime:
+        config.set("llvm", "use-libcxx", e(True))
 
     # [rust]
     config.add_section("rust")
-- 
2.37.2


