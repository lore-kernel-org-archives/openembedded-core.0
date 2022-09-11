Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A09ECAAD3
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 23:28:55 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.1796.1662938928099823073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 16:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GGUw+zpa;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id h188so6668494pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 16:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=1nrPFafV6Tm5OqGUSgWMupMGZGwSMBnUpenmN/Pq6TY=;
        b=GGUw+zpai2OSsJbFlS8btXApWe1UKROsNg839ILE8+o2jAQAOJQB0bv4q6REmkIhH/
         wvZkJgBMcH0ejpH5PFCo3bj+L3/pHglvFLnboRaxeI0QPU/Qcfy+F6g0PMZTaOsYTXpK
         229J6iU3Zjntl+7w/OUN0gRDvV9MDfM/CBhNit3Z07lsKiC4ZgfqQAqJRhLvXhk85e5W
         /6F79uSRYRdFIQGeGFjGUcRggfxggVTv0DOCyt8+087XJBL9VQz6de/fJBh3hZsHahE9
         x4z6UCxXkms4AnJf6tfJITTqTW8KuwgOAgok08dDQ9yeR6m1YqgBvaPI44pUDWH4g2eL
         ViXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=1nrPFafV6Tm5OqGUSgWMupMGZGwSMBnUpenmN/Pq6TY=;
        b=AQX63elJcPwyZ9LLqudrrU8YHB9tIe+kfsp0yCVMe4bfRZfknaNM2RB63q9T37i7gl
         PJRbWfs0UsR0eeERFF+aILRr4PkoOV8W5VJJSQdgp5WNSnjep9PVywSnT9CGGplgiAHV
         CNaUrP09B8mnTcoDa7FqQI1rKPhstaJb3Jea5GFIQGjhpOwZlJJbhwYs4zSV3VskMYJ+
         gbDQ6Kwnwdx/SEdKNlNEeNUOqUeZqUsiYHeH7QBpm9bM8t7MFbdvnGZYieiQxpa8+O+4
         GTqcdE+2kIcFSeFeGKuXdTB/WdH7ZJV/ZrdWai89CaJNr+Sjk6RHNyIpXHa+eB3vKzzm
         6LkQ==
X-Gm-Message-State: ACgBeo1mTw55AEGpj9U7h1QCFr2hzA/00DDl+/rdnEV+1imRxGHzhEuB
	A2xqz1c+ZQgwM5OcU0lQj/Xzo89LCp0s6Q==
X-Google-Smtp-Source: 
 AA6agR5dE71hfoAdlmGpYQXkgfbWZldabNF4bd+yxOfeeqTiGifa92fFxECwhg1uywVlQnA1AnD7Rw==
X-Received: by 2002:a62:5443:0:b0:53b:b934:ee8e with SMTP id
 i64-20020a625443000000b0053bb934ee8emr25252946pfb.10.1662938927296;
        Sun, 11 Sep 2022 16:28:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 s12-20020a17090a760c00b001fb35e4044bsm3862200pjk.40.2022.09.11.16.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 16:28:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] rust: Use libc++ runtime when using clang with llvm
 runtime
Date: Sun, 11 Sep 2022 16:28:44 -0700
Message-Id: <20220911232844.680121-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Sep 2022 23:28:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170523

meta-clang has options when it comes to C++ runtime, default is to use
gnu runtime, other options are llvm runtime and android runtime. This
patch helps when a distro is using llvm runtime for C/C++ runtime. It
informs the rust build system about right C++ runtime to configure for
when such a setting is used.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase now that 1.63 is in
v3: Use renamed variable RUNTIME -> TC_CXX_RUNTIME

 meta/recipes-devtools/rust/rust.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index a33eb00e25..4e78b5ea6f 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -110,6 +110,8 @@ python do_configure() {
     # [llvm]
     config.add_section("llvm")
     config.set("llvm", "static-libstdcpp", e(False))
+    if "llvm" in (d.getVar('TC_CXX_RUNTIME', True) or ""):
+        config.set("llvm", "use-libcxx", e(True))
 
     # [rust]
     config.add_section("rust")
-- 
2.37.3


