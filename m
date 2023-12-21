Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1763EC46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:25:20 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.51762.1703168714016099952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 06:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M2iwFwk2;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78104f6f692so60378785a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703168713; x=1703773513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RJUCRTihLnFbiwzXh/bdbt23SGWeLcSoCOFLvzkQSg=;
        b=M2iwFwk2xuW1hw/VQpjJv768VnY2P5WSTB8eH2e9TIE/lqNoVmxuiqY51pYJ5EZN5X
         H8OsbCq7EUkQyca6UgScD9yjPE1bmOE6vcrBsBN4pJR51gZExJz9qFebYnng60grdvDM
         xtE8FIXLkjIF8epUZbMf33GYdJiGkxsUKox+3v6f9NH5B1OMmoa/AaBb44tFea5XHmXm
         1DoEVQqQfQzcWRwFA4ksKvbZaJRVdAhEphgBu2HNPYYpLm8Nl+/JZ1mpI3mvcnSRgjO2
         jBHRKpWbeMxjzzwaj/LZTVBduAPHxxlxNO5sX6JdQmd8P5vjLAYRtRWJO7vW8RyWHFdz
         L7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703168713; x=1703773513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RJUCRTihLnFbiwzXh/bdbt23SGWeLcSoCOFLvzkQSg=;
        b=Eja5n3y+5x4mf1+QJlnTxh4KNHXWVFtYemXvWrmigfUwuM3QGgQz7dnNEkSeNy5XrI
         jH/D8sHGMcoeGipbwUzeps3a2lC4qf5U0Jhoy8UN+Qpz/XSk8sUohPhJrVCCz9hx1MVY
         0v8WZgFInsI++AfldaBpORLtyIXsKzXcnlIH+NeQu3XHMecDsvCNsGj5Eb+upoVM+WSv
         lxImHgcpI4ZPTyu4cViIr7SVgINoilWbbRGZHpnvG6wk5ll7jUWfLw9EtNNA3pnmexEl
         Zw3g5h+kjX9BGmPT17pSH9cM+3C+atxZYeZ/6bWAi6fiA/yJfjS0gr5+YU5tePVxB/tl
         vLjw==
X-Gm-Message-State: AOJu0Yxx+Iv6LTKUYTgfoOu/TvbRqkYHrT40sY0TJ5CaX9XgxpF6Ms11
	6w5ZYUYrO4sak7TRq9aSj7bkKYb6vcO9IM5A
X-Google-Smtp-Source: AGHT+IF3KIs3Gd4M+rFNllobaBJZP94eSJwJE1JHYib8BONO8LZqc4LVdGC9lSpQUb3hFXHGWyA00A==
X-Received: by 2002:a05:620a:2190:b0:77d:98a6:35aa with SMTP id g16-20020a05620a219000b0077d98a635aamr1031039qka.13.1703168713015;
        Thu, 21 Dec 2023 06:25:13 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g4-20020a37e204000000b0077eff6eece8sm679490qki.62.2023.12.21.06.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 06:25:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/6.1: drop removed IMA option
Date: Thu, 21 Dec 2023 09:25:03 -0500
Message-Id: <4312097ebc9cb52b1eafafaf33c8bdf1ba966f60.1703168370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1703168370.git.bruce.ashfield@gmail.com>
References: <cover.1703168370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 14:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192830

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Paul Gortmaker
    Email: paul.gortmaker@windriver.com
    Subject: features/ima: drop now retired IMA_TRUSTED_KEYRING option
    Date: Wed, 6 Dec 2023 09:15:38 -0500

    Unfortunately linux-stable backported this:

      Subject: ima: Remove deprecated IMA_TRUSTED_KEYRING Kconfig

      From: Nayna Jain <nayna@linux.ibm.com>

      [ Upstream commit 5087fd9e80e539d2163accd045b73da64de7de95 ]

      Time to remove "IMA_TRUSTED_KEYRING".

    ...to all releases still being maintained.

    stable-queue$git grep -l 5087fd9e80e539
    releases/5.10.195/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch
    releases/5.15.132/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch
    releases/5.4.257/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch
    releases/6.1.53/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch
    releases/6.4.16/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch
    releases/6.5.3/ima-remove-deprecated-ima_trusted_keyring-kconfig.patch

    So now when someone uses the feature, it triggers a do_kernel_configcheck
    warning when the audit runs.

    We added this file way back in 2019 so this fix will be needed on all
    active branches that are using an LTS linux-stable kernel listed above.

    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 3d9a98b506..8d07058b71 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8987c29d0fc5680adf4f3ac89d6c8bd2bc279a53"
-SRCREV_meta ?= "77f0a9eba731b83da9273d1c0d6bb1c3afd9b129"
+SRCREV_machine ?= "2fc300ad2664d72a382351afaa02208e3bcec857"
+SRCREV_meta ?= "5f331d55d0900030f5bc9b139c815f3f01a8ffd4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index b966797d0b..c0871532df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
-SRCREV_meta ?= "77f0a9eba731b83da9273d1c0d6bb1c3afd9b129"
+SRCREV_machine ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
+SRCREV_meta ?= "5f331d55d0900030f5bc9b139c815f3f01a8ffd4"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index cf65afa922..6564731da9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c7612f5ac940578eac19971dcfa4f52f25753074"
-SRCREV_machine:qemuarm64 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
-SRCREV_machine:qemuloongarch64 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
-SRCREV_machine:qemumips ?= "61a56646314cdf030994524e9b04a89b79e0cb9b"
-SRCREV_machine:qemuppc ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
-SRCREV_machine:qemuriscv64 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
-SRCREV_machine:qemuriscv32 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
-SRCREV_machine:qemux86 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
-SRCREV_machine:qemux86-64 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
-SRCREV_machine:qemumips64 ?= "8d25ce2c226b61b29e600dc6b4018afa354a6e67"
-SRCREV_machine ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
-SRCREV_meta ?= "77f0a9eba731b83da9273d1c0d6bb1c3afd9b129"
+SRCREV_machine:qemuarm ?= "b14dc32b21c8770b4e635ec69611aa32fff230b3"
+SRCREV_machine:qemuarm64 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
+SRCREV_machine:qemuloongarch64 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
+SRCREV_machine:qemumips ?= "072df281d6a919a505df072b4741d49145cf3781"
+SRCREV_machine:qemuppc ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
+SRCREV_machine:qemuriscv64 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
+SRCREV_machine:qemuriscv32 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
+SRCREV_machine:qemux86 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
+SRCREV_machine:qemux86-64 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
+SRCREV_machine:qemumips64 ?= "a5de8564807b47662da3670c5b358a1494faef77"
+SRCREV_machine ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
+SRCREV_meta ?= "5f331d55d0900030f5bc9b139c815f3f01a8ffd4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


