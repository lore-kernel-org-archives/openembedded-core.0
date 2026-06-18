Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC65CD98F8
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 20:36:52 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28663.1781815007886639875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 13:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=K9zJfSNL;
 spf=pass (domain: baylibre.com, ip: 209.85.219.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ce9df4732cso14503446d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 13:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781815007; x=1782419807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uzfo6XagXiMnoqJUejq1mkjK4k4jq/M+q7PKHC+OHtE=;
        b=K9zJfSNLLi7MoUggGFhmfgZtHWbZ0VdGYpq5/LAqhdtPyMAqXi5hzHe1stiajaz/ki
         kFj+BU1+H1aaQKHyR9FkVo7410485G/yxZMDnJFOrMv3qClC6x1aWUgGAx99Ie0Vn4WX
         jtK2RsT9AZMjePjd6XchyoI9TRpozngH8fUpKFvNKJxl4xNrJcpwqh5P4Q3xvhcCk/+y
         9OFsIyxb7y3FrS04Ptp4zToH0M3CS7rKMQ22h3byL/XKpznSNQMR3Bbjhp1v6+dwPa+K
         yyzX11DMLuhJqWMt04yh6XSx4VpIY/snXOZnMne1a9ygGkt9BnKX2e6Ztw71OG1VYt+P
         Qttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781815007; x=1782419807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uzfo6XagXiMnoqJUejq1mkjK4k4jq/M+q7PKHC+OHtE=;
        b=a8xjLb58PAngB2Q6ZlSime6iEQPqnGa1jw3m4yIKBZ56DZJ0HMUIgpbRcuhqxlewd0
         kY4xPclIZN7f7zLFMAIC/zckx0kJVFX1mKOscfDC9Vu3JBZbsfLyS8GMR8oFCEFd9fD7
         5lRTkp4pNlFcK9pM4SsQsYvnnXHvK9cq6da4E8/SLPmnpmC5EmLWaCHR6WWG6V/QRtbz
         8A+d9ygLcOROK4vJT3jspeOdPzwQBc/F3ym9g0urwAoApIO8wFbSTaARD8/3Io67NUZa
         gyBvF2KjpakaLes0ig5e/yR0Pk+6QwRXiaSskNF1ke8z5wXE937CgZ+8ancWpWH6wIEd
         2qsA==
X-Gm-Message-State: AOJu0YwaoWUNgE0bw7pcsGK/Sgjrn0M4w1nu8/aT+LcAl07lFIAWxhMG
	EEmcIkYCNT+go8zLI+fgXoTpUrrXp4jPBMEuZDT2FfIqiHwD8zRypngvs4LvgmJSl5d2+6L2BVs
	sHCBc3MBalA==
X-Gm-Gg: AfdE7ckuevYvyN8FP67lH8511HdWFkYqFOVAV8Zn9QZo8EELLMuFTLDdqwkhF634C/n
	g/0FO7E+d/XTh3qS01KuyfGYXpjNtsxt8Yz7JC3X2/ksKamoDDdnBTQSn+4DidjrTa8w8EteErQ
	yHVA/7bLNqW0AZEwPESq+M51YrISf7XIryOAjbVLakenlhF2TH4JBcPRJmw1mvpewsMfohw9QRq
	2nDDCNjVAv9NqsQqBm4bPLoNY9JWiItk9oyXdsLMSMlaV9tyoF7Jn9yElKG52Is8zEmx9LlAejM
	gNpPj//4R1NSxa+IpagNNH2ioDt4eJWJG/vdVirvIjy/VFqxLNT2U2OUvKAtlagBHqhOet+/udH
	tOZFp0EC0mMVtKarFkkGO2mEqIdnbc7jgC1BSNyeMKc5eQusHwqli7JLNf/+/i9PE9n8UhmsJUX
	HMbWOxF49O2XVjHDp5
X-Received: by 2002:a05:6214:29ea:b0:8de:4553:7c7a with SMTP id 6a1803df08f44-8de45537cd1mr13422036d6.15.1781815006690;
        Thu, 18 Jun 2026 13:36:46 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8de5e12ca3asm2163126d6.4.2026.06.18.13.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:36:45 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [PATCH 5/7] scripts/patchtest: simplify run()
Date: Thu, 18 Jun 2026 16:36:30 -0400
Message-ID: <20260618203632.131125-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618203632.131125-1-tgamblin@baylibre.com>
References: <20260618203632.131125-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 20:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239106

Set premerge_result and postmerge_result directly by calling
getResult(), instead of doing it in multiple stages with confusing
variable names.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index aef80a86bb..d2f6302743 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -141,13 +141,8 @@ def run(patch, logfile=None):
     # Get the result class and install the control-c handler
     unittest.installHandler()
 
-    # run pre-merge tests, meaning those methods with 'pretest' as prefix
-    premerge_resultklass = getResult(patch, False, logfile)
-    premerge_result = _runner(premerge_resultklass, 'pretest')
-
-    # run post-merge tests, meaning those methods with 'test' as prefix
-    postmerge_resultklass = getResult(patch, True, logfile)
-    postmerge_result = _runner(postmerge_resultklass, 'test')
+    premerge_result = _runner(getResult(patch, False, logfile), 'pretest')
+    postmerge_result = _runner(getResult(patch, True, logfile), 'test')
 
     print_result_message(premerge_result, postmerge_result)
     return premerge_result or postmerge_result
-- 
2.54.0


