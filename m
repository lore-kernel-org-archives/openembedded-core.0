Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67537C74A5B
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:12 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.85119.1679605497680833124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aPVTwPoj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so3197258pjp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGJW2H9GpGQXSkEhHST/lRI0OQGQ1w72JYxD069+9Xw=;
        b=aPVTwPoj0n33zcd0gxIC7jkxQixVTK96lxor0raAm5cT+P3Kx3cBQiDYjVLK947Lgz
         L4AerbjEIVY2k8h47TIQggzXxZIERtNhCukwvj+Ku8siVcx+dN8dLNvhyz0tZ2faiehr
         FgSKg0zicgzftZrpkclAmOGYkQxbbOQudoQ0Yiwmdq535uaU3QyYytC/MgZzjMymdpTB
         Qfn1gjFBPW6N8o7AyCymWj/jqMEKyCIi8GQV7tjEc6rHfK//I23Lo8HjTEVta0peP9aH
         SKdgWqSLPh3xOz91vJhz8upCybHibt5oUcgeh8VJdo3rqsjiVNsifjxgvbqtp8QFw0x0
         ELsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGJW2H9GpGQXSkEhHST/lRI0OQGQ1w72JYxD069+9Xw=;
        b=19Naa4O7Isj+fuvQkQPF2z5XnX4eikNIZpuSzky1anZVx2Br2NJ3GAvIk2uqWn/JzU
         e6xqF7P7IzJk502U4Xy+MpfGm4ua+cD2kuLzvGxnXmeQJIg9+mrJzNkbY6YD9ojZsD8a
         zT9wjLUIerxpUIQecGjrCaHMKgtx/d1haqJP71jbl2Poay+hdNatLBcXDPEJa4zHvt5e
         lpOLnbEaZ2OsVDCH/5qjMXulOQhv0l69Y4/VWFoNMeqlmr01cvkWmWRaov1AWEPaDHjP
         /oneN4Vydvh1fnV25AQTrKUs3PplEr48FCkmPLoibN9pmndoYWtmAVmUIwjjldlrPgt0
         OumA==
X-Gm-Message-State: AAQBX9ehBceXMJFtWvXQbtUWeoZ4ZK3eYT3adnUX1APFxA4ppWpPwUHd
	OZGa3tWfOInLEPyYrGmJ87SDjMRkexlrSnxPpqY=
X-Google-Smtp-Source: AKy350aPmELibyjOHmwgLA+EhQ405rk5qEydcAeJ5ejeudJXNr83XrJPWFUKPLuQy1N8MjIUm0S8Rw==
X-Received: by 2002:a17:902:f114:b0:1a1:cb55:cebd with SMTP id e20-20020a170902f11400b001a1cb55cebdmr160493plb.39.1679605505857;
        Thu, 23 Mar 2023 14:05:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.05.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:05:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/14] oeqa rtc.py: skip if read-only-rootfs
Date: Thu, 23 Mar 2023 11:04:35 -1000
Message-Id: <b89abb0f4cc28c45a62c524a3e2f96795235e214.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179001

From: Mikko Rapeli <mikko.rapeli@linaro.org>

hwclock command fails on read-only-rootfs:

AssertionError: 1 != 0 : Failed to reset RTC time, output: hwclock: cannot open /etc/adjtime: Read-only file system

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 017bf8c160f6ab67d9f8e8d9e30b15bf84f73807)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/rtc.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime/cases/rtc.py
index c4e6681324..39f4d29f23 100644
--- a/meta/lib/oeqa/runtime/cases/rtc.py
+++ b/meta/lib/oeqa/runtime/cases/rtc.py
@@ -1,5 +1,6 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
 import re
@@ -16,12 +17,14 @@ class RTCTest(OERuntimeTestCase):
             self.logger.debug('Starting systemd-timesyncd daemon')
             self.target.run('systemctl enable --now --runtime systemd-timesyncd')
 
+    @skipIfFeature('read-only-rootfs',
+                   'Test does not work with read-only-rootfs in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
     def test_rtc(self):
         (status, output) = self.target.run('hwclock -r')
         self.assertEqual(status, 0, msg='Failed to get RTC time, output: %s' % output)
-        
+
         (status, current_datetime) = self.target.run('date +"%m%d%H%M%Y"')
         self.assertEqual(status, 0, msg='Failed to get system current date & time, output: %s' % current_datetime)
 
@@ -32,7 +35,6 @@ class RTCTest(OERuntimeTestCase):
 
         (status, output) = self.target.run('date %s' % current_datetime)
         self.assertEqual(status, 0, msg='Failed to reset system date & time, output: %s' % output)
-        
+
         (status, output) = self.target.run('hwclock -w')
         self.assertEqual(status, 0, msg='Failed to reset RTC time, output: %s' % output)
-        
-- 
2.34.1


