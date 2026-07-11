Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBABC44507
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:53 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1266.1783747492985569843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=O1ag7aBr;
 spf=pass (domain: underview.tech, ip: 74.125.224.53, mailfrom: vince@underview.tech)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-667971437d6so2248947d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747492; x=1784352292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpjNoKCHjq3jUsOcODRnkTsb/mzL1nycY/I/r7BBbWk=;
        b=O1ag7aBrSYoyiHiFKJT//IzeMRIjWPuCw0WJofdcC4I+rR4vW0RrDMDcSexHZFO39P
         8AWiqz9esc+Mfphf9TDJfD7V2JrrkCYaDNvDaZK/4VbRyKBEyNT7boF065TZ9IG5TBbB
         RyAXs7DHBvltrEIgyiuX8BmthP3+6P1gWyqelTjoHvzoLrw2v8bAHTepejj2hxFVj03D
         FCLMy8Z0gHqcgI1916psRUyJ9EEMPWDdCK1Osl0si3lZ7OoBevHccDv7MQxGrJz89wfn
         ZcflBvBfQtCICtiWmbqlDS3YNpzrmn/RhE/Bs0Uau4K6xb6cOxjsG3Q88mlYPm7g35ef
         4ynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747492; x=1784352292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lpjNoKCHjq3jUsOcODRnkTsb/mzL1nycY/I/r7BBbWk=;
        b=Y+vhRpK35t6Rpu5widXfQ81ojREAA6VxKfPH0BNyB+tkfID4wN75541rq5OD+m3Jcq
         e/FRBM39NV8VvF8zAbmYnoUYGs+UNzhTCTQk/T6m5LSbCvU8D31AF7M/xwNRsLyndT26
         Yce2gGDcDz4EQtC5erMIxEW7NSLKdPapnIBtrxekgRioWH7MeOwyjqbrODn6zUBdRmk/
         AczxzcNQV/heZ33qP6rpKNZsn1vJc2zEIVkEpT+4LuuSoqns4wR/qK/v6y/QesQXacZH
         Qsw9g4TzES0QVHH0YPYpXVuxVrlOmPE5DLJb9I/+K1MFleAhlEhrHSTjQpZsoyFW6Wp4
         zyGg==
X-Gm-Message-State: AOJu0YwLGI9KBugC5qv9b09AQnecgxQkwJwuG1UQ9qQNHXI1847Wy6Le
	9DNj8+W1qgtFtnwjww5zUreogu2TSx9bcbxlb4Zecg1cnO0NfW1dCtGBTXL7ffUZivxgbYXniS/
	nDAyI9Cg=
X-Gm-Gg: AfdE7cmdCiN5e2pfaVaXvUXuoi064zXE8WPPbAITKxTprVxD6WHrIk5cIk2fsEnuaRk
	YpYOSJBVAJt7qHOEkX3hfT3T0D7TdHJwZTxjDCU4R5VXLkEgyy7IEm76s2Mz/9I+ek6qHXfrD2L
	ZH/57YB2yASiQ6D7VvyBeKaUdZyBaS3Uetqq8VVRDskt5ByKYrFl8vpNZO4Xg5M1havFMJdu+5x
	9iDaMj1Kl+0+xJtj3fsg9oYIif/C67R2Y4u4dWe8Z7kBua9byac86bTT+LXwgCvVmePI9qv95cq
	gTT/U5lBQ20c4Vdn105CM58wSiEU3CPx1tmAkbzo/B9RXMZKOIJxjWlSekNYm9BOmjtd+wMl1W9
	2ZGxPWhVGFQpVfij6VjYlkngSckZZfy54nD+toepEKMHJ4/zojI+a/F1g7tpjx7WzgF1L4XKFXk
	TG7CwA0MTMQeuEqA==
X-Received: by 2002:a53:c349:0:b0:667:b72c:811b with SMTP id 956f58d0204a3-667d7eeb5b4mr1101320d50.91.1783747492079;
        Fri, 10 Jul 2026 22:24:52 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:51 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 17/19] parted: rename kernel prefix
Date: Sat, 11 Jul 2026 01:24:01 -0400
Message-ID: <20260711052403.1292286-17-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240698

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/parted/parted_3.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/parted/parted_3.7.bb b/meta/recipes-extended/parted/parted_3.7.bb
index a669919dd7..79b16c19dc 100644
--- a/meta/recipes-extended/parted/parted_3.7.bb
+++ b/meta/recipes-extended/parted/parted_3.7.bb
@@ -16,7 +16,7 @@ SRC_URI:append:riscv64 = " file://0001-t9042-dos-partition-limit.sh-unconditiona
 
 SRC_URI[sha256sum] = "008de57561a4f3c25a0648e66ed11e7b30be493889b64334a6d70f2c1951ef7b"
 
-inherit autotools pkgconfig gettext texinfo ptest
+inherit autotools pkgconfig gettext texinfo ptest kernel-vars
 
 PACKAGECONFIG ?= "readline"
 PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,libdevmapper lvm2"
@@ -52,7 +52,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest = "bash coreutils perl util-linux-losetup util-linux-mkswap python3 make gawk e2fsprogs-mke2fs e2fsprogs-tune2fs python3-core dosfstools"
-RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-loop kernel-module-vfat"
+RRECOMMENDS:${PN}-ptest += "${KERNEL_PACKAGE_NAME}-module-scsi-debug ${KERNEL_PACKAGE_NAME}-module-loop ${KERNEL_PACKAGE_NAME}-module-vfat"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
         glibc-utils \
         locale-base-en-us \
-- 
2.43.0


