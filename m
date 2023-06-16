Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E93FEB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 15:49:29 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.2273.1686930562829416458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 08:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Wcxd4ksO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f8fcaa31c7so2973885e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 08:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686930561; x=1689522561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rHscLQz606URptI0Kzohdq5dnxQD5YH1DuKkw7TyoR8=;
        b=Wcxd4ksOpDf6VZO+r4WFQPnrdpyiUyECeSWHIuvGW2OBylt6nohSWvM+XF1HTh62UC
         HDNx4ohFbsd+UFEu/nVU8W8u9sunbfjXvVOK7kya0pkAMVRjt+QSWUboHRf3SDM+A8zJ
         4OiZ4tV74Q55ZRxlOA5JYmZGhcEPtQPjsGO8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686930561; x=1689522561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHscLQz606URptI0Kzohdq5dnxQD5YH1DuKkw7TyoR8=;
        b=d0vSSlnaQAbJP/Mw+d4QtYvj32nO+mQXiaZnQGeHkPdmYTuGiIqLvA4eEFJjlawtE0
         lGTOPHXdQ7K+jdaE2VQVE4l3+qgY0LG3T0mNOiNIBTJdWwngF32JNxMq7m+WKWVpYOdq
         cgyEjpFefHGf2tZNu5gPrpBnxa3tUYeNLHi2zhPj112dea/Ue4iN6hliZdZJoz7feZF0
         XIiVv4uS4PajCUssUYpPNUH0xXfpciqbHWONeeq9qRyxGCWyvpQwMYrDqoLt1t6BMNig
         swJXVbOpWGp/KDo2vP6MZonjO5eomY6lgBcqzhvVlqi9Qdm6otgBdegEi1vsmeybb39s
         rHmA==
X-Gm-Message-State: AC+VfDweZImcEo8gfixm3CRJgMVsFNqS6VeOVDvIJPgYu42X4McdB0j8
	vDOPEzhL3VF7Zxqc/bjoOzIHjey7fdTmvJvi2O8=
X-Google-Smtp-Source: ACHHUZ4u6LRTKyrvIU7+8bvLKIO9Yt1BPmkx3dzWXS5Ix9Y48kE64tIXTNlrWRojhLYtRBGL8wARoQ==
X-Received: by 2002:a05:600c:b46:b0:3f6:e79:3a8e with SMTP id k6-20020a05600c0b4600b003f60e793a8emr2368769wmr.12.1686930560899;
        Fri, 16 Jun 2023 08:49:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b814:609:2b03:c353])
        by smtp.gmail.com with ESMTPSA id g18-20020a7bc4d2000000b003f8d0308604sm2608036wmk.9.2023.06.16.08.49.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 08:49:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/logparser: Fix ptest No-section exception
Date: Fri, 16 Jun 2023 16:49:19 +0100
Message-Id: <20230616154919.1837740-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 15:49:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183046

Occasionally we see:

  File "/media/build/poky/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunner_expectfail
    self.do_ptestrunner()
  File "/media/build/poky/meta/lib/oeqa/runtime/cases/ptest.py", line 77, in do_ptestrunner
    results, sections = parser.parse(ptest_runner_log)
  File "/media/build/poky/meta/lib/oeqa/utils/logparser.py", line 80, in parse
    self.results[current_section['name']][result.group(1).strip()] = t
KeyError: 'No-section'

which occurs when there are "results" outside the main log section. The strace
tests do then upon failure as they dump logs there.

Add code to avoid the tracebacks and just make them warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/logparser.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 60df754b36f..8054acc853b 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -77,7 +77,10 @@ class PtestParser(object):
                 for t in test_regex:
                     result = test_regex[t].search(line)
                     if result:
-                        self.results[current_section['name']][result.group(1).strip()] = t
+                        try:
+                            self.results[current_section['name']][result.group(1).strip()] = t
+                        except KeyError:
+                            bb.warn("Result with no section: %s - %s" % (t, result.group(1).strip()))
 
         # Python performance for repeatedly joining long strings is poor, do it all at once at the end.
         # For 2.1 million lines in a log this reduces 18 hours to 12s.
-- 
2.39.2


