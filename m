Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E900CC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 00:50:06 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.13756.1664758202707665859
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Oct 2022 17:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=mTzSVOdV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id u9so5190001qvo.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Oct 2022 17:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=1FzypcS4qRbZKKyXKURLS+UUG4oLC71Rz6IqDvLgytA=;
        b=mTzSVOdVNswiuRFt+vIDUhvMrv6y9GxD57oqFh7ClLOxcqRx4aFA/o/ZD8Ickz+K+b
         ycaN5Khumg3WEgQ+BqUyYcJH8ls4QBWYC2bu5IgX3bXtSeoZVbEu+DWGAu72kPTXnZ1t
         JP5wXWTK0XRlBWYvkbQXd6OxV6wN+Sh/OLgszFK3ay70PG8EJWSCNlAqKFYnKUd8rhpR
         MblV1+qGkoFIMJWrmwDaV2ydqrAAHDh/8yWHJTHNlEmWfCyAuKiz48/r4mY1a1T7FMRM
         UcS71PvJg7StsC2Ds503A2TDhQVJWhd/xM/E8ocwiW3Gl7Q4wgpZdQsVnNNsQ+TrUbfL
         z3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=1FzypcS4qRbZKKyXKURLS+UUG4oLC71Rz6IqDvLgytA=;
        b=M7/3Vpv5mYvj9YBTTtj3fVWIkM/Pb/BIiVWlytV5C/cHwvVIsahO1rhpPkpauE1CDO
         fxe9eL4NV/+3xeS+5vFTEaoU5xbYsQvO0m9TVVddUwBgVOuTQFgvkEww9lYVDb7Hs9jo
         nom35H6r82hSBD/AFJ6rOC1HXDq+Aiso0wJkKyMiXwsLkQl1oq+TVQ52ynk4bdio4wTz
         G0rmL7BHnYRQziOtqN6zGWPfws0e27vBrg1ROooWYHp2CJWr2xGg5N2aok9N34qrAjt7
         w9nju4AqzpQHzsUpsmEkWqbG1q097OBLDwiNQjp+n9jhHBle0H5S4dqlSnWo9yOJ9f8t
         q4Ow==
X-Gm-Message-State: ACrzQf1Uh2m4RKBZDldS8IUwxYtTIvxcFmZeUD9g75zpP/5dv9Qic/6B
	+E8LveuZxlOT81sp0Va69BSjsxgVNBonTw==
X-Google-Smtp-Source: 
 AMsMyM55BXtg+EhY0+IuJ91cfbImcgj1eui4Zi6oObTaCXW6tbVvkdP1WPFw02TxdmHMnZfOORXqtg==
X-Received: by 2002:a0c:b30b:0:b0:4af:8a8d:5687 with SMTP id
 s11-20020a0cb30b000000b004af8a8d5687mr14690487qve.77.1664758201332;
        Sun, 02 Oct 2022 17:50:01 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 q17-20020a05622a04d100b003447c4f5aa5sm8594114qtx.24.2022.10.02.17.49.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 17:50:00 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: add efi entry for machine features
Date: Sun,  2 Oct 2022 20:49:59 -0400
Message-Id: <20221003004959.1317009-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 00:50:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171357

EFI has kernel features when need to be enabled for it to boot.  Add the
existing kernel config fragment to the kernel config if this machine
feature is enabled.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 7ea661e138d9..091003ed8299 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -33,6 +33,7 @@ KERNEL_LD:append:arc = " ${TOOLCHAIN_OPTIONS}"
 
 KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc"
 
+KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/efi.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
 
-- 
2.30.2


