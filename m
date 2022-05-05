Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D32C4167E
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.7348.1651727160089829482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cy88MRx7;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id ba17so3906828edb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gSyhFDRVUjmz5MYV8AiY9izPSmMRr5BRI5+lZarmvoI=;
        b=Cy88MRx7ytG85+CkXiMiiYBJLJtprkGDU5IKLpZeZByxldEBEYu81PW/u0C57QV0oS
         owPNJMCq0X63iUxdMO+SP7xSnX6pq8pxlnnuHMWH8wfCPpPLxxfDZXpXcF4l/3Y9f5XY
         Gn5TdohZ6yZIxy5sMPLooAHY8znwYRKJhLe0yXCspXMMwG8Kn3DH5F6WjVheZsaELU/g
         FIN7B1KCpkwoMhI3dDovbPC6p04BdmFon3MSMF8BQnCr4K+xXKPn6zUQjrT+BtlhkzHn
         OFQngOmRIubAU0e+1goTnJyNYHZgvOiPl3Hj6W2v7ckAmjyi04y7RH7DZpEPuncFMnf2
         bykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gSyhFDRVUjmz5MYV8AiY9izPSmMRr5BRI5+lZarmvoI=;
        b=56D9Pab/69F2W8+kbXWsoRd8amyH0TDjWIlU8ozpuAFO4M40by5IALLhq+PRDXO+A4
         ZzUzye6EtyHl0upqm3GU3xcOCdV53OqwYfJtouilAmMOJJzY80QiShvR7F1zFPr8Qqfl
         37uHqthJNwk0vojiN5otKofDDO7LVsWSmMtvjr+5qkYDRzjHZg3JvfOlFkNLSePSjE6A
         fE2G5IlcyN7KB+IEF/7uEqcRVgaTew3dnqORZA2AKjvDt1e5yaaYa3GhBn5lNzMrPVre
         CeNDwvUxp0cFlTD4TWkPi0wbuH4+XrvuRiKWFXAVWltbS7GMpCR2DN4kPBPt10gwov4M
         yXug==
X-Gm-Message-State: AOAM532H8zzcQJTRpxm5UrderbFWH7aHBmDwyMf0lai957HDyV3E+Dxu
	/bIFBj/iDcnZBhtt1pDYJyhuW2Bgi8U=
X-Google-Smtp-Source: 
 ABdhPJzK5DKEBp9K76wuuAqDfSdIgTyrOkUrFvzDJBllSrOkPAkDA95VKadruJPNe0A71+a9T6EeBA==
X-Received: by 2002:a05:6402:27cd:b0:427:bf42:44cb with SMTP id
 c13-20020a05640227cd00b00427bf4244cbmr21269221ede.276.1651727158719;
        Wed, 04 May 2022 22:05:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/61] cronie: upgrade 1.6.0 -> 1.6.1
Date: Thu,  5 May 2022 07:04:58 +0200
Message-Id: <20220505050544.651895-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165244

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cronie/{cronie_1.6.0.bb => cronie_1.6.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cronie/{cronie_1.6.0.bb => cronie_1.6.1.bb} (97%)

diff --git a/meta/recipes-extended/cronie/cronie_1.6.0.bb b/meta/recipes-extended/cronie/cronie_1.6.1.bb
similarity index 97%
rename from meta/recipes-extended/cronie/cronie_1.6.0.bb
rename to meta/recipes-extended/cronie/cronie_1.6.1.bb
index d2f08c9af0..6d150dd3c7 100644
--- a/meta/recipes-extended/cronie/cronie_1.6.0.bb
+++ b/meta/recipes-extended/cronie/cronie_1.6.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[sha256sum] = "3f7cc263d21838b53a9943eb2a26b862059e2ae36c3f11789ac33cd6818e3628"
+SRC_URI[sha256sum] = "2cd0f0dd1680e6b9c39bf1e3a5e7ad6df76aa940de1ee90a453633aa59984e62"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.30.2


