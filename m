Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2866C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:38:19 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.9781.1657636694942721108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 07:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GxAc/v9J;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id y22so5241454qki.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RuqA6tWSMBtUrZh3Ed/XCqz9DLZJ9qLDhZnl0xOUHqM=;
        b=GxAc/v9JeXJW075S5NYq5EN22Iv0j7ciIrQBoxk8HKNA/817lYzCrNsd/vBrrf2HpG
         i4EPolknbuoEpeaoc0hdCX5Q7kDWRRDxAgwVwCZLuDaLqBw2akNuIIzKyqTSaPen7z3a
         bFvS9KhPGR5oXCK6ZT3xHsIVav7/QtRFceH/TNBLa6Qya10yVuLesCo3ZxBwP79RuXKm
         aAtcEWAO90uifiEi1+LARWlGhzGVVtYU40s85fBN1rsmSzb2OjFB7j9PQ6kikT3Yr3LY
         wtCBwu+HBpmMHyq9xywgUTY+wnRY1p6HFpcPEcjfP+x4fk7bintRNUL2FEUz/GBduvjq
         2Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RuqA6tWSMBtUrZh3Ed/XCqz9DLZJ9qLDhZnl0xOUHqM=;
        b=Q3KKKWCoA/BpeYaM18991TsgZ9Ggr6n8RqRB80mjr4OXI13Cr9xhAl4Ued6liQ/Myz
         1P5iH8Yqcs6SATOoMTqmAPNW0Hoi4JD559BtXQyeke2wxXadhb6m9KPCHSWbSOTa6s6B
         0duYj1FZNABAa1ywD3QBTTz50LuHuyJMV/U25HMBLbFXt9/VSnbCW8sLqSDDcL1mQMjD
         dz6pEZ0TVWt7kppTHcxaBCQBHbc6BU9RCKVY8BS2buTsXA3Y5dxEvSvrGkt8snyfCAQZ
         UYRtPUyDoiffkJaHrCE3vjMzWZkMQBSRBGJWmgDFpDY2Q+i/12AAa5HoKe8QmEo4G61B
         YFIw==
X-Gm-Message-State: AJIora+7bS2Uu7LojCrXLWDeg+CrNNDBsHHW2IHrpwXxdGe1BMrHTGQz
	tUyc+3mQMoqxTWk4GL8Db30=
X-Google-Smtp-Source: 
 AGRyM1sxmDH0RVehyiEasY/Z+Qg1mpKnTH/YWBKZmlVxgFCvVYkedo0AuEEhJEuRV6/YKNewpp6IWQ==
X-Received: by 2002:a37:c14:0:b0:6b5:7024:97c0 with SMTP id
 20-20020a370c14000000b006b5702497c0mr12032027qkm.49.1657636693870;
        Tue, 12 Jul 2022 07:38:13 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 ff8-20020a05622a4d8800b0031eb643c0f5sm662292qtb.94.2022.07.12.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 07:38:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.10: fix build_OID_registry/conmakehash
 buildpaths warning
Date: Tue, 12 Jul 2022 10:38:11 -0400
Message-Id: <20220712143811.32130-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 14:38:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167930

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    4d201ec392f1 vt/conmakehash: improve reproducibility
    ae24d013888f lib/build_OID_registry: fix reproducibility issues

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 75868eb3d1..a695740976 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b54fa6bf849eca66798bb59d0632b76475e5ef98"
-SRCREV_meta ?= "5b3dacac6fe3c01c9df223897224c2367a5d20c0"
+SRCREV_machine ?= "f481ff6adf4be55c3ab89d0cf7243bbca69205c9"
+SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 15e03c653a..41cad3d37e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "fb53532e7f97426df28a91c56beff034b2487c21"
-SRCREV_machine ?= "953ea081e524baca7401da7cdf6aab5482cf9fb7"
-SRCREV_meta ?= "5b3dacac6fe3c01c9df223897224c2367a5d20c0"
+SRCREV_machine:qemuarm ?= "cab1bb0e702f93b16762fc560d6be582fbf86a6a"
+SRCREV_machine ?= "5239dc7bbd53a3d4d5e31f8631612c2eb6cee0b8"
+SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 4374bc790c..94b3dd2473 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -15,17 +15,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b0120b4ab3e79e53b9526fcb888a0fa7fb26b290"
-SRCREV_machine:qemuarm64 ?= "cb4d26c271f026d51c2944cd8e42e484707d760c"
-SRCREV_machine:qemumips ?= "cdec08a50503179be1b3ab5120617ef11345817c"
-SRCREV_machine:qemuppc ?= "c0821a7ab5ccfd996ff3a30fc8359fb73ba4b123"
-SRCREV_machine:qemuriscv64 ?= "c57efb0553276189e83d5c276255f576240a0720"
-SRCREV_machine:qemuriscv32 ?= "c57efb0553276189e83d5c276255f576240a0720"
-SRCREV_machine:qemux86 ?= "c57efb0553276189e83d5c276255f576240a0720"
-SRCREV_machine:qemux86-64 ?= "c57efb0553276189e83d5c276255f576240a0720"
-SRCREV_machine:qemumips64 ?= "43cc2c777b16ea5bb45bbae47b901c801c30dbb1"
-SRCREV_machine ?= "c57efb0553276189e83d5c276255f576240a0720"
-SRCREV_meta ?= "5b3dacac6fe3c01c9df223897224c2367a5d20c0"
+SRCREV_machine:qemuarm ?= "952586297dec710cba21ccf7f6fe4a1aadde0a5d"
+SRCREV_machine:qemuarm64 ?= "268aa738ea2454a1293dcb6c829c88552a5768d2"
+SRCREV_machine:qemumips ?= "bb9cabbe92165b556329cb0eed12ab67d2dee7a7"
+SRCREV_machine:qemuppc ?= "88ee9e4c24d32b6d0ec90756f0c7729954d3feae"
+SRCREV_machine:qemuriscv64 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_machine:qemuriscv32 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_machine:qemux86 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_machine:qemux86-64 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_machine:qemumips64 ?= "1a760ff71146a87cb5b7de87aed88db07a907ef1"
+SRCREV_machine ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-- 
2.19.1


