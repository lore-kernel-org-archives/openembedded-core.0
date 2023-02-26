Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14286C6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 11:59:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.64037.1677412771470241653
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 03:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B1JQMjt3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso2218144wmp.4
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 03:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+L+T2bx+fF5CnhAUBOxaIHiVKGJYpOypox6V2cgS/A=;
        b=B1JQMjt37cH39BLfOIg9mFAdetGIt5UoV8rwfiXZQAj1k0qceNHLINX5JfKXripdOU
         ousWkDBYuagwOlHNGIoJX8lMwY1ldounQ7J5LipPEGO+14z48/AcqxYYsd+2W/T1x0Q2
         UFYnCXtSwc9PoSVsrc5jJNGLJiKBls0vw22tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+L+T2bx+fF5CnhAUBOxaIHiVKGJYpOypox6V2cgS/A=;
        b=PlSJ0jMtFF0l+GULk0vzLZgv/MWVrBGsWiksZn+dA1CUdYUHR3De7iXrOFWRv0Q0JE
         +EWUrNudzieNYhtrfiRS7YlexfLaoojiq0iGkmlfaXwngQbfANHpdPQwg+CCIgYFBv7+
         29H5pU6yRdJ1zIlcrkjTKgygXeL5eXckXDXo6siNI7mN5mzxuDCV52bXafSrKDg51i5b
         7geVODT45O+HSe4ifzYuNVOsDksfX1f8ue6a0wSvovE7LolaZHI0uzKproTiRoZDBd4e
         2L/EXxM+wc6Ej5L1F6mt/rWx+3VQa5A1fGx2VOkIFvGoQvzevXq9DE9Ssi4TE8PwK9N1
         923w==
X-Gm-Message-State: AO0yUKUp8InwxLzv7SEEwCK3AHoM4CuGXtA0nmstis+2/KUNy/tWKd51
	7z3k97FTZ9IJB27/muzEywvkAL5AfTWpHtQ3
X-Google-Smtp-Source: AK7set+J74WwOU3fsNZKPbUS3/gxPMH8fdBS7O/bRn+zqjY2IYMKTvAQoUYZl42qj5fvZs37L/9x4g==
X-Received: by 2002:a05:600c:3b14:b0:3e8:f27b:a92c with SMTP id m20-20020a05600c3b1400b003e8f27ba92cmr12124729wms.32.1677412769222;
        Sun, 26 Feb 2023 03:59:29 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:acca:18ee:3f6:d4ed])
        by smtp.gmail.com with ESMTPSA id d2-20020adfe842000000b002c552c6c8c2sm4247928wrn.87.2023.02.26.03.59.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 03:59:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] resulttool/regression: Improve matching of poor ptest test names
Date: Sun, 26 Feb 2023 11:59:27 +0000
Message-Id: <20230226115927.628364-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230226115927.628364-1-richard.purdie@linuxfoundation.org>
References: <20230226115927.628364-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 11:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177731

Some test case naming is poor and contains random strings, particularly
lttng/babeltrace but also curl. Truncating the test names works since they
contain file and line number identifiers which allows us to match them
without the random components, or in the case or curl, test IDs.

Going forward we may be able to improve the test names but this
tweak allows historical test results to work in reports.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/regression.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 04a2f3fbb07..74fd5f38951 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -248,6 +248,24 @@ def regression_common(args, logger, base_results, target_results):
 
     return 0
 
+# Some test case naming is poor and contains random strings, particularly lttng/babeltrace.
+# Truncating the test names works since they contain file and line number identifiers
+# which allows us to match them without the random components.
+def fixup_ptest_names(results, logger):
+    for r in results:
+        for i in results[r]:
+            tests = list(results[r][i]['result'].keys())
+            for test in tests:
+                new = None
+                if test.startswith(("ptestresult.lttng-tools.", "ptestresult.babeltrace.", "ptestresult.babeltrace2")) and "_-_" in test:
+                    new = test.split("_-_")[0]
+                elif test.startswith(("ptestresult.curl.")) and "__" in test:
+                    new = test.split("__")[0]
+                if new:
+                    results[r][i]['result'][new] = results[r][i]['result'][test]
+                    del results[r][i]['result'][test]
+
+
 def regression_git(args, logger):
     base_results = {}
     target_results = {}
@@ -309,6 +327,9 @@ def regression_git(args, logger):
     base_results = resultutils.git_get_result(repo, revs[index1][2])
     target_results = resultutils.git_get_result(repo, revs[index2][2])
 
+    fixup_ptest_names(base_results, logger)
+    fixup_ptest_names(target_results, logger)
+
     regression_common(args, logger, base_results, target_results)
 
     return 0
-- 
2.37.2


