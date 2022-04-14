Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8469C48BCF
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.7204.1649904756214306742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FGyrKFth;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso8054906pju.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pf/XVbG9wgH2loJVg+ptvjBAimwuLno5Jz5a7KTCw2A=;
        b=FGyrKFth/s6McJR8bltbT8tWhiR3Ert5qVzLR8N080Y0rX4lCo8VVEv8ROxBpDuJ8i
         9QnVaF+laNRFPvC2m98J4Io1Ect4SanBMbAcUye++dKX6QX1qyX94Op/6xQ3ZYqDIiHK
         NRLIM/r99e7735ffKGHGwqxceMJo6ekvODuYggLZrLx0a8Ptdjr6Tc1+3VF1IoSSO2h5
         E9fmjxy/Gs2DYJDqEIqXZejOitG1VPccLo11dwxKnVjfL1AcyKMyLjnrINTVv9qpThVg
         aDwsIi9d7ZvKpnSUbDnDS/qX9TwwoTpXaHUYHNj52N9JPlYda+ktCUpda6zAoHglr0ZF
         ijKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pf/XVbG9wgH2loJVg+ptvjBAimwuLno5Jz5a7KTCw2A=;
        b=QWvbodiYBWwLSI7oWG3EfFJ9QBvhGLfZmW4sQDOZSpja4xxuG9UGVBv1LJj/jrpc5j
         7YzzFZa8nsNmRmMcMZuwQJEAosPm3cilhlRlGAu2EHm3Ve4UQ1vCmZdPkvRvl95zdVbJ
         1PAoTOQ4YIZkXoYg5G9UWxceQcwgcEAp4/ytpNSnUGPUs1+ZCXxi2+CzUj4LVSsXDTcB
         U1y3zkVuhEp9hfg2tsBIDyOoz3krIE+pmKhcJk8jqW1kgw7dJ3ynUwYNsNDe1ZDQAme5
         QYU6rQIN+7Eyl15rTepLyomk/DI2HHmc7lRuyqkt8A2+7NcDK/qv2CX5bORkrVJgBFJv
         dL2g==
X-Gm-Message-State: AOAM533jTTbakXqOxzMqjjfZz9Ezr0ocsZnzEv1n8LXCiKIaGHLFATbw
	MlMeD4k+TtOTwfdvCJHvkNK0E06rkV4nwg==
X-Google-Smtp-Source: 
 ABdhPJylrMR3pY5ESH/WmzxHG2jiNXyZhLAri47Dc0zHLw4k5+U7XVqAQP/D+D3BmkByTE8XkdNYhQ==
X-Received: by 2002:a17:90a:ba13:b0:1cb:6296:ce41 with SMTP id
 s19-20020a17090aba1300b001cb6296ce41mr1353005pjr.104.1649904755594;
        Wed, 13 Apr 2022 19:52:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4307])
        by smtp.gmail.com with ESMTPSA id
 81-20020a621754000000b005082073f62dsm453735pfx.12.2022.04.13.19.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 19:52:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/6] mdadm: Drop clang specific cflags
Date: Wed, 13 Apr 2022 19:52:26 -0700
Message-Id: <20220414025230.1166825-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220414025230.1166825-1-raj.khem@gmail.com>
References: <20220414025230.1166825-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164379

This option is no longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 1c2fc8c37a7..19035caaec9 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -35,8 +35,6 @@ DEPENDS = "udev"
 SYSTEMD_SERVICE:${PN} = "mdmonitor.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-CFLAGS:append:toolchain-clang = " -Wno-error=address-of-packed-member"
-
 # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
 # prevents 64-bit userland from seeing this definition, instead defaulting
 # to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
-- 
2.35.2


