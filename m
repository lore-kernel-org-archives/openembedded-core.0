Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591D7C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 22:02:51 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.55422.1643752970343032621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 14:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W9smk3mi;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id a8so17085712pfa.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 14:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9G5PFrelRYJJCaco/2HL/ZO2qT68Q+P5v5CszgBDYjM=;
        b=W9smk3miNGt7wnLJvYywUwoQcy7UgWOQPq2JM0/S/lC5Jx2JMLO6KfCS7U0RyyKA8C
         z/rY3GB0nFY6MUkbYCq656I9+/C9THTcT8bImocq1TONxw/w7EjNT54D1fx3U2YMEs0o
         +81OyynZReb98A13bz6/O3BedL+qBvpRjEgFJ9etEYY35w666srKbQsH2GnwG5jT0C5P
         V12SZYsanZO4JCDAlsUyn8uIGTtv/kAcoBRTA509depLHRrr+ac1w4bkr2lASZREsBl1
         YUQfCduS744n8ZXNJ+fr5ns0HqoRTaq9MJ3j/GOhWGRBNhbOVIU8hba5apB3SguVWDYf
         zxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9G5PFrelRYJJCaco/2HL/ZO2qT68Q+P5v5CszgBDYjM=;
        b=fyE3rWFeQ/CRU2zlSeyqMdVX2mdrcQKQUpWummgZhocSW8C8PMcHHOaA40iHsWETC/
         wvuFH6rpvaDmKhqy7CPZVVJcUooPusbF43sqpyVMN+ZQ2gqCz3dvMilAv9EJh9kluiFu
         bINZ5TYKof1rquouTmKadyTIZNDgr3/eTFeFtjF8o4liK3PUho8a/lIw9WalA4+j25qN
         LcFAVInq1z8G+2Z4kju833uEjWqpcfQQ/OjSReaUykEntYfp+4RbqGJdpo/fX5yhRVqg
         O5W8cInLYjrCcSrF6Ky/kPbMFXcIEoMN5TRkZ3cYMpoB0q9GsvVEPrnlqXLOrl110enQ
         kwTQ==
X-Gm-Message-State: AOAM531+NcneRRUJDwGMyV4RwAHA8AnNXsodg6+5M1MLYxqXOyZGJr8f
	Dv5B7hJZx+1G9OlQItFLLCUJwInrgU3mAQ==
X-Google-Smtp-Source: 
 ABdhPJwjo/Dd1/HeTYusLrQmX0qbX7nYaey/Y6kA6g0BAc1rFsTsw7eIuxRzc6zPA3a91rwTMltfVA==
X-Received: by 2002:a62:1d4a:: with SMTP id d71mr26868302pfd.46.1643752969238;
        Tue, 01 Feb 2022 14:02:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 k16sm23880864pgh.45.2022.02.01.14.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 14:02:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] ruby: Fix build on riscv/musl
Date: Tue,  1 Feb 2022 14:02:46 -0800
Message-Id: <20220201220246.2141337-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 22:02:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161168

This fixes a build issue that started with 3.1 upgrade
Fixes
| ../ruby-3.1.0/vm_dump.c:916:38: error: use of undeclared identifier 'REG_S1'
|         dump_machine_register(mctx->__gregs[REG_S1], "s1");

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: document the need to patch musl

 ...ine-REG_S1-and-REG_S2-for-musl-riscv.patch | 34 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.0.bb      |  9 +----
 2 files changed, 35 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
new file mode 100644
index 00000000000..f7b7adb3fdb
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -0,0 +1,34 @@
+From dfb22e4d6662bf72879eda806eaa78c7b52b519e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jan 2022 20:29:14 -0800
+Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
+
+These defines are missing in musl, there is a possible
+patch to add them to musl, but we need a full list of
+these names for mcontext that can be added once for all
+
+Upstream-Status: Inappropriate [musl bug]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ vm_dump.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/vm_dump.c b/vm_dump.c
+index a98f5aa..957b785 100644
+--- a/vm_dump.c
++++ b/vm_dump.c
+@@ -39,6 +39,11 @@
+ 
+ #define MAX_POSBUF 128
+ 
++#if defined(__riscv) && !defined(__GLIBC__)
++# define REG_S1 9
++# define REG_S2 18
++#endif
++
+ #define VM_CFP_CNT(ec, cfp) \
+   ((rb_control_frame_t *)((ec)->vm_stack + (ec)->vm_stack_size) - \
+    (rb_control_frame_t *)(cfp))
+-- 
+2.35.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.0.bb b/meta/recipes-devtools/ruby/ruby_3.1.0.bb
index e250164d2c4..7a04a364326 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.0.bb
@@ -11,6 +11,7 @@ SRC_URI += " \
            file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
+           file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            "
 
 SRC_URI[sha256sum] = "50a0504c6edcb4d61ce6b8cfdbddaa95707195fab0ecd7b5e92654b2a9412854"
@@ -36,18 +37,10 @@ EXTRA_OECONF = "\
 "
 
 EXTRA_OECONF:append:libc-musl = "\
-    LIBS='-lucontext' \
     ac_cv_func_isnan=yes \
     ac_cv_func_isinf=yes \
 "
 
-EXTRA_OECONF:append:libc-musl:riscv64 = "\
-    --with-coroutine=copy \
-"
-EXTRA_OECONF:append:libc-musl:riscv32 = "\
-    --with-coroutine=copy \
-"
-
 PARALLEL_MAKEINST = ""
 
 do_install:append:class-target () {
-- 
2.35.1


