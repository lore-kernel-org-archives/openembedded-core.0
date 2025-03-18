Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCA6C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 07:57:23 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.6407.1742284633484025540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 00:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iMMGM4Us;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-301302a328bso5263177a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 00:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1742284632; x=1742889432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RPQ51QX0EYmm1uikUQvypNGj8guvr/sSJh/q9tG32Fg=;
        b=iMMGM4UsT9rK/TtMe0pIfM+L8/RWc69O2AQHdQHglByvf0hM89ftVochvTot8+9q4M
         EPqKY6PisKN+FrsJcX8xITARTU1Yo0e8WBiOza7IMIan0EHlJo72JYmnem4jRZDIRQPS
         VbAyDf5XBgvlEJ+IS35dVbqtpLCQD1a44xMUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742284632; x=1742889432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPQ51QX0EYmm1uikUQvypNGj8guvr/sSJh/q9tG32Fg=;
        b=g3q99VZivxTuGikbnlR2NhjnqQgmK96VFOP7OA/TJe2KOLQnP0WtM/aKXUdfped6M7
         csMrGFVrYMRaVxhx425s3/HhSeMHbBNBqc7FelYMpYprwTcFxXbDIHZ8XuIAAHb6Kd7j
         Lt7N0fDVpRHXC9RGkhscPl5t3Niib37JxMyGfURJkGie6EfH/+qUf9kTEcAzW2qicgfd
         /Zz69AT4tqSmLAHdzrlyptvqUg6+pGgkANMDKnBKYzUPhYoZIJynW2IBUhUfOjTcsISh
         PHwIi8NKL7BPrTwLrJTfjRnTI0Emw5F8b6G+Zkzw9UKGuF454yH48I+om0/EwDMQA0f+
         oeqw==
X-Gm-Message-State: AOJu0Yw5vyfTbC96nSUSb7ZJE3vd+6Th/mbH0+HgkuiaJZU9j2NMEgio
	z5oDK/U4TqD6v6B6ECBYi5s7+HJMZazpTcrPhg5Iw3OEz5n3Z3L625ICeogDfg/OGtrEjaXjUYD
	UOCQ=
X-Gm-Gg: ASbGncsmZNhkxPt0qzsZ4Mq+9c15dO44eyfD1AFlRTIj0jEASDsm95DGt+DixlC03ap
	cqJ91IRFWmU0V9TNRryKe9D9nPFFzIKWW+HtZ4ZiEGAp5rsf5LcOyiClI4/z3uSSkAjI+eXNUEv
	8QidvwuduG9pmy2fUAIi2ofRLHP5xHBuEfVfKavmEAUBKnLPgHQtLzAci2yk8j8y7ZkioTn+xp/
	WuYFkm2AKcK5Km3Dq7v5XnOYB086nPxV2SfqzUht0AM180fo1+P0t09cB7VpP0iTI/v4FbZm269
	75jUxbK/bEuJab8iA+ZNI7HULCKKHpgyX9jHHSDZ6A5ftIsAHm9NRao=
X-Google-Smtp-Source: AGHT+IGiXrkgrvsSc/SEGb33pBWyOqIN3BF0YWQiNVjh9H8VAMxLazm6ZV2SVPwuIumMwzkRSgu/EQ==
X-Received: by 2002:a17:90b:180f:b0:2ee:aed6:9ec2 with SMTP id 98e67ed59e1d1-301a5b197b9mr2253448a91.14.1742284632524;
        Tue, 18 Mar 2025 00:57:12 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.233.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301533e6515sm7442998a91.0.2025.03.18.00.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:57:11 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][PATCH] vim: Upgrade 9.1.1115 -> 9.1.1198
Date: Tue, 18 Mar 2025 13:26:56 +0530
Message-Id: <20250318075656.16520-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 07:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213185

From: Vijay Anusuri <vanusuri@mvista.com>

This includes CVE-fix for CVE-2025-27423 and CVE-2025-29768

Changes between 9.1.1115 -> 9.1.1198
====================================
https://github.com/vim/vim/compare/v9.1.1115...v9.1.1198

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 229770ba9f..b39cfadaad 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1115"
-SRCREV = "c0f0e2380e5954f4a52a131bf6b8499838ad1dae"
+PV .= ".1198"
+SRCREV = "f209dcd3defb95bae21b2740910e6aa7bb940531"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.25.1


