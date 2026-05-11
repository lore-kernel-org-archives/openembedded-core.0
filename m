Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA04CD4855
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:25:25 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59986.1778531124605717860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 13:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qo6wm3XV;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50d876329bbso45300521cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778531123; x=1779135923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBCgCnw7xKRDAeI8mO3++228t6HWFJi6Xod2mTP7DwE=;
        b=Qo6wm3XVHUSEYJ+XObhE3Kq11DKUbFx+uZL33DvZsuFZi/n1kebEw4VCxiH2FRWQ1t
         fmk2YM1gdlRTV7YRx4h9CzsymqYNPlyEu7LWhIeEyztcjmVd8mt/AMB+Ey7tY7jb1vj3
         Cp/xkMhchQRgvp5BPHuikxtJVc5eMylQgvO96ZUSuS86zTyTj06DKIGo2oCG6/s7w/To
         yQeTbrIFykUUb+FMljtsIcYfTHYDz0HD6TPzxMJx/A/ghqfiy+04ZurTf8RLOrQ7fJWC
         sOo2t7Syaoso9mc5jrV0NBoLATCA8U8rRJAuNM12SMVf2K/LNHkA5zsOwYYGTcwt5W48
         iWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531123; x=1779135923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RBCgCnw7xKRDAeI8mO3++228t6HWFJi6Xod2mTP7DwE=;
        b=Gtg859wmxTdAZbsEI8FfsAWmzUTQdijHWu0C82190KdE6kq459vNhf9mOm9K/mfFmT
         bvHquGeVWTwTfbOfGHfrIG0oWWkzM8J+jagQ+7pWk2vDb/KsoYA83sVNn2d6ZX5aCGcH
         /Zu+BPCyNcgGAlxVtSGgXb0ftjTPgV8XYgrKv7EkFCQvZp4uidISOH/+9fHpn7fl777F
         OZJGyJBXqFWauv5vXM8rfs7m+xfiujAmYNuP8qBxHwfkUXKZTXLm5BIk1C70gvfAQgr/
         SSW/fl3XKU6gwJe+PhoyUgfB2lu7AldjRuBKuoIzihG05u/ZU2TH70FZLahdJqYIyCPK
         s5iA==
X-Gm-Message-State: AOJu0YxwU6EoCdO1vxZLj4zcoec8boZbM/XQiHGHi4CWol/UiuTQrkDl
	bDHnOCmVpRcK2hDVlmqA75BR71k4f7JzMujVrzU7NC8KZd9EryCYWmILXEfXgqcQmkP5JA==
X-Gm-Gg: Acq92OEKpHH6ijwq5fyQlo0aitlddbD5kPA4M7AyrY5yntqc9L/h7+N1sGM/rkwebLs
	c5EHJW85MOMFW7l3Dw5atpH+qinjpF0F1tu8qNrZosSYvIPijl4z5KVLQwDykR4oY3ncAWR8e2v
	mq+VpA9z4RsEpNohCSKZz+QiQOLGtCI3yBicrJGfAzaFzhIfiKl+USNuJH8a9cOtvSfm55IXhCM
	FRfFdpHJdvbc4F7QjHrBSPHHoFZxjbU43IzqFelsR5UrZx/36IScCqAmk/gjQEMIpMxenJBtv8k
	HhC7W7JodJ5Wp8b8JRkrQOQVYnUrqrfiw28iJTHrtQkca31uIjaZN5SsTkQIRv4iMSCwqe4Oobx
	vozRUFwV/88+DEvouhndj6Hq01PRYpMnoDci2LqW90vcfSR8AJyrY1LXvd+mIx1lnyiL1jGKjjs
	TxGYXM9mZAXGKVsl+WQjouFdt44FQqbclrFOCEHjzF26RhERGMnXhmYWyWbDYhr1IFpSfzaH5H1
	FIm8XlqdiIYAqIL666NynxtEWfvF0wSisZREVdlsJV8Gxq7voFMoBfrP90=
X-Received: by 2002:a05:622a:1e89:b0:50f:ae24:ecdb with SMTP id d75a77b69052e-514d20e0909mr2847841cf.37.1778531123291;
        Mon, 11 May 2026 13:25:23 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e83aa2bsm98213401cf.28.2026.05.11.13.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:25:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/09] linux-yocto/6.18: update to v6.18.26
Date: Mon, 11 May 2026 16:25:10 -0400
Message-ID: <20260511202517.1648910-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
References: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 20:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236828

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    1fe06068166d4 Linux 6.18.26
    d5f59216650c5 Buffer overflow in drivers/xen/sys-hypervisor.c
    446ee446d9ae6 xen/privcmd: fix double free via VMA splitting

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index bc601df34d..0be25ae2a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b47fc8aaa6f14b240bd96eb35e73d3d8ba638d21"
-SRCREV_meta ?= "177495c151446a679945c20611499537d72ebcd9"
+SRCREV_machine ?= "e1a1c058b8b1fd85e631c877cacb0e5c38da1c57"
+SRCREV_meta ?= "127f83ad4e21b6663d72fceba80bfb945c21e4f0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.25"
+LINUX_VERSION ?= "6.18.26"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 638fdd18bf..1ff5f5d1d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.25"
+LINUX_VERSION ?= "6.18.26"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_meta ?= "177495c151446a679945c20611499537d72ebcd9"
+SRCREV_machine ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_meta ?= "127f83ad4e21b6663d72fceba80bfb945c21e4f0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 48f8451483..87e46024ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "6788c0f14b51b8c84f0153d58b00d5115f2ee8e5"
-SRCREV_machine:qemuarm64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_machine:qemuloongarch64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
+SRCREV_machine:qemuarm ?= "11ba8770344f8b1cf3d6960b2d04ca19ed6d1f81"
+SRCREV_machine:qemuarm64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemuloongarch64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_machine:qemuriscv64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_machine:qemuriscv32 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_machine:qemux86 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_machine:qemux86-64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
+SRCREV_machine:qemuppc ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemuriscv64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemuriscv32 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemux86 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemux86-64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
-SRCREV_meta ?= "177495c151446a679945c20611499537d72ebcd9"
+SRCREV_machine ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_meta ?= "127f83ad4e21b6663d72fceba80bfb945c21e4f0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a256b1e6892e7fe840f0f9746316fa938e9a421f"
+SRCREV_machine:class-devupstream ?= "1fe06068166d4fc16722201f267b1fe19efad639"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.25"
+LINUX_VERSION ?= "6.18.26"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


