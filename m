Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11EE3EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 23:18:17 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.21854.1687216695617763090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 16:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cAIjsmF0;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30af56f5f52so3115255f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687216694; x=1689808694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMB3EBLBIbSKlwgYwqJpqVk2W6FtPO1XAs882AP0OzE=;
        b=cAIjsmF0xqwdezDBLWH3jyophgBYCVIw4lmGyrQgGin/hIPoBLA/J4GF2qCvcwZvIe
         pGimFLu6bz9y0Kdz+U9xCQs1QSrf8WKwDxS3+JZ58lV5BRdeMtNp4PcikZWndmdlmc3v
         6ovpwmOGkC1fKnDdvkzhR9bHJUF0tY2VeRK8Bu5HY12lShZaFNfFIHbtc8Hy6prHZx2e
         lox3E2AL14TVQgOtk+SCvVfJ9I7rx5BfUbWIHcuHPqDxjBVIHXriPy67bHsO72FEkCgA
         6gCesnYBAQA50LYIuW3BxRv2OehhaG0pfCs+6GIUAAbQUyAonII/PSFV7FZgq1RcPipB
         GFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687216694; x=1689808694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMB3EBLBIbSKlwgYwqJpqVk2W6FtPO1XAs882AP0OzE=;
        b=G67AC4v/s7PQ/v9f4aIbkqkNLTJTMdxihvWOKScdxCzjV7PDys0wpUZK3Dh0WtbS6I
         2MLNZZrzJ9wIhKcItIJoCSaYDD7huxS+MiJsXjPgscc3L32nknvSVUkR6/YkowZSrtvu
         ILm3tNOcsiL2uZ06yLBtACEm5mBBL4WrT9AmM/zg6aPMPDmRpCzSopE0jseFe8YjB+uC
         olwNFsQVJrCl9F/a+WI56CHskBg2pxHmljmxxWe6byLT/VbqSsCb0lJO6awMVxLfto4O
         fEeTWPlGmlVZYbyNL+xhgs8zydoLsIeJzvs7cKwZ28nzctl09KwoDvVkTeX1yktcUGuV
         yvFw==
X-Gm-Message-State: AC+VfDwlSDi9PwMj2IVTzpVcKCDhVu4PwoGJKOAeo51A+VDmBlW5KMvj
	megXb987u3g7jFW0kRojFEE4XxQhg6o=
X-Google-Smtp-Source: ACHHUZ6BGSQOPqb+MXMJSUv30ILgfnvYAn/PD99v5B4GB5/VF7cqHbXndkyau5kfcCDnYxODUHjHKA==
X-Received: by 2002:a5d:6289:0:b0:311:ac3:909f with SMTP id k9-20020a5d6289000000b003110ac3909fmr7192536wru.56.1687216693589;
        Mon, 19 Jun 2023 16:18:13 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id k18-20020adfe8d2000000b0030ae3a6be4asm615610wrn.72.2023.06.19.16.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 16:18:13 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH V2 2/2] kernel: autoload and probeconf are handled by kernel-module-split
Date: Mon, 19 Jun 2023 23:13:44 +0000
Message-Id: <20230619231343.1683736-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619231343.1683736-1-jose.quaresma@foundries.io>
References: <20230619231343.1683736-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 23:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183122

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


