Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AD5EE49A6
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:44:57 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.297.1692632695208197713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 08:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=A37i08Iv;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-64a0176b1easo22035926d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692632694; x=1693237494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9U5lH/OgK1sooLDJ/zCWCaalmt6DiHV2jpikrmD8+s=;
        b=A37i08IvRNU/8wMvi3ct/igOslWMRDTOyhwmhAg/+dzz2h7/Fbuu04h9GZ141G2N3i
         KR+qDhTB0mYO6avV7Y6tUbOulOVoEUKXQP1RLNurwLExOmJP/pDHefykLvhjrnYrzMhX
         Jd0gs23uTD+OaLv2jIC71vCn1i8lct2aQ22es9zvb931lgMw6eZlcs7fdwVEOUxboKI4
         hcd/HaI9F0qsz8M4pn21MMcGvP3eQCWNnEOfSUMENbk0sWTVlBMrEJy6hyhYTJjVTkdy
         AhIu406UKWD/7YEk9ameGfVG6SifA6coRmj5YyAcyFGj+xy9nRo8lVfFA2hMZxTr45PA
         qVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632694; x=1693237494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9U5lH/OgK1sooLDJ/zCWCaalmt6DiHV2jpikrmD8+s=;
        b=jspPCZGVtEuB3lyXIXP7QFKo9GKRz/uabtWrDxz0piMelI8uzqI6f2ShbBeVAW8cLK
         sBdFYcvFrt4Wmln+Y+SphIg6iHRGRNgCIwHx1dDSYmgA7BgH6/taHOc+2eOEd8ci9Pvk
         +gBfyxRAlehss6pDoRZJqjQQiwoqwQe/DO0jlfx5Xh/GtIXRjsnLpNt+rVYueSxBd0cg
         l9vht+1F3lIt4hkqUk2JPA1LpWw4YjTBbY2QG0mujBrGLrKpKUlWZGSqyrYRzMISMsVi
         hSuBmEVBdnn8LxUxdX4IkXavQ0DbQRVBDjFxE2facpV2GkweufJMJRxy3LGhFapoSAnE
         36Hg==
X-Gm-Message-State: AOJu0Yzqup6Rj/xi3ti0skWzleKp7uQDhCFpLDEo+nr4ALol+uqaqPCy
	G6RprqY4T7W6wncpNJJdTOU3NEa3ZdrXYg==
X-Google-Smtp-Source: AGHT+IEFwdBIIb+fEmH4/GqmpzE4Ntm6wUw+Kf5zerAYq36v303bBGlNi32CZKtbzlhsgYH7/CyLVw==
X-Received: by 2002:a0c:dd93:0:b0:64b:7337:2935 with SMTP id v19-20020a0cdd93000000b0064b73372935mr6919951qvk.12.1692632694281;
        Mon, 21 Aug 2023 08:44:54 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id w2-20020a0cb542000000b00647248b3615sm3030090qvd.4.2023.08.21.08.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 08:44:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] linux-yocto/6.4: fix uninitialized read in nohz_full/isolcpus setup
Date: Mon, 21 Aug 2023 11:44:41 -0400
Message-Id: <cac8cf022effbd6c9814b73dc45005321b9f0b70.1692632563.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692632563.git.bruce.ashfield@gmail.com>
References: <cover.1692632563.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186456

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.4:

    4675ec8d0b9a kernel/sched: Fix uninitialized read in nohz_full/isolcpus setup

The carry forward of commit from the v5.15 linux-yocto kernel:

https://git.yoctoproject.org/linux-yocto/commit/?id=97c96388922

...in which case the sanity checks are properly *after* the allocation
and processing of the bootargs into the cpumask.

However, it seems patch (or wiggle?) apparently decided to put the
sanity checks *before* the population of the cpumask during the
carry-forward and generation of the new v6.1 kernel.  Meaning they are
validating uninitialized memory and hence nohz_full= and isolcpus= are
subject to random failures even for valid input ranges.

Signed-off-by: Adrian Cinal <adriancinal1@gmail.com>
Acked-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 892794a142..999d54a46a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c5e2054d6dd1e4d87bc05758b03c8414b6229bdc"
-SRCREV_meta ?= "b7b65d4e9a3f7910d9590c325798a6d012087555"
+SRCREV_machine ?= "a6b1e0d6cfc7843898d7624427f50e5391edac51"
+SRCREV_meta ?= "be4b1defa25b1560b7d92e1ade1b7c52a226fc38"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 546aeea7bd..063c39bb9d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
-SRCREV_meta ?= "b7b65d4e9a3f7910d9590c325798a6d012087555"
+SRCREV_machine ?= "a0b10018f36e04152354dc83c41134406e137571"
+SRCREV_meta ?= "be4b1defa25b1560b7d92e1ade1b7c52a226fc38"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 3be24d60e6..d255504bd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "98ab6b8c56f20616739f11d78f9ce5e0f142e897"
-SRCREV_machine:qemuarm64 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
-SRCREV_machine:qemuloongarch64 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
-SRCREV_machine:qemumips ?= "ea17dea03919f5923b5948473fda920b9a6c2823"
-SRCREV_machine:qemuppc ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
-SRCREV_machine:qemuriscv64 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
-SRCREV_machine:qemuriscv32 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
-SRCREV_machine:qemux86 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
-SRCREV_machine:qemux86-64 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
-SRCREV_machine:qemumips64 ?= "d8138296adb9b11a94fcc42d345e49bbb1dd5ede"
-SRCREV_machine ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
-SRCREV_meta ?= "b7b65d4e9a3f7910d9590c325798a6d012087555"
+SRCREV_machine:qemuarm ?= "53136802928146b86b68bdf796f825d142e3a014"
+SRCREV_machine:qemuarm64 ?= "a0b10018f36e04152354dc83c41134406e137571"
+SRCREV_machine:qemuloongarch64 ?= "a0b10018f36e04152354dc83c41134406e137571"
+SRCREV_machine:qemumips ?= "bec202d0a29e4acf9d4e673f1c358e60879c95dc"
+SRCREV_machine:qemuppc ?= "a0b10018f36e04152354dc83c41134406e137571"
+SRCREV_machine:qemuriscv64 ?= "a0b10018f36e04152354dc83c41134406e137571"
+SRCREV_machine:qemuriscv32 ?= "a0b10018f36e04152354dc83c41134406e137571"
+SRCREV_machine:qemux86 ?= "a0b10018f36e04152354dc83c41134406e137571"
+SRCREV_machine:qemux86-64 ?= "a0b10018f36e04152354dc83c41134406e137571"
+SRCREV_machine:qemumips64 ?= "e9dcec67cb7b9703d6eac9a705e94e5f5aab4f0c"
+SRCREV_machine ?= "a0b10018f36e04152354dc83c41134406e137571"
+SRCREV_meta ?= "be4b1defa25b1560b7d92e1ade1b7c52a226fc38"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


