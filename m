Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285C9C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:20:05 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.13114.1647969604128598683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S0Sue87i;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id s11so14996846qtc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qQUzNoaUFC6gaLixuaBpSyfj49lQGheJggiIGqFOEFE=;
        b=S0Sue87i0vUHuzuh3mRPkyrYd5qdgbxNEqJOoVz4sm7YOpfq6kq8oE6YMwu2lijBrm
         kOBfbkXYS5z/AuSIHGd+YzNuYx04OH0kCmooZTu96AJZxMhMqRFBkcpiu1rpghuOnvQU
         9ri5UFwpwzK92DLMJvSN90YhYG8XL580tHCwgLIJz/PYdHl/uH4i2HEBPTwNJlMlthnv
         N5P2sFOiYvXekZq93mE5y0IKIXbellHL5rZff+JxVGfKm9dc/83AIl7EiTrCn/DM9cNx
         i4Zib79NWsMgfzsYDJ7EIbfEQ2jBAXCChWf/1U5QcPli52NH9ubhU31WdwxpedzSR1Nf
         0ZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qQUzNoaUFC6gaLixuaBpSyfj49lQGheJggiIGqFOEFE=;
        b=TzJEmm7+gAnECIZLyB3uPZoakmarK3nOK9JN/EQgD5APJHd8/f/QfyWP1j7/SK0GGR
         tJ5FHuC0o4NJDr78S2p+MujFb8VP9eO26rEw4VIszOS9e0qS5NS0tD3xCAVcg+EUPqlY
         u8dkynE2ZXxy5TU73uayFgpuNVM4IqwDCM6TgmJK8j3cU8w67EPOjAYGGRf3Ivk4IWfc
         fsFqf55Hm24oBlPt86Iy9NuFQAnsZ3xHnoSotlnpPl0ZiDEG4agVEa8/wQLM5XmvFcVM
         uZvCQuy9jataTvvQ0SaCvfsSllgcXw1kT+TWB7ZXveBWMSISQetKhqmBuPh1FRxrrHDI
         Yc4A==
X-Gm-Message-State: AOAM530Qs8+RTZfheqVEd0PcBQ91fgLMVtq5yM95KJ+zfvBa+UrYYpGB
	Dhcczjg7qSykgAlFecmpElkQgajweeVKWw==
X-Google-Smtp-Source: 
 ABdhPJzr2y0zK5FpAGJbXzKGxZBJjB2B7rOk6/vzAU1zzV9jc60hcItk6jb0YBuW3VQQ8MQVDGdX+g==
X-Received: by 2002:a05:622a:1a9c:b0:2e1:e23b:2374 with SMTP id
 s28-20020a05622a1a9c00b002e1e23b2374mr20979358qtc.447.1647969603136;
        Tue, 22 Mar 2022 10:20:03 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a04c800b002e06d7c1eabsm14019648qtx.16.2022.03.22.10.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:20:02 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] linux-yocto: nohz_full boot arg fix
Date: Tue, 22 Mar 2022 13:19:50 -0400
Message-Id: 
 <75b7b50a2a8adb09d2a070a61c271e387a555471.1647969481.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1647969481.git.bruce.ashfield@gmail.com>
References: <cover.1647969481.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 17:20:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163558

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  2 +-
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 20 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 6 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 70b572e808..36eb86f8c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "abd24ddc62072fcc5ecf12cf8feadd2e6fda59bd"
+SRCREV_machine ?= "e0d87d9831a6e0df20a370adc9aba0d032d91661"
 SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index ebd811c7bd..b47ba4c2b9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d6781443bac8b711a2c55898223dab38f2ed5896"
+SRCREV_machine ?= "5486de5bb7320876bbfe6f92245f6819afed182c"
 SRCREV_meta ?= "ea948a0983d7b7820814e5bce4eda3079201bd95"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 9e954e45de..2c46c665a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "682b9a24accb1e3a305957dec28f7f565db95369"
