Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66079C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 14:44:19 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.56.1660315451979915123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 07:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=diJ9w3s6;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso4442153wma.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=bebxoKUjeoPxd5Y7aKdotuxdUUut6gInqBZjBRrxThk=;
        b=diJ9w3s6oE9U1m0wCnz6TJGvPepl1luu2aNpOfOpw7FiYVdyeaTfg4PhoXJrvmUKCx
         ZsnD8BkQJB9I3g+Mnvw596g7mOaxrCOfV0ItP/rr7upW1j0cvtE7KvrPuaKT3bePECoK
         CMPGVGF9NNwSDsD7gKNWfdrnl/wnL5TQ7qg0Lz8F2iPCct+EYBpZaR+Mn7cu9tKHhVSv
         I+rBBq8tipAdkNcRMSEsdwcxnj8z9utNF89rcQfek0xGKPB5freUly95OX+soaGiQcCM
         sZFGjqyCdQC8UpBoQlU15se9r+6Qvu8pMyFXWXVPlW7uF3G2zUQN/AF4sC3Zbhnbmg4P
         FdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=bebxoKUjeoPxd5Y7aKdotuxdUUut6gInqBZjBRrxThk=;
        b=FQ4gfLwA5kw/HQMG7yrQxFJR2NF2aLWsfbqDwWDeRGKuMieX4vh5Yfo0Q4cgfEh8QF
         0MmvJv2MkpTCBsVtAjcxfrkoA2/Pqg4RIqqSEdMFtUk32vH+I8UGjR/khWCnDEdTjCSh
         GOkTGckJuKzdxFGG69Oe/JygCsXJmRnFCxAoNsvv+9+cJ/BaHC3trVp25Y6PPxae6Qsj
         vGJR6+CzDZbMoO+xz683DZsQZz4KXPadjvEwdWf6aEO+WJUOZvnKCVGP/uFNiHpOetFD
         FCtA+Yg0qVtXOecwEPa23R4s9XDeiwjFng52QXc3G3oYU1J1gW2gqVLjsDNt1x6AqwyR
         2K2Q==
X-Gm-Message-State: ACgBeo20xATxMHsMdqlgzwjhyPbs2kaqgzjw50Ltx6cDB/9PCCiuICES
	3PqFOJPfS0LwO6oKkI6633G2KipXq7rU6Q==
X-Google-Smtp-Source: 
 AA6agR4mmTOBFqxXev092CCTMkqryQX/f4KjPl1T4cnXNe4oSvksHNlvyvaAlqxa78eBXGM7PHlgJw==
X-Received: by 2002:a05:600c:384c:b0:3a3:744d:8dd2 with SMTP id
 s12-20020a05600c384c00b003a3744d8dd2mr9268424wmr.117.1660315450168;
        Fri, 12 Aug 2022 07:44:10 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net
 (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003a32297598csm12581144wmq.43.2022.08.12.07.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 07:44:09 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2] linux-yocto: prepend the the value with a space
 when append to KERNEL_EXTRA_ARGS
Date: Fri, 12 Aug 2022 14:43:38 +0000
Message-Id: <20220812144338.3190378-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 14:44:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169288

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index cabc8f4975..7ea661e138 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -60,7 +60,7 @@ do_install:append(){
 KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
 
 KERNEL_DEBUG_OPTIONS ?= "stack"
-KERNEL_EXTRA_ARGS:append:x86-64 = "${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
+KERNEL_EXTRA_ARGS:append:x86-64 = " ${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
 
 do_devshell:prepend() {
     # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
-- 
2.34.1


