Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F385DFC0368
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:22 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.691.1776959115984906197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OS8O/dYu;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-506a747448dso49940221cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959115; x=1777563915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vm3uEiZBvQIZXNkj0aaK4zNa/LF6pynh1I2T3x8KkR8=;
        b=OS8O/dYuQ5pcws96OXLDuqN5GqXfWK6qV95eryU+4GFRK9150FFCps4cbJq1o3GyPm
         LpmzWWi0sFlvuY9ugJHS4+kTJyOk00HTYN1WPug5Gg8VeFbyL+KEJsyk39J8hX51mmsO
         y8U5pLR8n+GCP5aMlABuFVRuY/ELYAjOneXPKhxtAwiVCAPYVYQ8msPFin8km2ct3X85
         OCrpSG68y4ls/NgRg3cIuFhrguM0JtGG3nPwywZ6JqImt/SXYBdt6hUlaCKNi+KDsXcG
         bLFdEX0kN8qPqCurxsi30inBgdxFao5McmfCNK9onfV8gj6s5/q3/cNzZ67yMzVGn6S3
         E/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959115; x=1777563915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vm3uEiZBvQIZXNkj0aaK4zNa/LF6pynh1I2T3x8KkR8=;
        b=l6JKiQGYSyoRpcqIbtiaVUHwNrwwSe2m95gj1fffQzjCq0FJmFpNMueGk/n5Hi/hXO
         2u2j+pY12MxQu7C24JZKCLDM4uoAMPpn9UfNYN5pU4PKII9xKxISeJ90npxMdgp0emSW
         x6BLV01A1UojOu1sbcAFy+5a7dIBixQ37xxLU2Ivj3EAeclC1siKMyNHqpQZJoRklZO8
         pFxwXEVIu57lfFwUniyVXe7CDLoh9FAWiAIlQ74pNLmqvWwMt+pmmMrmsMyn3Q/nNFbr
         QSfmoTbgI3e749KOlb3x4dZaQz00f30ZoIJdANigILQR2rGUuJR4IxXoHmC8b3QRC5Ra
         eJWQ==
X-Gm-Message-State: AOJu0YxPjyuQPGhFmWEGXWmSfTc+fIFllPcTlkIUORyMEgbgtAWU0I2S
	V0APXkrOwm+xd95yjpZKJmxIJV9w1ehg6EQIwZOZvwpm3L84QxClM4r1f0SbYipV
X-Gm-Gg: AeBDietc5MwDAroH6BMH0i0o2CYWCiIdCkARfnUcZxt0SO5SDPfpSIrbofulyB820ht
	f1w9PwKT/o2p6t/FNsYRokfzQTRRUyEfnhCR0w5g8gwNMh0vgMmKhbxVKYpbeSJ2QQf6SF4D4+G
	ugNvG4wxaevtSBFZpDH2kcBiJuWN+6CAHX5z0eIPQzWZhb1XCTNDgP1aNnpmD7NvW3LnNXxqM5D
	e3wrfxWOP/gHhWy9Du930WHXmnv2cpUehRm0bAoFZ1m5hk11mWGWwXFLv3HEmwCfNui7IPy9A23
	y6YSWTMGeurIenmG8rPV5cmGZ+EXGc4ZZVIjDNgD/w+I1o5d3tTLkinvNN21yBNIW+UDk+FpKtb
	DpvMPnw495HJ1plYlPt5v0KtIn4vUXPHPyQK1NFKpecVn+wNfelL/6KvgDWAm/KUZNRsbsMtCnN
	5SRDcxW/1tP2gjo7IjG8vvT8UDRsOpWyqhy6cj/8OFCZOUfJELLFevvsIqhbFvd3KXtMmhLWCxw
	pqmSuGkoeQcnAf9zXFdIwsK++8ac+MjmZW9r6a/O1qwJq+C++3JmffI7u+D2tpxhfce7rO0NYkJ
	aarv
X-Received: by 2002:a05:622a:1b1e:b0:50e:a1aa:2cd9 with SMTP id d75a77b69052e-50ea1aa2fafmr234789351cf.15.1776959114814;
        Thu, 23 Apr 2026 08:45:14 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:14 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 03/18] linux-yocto/6.12: update to v6.12.73
Date: Thu, 23 Apr 2026 11:44:54 -0400
Message-ID: <20260423154509.1933646-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235803

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    5fb0303f6cb6a Linux 6.12.73
    a7fa9460b86f8 Revert "driver core: enforce device_lock for driver_match_device()"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 0f21f2e4d5..4572915cf4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6adb3759af2b8904cab35fdb1b40c12e17e313c1"
-SRCREV_meta ?= "5025770c6104c36f0b102a1a813ee23d7151a755"
+SRCREV_machine ?= "1be6d1eaceba0860348c41af8951ccebfa5aa2c8"
+SRCREV_meta ?= "6d166217a8feea3a7e961be354ea9deabeb8d356"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.72"
+LINUX_VERSION ?= "6.12.73"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 7cea4ea4f7..d5c1c8c052 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.72"
+LINUX_VERSION ?= "6.12.73"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
-SRCREV_meta ?= "5025770c6104c36f0b102a1a813ee23d7151a755"
+SRCREV_machine ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
+SRCREV_meta ?= "6d166217a8feea3a7e961be354ea9deabeb8d356"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 6f9906fb74..5b6bf7ef0a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c4d3cba9c7fe4e4f7275fdaa50e35d479108813f"
-SRCREV_machine:qemuarm64 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
-SRCREV_machine:qemuloongarch64 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
-SRCREV_machine:qemumips ?= "e5e61bd34c2ce267b67502f95dd3f11dfdb5c77e"
-SRCREV_machine:qemuppc ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
-SRCREV_machine:qemuriscv64 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
-SRCREV_machine:qemuriscv32 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
-SRCREV_machine:qemux86 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
-SRCREV_machine:qemux86-64 ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
-SRCREV_machine:qemumips64 ?= "482153ceffc764c453274f27e950fee03a0fe17e"
-SRCREV_machine ?= "0ca0aa71c7c9f5f206a3748c1b9475ae1023d172"
-SRCREV_meta ?= "5025770c6104c36f0b102a1a813ee23d7151a755"
+SRCREV_machine:qemuarm ?= "a7cf22192ce38f303c8a5070b750583953a34e09"
+SRCREV_machine:qemuarm64 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
+SRCREV_machine:qemuloongarch64 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
+SRCREV_machine:qemumips ?= "9a4ed79b88cab20c169656abe310068f8cdab2c3"
+SRCREV_machine:qemuppc ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
+SRCREV_machine:qemuriscv64 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
+SRCREV_machine:qemuriscv32 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
+SRCREV_machine:qemux86 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
+SRCREV_machine:qemux86-64 ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
+SRCREV_machine:qemumips64 ?= "0a68bc37afffea25aa627239d1de74f4b7088824"
+SRCREV_machine ?= "b67de812f086e14ab0897455a7bdc17dd9b0d6de"
+SRCREV_meta ?= "6d166217a8feea3a7e961be354ea9deabeb8d356"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "19b3cac2b50b53cc000b4cd795415c7d03484707"
+SRCREV_machine:class-devupstream ?= "5fb0303f6cb6a89bcfb19bd7a68cb793c86e78b2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.72"
+LINUX_VERSION ?= "6.12.73"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


