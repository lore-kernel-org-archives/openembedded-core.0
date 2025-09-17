Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A76ACAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:45:03 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.25312.1758120297326254896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 07:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JB/46DUB;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b5eee40cc0so65529361cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758120296; x=1758725096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=md6V5olEA9VUZhrzLuOOKNXC94bEE7C/lxwbvbYFsU4=;
        b=JB/46DUBaYJ8CfCzZE1KdVOkhE81pw9Yn2DdmL/h5zogWfcmVgBImsfx698AxOhXgt
         HMFRQIbHBoO6oployMKYrNXHBlgsI+lT3ORmf53ryoa14u6H4BQnPMVlUVhdVfB6+0KS
         GLucwMXKzhJukWWzsIiA3fD+qleRzG7XZsw22ulpQ4iJk7taAEYup6NA9YDH+wBQNcju
         DJCMXuGUCP1yx2jlIi/pfcTm1+2HXY7My55Llqtj1aXIVhxhKCLDftTD+34kYsympAhl
         0Q2pyh6q1rwOAOC9og5M73VMFo+/Pb1l54QG3J78J95qxyLKvbgIlG5PpFN588u4+kyt
         y6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758120296; x=1758725096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=md6V5olEA9VUZhrzLuOOKNXC94bEE7C/lxwbvbYFsU4=;
        b=RvMlRq4DViAs+Ocf/7EnI5prakoTetGbL3pxA1xwXmwylb0S82RPYff5TTJUv5LGbi
         TBGgfhEZ7rlWu6gt8JwJpS/bKjt/gpfboFUk6KOIyD+Ygv1O8hoqoKa8RjiJOlL4ITvU
         sV3z1BWmUhND4F9CKtlVpunEQBa78vO6GVMLy9M5JhKHWXIzCvPB5NqKrHHQ3EV9knFz
         5hiOOW/i+geZoM3EHJwZQJDTyvvHWmNBKxCqy1gnq5VZSYzoBy7/Pgu0m0/vm7IjFgRw
         rXuD7biP+IdloKAd+AD85miySEuOj+NE9BDAKU9U0v/SHf2Sfyv17CLmS69OOfLGxRs0
         2/Mg==
X-Gm-Message-State: AOJu0YxnwtNIfpgiJXrvcL8BHFUVJRz7yZZrVz72wkI8l0Yb7ibCKsYO
	GGuR9wmMwJEJjajq170sMiMiU0bfFTx03tNr4C9Ua5FfAZcfMXo7cwNR
X-Gm-Gg: ASbGnctkAVFeGQb9VVhx4vqmT6iD9HFCIYtNvqDHUni+xHdeZaGcy2pU8XCLPb0GevV
	ZehGgE86kZA1lQ9fYHB5/fCZ3m5SXKv05cECT6xIUjfMalv0tPAakYE8E53Pzowwicmq43tZSo+
	SWVM4wTzW+F0/LxggR99WamhOhK53xXJm9KBgTcU9RsUJcOVJyVgHQqvBcnmYEuPDHODKbl6whi
	V4QvvDyJi2Vj/M0XrqnLGGkjwtryr5GXRXTCcdLSSedl2f7ZlbXfq3+qUe9avQRpPPDm1ILLjZ/
	42gLQ7I7xSVMolksW5WlWMoOVQQuD3jEYxWg45OAXgDoU52eZp+abxo5i6+0vutEubinoM/iz1x
	KsLdX9txKHJTVS7It441UraivD9ahwPmTihtrGl/aDR5XH7kvnRXrQk5PIWNtOy18G+evmXPbAQ
	OGhwuZX7ok1IqDUzEO5tzEni2+YDr1J2LI10Y7JUizwqgS0EBgI0XTq4vttWo6+hMPKA==
