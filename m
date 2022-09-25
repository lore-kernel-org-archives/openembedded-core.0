Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D808C6FA8E
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:32 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.20497.1664133483897709285
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NGsFy6Bp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d10so3633306pfh.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=r5F+3e5zCfWaK3zyhOrFhXmAxwaWIZIaLLgqrG7PPGc=;
        b=NGsFy6BpTIGb0ZMoFZXn+/txDMwPhxxJHsvo4lZVz9TzyYhZ+ZfzjDnT0ZIZrqlTf1
         grZyU18AlnhzNOFsl68S/8tNDfizMZw4FXCqVxdRs3BMEHV3i5BCwzINxFvLjSUYIYl7
         hyJJRAegWEVmh5ztXMZKxrfAQv+L2g4IsE+sGQYjSQfMq8X7DlgGnKJYe1FFwmXZxWEC
         1AW64ewpwd5rkzkjNrKjEvIjjdkL8TGGTwZ/UYgfXhPiggbf8gXbjL8xloHwRw7BwOeb
         PxEWIgrPnkLu3+4sOpvVQR+CmRu0wasbPyZcF/48+Ia/3darig6GYrrTW4VrgAQ/2BJX
         9v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=r5F+3e5zCfWaK3zyhOrFhXmAxwaWIZIaLLgqrG7PPGc=;
        b=DINxJW7TZoju4gn1QUCUl3DLaG1ovM4gxkYbLqF3PFfVkI/L9rO1rNE1m3CpOnwaBm
         WtASNg4KASi6BXun9+L9KT/GHbmI7/EEKBTtJdSsoiXe6ddSEoq/lkOWt5MBkJH1bfcG
         YYqfSCs9FfBm2Irk3NODN8/NjIO2GHbMZmzrBX7riMQxqgqKgQh++Srdhhg8WxJT11al
         FlXEpy+SVmFm5LiAdq3L21KVFD0Wt7Vy+3gpYqGZCVCzMmlRxP/yoPcvsaxwWeB3xudg
         3a1Ngu6s15LFKtRDQm7ULr0YeQv4BY2UG1PaXdpbzyMOPo0flkVPIoJULgX0KpKARvlW
         tuqQ==
X-Gm-Message-State: ACrzQf15Dt+4zDwcCzMD/xdR+Kp+9zmHhiP1egZcEcE4LWIaGpNfGf2+
	Hpf0jlyms2PIZOYM8YnC/58jSjcFP0M3mCeB
X-Google-Smtp-Source: 
 AMsMyM5kRKGzeMgehVe0Ojz2HTrDWwcfMCg8h2PoKfvOI6cNAClJ5mwfZBePwHcJWLK57Vqwrxps5w==
X-Received: by 2002:a63:4e66:0:b0:43b:f6dd:536a with SMTP id
 o38-20020a634e66000000b0043bf6dd536amr16719797pgl.486.1664133505597;
        Sun, 25 Sep 2022 12:18:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/33] linux-yocto/5.15: cfg: fix ACPI warnings
 for -tiny
Date: Sun, 25 Sep 2022 09:17:25 -1000
Message-Id: 
 <5eb09877b278b22e1aa1e3d3b8f9f3821ab5c8db.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171028

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    1128d7bcdcd acpi: fix defaults for x86 and qemuarm64

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 3b4eb4d844..2f91fb7a37 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
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
2.25.1


