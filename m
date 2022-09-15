Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E93BECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 09:46:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8068.1663235186600381774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 02:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WIe78GwY;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so17344945wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 02:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=TnCiqPFgvHFw+ythsWdj8eUa20WrJGdTFXEeNf81wUY=;
        b=WIe78GwYMHkal7HwYbdbfNIMw7TkUL7+mZagXBrljAX4D40+7dRXoavRx+mjX/zlkk
         WWsPU+Y3QuWMm3EBEsczx5HJtjBQeOzOGceIDz7apgcaTYlcvVn93E9aLqv+MkQdXtjj
         aOVgzQPRh2ymb+bXIPoeR0NDKcN+5oEv7FszSZHHahALagUVyz5Dgos7FrvnO6VtRwvb
         lnjBpQVRZbAA/gOvvQreQGT0DFvEFRPKDV6znr1eSy2lOONqe3QrnMX8zQhbaibYkD8w
         bOA5+bu12fWdE0pDtuumCXE2hkPJ5xptytHBJbswkKzeIx4uyLxxqrZlk7nvQ90Aus2y
         IZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=TnCiqPFgvHFw+ythsWdj8eUa20WrJGdTFXEeNf81wUY=;
        b=e7poL1JlempzPVAPyV+lu3d+wcL96jfGAGe6BKoY6MI8bCz8HipEr7+xG6lTr7Jv8G
         yGmgX0gdX3cxqvWSLLfBO+gNZO6AuJ9pNS94AtYD+Im/YRvnorJoQsp5KPNoibLusjEE
         YtURVqvwsk7Rxoa3Ap32UQK4r4frz1tEPHtSg1ANdJ9rMotRIgwicAd3Vkg9tDeCvx2k
         OR9MdySXZVQJrwdh4pJLmxJkJpz9LhNmmbcHx8x15Ep/u8lRxh9WGdxpP3CnVm1VQaxZ
         mgrCFSXlfPf+L1oRWvTk5aGxpiJd07kCBMMMIkG3Ux8ZGZMsJ0NB+m9BRZNVhaPskFfu
         UvuQ==
X-Gm-Message-State: ACgBeo3KfaPRRHLpFLFpcZrpR46juLcYPmGqWgqcNWSZMZ69ihX4J728
	smB8YU86m/UHZnZZONXchVoXIJWC2MEkRg==
X-Google-Smtp-Source: 
 AA6agR4u/gKg+5i0LFVnnUnoe5EOCRV3/gQWXZIggF19vTD57x2O3XjQkFjInYXC6w5wpqhU6b7Ryg==
X-Received: by 2002:a05:600c:198c:b0:3b4:a6c4:3e09 with SMTP id
 t12-20020a05600c198c00b003b4a6c43e09mr3458584wmq.121.1663235184545;
        Thu, 15 Sep 2022 02:46:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c461100b003b4935f04a4sm2515593wmo.5.2022.09.15.02.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 02:46:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] init-system-helpers: exclude experimental tags from version
 check
Date: Thu, 15 Sep 2022 11:46:21 +0200
Message-Id: <20220915094621.3258303-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 09:46:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170684

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/initscripts/init-system-helpers_1.64.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.64.bb b/meta/recipes-core/initscripts/init-system-helpers_1.64.bb
index 22ddd6840f..663d60c6e0 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.64.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.64.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=c4ec20aa158fa9de26ee1accf78dcaae
 
 SRCREV = "c440893051406c11f0a315058939657d5937be4f"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))(?!_exp)"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


