Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24245C433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 01:23:51 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web08.16304.1644715429847423983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eNuxXSkU;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id o10so11560839qkg.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q+N4OFHyIjG1pCm2tkd6ZR9f/5o8DJzt3NhtblxwKyo=;
        b=eNuxXSkUtfRNNl0b1LN1bjHZtpDe5lA4b4Nw7tA6gvv5V7Iu7SRSepDa5XazNS53RQ
         VsuRFFlOidkaq/3+KGnpNsLUA5e2J2XaTHfA+sOBCApH+W0N2gpZaLqQ0AM6Jp8zAj/o
         9GZLPfeo0LZqqimWdxPhEbtZILVLlWg74Kq6T0rQNtDG1XVj/Aon14z6U3PtE4bJfCW2
         hXN4eHwAdECIcMYJqX3yBmB4a1hr+NLrubrbVZ893DHwbuke/TPTe79vH+OEPMH3+Xx3
         3dayfjaBuWkYZPMXId1QdN8pOdJOderFyPkoLGknT2OotOKuw1bpQvBHcpXuALa0qxF+
         7V/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q+N4OFHyIjG1pCm2tkd6ZR9f/5o8DJzt3NhtblxwKyo=;
        b=IXn35fY4HHZn/h6dowQjGZ9LPA6UmmXlpyLPZKM2Mr9bK/ImZchhFjqTndhCyCiRdn
         H5v0/SVsKPi2EJ5Ad5IY4byVMCbiA8sO7mvCFDmddU2Y2q8H9HDnyj9dzAAO21alE8Vm
         PlAlUk0IsNo4geo2Tn1uC3YFetZ0zCUBQxosSyI31hb0vmFpYPiTLh31v1VRBGQumwsj
         i9FBBEneX1Rl1o49+Cge2CHJ4QtRX2CyKb4aWwaBLLGSoC2HWTs94pGqakPw+vW8UdlQ
         q89dWa8PLLk/4fEKjL/dape6uocBHGiCWNcW43YsPd0K4GSRjsDL2GBc9Pj5eN0gi5uR
         sXIg==
X-Gm-Message-State: AOAM532DJX7lbHsTNudSTTvcsh4O3TZDqTp2LjgrsWAV0JDK3X0aatZM
	S7OqkLp3KbYJy2bWhUDw52vvKOtoCOqbDQ==
X-Google-Smtp-Source: 
 ABdhPJzyHXn7xunyduVRF+tp8tndjjL01n4PRGJ81nZ+ZI4b1AtDS6IWiSl7zG/Bnbho8ZRzZ35sdA==
X-Received: by 2002:a05:620a:28c3:: with SMTP id
 l3mr3958677qkp.633.1644715428987;
        Sat, 12 Feb 2022 17:23:48 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 w13sm13016556qkb.106.2022.02.12.17.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 17:23:48 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.15: ppc/riscv: fix build with binutils
 2.3.8
Date: Sat, 12 Feb 2022 20:23:43 -0500
Message-Id: 
 <07c976ec2bbced3acfc6bed87001305eaff2746a.1644715271.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1644715271.git.bruce.ashfield@gmail.com>
References: <cover.1644715271.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 01:23:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161678

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index de11f9c229..b52c1da342 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "819b32d5ed52fe25c6aa965547c52f677c056dcd"
+SRCREV_machine ?= "4e6023f9fa826a49ea6e1e66de07539965c06b46"
 SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 30d575b6ad..389d6fd68f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "53bc9472e3b5abbbc14ba3b04b1e1f655775347a"
-SRCREV_machine ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
+SRCREV_machine:qemuarm ?= "ffb9a067ac8550ae1064ccd5bf73639e0cefd71b"
+SRCREV_machine ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
 SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 5cca97c0ed..60e09c9ecb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ab335fd99ecec145298a277015aea6208a4d3a72"
-SRCREV_machine:qemuarm64 ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
-SRCREV_machine:qemumips ?= "1548a3de7beb155f932d9828e4f1e22345e78147"
-SRCREV_machine:qemuppc ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
-SRCREV_machine:qemuriscv64 ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
-SRCREV_machine:qemuriscv32 ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
-SRCREV_machine:qemux86 ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
-SRCREV_machine:qemux86-64 ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
-SRCREV_machine:qemumips64 ?= "8cf3fd2c0e46f72f25df69868b0b0d60f5e1dce3"
-SRCREV_machine ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
+SRCREV_machine:qemuarm ?= "7d3b6a747b3d2720f7ca4e6c1ac09c9b2fed553f"
+SRCREV_machine:qemuarm64 ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
+SRCREV_machine:qemumips ?= "4b33e9d2ce28398756fd1d13f0bbc84e768c33a4"
+SRCREV_machine:qemuppc ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
+SRCREV_machine:qemuriscv64 ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
+SRCREV_machine:qemuriscv32 ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
+SRCREV_machine:qemux86 ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
+SRCREV_machine:qemux86-64 ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
+SRCREV_machine:qemumips64 ?= "506576e469f6fdc2b7e888afcace4437469b27aa"
+SRCREV_machine ?= "20301aeb1a64164b72bc72af58802b315e025c9c"
 SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


