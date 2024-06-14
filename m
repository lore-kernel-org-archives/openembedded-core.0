Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5D8C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 06:47:07 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.5623.1718347618162904220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 23:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GFrBOr7e;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: andrey.z@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso14969565e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 23:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718347616; x=1718952416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N6Q+VjL5Zu1OTUoNj5ZBsQud+qINT5FRCXGkhEdoJew=;
        b=GFrBOr7esygCdR8w2WM8S3fDM/ZEiYHEgRYSYrXC3ZnF4YIlz09vD5CETc8fbqAMCi
         HbBr/lWSq8TMmr9LdPIHTHvP0tOm3gsqD1p9xAIDmLZX+wCPD7uJMERLgSKBOLhvejm0
         bcmWQuKfD9QiR3nodKE7tdy3sS9HrkxKTsRHoRKuQFhBiPAAfIJFk2+ru0U+sxaTtSSd
         LQLmOo2/R38bmvrvL80KmgEFDn7UM6kpLSmgWgMDntB5DnIVGquceOWVFWQ/xQwDoaiU
         mt7fEHdxTN1sdRx0Gs3DomcXsSI28EbryjgYoA05nL46/OEn9+nc0vFmayvF2QXb2YIG
         5VXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718347616; x=1718952416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6Q+VjL5Zu1OTUoNj5ZBsQud+qINT5FRCXGkhEdoJew=;
        b=NMJ3ugYW8+3UDWqhrpCe5sSnqtGu2SewYlnhSUP4H7yH4YBNbb2hdcO6e1pyFtjChz
         YSGRseLG/mfVcjN7S++jdiHXuUdjpo4ZRXXoOCTsKDZDGhVPFuGXul8I+8SIWrHHL5jd
         +oD2RnfTgVOyFwyg92muiKbg0qC8eHq7v3zNa7sQRfW8bLEMaUtasHq32hDUXOfwB/ia
         6quHfQoGCGgBprx/G3VeXEjPQ1ROqUkMT1oRGpm4GxSGL0/j95kBMpJylJqGvp5TWaRD
         mg64jY4mEEqF3875sUJOU0MR/uROjb/rPj99ROzdB/af9TGLk73wGrhXBjdshVtPcVD+
         4i8A==
X-Gm-Message-State: AOJu0Yz0Jg5xhY7ZTUzm1b0n1gDm5XGIeBubKdGScB7Q5gL+xieLpit8
	CvUAJ+DFfD5xvabUnprk4i4mZZdOtprX3BpHPkHs5LnuBt9ESUEG0aaa5A==
X-Google-Smtp-Source: AGHT+IGofY7FoIjTIAPGSMpMeng5xL2eO0PjASpfrnT0KRAuTm1bgzT7D8Kfg2EtOozS4VOGig2wlw==
X-Received: by 2002:a05:600c:1d1b:b0:422:97d:43d4 with SMTP id 5b1f17b1804b1-42304d7fe07mr12132545e9.6.1718347616091;
        Thu, 13 Jun 2024 23:46:56 -0700 (PDT)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de618sm86382315e9.37.2024.06.13.23.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 23:46:55 -0700 (PDT)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [PATCH] devicetree.bbclass: switch away from S = WORKDIR
Date: Fri, 14 Jun 2024 08:46:47 +0200
Message-Id: <20240614064647.637363-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 06:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200649

Since the change done in commit 32cba1cc916a ("insane: Error for S ==
WORKDIR"), usage of WORKDIR is not allowed anymore.

Switch S from WORKDIR to UNPACKDIR as implemented in commit d9328e3b0b06
("recipes: Switch away from S = WORKDIR").

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta/classes-recipe/devicetree.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index bd50d7fa1d..1806cb62cb 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -40,7 +40,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SYSROOT_DIRS += "/boot/devicetree"
 FILES:${PN} = "/boot/devicetree/*.dtb /boot/devicetree/*.dtbo"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 B = "${WORKDIR}/build"
 
 # Default kernel includes, these represent what are normally used for in-kernel
-- 
2.34.1


