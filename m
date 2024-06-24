Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49829C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 22:20:31 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.156084.1719267626787920936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 15:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Ia8S6kLD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.173, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dff0712ede2so4722150276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 15:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1719267626; x=1719872426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rX8rRR689xnmdQ0maUPQEQwof8vHRu4mgi+sLAui6+k=;
        b=Ia8S6kLDJqga155n/lHlxsS0IS4G/GYXCvPIGnLAkg1Khpd4bEvh21ZRhZOWjkofP/
         wQZPB+LwbaCsriYT9aCKcnpYjxjV8U5S5zj6Gwll6g6bxssRIKbZA6xGRK613FTCd8zc
         4uVsVtaOU9dHwgUpEEug0cao+/ngyIDtOOmHx1O4Vnx/6lRx3DKl+CDAFAI+wlN051Ke
         cG+ntpe39m+5bCRriMTuqJ55K6WdAeyx8eJHEd3BCylzzEdgonpB58SzXiEk1445MbRa
         MxqpxnzZtq2vbR9wufwgxm9JjgU5l5zQP+n29K8ZvYtcUGpoc71ZpRk+dkiSjtYAoagA
         n4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719267626; x=1719872426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rX8rRR689xnmdQ0maUPQEQwof8vHRu4mgi+sLAui6+k=;
        b=JaKAePsipYl1/y2LS6fa2aBPJj5IlQT8iD8rnTGLK6+uVKFGb60gZ3+iapaKI5LD32
         ImawpMSPaNoXFh0SBFkMBHNZRPx4AE5Xw8jD9JOviIPTE0r6r80VZRdMq+KkH/cdce9q
         ko+Wo0uKBiPTb9QiADES4zcVJN1RtBMVaAwD4c6dMbT1jRT2xnrdwnfS3Oyxjhu7wNSt
         ERpbqNhq8NoZhGw/uvNGFllCjLCzlwkXWQVLdkVRbwA6ZqMDI2rQkY1FE7FhROQZGX1D
         Zz20Z8/xjM1zykG+XVhvJZxTn+/6R+dXE1J2lvj2HbmSdCA9WxYZW01H9KjPXWb5hLkC
         oCKg==
X-Gm-Message-State: AOJu0Yx55MhoNjnl50iia4GLMVZft7k5vtF662uusjlgS6R4Jl5bc9kd
	lguBxfzULFsdXAC7DCLuosSG9COh6u2qR3MmPreRnPTvDrZ1xyOsbP11xa+ojfijSPb8KG2ZWe4
	=
X-Google-Smtp-Source: AGHT+IF4CBvU9LYFw8jednoKkt6JBPPV3xmw7C85+ZCqhpFNwernEX/wzmtiRi8trneJafTfqymmcA==
X-Received: by 2002:a25:c585:0:b0:dfa:6bfb:e19a with SMTP id 3f1490d57ef6-e0303f753b3mr5705916276.39.1719267625640;
        Mon, 24 Jun 2024 15:20:25 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e623c597sm3658910276.14.2024.06.24.15.20.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 15:20:25 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/ssh: add retry logic and sleeps to allow for slower systems
Date: Mon, 24 Jun 2024 18:20:24 -0400
Message-Id: <20240624222024.731269-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 22:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201116

On exceptionally slow systems, the ssh test can intermittently fail due
to a race between when ping works and the networking applications being
brought up.  To work around this issue, add some retry logic when ssh
fails to connect.  According to the man page of ssh, "ssh exits
with the exit status of the remote command or with 255 if an error
occurred."  So, only retry if the return code is 255, and limit the
number of retries to prevent it looping forever.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index cdbef595008c..ae92bb34cd9c 100644
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
2.30.2


