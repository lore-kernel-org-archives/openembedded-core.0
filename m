Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEC7C433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 16:35:19 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web08.3353.1633451718513945796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 09:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=aWfMX3l2;
 spf=pass (domain: foundries.io, ip: 209.85.219.42,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-qv1-f42.google.com with SMTP id o13so23198qvm.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 09:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=//WkkKMYR07LRlkHq0fFE3la6/IhlB79z0LOt8r533M=;
        b=aWfMX3l2nyzl9IvhAPm8eL82IgotRtiC9ccpXDciEFKnh5lE8JG/LBBqTS4sX6KGvR
         /F65z5Q3Fn0Usm9Omg8GAchXYjDDHEDKrJlHQYkKpM+0nv9Tr6VmCt58Ds2XtkQQOfEt
         A28h1r6WrnJPKrBSFP4XQSNL2Z6fOoTR3jn6561v55TST0icHXmPhoEwyNmb9vD3mLS2
         Xl71V5hqY9TmTej+DyWndstH3DifgJDNCZKWhT/Pgv+zVX1XeNVftMDb33VRjM1cx2Pn
         DLJt/N1BZfIVj416Phtslp1RvQ5lXs5T28o4127QClF3+yOwdYPdTzaQLv5gO9CCfiSa
         qIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=//WkkKMYR07LRlkHq0fFE3la6/IhlB79z0LOt8r533M=;
        b=LvOL/HjemqCP8811L/mbY1uql4OzQ2itRCSIUotANEGVtTrOLR0d6bLsbgCQcSUCET
         ksUeM6fUdA1Few4bgRKDmTafP8fcWzuTvHNjIyTbjlgnYcPvcZ1xRK4npjrmkK6TeH8U
         tWvUq2DP0rnHsj+wOAezobRWGUBrxOzecP3NhcNxgSiJJELvMBZ5rl2YiazLDJEjyxyb
         tnrwPv2ZCNOPOnhwaOBdnNexAOaWWjtAyWotcspwFyRkcqLbZn1ufmD72XRyvpMDzVzn
         TWUi8qmBwal+f7Xg1BDPCqVa7bBG2c+8LuZpRwtNnjLRv4ZAonmv6nJjNs8mtpITimxa
         chew==
X-Gm-Message-State: AOAM5339NdzdG9xY58wEsqSQn1fxcFhx7jNlJoHCj4vmrkGD8UvM3BnL
	0EPV3Q57iYHS6D4r8sU838RksYh1lr1lZQ==
X-Google-Smtp-Source: 
 ABdhPJzhSjwZ7kWsIE5tzT1OFw0iJj6w6w1pABU7JNLLpEbz0APHDd8CpEcf6ispXLCPeAVJMdy8Vw==
X-Received: by 2002:a0c:e40b:: with SMTP id o11mr1950575qvl.32.1633451717452;
        Tue, 05 Oct 2021 09:35:17 -0700 (PDT)
Received: from localhost.localdomain
 ([2804:14c:3bac:19c0:f177:7675:b808:abc8])
        by smtp.gmail.com with ESMTPSA id
 p15sm10900044qti.70.2021.10.05.09.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:35:16 -0700 (PDT)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@foundries.io>
Subject: [OE-core] machine/qemuarm*: Fix UBOOT_MACHINE value
Date: Tue,  5 Oct 2021 13:35:08 -0300
Message-Id: <20211005163508.3939441-1-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 16:35:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156652

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 meta/conf/machine/qemuarm.conf   | 2 +-
 meta/conf/machine/qemuarm64.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index d71a793edf..1bd4e3e154 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -7,7 +7,7 @@ require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "zImage"
 
-UBOOT_MACHINE ?= "qemu:arm_defconfig"
+UBOOT_MACHINE ?= "qemu_arm_defconfig"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 3b08dedddc..f245152168 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -7,7 +7,7 @@ require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
 
-UBOOT_MACHINE ?= "qemu:arm64_defconfig"
+UBOOT_MACHINE ?= "qemu_arm64_defconfig"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-- 
2.30.2


