Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7996C43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 11:41:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.60126.1656848480622539610
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 04:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cos8NjhZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id r14so3717883wrg.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 04:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Er/D8YCQdFUfKZUHAyv15V7bjk6/00/6C7YBjeKBmz0=;
        b=cos8NjhZGHaZdUKV0cP00SppAy63Tj7RWMaJIe8hEixErQTqqDOohVeC6jgZ7Nxgxf
         IfVRTJN4F38YMUz2VWHj32MfGPiB1bVppS5vEf9ahciPOsOJ93r6Bc0OysVrcZTGo1GK
         qAKLKNOvJmQimM7gr1svs1JvvZ1hYIJd6+XRusza9ydE2SmdsFS8WdHjqrfEf3ut8xFi
         1dbpj/nIwJECR6bRmPrghEdl6GRMdAQwkQ0rpCC95Fk+TPSWZO9t/pHD97Gx13IxDzQK
         rzM8qHoUkcXyPVLR/+7pfX7sI2VHJTTG1EZMtjvoO2WhhlOVAA1AuQSvBn+ieV8TggtS
         EdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Er/D8YCQdFUfKZUHAyv15V7bjk6/00/6C7YBjeKBmz0=;
        b=zWxoQucEUVuXiLpA6fsOrGQU8JnBM6i/J9YxQeXgzXu0cashYQk1dMiRvqVS6dniA5
         jQh8wVTNnvJ/E9caJ8jWDpAnxqnMP1EMJ0WDJyB1k+uDHFkAIJ9VO316Omm+Q9du1qQg
         Eo2L6gm5snAHqIkTIf1ZAezgYA21opR/Dkyz3n22hc+z2G8SZSGh6m/wbAni4D9tw0sl
         gcmG4mRJK2ETzXZbUoi1Vt7EBjQvCiTUpF+8dPQ2ONNQx0Uciw9FkMLJ5w3fL60GaKfu
         wpV/p+3YOpZ/xIVeZKVxqJXQonYca8U6mrKuwD5DX/Vr7NXaeaqY4NOlMLSE/2E7QlwX
         FlXw==
X-Gm-Message-State: AJIora/dIT6N6S/Lqhd7y2zBti9DhW5U2Uyp+eMSv/6Y9zWG21LTSC8k
	NZYD32xH2+Jw+hnSeiDY6RhxoHnCOQDA
X-Google-Smtp-Source: 
 AGRyM1vNQpuIBnQOi5gEOgasBXWO/uSR2yRwq8xVesY9rxw8ooLxre1k0rHNj5NCWdTGUIvy1Do+Rg==
X-Received: by 2002:a5d:6d07:0:b0:21d:1ee6:16c0 with SMTP id
 e7-20020a5d6d07000000b0021d1ee616c0mr22073471wrq.63.1656848479097;
        Sun, 03 Jul 2022 04:41:19 -0700 (PDT)
Received: from localhost.localdomain (83.11.75.211.ipv4.supernova.orange.pl.
 [83.11.75.211])
        by smtp.gmail.com with ESMTPSA id
 p28-20020a1c545c000000b003a02de5de80sm12413142wmi.4.2022.07.03.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 04:41:18 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 2/3] oeqa/sysroot.py: Check bitbake return status
Date: Sun,  3 Jul 2022 13:41:13 +0200
Message-Id: <20220703114114.2313369-2-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220703114114.2313369-1-ptsneves@gmail.com>
References: <20220703114114.2313369-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 11:41:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167554

bitbake ran but we incorrectly did not assert the exit status needs to
be non 0. Now all sysroot tests commands expected to fail are verified
to do so.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/lib/oeqa/selftest/cases/sysroot.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
index 588fc8c713..294ba4a4a0 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -45,6 +45,7 @@ TESTSTRING:pn-sysroot-test-arch2 = "%s"
         expected = "maximum shebang size exceeded, the maximum size is 128. [shebang-size]"
         res = bitbake("sysroot-shebang-test-native -c populate_sysroot", ignore_status=True)
         self.assertTrue(expected in res.output, msg=res.output)
+        self.assertTrue(res.status != 0)
 
     def test_sysroot_la(self):
         """
@@ -57,10 +58,12 @@ TESTSTRING:pn-sysroot-test-arch2 = "%s"
         res = bitbake("sysroot-la-test -c populate_sysroot", ignore_status=True)
         self.assertTrue(expected in res.output, msg=res.output)
         self.assertTrue('[la]' in res.output, msg=res.output)
+        self.assertTrue(res.status != 0)
 
         res = bitbake("sysroot-la-test-native -c populate_sysroot", ignore_status=True)
         self.assertTrue(expected in res.output, msg=res.output)
         self.assertTrue('[la]' in res.output, msg=res.output)
+        self.assertTrue(res.status != 0)
 
     def test_sysroot_pkgconfig(self):
         """
@@ -73,7 +76,9 @@ TESTSTRING:pn-sysroot-test-arch2 = "%s"
         res = bitbake("sysroot-pc-test -c populate_sysroot", ignore_status=True)
         self.assertTrue('[pkgconfig]' in res.output, msg=res.output)
         self.assertTrue(expected in res.output, msg=res.output)
+        self.assertTrue(res.status != 0)
 
         res = bitbake("sysroot-pc-test-native -c populate_sysroot", ignore_status=True)
         self.assertTrue(expected in res.output, msg=res.output)
         self.assertTrue('[pkgconfig]' in res.output, msg=res.output)
+        self.assertTrue(res.status != 0)
-- 
2.25.1


