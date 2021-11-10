Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13889C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.345.1636573198336060508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bo6/TUcR;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso2628569wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GuhSdeozr/2NdjAsT7CiYAlCaJd0Cznk2RSf2CjNjuE=;
        b=bo6/TUcRuXrZCz+N9ybz97hQGBdMPZAQIwNUAeWoovhLBakzvvbp2cdjoTGtB8FwQh
         KdS8xMGyV+YlH9WIvjWbKWP4ihYa7c9Ms224JatkA/eP/H/I6QKMKbhD6mtAsCxT0rkn
         GcabFdmOPkh1/9REkWZ8K4oqkpwdOf3Kd9bWQANMXFg1+4YnQrSWIWIwVP9x8tmNLNeJ
         y1AlW67KalL8WHwdOL58VcLibrSse62VAT2jw+uRSty+LoQ4m8KthdZznRKPLf1Py0TE
         RDl6tt6lX6uBb6Ak9jGUqaHui56OzD9Asc4x+1h87jAFGhkp6ZmRT+8E9pf+J2LTDyRb
         kCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GuhSdeozr/2NdjAsT7CiYAlCaJd0Cznk2RSf2CjNjuE=;
        b=Oi0RqxVXyNaLrND1ihvAwD8E3M53JFyayIdd+RtSXFcxeKdfOnDF5DmVGFFrbnnY4J
         NTeeIF7RheDzegFMjJzno++1488HWPtM1PKSwViqaM39ky/JZDq5YOviSJsUGD+JDz9m
         RKwIac1I08oLOPAb2PDKhe7E8t7t67Lxrf8SO3TMiiQZVdIi99cRNd94UiK9wBoEzq24
         jYe+B7rEUGkGN/ZEFIZWNbAJIgDvwrKCZT6B43Bh4rQQbY/9qQpl3gVzPJU4mXxVnFCQ
         Z4+RaeZK74iOwy2yS5qGZeJR8wqcxFcLbunlF6bAcb2422tUevCdojzqnWowAL7QTG37
         W55A==
X-Gm-Message-State: AOAM531BQ6tYagmMIiHGsPEAtbWw/kDrqAvoD9YaSUaNByHuchvDK8sI
	JxUNlKXDiLexImiLMr7RTN9FWe2HcgA=
X-Google-Smtp-Source: 
 ABdhPJxRI3k+k7Lg6G7SkyW4P0Mh1Fh4kCJQcmLYrT0Cq6PqHNDtwZoTUOXfDHwIsDkarcNwybzMVA==
X-Received: by 2002:a05:600c:104b:: with SMTP id
 11mr19778317wmx.54.1636573196976;
        Wed, 10 Nov 2021 11:39:56 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/24] valgrind: submit patch upstream
Date: Wed, 10 Nov 2021 20:39:33 +0100
Message-Id: <20211110193937.2606747-20-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158104

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../valgrind/valgrind/0004-Fix-out-of-tree-builds.patch         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
index 06b19b07c4..9a25b67961 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
@@ -12,7 +12,7 @@ RP 2013/03/23
 
 Patch refreshed for valgrind-3.14.0.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=445211]
 
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
-- 
2.20.1