-SRCREV_machine ?= "5e844e753c3e1f153af9dfee6b88e5dc1e57f30f"
+SRCREV_machine:qemuarm ?= "38f8b1b5b87959e6cb9367151e233d27befe015d"
+SRCREV_machine ?= "cc70f051e56005acda2e6ea994cadfb2538e66f6"
 SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 244b907cd8..eaa496dbf7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "000e76cff61c46e4a89c253d499bb92433807196"
-SRCREV_machine ?= "ba4a30c056f9fbb4286f9a79cd574025bae86c8f"
+SRCREV_machine:qemuarm ?= "25cfdd5cd20eb874209ee632b8b4ed567686523b"
+SRCREV_machine ?= "e54b9d06bee4c182cb376d570017c7b425369f3a"
 SRCREV_meta ?= "ea948a0983d7b7820814e5bce4eda3079201bd95"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 86d9559469..3d3ee6d623 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "56cfcfb12870782355bacaf8bcde9e268f422140"
-SRCREV_machine:qemuarm64 ?= "3aab5bb12bc180d582a6f82e4a085f45a7b0c283"
-SRCREV_machine:qemumips ?= "d76ec4c19a876a3235567ab2cee2e33f2875f79a"
-SRCREV_machine:qemuppc ?= "513a8885de593e8b1f3c24595c015bb9b1d55563"
-SRCREV_machine:qemuriscv64 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine:qemuriscv32 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine:qemux86 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine:qemux86-64 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
-SRCREV_machine:qemumips64 ?= "b63b87635569c07343f25194abf008f1e27c0bca"
-SRCREV_machine ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
+SRCREV_machine:qemuarm ?= "74469c4b03f62e4b4da066e52785ed74b1d121ae"
+SRCREV_machine:qemuarm64 ?= "69f185342f516efa8a9233e31d2c3f8356b3a388"
+SRCREV_machine:qemumips ?= "d97607700b2fba19af10b2110b99c448ed9a88e9"
+SRCREV_machine:qemuppc ?= "090085d4bb6181c3b972d82c9f8f7ed88c90ad6b"
+SRCREV_machine:qemuriscv64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine:qemuriscv32 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine:qemux86 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine:qemux86-64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
+SRCREV_machine:qemumips64 ?= "a1b43f69bce61143dd4d6d637f619eadd3fabb6e"
+SRCREV_machine ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 6965df13bb..43faa35dc1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "af65cb567e671fb5eea7224f9252a9cdfd37f7d0"
-SRCREV_machine:qemuarm64 ?= "6101a726c5cfd4c995f9ed3cec3dadc593f1765b"
-SRCREV_machine:qemumips ?= "24b1491fde2da59de37bf4b43e49e4d9725a700e"
-SRCREV_machine:qemuppc ?= "09492ed54dade6f3e646b31be5e70b07b0c22755"
-SRCREV_machine:qemuriscv64 ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
-SRCREV_machine:qemuriscv32 ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
-SRCREV_machine:qemux86 ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
-SRCREV_machine:qemux86-64 ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
-SRCREV_machine:qemumips64 ?= "98e983921ddecb99fe11439c033273b90cc5d413"
-SRCREV_machine ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
+SRCREV_machine:qemuarm ?= "f68974a8286c17346ca33b50617eccdf1becd1aa"
+SRCREV_machine:qemuarm64 ?= "72bd53de75fa937660c2bd25931ffaa05086e990"
+SRCREV_machine:qemumips ?= "334923580808976e3e7497dedfeb065c0c1ea977"
+SRCREV_machine:qemuppc ?= "418dd4b6087d1a3a3e9dd47b4cae0dcda27867e5"
+SRCREV_machine:qemuriscv64 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
+SRCREV_machine:qemuriscv32 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
+SRCREV_machine:qemux86 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
+SRCREV_machine:qemux86-64 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
+SRCREV_machine:qemumips64 ?= "7b53697cddec0526e8c10f25e1a6c2bea7d240d2"
+SRCREV_machine ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
 SRCREV_meta ?= "ea948a0983d7b7820814e5bce4eda3079201bd95"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


