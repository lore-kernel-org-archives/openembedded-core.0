Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.1509.1588648844030138188
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DV3ZwIo7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.194, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f194.google.com with SMTP id o18so401439pgg.8
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=dzVhuE2fu5RjdBfDzAWG/jvrD0ZaXleYhXHZ2s8gPlc=;
        b=DV3ZwIo7TLmyOCiwTWbv4hgsGuL3BjkIAMiO/imCle+BPDI+xTCuGgyFokA7v8Fc84
         tcZ4l3hm82gPdrJeXQ+13TjyERGkj6mypzOxkHSbQiU5j++ub++szc5GshZGlw+ClrhI
         UMCrA/aG+QQ3EizQZr4M0Bkq83KsYJb++0bsMZ0Wxiu59YuDWzAiDR1owsbA6BBHPetk
         Zt+bYz+7B3eHgfNnQ7xbHmPRjRTqyBqKZv2jmnsoP2Mr6LveFEbKBd2sHjCkscnoGVYJ
         KfzEENVGOP7QzDyQ+yrMPXifu+ifAkF61WdJyNn8O6R6AHqO/0al4MXz0rB+BvLQ9i2+
         63NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=dzVhuE2fu5RjdBfDzAWG/jvrD0ZaXleYhXHZ2s8gPlc=;
        b=d/qIlwJY71JPJfaTzWMHdmq3a+RHnjzkXBaL3QKB1mwxdIoDm33QObLNYLYYcnfZHt
         DMGpG3Jha/t1tBlJyTyrU3aTOnFPiOntuNy0woVILewENqpFaPxA9tCtdl9WYOSjZT1v
         d50vQQ+PoknK0WDTE592siZ0Bmgo1F3njcP+zL7Ns0ievPTWkrTYuYG9G/9gvTJwdU7k
         m1IdYJvYrYr9LWw1qbGZcphCx4cPkfTzyx31vg9vgpaB8Fhs3oVhqtMYraW6kP4lYkvx
         o7bP74Z5rxEUF9X7DGhr3QqPvHV3G10884X4mF6QGOUh2cf2oblCj1SaNpnWv2DwJHh0
         BrGQ==
X-Gm-Message-State: AGi0Pub1A4X+AAlCFIOGQKD8mUT2fQBvtPQvxP+WapE2++ZEGFTSnc0A
	lOyNZKMlG1Glv+d0nXv0IClpBgHxrM+mIg==
X-Google-Smtp-Source: APiQypKbj4mi0TH5+0NjuvHVh7bL3JFgkrj0VEAfe0IibY0S0fzNNR9IMyLv9A6VrvzUjz4UoKFRQA==
X-Received: by 2002:a62:6341:: with SMTP id x62mr1156478pfb.289.1588648842929;
        Mon, 04 May 2020 20:20:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/28] run-postinsts: Set RemainAfterExit on systemd unit
Date: Mon,  4 May 2020 17:19:10 -1000
Message-Id: <6e78fd580a8c6ed9d886b8431974baf6c988831c.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Alex Kiernan <alex.kiernan@gmail.com>

run-postinsts is only expected to run once, but during startup, but if
any dependency is pulled into a transaction, even once it has been
marked disabled, then it can be restarted.

This leads to occasional failures during QA if an ssh session starts
whilst the existing transaction is still running:

  Finished Run pending postinsts.
  run-postinsts.service: Succeeded.
  Condition check resulted in Commit a transient machine-id on disk being skipped.
  Condition check resulted in Bind mount volatile /srv being skipped.
  Condition check resulted in Bind mount volatile /var/spool being skipped.
  Condition check resulted in Bind mount volatile /var/lib being skipped.
  Condition check resulted in Bind mount volatile /var/cache being skipped.
  Condition check resulted in Platform Persistent Storage Archival being skipped.
  Condition check resulted in Rebuild Hardware Database being skipped.
  Starting Run pending postinsts...
  Condition check resulted in Kernel Configuration File System being skipped.
  Condition check resulted in FUSE Control File System being skipped.
  Condition check resulted in Load Kernel Modules being skipped.
  Condition check resulted in File System Check on Root Device being skipped.
  Condition check resulted in Huge Pages File System being skipped.
  Condition check resulted in Journal Audit Socket being skipped.
  dropbear@125-192.168.7.2:22-192.168.7.1:44226.service: Succeeded.
  Condition check resulted in Platform Persistent Storage Archival being skipped.
  Started SSH Per-Connection Server (192.168.7.1:44226).
  dropbear@124-192.168.7.2:22-192.168.7.1:44224.service: Succeeded.
  Started SSH Per-Connection Server (192.168.7.1:44224).
  Condition check resulted in Commit a transient machine-id on disk being skipped.
  Condition check resulted in Bind mount volatile /srv being skipped.
  Condition check resulted in Bind mount volatile /var/spool being skipped.
  Condition check resulted in Bind mount volatile /var/lib being skipped.
  Condition check resulted in Bind mount volatile /var/cache being skipped.
  Condition check resulted in Platform Persistent Storage Archival being skipped.
  Condition check resulted in Rebuild Hardware Database being skipped.
  Failed to start Run pending postinsts.
  run-postinsts.service: Failed with result 'start-limit-hit'.
  run-postinsts.service: Start request repeated too quickly.

Setting RemainAfterExit ensures that the unit remains active and is not
gratuitously restarted, unless done so explicitly using systemctl
restart.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
index d42addf510..7f72f3388a 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -8,7 +8,7 @@ Before=sysinit.target
 Type=oneshot
 ExecStart=#SBINDIR#/run-postinsts
 ExecStartPost=#BASE_BINDIR#/systemctl --no-reload disable run-postinsts.service
-RemainAfterExit=No
+RemainAfterExit=yes
 TimeoutSec=0
 
 [Install]
-- 
2.17.1

