Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E0CC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 19:18:57 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.2630.1744744730328169284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 12:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F2azkNGX;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6feab7c5f96so56738467b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744744729; x=1745349529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tN3F2pydjSaR1rGDt0zPyaUtbI3+r8gbubeEXQPU5OM=;
        b=F2azkNGXhCb3MsG1+YVTufcmulHAZuO33E8IxbhyzckAasXDA8JWZMOMHASqvfdQex
         Y0HXOU4sIdR9nfstnQO06Z8OcSI7bXXKswPRqc9BT+IT3cw9Fam6mBWRYuVFj4VfvSzT
         nXwiIUMoCl9Viq8K8n5HYt8Js9yMI/4wMfMJnItOOzXNqxswOrUxyRlMWMumOjkD9aDE
         ++Le/tSMx2104PI1fu8TaENFmAlEpL6PNdkzmGExvRtWh4s6Jh+Vezas5/lZ6tM1IWbG
         L/HXtl7aT0LTAH3qJSV40IU6eKtF3pyENIKR1dQaDtrPyCzeZIZFSAeI64vfSbjfxAl2
         BdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744729; x=1745349529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tN3F2pydjSaR1rGDt0zPyaUtbI3+r8gbubeEXQPU5OM=;
        b=O/zY040tSTAzcQwAo68ycO8TQ3qhKGSx1wSNXLXsn8nhMCMu4MBs+LZdvHw6AwGbTn
         pCDRr3AJ0X9kzHnoBY1ZHejfMB/JUiifsxgKDZAS6d+GeL8IttcoT4GgF6hijl512pAr
         +xoQeqXCMxwovW0UtrB4I10EdwvXDvrav/8y1d9t+JdXQu/LvRorZGxqknMS9+yx5xu8
         tL6m2WzQRfWky3SEZVfL1ZcZDxMfhXSnQiKHvotFqo+4ikSqJD6Bks5vIuzRoX+WuGRC
         fsAvYkgj1UQdQSoT1KPxILoVm59k2WYEjzMpWm9F1ocIqAY2sjzPnNFu776P79PrYI1M
         ks/Q==
X-Gm-Message-State: AOJu0YxGEJPjBhNHjv2BbJ1z3eqVUbw+SZwOOcV1U5+95cCOopKFkJnC
	wrgvUQfWnPfbZMWdohWlr8hmcoDY9nd6Nam+bxiSODwLoTuHgRKKBCqKa/Az
X-Gm-Gg: ASbGncv0U/ndffmbV/tBT1f5gLqo1qEXMcay8OjqmUx3MMzAD19aif7tcoRMGrVav+2
	xpC/MR5AqMVk9124EWqpljpB6kC+b6gC9A8l4elyZ59FC/gqyVsi8w1mXquhwSzyet1REX+I+xL
	DpEcjH5PR7sfhIrasAZuVR0z6e0zWDttvoPS6vrfwzX5zPI4qIIzFH+8nKj1eLImzx8pOQ+UtHV
	ATKMmgtajG5vp+Ln6VmhPf1CFHDCYKQ1uLlEDQaFLMnDADUf7A2H+L1hLh3pbhwVKIRXYQX30J/
	2JXMNyooIhMxFYCyfABT8y/r0IBcMK2WJsw0cE7bz2xq1w==
X-Google-Smtp-Source: AGHT+IHZT6/jaYeNNU7x5ejWVWUx/BAVgfJ424NedvEWw1Vbt9TtBjwurOoNmqeAcbccnwaReIQLRw==
X-Received: by 2002:a05:690c:4907:b0:6d4:4a0c:fcf0 with SMTP id 00721157ae682-706acede1aemr8113517b3.20.1744744728943;
        Tue, 15 Apr 2025 12:18:48 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e39d38csm37909077b3.116.2025.04.15.12.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:18:48 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH 1/2] perlcross: 1.6.1 -> 1.6.2
Date: Tue, 15 Apr 2025 15:18:08 -0400
Message-ID: <20250415191809.1332553-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 19:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214963

https://github.com/arsv/perl-cross/releases/tag/1.6.2

Provide support for Perl 5.40.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../perl-cross/{perlcross_1.6.1.bb => perlcross_1.6.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.1.bb => perlcross_1.6.2.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.1.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.1.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
index 21964a7336..42ba15a572 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.1.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "b5f4b4457bbd7be37adac8ee423beedbcdba8963a85f79770f5e701dabc5550f"
+SRC_URI[perl-cross.sha256sum] = "131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.43.0


