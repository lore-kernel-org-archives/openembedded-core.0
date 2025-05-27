Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2C3C5B543
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 09:08:27 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.46942.1748336902490292601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 02:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PSrZdL3A;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso27052191fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 02:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748336900; x=1748941700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6udH1gsUuHFnWeChKLZB5QywiKbC3CCIz5+pVqZBwo4=;
        b=PSrZdL3A6uz3Tj1ZLs7nZFq9ocR2kkbA+dcjlp+3nDG/WiAepte1XbLK0RTOhsVGh6
         BTqLi59AZMTeD6nmYfJP9z4btYhvhduBfmzptgyRAp0cLbG2y8OKFpub2uD8TwxdjKgn
         ZGMHeoR1DZLHwQ9BTZ0fuXclYZOFsAoVkK7eZvmeu28JJAv2g1tv2SeJhMVjIGPV9GrZ
         FZErMubW9raNrLTaw3VyGwpFb1XVYHVAIwt6+/XqeYOWNlkRSSozhdnYa3Qt6VSTSo5A
         pRe8Jpc9mxvsx+UVAZZRQIDFhmtO6SHUBM39qGfvIU/VP3nMyImcCC2H/NrhEut3bas3
         yRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748336900; x=1748941700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6udH1gsUuHFnWeChKLZB5QywiKbC3CCIz5+pVqZBwo4=;
        b=I1kwZ02zczeNnrHfBSmIACoXfybad5fxwSFFo3DXZy41KAPRdYAoH1bVz9JmzW0dKM
         M7RsHKaAoupFGSo3AmwwYkJvcNqJ2V0u/o3MbO0OB1BTFafrYkFwttJQucsoQaL8xUaQ
         Lzfa2fSQ5PeLuo72c3/tbksor+LvBfOHIPY6mUIzOzCpIgFw0sQrGGRLOeVhh8vGbRTO
         wwojJEzzi2wwGn0i1JL36atdwe94xluNB7a/Z66JnnEn18Zjo9/rDt35jDuUGuSWUSOx
         ETVo9nkm/ngUTeQwViW1JKihzxryP6bq1GTiokFyNiMdCYUciCXinBB5xnDThsbzhQOm
         lntg==
X-Gm-Message-State: AOJu0Yw/XFZMRZrJNV5+1Llp2qdHtWeJzZ9UuwaorYjgJGKYIXYc3Mjv
	1rQ8iX9mEJVkGPjnRwsVIjifYqMpU/u4vhACeYs5OiQAyx3i1Y69e+mNk8s6UuoUJDAap5hUGVJ
	nQ5zSYFY=
X-Gm-Gg: ASbGncv2LcrNFW8f/RaYK6YnIKZ3ojKqOrsQLGopWF3cxZGAayerWnsGS/uZNgmlHzR
	hCrF/d+2cgZz67ISuXU3qPRyHZi0ocOtg+eDqVRFu84mj7YelOOLOWmSbYg573/CZGxA3+KfhmW
	t7QQxJs6R2T3I4zflLZoNq+nD1ednJ82pZgjEOqVDg/DngqS//6vGP2ABWgJITO2G+M9ANwuYtg
	0EplU8q74NhcymvTkleBYKFlzznfXIhtFN1YCuGxGXaTTmuKGWnXIGJmNvIzDxlkZM1uP1DGPFS
	H1sVazmfptNAkjZlHnqrvKxRCFrgeLSJY4RDsDAiMdVhRxcxKJ8auTr/8NoD96sQhf1kk0yVoiu
	lNJGTQTI4KEUvkOHId7kvZUha
X-Google-Smtp-Source: AGHT+IEwUsdwsmwtESxta2bDe8HhXZJqI2Uaz2b8RVKjzq2W3IAbgqMQhQd7AZytwtO6ttrjQJszAQ==
X-Received: by 2002:a2e:9a0d:0:b0:306:10d6:28b0 with SMTP id 38308e7fff4ca-3295b9abf5bmr41837161fa.1.1748336900554;
        Tue, 27 May 2025 02:08:20 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-48e-3a00--183.rev.dnainternet.fi. [2001:14ba:48e:3a00::183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6d358ecbsm2290211fa.17.2025.05.27.02.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:08:20 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 3/4] oeqa decorator/data.py: add skipIfNotBuildArch decorator
Date: Tue, 27 May 2025 12:07:56 +0300
Message-ID: <20250527090758.540188-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527090758.540188-1-mikko.rapeli@linaro.org>
References: <20250527090758.540188-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 09:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217292

To limit tests to specific build host architectures.
For example KVM testing will only work if target and
build architectures are the same.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/core/decorator/data.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 5444b2cb75..0daf46334f 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -228,3 +228,15 @@ class skipIfNotArch(OETestDecorator):
         arch = self.case.td['HOST_ARCH']
         if arch not in self.archs:
              self.case.skipTest('Test skipped on %s' % arch)
+
+@registerDecorator
+class skipIfNotBuildArch(OETestDecorator):
+    """
+    Skip test if BUILD_ARCH is not present in the tuple specified.
+    """
+
+    attrs = ('archs',)
+    def setUpDecorator(self):
+        arch = self.case.td['BUILD_ARCH']
+        if arch not in self.archs:
+             self.case.skipTest('Test skipped on %s' % arch)
-- 
2.43.0


