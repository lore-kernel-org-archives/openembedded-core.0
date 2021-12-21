Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB1BC433FE
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 06:00:52 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.2769.1640066451674856976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 22:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bh08kFY8;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id gj24so11553809pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 22:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dHRkOF08IcgjjVBq/lkV88XEIOHp3T9Th6ODFfnCf/o=;
        b=bh08kFY8g7kue0kkK98c1M+sGJm3c7Pz0xe38HBcDkXgCxXPw1MQVQbdc/4tSBO247
         QHbihG0bLRi2gGocP5bihLxWE+W/E3KN4dcRGanx77J8Nx5EzjwrpWWhAgOVt5qoKKUn
         N8Gp4733aFMNHzMCOYDi2G7TTSMNa3HhwbFJulzKVy1p9TrBjF0U1VLkBnuyDnHb8PXt
         XOt4kKAw3RZfQlwjdYWsigXMG3pREbODp0h/cC5j7gXPeOi8TSYP5O8/22/AY56ViqS4
         cBfhNYtSqa/r0az2Ef3iO/krcjWuaAEpFGUFxz0FeY9RmqKn+uRDyQlT3m5Yf7W0dHtp
         SYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dHRkOF08IcgjjVBq/lkV88XEIOHp3T9Th6ODFfnCf/o=;
        b=X8E/CQ26+/lMrX2jsDHdTS5aJTFaMVvh1jeFZKjL7VGXq9kxjB7f0lhY8py9eF6Gmp
         Sgq6HsxSskDdgThErxvy5zAYeU3+YSsNa1wyAyIPa1onMGViolw9OljPNa5CbuLnVRM4
         WLWJ9SZ+vovBEjF8tU4RVTbnq0qUWFAG7TuIC4xTDYO0/TSdp7Bl5i8pgxHcsVv70zi0
         UID/yfOeEFHLMBOjlJ0hrodR97r8Q3CixLmxpTs7/FIfhSj29x4VWM+HRJcUFIvbi+zW
         wI8g3Js6+nXmG1xHqEMd1tF5r+TVco3BBcx4ApFJCBCO1aUOH6Mrudee+dCXd0RN4/Jg
         w/Gg==
X-Gm-Message-State: AOAM533ZAm4jtGQByrDAP5r0M60e1VKp8IVF46cSw6YKB5jZUshVqZ0m
	TF4O5GG3bEUmnE/VbsS14EfnpxTHZmAvOg==
X-Google-Smtp-Source: 
 ABdhPJzRTa+TZ6xYSmLA/1ujEtikBrQCZTxQoFNX3eBYt1x6h+YB53xmagX7FokVwQBJQzZK8CPP2g==
X-Received: by 2002:a17:902:9682:b0:149:15d2:55ae with SMTP id
 n2-20020a170902968200b0014915d255aemr1866139plp.59.1640066450768;
        Mon, 20 Dec 2021 22:00:50 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 t126sm4911258pgc.61.2021.12.20.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 22:00:50 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH] Add support for Neoverse N2 CPU
Date: Mon, 20 Dec 2021 22:00:46 -0800
Message-Id: <20211221060046.186189-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 06:00:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159906

This patch backports the AArch32 support for Arm's Neoverse N2 CPU.

Upstream-Status: Backport
[https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=d7e8411f6a333d4054894ad3b23f23415a525230]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc        |  1 +
 .../0038-aarch64-neoverse-n2-support.patch    | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
index 5626bf20f0..8fcc53df38 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
            file://0002-CVE-2021-35465.patch \
            file://0003-CVE-2021-35465.patch \
            file://0004-CVE-2021-35465.patch \
+           file://0038-aarch64-neoverse-n2-support.patch \
 "
 SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch b/meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch
new file mode 100644
index 0000000000..3e42266b81
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch
@@ -0,0 +1,88 @@
+From d7e8411f6a333d4054894ad3b23f23415a525230 Mon Sep 17 00:00:00 2001
+From: Alex Coplan <alex.coplan@arm.com>
+Date: Fri, 2 Oct 2020 16:06:15 +0100
+Subject: [PATCH] arm: Add support for Neoverse N2 CPU
+
+This patch backports the AArch32 support for Arm's Neoverse N2 CPU to
+GCC 10.
+
+gcc/ChangeLog:
+
+	* config/arm/arm-cpus.in (neoverse-n2): New.
+	* config/arm/arm-tables.opt: Regenerate.
+	* config/arm/arm-tune.md: Regenerate.
+	* doc/invoke.texi: Document support for Neoverse N2.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=d7e8411f6a333d4054894ad3b23f23415a525230]
+
+Signed-off-by: pgowda <pgowda.cve@gmail.com>
+---
+ gcc/config/arm/arm-cpus.in    | 12 ++++++++++++
+ gcc/config/arm/arm-tables.opt |  3 +++
+ gcc/config/arm/arm-tune.md    |  5 +++--
+ gcc/doc/invoke.texi           |  6 +++---
+ 4 files changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
+--- a/gcc/config/arm/arm-cpus.in	2021-12-20 20:24:59.912159845 -0800
++++ b/gcc/config/arm/arm-cpus.in	2021-12-20 21:00:04.417003845 -0800
+@@ -1481,6 +1481,18 @@ begin cpu cortex-a76.cortex-a55
+  costs cortex_a57
+ end cpu cortex-a76.cortex-a55
+ 
++# Armv8.5 A-profile Architecture Processors
++begin cpu neoverse-n2
++  cname neoversen2
++  tune for cortex-a57
++  tune flags LDSCHED
++  architecture armv8.5-a+fp16+bf16+i8mm
++  option crypto add FP_ARMv8 CRYPTO
++  costs cortex_a57
++  vendor 41
++  part 0xd49
++end cpu neoverse-n2
++
+ # V8 M-profile implementations.
+ begin cpu cortex-m23
+  cname cortexm23
+diff --git a/gcc/config/arm/arm-tables.opt b/gcc/config/arm/arm-tables.opt
+--- a/gcc/config/arm/arm-tables.opt	2020-07-22 23:35:54.688795958 -0700
++++ b/gcc/config/arm/arm-tables.opt	2021-12-20 21:00:04.421003776 -0800
+@@ -253,6 +253,9 @@ EnumValue
+ Enum(processor_type) String(cortex-m23) Value( TARGET_CPU_cortexm23)
+ 
+ EnumValue
++Enum(processor_type) String(neoverse-n2) Value( TARGET_CPU_neoversen2)
++
++EnumValue
+ Enum(processor_type) String(cortex-m33) Value( TARGET_CPU_cortexm33)
+ 
+ EnumValue
+diff --git a/gcc/config/arm/arm-tune.md b/gcc/config/arm/arm-tune.md
+--- a/gcc/config/arm/arm-tune.md	2020-07-22 23:35:54.684795913 -0700
++++ b/gcc/config/arm/arm-tune.md	2021-12-20 21:02:44.630260284 -0800
+@@ -46,6 +46,6 @@
+ 	cortexa73cortexa53,cortexa55,cortexa75,
+ 	cortexa76,cortexa76ae,cortexa77,
+ 	neoversen1,cortexa75cortexa55,cortexa76cortexa55,
+-	cortexm23,cortexm33,cortexm35p,
+-	cortexm55,cortexr52"
++	neoversen2,cortexm23,cortexm33,
++	cortexm35p,cortexm55,cortexr52"
+ 	(const (symbol_ref "((enum attr_tune) arm_tune)")))
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi	2021-12-20 20:24:59.916159782 -0800
++++ b/gcc/doc/invoke.texi	2021-12-20 21:03:41.337290704 -0800
+@@ -18857,9 +18857,9 @@ Permissible names are: @samp{arm7tdmi},
+ @samp{cortex-m35p}, @samp{cortex-m55},
+ @samp{cortex-m1.small-multiply}, @samp{cortex-m0.small-multiply},
+ @samp{cortex-m0plus.small-multiply}, @samp{exynos-m1}, @samp{marvell-pj4},
+-@samp{neoverse-n1}, @samp{xscale}, @samp{iwmmxt}, @samp{iwmmxt2},
+-@samp{ep9312}, @samp{fa526}, @samp{fa626}, @samp{fa606te}, @samp{fa626te},
+-@samp{fmp626}, @samp{fa726te}, @samp{xgene1}.
++@samp{neoverse-n1}, @samp{neoverse-n2}, @samp{xscale}, @samp{iwmmxt},
++@samp{iwmmxt2}, @samp{ep9312}, @samp{fa526}, @samp{fa626}, @samp{fa606te},
++@samp{fa626te}, @samp{fmp626}, @samp{fa726te}, @samp{xgene1}.
+ 
+ Additionally, this option can specify that GCC should tune the performance
+ of the code for a big.LITTLE system.  Permissible names are:
-- 
2.31.1


