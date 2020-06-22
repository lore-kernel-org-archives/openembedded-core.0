Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.379.1592848823007080899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GBwjDPTY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id u23so13796967otq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6Si6pbw70vcnG+jOjAnaEBuTA8yv9ejzAfu2owEpNLg=;
        b=GBwjDPTYr2fRbHv/e42sxslQrN6euEyrcdVE6hlDasHKw832Q9NnKnjwyMquRWj8DH
         /7D+ICBZxnIfW83R9Ce5Y9A1MNlh6AM37IotxUJqvMNVIe2cBmcqOnFVSuMMi324DCR+
         qULaENO69M0Kva+U/6IhFlyueSRLeNWY4sbwjC8Sb16JeABoevi0HC02c3Bety778TPU
         cVXWnxqwBFBkbw+ocpZuf47AEdh5fMfBkHaaT5jZKauORR2cTk6IDN0q8oVcTpf+2lIp
         mnJDyEo4buxjLmiwD/pX9QWVF21IPrHK3oCLA3vHK5uo+qbdAG0oYpbBh682GB0EEL6s
         Ed2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6Si6pbw70vcnG+jOjAnaEBuTA8yv9ejzAfu2owEpNLg=;
        b=uWdP8WKTYSNGUcvJwf+okonEzssWulR7v5RFOxSncz/QgWZCBDYEFrGh7T0fLC6aPf
         xNsWoq/x1FeXhAItNEL4RWWLFxkxU2IYrGK5u/nCP6g7Y5xFIR8grnDf5P4wChVCb5cE
         jGDtRx0DbUxFO+ssnVK+E29qCVOSsR93tr2zUeNUrLBCb58c/ZkF6upLSe2p+geP5hNz
         ayArkNeKoRF9Hv+AvuQkL5j+tjtC53sO2MNY5VYd/772T/oJRvH0zmhZmaHHmEQQIq/m
         4+4V5bt1uCLwT6AAN9rzh8O6vlA8434EFquSGyMN4rLz9qbvm7bAQFvoxFz8JIWrlys2
         mB1w==
X-Gm-Message-State: AOAM532L+NdGvYOgWGEiYwZW10z+nQr8ma08ovdCroumAlwF6mfoJ1x9
	nRKNiwMQ9FDadK40G53zJMQ4+YTovRVfNw==
X-Google-Smtp-Source: ABdhPJz61F4rJZVgHb/FW9dF1A+Zw02y/xzkigzZ0Wuusq5M3Pi7mgv8gCe5XqVzyEJCb1bfkEjpXw==
X-Received: by 2002:a9d:dc6:: with SMTP id 64mr12586119ots.319.1592848821869;
        Mon, 22 Jun 2020 11:00:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.00.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:00:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/33] systemd: Sync systemd-serialgetty@.service with upstream
Date: Mon, 22 Jun 2020 07:58:06 -1000
Message-Id: <e6e2cabc33ab30d38e31ef830f7bc5e3cd07b6d5.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Otavio Salvador <otavio.salvador@gmail.com>

The systemd upstream has been doing some improvements in the service
which were not in sync, with the forked file. Mainly:

 - Use BindsTo to bind the service with the required serial device
 - Add of getty-pre.target as dependency so we can run things before
   getty@.service and serial-getty@.service
 - Add conflicts to rescue to avoid issues with sulogin

We did not change the ExecStart and Environment fields so we don't have
side effects of this change.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63bbff61b78c651339c4b18d8376187379ec3b3c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd-serialgetty/serial-getty@.service      | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 15af16a9f8..542b905795 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -1,3 +1,5 @@
+#  SPDX-License-Identifier: LGPL-2.1+
+#
 #  This file is part of systemd.
 #
 #  systemd is free software; you can redistribute it and/or modify it
@@ -9,9 +11,8 @@
 Description=Serial Getty on %I
 Documentation=man:agetty(8) man:systemd-getty-generator(8)
 Documentation=http://0pointer.de/blog/projects/serial-console.html
-PartOf=dev-%i.device
-ConditionPathExists=/dev/%i
-After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service
+BindsTo=dev-%i.device
+After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service getty-pre.target
 After=rc-local.service
 
 # If additional gettys are spawned during boot then we should make
@@ -20,12 +21,17 @@ After=rc-local.service
 Before=getty.target
 IgnoreOnIsolate=yes
 
+# IgnoreOnIsolate causes issues with sulogin, if someone isolates
+# rescue.target or starts rescue.service from multi-user.target or
+# graphical.target.
+Conflicts=rescue.service
+Before=rescue.service
+
 [Service]
 Environment="TERM=xterm"
 ExecStart=-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM
 Type=idle
 Restart=always
-RestartSec=0
 UtmpIdentifier=%I
 TTYPath=/dev/%I
 TTYReset=yes
-- 
2.17.1

