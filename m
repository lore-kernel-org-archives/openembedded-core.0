Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCBCEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 08:48:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.6923.1687423707077981410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 01:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KFusjXkE;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f9bece8d1bso17061155e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687423705; x=1690015705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMB3EBLBIbSKlwgYwqJpqVk2W6FtPO1XAs882AP0OzE=;
        b=KFusjXkEe5QpzZZ4SlcRot95EeUmvqJ3qJ2Nfmbr2QDY/YnSzJPClWJCSNUWgD2PlP
         fOxKnQ3dCW0hwH2SOPvG2x3omxIja6lX3UDnDG6oTxoBV4zUrkfadFjBjlB5YVjLK66+
         ZPy0GYq6X9anqAJeDW3ayjGM+2i8aRAutr3x8LtHCmrFgrgaVqsIA0dKJqMwZKXB3tuQ
         iJ1B3GTDWOgBK4sLST2PGxDzws3KXF5CdguFQznts67AZL+sh16IKJsveGNii9qH4dCB
         NRq/CDCjcPO8ho65PWm2KLGoK8w+4CHMeNMZ8QmSeOTJF3bS2vMbfU49QECLRzMNvMAb
         gluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687423705; x=1690015705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMB3EBLBIbSKlwgYwqJpqVk2W6FtPO1XAs882AP0OzE=;
        b=OINaAcoM3L20BFND9A6InuHOQd7u9r0FSXnzyT2cgsPGxm0TAka7dOTUIDtNSAjkd+
         P6KSRLKDzyPerN43WTeyJ/CNy+j2wiuTSm7YwJd+2lYGxeC5G94+P4HAyqym7D8h321X
         HBYpBGlyfU1xxYIgw5G0g4E66IAkniafAuI4DN3rRTsRNcNS43GefRU4BjCjmfxfwPgt
         dLBMtgcYXXhGeg8KWYClebgO95VLTSAjtTSL95vgUQyrW0qF5sOxxgH4RliZRGlS/WAS
         xLWgoPttrbpS56RI//9JIlnsq6FuQaG6StdAEcJKVkD3J3T6MEe6e11AKOfG3x8ONZ12
         Ddyw==
X-Gm-Message-State: AC+VfDxiMASXZlS1ILFN1BIwTOsxEnno02aybwAuz3lo32b0iMLGwG0e
	+o8WeM+YhCCM0zuUGDpfcAZtR1lwyPmqvQ==
X-Google-Smtp-Source: ACHHUZ4hdnVBg4MJ7H0WVMlu8DfHAmt+H37dPIBtk39TfOuWGGH2E979o6scX3WZSjFOIJWJdWmy1g==
X-Received: by 2002:a05:600c:21c5:b0:3fa:1af8:6ebf with SMTP id x5-20020a05600c21c500b003fa1af86ebfmr1369893wmj.0.1687423704834;
        Thu, 22 Jun 2023 01:48:24 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id az27-20020a05600c601b00b003f9bb026e5fsm2018295wmb.0.2023.06.22.01.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 01:48:24 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH V4 3/3] kernel: autoload and probeconf are handled by kernel-module-split
Date: Thu, 22 Jun 2023 08:44:53 +0000
Message-Id: <20230622084452.2026849-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622084452.2026849-1-jose.quaresma@foundries.io>
References: <20230622084452.2026849-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183230

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/kernel.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index e82b696d1a..855c784149 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -483,8 +483,6 @@ kernel_do_install() {
 	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
-	install -d ${D}${sysconfdir}/modules-load.d
-	install -d ${D}${sysconfdir}/modprobe.d
 }
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
-- 
2.34.1


