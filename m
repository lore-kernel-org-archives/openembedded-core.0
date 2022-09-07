Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFA0C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 22:05:45 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.1737.1662588338667838651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 15:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UvT2bHB1;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 78so14840246pgb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=OLakFZt7OnFoeOfQ0xIU3PT+VbQZ1+uQzkI+6vBqsss=;
        b=UvT2bHB1ZdYlKDO9rmeYJW8ZcvPDoJt+Jdi7jvzl6zdWiHsIpS9wj2/dNSFYDjJvWE
         bKUR0dDAeMBNKgSLvDpppN2sy7hBM1j6vHdUR4Pe192w45WHPnUYILbXtiOAdQO9/Ig/
         L/0rTdDtnvplNakt2ifiBKa/xHhqJIsoILWFRtsw6OMep+nsPJ1BbZ0Tq0uoU9s5oinP
         TTNGONU8jqPq2A9RZLWIUYdRiaq/IQ68NRi9tJvh/CmROAdv/Mk47/R6fkScGCMFqKP1
         5RRCJ1pVkJaq5jZm6NdGxOUBZrNDzWLwijHT1/UwmdYDFKyHwateAOitFoaU+ncXG91Z
         hWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=OLakFZt7OnFoeOfQ0xIU3PT+VbQZ1+uQzkI+6vBqsss=;
        b=Fa4BAFQYS55Z2A0RR/cshhd8Ewv3mYHV3OB3Feh0t0dtsdO4Fw+Q2HYLC9PKNTkNKN
         OccQN2utqPloqIhSIR8z8VZnhfh6rnjR0gtOFNDh+6XJWlJP4W9P+XZzvvvs/UMoWrBD
         SzbjJ5JHKK7lY+W/VLFvW8KnaanVS/BUkBcbxbCdO0gcaob9O36WkOurpibhrdxd1Eqr
         aUpPY9bbKcz3p2ZUuIRseTuiKrO5TfYzWzF3ApQWYQ7ODH7IWDe6uSPUHGoWqAFKLTrq
         z2t4qcV1c1F5qt1IG9YuCWNNI5EU9GKzrl+qfi4KHkDdvT3cpmPUtR1TEzuu2v5Fk9VB
         kRiA==
X-Gm-Message-State: ACgBeo2Sbb/N0nLq3yu8UGL30d9FN79xMCXYvtGbRIHq06i18sqdApJL
	Q5khhKAt3ck0wNUpeEsCGgMaZGGj29xllg==
X-Google-Smtp-Source: 
 AA6agR4WGQENyGuz57ZN+oLF41E7eBI/qvz9AcHzNsMvemC+KtXxjhGnXV1O+0ZDOTk2eihAEIHMSA==
X-Received: by 2002:a63:2cc2:0:b0:41c:681d:60d2 with SMTP id
 s185-20020a632cc2000000b0041c681d60d2mr4922748pgs.502.1662588337898;
        Wed, 07 Sep 2022 15:05:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 y8-20020a17090322c800b0016f85feae65sm12929053plg.87.2022.09.07.15.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 15:05:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] linux-yocto: Enable mdio for qemu
Date: Wed,  7 Sep 2022 15:05:35 -0700
Message-Id: <20220907220535.3017588-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 22:05:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170431

There are package like mdio-netlink in meta-oe which need this feature
to be available, it has started to fail with 5.19

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 0ff28aa952..e96395d1bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -56,7 +56,7 @@ COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qe
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-- 
2.37.3


