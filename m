Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633ADD597D2
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:48 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.3474.1731467799778933772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ltrmhRqG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c7edf2872so2348015ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467799; x=1732072599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpaiB6LK03zPHcNE/0DIz+ZIKNYrhCPnebwRFzzxcvg=;
        b=ltrmhRqGNWoCkLLlrT4zBxYA91YTUZixCQ3B670skYk4GD4AMAr52ToPQyIyxzaWXh
         hpsZh82WZizb78AS6YulwVvnTxEeprsrKVvWgIMG0Na0ERxJzafgLguWplUY6o41E+XN
         9401B4T0UZZLslCran6S5z0fbEP7Vab5GhCt0pXT/w400SNKK/eB0n4LKRHVREbvamC9
         3TojZFUx6RpDTD2W1GLugA1rGRmZJCyTBMyz/4NlshDVclNlfjXx3v0N7B8r+CGD8cB7
         zLBXFubnInz05rqku7LWwGTc2imWctSwq7Mz+5SmG4t45SoUVI4OCp3sn0HqJJwykggn
         egtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467799; x=1732072599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpaiB6LK03zPHcNE/0DIz+ZIKNYrhCPnebwRFzzxcvg=;
        b=voZHbBh1Bv2ajrFAD5+XC42v1ZgML8AM/9f9vKxPjeIiDfXW8nsLNuFdJzH1xoKAu1
         jPuY+5ymCLZhaqRyLZnL0KwasMdhsnFHS0jXomUGesM3GtOg8ERvbsqw8bIH+/yy9Z26
         gxa6xFmowBn0qsv4+oPLltybHuqCBtjzsdT0MP3nFqKMV+rojmKkQ9vIpm+kincyKrm+
         7Aplm6ZUiL2dUlz8S26t+5mL4oySLXgRyf/zgnK5R1jPOXzr092k9TmN6GUiqATINI5a
         eFLWuLj2xKo+2FTQUgwutyGOSLEuqEbI3KZhWZ5+IrlAavYvY0BsXZhTWYGjJq/qp9gk
         ggTg==
X-Gm-Message-State: AOJu0YxELuf+PCkOLYzmbA8xSK5FABG9/NuSvS0LTC7ous/eN7wLKzSS
	Mw3rx6xI7+w/q9biHil+H4RO3wUtmN0cYl+1R6h9vkL35WDxBU4hIAIZ3y+7eJQAT6HVQ3YbfdH
	x
X-Google-Smtp-Source: AGHT+IHjKKPutfOGlbLVaUURBc8Ih6PoSdqP24eD1ybjtcSA/oTu1Y4iTktCrxeuFLZmiH5I3ZqEhA==
X-Received: by 2002:a17:902:e807:b0:20a:fd4e:fef6 with SMTP id d9443c01a7336-2118217cb53mr288789005ad.8.1731467799027;
        Tue, 12 Nov 2024 19:16:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/19] pseudo: Update to pull in syncfs probe fix
Date: Tue, 12 Nov 2024 19:16:06 -0800
Message-Id: <40a013f7134aec1d0e953ad4906944072cfb2ca1.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207086

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in the changes:

Eilís 'pidge' Ní Fhlannagáin (1):
      subports: Add _GNU_SOURCE for syncfs probe

Richard Purdie (1):
      SECURITY.md: Add file

Wu Zhenyu (1):
      pseudo.1: Fix a typo

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 134d941609..067fb6b378 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "ec6151a2b057109b3f798f151a36690af582e166"
+SRCREV = "a8453eea4d902bbb0e01c786f1cb4a178c3bbee3"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.34.1


