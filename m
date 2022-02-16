Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE087C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 18:17:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.2852.1645035434216295171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 10:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jlD8EAM1;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id w20so2599800plq.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 10:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W8EzkW79WfzCiH/wazv4LWH1GwIjbW/m0X8eDD3coi0=;
        b=jlD8EAM1zsARwBDS3RLMl8PUu130U885avkqmOd677kYxHmnjyS2SDhU/CoTXSFuEH
         j6m6Aj8EEqyMg7x876PKTrahbgtfewBOUk6boojXF1IhRWtws89uae5P1CXdIgF6b8yL
         SX5ScmPKw345PbUipVi6qv1zZZ37JRBo8DmqcDEDHSEj4FjqGSQ8XQgYdVxZnon1FDrY
         /zJCtzy523QspSbDkYXkGMVtIkWChDaLU7gmWd6F49yIjqEvxlPLASxooG3G75JST+0F
         DmxA8QbqZvMs1BTHYQGqHb39802t8YrchyGO07R305P5czsy5w0y6SuHJ3nKH7eVbYnX
         /dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W8EzkW79WfzCiH/wazv4LWH1GwIjbW/m0X8eDD3coi0=;
        b=s1DC4FWDxrM8vxnH1dETtBRFbi+o922kcVlMYycQyXrt6dHvbsH/6z1MSHE6bHQUdT
         hWlT+QycM7+50IO5FwCtaXOMSiTOrxoSNF+6FP9J0YK51AVjjFMDr8mCAzDEuSD4mOcw
         jbHQoew9GeimSGeV8tPthZM15BPsPY8//TMHP3PGvveVK3nSbDNeAwFqXJfCQGs4oIqv
         v6Ibg8BIVvBV9Mdt8XJhGoS1T5dROdiy3wor++gWrHnLuO/CKGYakCiBNHqvmAbuWxfH
         EfBBA4wnaPc7tB4D3xACjBETzWAVkxJaVyF/Y4lzXClqcwrhiiKTy8akbAHo5bSlJaM4
         pxvw==
X-Gm-Message-State: AOAM531M8WnmZdoCuW/DSiXf5c8b39dJC1FWMOZlVV0BjhZN3n1rPxaB
	dJtMMiF77nr0X8vBNKIAaOGpAzGO6flUkA==
X-Google-Smtp-Source: 
 ABdhPJyjxNJQQw86mlfenyB92oBcZwWvy/i7h5oHkmduaeCf0c9BBbdCJtI1zoPORfhp34c5Ymt72Q==
X-Received: by 2002:a17:903:110d:b0:14d:ca32:cae9 with SMTP id
 n13-20020a170903110d00b0014dca32cae9mr3822582plh.30.1645035433128;
        Wed, 16 Feb 2022 10:17:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 c13sm4490928pfi.177.2022.02.16.10.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 10:17:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] waf.bbclass: Use renamed BB_BASEHASH_IGNORE_VARS variable
Date: Wed, 16 Feb 2022 10:17:10 -0800
Message-Id: <20220216181710.2135579-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 18:17:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161782

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/waf.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index bc594d3c6b1..464564afa1d 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -39,7 +39,7 @@ def waflock_hash(d):
 # directory (e.g. if the source is coming from externalsrc and was previously
 # configured elsewhere).
 export WAFLOCK = ".lock-waf_oe_${@waflock_hash(d)}_build"
-BB_HASHBASE_WHITELIST += "WAFLOCK"
+BB_BASEHASH_IGNORE_VARS += "WAFLOCK"
 
 python waf_preconfigure() {
     import subprocess
-- 
2.35.1


