Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9D4C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:23:47 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.10925.1642184625779581158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HDh/wAkL;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id l17so11538495qtk.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ir+WGWUmT469GjB59c9j5Gl/QH9uq2/t2NxFU7pvC1o=;
        b=HDh/wAkLQAGLZMgCy0RxKLemxtMbQhWyfVU6honu6PPcwQNdjBvBh7AfCLzYjEElGm
         xOGN5cwYib3CPWM4AREWXej/rdhsqAyb6mV3qNbZokrY9sTyrYj3WdMuBg5Dmfh+boEq
         G5u4WquSMoU7FksuzfCa1qmLTsk1heOZ+iTfEHCZLFMxWNQVQnC+AH6wT0IrjFhwRu2u
         cJCBnGzYRYt7P7gy8/DzXCaEmPDBp9ZyNMBuiOyspx6bXKZL9VamjuvIyBrgsDMdqKeB
         XBdICpOdYn0w4m7aJVCxk/nbpeYNS6klp623O9WDBw8V9eo2v17yOkhUzKQsBWpQYMTK
         v9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ir+WGWUmT469GjB59c9j5Gl/QH9uq2/t2NxFU7pvC1o=;
        b=gg1OTCVbhZkVaOuvNsOlbGTMLDD5y5Izx2ge3YXgzPY3XMqwWoJihWrq32tpox1mPE
         qkwH/V3OKeJxyxg09RG8apJsGxcJx8tnF0Xi3+HtwN5MX0Y/0RBPww49Q3fOlLAEGnaN
         W11ncfr3YUY9+0B/tgZORZECp1gBa8xh4hcRB81g4vPhy+1U2fvOAv7bhUIFCuxkungk
         mXsuQe5DE2nsHGuIciwmq3FX/zX/xhIYmgIS/ui6zpTFcIQeAZQUxTp4b/tPKn7bdJxy
         NQAApkpVTRHWj8yXCTQvno7If2K9WKKSwRuxsK6E1A0tcmQ0A1MIK5YxtFUwVvrOmuCG
         BQ0g==
X-Gm-Message-State: AOAM532aS2NpCcL/mxTDqPPIciesO0/JNoU3MGfugIaCk7B+aTE+qCvq
	3PcaK4FUxgJwKP4A7hLe9QM=
X-Google-Smtp-Source: 
 ABdhPJzoioiHAzzVzMiewl8Fv6bkQcaPvGM4QTf74L/Fz6OQm/iBraYY1GxkegGudpimcLLjijQNNA==
X-Received: by 2002:a05:622a:130b:: with SMTP id
 v11mr8671182qtk.355.1642184624843;
        Fri, 14 Jan 2022 10:23:44 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 z14sm4448995qtw.59.2022.01.14.10.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:23:44 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/5.10: amdgpu: updates for CVE-2021-42327
Date: Fri, 14 Jan 2022 13:23:36 -0500
Message-Id: 
 <d459a66fb56fcce51017500c8f3b6fd248c50c63.1642184457.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1642184457.git.bruce.ashfield@gmail.com>
References: <cover.1642184457.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:23:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160587

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    fd84b99a8ccb drm/amd/display: Don't allow partial copy_from_user
    024f4ff63d55 drm/amdgpu: Fix even more out of bound writes from debugfs

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 52ba3b9f61..75beee3a04 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e137d5d92c05530840f2e191ec471f8f0ea2d62e"
-SRCREV_meta ?= "65d66ac9789372923b42be0683a87955e52705a5"
+SRCREV_machine ?= "fbed4064df813f01c1a862548f28b2050ee9b09e"
+SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d0166f6c4f..c8787085fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "c0774ebd6bc1c7541deb4f9a649a1a6bfa42853f"
-SRCREV_machine ?= "ab201bf6e3f9d187c7c26a0ec6537fadb41de918"
-SRCREV_meta ?= "65d66ac9789372923b42be0683a87955e52705a5"
+SRCREV_machine:qemuarm ?= "ca2928bf9b108b45a8ecfe6c76ae9d66b9527f0c"
+SRCREV_machine ?= "5d7922b2755129e1066944a25675a4f9bdbbe706"
+SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 43274a318f..9bc6511ec2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d9597fe71e155c5a96452d23694188d6d4091673"
-SRCREV_machine:qemuarm64 ?= "210fcd9ee603afb731beaa5833e7e3f1d1918786"
-SRCREV_machine:qemumips ?= "8688d3707cea38bd7ed115a12005079c2215f77d"
-SRCREV_machine:qemuppc ?= "933b47667b7549bb36a809cca90bc372a7182620"
-SRCREV_machine:qemuriscv64 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
-SRCREV_machine:qemuriscv32 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
-SRCREV_machine:qemux86 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
-SRCREV_machine:qemux86-64 ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
-SRCREV_machine:qemumips64 ?= "25fcfe4f5c4be9bbb67498f09b2dd088f8bb6dfd"
-SRCREV_machine ?= "2a2f4a19d9d77ad40b9d079be860f736846f5d55"
-SRCREV_meta ?= "65d66ac9789372923b42be0683a87955e52705a5"
+SRCREV_machine:qemuarm ?= "dbf49e7b0801b1b92994f7bc3c6bba943340e273"
+SRCREV_machine:qemuarm64 ?= "0b092f0c4e3471ef22aef0343477519b0ba8b533"
+SRCREV_machine:qemumips ?= "1806335706c3549985836385bb400c1d80819d73"
+SRCREV_machine:qemuppc ?= "270ee670f95ad200c7c32bf8a8ffbf6ed43d7964"
+SRCREV_machine:qemuriscv64 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
+SRCREV_machine:qemuriscv32 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
+SRCREV_machine:qemux86 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
+SRCREV_machine:qemux86-64 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
+SRCREV_machine:qemumips64 ?= "ea456bce3f1ed65b1ab00a0cf8cf551b5967aec3"
+SRCREV_machine ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
+SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.19.1


