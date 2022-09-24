Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50465C07E9D
	for <webhook@archiver.kernel.org>; Sat, 24 Sep 2022 02:21:00 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.3043.1663986050493977574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 19:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TtihmCPd;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id cj27so1140939qtb.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 19:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=FjLuX60iaSrmG5iaVvxGBUMz5cwDfTwKem3s2Unto5k=;
        b=TtihmCPdGDx09NYV2SWE6yPwZ/Gt18IBQMhffAjNmBKCbPd9DywhSChf7frdqWGobG
         OQxu3iT1USUoPDKZiLxg4N9fBiS3sv+JPhFIqupXchRtg5o62ukpig2Mx3YyxUZFXkcn
         62aqNxru9PzPzKyxdRYyF6z+Z2KX7EYoXIQiOXaBlJpRL8Pml49hwW8O51VftWkhgz6d
         E4bV25e2sDOupnAdQoRSQEVSXSRN8BndIjdWoiMZ4ttYdHqoy1tlxoDFm24MtQaoUaKv
         qpqQ22/dzFMzKEk0tF4JwEa5ic246gebYn1qJ0jQzKL+PJNKOqzZeW0iYCLE75qc2QYC
         5pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=FjLuX60iaSrmG5iaVvxGBUMz5cwDfTwKem3s2Unto5k=;
        b=3I/xtWdzRiCkclvX86ElHhkZr25Rpknqk2dTwwjy4/xxWFP2lmq1o3zp4CfIF2JMgn
         VOE/NQE+pExqcKkPAXjA+/oP9vFBrEjUH9r88BV8CQGTJgIb/1zCpKXHswo8NXVM46S+
         5ZVrBWTjYAnkI9bfNd/7eQPVcUXJBOjQWUm9+Feq/GZFb62tuac3UA0s96Hpj0t7SoI/
         CJd6yS+NciHWW1Nm/xeWCLxDjCWSsnPPQzxxFgREofsVvG12oVFGcHwQ0D9pr8um989R
         muMTwq0TORc/T/VN1F6bgHSNC5MIuOgE+13eDTuJyO29K8IA6bRDt6UfopFP+a1w6rhD
         kEzw==
X-Gm-Message-State: ACrzQf0KjkyDoLIdtU5SCrfUyFKdvZRELi0OPIkrrGSiuavNGSNsSWd9
	LLXNFlwh+wcvHr8L+mNS4eQ=
X-Google-Smtp-Source: 
 AMsMyM6v8+wBuc55YMD4w6T9u6trTEl+3KcUQ5WN1CM0TM0xK0LrUTTsIDgPYRgU+eCrWawFQDElbw==
X-Received: by 2002:a05:622a:11cf:b0:35b:a369:cc3 with SMTP id
 n15-20020a05622a11cf00b0035ba3690cc3mr9707972qtk.11.1663986049435;
        Fri, 23 Sep 2022 19:20:49 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 w25-20020a05620a0e9900b006b5c061844fsm6949566qkm.49.2022.09.23.19.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 19:20:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.15: cfg: fix ACPI warnings for -tiny
Date: Fri, 23 Sep 2022 22:20:47 -0400
Message-Id: <20220924022047.19628-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Sep 2022 02:21:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171005

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    1128d7bcdcd acpi: fix defaults for x86 and qemuarm64

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 65a0b5c5a4..6f8648e004 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "98f38e83ef2d2b00de16c507c308bd806661a53f"
-SRCREV_meta ?= "81c59906067bcb77841113c76daad85fb94688d6"
+SRCREV_machine ?= "dba1b7d90813231782bdeda1bd169c93b35c94e0"
+SRCREV_meta ?= "1128d7bcdcde490d4f35cc00c97f5410bb240d99"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 358501fc2e..4f2bb48743 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "35d0c78ae3efd6fe1c4fcbf4c8b0d7f43fc2aff7"
-SRCREV_meta ?= "81c59906067bcb77841113c76daad85fb94688d6"
+SRCREV_machine ?= "33e7eea5c4545a973cf01a849c2b45fa0cd1fa13"
+SRCREV_meta ?= "1128d7bcdcde490d4f35cc00c97f5410bb240d99"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index b1b1d9e94d..f0ec8d741a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -15,17 +15,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1e5a26d496c1671b38474e191bb748a47dc7dc59"
-SRCREV_machine:qemuarm64 ?= "e4f332a5c08ddebbd1a36cff5270e5eebe278cf4"
-SRCREV_machine:qemumips ?= "4dd7bbdb60c07d2861468a9c8545ac9e97ba400d"
-SRCREV_machine:qemuppc ?= "c1ddaa69dd463a11645cc5362a3200dbce28d664"
-SRCREV_machine:qemuriscv64 ?= "c9162b76e4f4dad76ff499cf427f45f3383b8a57"
-SRCREV_machine:qemuriscv32 ?= "c9162b76e4f4dad76ff499cf427f45f3383b8a57"
-SRCREV_machine:qemux86 ?= "c9162b76e4f4dad76ff499cf427f45f3383b8a57"
-SRCREV_machine:qemux86-64 ?= "c9162b76e4f4dad76ff499cf427f45f3383b8a57"
-SRCREV_machine:qemumips64 ?= "481a521e65375aeef6b8903c8df6fc2b23a184b8"
-SRCREV_machine ?= "c9162b76e4f4dad76ff499cf427f45f3383b8a57"
-SRCREV_meta ?= "81c59906067bcb77841113c76daad85fb94688d6"
+SRCREV_machine:qemuarm ?= "efe28b4b16d4a1a19f59b4650a0bfb23ffc8c40e"
+SRCREV_machine:qemuarm64 ?= "66986670c45f63d2ed2078e07aa817ede88025ad"
+SRCREV_machine:qemumips ?= "aeeb80fd7f684aca830adb7daf32cfd80637cf3a"
+SRCREV_machine:qemuppc ?= "5c6387a562af89ec92546c1374a120ac240f14e6"
+SRCREV_machine:qemuriscv64 ?= "0e51e571701842db33ad96f6ddc8cc6b23230627"
+SRCREV_machine:qemuriscv32 ?= "0e51e571701842db33ad96f6ddc8cc6b23230627"
+SRCREV_machine:qemux86 ?= "0e51e571701842db33ad96f6ddc8cc6b23230627"
+SRCREV_machine:qemux86-64 ?= "0e51e571701842db33ad96f6ddc8cc6b23230627"
+SRCREV_machine:qemumips64 ?= "20ec37851f4ee9965120937dcf2567f15e72e07a"
+SRCREV_machine ?= "0e51e571701842db33ad96f6ddc8cc6b23230627"
+SRCREV_meta ?= "1128d7bcdcde490d4f35cc00c97f5410bb240d99"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


