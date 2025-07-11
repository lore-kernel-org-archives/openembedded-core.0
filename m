Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F17C83F21
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 21:39:11 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.24966.1752269947995645498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CDs5x5Gk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a582e09144so1699637f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 14:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752269946; x=1752874746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+V/PO2Lua8IRuhKaSvbgC8mdx2j4SesJBWBH1IOxiDU=;
        b=CDs5x5GkSCWtN+FxUyh5Xmxm0BwvY74uTtlpvyLPKYLzafq4NGxlrRYtIfBFnM7GGC
         EYaipHSW/a3akstNoPNqlG+671+UZ4ZIkLyw/2RMaW0AdaviPfg7KADBjOZ1wVKq5jbk
         CWRQWhKEoKGkUQOwxDgPkJTQPPpX55n6KFu6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752269946; x=1752874746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+V/PO2Lua8IRuhKaSvbgC8mdx2j4SesJBWBH1IOxiDU=;
        b=tRxKQ61UYnM4ywvddAYye0v8yQ1Obm57LNfE+mjV4F1uWstfe8hPFS+MWMb8wMQXeB
         nJ2k5vF1VGOwUmdF1NL6Ua8RcEY1mhymJhAFqrGNfS6+BbG5NWrDMC+odEi7imGxsROB
         ejetYRvjEGAw3WL2eSYrERy6+D/2Hh/zNi1JDwl0C/+4bDh5J+haraul8gmVodmJ95HC
         FoU5VWt662LVfScO4H1JP3K67IrDgiRZsJbLFXIT1CDKGi/DWHqQW/dNGXhvsQn7pL9t
         2yjltr+fpYrXf/luASTG+57iX4PSmeIedNN2CG+m72ly5h3spBs95tHvFB7b39f8SRgk
         0mOA==
X-Gm-Message-State: AOJu0YwNCATM+CDex+dwYWST0+eAS+ATFX3+tIMGRuwozGTomAMD195M
	uD7g2KN/v6TR8Vd/KYbA3OAKwKfSmldZ0x/Qy9UXKCO4w1w0h2NeFSDzav9U0eI+r0aFwFw3dCl
	uOVH1
X-Gm-Gg: ASbGncui8/aV5FUQ+iQfft982m0xZqQG+kJ3GLDNdGbLgArD3GpcH4Ynq+sALfu3zb0
	8KISX/fFX2fhqji1PaXv0s3BwX3z/NErqmuj6206kPAMg6qC3jh3aXGptUjRzOZpPMPhKZW/11n
	7EnxM9cMQmWJ35CYjFh1r3v5yAs6Crx47xbDYgx0RdfkHOAvSzsChFRQImrpE4UXmWHcYv20sq1
	gIdYsWc2aWPocYpCWjdi6lx1ZzmAnbYQMqGQ8vQM3d6iNovAX1zvrLdcrXq/QirA5nBKY0IJu1+
	uhWhONAOUUmPYHSTiQPOiaDK20mxf5SOIRHdj4MlXLziYtzYvg9yEfdZ1pskcdl3SJMamy5oekW
	Bt25+HfkTGpkZjAzgD6K/Ph9YZ3sTfB1ZjtggrPv/+PEGZExxOg==
X-Google-Smtp-Source: AGHT+IEy94Oakvg12dfJclWfOoGW7e11auDjd4uVbRUoR7nsaCdsRRWE6lo4GwY3K7SYFclelFkVCQ==
X-Received: by 2002:a05:6000:2085:b0:3a4:f900:21c4 with SMTP id ffacd0b85a97d-3b5f2dd4e12mr3939661f8f.26.1752269945744;
        Fri, 11 Jul 2025 14:39:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:785e:212:efbb:e6e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e2cfsm5444426f8f.75.2025.07.11.14.39.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 14:39:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to pull in mem allocation fix and riscv tweak
Date: Fri, 11 Jul 2025 22:39:01 +0100
Message-ID: <20250711213901.1011148-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 21:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220170

Update to include two fixes upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ae89d4d8e32..e10abd126bf 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "b4645cb30573c5b3d5e94b9d50e1e2f8beefe9be"
-PV = "1.9.2"
+SRCREV = "d1db9c219abf92f15303486a409292237f1fc790"
+PV = "1.9.2+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

