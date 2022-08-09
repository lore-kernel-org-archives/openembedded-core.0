Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CEFC25B0C
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 03:43:05 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.7837.1660016583323290993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 20:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IiFtv3vl;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id i24so7884192qkg.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 20:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=trERcOGi85sF17AoNuZh/Gr+vearWO81nQCq+6FuWRk=;
        b=IiFtv3vlfza0dkZLQvsrqfsjw2XRrlGCAsECVDLfW+jFEkbJEC0JlR/KdEtQh1H5Z3
         VR2cj/2SlkgUI9L+F0ekrA85thCE8xntKKB7tUA1g4MGjjBw9SVjJCcKG31o9PIDYyPF
         khNkUI4hgqcitldwN/gcikJ9zyJT71LpPX/H0YsBhGHzs+omOQY4Rfe81TAoIcUg7CrO
         qk1dE3Rww60ymW78jwF49mGvs2yEKqQ8GYNIE6ZDTQSjTVhAGA/TzOlhcN/l8mstv/uQ
         5LTOTpArdceVrHki0rVSFcbVLp8PlvrQ3zTFvIq4MvdxbbBmRunOBlIKmmmCF1ldzXI7
         pkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=trERcOGi85sF17AoNuZh/Gr+vearWO81nQCq+6FuWRk=;
        b=J44j6UFT5QbxPoa4zKCErj4zWgP1DYrKlSCLD6pS0ywbxa6KfY0VavKd6XSo0hFAmt
         hKl30oMwyuoWVAo9vg76Zgd4YgeiLYPq1hV5GeFk8OqX1TqReeYEBk+FjiBDRnwpCk78
         /C0lYZxcVhPWm9WpX1KLZvyKdDymOvtOgbLIZhLRaFKPsJlVqUuv2+PCtgZDOyUrTpXh
         YA19sWbaaDq5bRL5K7ur4AiFFoLetHgCmekSixt3iNDa2TChCRuejedmVkksDZIjDMpn
         xHZjhkA/GQIL0aLqbLznoO4UG+II7ZSx+nEeVjD9plnXH8dJjd0YI4W8tLHf/DkYQtCX
         xNhg==
X-Gm-Message-State: ACgBeo3gz04yW+XXv6S/MIL9WXBeUT1qoi9jDVsBns58OEoG3HzswTj8
	sfqASqDWCctnhzv+se4qhQayvN9kD2BXDQ==
X-Google-Smtp-Source: 
 AA6agR76dpdBIqaDIoWsUR4RFLEKt/VXNdxmVpaXJIpLvtBaIRl1eOJC0XcWNMZ0rCHQ6MF66Lio5g==
X-Received: by 2002:a37:4254:0:b0:6b5:da0b:efc7 with SMTP id
 p81-20020a374254000000b006b5da0befc7mr16169891qka.438.1660016582330;
        Mon, 08 Aug 2022 20:43:02 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 br35-20020a05620a462300b006a6a4b43c01sm483898qkb.38.2022.08.08.20.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 20:43:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/5.19: fix reproducibility issues
Date: Mon,  8 Aug 2022 23:42:58 -0400
Message-Id: <20220809034258.53200-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20220809034258.53200-1-bruce.ashfield@gmail.com>
References: <20220809034258.53200-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 03:43:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169128

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.19:

    e0e977e1b098 init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.19.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 20 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 94f900c91a..e70d20f9f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e41cf2ea686c923a56b8fbc52ea998dc7193f099"
+SRCREV_machine ?= "942f6fb5262e8432d6fa982022d953e6a63aec64"
 SRCREV_meta ?= "89fdc2046baff988519317cbe838386b6489779f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index ab6c0b7d90..b0c4d30ef0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_machine ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
 SRCREV_meta ?= "89fdc2046baff988519317cbe838386b6489779f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 4debef5f2e..2fb6a05b84 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "fdb9f8c3f9a6762603e4d71e3f678dfae1afced6"
-SRCREV_machine:qemuarm64 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
-SRCREV_machine:qemumips ?= "128ff884612b479168e68519bb69d1c7a5180b7d"
-SRCREV_machine:qemuppc ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
-SRCREV_machine:qemuriscv64 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
-SRCREV_machine:qemuriscv32 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
-SRCREV_machine:qemux86 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
-SRCREV_machine:qemux86-64 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
-SRCREV_machine:qemumips64 ?= "a078f75cccc88d26763cab4762ed00418813f2cd"
-SRCREV_machine ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_machine:qemuarm ?= "a6ca992258edecafa8bf33cfc5d9e54019ea27b8"
+SRCREV_machine:qemuarm64 ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
+SRCREV_machine:qemumips ?= "371a5e816aa00f010df12d9fed04dee9f5829cf1"
+SRCREV_machine:qemuppc ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
+SRCREV_machine:qemuriscv64 ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
+SRCREV_machine:qemuriscv32 ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
+SRCREV_machine:qemux86 ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
+SRCREV_machine:qemux86-64 ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
+SRCREV_machine:qemumips64 ?= "a28b974f928d53d00b06d0d61ae7746336a438f4"
+SRCREV_machine ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
 SRCREV_meta ?= "89fdc2046baff988519317cbe838386b6489779f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


