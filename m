Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F738C8303C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:25:42 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.17998.1751441134616081126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=t1dUe7VS;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b7fd20f99so67273111fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751441133; x=1752045933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzZFfwm8zTAPd6icg3IwWPjeTWjXk3uXS0HjjDTdHQw=;
        b=t1dUe7VSMShmHAjnTneU0LaAFWBb3FOJ+4X76vjOcioElLEBXbyOa1FIRUvF/Muk44
         LNfMsoIITMlPMgQsWVs3tRY2NIpqmC1CRwgRwvOZEDNmiqxNBurqhfX2adTqqHQM3ga3
         +iKwDtlnDNigN84Z/CMddBtnkF3+oqpzH//kL4EJHxzJzv9tVWSbhj4DA/QBC2oOfX55
         V5WbS3uRW7a36fwgaDdc/63BMo4gyy0EzUF9UoaEiQ6nhZ/H8C+9fiIidVTIQ+OeuU0H
         97OFYq4xq3c3V187ZP2nTMuq5oPvfVhg2t39XmqltUB9Q2XvKjeFgYak2O3ZyfQKsE31
         TxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751441133; x=1752045933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzZFfwm8zTAPd6icg3IwWPjeTWjXk3uXS0HjjDTdHQw=;
        b=jO0w7PVhaLDKpxF0rHSXr/74Bn9MNB0L/ifZBcyHWypFAtLpId6/uPj7yVwgMNcAvP
         kQfuKC8FtJAu+h6Qo3WWNYmGz5hRwV6jCJ/wpw33/Ojw/11kJdMj+q1eVoEfxsHBHft+
         rwazoztUh+VOo8jTyv++ylxMok0Tqlkrp0ggooc3rIle/trDsocxAuBIO56Y3av2ms/n
         kY/MDIEN+xrDOLrDueca7J4Xl6CPvLqjafEj8yx5BlHLZ8eSlEAEPtTIAbhysUZKvtGf
         bBkjOsesXxx6C50OAIcZ/jXcdYetaYJLpxLR742huHwoaNXC3biY6d0J2Ph/rVomi8ID
         mGog==
X-Gm-Message-State: AOJu0YxJwINBqsXDZDLZUmpdk/CEbYBn9uUQNg+QtEdfVxQZdDz/Rg0h
	loqFaQz7ltGJKh5QgaR9WRbDJCsLVre2ACqZXq62MTbxg5I9A9+G8l0vSVrN93+PMwc5a4cjgrA
	ppsAk
X-Gm-Gg: ASbGncv4Uu56yWidBet69FoZktJUMqnCbyKBLXQPMPDrDHKMVp+HzOu8IB/U4uwLoa4
	cRNLTV/OqZ6uPzcp91JYibhte+PQrdX+/aOPFE5jqpcSEaVg+nWay7p9EuoEXQiAOP1QMECYx9C
	P5YlU9UquCyiK2ycn8C3N73R5htkwCZgU+JavMbZUX2/CBgBF2CIg8IuSjJBS0jvHrh5N4KUryt
	kiBhhaqZKptg89QJtDB4jyPK1x44WnGQvk/2uxiUjjs+Y26CFkAvbto6donJ2vKe/rHlM+qMLmO
	W4gXyR08x7kpif4yo4ml3E00m7oAFyETV3ZZW7lpSS0CPxJIb5duG8nxh3iYMRN9J4Fgf34F0dZ
	pJtutbu1XxyqWJpH6iq2nBc6/9uXee2oCh0/XrE4=
X-Google-Smtp-Source: AGHT+IEFL6UQoxgvuEy62d/9tV/X5AvoknbWnHcF6X6z6nPLwdhDjRXYjOJ1cXjcSBRTCTHaSOxeBg==
X-Received: by 2002:a05:651c:210a:b0:32b:4932:d5ad with SMTP id 38308e7fff4ca-32e01b5bddfmr4555971fa.10.1751441132646;
        Wed, 02 Jul 2025 00:25:32 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f0c7d7sm18781181fa.102.2025.07.02.00.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 00:25:32 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 2/5] oeqa context.py: use TEST_SUITES if set
Date: Wed,  2 Jul 2025 10:25:13 +0300
Message-ID: <20250702072516.1075450-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702072516.1075450-1-mikko.rapeli@linaro.org>
References: <20250702072516.1075450-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219790

If build target has set TEST_SUITES, then that should
be the default test modules to execute. Fixes testexport.bbclass
to run same tests as testimage.bbclass which already
uses TEST_SUITES.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/core/context.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 9313271f5865..46de9135c179 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -179,9 +179,16 @@ class OETestContextExecutor(object):
         else:
             self.tc_kwargs['init']['td'] = {}
 
+        # Run image specific TEST_SUITE like testimage.bbclass by default
+        test_suites = self.tc_kwargs['init']['td'].get("TEST_SUITES")
+        if test_suites:
+            test_suites = test_suites.split()
+
         if args.run_tests:
             self.tc_kwargs['load']['modules'] = args.run_tests
             self.tc_kwargs['load']['modules_required'] = args.run_tests
+        elif test_suites:
+            self.tc_kwargs['load']['modules'] = test_suites
         else:
             self.tc_kwargs['load']['modules'] = []
 
-- 
2.43.0


