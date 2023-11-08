Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933C1C4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 22:53:30 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.107114.1699484007006260185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 14:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wr1mZ5cf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b89ab5ddb7so207649b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699484006; x=1700088806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVXgqaTcrZspsPd6gPjt0w+6XSqKK3vqKLfk9RwXQZE=;
        b=wr1mZ5cf1T1AQn9cdl/HB5Ejl/txOrDcIsruFDS1mUQ2msM1kI5juTC42q7PnaEscw
         S/UfkVrxL/fBB5cvf1p3QrvjIsgelev3Y28XKw+Fq+PvpvtaCrHbclX+NfEBwIoQAbSY
         UU+t7tM5xoxZuvXf6yJFbUD9S3erq/UIifFPJ3RhGg3ZPGdsLTkIAqKxyDThk6raVDPO
         up++7dlJnR1xpbBr+Qm0asneKY9QaYQYwqv0A8Wjxp63hK3GlHGYXEmDlmQCgT9/Z7rG
         jBZ0/3LF8WEnA60qkggwX4ZWNqhDK6JQiMSGhlX1BuluNJgICa3avuPZPBsjIreoRjQJ
         cYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699484006; x=1700088806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVXgqaTcrZspsPd6gPjt0w+6XSqKK3vqKLfk9RwXQZE=;
        b=dsv0F3+MDRc7Zs7bXqIXIZxgyX2FiGJx9W4Cw1pszHgfggAwmXKs2gL1eqDXs5Gkm0
         1oVJsE+I/+wPZ4IYZDyut7AItjIEqvH47LBgJeWFoXLglV6VxJ3gW72PDrb1H9kqFLtV
         P6owDC6L0+EEwgiJul2ei840FaBVZldAmi75PJd/hexFMFL3X3HkMq/s+qoInBLFj9Pw
         vP6SrKkkWEl+TYBPyp5ER/bMT2yPpsolynXc4LFDlELoP3RaCgk1C27T5F4gjJCGC6Z8
         vU5z1W3IoZuWM5OTmhVB6nxDLDQOoCS0SON2Y8qzkRNTCs/L0AbjGQ+bHGO0zS2HFrNP
         Os2Q==
X-Gm-Message-State: AOJu0YyyGSErnLSZO2GxDNeb0wVzXHWzx+f48G85IjR78pM3c95oW05m
	ZnyyhKF1hvvo4WAtWV4QveyLaaka/GxffaKK4oavkg==
X-Google-Smtp-Source: AGHT+IFwssRC+gRsBx8fYCO+g/XXSKgf6rt60rFkGum9Zo2clmzFNSNafprIURIB2ByGTBjDZpe7bg==
X-Received: by 2002:a05:6a00:3998:b0:6bc:f819:fcf0 with SMTP id fi24-20020a056a00399800b006bcf819fcf0mr3015914pfb.1.1699484005720;
        Wed, 08 Nov 2023 14:53:25 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id du4-20020a056a002b4400b006884844dfcdsm9467883pfb.55.2023.11.08.14.53.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 14:53:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] python3-jinja2: Fixed ptest result output as per the standard
Date: Wed,  8 Nov 2023 12:53:06 -1000
Message-Id: <4bb6373e5f4a1330a063d1afe855d6c24d5461e7.1699483825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699483825.git.steve@sakoman.com>
References: <cover.1699483825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 22:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190365

From: Narpat Mali <narpat.mali@windriver.com>

There was an extra space between the result and ':'.
After removing extra space, the ptest result will be:
result : testname -> result: testname

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-jinja2/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/meta/recipes-devtools/python/python3-jinja2/run-ptest
index 3004024619..5817735a63 100644
--- a/meta/recipes-devtools/python/python3-jinja2/run-ptest
+++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'| sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s : %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'| sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.34.1


