Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52397E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:21 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.20315.1734012493427049553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AKtZxWZ3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166f1e589cso6824335ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012493; x=1734617293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=daUEo/BCDDyuQEokHe9a0vehL004fuj+4bkCskERF20=;
        b=AKtZxWZ3klDUue3oDKdjFIBjp3XAIqmd5hjcdm3QFKRDssmb3HpwzDrWCOY22Pm9ZO
         IYrSyAS+JHf7dL+3y/ez0p8WLb1ygNvbVaOiAm/MpVjPPUwM8VXSZcxD//36l6shgwgv
         sjM40O1HmTShFIFbcF5xaxIRSygyXa6wFFYGIK9Tq3keMDGfUrhtOVplX2154Od9+VGR
         B+7J7gHfF/+knhzt1pbPGXTVslnh41EwD+9Lx1PdRzLpDwjqASrQtq5NSuBB4sr77t73
         b9XPi63mZAqrknoxFN32GyHr0UvJkeE2EDie7T1732kqjeGYqljLrvM+5e3fHsmvPYIV
         ZF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012493; x=1734617293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daUEo/BCDDyuQEokHe9a0vehL004fuj+4bkCskERF20=;
        b=E2bTqxaXnClZpbkdpdiKN3DkjhoS4HvOifTm+feHsL9VsuzNPWLoyj1nHOJCqwOupz
         PiTycYWs0v90T6Q7zQYbE+tJZOKuFiQZhcuMOtbyQw+WRooB2Dp0LRuP0vGzDKkd+7oO
         os5/1x2OD9wKHi1RSZ04LSaOzKjjzk3/whY+LYwWs1NHlz2BmAqxiCZTNTCGkvQ+u5xD
         s+GMK/9sPbvs2BH1lF31MilijvmZUkSI7flpnZg4KYvUoXTtij1GH0bbVQp4pDwkfX0A
         jIu/UlY9BKxTY6BP/qL/Of3mAYWotTSEr+mDiDsnJPsK7H3cEdraym8Z9FqpJRfVUqlQ
         HfTA==
X-Gm-Message-State: AOJu0Yy+0WlfRDPbue8ZU71c6D/ldzx1rnIPM/IFFd7PKSjiIVrmpK9E
	e2OoPLwqa1fD78F7foiI3HLiruQv+NiO4trbdYkLWp3lPHwgNr5XP/XtXwKSHj/G7BIS3vjLebB
	l
X-Gm-Gg: ASbGncvn957p77aVQXT+lDsKjSMShLyq5srr0sOdvOTqXxxp6qN+zMVdBivj6AZwvVZ
	GOXjuj5j+1cjyyZTc1H0VALOafc/lPI22P0JZa2avdREI92ABA1coOJFIIQjJWg6wIT6EsAD0Gy
	CclcKbuC+XxJGsxC3YwLopCJOWanykOLHJt5ciVeycR2/1JCUryP7jgR3H93C6O8qh0dxdvzTVV
	j60ASg4x/AOQV517Nq7qQQHniqsPRqPDUD5yezpLAYvFA==
X-Google-Smtp-Source: AGHT+IEBWD/mHm7wYSCX0lUdNkKAeBYQFIuWVeyBAgEOXW8wUjjOQ3dt1tN4K61Eq5F0RFrvyFUFEg==
X-Received: by 2002:a17:902:cf11:b0:216:4cc0:aa4e with SMTP id d9443c01a7336-21778998ca6mr111491955ad.47.1734012492590;
        Thu, 12 Dec 2024 06:08:12 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 05/12] rust: ignore CVE-2024-43402
Date: Thu, 12 Dec 2024 06:07:51 -0800
Message-Id: <10abc451f37be9d7d6b9482dbd5666a2bf8e9736.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208639

From: Peter Marko <peter.marko@siemens.com>

This CVE was created because fix for CVE-2024-24576 was incomplete.
Ignore the new CVE in the same way as the old one.

See https://nvd.nist.gov/vuln/detail/CVE-2024-43402

(From OE-Core rev: 6ed9968bf3e35aca316227ee23294c683f77055d)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index becaf2b8ac..929a4a9b0c 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -18,3 +18,4 @@ UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-metho
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
 CVE_STATUS[CVE-2024-24576] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2024-43402] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.34.1


