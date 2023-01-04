Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D866C54EBF
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9374.1672830397768050219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ke/YvNAM;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id bk16so19362626wrb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Nr2yDCCq3CKJAouOv6QTaL6RBRgx9hgwAEcm00wsOE=;
        b=Ke/YvNAMbB8wJpGkvmc/+J7/Kr/X5pHEUScZeMn2y/IR6qyUxsXPDAmCXPmQTgCbJI
         pXMFdX7a8KxwvLgAFsdYTe3x4W+IB4bifH8nekINa7FwGgHusybQATjl3XYDqEKnFpra
         xhcKyx1CbV+obfCkirrdGzE9Bjx6sf+15++7f8axDMvT8tmyOfGzoUWK29Apb6GFSWLD
         WQ63vzV1fIpY29dhVGY3Slwz/zZpdgiRMefaUeGt/aNV4c8ETxWFdp9GwZg7rD63jFLZ
         4PmG8jmy5dRBJNOr0dTW2GzyTPC02uEa406VpmRBB6QE98S2w1BFKVbTBCWM/uIxqk5y
         Hwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Nr2yDCCq3CKJAouOv6QTaL6RBRgx9hgwAEcm00wsOE=;
        b=xszdh/yA2UXQeEuHgmIGas1/byH39ckVmi3RMUEEr6iwrnP5oFqq2wNP9cZ/5mQMws
         FpiIZxUn3Pjcn44BxhMJfYosK1la+h+AYy76n2ZZGf5dgjpXMTZaI53L9gHca1qE4XWd
         HdXw+slF7+xgh8bm9b48H1kEWGyHw2cgNjV3YKFjFL5bvJruwb1+3+raT7b+Jps1n9ox
         3UbyK6VaDMIWDyTpKx+xjPqiB331cNDQRpSGUOLAopk3A81nQpUMRopvUsLOava5AIzN
         d6bFpnmnblibfeJ66GKsd68pOo7WLkmymLMYyY9P33YYqFSfqfARtqOHQIFGut5E9W7N
         wBEw==
X-Gm-Message-State: AFqh2kpUwEyoS7zhqnY4D0GywGkESPIldZ8cRrZ5fpyHMXoCF5BgGgt+
	14SW+9wU+LqENBj/SGvSpczdj+ZtOa4=
X-Google-Smtp-Source: AMrXdXtVe8P5K2k4H/0eXMz8ry3NSLON704bzsgu3C9k9hfBhk/w7cCen8KiOGmlzZEBvTMcFN9vhA==
X-Received: by 2002:a5d:42c1:0:b0:25f:8ead:96cc with SMTP id t1-20020a5d42c1000000b0025f8ead96ccmr33206917wrr.70.1672830403974;
        Wed, 04 Jan 2023 03:06:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 67/77] python3-certifi: upgrade 2022.9.24 -> 2022.12.7
Date: Wed,  4 Jan 2023 12:05:38 +0100
Message-Id: <20230104110548.2537259-67-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175452

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-certifi_2022.9.24.bb => python3-certifi_2022.12.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2022.9.24.bb => python3-certifi_2022.12.7.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb b/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2022.9.24.bb
rename to meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
index a6b7467052..dca3d26811 100644
--- a/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3c2b7404369c587c3559afb604fce2f2"
 
-SRC_URI[sha256sum] = "0d9c601124e5a6ba9712dbc60d9c53c21e34f5f641fe83002317394311bdce14"
+SRC_URI[sha256sum] = "35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3"
 
 inherit pypi setuptools3
 
-- 
2.30.2


