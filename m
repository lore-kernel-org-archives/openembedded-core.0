Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361F4C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 00:34:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.4784.1647477268488338263
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 17:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VJddaUWm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id p26so1114265wma.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 17:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s6mNJNWK37TvfUfOocgqu8b+UJ7uNMczcRD+Gvqe2AU=;
        b=VJddaUWm942A7OlWyLGD0b4MJEyn+Xhdd1g+VoGHptZyaqRIcKS/tWsR+SwL6c5jqw
         8AbU//+hXf25nyFVVmcGcxKfmTYm7TZEm947gJzBLEfpZMRLmZHWM57DKVuYrfquTMft
         FI2vKrVXqhrLuunPopCyEtLrLt1DRQr9C2mwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s6mNJNWK37TvfUfOocgqu8b+UJ7uNMczcRD+Gvqe2AU=;
        b=3jKpNwmo88xU2iv8PQxeuGX2lZZ8q1ij0TzUmsHx8kE2PfFJLuUVBnhZk2WTFa6P0u
         TT+13ZDp7/qlF0FKkC0H7RTHQ0ac2bHaoqxRgE2pm2/rY1RiT2gabRzsJmSp4qaI+udQ
         vHHgboJa0DgcCLhaNToXZXqNQQIeH3U1VSNj4a9ksR0skiCuQds9BSUFg3z1+FwqsB/H
         9cfCXyeDmQAmVEtE+TG+EO87FLs2tfTqPEH3/ewr+Qb8yHwr7SicNJZL0+WXNNLxfcT+
         70u7aX07EskImhGMzM7goak5gIK8unoygtB2g2p3Qai5sdRbBHNHbs01DnldyCTkBx5+
         AjOg==
X-Gm-Message-State: AOAM532AhxByumeW7VvQUlPJXsfk/DTd2WHr7xNvN2ENBBIUa5oIwML2
	AYItUKUay5T7y6EgDGQF3aWa1yjgcwr+ySVq
X-Google-Smtp-Source: 
 ABdhPJwYiJ5tIVLpmSb4qazugUTcRK6nlBWop66ejHkO21wRBD/ketkUjMvZwabn/jSwh8vp1btiHw==
X-Received: by 2002:a7b:c77a:0:b0:38c:2c33:d8f1 with SMTP id
 x26-20020a7bc77a000000b0038c2c33d8f1mr7080034wmk.115.1647477266506;
        Wed, 16 Mar 2022 17:34:26 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 t7-20020a05600c198700b00389fb24f397sm6213290wmq.21.2022.03.16.17.34.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 17:34:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-cryptography: Fix ptest result handling
Date: Thu, 17 Mar 2022 00:34:25 +0000
Message-Id: <20220317003425.971028-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 00:34:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163365

We run the tests correctly, we just don't get individual test result
reporting. Borrow the code from python3-bcrypt to handle this correctly
and ensure the test pass/fail scores and individual test results are
reported in a format we can read.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-cryptography/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography/run-ptest b/meta/recipes-devtools/python/python3-cryptography/run-ptest
index 1e97dda63e7..3089df87819 100644
--- a/meta/recipes-devtools/python/python3-cryptography/run-ptest
+++ b/meta/recipes-devtools/python/python3-cryptography/run-ptest
@@ -1,4 +1,4 @@
 #!/bin/sh
 if ./check-memfree.py; then
-    pytest -vvvv tests/
+    pytest -vvvv tests/ -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
 fi
-- 
2.32.0


