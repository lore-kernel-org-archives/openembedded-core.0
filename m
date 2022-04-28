Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6D3C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:27 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.10487.1651153706192109766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YXyGQe+m;
 spf=pass (domain: gmail.com, ip: 209.85.219.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id kd11so3229330qvb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IsRnqmzipK9x1Gn9CUnf5pg2cWjIYiroB6HYppH5Fic=;
        b=YXyGQe+m9fYCo1dMzF5BKkWwrSPLuntZZPLJDAmw6T79PNw2Y1x+qicJAEWSVEmsIH
         eyxxTrN8wJ1X6JQr5oKTpSUSisQeM0r5r1tVnmJ5gqY9Uapke4l3gXNKfz3NfLQk0Ne0
         wBPFdXNPG5qfaBnKUoIgyDF4eXEQtDw76mOCm6yp3NK2ZdjkxbltSMj6/xBVkoyktHJd
         QQZk5tkhvUsxrbqM4kbI/fF5QkUdpz8DEcvOfTSddsKfQzDiyfk65gb8jcOAAzd4zEjJ
         I+NJ4yqu1DMjmUtOVq1T13qkUVQHKPuThdT+KW8XQ+cuW0nm17oSnOh4JyAYvnpmnAh8
         r6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IsRnqmzipK9x1Gn9CUnf5pg2cWjIYiroB6HYppH5Fic=;
        b=E1gR4Di2LQYbznRRokLVSj046I4b9xhXFn+2HSUe6sNCz8YDXp76s4C91FZJ1xxHRL
         pDz+hTgncbjFey6SeD8VAYE1gNCKXfV6QhpKyYESCUnnPYpHc66f38WDLlDxhm11oGls
         tj7mD8ejA9Wf5HOOrIQ74PuVDHGoTMhe5Fj9kSKkIPzgU1Jgd9369gWT5TrO3SqCnJGi
         TDkD3bKLFrHSBo21AsY4dupP9MmY1H0HUGixsMoJcAS97n2ESEY8UYapdnTW8/xlW4UD
         iFNI8jtI8PqR/k38DUsfr2OXNP4+D9gWV8IX0+kazczAewpoeMlKVYYr/BFfFHd6lUWc
         GuMw==
X-Gm-Message-State: AOAM530qiq5ohuoayEcB/2viPfMnM9PZ8LVqfWUY/2g/L4h6DGWe+1Ku
	XahGkY1H820U44vE4EhQMCjzH0VlOA9APA==
X-Google-Smtp-Source: 
 ABdhPJxK4InjU+EvyXjdN9AxcEq9pH7g4lUUTjVZlLlNlwr6vLsDRIcNk5FqagwftwgiPaIuCFbiaw==
X-Received: by 2002:a05:6214:29ee:b0:456:3b89:a7fb with SMTP id
 jv14-20020a05621429ee00b004563b89a7fbmr13231560qvb.74.1651153705284;
        Thu, 28 Apr 2022 06:48:25 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm20809qtb.48.2022.04.28.06.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:48:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	jdmason@kudzu.us
Subject: [PATCH 14/15] linux-yocto/5.15: fix -standard kernel build issue
Date: Thu, 28 Apr 2022 09:48:00 -0400
Message-Id: 
 <6f449782a60991ef7fce66f2e1cf4743e4e4ec2f.1651153370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1651153370.git.bruce.ashfield@gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:48:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164962

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""

The revert of commit [fbdev: Hot-unplug firmware fb devices on forced
removal] was done to fix powerpc fbdev issues. Upstream went in a
different direction, which means that our fbdev routines have conflicts
with -stable updates.

The fix for the fbdev is in -stable, so we drob our reverted commit,
such that 5.15 builds again, and fbdev is functional.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index d3d277b172..fe1c7fb533 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "21f94b6c9601dbb03036d539482471ddbe753626"
-SRCREV_meta ?= "7e73214eee6728b7984d12bead8ad3af2ce06db9"
+SRCREV_machine ?= "4648820c6ca4146a3dbb4eb6a5b4ac93401f9596"
+SRCREV_meta ?= "a43150cc38bed6bf82d9217335348855c1d7eab8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index afb330e922..3f4509c921 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2521f8951adffad70d844209b73cd8d8878710f1"
-SRCREV_meta ?= "7e73214eee6728b7984d12bead8ad3af2ce06db9"
+SRCREV_machine ?= "7505af5d55038e463bf45794603b6efabb655817"
+SRCREV_meta ?= "a43150cc38bed6bf82d9217335348855c1d7eab8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index bf4ea952cf..02b16b5f25 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5dab48a9c4bb681646b06004bc081cc5b4e65285"
-SRCREV_machine:qemuarm64 ?= "fc0cae7371697d26cda76f46d352648a0d8a8fd8"
-SRCREV_machine:qemumips ?= "58617a04ab52b58a5393b5088a3199c3d28b7a15"
-SRCREV_machine:qemuppc ?= "fdf86234f2a35c3fe2457ee02847b4351fdeb08b"
-SRCREV_machine:qemuriscv64 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
-SRCREV_machine:qemuriscv32 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
-SRCREV_machine:qemux86 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
-SRCREV_machine:qemux86-64 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
-SRCREV_machine:qemumips64 ?= "0294ba0989f839fb11c41fb887707cb49d20143e"
-SRCREV_machine ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
-SRCREV_meta ?= "7e73214eee6728b7984d12bead8ad3af2ce06db9"
+SRCREV_machine:qemuarm ?= "2d10943aa7855dc5bbe2c74c6f05ef2e4eb39e3a"
+SRCREV_machine:qemuarm64 ?= "b623e8d1eaacbeee250ea37328a9b566ca52f890"
+SRCREV_machine:qemumips ?= "7e897b81f922149be5edaab68eb8034a75899ce7"
+SRCREV_machine:qemuppc ?= "c3db8eb7b0a5b171ac4c0c6def487b5572a7b3f9"
+SRCREV_machine:qemuriscv64 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
+SRCREV_machine:qemuriscv32 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
+SRCREV_machine:qemux86 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
+SRCREV_machine:qemux86-64 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
+SRCREV_machine:qemumips64 ?= "9868746e0736d8659374e93129cca9d3413a7918"
+SRCREV_machine ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
+SRCREV_meta ?= "a43150cc38bed6bf82d9217335348855c1d7eab8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


