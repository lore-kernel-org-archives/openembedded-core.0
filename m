Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4660BC76196
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:09:07 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.104392.1679670532583753224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zcgm/Al0;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id m16so1711426qvi.12
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzHW3SRUMbiJ2cVjm2i3ih9Sx5Z9hnCaC8Uzf5pBgtI=;
        b=Zcgm/Al0YkUCMkHnVA0goeNa7Ufm4IQpYC/BsLWGM7AmHho4yexgH//o44BkR6ggUt
         A4nBvRFEJXyNOxAdS78EgExo7yS4wtznfiTaoJi4DDIHNscLojsnWP2GkuJGSoXM3umz
         jQcsS9ANVCmxF7kqfKrs5YvuOH3R0bs/xt/g5zC52lJ8QdISNEO+/gYZZqcYqWq2Ne5W
         P7dzNqYjqKr3tFKGXv8LyIhso1NZwJMpJ08sPO836IzvfDpYtiju6RbUBlJHwuE1k32q
         uBmkz8YtbJX9raobcGV3LGWjbFsDl/DFAacoT1Kw7Q64aly7MZLRUS8917a+cokvsQCD
         oCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzHW3SRUMbiJ2cVjm2i3ih9Sx5Z9hnCaC8Uzf5pBgtI=;
        b=tA6JODvV/U2TfGKmYq/Ouv9Xjf3jBF32xjm8fphUrr+AMAvB+PVblzodI//GqThcK4
         Zp2/o9Mn+jFeWIJZzIeHgT8lQLv/L1QmqiVxATuDr0io89u+gD7BxGxXVPCvEeYTameW
         xX7hDRgdwcG+eQ92BiCIgFsVvRm5KFJRaa3nXe7wWVxrva2qXTvXi9aC582GRp3KuZy5
         qQg6RYWdJAYTwXLrx+DLP7edtkDLglr8gRcS8EWCO1bs+hWxFiZpRdQxSKpJ5+IIYCJH
         RjooEbAvvgRfP9DWr+Ac8lEGHE0sG3KqAaRKIegrjPOwQ6ARWTlT+geL/kv1IvaIPbsB
         uLtQ==
X-Gm-Message-State: AAQBX9f9rns2koP9qEdvXEuPwYW4se8Kpna2uqLrdnH6HicA4/rCFvEB
	6TXzc7DsPJiGUTFAyheJ42Vkm5WQzODwKg==
X-Google-Smtp-Source: AKy350bCeRHr2O5uWC4dlmcdGwwgzY2e8XA16/LgODl3mTZrBfSvgfZrahJEIkCl5b2E1ae88gvf3g==
X-Received: by 2002:a05:6214:2506:b0:5c7:31af:2ea2 with SMTP id gf6-20020a056214250600b005c731af2ea2mr5581824qvb.12.1679670538998;
        Fri, 24 Mar 2023 08:08:58 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id mf10-20020a0562145d8a00b005dd8b9345e8sm746219qvb.128.2023.03.24.08.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:08:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] kernel/kernel-devsrc: powerpc: add elfutils dependency
Date: Fri, 24 Mar 2023 11:08:48 -0400
Message-Id: <4a324eced96a8cc5c37ace9c825addd25b2a92e2.1679670268.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679670268.git.bruce.ashfield@gmail.com>
References: <cover.1679670268.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179048

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When working on 6.3+ kernel support powerpc started to fail when
doing on target kerne module builds, and in some cases when building
the kernel itself.

This was due to crtsavres requiring objtool to build, which was
missing required development headers.

So in a similar manner to x86, we add elfutils as an arch specific
dependency in these recipes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb   | 2 ++
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 6821efd38d..0e92182f6d 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -382,6 +382,8 @@ RDEPENDS:${PN} = "bc python3 flex bison ${TCLIBC}-utils"
 RDEPENDS:${PN} += "openssl-dev util-linux"
 # and x86 needs a bit more for 4.15+
 RDEPENDS:${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-dev', '', d)}"
+# powerpc needs elfutils on 6.3+
+RDEPENDS:${PN} += "${@bb.utils.contains('ARCH', 'powerpc', 'elfutils-dev', '', d)}"
 # 5.8+ needs gcc-plugins libmpc-dev
 RDEPENDS:${PN} += "gcc-plugins libmpc-dev"
 # 5.13+ needs awk for arm64
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 4f3d4a5c3c..52cd6f5f28 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -35,6 +35,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "${@bb.utils.contains('ARCH', 'powerpc', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
 
-- 
2.34.1


