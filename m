Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4EBC47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:17 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.151504.1703864717023397920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=U+5voIhi;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cd5cdba609so5278943a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864716; x=1704469516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tA1SD1+ZpAjVPCn7ms22rqN3LL3ZAWxGRO9RrciSnj8=;
        b=U+5voIhij1JfBmhCMS4jO/pq6RiPjsSSNKnlPA70l9SBLWkjhyHGpDSZVMZDKk0yF8
         ddBvTnnwTvCDhu35etHiH4PM1V2tJRWgUrqlV8OrOztype3cuQF1/QSZaHdb++sWAL14
         3Ld/qQ+QdLyfUHIr4G51V9+aBU2c5TKn16h+jm6wHaLAKb4aLObjNAKS8Oif/o5IMt7d
         qjdVYMu5EZQ9OSWkUWqOy8E2r27iVwyg2AsXFKlJ3r53waptivI+TcF+N+wYjY0a7DWB
         TBHFjNw9yPc8PdpsDYH/PbPdjzRZPnrn8zjb1e+7Q++cv20xUdyrAMsSRODW4k4aLz0G
         EY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864716; x=1704469516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tA1SD1+ZpAjVPCn7ms22rqN3LL3ZAWxGRO9RrciSnj8=;
        b=i9x/4Q5c6eo2auh2p3rTQJ1Vavpmtvsq+KiCEVBGGMXLbVvUaoHuDyCjt+YkNGY9Vf
         pm7TrNzU29KAQj5nYEapq+5o/tALAxnmVNEpGLHOGzmt/u3jaWN2FW8a8d+unSC6F65Y
         JoDNfvE/p1wbTyOkoNbSSGWQb+Ou6ZD3fwAFEPZlAP/PjDgWsH42uFxZWNNf8Q0UMYpb
         3c7ZF3gKILcmhg0iZe5v9aXglfZiRBwZSPr+kooQ7oq7pBM59aA8+LxZy38xq1qUi1RU
         Ce3F2cbZ3YMEi1QledUmatoIRFtg+OalG1AG2l0CH+URj5ShssDHOgWqi1ZprUsBtvA1
         F/3A==
X-Gm-Message-State: AOJu0YwXFOo/a7+kazAN2c05GIb6FI787+OzVUyM3L+6ZgrCy+P7MgPR
	IGj2NDlanZoE3T035azrpBJQ3pvjIkGfSjIW2hwUsAXYzB2Tmw==
X-Google-Smtp-Source: AGHT+IFKAoovBhQWrcgDry5T7Li8rd4eibaV2f12s0VF3RY7vpu6qfSh/6DajdOX2o9N8cLDRf0gDQ==
X-Received: by 2002:a17:902:f7ce:b0:1d4:7bbf:2de8 with SMTP id h14-20020a170902f7ce00b001d47bbf2de8mr4403692plw.130.1703864715727;
        Fri, 29 Dec 2023 07:45:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 07/41] linux-yocto/6.1: drop removed IMA option
Date: Fri, 29 Dec 2023 05:44:21 -1000
Message-Id: <72adeea0757a7de664092cfac6139c28c7f6e999.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193024

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db11dfcd8304ded18fd21d7c4c2db50331402666)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


