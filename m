Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676A2CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 14:12:38 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.16207.1726668754066674809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 07:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nXtP9ShV;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20570b42f24so73590595ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 07:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726668753; x=1727273553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6nd0bKpa7WNU5AO5a4Gon44kGdA7B1r5wLPhvcjspo=;
        b=nXtP9ShVjPLy+s8pQlBh+GqV5deFziemIFF5VUbqGrisrWZBQNd4d3ytCEjEO+Rzap
         OalJfl4viE/JhPNy5b8MT+QqLsSx/y/EkioulxsSYzVmb3Saptd8uqqQfwTlCTFn1gPk
         ufKSL8pnj2L4ix1+ZAI1etObSIdxozKQPsLMh3a7CRTjKv8NddbN5kqPF/MOVeNkZz3x
         v3IcqRYTO6ypczqqVwmldaipqSItvZVfpXPgoi1t3jjI1d+hGwAxxdqFs4NNtwdSZQFv
         Cg+mBaOd1ErRK7onGO5MQeYSzn8cx683l6xLzAnz7jekdfR5hR2A5Nm1+3y10irslYhB
         /Ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726668753; x=1727273553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6nd0bKpa7WNU5AO5a4Gon44kGdA7B1r5wLPhvcjspo=;
        b=H0YxT5DY7WiSjsgIVwQ51w9g/UVLDbKeX91QSDRIt7XdZ6r+SdA++k6t9+xjrjlaxj
         KzuU5TPLzYsoTE8wNtP3PSi9c6zPOlI3HAgUTB3IIt6d10yoyfWGiQJIhp6T8fJklr0Y
         ELYftP4AmrGj4OXYWQczKi6ye8g0PvwKSmFN970GwJ4+6bBMprtdSP6G5I1G7I7sXOha
         EgvvlvL7g5XqAgY+sSM/MiaAT8HezHEGdvytbHVhYAzy9aiPVBMB+lk4rVMv+Qnzr9XT
         yYFSxSIz4OxBiuvtuMbrkVJQts9AMpZD8jcA8T26s18CwBHaKsQM+THBrTZ5VM4lYl3n
         711g==
X-Gm-Message-State: AOJu0YziefGc51OPMMuwKKSizeEHVlb6JvLzajczKxh9UJMfFdfFbmcs
	LuwASwAQzCo3OFdVi6lDmevHss5yrTKaZtIrv9pumeYLhgysYx94nZYmu+xA
X-Google-Smtp-Source: AGHT+IHZR4xeIeo/WVYPO+wV5tCjxLloipMn/PQqMssRM52mBiJZuQZRWXzQ26mK7nIvOnw6D5GEHA==
X-Received: by 2002:a17:902:e852:b0:202:49e:6a35 with SMTP id d9443c01a7336-2076e33e935mr349530715ad.19.1726668752984;
        Wed, 18 Sep 2024 07:12:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c3c8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079470f318sm65536485ad.235.2024.09.18.07.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 07:12:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] systemd-bootchart: Add riscv 32bit support
Date: Wed, 18 Sep 2024 07:12:28 -0700
Message-ID: <20240918141229.3168376-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 14:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204644

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-riscv32-support.patch            | 48 +++++++++++++++++++
 .../systemd-bootchart_235.bb                  |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-Add-riscv32-support.patch

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-Add-riscv32-support.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-Add-riscv32-support.patch
new file mode 100644
index 00000000000..80f0b6d3783
--- /dev/null
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-Add-riscv32-support.patch
@@ -0,0 +1,48 @@
+From da22e9f4eec22163feab5a0a4488627ea992daa9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Sep 2024 23:58:36 +0000
+Subject: [PATCH] Add riscv32 support
+
+Add missing definitions for the RISC-V 32-bit architecture.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/54]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac       | 1 +
+ src/architecture.h | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 5c9c20f..f977c78 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -45,6 +45,7 @@ SET_ARCH(IA32, i*86*)
+ SET_ARCH(MIPS, mips*)
+ SET_ARCH(AARCH64, aarch64*)
+ SET_ARCH(RISCV64, riscv64*)
++SET_ARCH(RISCV32, riscv32*)
+ 
+ AC_CHECK_SIZEOF(pid_t)
+ AC_CHECK_SIZEOF(uid_t)
+diff --git a/src/architecture.h b/src/architecture.h
+index cbf1795..f33cd00 100644
+--- a/src/architecture.h
++++ b/src/architecture.h
+@@ -58,6 +58,7 @@ enum {
+         ARCHITECTURE_TILEGX,
+         ARCHITECTURE_CRIS,
+         ARCHITECTURE_RISCV64,
++        ARCHITECTURE_RISCV32,
+ 	ARCHITECTURE_LOONGARCH,
+         _ARCHITECTURE_MAX,
+         _ARCHITECTURE_INVALID = -1
+@@ -151,6 +152,9 @@ int uname_architecture(void);
+ #elif defined(__riscv) && __riscv_xlen == 64
+ #  define native_architecture() ARCHITECTURE_RISCV64
+ #  define define LIB_ARCH_TUPLE "riscv64-linux-gnu"
++#elif defined(__riscv) && __riscv_xlen == 32
++#  define native_architecture() ARCHITECTURE_RISCV32
++#  define define LIB_ARCH_TUPLE "riscv32-linux-gnu"
+ #elif defined(__loongarch__) && __loongarch_grlen == 64
+ #  define native_architecture() ARCHITECTURE_LOONGARCH
+ #  define define LIB_ARCH_TUPLE "loongarch64-linux-gnu"
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
index 3c3c84ff4a4..859c7eb906f 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c
 SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https;branch=main \
            file://mips64.patch \
            file://no_lto.patch \
+           file://0001-Add-riscv32-support.patch \
 "
 
 SRC_URI:append:libc-musl = " \

