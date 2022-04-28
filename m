Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99C6C4321E
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:17 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.10685.1651153695226437174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ndmY5sD4;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id y3so3435022qtn.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IhtD2wzNFRIifqrEeHAsSDQiuNByGXdXuuG2JyUM6T4=;
        b=ndmY5sD4QvtZ0WOvhPUggcMF5PakhzcQO7NnYT5rS2Wj8X/VkV+841K4K5wMh1SvX9
         OEwhApoVBb5JHbBfEqOtPFhrf6iv4OcCLt2muUogR0AswRDPT6UHRug9OlesGNcYUPMc
         pah23/jW+7JxFxBeoLhCvPx22OtlQjqXICxiHgbnKiB85InnXk5tswCv1o7GxenVN6mY
         uSz0/88QakHFOLvbZaMydafhhKQjkNR13SJHTjwR7XxdjwHr/abwkAS8ggsQZVrC3Iv7
         6QupEfaXnJsY5bBwyVl2KlShpjTTin5Tb9nV/84yifCnIluayYdXVRhLVIUXWyUIigo0
         s3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IhtD2wzNFRIifqrEeHAsSDQiuNByGXdXuuG2JyUM6T4=;
        b=CL5x6AXGAChn9l1p7ccgu04cqS3MQ0KYJVrbRPJgS697gjDz5KNWAjqEZjFgb5efSx
         8h3/Iug/j768wG3hD2SGCJTDEJoaevg83KaJl7EWXR8PL36DKgTM0WBJB8cOY1m9rvzo
         0VBfDR48hpEyDX/FgwFNMFm7ORrhB/jsK0+Q8YJZ32jsSlz64VttDexDrI9aiyQPPtU+
         DdFGwp2D9+q81ah+Gw/AlMzVM/I+jy8pIYx1rMXRA7TRW/tb657M2IuWeVtAtzE0MWfK
         ogKe6JkibKBNWA+HhywAHX6hrL5zToBaOFEQVR1yTgjs31InbEovm4TJyIXJRm/xrmLP
         K3Mw==
X-Gm-Message-State: AOAM531A+KHwBiXHc/oWGkUO8B3eSt9CZ1Z9Y+cSMKc2XtLNHrYIFCBK
	i87bKe43p7gp8bMr1X3BxzY=
X-Google-Smtp-Source: 
 ABdhPJzhS46KSZpGtpg1uVGOJ3Vy8G94Cs/jurBlJIzeq9Sdau35aE5xyutKdBgOyD6QufvK3OtA3A==
X-Received: by 2002:ac8:5e07:0:b0:2f3:6db4:5c8a with SMTP id
 h7-20020ac85e07000000b002f36db45c8amr12608033qtx.31.1651153694267;
        Thu, 28 Apr 2022 06:48:14 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm20809qtb.48.2022.04.28.06.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:48:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	jdmason@kudzu.us
Subject: [PATCH 08/15] linux-yocto/5.15: fix ppc boot
Date: Thu, 28 Apr 2022 09:47:54 -0400
Message-Id: 
 <3a79088ccdcd09d31448a8b7f939d134dcb22a2c.1651153370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1651153370.git.bruce.ashfield@gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:48:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164956

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 5.15-stable series pulled in the following commit:

   commit c894ac44786cfed383a6c6b20c1bfb12eb96018a
   Author: Thomas Zimmermann <tzimmermann@suse.de>
   Date:   Tue Jan 25 10:12:18 2022 +0100

    fbdev: Hot-unplug firmware fb devices on forced removal

    commit 27599aacbaefcbf2af7b06b0029459bbf682000d upstream.

    Hot-unplug all firmware-framebuffer devices as part of removing
    them via remove_conflicting_framebuffers() et al. Releases all
    memory regions to be acquired by native drivers.

    Firmware, such as EFI, install a framebuffer while posting the
    computer. After removing the firmware-framebuffer device from fbdev,
    a native driver takes over the hardware and the firmware framebuffer
    becomes invalid.

    Firmware-framebuffer drivers, specifically simplefb, don't release
    their device from Linux' device hierarchy. It still owns the firmware
    framebuffer and blocks the native drivers from loading. This has been
    observed in the vmwgfx driver. [1]

    Initiating a device removal (i.e., hot unplug) as part of
    remove_conflicting_framebuffers() removes the underlying device and
    returns the memory range to the system.

    [1] https://lore.kernel.org/dri-devel/20220117180359.18114-1-zack@kde.org/

    v2:
            * rename variable 'dev' to 'device' (Javier)

    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Reported-by: Zack Rusin <zackr@vmware.com>
    Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
    Reviewed-by: Zack Rusin <zackr@vmware.com>
    Reviewed-by: Hans de Goede <hdegoede@redhat.com>
    CC: stable@vger.kernel.org # v5.11+
    Link: https://patchwork.freedesktop.org/patch/msgid/20220125091222.21457-2-tzimmermann@suse.de
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

