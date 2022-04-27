Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73C4C4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:26 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.5847.1651048817537905457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cpRWk4F4;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id be20so1070869edb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bKCyq8rfS36WRX6+4T+mlRAbRrjpWqEe+4nkbROvXnM=;
        b=cpRWk4F4zhbFdxumilRMpglo9bPkyC9W9QUhFbfxeqe1ilONxonPpIm6JYFHZ094nX
         s3YPrk4m1/wxSWq58Z7hFiy5vI1oINS70l+DOR/e2oHvQBRTibaUOId2sod2ZMlhOMR/
         13+rdy026NopFGkvjxSPckpbju+1FbHAeLKlmMkGGiI5AjIFStMuZ9nIboJg6DjFflk/
         tO0+v5XJzY04MaRYPZy1SdqlGZAYeFlEwhBRQiV6jkA1fnjbd1FPTn4gOombKLaYmBn2
         u21KjdIOoSWFYi5IdJMr5Pl9XzvA4F3pPhpEkg0m3fQ2ldr0kQS+rRUdkcKLh42k4r28
         8O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bKCyq8rfS36WRX6+4T+mlRAbRrjpWqEe+4nkbROvXnM=;
        b=V7y61fe0bn+URaNZ78/lN6Zi+PatYMMhUYJn8njW1rTSwsn3ruDOUwZhMnQomFp4zQ
         i/8bmLWBsfJQqWpPpf9w0QaE1plbYN0hscmcBv7BNGZaNENm7wNBFGue7GWBpgOpXOr0
         Nfk5qky0cgvhrTCC0Ahe+h46pjOVn8mrQE6x1Szv26oMZQJNyAeB1WAnOFYXxqaiKpGr
         5nN8xxp3OJP84q4oKL+/N6VWxXmrDoyfos4eMndrnaV2o0M48T4POmyRj6EolVcmXBmH
         EZRBZDk1i0BA28u2Xd/oW58px9s8dGaEUWYJEiHX7yep6M7FwTRwv6wYJMgz2OcWxgAV
         N2Wg==
X-Gm-Message-State: AOAM5307SdGJAXgaVXjnYoyddWkq9k8fO8bwYj72a4qoTyXkJP3lTC1f
	UpMqqjgIf6mBE3cPy3s0tTJboOaTz0c=
X-Google-Smtp-Source: 
 ABdhPJylKsj/7cutMabi1zlMfJN48bLbjninuJzA+I0zBWYT/Pmi84TMWMukvAZjbkpCPZ6Vxn4/SQ==
X-Received: by 2002:a05:6402:1d4b:b0:425:e0ad:7203 with SMTP id
 dz11-20020a0564021d4b00b00425e0ad7203mr17125348edb.367.1651048816124;
        Wed, 27 Apr 2022 01:40:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/18] go-helloworld: update to latest revision
Date: Wed, 27 Apr 2022 10:39:55 +0200
Message-Id: <20220427084009.3406717-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164895

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 1e2434fb17..0faab39b66 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https"
-SRCREV = "ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2"
+SRCREV = "2e68773dfca072cb81f219fc3b97ad34fe9d9f94"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"
-- 
2.30.2


