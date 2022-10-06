Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB56C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 13:46:38 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.5886.1665063990137198005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 06:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C1rkqDzz;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id z23so4630913ejw.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 06:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0Tol3+61fwEAnUBcrkENpb1DFMFwYATPW/82WHMdgw=;
        b=C1rkqDzz0LuM68ov74PSwEsnVSPnHYwtPeafO030I6p/rb+IrnGy2jtRT9pnyxFMIB
         4m7A+vCEee01YUcK0e0wjQlgY/NrrTzrK4qhcqPGtiddWUEF7llhjJ8O/cnKVZY02WU6
         XZjdm7nd63A3yMfJ2x5674Xy8unURhFDs9yX+ZTJa+4+CeCdHA7WTptJbKZRnszu82BE
         HcXT48+Dgq/hH8kpqSvPFIsGp+Auft5FBR1hkS+BTkSCsPeXRWY4uXMlsS/0EF8WhFt9
         RyCu6/9vSZyo/W4mLVL9AvpIdwRvA3FPQbG5StKcWAOOnlKBzQhwkAisGnUp4M2B0p8C
         /otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0Tol3+61fwEAnUBcrkENpb1DFMFwYATPW/82WHMdgw=;
        b=h4j0N0pUuSXVq79GCndd/HG8AX2JDOA0yrutpyaQLsHMOa4bEbBVUMU8rtijYMrIEM
         DlMe1/uFNdgGJJWWksgTrwufOtNRnVOeEWcvDWxtZJiW3nHdRhC54sBaW0kyutYWiBd/
         5Z8pIscwyQtc8B+P9xLYTn1QXRdaYAxCJRPxbyo7QRJQvX/VXZRfZhtjsyA8vq36eWqk
         dWzPW4qAaJOyD5e0amQFDWbNMGDasyOo6kqfrnwjKwxJ+ZnHya4Aojj1m25cJdRXHajo
         M80wDoA/EcChU8YhFizwS/8SIVm0uQR325r2s46OGe5HhhQ+L1k+dN5i7dcmV6XLy+pI
         4NpQ==
X-Gm-Message-State: ACrzQf32O1TXcR0oqzAbdxL5zJO7/oatuC5M3dW/cv2ZPbFt994/4XV8
	NzntAscQynPchiDxb/0d3MFOzoqMTwh+Gg==
X-Google-Smtp-Source: 
 AMsMyM551i9dkmrOtsJJIXfaxNAtAKLaP80RT9NlnjLoZIk9+usS1rp2DjiSovZEjjfkDqi4vZ4RYA==
X-Received: by 2002:a17:907:2cd0:b0:78d:a09:55f7 with SMTP id
 hg16-20020a1709072cd000b0078d0a0955f7mr3841207ejc.541.1665063988494;
        Thu, 06 Oct 2022 06:46:28 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 c23-20020a1709060fd700b0078afe360800sm7174262ejk.199.2022.10.06.06.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 06:46:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Chen Qi <Qi.Chen@windriver.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH][kirkstone] image_types_wic.bbclass: fix cross binutils
 dependency
Date: Thu,  6 Oct 2022 15:46:24 +0200
Message-Id: <20221006134624.1148734-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 13:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171505

From: Chen Qi <Qi.Chen@windriver.com>

Enable multilib and wic at the same time and we'll meet the
following error.

  ERROR: Nothing PROVIDES 'virtual/i686-wrsmllib32-linux-binutils'

Adjust the dependency to take multilib into consideration.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 5374d6125e..6453dd1b74 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -85,7 +85,7 @@ do_image_wic[deptask] += "do_image_complete"
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
 # Unified kernel images need objcopy
-WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
+WKS_FILE_DEPENDS_DEFAULT += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
-- 
2.38.0


