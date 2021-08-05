Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web12.10493.1628177828340610741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pQ6S/kbv;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id bh26so6337074oib.10
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NeDykxTwEIA0QqzZrBKVeFnkHwswprCkFGRV+0BLHN4=;
        b=pQ6S/kbvHGeFBn2Ech/CHXQGDidywo9zIog9FsceJ+6rHzk8EK+as3zQmiTIZqEh3q
         k55TujVpuosm1hOJwUQQ3zLTo+J2PrnMSz5Vg+t5yAyzG6eLrFNH7RH0ftVj6fZ/0VKq
         DqpaUZdocdprUb2RnGNjlyYr1vdhCKGQlJ1SHfOB3Kz/cGe8I5ZRCs+uqX6u5MAdmtsV
         KYhXTtUgwxF3jjgvW5/HZKwxiRGy+sZ1SlFcvAmQ1LlqFh11LgpYxP3qyMq/dY2QnQTV
         hUpRuuVinIRojROntfCkI6uI7gnANCOfVpbZx/KDa3+KVknEG4xBGRTrfZvfdTH/iL6q
         PQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NeDykxTwEIA0QqzZrBKVeFnkHwswprCkFGRV+0BLHN4=;
        b=QQKLti3IDlub5XeujIIipXkBwsBZ/KBaTiKW32Iq0IsixvhCBetq8ED8BO/BTldzNH
         x3N7sQST76ieyvDBcQFjarjf+IPLbhL/CMajxnnJ1hEfh11bPZxRiCo8nprQpvKdZQTg
         3ycotdcuqGzGHTn1zxN8z7RUuFMBasVgZOOI8/ORLFuoF3G/Rb5B5dfUcF71aT2XnnLA
         406JlBJWs1IeyOes7XWgk+jq6YPA9o8M50UrkhLf63Z2YQvTAR34/9ikxDs5XbC1x1dx
         JY01kf0XrTRdsltiVaYvZO1dS3EFMK0BdJvCuiXm3v6ktcucCbVhHcPg7psBNTt4AfA2
         bHWA==
X-Gm-Message-State: AOAM533QnzXoOv0H/0+owHr+ZwIcz4z/Jx6Zq7xzkPgYfPNbE2Lih5Yd
	SBprbQkb3lm9/7udGBS28yR57hS05JzRSK3K
X-Google-Smtp-Source: ABdhPJyB1nRl1jVCs4bWxcxeMPkIjqz4vkWDc56Jcxjr/OEw87U5ksRtxLg3VuEjRqBTn9cFxtX+iw==
X-Received: by 2002:a05:6808:19a:: with SMTP id w26mr3912684oic.144.1628177827264;
        Thu, 05 Aug 2021 08:37:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.37.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:37:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/33] oeqa/runtime/cases: Only disable/enable for current boot
Date: Thu,  5 Aug 2021 05:33:59 -1000
Message-Id: <1d848b939e503df94178822c9ca8bb26d0e75231.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wes Lindauer <wesley.lindauer@gmail.com>

Previously doing a stop/start worked, but using a disable/enable does
not work on a read-only rootfs. Add a --runtime flag to systemctl so
that systemd only modifies the current boot and does not attempt to
write to the filesystem.

This also keeps the test from making a permanent (one could argue
policy) change to the running system being tested. i.e. What if the
image being tested had intentionally disabled the timesyncd service in
preference to using chrony or ntpd? The test shouldn't assume that the
user wants the timesyncd service enabled.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43dd83b6a325589368c980a3f17cab90935aaeb0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/date.py | 4 ++--
 meta/lib/oeqa/runtime/cases/rtc.py  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index fdd2a6ae58..e14322911d 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -13,12 +13,12 @@ class DateTest(OERuntimeTestCase):
     def setUp(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Stopping systemd-timesyncd daemon')
-            self.target.run('systemctl disable --now systemd-timesyncd')
+            self.target.run('systemctl disable --now --runtime systemd-timesyncd')
 
     def tearDown(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Starting systemd-timesyncd daemon')
-            self.target.run('systemctl enable --now systemd-timesyncd')
+            self.target.run('systemctl enable --now --runtime systemd-timesyncd')
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime/cases/rtc.py
index a34c101a9d..c4e6681324 100644
--- a/meta/lib/oeqa/runtime/cases/rtc.py
+++ b/meta/lib/oeqa/runtime/cases/rtc.py
@@ -9,12 +9,12 @@ class RTCTest(OERuntimeTestCase):
     def setUp(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Stopping systemd-timesyncd daemon')
-            self.target.run('systemctl disable --now systemd-timesyncd')
+            self.target.run('systemctl disable --now --runtime systemd-timesyncd')
 
     def tearDown(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Starting systemd-timesyncd daemon')
-            self.target.run('systemctl enable --now systemd-timesyncd')
+            self.target.run('systemctl enable --now --runtime systemd-timesyncd')
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
-- 
2.25.1