And this is causing qemuppc to panic during boot when manipulating
the fbdev.

Reverting it fixes the problem, and won't cause issues for other
platforms, so we revert it.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index bba1200fe7..d7250ca4d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "85ebb3e98ee184fad92eedd79f006df9809f01ff"
-SRCREV_meta ?= "645b337371e7e080e71f7d7f2435326242451a95"
+SRCREV_machine ?= "ec729d37e4036fe80d0294684aa779c091466307"
+SRCREV_meta ?= "71a82e181708bc619684cc9f1eea01ec2595c2ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 27373660c7..2de1be9e46 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "41f36834f2236bd22ab8c33ad1908da029bef79d"
-SRCREV_meta ?= "645b337371e7e080e71f7d7f2435326242451a95"
+SRCREV_machine ?= "9f43f6966b7ef3cc76c465e1f53fe353740155df"
+SRCREV_meta ?= "71a82e181708bc619684cc9f1eea01ec2595c2ff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 62b16e4f9e..83e484693b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8f765250a60ba7a94935709d4d0f0edffd366990"
-SRCREV_machine:qemuarm64 ?= "35a6bda405ab207447b0e088b71fd8a9dab566e4"
-SRCREV_machine:qemumips ?= "d413054d21fe14e8111ee2396e07b4c15e0a2e77"
-SRCREV_machine:qemuppc ?= "33bdc98e5f267d7715cc1eb6d9c461616c05555b"
-SRCREV_machine:qemuriscv64 ?= "7ba4cb36fd4f3da81698b3e519e763aaa142659f"
-SRCREV_machine:qemuriscv32 ?= "7ba4cb36fd4f3da81698b3e519e763aaa142659f"
-SRCREV_machine:qemux86 ?= "7ba4cb36fd4f3da81698b3e519e763aaa142659f"
-SRCREV_machine:qemux86-64 ?= "7ba4cb36fd4f3da81698b3e519e763aaa142659f"
-SRCREV_machine:qemumips64 ?= "19d4c0deafc3b5359ab9af9d092a36feee0d891b"
-SRCREV_machine ?= "7ba4cb36fd4f3da81698b3e519e763aaa142659f"
-SRCREV_meta ?= "645b337371e7e080e71f7d7f2435326242451a95"
+SRCREV_machine:qemuarm ?= "5c287562703770d5e466893c53bb9fca16b16fe8"
+SRCREV_machine:qemuarm64 ?= "158f38930aa53b07009980cf417fbcddea58807d"
+SRCREV_machine:qemumips ?= "2ebd4e128f3f0ad1bff5677f593a545053f9ff91"
+SRCREV_machine:qemuppc ?= "566f4e67a086fbdeb17ebe3b7537f9f345001cd0"
+SRCREV_machine:qemuriscv64 ?= "4e7122625996261d870160dfd2096108742f1009"
+SRCREV_machine:qemuriscv32 ?= "4e7122625996261d870160dfd2096108742f1009"
+SRCREV_machine:qemux86 ?= "4e7122625996261d870160dfd2096108742f1009"
+SRCREV_machine:qemux86-64 ?= "4e7122625996261d870160dfd2096108742f1009"
+SRCREV_machine:qemumips64 ?= "2aafd732abb0b9011e2041c7c5c9ab3f475dedd1"
+SRCREV_machine ?= "4e7122625996261d870160dfd2096108742f1009"
+SRCREV_meta ?= "71a82e181708bc619684cc9f1eea01ec2595c2ff"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


