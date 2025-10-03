Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4729BCAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 14:37:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.9242.1759502243327035604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 07:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GOdlsR/c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso17082045e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 07:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759502241; x=1760107041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxRLx8H6OxsQp5oJQNTs7LXOCMy3Nr8m5R2NvStvI6w=;
        b=GOdlsR/cXHL+XSOe2zB2dq5fxZVSYLY4Ka0ZIQ8lsVJMy68Dkvh9pmZUECTG+lja82
         mcRbisVAKXMY5wG2JELFY7dNX1M8t6nHZmNPh4TJtzY4gtkuUgYd8Uz9vP4eDg+2EPni
         HoZQDur/pMvJHqaO/KnLP4kB8t7rOJnVi8a6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759502241; x=1760107041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxRLx8H6OxsQp5oJQNTs7LXOCMy3Nr8m5R2NvStvI6w=;
        b=WzFmvptB/EJGMYZib1LkJ7y7dyDhT5yBUAERZb+e0kRIa/ahiBm1gqXOjRbkQMU5M4
         /iGtzUsdAUCDf/zbmEgqOcToqx+Uh7pB6bigTykHw1pTcTnDuPrY9bWhdHNo/q2OZ0BY
         ML9z7VyU6Xp64Kgu4xJ8DqmgESYBS3NG5RQDjJavsrv6jAR76VkC1Yz4lwAiGYs4C8ea
         273DTodahjtzfiDcVzvGPZWqB5/EXhLHxCvg1VmiacY/lACfNlHWEy93UdS1mKvpJLj3
         qToEvG+zLHM0SDAXxk1fio/T8qNRBel0gUuK3uGZ+naTszLKltzDGuPsPIcsgahrF7ke
         oi0A==
X-Gm-Message-State: AOJu0YwiGhvvPLWazE0tjEfRixwdB6ss55sWrM1nkIjRqMEJyc3Vf6yg
	bGxpWyIoErX3UNLFsNmdVGrYSQHcadOFFXvjRZwyxZfvi9Q/dsNuos0Qpup+Z3DfWTXFDVlfBrx
	g057b
X-Gm-Gg: ASbGncsLciiXj3trB/WPbMvp+XkLdMSL3jnVbBm6LvhLDIJ5OvkU9MGPDTQx3QoMEZL
	wGgDRuxJCN4shJMoGk12u3jzB6/4Y7iW0LSf9+5o2+8l7MybwNuJ0OlsciHsfZeJ7lSsYpT2Z0m
	QE1THAws07NORMUp7FQPbLheH3vVYINFbgOeukcoT2YwSg69tfzeQZ4cfH+x9ZrSf3DmxRvhI/E
	tvnB6zLsbM48DDdEbnbrvrSzMdTU3es509TNwlWOzaderlz9rx2krthmHKeVWGaCGneFuTugno+
	cDfTY7fN0VJAIVx/SfDCJ2Ks7ZuhfBro8/cdTKokmN+pqDebRvnyp9aeq6l9TO1JW4rZmqsy861
	233BM4ptAfE69Vi73e9SJpE8PhEIMFQfmR3hDBXq3RQs6MDLNoxkd3pQp7BEBdnT5DdGAvX+Ehd
	0wB2hU29ptQzFVvO/J0YA=
X-Google-Smtp-Source: AGHT+IHGpU4WXe51zzmQ9wZ8Jpdh90URme4BmVoMdnJ0yOVE//FwXr7v2f+bG8DxDFggEuDarvZ/gw==
X-Received: by 2002:a05:600c:4f08:b0:46d:d949:daba with SMTP id 5b1f17b1804b1-46e7608b683mr10033175e9.4.1759502241012;
        Fri, 03 Oct 2025 07:37:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:67c:cc8a:4a49:c12a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6e1bsm8248650f8f.8.2025.10.03.07.37.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 07:37:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/buildhistory: Fix test if USER_CLASSES is unset
Date: Fri,  3 Oct 2025 15:37:19 +0100
Message-ID: <20251003143719.484368-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 14:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224390

If USER_CLASSES is unset, the test was failing. Fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildhistory.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildhistory.py b/meta/lib/oeqa/selftest/cases/buildhistory.py
index 511c666554f..1edc60c72d0 100644
--- a/meta/lib/oeqa/selftest/cases/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/buildhistory.py
@@ -16,7 +16,7 @@ class BuildhistoryTests(OESelftestTestCase):
 
     def config_buildhistory(self, tmp_bh_location=False):
         bb_vars = get_bb_vars(['USER_CLASSES', 'INHERIT'])
-        if (not 'buildhistory' in bb_vars['USER_CLASSES']) and (not 'buildhistory' in bb_vars['INHERIT']):
+        if (not bb_vars['USER_CLASSES'] or not 'buildhistory' in bb_vars['USER_CLASSES']) and (not 'buildhistory' in bb_vars['INHERIT']):
             add_buildhistory_config = 'INHERIT += "buildhistory"\nBUILDHISTORY_COMMIT = "1"'
             self.append_config(add_buildhistory_config)
 

