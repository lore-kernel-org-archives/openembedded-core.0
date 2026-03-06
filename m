Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0824EF5141F
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64686.1772781786671266165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qA4Sbpwl;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4837584120eso67896225e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781785; x=1773386585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJRXiyYSHn9FUIfTtJzSZkEuZayUmgkWl7qLQjZfQMM=;
        b=qA4SbpwlD+0IgIp3R6jGzrGhCzDhzHR7HczHBoBga3jc6xVpRqlQrwjMgY70zs0Xrf
         IWGgdL62+0QY09q902+m2ZAzPDNF5SfjizbhBoFqHTx0j3ugtJ+7GkkXx9LN/wqNfuZo
         egKvUL7zHOp1raR6PX1Wmaymou9mDSrA9q6zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781785; x=1773386585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DJRXiyYSHn9FUIfTtJzSZkEuZayUmgkWl7qLQjZfQMM=;
        b=EVR4p8G8i4BFvmCyU5UmEZUOGFisl8rhdUKkcRqLmpz5m57zqYSRdIjzje8T8W/RMl
         QhbAJnjbqk8ng9DrWozB5Xqiwi0WqPRX1QBinaBgRJLo2oziGqCV728LE1oohIMP34wM
         srjOa8HSZaTn4bVs6rRRxnpHWKOj6tL+kfbWB5Om4rLOD6+hEQYK2ZLn2+mD0kOFiKmA
         62ZGhTzQMUFAYg+LAXgC6/Q1aHVTmh0nles006ud2lbxFeIpGStwt5kH8wIPDC6+Y5+P
         tnyUyTwhZ3AIMBbzUwQ8qQWRxWNzJjIIPZUNYcOxOk7GCU9D0piqIb4BJ3XXfSBAtRCp
         6B6g==
X-Gm-Message-State: AOJu0Yzd86Lertecj9AwvgZOtMdGNgc7pkn5uWra+7eiOsQMcuNn3E7p
	c/wit4hK9d1XY5EUL61ggRTwH2KfO7WXphs7AoK7f94E1SQ8hvFpyo1YnJVlSpYUHytVDGDXtd+
	ZBhlT
X-Gm-Gg: ATEYQzzIHVb/+MHlUVBGYEYg7NlnWV6OiUEKn4Aolv1Fq+8pLoLxhzqwhSRGPMSGVxI
	G1y/bVq3z7jVrpVn5dfgxHmhycyCERZOLQI/4hzgZ9d9zSljmcjvQO2TWr9WZaT+gyfs6I7+/yU
	NcRJtVvNMnGH392AyAGCysvLJMSfJmcezRzwwcpa3OVLNZOv+w2MSt/ZXc7ECqztlbVr97gGJwU
	koBlI8yKxANJj2YE7DnnBObNIJ/ZpE7kmO8ROH73+lAhYpWx3UZkGd9SwNnw2VeOJs3A8v8MpY4
	bgfuPReANlRxU3p8fxi1pl7ee5s7n2T3d1sPXqDKpbk0zj5WQ0gr7+J3Oh+U/JbbqpwkXH+WyZR
	HZ9oi1Ppu8qLhjn1V4Roaznjt/4PbwAhIJAwGeTSclsgc/B8VSbqR7UwKsbzPQoLGvmvSQbZSDO
	j66gnT+8w6Pjcn/MU4fFI2xK4xlUHvdJgruYfuLreee/X8nUL+SQnnCMWXGsDAnw9ENABslMijj
	/MbfKlN+9dbJ5tdS6seMYohnX46
X-Received: by 2002:a05:600c:1d01:b0:483:c269:c4d3 with SMTP id 5b1f17b1804b1-48526958baamr15838925e9.18.1772781784699;
        Thu, 05 Mar 2026 23:23:04 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:04 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 10/16] README: Add whinlatter subject-prefix to git-send-email suggestion
Date: Fri,  6 Mar 2026 08:22:10 +0100
Message-ID: <46724cf2319e1a1fba8215165c11fe3d7c9ac039.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232548

From: Yoann Congal <yoann.congal@smile.fr>

That might help new users send correct first stable patches.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.OE-Core.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 7187fb94be3..35a9866db7b 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -22,7 +22,7 @@ As a quick guide, patches should be sent to openembedded-core@lists.openembedded
 The git command to do that would be:
 
 ```
-git send-email -M -1 --to openembedded-core@lists.openembedded.org
+git send-email -M -1 --to openembedded-core@lists.openembedded.org --subject-prefix='whinlatter][PATCH'
 ```
 
 Mailing list:

