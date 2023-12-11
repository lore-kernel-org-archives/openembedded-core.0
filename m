Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8D4C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 14:28:44 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.9525.1702304921914048553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 06:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AZ0DkXA+;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-77bcbc14899so280572985a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 06:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702304921; x=1702909721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mb94yzswDrXR3O4U1kOanzGKRsKF/ehpMBx671L4S6g=;
        b=AZ0DkXA+81nP9hRnIX0GZOB0Gc0skszoiB6qaBlDB2JcaAlG1/tCF0P7708o3UXftS
         pYNm+3p+xWohAkl5h/YfoBr4qDSjVC7dCvOOpudnofkUaaRb5FrnFZF8VPDKoqbRSGKz
         vclkxsi1lFLvRV9QlU9EthqhapWhjTVxyAHkhWadKeOPJXiuVOFaVOrw2B0L+cE5EmhU
         NSeHAWThcsmBwInwe6vOkaHX1ClLOfrHyW2ZN0HfzjWWdogRlM2uT2joxzdqK+JLbzFB
         yJrn1IASBG6Ai/dRunutpEJwdqn+VSfL1wHW0L2TbYwK4657j+ibjz5O+V3kgj+In/CW
         20rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702304921; x=1702909721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mb94yzswDrXR3O4U1kOanzGKRsKF/ehpMBx671L4S6g=;
        b=PIK5JOP5xIW3gb+imZRVeTl46UxyLL7OU29aFl3uEtMbPRsXYbuTh03C+V1f+vtGpy
         vrns/LNaFLACEeJmrDBkAVwmdScCBcoRavsiJkAhsJXN1zjjHQQxbRXzPolBwqwLYn+Z
         7vj7hXgRJa0L3DdckDLWzjjkN//yVZwv/PqIiKV7E8EEZ22zwrZU3huzBURX407h6As6
         Zjr6YwE2dW0sVVN+/SjnF1C4tIP+H6F7UvDtQZWKFdCNPUv0GaOOkj+ugScuOvs6sHMe
         34yI8l6sNPJgtdzTDVRDobxGx32MnWHx1a0M7uXyxR/TGYJfJuBN7ogZWhV9qRPsOxv2
         hfiw==
X-Gm-Message-State: AOJu0YxQuP7bSY/72zDscjYbWPAtTCoSytB6kbrW+wHibzEYjrz0VhyI
	q9KB2lvk+3jFU6D5OggKFs8=
X-Google-Smtp-Source: AGHT+IEOmWb1RMrrAus24JbPWxpbEJnqPWRFc8Npp8afBadmtmMG1hN5zGJbYg5+vMoyr+p7J0q+Hg==
X-Received: by 2002:a05:620a:2456:b0:774:1ac2:79be with SMTP id h22-20020a05620a245600b007741ac279bemr5923615qkn.53.1702304920840;
        Mon, 11 Dec 2023 06:28:40 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g29-20020a05620a219d00b0077dcb5166e8sm2945857qka.93.2023.12.11.06.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:28:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/1] linux-yocto-rt/5.4: fix buld failure
Date: Mon, 11 Dec 2023 09:28:38 -0500
Message-Id: <20231211142839.4149240-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 14:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192169

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: rt: drop -stable migrate_disable
    Date: Mon, 11 Dec 2023 08:50:52 -0500

    The -rt branches already have a migrate disable mechanism, we
    drop the -stable version to fix build issues.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 396d218afd9..58e10be524a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9ef07d0d41fa14bf7366dfe5ef657d9f24b35349"
-SRCREV_meta ?= "9f1a56eeea58f7d9b597f0ea33e43e35b8288762"
+SRCREV_machine ?= "43d5f7eb85acc21ec87ec45b2cae127dad8bf7a4"
+SRCREV_meta ?= "34f54c16ac6ef29441f95dd3b932729f01008999"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 1048af2f790..01894be10cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "73dbd7ea55670218b017d9719868e7d61d0b1011"
-SRCREV_machine ?= "0b41bdd8d544c72af97c34e9c464b7534fd18c7a"
-SRCREV_meta ?= "9f1a56eeea58f7d9b597f0ea33e43e35b8288762"
+SRCREV_machine_qemuarm ?= "7c33fa232f43e9059395bd30e23ef3c16359ba11"
+SRCREV_machine ?= "42abef1facd8bc8d1f51470493f08d87d0862f8e"
+SRCREV_meta ?= "34f54c16ac6ef29441f95dd3b932729f01008999"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index e932394c90c..e8d935edea8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "62367606f47fb5832c10c3d5ea370f9d162504a0"
-SRCREV_machine_qemuarm64 ?= "dbcb9a6b795e82a7869f213ce4a7d30779cc0b5c"
-SRCREV_machine_qemumips ?= "0386462f3785de758d8c333ddfa9b3a7ce26e048"
-SRCREV_machine_qemuppc ?= "4bc83a0d08c8ca1fba167dff9dc652055626837c"
-SRCREV_machine_qemuriscv64 ?= "4d141be8fd148e0ea68d8f957f527ad5f22015ab"
-SRCREV_machine_qemux86 ?= "4d141be8fd148e0ea68d8f957f527ad5f22015ab"
-SRCREV_machine_qemux86-64 ?= "4d141be8fd148e0ea68d8f957f527ad5f22015ab"
-SRCREV_machine_qemumips64 ?= "c60dba46dca65775a5d5bfe0e41b0eb5f55a3ba7"
-SRCREV_machine ?= "4d141be8fd148e0ea68d8f957f527ad5f22015ab"
-SRCREV_meta ?= "9f1a56eeea58f7d9b597f0ea33e43e35b8288762"
+SRCREV_machine_qemuarm ?= "76b8ef2c7ecb7cf484e0eff4d509ec57c310d06e"
+SRCREV_machine_qemuarm64 ?= "23b9912a979d98708f3adc8312af42eb9049c1d6"
+SRCREV_machine_qemumips ?= "2e266704c46066c80821a491ad6f42c930e00d5d"
+SRCREV_machine_qemuppc ?= "2343a888a77678d4440032d22327f753d1a90cdb"
+SRCREV_machine_qemuriscv64 ?= "dbf9e2bf8e764643b8ec4c236fbab73228413a33"
+SRCREV_machine_qemux86 ?= "dbf9e2bf8e764643b8ec4c236fbab73228413a33"
+SRCREV_machine_qemux86-64 ?= "dbf9e2bf8e764643b8ec4c236fbab73228413a33"
+SRCREV_machine_qemumips64 ?= "73d9e7eaf1161e5deb6d3fbfdefb07fc5fd87d3f"
+SRCREV_machine ?= "dbf9e2bf8e764643b8ec4c236fbab73228413a33"
+SRCREV_meta ?= "34f54c16ac6ef29441f95dd3b932729f01008999"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.39.2


