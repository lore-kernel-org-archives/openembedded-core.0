Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C830AC433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 13:28:48 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.22452.1651325320747574981
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 06:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WjUP3T1f;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id o69so7920800pjo.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bua2/FG5kMASSfQOAOLHtoUlgY17rQCMw+IJrpt/LeE=;
        b=WjUP3T1fher07B95u4m2GjuWZ8f5gavM/Yx7aPS9YCXibGIcG5Euk2qPpWAYD2GA4Q
         d3v4fcGS419Cca+jJU9mYmoytvGiWKxGJGi9IDUsdpwDaWQLyOKDHkkbkWOKu6qnCbg/
         dWYrolgOq+WGVHWvQ4GwSDmbX6YmrWAY/ZNn+YdRueTQe49le5nWW1nr8TPZLKPMRG6U
         TgR6uGRPhfHeScLDBakejDJAptnpLzMu0K4h8+CLo9nRPpxtMlSTD8sB+6T/XJw2wN1Z
         lnwPvUHNVl7ht16bOd2x8aAW8FbfV/JXG/cbjgdMXsMEuNteQ5yZa9JzzwVBywHtuMWi
         /CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bua2/FG5kMASSfQOAOLHtoUlgY17rQCMw+IJrpt/LeE=;
        b=ixxLLOjuxta7btrKQmvG0eVMlOYgV5mXsfSrJXWqbzbsF/JI2+6CLFbVYlDkhFL9AZ
         mAGb0jWvNwVxKfOTj/hR9yuGeRgpGq7XUO2txabYcf9Wi+ZVxKVbo2tqLYP2MU54gJxP
         XbcRd9KLqqK/SlbVkTkRfRBvzg/Ir1JpjsolnYyHZFd1nAkyvbb83C3I7hCE7lNc+0kI
         lfTCQ4bvFnQH834CNp2QKveAULX/FFp+onSRaQbETgC0K0+ei+5O/M39dqW8KfGdjIIp
         AWHDpggsBEMkWdWGG1wd86gJW6l6myyJqX3Y0JKsoxjwF6B887YgzmpociI/o3X555UE
         Ua1g==
X-Gm-Message-State: AOAM532Y55OuUjQtUZiSXiFvtrQilfYOQO8DAYT7sCVGhHLfM45FdUIJ
	qqaKGfl2u7bRqXxXfDJXIeFZMH7+IuUmlg==
X-Google-Smtp-Source: 
 ABdhPJzjS0f2ZfSRuTJ8iiZWxQy9dDYRaxL7RhdASlKoLJkZnxRXI0VlXmm/60hiSFdERdiXjUypXQ==
X-Received: by 2002:a17:90b:1e4e:b0:1da:3931:951 with SMTP id
 pi14-20020a17090b1e4e00b001da39310951mr4153759pjb.231.1651325319766;
        Sat, 30 Apr 2022 06:28:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 v21-20020a634655000000b003c14af50645sm8006313pgk.93.2022.04.30.06.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 06:28:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] linux-yocto: Enable powerpc-debug fragment for ppc64 LE
Date: Sat, 30 Apr 2022 06:28:36 -0700
Message-Id: <20220430132836.1034892-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 13:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165068

qemuppc64 is LE by default, this fixes kernel build for qemuppc64 with
gcc12

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index b60f3e07738..3d3dad99b5a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -52,6 +52,7 @@ KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 8bada989e54..7ccb13195f5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -64,6 +64,7 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " fe
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
 
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
 
-- 
2.36.0


