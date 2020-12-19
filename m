Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.11962.1608398958675383735
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 09:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uRAQ8pXx;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id d17so7769423ejy.9
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 09:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/cTTFS+MkA3C84s02lzcW6j6O7K9lJX2gjF995Cqjw=;
        b=uRAQ8pXxjo+pPxr+tK3ec5Qi955+xZYYbYuigaMUzkDPZHaHvm04nrYEvZ1eZdLYL7
         zJDotnuvOuPytz1e2oTrPE4g6rdqscKBO3q/WUFPFjOAzgIJtdJ9sKqMe9KFO+CXK1Cy
         PsPvLPy7A6/x0rTc9J2Z2evuddkJ1BodTdmS8+Y0LgBkj6/TsGWH4h/DJmRMAaVZHC1V
         CoK3JSEOgFVC6IP63EY4u1zzGbIjDxqj1C4i2b67cMKEzFr0CJB4Vm7YH6Vm2lumPeVF
         i11/uZ8wPXbqCYS/TL7PZGc0IuR0OcVSE9VCGm3UEES0TJ8Ch8Z2FVF76vN5lfgk5NNB
         HHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/cTTFS+MkA3C84s02lzcW6j6O7K9lJX2gjF995Cqjw=;
        b=U9zS9pCYev/dTcPO3lJulICVlz2bgA9plc3B6japkgqo2R5UzlgGiVe1XF4RyY+NJh
         DXyHXPTHPYvcuYeCGtci+dHy0w76yASAqe8jlxKYLRhpS1VpLsrKQsQfZAl4LD5/zK+y
         FXa65ApxXRNHVCeglqztu6lyMokyPFf5NZ7Uz8sht8soDmF5fA1Mb7iMG62bwF8qW8mW
         fRHPJ/KOJmcPfyycqR+hi1xwA7KbsdvbnPhPrPPCKAuqhY5aPkVo5I72Xyv6Cvk+eZfh
         /cpsQTFtI3I0sugOGQDZJ9c8BVWXwQO/ubglNY8fzpfr4Dv7uHZXYsIUTGA4jv3uX28c
         vaSA==
X-Gm-Message-State: AOAM530vgoiGfomZhqOnmGADnlVf3Y2eKUydq0L1U4fzTVdx2iVDyzNO
	u2XBmTEaNxM0rfwthwq560JIKPi+N4g=
X-Google-Smtp-Source: ABdhPJzzCKU23rIal2318itlHwGU9RbT1V2EG2BLiYTl/XSUM70s4Y1na1/b3nhKdyT8laN/YLlLDQ==
X-Received: by 2002:a17:906:d9cf:: with SMTP id qk15mr9510086ejb.453.1608398957283;
        Sat, 19 Dec 2020 09:29:17 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id v16sm25995447eds.64.2020.12.19.09.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 09:29:16 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] oeqa/ptest: print a warning if ptests failed
Date: Sat, 19 Dec 2020 18:29:08 +0100
Message-Id: <20201219172908.7338-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows spotting ptest regressions without having hard ptest failures
(for that full ptest stability should be achieved).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index a9572c81f0..0800f3c27f 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -108,4 +108,5 @@ class PtestRunnerTest(OERuntimeTestCase):
             failmsg = failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
 
         if failmsg:
+            self.logger.warning("There were failing ptests.")
             self.fail(failmsg)
-- 
2.29.2

