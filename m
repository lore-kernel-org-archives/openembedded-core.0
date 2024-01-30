Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E57C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 20:32:27 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.7297.1706646743369418038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 12:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jP0YdySR;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ddfb0dac4dso3144458b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 12:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706646742; x=1707251542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GcJB+iKvvHM2mOabu1r2ii+4ZLhXzaryhKhxu2vl13Y=;
        b=jP0YdySRxsXvA+AlPjFIGRSfoTnrPiIqqUXcbH/0gp13oZnfswXD3rm2sWKHnhM4NA
         E0yO9CCGDbgqE2uBPOTNlcXoWnrLmNZryebMA3m7KyK8TKtP7Uos2Io4CfYEwhYBB0vk
         Hxkkx6+i453lQmGEezu5ccgtMDxW75KreBtna7Nky8oviDACzhT1+LuwiFDIn7DpeoOn
         STA4StNY8XOnm/fxBDI3xCeA9wzPlxJMcZMAJraz/UjtpZ0XaWMlFa9jlMrea1oXPvup
         SMU1oAnZCj4sgBVhe4sTNFU3zOPuIw5lIIyZ91zKjwStggMtzPfXY6apJH5ySsd+9AS1
         0sPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706646742; x=1707251542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcJB+iKvvHM2mOabu1r2ii+4ZLhXzaryhKhxu2vl13Y=;
        b=jLgBmavpH4+9xKihCsKexqr1EvPBHyoTQRpfRQiNeNp+FPcJxlB4OBKhHD2p0RRJAH
         7VkKUWysCgG2GNfjAkGKhTLEB2Zs6rlxVXeeP4cOFjASKPNDYY1+4XqkehZqtC7wPdvh
         jQwgFbeQmpY1kbtOnOBkzxmXvvAvv+euaoiaNWIgZ7KlrSu8X1ePrY2vs5BSY6JXwmDP
         3t1bxhi8mr5pC3aHunRANJE/Bgg2Kp5e2azDs0FRukUdB/6AEJVXQaFryYQamAIMHE+y
         EJhOMknJz21KONp1pzAwohPY/OBZGqRNZS0dVqjKciaT3BM9/f9HpUw3fsz7ec4gDZxX
         2OSg==
X-Gm-Message-State: AOJu0YxAWbT1lIwTSwJWHu7Ic36S9Wd3x7ZDdtm0c7DAMAV5fIpav4+L
	Hfdei22Gf10SV/47j/FHgzXauyvvKfGeu4ylHLKI06ENhhOBKytXoaVJJU/f2A8=
X-Google-Smtp-Source: AGHT+IEvvmFkNHHJe7rjuOPuOK/mXFxJWWbxq/RobzVCY88Du3XqBggm+sa/L0Fq6ibupy6MVDHu3w==
X-Received: by 2002:a05:6a20:b227:b0:199:36e3:e81f with SMTP id eh39-20020a056a20b22700b0019936e3e81fmr7631632pzb.43.1706646742361;
        Tue, 30 Jan 2024 12:32:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3f31])
        by smtp.gmail.com with ESMTPSA id ks2-20020a056a004b8200b006db3149eacasm8280361pfb.104.2024.01.30.12.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 12:32:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] core-image-ptest: Increase disk size to 1.5G for strace ptest image
Date: Tue, 30 Jan 2024 12:32:19 -0800
Message-ID: <20240130203219.4155783-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 20:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194504

Autobuilder sees and intermittent failure on strace tests and it occurs
quite often therefore bump the size of image as the space requirement is
more now with parallel execution enabled.

[YOCTO #15370]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/images/core-image-ptest.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index b6f5c2fd604..f2d0ae94b89 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -21,7 +21,7 @@ BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS').split()]
 IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "324288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm = "1524288"
-IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1524288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 
 # tar-ptest in particular needs more space
-- 
2.43.0


