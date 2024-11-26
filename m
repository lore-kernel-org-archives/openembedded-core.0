Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1533AD66B84
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 23:15:06 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.60334.1732662905624725297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 15:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CnzweFkQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2969ae2c99fso3378492fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 15:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732662904; x=1733267704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5XDcvhPpa+E6OVe5jWQhPPV5UhAQmRjwTslcMsni0cA=;
        b=CnzweFkQgfpeYwgnd+t5roE4v63ttO18VZ3yspj17+yp7OxYWefvyUzG+RafTolpBD
         FaJ/WetE9sSsclpxuvTlZGZD1OO2xJEchOd7BEjLK0rgHJkKitqjRemcfOdKOj5HrxtP
         Nd7RzIS9qvktYV0Ao0OqAmsGO4woacKLgEjVzenUKwnW3S494NIjYKaELP02ZK7E3eS9
         vE7J6rm5jRFb006SmgszVYqEBfz7mksBOqa+J0tX59Aoi8Vx6wba2q0k+jgSrH652WzI
         BdLT8WuTjjZiUZ7qrtucEs7VtPBUpo+J7AZpztArSTf4OQFpuxVHZGmbQsko80TRlihI
         rMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732662904; x=1733267704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XDcvhPpa+E6OVe5jWQhPPV5UhAQmRjwTslcMsni0cA=;
        b=M9ihB0RExIUmWPuao1pYjlmplPtvDx11o34t00hybwDeQ/rFTr5i/YVZX5gBnka5cZ
         JUxcR6E4nkOZJIBT4ZDoCch6bJVtH4NEk7x1Za/yjjWFfbRcI5vooJqJPi4KnDx/Zc6m
         vBRhG3A9wQCgW+BLDgwjw1G12CwMSZK/2Smdx4Jai3NFDUAwlhxAQvRUeEXecGoHc/kz
         Dzxofn00PmcQO2/5RJyEyXyl9hCzxNsgtmt49tc6w1fhT0QAhnoacGO3BQCAdqEJRBnw
         Ga/G1Hoc5qzAAx1n0h4cQ2yPRdy15k6zxaOCmMDQOxdTb8720UvdHPtveDIe6l75Bq6L
         zU9A==
X-Gm-Message-State: AOJu0YzyOBA40f2gdI/jfCwvegnu2PejRYAKKdmm3rf1nqxcKCHcWcia
	ZI2X/0S24MV67fK6GevJhneWX0rbfSAgBzQRDIDZQUolFHE3Jb7kAQoWWg==
X-Gm-Gg: ASbGncvJS52r50e78AftRhtYV1YrwxpzvrsmX55ZpJ0MlsbNaGVvrt5TVlK9xBhMOB/
	61+MYe4Jgo4/jrVJibk9Q/VDo+2X0GKFwNyeQhqva1h/9OQeDzoZqzG4E1BjkIXsRPNRiM17rgP
	n3G83ZkNWUKzTAewRnZrsRSMOR41E60hnuDUBoAVZhYOjgdR3mGHSmQJYP0b6T2mnjhQdUmo732
	1FmAk6OAqxca4uSIAvr9dt3Oe/6yeaJQOv8ZT3FGUeKCBaf
X-Google-Smtp-Source: AGHT+IG8NUW1STw486UIg1I2EQuLUsTHc8FvZ4w2TFTgNGCPKTaRBh6SZOOupNHE3EJZ9IzerSTnrA==
X-Received: by 2002:a05:6870:3329:b0:296:ee2e:a23c with SMTP id 586e51a60fabf-29dc3f9684dmr894624fac.5.1732662903825;
        Tue, 26 Nov 2024 15:15:03 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2971d67c79csm4368549fac.31.2024.11.26.15.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 15:15:02 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: oe: license: Add missing import
Date: Tue, 26 Nov 2024 16:14:58 -0700
Message-ID: <20241126231458.2858039-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 23:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207888

The code in this file uses oe.qa, but it was not imported resulting an
an exception when a license error was detected

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/license.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 32c77fa204d..6f882c3812c 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -7,6 +7,7 @@
 
 import ast
 import re
+import oe.qa
 from fnmatch import fnmatchcase as fnmatch
 
 def license_ok(license, dont_want_licenses):
-- 
2.47.1


