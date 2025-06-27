Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18FEC7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 06:30:24 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.7430.1751005822916443378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 23:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IsnjKZdn;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1982568e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 23:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751005821; x=1751610621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGX7aBTodn4tM0BxeNUBBSkrMZkvtvc4gsXkcD+8oq8=;
        b=IsnjKZdnLp9cS082FYD3Ec/QM1lwQLM8refxNZ7jnG5OLthVLqrvOoYrhZFxLsqgPM
         g5/SjF/+ajf+ab9wsi2NYW6pttwM4hEoN4EAPUG6+ri61AYNDUwUPA6dvGEj2BbgyAQH
         dx46OOa7Bgz+r8VUF/WR750V9yY8WHvvBZlSRNzc7SBoukc8j9BpjdQl5AZ60hCzu2ko
         ERtAmGgEB4ErB4taBi5i94jB2IPFGY6ir++66A1JJ4jYpJJ3njJlo9RSJcWBfWHhwNUG
         ogAxBTLmKZqHNwHPFX4RRATifNn0B1kcFBkNHVHgmTd1mey85UtNHuC+nsk3oYlGtraj
         vgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005821; x=1751610621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGX7aBTodn4tM0BxeNUBBSkrMZkvtvc4gsXkcD+8oq8=;
        b=YWkSad13J9cdZIhvM5jVofMCtBe1z5Fm0DqSvhn+Eq+E5j6JcinXkpHFSdVf/8coKt
         538xkwCA50muf2JgK8a0ujsEJJSZk1Kxg7bYEI6C0fwvV0sUxI4ULbfE6OlhqIPONq3Y
         UBipH4VUZ/yDhQP56E5X8M8x1fzs6UCaSgTp8GxG0JkcZQZFmw4LCRq4oRmasmBJLgzG
         41FNNNwPOfcqzyMjfzMfDXm8R0/M5HvZiBJCwq67XTbQT69leKjPmQueVboskWv54svb
         Txi9sZkf/5WfqGQ17KmmICNePV+q343hzDvhubqe6FKxe0cq3hhrfeh9VZc/oIyq9hPg
         G8Pg==
X-Gm-Message-State: AOJu0Yx+1C0kTxNv7YE9PcrXOJCmGOUAISncFCumyCS5wAbPJ2LKDb4y
	YcH42Hu9rKfM6YwpCAOJ+Oie32MVouivG02aN9zEMzFeOevoE+CpjEIVXFLORn2gTVcx9wLzS1q
	liwS3a54=
X-Gm-Gg: ASbGnctlB9zlZuAehjzdBROgiz7mTe3a2U3M14nvL0BwwK57Hdr4Hty0p814X0EBgC6
	lFtXJbEiqn0+UrzTK9oFVVplCSvR4E2beNqKlyfp2nI0tHDVFTbkJQIVsIrEjMBazpHAHjMNp60
	l212j2TG9WvzvgP8HCpKUHMZS8MrWejxRJEdFd6yEhvd+rikrGa26vgKvn+P1nHEzajHYc4DOfu
	AXp6AS8RpGYMGVVCixB1NZJIMpcUY6P7liYaH+NX07ZXckIGmy8eg7J5O6Q8gzPMi5gBPFAKsV6
	P5kdUOZUSZJeJA8l9qzUwIMmxWZELMPWs5fA1K2+tWuRsgyCfQkvFIHclULXb78TMps+D87DvJj
	Nb12Rti/UtAJRZgwJaKxIdl6C6pMixApqaMTAeoY=
X-Google-Smtp-Source: AGHT+IGnQnpvTvrhaLEgAW5jGnOuvBYWbNukQ54W2xnlm7xe0g4YDms+pS7VML9IZ0DE0FXL1UZ3WA==
X-Received: by 2002:a05:6512:114e:b0:553:2e42:fffb with SMTP id 2adb3069b0e04-5550b88cd34mr783765e87.33.1751005820869;
        Thu, 26 Jun 2025 23:30:20 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a740csm318916e87.89.2025.06.26.23.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:30:20 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/6] oeqa runtime ping.py: make run_network_serialdebug() specific to qemu
Date: Fri, 27 Jun 2025 09:29:59 +0300
Message-ID: <20250627063004.781560-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219377

Only qemu runner supports self.targets.runner. ssh runner does not
define this and on error path this function causes another exception.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/runtime/cases/ping.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index efb91d4cc9da..515d376602bd 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -10,6 +10,7 @@ from time import sleep
 from oeqa.runtime.case import OERuntimeTestCase, run_network_serialdebug
 from oeqa.core.decorator.oetimeout import OETimeout
 from oeqa.core.exception import OEQATimeoutError
+from oeqa.core.target.qemu import OEQemuTarget
 
 class PingTest(OERuntimeTestCase):
 
@@ -36,7 +37,8 @@ class PingTest(OERuntimeTestCase):
                     count = 0
                     sleep(1)
         except OEQATimeoutError:
-            run_network_serialdebug(self.target.runner)
+            if isinstance(self.target, OEQemuTarget):
+                run_network_serialdebug(self.target.runner)
             self.fail("Ping timeout error for address %s, count %s, output: %s" % (self.target.ip, count, output))
         msg = ('Expected 5 consecutive, got %d.\n'
                'ping output is:\n%s' % (count,output))
-- 
2.43.0


