Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02320C44501
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:33 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1259.1783747471942482113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Qy0BGUzr;
 spf=pass (domain: underview.tech, ip: 74.125.224.43, mailfrom: vince@underview.tech)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6676fc59e59so2313994d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747471; x=1784352271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWjy1ifXkTyeo5UkVT8d/PhLZ4dF1PSbNR8OKlCEaJI=;
        b=Qy0BGUzrqXQq/azPyixrmYi5LP3nU2eCuN785/EaTjuUMzMaBBFb9NmNd4MJRS+fXW
         3pIkhseLBJ8LyCMQ1y+ITMizGOtAgUzXZbVgymeYb/LtTBr/C4f0AlDi5CVzNLCmybJI
         sHyBEw8zvDvCKwOhbt1v6BwyKVC02p5cj33dqYQDCEIraWhZCCCcnOsc+6tlAF0O2VEn
         zxTgOyhz/izoY8wnKUdGfAHAxJrS6wU1Y0h7Fekk9THB8TktxAW3XCQCtcmhtp58oysH
         KJVqQfTdws5bvo0EdLxDiumi6xHoX311z8DFJbYscK9Nh/5MHXGDJyqaXrkCzqVP22Jn
         LA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747471; x=1784352271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWjy1ifXkTyeo5UkVT8d/PhLZ4dF1PSbNR8OKlCEaJI=;
        b=S/zLFwVJjCuNHA9L9TzpE+aNmjrkBy1YzXiB3s1r9kvwYmvG3QIdfHU6zQVwgJnN8j
         ErroVe6Pjat2MBmm7jWcxH+a23b/fta5CHR1ZwDzGEnRW/+rINTn9eTKqQXfKdx/SbWN
         Al4V76dMBiGPsNiLC0XKs9laTL3nqnUquDxyi6iLC4MztET02x/ulz86JCl2lv6ilsO9
         zyV98Zu+XZVjNRz4McpDe384HkFw4h/i7DDGTR/Km3rdoLPvvqnJlxvkEh+KJzixQzye
         tqUyu2QfJVqyp3rctOLHLnSN9skSrnz8paOnvn6eGK19gJP+8ElH/MZluasG92SbQ6Aq
         v0iA==
X-Gm-Message-State: AOJu0YzrlJWkPWrR+6KFns++opoXy2euZcXR5fA/z3FcPVlhUiYs9nkr
	+BpPHzvKudJ5VariKbiHwzVxZoy8il/cmVfXiOohB2hMCdhML3JWhlkglOXEVn0pY8zWmTCSWt/
	GuCCSQr4=
X-Gm-Gg: AfdE7clifQLVztX+o5B3sM15bdAy0YBQk41t8Ps87eW8mVgVggk+aO9N5i+lOVzRO2D
	T9zdJRpHdyhkP0a7ZWIMZ+jUAu8OE/gvr8iaauukeSH4NShZuMTyYhcU0tO4Uh7+4Ygy5HYP5Gr
	9j1GH2fzytpD0UDbsbhFYDphh8QYjj6YLph63SfNhQtSlNWkHIxgp7SHF56vUMdZPwtsp6dFW4c
	MZ3Sl2qUhy/ZR6/JYRa83nFl5KVvWCPcbDywlB8U/wE5mvQY/uGdQx5NqSqgkgOMvaz8VTOVr2Y
	9FxrmJ3bM5YQwcKalZd0ePhtLSRi5C1DWJ1XvSwhImcK1Pkt82De4spk/Y6uTtXw7MSammhwvKu
	ARv80MzV4M4Bx9viUUvfVS1P1Q68/5E0xokKqa31LGOJHUTOYIgS1ZikdDYITDBuFJRHnucPPbU
	GBev5YHl6hsoLV1H6deRZp2Vbm
X-Received: by 2002:a53:e7c8:0:b0:667:8c87:25e8 with SMTP id 956f58d0204a3-667d7c43e9amr852803d50.91.1783747465150;
        Fri, 10 Jul 2026 22:24:25 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:24 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 02/19] kernel: introduce kernel-vars class
Date: Sat, 11 Jul 2026 01:23:46 -0400
Message-ID: <20260711052403.1292286-2-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240683

The kernel-vars class allows the caller
the opportunity change KERNEL_PACKAGE_NAME
and use value globally.

The kernel-vars class is largely for yocto
project recipes that are still using the
default KERNEL_PACKAGE_NAME prefix.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/classes-recipe/kernel.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 48e394b650..d28b3007f0 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit linux-kernel-base kernel-module-split features_check
+inherit linux-kernel-base kernel-module-split kernel-vars features_check
 
 COMPATIBLE_HOST = ".*-linux"
 
@@ -12,7 +12,6 @@ COMPATIBLE_HOST = ".*-linux"
 REQUIRED_TUNE_FEATURES:riscv32 = "rv 32 i m a zicsr zifencei"
 REQUIRED_TUNE_FEATURES:riscv64 = "rv 64 i m a zicsr zifencei"
 
-KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "virtual/kernel"
-- 
2.43.0


