Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9B7C64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 16:30:46 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.12376.1677947436077627905
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Mar 2023 08:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RT5BHmaP;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id i28so7490203lfv.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Mar 2023 08:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677947434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXzovggULGS4fXi67vgw46EtxOe5Dlp57Xylue2hl3A=;
        b=RT5BHmaPjjWJDCfmW2m7r9l/zdyvhcD5ItZf+mfW3PoExvkcOp5vQ9CVEl5MkLQnMI
         y8w7zlIpt9tc7j1ydl730eHcQiVzA8wxjBOwDY9FlP3c8fsMVsGeGwgi7nBndUnm8qwI
         A6IZdv0y4b0TCLpm0PudQ9O4P6Etg8+yJPBN/my5X4BWGag6/1yOvmUz4mBjQpufZekN
         rRlQTOZYz7wgYBJrzCpQcosC1q6ZcYE6bWWdsKkI0rIA3sNfibpR7Ez82M8E9u6La7cS
         HF5tQZivCYFf/HcQJxK4QXgKfzOi8L+EX6kF1rA9sczNm14dUKBZ6jlNYAo6MNNmhxLV
         hYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677947434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXzovggULGS4fXi67vgw46EtxOe5Dlp57Xylue2hl3A=;
        b=FZKa1oQwKsNQ7xR6Cpsr/m2LFcHLbmI5+dV14ADVMbnGsFpJ3Irib/fyY9l8IrSynd
         YuJuYd6ztsTd0Dlz0lXWOvxOlKlATAT5Qpqc5KXL155egPNJZV1+NvrZM9XC2nTCHGtu
         /M5oolOb1zMz40FbuipMCEW8vYOwOUQtWthX/Sz0BvPnu+2GijfGDKq7ZgJQTMgmMHGz
         kk5Q+0kNg4aykW+HR/1tkIcyM45KwcD391mqONdLSiwyGGQGqFn6/G0wsrK2nM2LYgc+
         8kko4leE0JwkpnvLwCy+8R/hlA3wJVJJAXFxAtviEKX3lorUWlKKszqzdqJdOxdnHsdU
         5iKg==
X-Gm-Message-State: AO0yUKVdUzIeVCv5smXCINfBbNI5ERPVe8r7lmrCw1r4B/nMztV6XevG
	L/cHeI8KLU08lOgdVRO5C/Kcum7p518=
X-Google-Smtp-Source: AK7set+JFF2CATDmGpaOEe4P3Ttl49z9q2b3w9KUZqD6eTNIkOPtYLp6WSNlNTo/Em474uEvHtu1Qg==
X-Received: by 2002:ac2:558d:0:b0:4db:3882:8f42 with SMTP id v13-20020ac2558d000000b004db38828f42mr1722553lfg.45.1677947433889;
        Sat, 04 Mar 2023 08:30:33 -0800 (PST)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id m16-20020a195210000000b004db2ca9dd33sm858879lfb.275.2023.03.04.08.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 08:30:33 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] linux: inherit pkgconfig in kernel.bbclass
Date: Sat,  4 Mar 2023 17:30:29 +0100
Message-Id: <20230304163029.31124-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Mar 2023 16:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178027

From: Ming Liu <liu.ming50@gmail.com>

pkgconfig is being required to find dependencies for building kernel
native tools, move "inherit pkgconfig" to kernel.bbclass so BSP kernel
recipes can also benefit from it.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/kernel.bbclass           | 2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 --
 meta/recipes-kernel/linux/linux-yocto.inc    | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 3f9c6c00e6..92090ac14e 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -660,7 +660,7 @@ do_savedefconfig() {
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
 
-inherit cml1
+inherit cml1 pkgconfig
 
 # Need LD, HOSTLDFLAGS and more for config operations
 KCONFIG_CONFIG_COMMAND:append = " ${EXTRA_OEMAKE}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 9ef5b80a37..8039a52324 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -10,8 +10,6 @@
 
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
-# for ncurses tests
-inherit pkgconfig
 
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 93eef9e946..934591ff1c 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -47,7 +47,6 @@ LINUX_VERSION_EXTENSION ??= "-yocto-${LINUX_KERNEL_TYPE}"
 # Pick up shared functions
 inherit kernel
 inherit kernel-yocto
-inherit pkgconfig
 
 B = "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"
 
-- 
2.25.1


