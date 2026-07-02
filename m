Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C3FC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 15:22:38 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72293.1783005749618067249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 08:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=FiJkoAfB;
 spf=pass (domain: baylibre.com, ip: 209.85.219.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8eff5ce3b95so16871676d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783005748; x=1783610548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpEqPX+3vUoKU7DBXoSoh3owWBloA8LHKsvLMyfYVlU=;
        b=FiJkoAfBoHiEu+eek5JDxRlMAWte+rhn6aWw0WmtkXNeH0GnmlDZXF/XRuI7DV5RcV
         knfmui16YUyJL4aTDazpQ6MkT//hq54PWXeJGKchM8xvNsFFQv0efz910TBzI40E06Jn
         7qRyh4XU62U4a0jtG1pPfCguyYeGDSaFkBih5u9MkgNLzfNCLjk0ZOA73EV/wF0vZPs2
         wr2L7orM+7GtS98t5rX+M8RWt6tY6uX7gtc2ESlo1EVyPwHMvQDVRsHm0WNcYF+LMlAr
         VtZuNeqFqLWgxYvOmLcI/vze181BdTSVtdJUYhQQZ4PSW/CzNEVF+achPlrw8HWIjXyC
         8+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005748; x=1783610548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lpEqPX+3vUoKU7DBXoSoh3owWBloA8LHKsvLMyfYVlU=;
        b=P9MfovUJRwCTCE7n/8D9h3pyaJuUR2jc/isKDyBLaVKmITduuLq6zH5tAB9e24X0Ev
         klyS0KgIhu0lLt5TdSRCrk42FzhnpEA76QJA2gD8iyH3y8mhVw0IqhKsOhjGQMHs3m/+
         uc9G3zue99IxCPHYmWswip+me7q1mIltcdVpY1m+Ogo/l8AY+JXRCSvr3TaT8s7jok/H
         nLjOcwjRJSgj8vsLkMujSuVTlC/XGrjU6FUKwZpDUHgghcWg7sohr++7fs5xAMb2LdU9
         B5wXun8xXuSIv/tSdpVfv2pxmoVHd9Xi2QPlorrS/MkkPSuvaXNfuYFNW/hN4zgI7i3L
         KLLw==
X-Gm-Message-State: AOJu0YxBFMNg3CAVniqLDED+jB58XU/c+vPCh1UVytJbG3p6p/R5VbSV
	CC/ZOYwUmNDEi2n0F82UZN3DbcqxE5BLPCMnczJPf8DSZsEyUJTOmIDGNYZq9tNcFCRoFblqMUo
	QX69X70oavg==
X-Gm-Gg: AfdE7cn60EbZ9oTBQ74TGrt+rDcUjoguv6hfuymOIQidDzjIj/ItSdgv7bGaUSo+URf
	gnTpZX9heZi8lkK8knJh10P0tDFuWW0oH9+E0OwM5utNTx6VOemYR0SVh4i4bXz/5jT1zGkTUS7
	1NupTCI0DJqQDaovA6LHpqEwMqKGPz7ib9chjie/kRPABrpHtwUOaqwIwW95O2v1ll2HjjDLLUU
	1u7cbLUAn2TAn348nu20AqqrzvgPJaVeA8MG3J5qWyfiRabJWtWspoOcE+K0cAfLHt6/Z3utdu4
	hCSd3qkLorLaFEqjFoXceJti5SmKxHTAmXRFxpJ7VfAsdzDuV4SI5Mv2ihm1UsY2esua4Pzn9O/
	Sj5meseITCqjCcP3ccn+aGEvMvdrmefShfWpNmSbhpMj/pU64x2My7Xxu1wmlJTq3hEsgzi/YlM
	p1iA/nerU/zLcvzBUH+q6bc1WdLWY=
X-Received: by 2002:a05:6214:dcf:b0:8f1:2607:ad86 with SMTP id 6a1803df08f44-8f42149c5f5mr70803406d6.4.1783005748523;
        Thu, 02 Jul 2026 08:22:28 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e27d555sm28510916d6.7.2026.07.02.08.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:22:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 5/6] patchtest: tests: test_python_pylint.py: use more Pythonic comparison, fix indent
Date: Thu,  2 Jul 2026 11:22:12 -0400
Message-ID: <20260702152213.1439717-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702152213.1439717-1-tgamblin@baylibre.com>
References: <20260702152213.1439717-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 15:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240063

- Use "!=" instead of "is not" when checking for a renamed file
- Fix the pylint readlines() block so that indentation is consistent
  with the rest of the module (four spaces instead of eight)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_python_pylint.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
index ec9129bc79..37d1de9436 100644
--- a/meta/lib/patchtest/tests/test_python_pylint.py
+++ b/meta/lib/patchtest/tests/test_python_pylint.py
@@ -47,7 +47,7 @@ class PyLint(base.Base):
         for pythonpatch in self.pythonpatches:
             # a condition checking whether a file is renamed or not
             # unidiff doesn't support this yet
-            if pythonpatch.target_file is not pythonpatch.path:
+            if pythonpatch.target_file != pythonpatch.path:
                 path = pythonpatch.target_file[2:]
             else:
                 path = pythonpatch.path
@@ -55,9 +55,9 @@ class PyLint(base.Base):
             reporter = TextReporter(pylint_output)
             lint.Run([self.pylint_options, pythonpatch.path], reporter=reporter, exit=False)
             for line in pylint_output.readlines():
-                    if not '*' in line:
-                        if line.strip():
-                            self.pylint_test[line.strip().split(' ',1)[0]] = line.strip().split(' ',1)[1]
+                if not '*' in line:
+                    if line.strip():
+                        self.pylint_test[line.strip().split(' ',1)[0]] = line.strip().split(' ',1)[1]
 
         for issue in self.pylint_test:
              if self.pylint_test[issue] not in self.pylint_pretest.values():
-- 
2.54.0


