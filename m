Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205C6C77B62
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:14 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.44014.1679494925735959334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EP3EJFl4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id ix20so19431039plb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+B1gD+Sh/fg2rPiMhpZdiPD2kpVE6XpJGflnaSX0oU=;
        b=EP3EJFl4/ELxS7kfgq4HfI88QEMbpxm91nFIoAX2a+vOeUmLSlL9q7DZBhg8gUQLw4
         D6Z6TLygBvDhGva4Uc0LGiKs6cbkuLCvoUtMUyxt9cewhidc4HMQs8FdBrZol0Zvj3va
         SBYrKJKr2/rGIZKrod3IbpJEAvbo9i39ntyItIMS2X+R95FH/gl9Yhpg7u5ovVqSapEy
         rbdzGq9JnTRwJ4s2dSpAoQNv0LTe3sKp2XUhtMcz/IYTWQXwf6h8fDQouk26+XeOnSVz
         AqvVCVVnSTLe9Q0PwADl+lEbOEDrQVwV7mO7k/nCUTdn9h6wrZV4RLl+ixwYtM3DQZPQ
         nL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+B1gD+Sh/fg2rPiMhpZdiPD2kpVE6XpJGflnaSX0oU=;
        b=jE6DYviECJH096Nn10y1D83LoLxe6ccHHKL8b8ZhCSVKRSGNEQMHCdFJ3wyK/xdRod
         e29y75oX4r7xa5fhNatpssMeOsuXqf90WRWRpBauBYz3FK0hlYfUBOwhEOtaI7LqRIx6
         M47HPsSl0bi8nQRS90a6UghfXbu9O7brspF1NWFnTQFJmDNxx+FaI2M/sL6tYgN6dsy0
         2C2Z0Avn/fRW+jyg9wuAKugso7UzpSmqu9HLJFJAcGoFJzCPFx3WztEm8NJsmvf78/b7
         mgVi9sYjJEhqEi4w7iPEqLalS0aCTXBhAZVom5VTAtuS+FcsnS0kt9IuyMo4JiHkO6nk
         ciXQ==
X-Gm-Message-State: AO0yUKUQyyjHbvdaSQy3XqYj7H6qtpVDLd/pSMdNHlZwEBnwnLbdOY0+
	EWcvMn8VHADWgM/emnk1uzj35eYCB/+ngHbuOAw=
X-Google-Smtp-Source: AK7set8dWzBEv62ojApF8CkEaSLhOyMd35khk1Y7gjneVdYO1Rl3gCa6ALZJi7o6zRpjErTwy6i4lA==
X-Received: by 2002:a05:6a20:1a91:b0:d6:b44e:f644 with SMTP id ci17-20020a056a201a9100b000d6b44ef644mr5219991pzb.59.1679494924809;
        Wed, 22 Mar 2023 07:22:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/21] oeqa rtc.py: skip if read-only-rootfs
Date: Wed, 22 Mar 2023 04:21:28 -1000
Message-Id: <0bb93dce6abdaf09d73d2f9f71781ca20d111601.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178934

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
index b2159b1134..6e45c5db4f 100644
--- a/meta/lib/oeqa/runtime/cases/rtc.py
+++ b/meta/lib/oeqa/runtime/cases/rtc.py
@@ -5,6 +5,7 @@
 #
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
 import re
@@ -21,12 +22,14 @@ class RTCTest(OERuntimeTestCase):
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
 
@@ -37,7 +40,6 @@ class RTCTest(OERuntimeTestCase):
 
         (status, output) = self.target.run('date %s' % current_datetime)
         self.assertEqual(status, 0, msg='Failed to reset system date & time, output: %s' % output)
-        
+
         (status, output) = self.target.run('hwclock -w')
         self.assertEqual(status, 0, msg='Failed to reset RTC time, output: %s' % output)
-        
-- 
2.34.1


