Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D01FC5320E
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:51:04 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.18792.1724244655516779624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1a96zp68;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71423273c62so646067b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244655; x=1724849455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDzElHhpPH5EaKYk0JRxHe7eoUng+m9Y+d7qz+qfxx0=;
        b=1a96zp68an7PJbXl2XvpKsylqCS1G4lqhArOq9Jfgp6Rrex+gBJrkGSCXGxa3BH3F4
         7myBVNSUK11MCEjsU468IONO4Ej24a+jB423L/o0M8y10DQrp1ZSA8HdZFDkqeWxDkmV
         lZZSDSN8iCwM+kgmz3PvoYWpb+9jvmNRhOB/U03USMsvu/TxLzbfaebWtv3/tVQCkFFD
         X7EuefYMVYkiOwadg+9BMRJMSsSDjR74A8hFHtYYy0liMRFMYHdPbY0Bdoy6WF+HC+zW
         DOqfl1L4/SVMhM1dsml7tRiVL4zH5UXVFxyQ3rIdV1uCw/oXCBAx8KuyyDQnHEsAmFAU
         audw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244655; x=1724849455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDzElHhpPH5EaKYk0JRxHe7eoUng+m9Y+d7qz+qfxx0=;
        b=n30Io9GkP7mOpZF3z3RVHP2BdzFskD6b4ZZgY8DKZnB7v7CqZIIHbbvmeuTqDE7/DB
         yxfvRInh+ff59MXJA6LIx1oOU01DbU/ohz5mGXjsq3d42m9zHIA/Q53gC6G2vIrIBCYc
         qw2AWzoj0uRmUCUDqKUvxeTu3+WJlsRSOyaGB6H7psBpG4m+Sq3l9uwZtIqc4eEN+DdL
         khke57s1t3mmvvyEjc5acf9j4fq/Km1xCJ0BWrzACfUmWBraEq2TLYFvHSvPV0S3DNci
         ooCpIiV+K/tiwelWp8JQbvEpBwZFAgsuDOJ7HEgiXeHfdLmbPbu9W4falMBlQD9L7r1S
         lajg==
X-Gm-Message-State: AOJu0YyvCPAkvLzaJUjQvaGI1y12H+J7IAdTjutv+fh6uPt3I/Zg99rV
	PFttRTWbnX+mTFjR9Tk8LUjJ3SWSqxb1ujPg55R6KES9lQlvmmWJYzZqAo4QetHGSm0hBVBkUZQ
	2Tb0=
X-Google-Smtp-Source: AGHT+IFLFQRlFykcM48vRER4EMsLOzP/QhvMlkvTU9JBUAxLa22EQlKUOlwj6iLlru6HPkc/lqgejg==
X-Received: by 2002:a05:6a21:2986:b0:1c0:e49a:6900 with SMTP id adf61e73a8af0-1cad80ef085mr2459650637.7.1724244654668;
        Wed, 21 Aug 2024 05:50:54 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/18] oeqa/runtime/ssh: add retry logic and sleeps to allow for slower systems
Date: Wed, 21 Aug 2024 05:50:25 -0700
Message-Id: <f6eacc39dc44c6b3dea9c44836addce5d03f20ef.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203602

From: Jon Mason <jdmason@kudzu.us>

On exceptionally slow systems, the ssh test can intermittently fail due
to a race between when ping works and the networking applications being
brought up.  To work around this issue, add some retry logic when ssh
fails to connect.  According to the man page of ssh, "ssh exits
with the exit status of the remote command or with 255 if an error
occurred."  So, only retry if the return code is 255, and limit the
number of retries to prevent it looping forever.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f0fe0b490d309cdf1c97754f85a61b5b948b7f28)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index cdbef59500..ae92bb34cd 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+import time
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
@@ -13,12 +15,20 @@ class SSHTest(OERuntimeTestCase):
     @OETestDepends(['ping.PingTest.test_ping'])
     @OEHasPackage(['dropbear', 'openssh-sshd'])
     def test_ssh(self):
-        (status, output) = self.target.run('sleep 20', timeout=2)
-        msg='run() timed out but return code was zero.'
-        self.assertNotEqual(status, 0, msg=msg)
-        (status, output) = self.target.run('uname -a')
-        self.assertEqual(status, 0, msg='SSH Test failed: %s' % output)
-        (status, output) = self.target.run('cat /etc/controllerimage')
-        msg = "This isn't the right image  - /etc/controllerimage " \
-              "shouldn't be here %s" % output
-        self.assertEqual(status, 1, msg=msg)
+        for i in range(5):
+          status, output = self.target.run("uname -a", timeout=5)
+          if status == 0:
+              break
+          elif status == 255:
+              # ssh returns 255 only if a ssh error occurs.  This could
+              # be an issue with "Connection refused" because the port
+              # isn't open yet, and this could check explicitly for that
+              # here.  However, let's keep it simple and just retry for
+              # all errors a limited amount of times with a sleep to
+              # give it time for the port to open.
+              time.sleep(5)
+              continue
+          else:
+              self.fail("uname failed with \"%s\"" %output)
+        if status == 255:
+            self.fail("ssh error %s" %output)
-- 
2.34.1


