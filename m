Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D93DEE49AA
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:45:07 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.301.1692632697915726825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 08:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aU2ctCEO;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-64a5bc53646so22099556d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692632697; x=1693237497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4baDmqPhwEEOJv77JivSDzmcwvv87CG7Xpx/IatwE8=;
        b=aU2ctCEOedNJsGOW1HtL/z+pjZDxXyyNLtWDlLshkQ5gUyfLSGUI5lB7VG7TWtvlF4
         zMI1FhESieKpJZONX9RYzcTVTUZEFfmTs/4IhKiTEddXYg4SROirCSKLmZ17cjInGdSu
         QqQaNNqF7vovjDAttlHJToIIESHQuAdCOj8QZtG+xUn6WBnixMaFISRRLkFj4LXYwUGq
         DPtO6lHv/Yyt6MKDi61LstJid9mnrRn6bMLTEoawKBwy4gGcrxa3+MQvAsY1BzQg5GrQ
         FHPLt/zRrRNx71jxnmbhvq6XdWhE3JDYZ/k+OG6t4DpMKeoF8cVf9HpZdD14mQt6T8Bh
         Kiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632697; x=1693237497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4baDmqPhwEEOJv77JivSDzmcwvv87CG7Xpx/IatwE8=;
        b=UpNadYWg1o8U9TyVL0aXFHyLBm/7xe7NgS8U+f9a2UsjXjp2Zb9IOnTU8piyStEA48
         DQ+dxC7eirRZSNpZTfuTnfk+FIRuuANu3awPQpV9jiyGh4LA0I64wMzCcG9bIo2jkV6c
         jzhluKAO+j8on+w+D1tfP9DTx25SaGWbvf4D54c0G9Ri5EWXz8vFb3pguP9Tp6gAqyyo
         hXdsx4z0DO1v5GfOJsgMgxxMZkrGPYyW7Dk1YIi9FCL2icIg96/fzDazcdCQDOPA+alF
         d54cmS4ERRvt/nyI5Ngfd9N7xTQ0QCofc6LtVBJH8Kq2Eozz0xKiE1MZouRMxHDcO1S8
         iOfQ==
X-Gm-Message-State: AOJu0YywvSU5mP0j8p26FfjyKTsvJcZe7QrmlZ+Hh4KIiWW/h+lUbRMZ
	sc5n1dudf+C5Q2MJJr9vZSpVJE11gSlBIg==
X-Google-Smtp-Source: AGHT+IHT0+UNICThdMBTIclEPZqRxYKtmr2jlA8V3UHOQNEcM9ilxtOnbq4RjPo8+tESOD5sR3Ilhw==
X-Received: by 2002:a0c:b452:0:b0:64c:8b79:5b24 with SMTP id e18-20020a0cb452000000b0064c8b795b24mr7480588qvf.35.1692632696992;
        Mon, 21 Aug 2023 08:44:56 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id w2-20020a0cb542000000b00647248b3615sm3030090qvd.4.2023.08.21.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 08:44:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] linux-yocto/6.1: fix IRQ-80 warnings
Date: Mon, 21 Aug 2023 11:44:44 -0400
Message-Id: <7fd16585781b038676b185126e4a3a68313e92fa.1692632563.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692632563.git.bruce.ashfield@gmail.com>
References: <cover.1692632563.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186459

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.1:

    44fd0c7a5a79 tick/rcu: fix false positive "softirq work is pending" messages on RT

Paul Gortmaker has found and fixed the root cause of why we are
getting "softirq work is pending" messages on boot with -rt ..
although the issue is not rt-specific.

The fix has been submitted to lkml, but we are integrating it
to avoid the delay of -stable picking it up and then linux-yocto
doing the same.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.1.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 0c211dbb72..d13722b32f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3d4b5681aeedac4a5129dd50e12afbda86cad699"
+SRCREV_machine ?= "9d355978d3a95f5c190a21d95ebb2a5d0e638537"
 SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 5b58466774..a77bd9d183 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_machine ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index e3ddd02880..deed2115c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "bafadaeb59cfe58562e6c6f5b98d9aa2ebb41cae"
-SRCREV_machine:qemuarm64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemuloongarch64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemumips ?= "858e92d1f51930ba57f4cd9013c094da15d4ac65"
-SRCREV_machine:qemuppc ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemuriscv64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemuriscv32 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemux86 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemux86-64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemumips64 ?= "41bf8e89bdd29252ee75fe6c8ad0ac65bf2b7bca"
-SRCREV_machine ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_machine:qemuarm ?= "4e49d63e747e81aebad5ce6091ba6de09f09d46f"
+SRCREV_machine:qemuarm64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemuloongarch64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemumips ?= "e527feb9cd8acbcbcd7115f51cf71166fdbce11a"
+SRCREV_machine:qemuppc ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemuriscv64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemuriscv32 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemux86 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemux86-64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemumips64 ?= "296b096f4c747e4c4b31b1708fc8a0acb1dac04e"
+SRCREV_machine ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.34.1


