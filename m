Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B52EC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 03:23:46 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.1788.1664508222520815582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 20:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=lgiADqb8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id f26so1964898qto.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 20:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=htlXCmH4SxEIp3r1WmaK99h9f5hbbqtlahiVWrnFaiA=;
        b=lgiADqb8mKLj6dxw0YWsdAc8u1PUf59/YHyobRO37/hJEtXhopvrflsUxO2QmsExgV
         hTzpJAWxNAZ9K7jGk+syahgzC75Wpf4hUHQ4wARFie6bJ6H3tAy8K9O3SaPhMkiUlmbp
         VKKz1dFHGz3FrG8qw73MWFRl377A5wi1fc4EwMRmUBzSBD2lKf3W2t7HWntFQmdd+mK9
         6Bcsf8B8Vj1rLZpAV+616sWTSEYIiGvRB5OYg6hg1SGVVm+wgifBba1MyxoARBsoq4aD
         smjo5xtA9hCXZmdMxT1p455Qisov3rcPXDOXzqNGQzf+M2YradYyqWagnvmFXKmBBGoK
         RKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=htlXCmH4SxEIp3r1WmaK99h9f5hbbqtlahiVWrnFaiA=;
        b=3rKWhbePfGTui8LrGGA/2p9E3rWqGw4luVu3msYeDn5ubSIxAa67m/orFpRTt0ebw1
         WzrdeBOCyKnww8tIBv3D/kah4LF4HaG9k4DeCxA/h0MDp6AQdLZNIjfABdL/gcrVMb+q
         nIC/6DsHQWczXF1oz8Siu4KuPYp03essiUlQOu6s6cVJQZr/dLayRjf6CpDPVXMuCfWi
         NLPROmm4vh3DfesGJIy4nyTaQUYlR9xH9t8IJ+zEcILJ0POA6QvngI0RhcvLFGjFgHFd
         gEQimUlD77L2i/LJGnT9n+qCY/8uPaNRbHAFE7rg7HfTkgmhBa0VuzkP+mOitrvg1lv4
         xd5w==
X-Gm-Message-State: ACrzQf0KL0zgeFIwmonVCrswEyyhlbK76vY5Wi6eakn2XpU0XU8NaVZD
	jYHZKGVwa2bnRTRTWtuCJCF4lhPznw8PcQ==
X-Google-Smtp-Source: 
 AMsMyM6V6e4GD7svuI/qGgSwcQQbEhnQWJeda6b/REhwfeURKa+cV3UQGnykfvF2lD6Eg59+LxQ5PA==
X-Received: by 2002:a05:622a:1355:b0:35c:e9e5:6cda with SMTP id
 w21-20020a05622a135500b0035ce9e56cdamr5220392qtk.91.1664508221099;
        Thu, 29 Sep 2022 20:23:41 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 t21-20020a05620a451500b006cbdc9f178esm1366619qkp.25.2022.09.29.20.23.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 20:23:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: add entries for machine features
Date: Thu, 29 Sep 2022 23:23:39 -0400
Message-Id: <20220930032339.172935-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 03:23:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171203

Most machine features have corresponding kernel config fragments, but
only a few have an entry in the kernel recipe to be automatically added.
Adding the majority of them here.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 7ea661e138d9..23ae0b4260c2 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -33,7 +33,12 @@ KERNEL_LD:append:arc = " ${TOOLCHAIN_OPTIONS}"
 
 KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc"
 
+KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'bluetooth', 'features/bluetooth/bluetooth.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/efi.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'ext2', 'cfg/fs/ext2.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'features/pci/pci.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'cfg/timer/rtc.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
 
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
-- 
2.30.2


