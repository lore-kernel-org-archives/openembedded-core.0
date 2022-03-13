Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFC7C433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 12:23:47 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.14609.1647174226855805633
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 05:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F5257S40;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id x15so19730974wru.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 05:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VfX1NhN7IZosFiUfYrvj3Xu7ETV6DSbk5xpnR56fSfQ=;
        b=F5257S40Z/hlskB5PwRjJ5NtG0NaWdtrm1M+GMCXS1DeqmRBS4skhoArFeHU1MGSLB
         kFKl0eIcQfxNcOvf8rbsnVeQw8yDY5W7TRBuKZHUsOUlc9Ev7UXGrCErJatPr1DfTd6t
         EVILZrDzDIT2+h/FQC9CUQVdGsw2SS0Y3xUO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VfX1NhN7IZosFiUfYrvj3Xu7ETV6DSbk5xpnR56fSfQ=;
        b=GoMXPu23zr+L3DL1ey8r84ixNzsETf8pMyiJU9L3L1rcBBoeRc7iUZi03y5enXn80z
         MIcW5eTum7ik3d4p00gOkFh3BT6gXJUreN+HBmHh4MxFTNKqI9CDaE7Oi/2kBbWHHOnw
         iAr9Xa5MF7pIjYaCMCvsA24ZFN3pAilY2oDC3tkaj5e1Ovp7SFhIDkIUHLGy2ovX2v1P
         5bqpHd6msLm9DSdylczcgWRzBSMWKBw/+JcxtTCf9Eve9pV74tqr9Yi52Wo479dWZj11
         gq9uw4UryFctxn/1uTBYflTR3OTQ8FyxYMhcweftNcmtls6YHSwG2OLmHwwGtMpNYaMO
         E8dw==
X-Gm-Message-State: AOAM533A4MNxBVK3XGH4X2TFvznfKN4gAR53Gz+m4oUWDq2GLAT3RzIW
	bF4pzlytwIk4bq/W59is67JGQjutuyrVG0xU
X-Google-Smtp-Source: 
 ABdhPJysMIvdm6Q1yc0UUpbIkRW0Jn4OLxDGuxBEwj9GE2HZvq7e/Bk6kBCd31Z0oWLUFDcZuthCBg==
X-Received: by 2002:a5d:4578:0:b0:1ed:bf30:40f3 with SMTP id
 a24-20020a5d4578000000b001edbf3040f3mr13385852wrc.669.1647174224791;
        Sun, 13 Mar 2022 05:23:44 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:cbdf:7d09:95e7:c814])
        by smtp.gmail.com with ESMTPSA id
 i5-20020a1c3b05000000b00382871cf734sm15830135wma.25.2022.03.13.05.23.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 05:23:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/ping: Improve failure message to include more
 detail
Date: Sun, 13 Mar 2022 12:23:43 +0000
Message-Id: <20220313122343.757505-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Mar 2022 12:23:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163105

When the ping test fails due to a timeout we only get limited debug
information. Tweak the code to improve that in case it sheds any light
on intermittent failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ping.py | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index f6603f75ec7..498f80d0a50 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -6,6 +6,7 @@ from subprocess import Popen, PIPE
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.oetimeout import OETimeout
+from oeqa.core.exception import OEQATimeoutError
 
 class PingTest(OERuntimeTestCase):
 
@@ -13,14 +14,17 @@ class PingTest(OERuntimeTestCase):
     def test_ping(self):
         output = ''
         count = 0
-        while count < 5:
-            cmd = 'ping -c 1 %s' % self.target.ip
-            proc = Popen(cmd, shell=True, stdout=PIPE)
-            output += proc.communicate()[0].decode('utf-8')
-            if proc.poll() == 0:
-                count += 1
-            else:
-                count = 0
+        try:
+            while count < 5:
+                cmd = 'ping -c 1 %s' % self.target.ip
+                proc = Popen(cmd, shell=True, stdout=PIPE)
+                output += proc.communicate()[0].decode('utf-8')
+                if proc.poll() == 0:
+                    count += 1
+                else:
+                    count = 0
+        except OEQATimeoutError:
+            self.fail("Ping timeout error for address %s, count %s, output: %s" % (self.target.ip, count, output))
         msg = ('Expected 5 consecutive, got %d.\n'
                'ping output is:\n%s' % (count,output))
         self.assertEqual(count, 5, msg = msg)
-- 
2.32.0


