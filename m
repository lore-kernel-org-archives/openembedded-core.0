Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E2CCCA480
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:31:18 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.21955.1658104276959963579
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JeH9tJOf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id s27so9215993pga.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=802gUcdEfBzqxyDuQfdzZxQS+yHEN+g0T60vU2yziBw=;
        b=JeH9tJOfrQ8FkEJu/91cItV7NeDvBfQNSS+rY1msdXYmWb2LoykohFlGHUKnuYMtfo
         pGoiuzpJxNYdOcRlfWjz5pYErPyFHFGUxZyIpHbmnxlfHKxGfiuEg/t/8Y1MzwSfilxv
         m4TvOiFT9CDej3Ue4CiR0VmD2OPwpKcqNX2ZxVU0iq+opxomEtEY6YEYwct6iG9sr/+c
         EXP4ovde9Eq79dzPO6C4fAxAM1e/JUh35l1dsNcEv4tD24QP3C4G2I5vsvFlP2Wb/kxR
         cIKJllS8eeAT6vGC70TIMXHKrWU1Ai1BYS86mYUkCMNTApvYaqzESQ4wtZDYIFQrVE4v
         vrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=802gUcdEfBzqxyDuQfdzZxQS+yHEN+g0T60vU2yziBw=;
        b=lpwQ5HeD16QEbjDMFHU4ADOIUBRzRRwOLjWKMOpY6kN9zzORu9tWwpk7XqILhKuiJZ
         wNEAqPeviimIDVm+ghUzg7oXNX15NO7jJBGuNyxZ3sO2DTwMz4SFMwlzC2jrkUbDLTfV
         MRTEC84P1Qoh+V5ljjlQGVJnwQYusQYaUMok34UWQ3hPxBE6AbT5eBCxxXK0yq6Rag9X
         tE9O7mIZZQZIOxQIYWwtzVIfCjieyF18Aa8nCrDnLWXCsIpVbxElZYQNzxyeIATF/LE0
         g7QeZXC6wDiPDqqq74tCqSFDyv6uJfZGHA0hv/hU8Awhx5F/pZFnjQfqpMhchuQBzzou
         Xb6w==
X-Gm-Message-State: AJIora9578w7LO1oZdakwAa/ai7JDxW/RHOtf93Hgbbki4fmS3xuiBjU
	cU3rByHrQbPF6wlpxY8oi9wXmfOuF+8x8WdJ
X-Google-Smtp-Source: 
 AGRyM1tJWA/K2BG+46wwOJ7fCD3LleS2mVpo63BVjoA8t4wK8X4Y9UeNWfAKKr0wUI+FPUY5rZN4gg==
X-Received: by 2002:a63:310c:0:b0:415:368b:fd0a with SMTP id
 x12-20020a63310c000000b00415368bfd0amr22422136pgx.218.1658104275940;
        Sun, 17 Jul 2022 17:31:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.31.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:31:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/23] linux-yocto/5.10: fix buildpaths issue
 with gen-mach-types
Date: Sun, 17 Jul 2022 14:30:08 -1000
Message-Id: 
 <6e2676afa53b17fa08372f0145e574456600512f.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:31:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168172

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    80f5207b5abd tools: use basename to identify file in gen-mach-types

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 78dbf81b9951b1b49ec1546d6eb9ed7240507515)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index a695740976..c705b7c07a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f481ff6adf4be55c3ab89d0cf7243bbca69205c9"
+SRCREV_machine ?= "2f72685aa16ee5e1c8c53df03457b223a6996540"
 SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 41cad3d37e..6336ef544f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "cab1bb0e702f93b16762fc560d6be582fbf86a6a"
-SRCREV_machine ?= "5239dc7bbd53a3d4d5e31f8631612c2eb6cee0b8"
+SRCREV_machine:qemuarm ?= "3b951d9995d83be4e2985d6aa904d59cb9ac7692"
+SRCREV_machine ?= "f2b78db2b548501a7b0b17f76b9ee2f09978fb30"
 SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index fbee1874f4..96c77e6a87 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "952586297dec710cba21ccf7f6fe4a1aadde0a5d"
-SRCREV_machine:qemuarm64 ?= "268aa738ea2454a1293dcb6c829c88552a5768d2"
-SRCREV_machine:qemumips ?= "bb9cabbe92165b556329cb0eed12ab67d2dee7a7"
-SRCREV_machine:qemuppc ?= "88ee9e4c24d32b6d0ec90756f0c7729954d3feae"
-SRCREV_machine:qemuriscv64 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
-SRCREV_machine:qemuriscv32 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
-SRCREV_machine:qemux86 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
-SRCREV_machine:qemux86-64 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
-SRCREV_machine:qemumips64 ?= "1a760ff71146a87cb5b7de87aed88db07a907ef1"
-SRCREV_machine ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_machine:qemuarm ?= "8b54878acc1161bdcfa3a1153cb2fff39c675b89"
+SRCREV_machine:qemuarm64 ?= "2db48159f4444dcfa0c0dab5804769ea528bb6ed"
+SRCREV_machine:qemumips ?= "fc5fb9c35b8c52a3b1b2348a56237b6f1bb7fc6b"
+SRCREV_machine:qemuppc ?= "736b1667a61f21d7a1b8c88e8cedb648e79e687b"
+SRCREV_machine:qemuriscv64 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
+SRCREV_machine:qemuriscv32 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
+SRCREV_machine:qemux86 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
+SRCREV_machine:qemux86-64 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
+SRCREV_machine:qemumips64 ?= "2105a97021e3d0c565d84947e5cd45dd77be07e3"
+SRCREV_machine ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
 SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-- 
2.25.1


