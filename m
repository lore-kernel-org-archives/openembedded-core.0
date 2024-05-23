Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E85C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 18:19:10 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.1078.1716488343282091020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 11:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ljimwsvI;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-24c9fb22c09so38156fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 11:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716488342; x=1717093142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6ORSu2QnmsYZYDczocKE9jLtZkNLGZGl2FmoG8O8IQ=;
        b=ljimwsvIygt7zB4JB0dqe4ILTERvFM/RPZ4RGaiwhWY+8ighZl68/fGStjBbqpnU8Z
         jX4e0vg2tDU6GQRjxrzvNyAiAiQrFSnvPkClsxLINe+JKsXR4h0wUQJSjDFFUNOc9bHP
         xu+ebRaE1cvrPrua3TxRv/kxBxg8+EjEOQdD+hw/I1rvwyyvELJA5ZbuWGtm4cyNHkMi
         Wxoehuh1/GXfx2aa3GEFuSLx8G0JWhSaJH9fViKHtiWjUG7aER+048TMayHNrpO6EF3s
         M+aSn8moz4GfU9loYRkeO40PGy2+FrhrSZ7e2hB2AUF9Cpyel7w7LnDZOK7RYYOP9pBO
         vjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716488342; x=1717093142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6ORSu2QnmsYZYDczocKE9jLtZkNLGZGl2FmoG8O8IQ=;
        b=Kjwddulkrg+DiIxwpzpQTPpwmLSqmAu/gVsrkfgkPd/nxxH5D+DGiPjxTyRx3T5ygR
         m9EWA2VsxWWHhj5sDanpBtMa4TrV0sJUcvZMuWoq4rBm+UnNeZKMRN8b/Xd7scMwnQAI
         pN6BdIacQokSFmAPk0iQzy7mylxgatXkpPW70yYAx5L2icv3z4KalKvuUpCB1bxmKH3Z
         4wqRUOiMgjyP9NwcQA3w4fshlFX+ZBWafM/aW4T3Gpm/MBQ1Mfv+Ze7QXDKAT2s9wfZf
         tWGBkXXLwMKfcxacrL/H0skdyrGcCPvBwiu29dm0RLFixeeDaf0Cy8j2fpU0ycV7L84n
         Aaog==
X-Gm-Message-State: AOJu0YzQkqBBbA1q1uNulr8HPYr3dUptHOTR+h3clw7OmPF4YivGzpn5
	9OeV9JjLGf8NJXunYMP9TLN4WgUAFyDOUixyXjtSfeiZ2HKfdeZdyOg7jw==
X-Google-Smtp-Source: AGHT+IEmMpJ1Iju0VK/YlrT+/YKovJMA+Cl1DMMlpWR2n9g90+Dmu0v5CCAxXz7wRk41mppvZH7SWA==
X-Received: by 2002:a05:6870:1492:b0:23f:a83b:29c with SMTP id 586e51a60fabf-24ca11dca1bmr51587fac.11.1716488341914;
        Thu, 23 May 2024 11:19:01 -0700 (PDT)
Received: from localhost.localdomain ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0fc46b829sm4672209a34.49.2024.05.23.11.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 11:19:01 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] packagedata: Include package name in extended data
Date: Thu, 23 May 2024 12:18:58 -0600
Message-ID: <20240523181858.2253063-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 18:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199814

Include the PKG name of the package in the extended data

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/packagedata.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 2d1d6ddeb75..6e7cfb56beb 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -276,7 +276,8 @@ fi
             d.setVar('PKG:%s' % pkg, pkg)
 
         extended_data = {
-            "files_info": {}
+            "name": pkgval,
+            "files_info": {},
         }
 
         pkgdestpkg = os.path.join(pkgdest, pkg)
-- 
2.43.2


