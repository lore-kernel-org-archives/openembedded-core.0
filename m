Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21ADC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 20:32:02 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.4208.1720125118411362700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 13:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ZPQhCQJT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.171, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6519528f44fso9979577b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720125117; x=1720729917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6POZl7987jdLCz/Ob9UFGgOUy9DZ4db2yi2qWIL8URE=;
        b=ZPQhCQJTnXj+d8lVSrVsqyEQUPckCQbCEL5n651LtFnx1j9K02ol4psLFMf3PgwnZy
         MsZgg9u9CYOwlWxFn6fCDktorgL9IbtKivlG9LflBUfpZ2qlnD6Go0ouucXXN04UQAXt
         nbbRpMLytOKPxrx6zZ8puX92wcbYNetx7zwFJELoFLiLtuDCAAf0gVI4y6O8EVpAeQ8t
         q6vPYoptGjoHo5crFaaS/qLFIzYEPex4jHKr7tDxhd06F7pFKyqJhzL4+rMhW/gJ2aMd
         ybZNQfQSTROfZ/yzL4V44OYy1uUDZ5p7H8jkQK+WX9ku+SmsX5+iNoaorZjCUWHPHXjP
         Q1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720125117; x=1720729917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6POZl7987jdLCz/Ob9UFGgOUy9DZ4db2yi2qWIL8URE=;
        b=fXZ0ruOUsTG+0hIz1w32tbuFdlaaQfxwNvZirkXRArVEP6YGQegoEfJ+1PFC5k+C9U
         aFgIGqi/+4jXNwlRDmug+twK2mkA4UJC3yogyMP5E7YWLWMI2OAHHKFn2LbDbeKtCZ+W
         fRpiVWMnSjbSh9NiRph7SBTCTmc82uqoAwIJ+L7QxXlLewTd635Q/QjON860e2uPQsNU
         ablMPSXrytBURAmP7qId+VcMhDznEEq0dBMR5Mzyd2FTC4xRr/jqkMetj2I/2Xvk2//K
         Bj3aNDV+DbA7OoZZOHiA9D0hcMQ99d5rRrRxExMUfUCRIdveCZ9ga4jPfn+br+NgllRN
         ygJg==
X-Gm-Message-State: AOJu0YyqzSLJ+T/thlBhicMSvk4vdnHyD57SDL8oM6wjwpNn2wQVQ22b
	YqHG0n8EeLpNx+kr7waHy0Ip7Jpuzb9uE33dVbyAp5x/Dde374UFissiGrcq25xji68hwP6Wmqc
	=
X-Google-Smtp-Source: AGHT+IFnkUZrtAjfRjKPBWOzyzu/VOf1NEyu1cvMhyzYxLMa1IEIdi/nFs/3eP5jXn7JXcXjiZR6gw==
X-Received: by 2002:a05:690c:6ac2:b0:63b:aaf1:b8c1 with SMTP id 00721157ae682-652da44de9dmr34388087b3.37.1720125117036;
        Thu, 04 Jul 2024 13:31:57 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-653daec2007sm477407b3.26.2024.07.04.13.31.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 13:31:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/ssh: check for all errors at the end
Date: Thu,  4 Jul 2024 16:31:56 -0400
Message-Id: <20240704203156.990243-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 20:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201587

With the retry for the -SIGTERM, it is possible to still see that error
after the 5th attempt and mark the run a success.  Check for any
non-zero status in the final check and error out to close the gap.
While there, make the error print match the one above and be a little
more verbose.  Also, I'm seeing it take roughly 6 attempts on my local
(very slow) system to pass.  So, increasing the number of attempts to
10.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 9a8deb3f25ea..08430ae9dbb0 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -16,7 +16,7 @@ class SSHTest(OERuntimeTestCase):
     @OETestDepends(['ping.PingTest.test_ping'])
     @OEHasPackage(['dropbear', 'openssh-sshd'])
     def test_ssh(self):
-        for i in range(5):
+        for i in range(10):
           status, output = self.target.run("uname -a", timeout=5)
           if status == 0:
               break
@@ -33,5 +33,5 @@ class SSHTest(OERuntimeTestCase):
               continue
           else:
               self.fail("uname failed with \"%s\" (exit code %s)" % (output, status))
-        if status == 255:
-            self.fail("ssh error %s" %output)
+        if status != 0:
+            self.fail("ssh failed with \"%s\" (exit code %s)" % (output, status))
-- 
2.30.2


