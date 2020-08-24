Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.2094.1598295646285704219
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 12:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cuDnIwMk;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id n129so8496765qkd.6
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 12:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ezgd9ZGTRbxyJc5I67l0tTfTbVnOJzpQFv4ogDyI0NE=;
        b=cuDnIwMkWqWmf0pd1iB59h15Ybws66zH+Izw5ogW9O2wNKtRg5xW5C0FxE8ID9Ct/S
         yloJ341w1KNlXhz2aenAjyL+Zjh7JMXpSOkd6+E4iBoTAPKG8tbparqPPprBX1zbRCtm
         oLHqCPO2ZLVEyOpH9t9IiGds+Ao1hIq3U8e1KsCSJUNpwTysvFw8FC1wDYSB7vNcEpAT
         h5ZUMSfTl6dDWzpERjpEXvqSIGSNuRR6ZbgMZJh/SkYG+AsDygY97S8N8eeYNRF2xDIK
         SLNjcaFc9Ja5GfvYTzvrC/egIYA2ysclFYqbO88SMdzp0rps5ake/2A/NCEaw/DStGKk
         ruKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ezgd9ZGTRbxyJc5I67l0tTfTbVnOJzpQFv4ogDyI0NE=;
        b=kzgOgBJRhTWF5b2BZ4IKjTMcg0WUKDQ9FMNxYgmAU3Dok36/JhKAvmnDENG6gMY4sq
         Vg09SXQHnwJa3U90p+y6/k+xOviO+xDRXiygdwrGgPQWnewSkf8yWbRsbMXZ1AZAP5b0
         pzlcMtYqIxiH/6YlkMBkGfODeZM69hO88uUlR9J4mpfbo2E5NuiSkwkxe8MjfPj811ol
         acqn+xfefJmzRhXm0eRN3ihLeEQ7rlw06MjQYV0PwRLZbgUbv/EmolYF8lHOR4Jvf/m8
         kSSiRhbWNCZUd406R7sbWqNrZQOjpJ9jrQ6LEjqA1krzCXHo/fqDHlrljJpj80u8ksuz
         tD5A==
X-Gm-Message-State: AOAM533eJlUQ8tirwV0HxJRCayl2Ey99KjxJFd18RgAhKfeyjDUrmON+
	b54tBm9MMg8qw4teXOGC6DfYeMbbXYOvQQp3
X-Google-Smtp-Source: ABdhPJyxBcA3dzo5HeFZnUeucuWOUqwLvpS8ad/LTYBHkDhpL2o7o/eBFVVXlwXWY/se75l1eynPDw==
X-Received: by 2002:a37:b787:: with SMTP id h129mr5655275qkf.402.1598295645254;
        Mon, 24 Aug 2020 12:00:45 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f3sm3160826qth.56.2020.08.24.12.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 12:00:44 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto-rt/5.8: fix lttng-modules build
Date: Mon, 24 Aug 2020 15:00:39 -0400
Message-Id: <20200824190041.54316-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200824190041.54316-1-bruce.ashfield@gmail.com>
References: <20200824190041.54316-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/5.8:

commit baee1af811ec9bd3e64990543b7cc85e77c8f50c (HEAD -> master)
Author: Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Sun Aug 23 22:50:30 2020 -0400

    linux-yocto/rt: enable kprobes by default

    Traditionally kprobes and -rt haven't mixed well, but recent -rt
    kernels support kprobes without issues.

    lttng now requires kprobes to be enabled, or the following error
    is thrown:

    |
    build/tmp/work/qemux86_64-poky-linux/lttng-modules/2.12.2-r0/lttng-modules-2.12.2/wrapper/kallsyms.c:20:3:
    error: #error "LTTng-modules requires CONFIG_KPROBES on kernels >= 5.7.0"
    |    20 | # error "LTTng-modules requires CONFIG_KPROBES on kernels >= 5.7.0"
    |       |   ^~~~~
    | make[3]: ***
    [build/tmp/work-shared/qemux86-64/kernel-source/scripts/Makefile.build:280:
    build/tmp/work/qemux86_64-poky-linux/lttng-modules/2.12.2-r0/lttng-modules-2.12.2/wrapper/kallsyms.o]
    Error 1

    By including the kprobes fragment into the -rt kernel by default, we
    fix the issue.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 7b5588f01f..ca791a3b14 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
-SRCREV_meta ?= "a53fa3813188b421c420b85b51ba95e6a6278689"
+SRCREV_meta ?= "2f9b296099dc534d1c9909f34b1090d8d2280c9b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 8e7272b54e..ed07f6d9d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "01ca9ab2d6cb0de4425d9dfca99dff30653083d9"
 SRCREV_machine ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
-SRCREV_meta ?= "a53fa3813188b421c420b85b51ba95e6a6278689"
+SRCREV_meta ?= "2f9b296099dc534d1c9909f34b1090d8d2280c9b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index e6e1189802..b10554af87 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
 SRCREV_machine_qemux86-64 ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
 SRCREV_machine_qemumips64 ?= "3109e6f363109f0dd4bd6a8647f639e445c533f2"
 SRCREV_machine ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
-SRCREV_meta ?= "a53fa3813188b421c420b85b51ba95e6a6278689"
+SRCREV_meta ?= "2f9b296099dc534d1c9909f34b1090d8d2280c9b"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

