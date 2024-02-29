Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE7AC48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 22:38:40 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.8871.1709246312164411702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 14:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d9frYOZ3;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dc0d11d1b7so13469855ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 14:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709246311; x=1709851111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+JIi+gQsjjhh3a2sCmAbcr+RmAKudV23M3SNtjz1wk=;
        b=d9frYOZ3nc8NMd3+BhNy1t1txhDmifq5jToDKoBLBHYZTsBpkp6hFef+UYpMjcUOzs
         8684pye0NHoMk41MMWZJ6nhUpcdIbgubewf1jEmbMUpXjRL7cZaB9B+s1PzhOm7x7G11
         Rll0ma0Xm3P2yI4xTOgOJpLcvibnHUE9BZrDK0suJjAn7Y/rBAHkwtSIsFQysoyJHluI
         Iq1I5OlFPKajMAefZVjx/BIpTQ47Yn8qIn0YGQXUwnyPURivmFvdtS2EbPEaHYYbh9Dv
         2jhwKuhKCovlc7UbVn8EWMn2Bed4yPnjCOPa0NMOwPh4EMD1dkn45VduBZ7PdHoymvh1
         GTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709246311; x=1709851111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+JIi+gQsjjhh3a2sCmAbcr+RmAKudV23M3SNtjz1wk=;
        b=JeZ/HZ753Fag91NgvA8NMiYsP69/M3Alb8aU5xjygNCKPkziI2N2s0FJXGTwOEQgM7
         ecvCvWeFlE7TTTL5ArnugoIb0YSg735ssyOYLsvKbeosibwev991xq3e57IoDkeR0LVO
         nCIaIKK+egswOP1am2X3loOc75VxKhbpQBfNA5BbwHLNfme3SGN8b9fOjflti5aZX1UN
         Qbx06SAkeBjExSPAmBwdSk/CgvfVzwRHu7XPj/s2ogPP9AzpztjPoBxe0HQwfkqp4L8Z
         J68Q4KnTcb6cm8ro2FU8Zg60dil4RahzPffFveTsQ2TdvbAzjS+W82gTG35e3vOqvAeM
         IdSw==
X-Gm-Message-State: AOJu0Yx97snY6Z9HThQbuieyNYGwGlSbVOGex1dwDOWsHqLpmhFzZn3H
	p+oRN/ikO+xCWWP0Ne6SYs7rrkVMmX8rLtbChqfwzwtN8aRgyMM9FwcgFEot
X-Google-Smtp-Source: AGHT+IGMgr8Ssaa0XmIyRmL8QD3J0jXw/VyjMfL2QqC5pq/OUNliYBrH3z4/PwdpPHXkHqzOukbWVA==
X-Received: by 2002:a17:902:f712:b0:1dc:1379:2152 with SMTP id h18-20020a170902f71200b001dc13792152mr3946314plo.56.1709246311148;
        Thu, 29 Feb 2024 14:38:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7ade])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902b58800b001d9b537ad0bsm2017212pls.275.2024.02.29.14.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 14:38:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] linux-yocto: Enable gpio-sim with ptests
Date: Thu, 29 Feb 2024 14:38:29 -0800
Message-ID: <20240229223829.1549939-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 22:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196450

ptests for packages like libgpiod and python3-gpiod need gpio-sim to run
the tests successfully.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 8365e22b32b..6aec34c16c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -62,6 +62,6 @@ KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
 
 KERNEL_VERSION_SANITY_SKIP = "1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 6eca6de5da5..65c440d40d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -45,4 +45,4 @@ KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index ee585e588b3..86da40e0215 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -65,7 +65,7 @@ KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
-- 
2.44.0


