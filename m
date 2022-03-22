Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D463C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:20:09 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.12951.1647969608268508185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JJTwgHpY;
 spf=pass (domain: gmail.com, ip: 209.85.219.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id k7so8718640qvc.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4N+9Unsj6RcIAdTpAjeYwR7JCT+Xm/CXIujIYWLFkIo=;
        b=JJTwgHpYECnlSnYmFnWPw+NkT77vEdge7a9+ZpyHPYBembCL+rZL7HzL/g7rUIZZOR
         gom/zd6wGdYZIjgd2RMHbXhfqb11G0C8LMWL7kd/3BXKwfentYZ/Z7XipQlwN5BrohDb
         Qn/n6LnQCLEkfkETLITFsMGsSznJzpmJw9KoiIMiMDv3cVYCvCOd6cq7EMDDFeZcAkqk
         yxnOu1nP7Hw/A0U0+D3Nwkkkm6T7qVap78VbvEH06WLSxbMM6VJn4uSmWgmuRE9fOvdK
         fcpXj5D306GqMky5PJ6ViKuJJtsnFEzsYHifczmuyrJX554pevwtSNTya0G0qoVLRVQK
         YLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4N+9Unsj6RcIAdTpAjeYwR7JCT+Xm/CXIujIYWLFkIo=;
        b=O6MNji/nkup2wENUUnjxYZ8Tx2IBH9ky5WptxYHQ53XDoj/JbUOGUuKA1eAPNwPQuv
         02yAZZf4553m8lKpSX+mDWnc3DwaqC8r/62vHnqiXbv+ygUYhxvfrHkfNRzrgGEzMjN3
         JRwHRdOLrQ+AYjlqSG4rfAMiqsY5Ce4avhcPYiMTUbjnSV0pl7fvKsRf2cpFtWn3LG4c
         Okow5Lt/vnKjrL8fWm+PaZ0n6psBAzfnNEoOgrOlcnvXywZQfK4oZlvbNOQ4Fq1Vli+6
         IoEAY//T5uA5zwFfh48rz4o2He/w04uPvat8F0G4lrhuvZKiZVWdFLK5B5P9V3ljiH3L
         sghw==
X-Gm-Message-State: AOAM530XtqdkMetqiFZoMMDp7mD1WZwYrCj7oRNMGAT3mO+FHyaeD3YL
	3B7XKDNQUST+4iPslgKWdew=
X-Google-Smtp-Source: 
 ABdhPJwfDfU0YQzt7Q//VqRTYBdMC7mElMPuXJTFKmXqNKy5HWwVMecYsgwYrh/Tm+b9FokDTJYAhQ==
X-Received: by 2002:ad4:5f4a:0:b0:441:52e1:2ca9 with SMTP id
 p10-20020ad45f4a000000b0044152e12ca9mr1657037qvg.65.1647969607185;
        Tue, 22 Mar 2022 10:20:07 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a04c800b002e06d7c1eabsm14019648qtx.16.2022.03.22.10.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:20:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] linux-yocto/5.15: cfg/debug: add configs for kcsan
Date: Tue, 22 Mar 2022 13:19:54 -0400
Message-Id: 
 <d135bbfe9a1d4eefa371785248920553f5266f7e.1647969481.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1647969481.git.bruce.ashfield@gmail.com>
References: <cover.1647969481.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 17:20:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163562

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    18436b6ebc6 cfg/debug: add scc for syzkaller fuzzing
    60e8db6f01c features/tun: add configs for Universal TUN/TAP device driver support
    bbad5927704 features/bluetooth: add configs for Bluetooth Virtual HCI device driver
    d5f51adb3d2 features/usb: add configs for USB raw gadget
    13c24c8ddbd features/usb: add configs for dummy HCD
    6f56f2a289a features/ieee802154: add configs for mac802154 hwsim
    3484d09163f features/mac80211: add configs for mac80211 hwsim
    59e608e25e2 cfg/debug: add configs for fault injection debugfs
    e80f79d4b66 cfg/debug: add configs for kcsan

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 8df4898617..7a5dd89684 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "5486de5bb7320876bbfe6f92245f6819afed182c"
-SRCREV_meta ?= "50d5442eb4726b54950f32359f36e5aa8b5661af"
+SRCREV_meta ?= "18436b6ebc61f77ab111a8daeafbdb3534613ee8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index f9af47f861..b014b482b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "25cfdd5cd20eb874209ee632b8b4ed567686523b"
 SRCREV_machine ?= "e54b9d06bee4c182cb376d570017c7b425369f3a"
-SRCREV_meta ?= "50d5442eb4726b54950f32359f36e5aa8b5661af"
+SRCREV_meta ?= "18436b6ebc61f77ab111a8daeafbdb3534613ee8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index c7dcb3a9b0..61885ffcdf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
 SRCREV_machine:qemux86-64 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
 SRCREV_machine:qemumips64 ?= "7b53697cddec0526e8c10f25e1a6c2bea7d240d2"
 SRCREV_machine ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
-SRCREV_meta ?= "50d5442eb4726b54950f32359f36e5aa8b5661af"
+SRCREV_meta ?= "18436b6ebc61f77ab111a8daeafbdb3534613ee8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


