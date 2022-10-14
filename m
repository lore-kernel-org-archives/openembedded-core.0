Return-Path: <massimiliano.minella@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E74DC433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 15:40:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8790.1665762056711942218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 08:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mgw5oPyn;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: massimiliano.minella@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so3829721wmb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 08:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLVGsx15autn76wWxn5u4k5BLFZIyTc+nfNx3pEyXec=;
        b=mgw5oPyndlUdUkvIGSKbHWF4VVs8r3AJquDruO1ykZEaZysLSMLYV2yCuEH+E+7RgJ
         YPjEmLvofOeC3OGxh2UJhiBEEtvF4IyhUQj6CtYG62LkKIxJ/SweCQXib0S/ctzSju7g
         BryTEAT+hkyF2CWE2vRZZbNssIINCnwx/yd69K5xcR50D8GDSMZBx6G6jLpvt42KhGYZ
         lMXAp2/JGfGMHV7GoSgp6bw/R1R3P5q1hY95E44q8est5bEtsNoGXxteLz0iIuEjIZun
         HUz6YOmwVWsmUPaWYM/IpXvyHeGJacWEpN72K09Gob5eHaPVAl3F7frDTxuMT6IsXjGD
         4i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLVGsx15autn76wWxn5u4k5BLFZIyTc+nfNx3pEyXec=;
        b=oDU29IVX0LFT0CMY5icqTIFuiXUPtwNE6Aeu+t71v0qZRraXApPnpq3ezL1TJDYmZ2
         PNJ6NSl/ZycNm2Ipe58uLUHDjAwGNJNg//YDPC3N+4Ngm67WN6MZXLMb8+MMa+/C4rWw
         SkLZwgOCGjJcEb7D2Web50LF4ItNJ5PI56E4WEYauUmzt6XxthLchfMkDNOXRw473sx3
         KOUhkqoTbh2/S6J1vZ2rlrCTynNuXvKF2q9/0gIkqxdZxQPBg78QFa1NIzbI9CguDZ2U
         64JY0ZK4OaAwN1LhKnVrp/AMfprhIkHCZ7aN2ZNRvK/RlyZOf1rxnkWgfOHOCGBWz3bh
         68zg==
X-Gm-Message-State: ACrzQf1SjEdB2LQmdmjSQHJrGrzIYJzKj9CcQr4kiM/jCEyx7EuQCvIJ
	8Xj/RJYhIs3WMNy9f3YTgWjaGcemr1xZMg==
X-Google-Smtp-Source: AMsMyM610K/c2ElrhH7mizv5KfQZLmFiV2Y+4K7MhpN1LdAz6F63FK1wzy+tqBOQc6iFytQ+o8Ha1Q==
X-Received: by 2002:a05:600c:198d:b0:3b4:a62c:a085 with SMTP id t13-20020a05600c198d00b003b4a62ca085mr10351849wmq.140.1665762054845;
        Fri, 14 Oct 2022 08:40:54 -0700 (PDT)
Received: from massimiliano-VirtualBox.localdomain ([37.162.49.115])
        by smtp.gmail.com with ESMTPSA id x12-20020a05600c2d0c00b003b4868eb6bbsm2729905wmf.23.2022.10.14.08.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:40:54 -0700 (PDT)
From: Massimiliano Minella <massimiliano.minella@gmail.com>
X-Google-Original-From: Massimiliano Minella <massimiliano.minella@se.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@microsoft.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Massimiliano Minella <massimiliano.minella@se.com>
Subject: [dunfell][PATCH] classes/kernel-fitimage: add ability to add additional signing options
Date: Fri, 14 Oct 2022 17:40:47 +0200
Message-Id: <20221014154047.480244-1-massimiliano.minella@se.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 15:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171737

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a UBOOT_MKIMAGE_SIGN_ARGS variable to enable passing additional
options to uboot-mkimage when it is run the second time to perform
signing.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8fd7ee7414b45a1feeef7982af3583475902a677)
Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
---
 meta/classes/kernel-fitimage.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 7c0d93625b..e0dd215167 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -59,6 +59,9 @@ FIT_SIGN_ALG ?= "rsa2048"
 # fitImage Padding Algo
 FIT_PAD_ALG ?= "pkcs-1.5"
 
+# Arguments passed to mkimage for signing
+UBOOT_MKIMAGE_SIGN_ARGS ?= ""
+
 #
 # Emit the fitImage ITS header
 #
@@ -479,7 +482,8 @@ fitimage_assemble() {
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
 			$add_key_to_u_boot \
-			-r arch/${ARCH}/boot/${2}
+			-r arch/${ARCH}/boot/${2} \
+			${UBOOT_MKIMAGE_SIGN_ARGS}
 	fi
 }
 
-- 
2.25.1


