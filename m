Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA09E6B25C
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 04:48:11 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.95169.1766465284940655763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 20:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aat6MRbx;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ee328b8e38so52261451cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766465284; x=1767070084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e77BQLeOQGdUKmlLRh4rvgcV8oL/pejwkTvjvhXxhOY=;
        b=aat6MRbxA+MGSWkoV5onfOy290R2uHpKNsCSPb5Q9CmJpel7qngBc80EmmgULClqt4
         2CzlxGAcrFyNJFLoMqiCv1++SBkabH/Zcsi9Ouq6gZgTjnu0fqeaKzwhmcHwvVllQG2M
         1pjjGJSGIJGwpEbZTjrKpcjfAh1bQBAX83s7NttjcJ33MSKFDSPsc5dxBe19slCUOPnb
         /l9XstLL9XLPtXON9Nad1TRJiNFtC0UnitYon6PvRK5wb0oW4Vj0NJlp8r6wlq9tVETD
         r15ropd4+PZsYmgxb5nXD5/sEH7sLLDHhukJuaVbFKODBTC4zOlYT0Zvkvtmv3HNg53p
         QdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766465284; x=1767070084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e77BQLeOQGdUKmlLRh4rvgcV8oL/pejwkTvjvhXxhOY=;
        b=kYymeCkyS/GDN3PLRaPsoCSCIgG+uGkLsxXbHVT0kwOoHWmVHdvuOenvUQAn5k9HB4
         Y1iXlF1rweK0Gpov+7wc9DwzxTbhdd33+pHwABRX2q7IGb9TWbS4E4VpuQ7h5ji23qPN
         rCl4uHe/GWVpyAzWNrvkST5oBKEy3ZyukhzyY2jHoKeop3mX1KQFiO2WYPMQiITECBTp
         jty+GFQWYFjbM+gkVqFmKH6NROQ1cI9lgKZO6A7fzYUB6MPWfOKUGAqPVvXyseyhbNxC
         dzCu1B/fvRFn+fxzjVuFeYkwRDcFJwSJayPkYcf065gO1XqdG5O3DX/qgjp91HVBf1OW
         FVGg==
X-Gm-Message-State: AOJu0YwlqYNq7aAiS97AS0HRJafauJr3ZBSQ8enp1tbTZZFo/8svC9RA
	ut381kgwknmhzjMVGk0hnsGRIjAtisnBsDg62XxUtX9+yo3drQPZS53pAosCm4kqPKY=
X-Gm-Gg: AY/fxX6yNh8phOVPyH6bNFuD3ACnuJfZ2Et2AXXsSpk0v+wjdHG66M3QNbqU8s5QueI
	hXyEW1rFUlTcOv2lX44RRYvipyPz3+IBSP2FAN0UHNK0AX9cXNcDvKycgIPOkzxfgaPazPmGwbO
	cM5dBPgfxhsSDQ9FlR54hBgq+5xurYgRrsGLnY2xHCr1Ktt4Tfpfe1wbgOhcmQ3QPfrhXT5EIw4
	sQCLElV4os+jXXwJE1Qso5sFWlSY5yypX/Vx/SBZ6Gn4WTQWdoyY6IYulQl7cLmTG3ikRNzoeOF
	gYaqakr7HY22yQq+biekA6oxGzkPnR5rRWYZ3ITJy4IEaSaQAOMZZ4HI64SRLhv9MeiwuIqValf
	MvNidIuH6/rOSEqLdnn0HRUvwq4jm2YRjdYMEmDkLP4qMeFaroVGqmO5Auno3VzxFEXt7K1XnhU
	/VS6bRnb/NUAfSNzmJr/uOO50s+dGp1YIoNRwsC+xvUlbUkxmSlZrB4WpmebO0F+n4H6R0G962k
	3F6MRRtnnTs4a6OaVzhDZZlGw==
X-Google-Smtp-Source: AGHT+IGaNLBtOH+Z3MoDs1ClkRFZ86zfoqF22ANhN0394xw3qSEP60To0dGFF/nV9srb1cV4tkkD5A==
X-Received: by 2002:ac8:5851:0:b0:4ed:b82b:19a3 with SMTP id d75a77b69052e-4f4abd03104mr202844531cf.32.1766465283685;
        Mon, 22 Dec 2025 20:48:03 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d973ad605sm95107136d6.23.2025.12.22.20.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 20:48:03 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] cryptodev: update to cryptodev-linux-1.14-tip
Date: Mon, 22 Dec 2025 23:48:00 -0500
Message-Id: <20251223044801.3893790-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 04:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228447

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping cryptodev-linux to version cryptodev-linux-1.9-65-g08644db, which comprises the following commits:

    08644db Fix build for Linux 6.18-rc1
    ccf3ce9 Fixed compiler optimisation bug in tests
    277d457 Fix uninitialized session pointers
    3a93756 Exclude unused struct since Linux >= 6.5
    d481e97 Fix cryptodev_verbosity sysctl for Linux 6.11-rc1
    135cbff Release version 1.14

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This fixes the build against 6.18

Bruce

 meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 16a8eb610a..dcd5ec140c 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
-SRCREV = "135cbff90af2ba97d88f1472be595ce78721972c"
+SRCREV = "08644db02d43478f802755903212f5ee506af73b"
 PV = "1.14"
 
 CLEANBROKEN = "1"
-- 
2.39.2


