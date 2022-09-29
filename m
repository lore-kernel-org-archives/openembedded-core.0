Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF016C07E9D
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 08:58:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.7969.1664441932997671061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 01:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ab7OIj6w;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso2813370wma.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 01:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=WkI5eiZdFfMoe2F6t2OUE7XoNlIYlraTcKprspBHuaI=;
        b=Ab7OIj6wFeGAIqXyf8kuzNf36ePcJ2vpnoYxVzP0dgi1UHu9m7VCQQbUZOwYddDMC4
         gKGSQCFpZMQQP6k8NcfmCAGUQhCn5m/FlEKrK4cccSnYeZHDtK+hQRUz2OKhokdai7WF
         bFmfUonB5TKV3L90KCMQV8IaTwRHy6iVEa53zgmyG1GmCB42T7zFYSSW7+2zsFfYMKtn
         P+tiOdSOM636x69Sl0cvCtzmWMEBb4a4ObWhrL+1Bnr0Le2kET7ltp8xAKOEBEimGCWX
         PIKeyDmLSnt6JFLADNPz1yzJlGZBs4oIeglMxj/Z/QCBdxezpX+H+wA3Db+M13//cwfb
         8khQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=WkI5eiZdFfMoe2F6t2OUE7XoNlIYlraTcKprspBHuaI=;
        b=U0/mWgkvZSOpRPdXJMeeMKGVgcB6dM0pcWGq4+/yV6tZTojzI09qLn9vKVruldSFen
         UJMiOiRutcSQT3LGrML59LOSPFGO+hR3NUPzBIH7U14RxmyyJwyeJ1NgblijEWTXloR5
         TCKiv6swd0pREYZw4mhcnfwrCP63z0SkOxsMrKrXL6WUkltsG09amD9dXkuXojBM/qEJ
         TPFbeGJns9f2s51jjeY5RBAycpTKGX8gRnJrQpaXwLJ5fyj1qyluRiT/7hagWMjXRHiD
         GZdN051L9LbGiZj4AakV2kFIjQxPMKSaMS+CL1QHerRAZyaVuz0r4aSyVDve2etMc58T
         qZOg==
X-Gm-Message-State: ACrzQf0E1PNAYeFZCb4XaGxkjLrGonXwZEJ/m7vRsVEUYrSkxyaM4tla
	sBPg4ZxUtN5TYzYbCzyx3A3rUMKfs/s=
X-Google-Smtp-Source: 
 AMsMyM4s50l7tYbjd2154pXk1sN7U64DNCmbncUYliapkj4MjoAP/Yz/QY8gV3TMlkX+tBjlwxa06A==
X-Received: by 2002:a7b:cb49:0:b0:3b4:b08a:89b with SMTP id
 v9-20020a7bcb49000000b003b4b08a089bmr1399297wmj.173.1664441931263;
        Thu, 29 Sep 2022 01:58:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 x2-20020adfdd82000000b0022ac1be009esm6216779wrl.16.2022.09.29.01.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 01:58:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] rpm: update 4.18.0-rc1 -> 4.18.0-release
Date: Thu, 29 Sep 2022 10:58:48 +0200
Message-Id: <20220929085848.2287706-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 08:58:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171177

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rpm/{rpm_4.17.1.bb => rpm_4.18.0.bb} | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta/recipes-devtools/rpm/{rpm_4.17.1.bb => rpm_4.18.0.bb} (97%)

diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
similarity index 97%
rename from meta/recipes-devtools/rpm/rpm_4.17.1.bb
rename to meta/recipes-devtools/rpm/rpm_4.18.0.bb
index 36ab90d91e..5f3986d8a3 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
@@ -43,10 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
            "
 
 PE = "1"
-SRCREV = "07a6cca98489106b93467ecfaf5700368983a9b4"
-PV = "4.17.1+4.18-rc1"
-# can be removed in 4.18
-CVE_CHECK_IGNORE += "CVE-2021-35937 CVE-2021-35938 CVE-2021-35939"
+SRCREV = "ea0d77c52e176e2876fdb1d07ad41e9e2635a93e"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


