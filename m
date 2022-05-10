Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EF8C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.10881.1652193559123929739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=A2t7qC/x;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d22so16900040plr.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tM8hB2Kz3ORePI0ft+kNG3hlqZjG0NFfq6dPFZ3KvFM=;
        b=A2t7qC/xpAi+XpSCGUxcs0uvbd00qX/hSwP9zL3DV3yJgxBjsxMNFJ9YmMKhYMZZn0
         QxORSqxWnZMIGsK1fQchtYCBGsJs+S3x9HtcAD5qsRDCwy1V/bhioMfiJ/DnQJbg2Vl7
         oJCkdjgwN5gwOumIIYmnZUN4lSitHjLiAGMKGP0o1WOdb/fP9lAs6+v2K6fu9dnKwNjZ
         EjkAWu7iwoGVKbTu1xqBRfMP4nKUef9leCT2+PNM1v6XXSpx94IjQAA8ctDXHVc/CqNI
         WYy9BjHr4HkhgL+wObxR7bHYz/OBynRoNEYwjOayVlnBeIEqaLh0E3uvC0zkN1lGLmQv
         oTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tM8hB2Kz3ORePI0ft+kNG3hlqZjG0NFfq6dPFZ3KvFM=;
        b=PJgC9GiW7lrsu5Fl+gOShfx++WYORT3BIFGl/nJmX3m6dArMt/6AZ4Qrdy8oJ0VaPQ
         xYRHAFMEMBcskQCdpy6pTcQ9N66XXhOPAcium6Gt5jT3XWtB+upDY+ALQKAiJlN86lK7
         nHQjJiYtxWyco5CEUm60c4rIwkc/cH35t2ulhYG5edNpisvIuGi1UxIc3QcR3yxQQg/m
         jMjVwePiYV+9fEGnGaUrALIxALWeBEebCgam3umAmy4qBKcfMazHJIgJ4Vl0cRXoA1LO
         HfiQ/nsHNB6esrkq7MtqlWu8o0Q+bSxAVLA6PFjegY24iErmZ6KuQiPjjMvJNiKY3hcn
         iX+w==
X-Gm-Message-State: AOAM530JAjOwCcjyK60S9l8qlk0Pv49KcRSa4ezLGkvDO+5cXTcQB1jl
	kQSGXCufng2nBz1dLKWkOSBnhRTWFxxqeg53
X-Google-Smtp-Source: 
 ABdhPJyez7dMJCjaJnx4ajHbo32K7cgFtqisKw0df5+ONtLDTWpHWajDWQ9P0qR17ZNOJJlxJMQCsg==
X-Received: by 2002:a17:902:f0d1:b0:15e:dfcc:fda3 with SMTP id
 v17-20020a170902f0d100b0015edfccfda3mr20606992pla.93.1652193557928;
        Tue, 10 May 2022 07:39:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/40] linux-yocto/5.15: fix ppc boot
Date: Tue, 10 May 2022 04:36:57 -1000
Message-Id: 
 <99d112f2d8f0c8b99ac8057bac93629284e0c5e2.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165435

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f69fca36ef10f7345bba08c55d8af2628d250a32)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


