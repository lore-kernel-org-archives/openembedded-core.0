Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2374E7B604
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 12:38:31 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.17186.1696423107374004724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 05:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UjBJCtII;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32329d935d4so1997453f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696423105; x=1697027905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWpptas58mUPLx9oL9Ndi8IWcjxGj0g2YiSHyLza3sI=;
        b=UjBJCtIIW8ddRaoAfp4jRGYYf42MovgA6zU804Wshh0KYIWwHqLlXP2oJ+yF6UHGpw
         LRHg4/rDI5YEaQoiFvvOXOUqX56K8O42noX3UpvMxExU9C10wBcUhyxJNGQG//a2ZY2L
         2y4wFSZhqCgcybJnEv438LEPUv0ycaRGPhvgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696423105; x=1697027905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWpptas58mUPLx9oL9Ndi8IWcjxGj0g2YiSHyLza3sI=;
        b=nL+cwG9/QBM+jF9G5606oGGINfUiu2dYMtsKJbrhL7WKNT8qlfIldk1SzKkrpWV87i
         rAbt9mf4IDh6aMIisR/zoypYJ//akcUqfJDIqjhecsvi4csmBhDBmFXNBXByIRjhI7MW
         cefi1nuKJZfgJBv/SfI5h0nliPy4dBSnRPU6lDyji98LhtZX568Rsvb5k4t0h8Fh/JYe
         1pZgNZnkmz7wTtN3Ps1DlUX9an0d0l6hqPtep1ZK58B8RQuXpczKNMG/1BbnTCtXevJF
         E/npuxelrDhW6Tz4c1Hr+lg4pw4ElCkQsRjJwAEpjCItiGsGRp7aW56IaPPoJB1Qf3hg
         v01g==
X-Gm-Message-State: AOJu0YwfVqzJoSEHuiu/dKHEcBPW7qDYh9x+RhwbSqIxiWKHXX389lHX
	BOI52IIuxeHRGBbYq+mpvaLmoe3Qa/K1g/UlIKY=
X-Google-Smtp-Source: AGHT+IG4Etd9KVDutQm/vv7BgS010YNKyJr1a1xa1xs/7gRYDxNCRAZ3A3IXoiyRW0Ck1Npsb0Rcmw==
X-Received: by 2002:a5d:45c9:0:b0:31a:e376:6bd6 with SMTP id b9-20020a5d45c9000000b0031ae3766bd6mr1902653wrs.45.1696423105373;
        Wed, 04 Oct 2023 05:38:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cc7c:410f:894f:7a55])
        by smtp.gmail.com with ESMTPSA id da4-20020a056000196400b003279518f51dsm3974617wrb.2.2023.10.04.05.38.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:38:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] wic: Add console parameters to qemux86 canned-wks
Date: Wed,  4 Oct 2023 13:38:19 +0100
Message-Id: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188675

Currently our wic test images boot up without kernel output on the consoles
which means we have no way to debug if anything goes wrong. Add the console
parameters runqemu would have added if the kernel wasn't built into an image
to improve our chances of debugging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/canned-wks/qemux86-directdisk.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
index 22b45217f1c..808997611a4 100644
--- a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
+++ b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
@@ -4,5 +4,5 @@
 
 include common.wks.inc
 
-bootloader  --timeout=0  --append="rw oprofile.timer=1 rootfstype=ext4 "
+bootloader  --timeout=0  --append="rw oprofile.timer=1 rootfstype=ext4 console=tty console=ttyS0 "
 
-- 
2.39.2