X-Google-Smtp-Source: AGHT+IHzIZRvbvAswY+eQYyv7hl8p6U3YGMEdPz5AUHhN2ufwNEgS0EoW6dzpdUNnc7T++UGvdYQxA==
X-Received: by 2002:ac8:5813:0:b0:4b7:ad2a:7505 with SMTP id d75a77b69052e-4ba65bc1fcemr30220671cf.11.1758120296050;
        Wed, 17 Sep 2025 07:44:56 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639dab3f3sm99312381cf.34.2025.09.17.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:44:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.16: defconfig: fix configuration audit warning
Date: Wed, 17 Sep 2025 10:44:54 -0400
Message-Id: <20250917144454.3728184-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 14:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223609

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.16:

1/1 [
    Author: Trevor Woerner
    Email: twoerner@gmail.com
    Subject: defconfig: cleanup orphaned CONFIG_SCHED_DEBUG
    Date: Tue, 16 Sep 2025 16:33:24 +0100

    In commit b52173065e0a ("sched/debug: Remove CONFIG_SCHED_DEBUG") this
    Kconfig option was removed since CONFIG_SCHED_DEBUG was made unconditional
    by patches preceding it.

    Signed-off-by: Trevor Woerner <twoerner@gmail.com>
    Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Apply this after my recent -stable bumps to 6.16.

Cheers,

Bruce

 .../linux/linux-yocto-rt_6.16.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.16.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index 9f3f940b77..e541805938 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4ad01ee57e42c93abe2d26816875854c5e475f9e"
-SRCREV_meta ?= "d32229904a43cdac64d57932f997990519b6b773"
+SRCREV_machine ?= "3b7f5e9e65320c4b0d5daf517e60a5f683ee1031"
+SRCREV_meta ?= "5cfae705d58ce214867b7b25653efb03b613c6df"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index da4f1032ea..643f6e7923 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4f0f726a99be121940c4fb44634584d4027073b3"
-SRCREV_meta ?= "d32229904a43cdac64d57932f997990519b6b773"
+SRCREV_machine ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
+SRCREV_meta ?= "5cfae705d58ce214867b7b25653efb03b613c6df"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 17d4ae35ee..ff4b8afc5f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.16/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.16/standard/base"
 KBRANCH:qemumips64 ?= "v6.16/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "29139e9a27fc305eb999bf2d02086deb441753ba"
-SRCREV_machine:qemuarm64 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
-SRCREV_machine:qemuloongarch64 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
-SRCREV_machine:qemumips ?= "cd9be6bce5b979643b3ca76bbaf0fbe9680cc6c1"
-SRCREV_machine:qemuppc ?= "4f0f726a99be121940c4fb44634584d4027073b3"
-SRCREV_machine:qemuriscv64 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
-SRCREV_machine:qemuriscv32 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
-SRCREV_machine:qemux86 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
-SRCREV_machine:qemux86-64 ?= "4f0f726a99be121940c4fb44634584d4027073b3"
-SRCREV_machine:qemumips64 ?= "14d54ff925a0fff26c30f6fe7eda8b0310f8f512"
-SRCREV_machine ?= "4f0f726a99be121940c4fb44634584d4027073b3"
-SRCREV_meta ?= "d32229904a43cdac64d57932f997990519b6b773"
+SRCREV_machine:qemuarm ?= "71e0898274de9dc6edff0f2d9d6fa213dae11272"
+SRCREV_machine:qemuarm64 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
+SRCREV_machine:qemuloongarch64 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
+SRCREV_machine:qemumips ?= "c2ab3a7b951876e2fcbcae9bfa816f8484cc66cc"
+SRCREV_machine:qemuppc ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
+SRCREV_machine:qemuriscv64 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
+SRCREV_machine:qemuriscv32 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
+SRCREV_machine:qemux86 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
+SRCREV_machine:qemux86-64 ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
+SRCREV_machine:qemumips64 ?= "14ae3e2469aa1e43fcb65a030d9c184bbec3585f"
+SRCREV_machine ?= "946b80132b9ce459ba84f90d4b2f63eeace6014d"
+SRCREV_meta ?= "5cfae705d58ce214867b7b25653efb03b613c6df"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


