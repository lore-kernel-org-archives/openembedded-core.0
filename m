Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCECC74A5B
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 22:52:14 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6653.1679007129749813031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 15:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B+Tvt+jk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id r29so2894666wra.13
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 15:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679007128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dEq5K84P1HrcRQvukrHxr0Td+rHeafkiYLaZ5n/ohRk=;
        b=B+Tvt+jkrn8IG51r4xUZmUw6pi3ktwmAPNyjScNOedBeC1F2aGuJWu1BiZWwPyorgB
         Ib5tmnui34gWhVOMo59aNAZiksSR9JvqxcxUBFKpJEBwiNlK8UCvWuaxSX76PXY4I6G4
         cU9BomgC3/XSI/8xp/80jD7DAM3u0FUQMcrCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679007128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dEq5K84P1HrcRQvukrHxr0Td+rHeafkiYLaZ5n/ohRk=;
        b=iy7/uGDk+lDDLihQlS16aHkwNH5Y2kny8kwtldNjQVshUX3lCka43jtFr6hHZCrHuO
         oMbFg4vTMjanGFxQs608YjMig7hkFTgWCym/p57qCt5dDvgu7Zwi1goEdPrat3PT0kbv
         Y41+IFaASidp6XBObPeFjP+OOD+dY+5SSjFkvmeirYVfpHMpL34UnB+HExcxezMl8NCs
         L7+racMWTgvmLM2On/8xLWhhN+6tdld+vGSJXKkg02hlKcZrRsg4HJsJPIyG0uAEkQAp
         2oAmgOQloyA/043Jf3CM2YrxDTRUTHEVjEQHttgjXCyG3HwSyu7c13aZV0lliBIj1hTv
         70Dw==
X-Gm-Message-State: AO0yUKXazD4U2b6NOq43rQfvtYqacH48taxhzT3553Rkw8zuBYY7BlBw
	qGO56HP9Bx+HrMRQJI3LIhtPGzM24FVD5CcPeCY=
X-Google-Smtp-Source: AK7set+DKwjeFyJD7QjCbnyZD7D958CxCpNwju+PfuF0MM09+XBozZF/SzqOHeCQjNeR5SkFtpztPQ==
X-Received: by 2002:a5d:45c6:0:b0:2ce:a85d:5319 with SMTP id b6-20020a5d45c6000000b002cea85d5319mr5599604wrs.39.1679007127682;
        Thu, 16 Mar 2023 15:52:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4a14:4396:c3b7:b66e])
        by smtp.gmail.com with ESMTPSA id a7-20020adff7c7000000b002c70ce264bfsm481941wrq.76.2023.03.16.15.52.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 15:52:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] resulttool: Improve overlapping ptest result reporting
Date: Thu, 16 Mar 2023 22:52:06 +0000
Message-Id: <20230316225206.247906-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 22:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178736

With the move to a ptest per image, the multiple ptest log scenario
is much more likely. Tweak the handling to only warn if there are
overlapping files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/log.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
index 621c6c4bacc..15148ca2881 100644
--- a/scripts/lib/resulttool/log.py
+++ b/scripts/lib/resulttool/log.py
@@ -28,11 +28,6 @@ def show_reproducible(result, reproducible, logger):
 def log(args, logger):
     results = resultutils.load_resultsdata(args.source)
 
-    ptest_count = sum(1 for _, _, _, r in resultutils.test_run_results(results) if 'ptestresult.sections' in r)
-    if ptest_count > 1 and not args.prepend_run:
-        print("%i ptest sections found. '--prepend-run' is required" % ptest_count)
-        return 1
-
     for _, run_name, _, r in resultutils.test_run_results(results):
         if args.list_ptest:
             print('\n'.join(sorted(r['ptestresult.sections'].keys())))
@@ -51,6 +46,9 @@ def log(args, logger):
 
                     os.makedirs(dest_dir, exist_ok=True)
                     dest = os.path.join(dest_dir, '%s.log' % name)
+                    if os.path.exists(dest):
+                        print("Overlapping ptest logs found, skipping %s. The '--prepend-run' option would avoid this" % name)
+                        continue
                     print(dest)
                     with open(dest, 'w') as f:
                         f.write(logdata)
-- 
2.38.1


