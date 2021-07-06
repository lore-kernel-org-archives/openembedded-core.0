Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.4678.1625569732229652033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 04:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XhmMeCoW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id i94so25616372wri.4
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 04:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5O7TB/i1YhHADrBRm6mrkfgWD8q5hvGc3GGNopNiIy4=;
        b=XhmMeCoWxEHag0W1clnkINT8MisTZbU2BmMNenJYCJ+O7ZrEV8DHIGMdTvnh5xlajE
         GJumCFUDp//M+z16NqhO+DThuPfHX507a2lNwfT0h/PXZpyT3rBbQVgIIKNF8gFBLhDO
         xRhcxt1LVEQW+UzgN51jpQ3Ej/CxT/svt2es4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5O7TB/i1YhHADrBRm6mrkfgWD8q5hvGc3GGNopNiIy4=;
        b=twT+RXzz6yciJmNABX+Y+iYdHlxIYWrOgzoLqEDmP2ddpJVzhydI1P1c5BQWOdAtYf
         wCDst6g9Y+CVD5nEm82MiHCqJgQ/D5bo3jn3z59gZ/E+fEVOh/VB8DoKFjyRVPf4dnfq
         pnEhU7+mnLN/bcZNmmkHsgD+pq5u6/V8j6V/jP/1/zd2Z5zqg6BMA3lSp3QiwNgVfkyU
         0O3O1vzkcQTEBTLxjltlGjLPWkQcp17D7WyUlMKnT/JRfzt5fcOCwhSFwthAQHiXngeD
         Aqu56+4OmgJBtFRoL3lXGCrLrbGV3aHmU9akLY93P/tpp1QVSbKG8UIRv7urZpRAcqyE
         5ZZg==
X-Gm-Message-State: AOAM531vO6ifayCJfL2tfK7Kn1cA13+nTARP4WZ6BIxfbFiyWAdGIpAG
	5R03LOHL0BotUWpp2f10wcCHxEVv/ok5wQ==
X-Google-Smtp-Source: ABdhPJygkFLfDzcUKqRZfJvmT0ePJeVVvjFjVDeFzRRpnwKAIFXUTXfGwA+UMrRxe8aswwsXwPk1Fw==
X-Received: by 2002:a05:6000:c9:: with SMTP id q9mr18898692wrx.274.1625569730466;
        Tue, 06 Jul 2021 04:08:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e563:c72:c3fb:aae5])
        by smtp.gmail.com with ESMTPSA id m12sm14753824wms.24.2021.07.06.04.08.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 04:08:50 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/multiprocesslauch: Fix test race
Date: Tue,  6 Jul 2021 12:08:49 +0100
Message-Id: <20210706110849.2661971-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having two possible failures in multiprocesslauch creates a race where one failure
may occur and stop processes being lanuched meaning the second failure may not
be seen. Rather than having periodic races appearing on the autobuilder, only
have one failure, making the test much more deterministic.

[YOCTO #13054]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/oelib/utils.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index a7214beb4c0..bbf67bf9c9b 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -64,7 +64,7 @@ class TestMultiprocessLaunch(TestCase):
         import bb
 
         def testfunction(item, d):
-            if item == "2" or item == "1":
+            if item == "2":
                 raise KeyError("Invalid number %s" % item)
             return "Found %s" % item
 
@@ -99,5 +99,4 @@ class TestMultiprocessLaunch(TestCase):
         # Assert the function prints exceptions
         with captured_output() as (out, err):
             self.assertRaises(bb.BBHandledException, multiprocess_launch, testfunction, ["1", "2", "3", "4", "5", "6"], d, extraargs=(d,))
-        self.assertIn("KeyError: 'Invalid number 1'", out.getvalue())
         self.assertIn("KeyError: 'Invalid number 2'", out.getvalue())
-- 
2.30.2

