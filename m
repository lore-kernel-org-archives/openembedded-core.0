Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B33C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 04:41:46 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.8585.1643172106134750933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 20:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o+7O4Y57;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id u11so21343297plh.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 20:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UCA9zU3X8U41/7U4GMohWusPI8ezr2FhRxtgk830CxE=;
        b=o+7O4Y57/2w5i9xab2/BmvS7n/pzuPWnozwyTcmNlTMMlanwa/l0BGtOqc32ZfHSwd
         otBQW+7P+7aw0i2rnxVQypl1onVlCe5FO2smYfuLGl5n+N/rnXp7cGUCPUmDD4+HwR5e
         KMy+rjdgUkJoeshyL2SEcS3pkrj0z9TsHDJ7m0Lzn19Z3uXgsXeBDkaX3Vsw8D80MdU3
         8VymvhXzAbrvMGIrPJ5Im5HtkLHV7S1I8ftRy9Neu9NaD9sa8EIK0eNmIvsxbRXhIabw
         oT02shQ/GVDLO9zvAmBFyXKqAMpKVxUNiB/4V5VIn0Nkg8vknp301BjT/6tTmY9t5bb+
         B4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UCA9zU3X8U41/7U4GMohWusPI8ezr2FhRxtgk830CxE=;
        b=ooSESiR74VuH8K4/fupnW3aFJdv0MGA654RcAg3NbF+mV+z/ZUMylE243mO2ucGFzV
         qz9kn/vHc0Eq+MeX5/zRM0TaIgW1gJWo7ojt9f2+Ng0P1Lu3mko7YFtv8p8RHGWRLfg/
         JeihdvwGGAyc/14rVWYY1XMZWch061wYl9ixHGgEQV9pApWA/fR0fTAGwdp1/N6ohs38
         a6inZNPDPO84XEdGwYlRc3gzWHQgecOXTtvogkr73dUO6bf5wLEibm6MIeOL80ApYAtO
         +1Pc0HnyVYyM/CtDhXgdU7MYYlvInCH7Qr/kpQPBXeXlybO6pPv6R72WXcmPIJhnFMra
         Q8VQ==
X-Gm-Message-State: AOAM533Jqc2KEhPNxjgWwZX0jBZyDARTJ++hCqRhGASnnBopD0wn8ETg
	lLnnqdbBI0+tZseqbdFPVj6DG/7oeo2+iQ==
X-Google-Smtp-Source: 
 ABdhPJzKZy3/ZRfzPee5UwARbQyEdPzzBbrAG5zdY47Pe1e0MIdcOEXwwHJZ2BkaKSfZM0AtZGrXVA==
X-Received: by 2002:a17:90b:354f:: with SMTP id
 lt15mr6934954pjb.83.1643172105330;
        Tue, 25 Jan 2022 20:41:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 lt17sm1753222pjb.41.2022.01.25.20.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 20:41:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ruby: Fix build on riscv/musl
Date: Tue, 25 Jan 2022 20:41:42 -0800
Message-Id: <20220126044142.2409754-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 04:41:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160956

This fixes a build issue that started with 3.1 upgrade
Fixes
| ../ruby-3.1.0/vm_dump.c:916:38: error: use of undeclared identifier 'REG_S1'
|         dump_machine_register(mctx->__gregs[REG_S1], "s1");

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ine-REG_S1-and-REG_S2-for-musl-riscv.patch | 30 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.0.bb      |  9 +-----
 2 files changed, 31 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
new file mode 100644
index 00000000000..8821325c0fe
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -0,0 +1,30 @@
+From dfb22e4d6662bf72879eda806eaa78c7b52b519e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jan 2022 20:29:14 -0800
+Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
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
2.35.0


