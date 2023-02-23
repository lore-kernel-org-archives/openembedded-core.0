Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C232C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 19:26:58 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.282.1677180410878749391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 11:26:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HSZhnElG;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id q11so14593817plx.5
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 11:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2DW3k3MtgAd4PVa301d+OujWvhTKBj4Mo/BHWjIQhrg=;
        b=HSZhnElGXXkwuISST3JgQHOZf9/x7EoRJ6JuGAaXo8g8FuOZj1t/Y0ozyKCIbIc1TJ
         u/QxoWRp3+G9jaMqru7mJbg/uAImnsZJsUJ+eSd6p14TK87Ouagmk/yvW2no/o9nSTWV
         1u7zVVzRdn52p/6GzXP+SbHos7wAcxT0ywlE9ybagbOnWm6ZYOBnitIGH/KgaBRgPNFX
         k2DHR1jDmymrrM1OFFk+RjBf1NjeAuZ2kNZtV+oWhAn2QQHABtQguQnDpRPfLFNRRMIg
         yBGziDdDAWPxwCWubBpA9bj3gLbPSTaQLBJC/sifvyv4BXp/kgIsWf0HqQgckG0DSEd8
         Fjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DW3k3MtgAd4PVa301d+OujWvhTKBj4Mo/BHWjIQhrg=;
        b=BdTftJ4WRqqMfCj0RuEXxOxPReiR07IYD9VBKlg/3RSMYA8lK+J2daXjk3e+ptCQU+
         VcQ05UY5Euz7Fhp4LTqKrF0Vlw3qz4QLv00KIgRgWItZ/9ix3b23vNztiCd3NlC9RIys
         x2JsVXYqCrxJvGITERrchRXRUwM2Jw0DqOX0ei6Tx0SS1Y8JgVmtKngiK9Q5M3xb+A7o
         11SBrrggDx62ao7Nc/+MndsdjmZFzXXZ1xowa73Ewwfy/P6MXssrs1BVEEpK76T56M0u
         E73J53cK2KubXVu0oIVKtc6BueBUz3KDTwxQWyge6lVN8HiuvAceWTrMAePIdJ1Uwu/o
         sWlg==
X-Gm-Message-State: AO0yUKWsViBNUqbhDJ+ylt9SLEWx31YuxYm8V51/UNLdL9t1XXt1G/Kj
	TGhlgazIDGpQAFoRfMBTVzZFoPtscZE=
X-Google-Smtp-Source: AK7set8rQpEiWaPKB5cR80PiVR9pMUiEssd/Xx/w64RB2AtTVgYOzo6l13wi0MWZ+yAhID8BCh7lgA==
X-Received: by 2002:a17:90b:3a8d:b0:234:6c1a:8dbe with SMTP id om13-20020a17090b3a8d00b002346c1a8dbemr12020330pjb.3.1677180409785;
        Thu, 23 Feb 2023 11:26:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902e8c300b0019a96d3b456sm7962947plg.44.2023.02.23.11.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 11:26:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tune-riscv.inc: Add riscv64nc to available tunes list
Date: Thu, 23 Feb 2023 11:26:47 -0800
Message-Id: <20230223192647.3304041-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 19:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177624

This was missed when riscv64nc was added

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 659801496c..804712077e 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -10,7 +10,7 @@ TUNEVALID[riscv64nc] = "Enable 64-bit RISC-V optimizations without compressed in
 
 TUNEVALID[bigendian] = "Big endian mode"
 
-AVAILTUNES += "riscv64 riscv32 riscv64nf riscv32nf"
+AVAILTUNES += "riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
 
 # Default
 TUNE_FEATURES:tune-riscv64 = "riscv64"
-- 
2.39.2


