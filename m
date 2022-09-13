Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9E6C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:19:00 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5130.1663078721050553349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rGiPsQRP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id iw17so12010850plb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=YqW67nW6bTkFGqHQNfcK7tWsIBnLWJR7yEiV43TxJkA=;
        b=rGiPsQRPXuPWvj7gOLn9Aer7mmSlugFdQDFDlKVhc1LPrQAxRcUph1FOaORmTvtH+4
         zNrZsaDnkn8aMersDz4OtmmAo6tZ73hnEqUGHc1rJVIqAFtaqlUULxxQ0L6rWdOP0J8z
         84k8dKTTyuqseCaBCnch7Onqd1Gq6rXT9a8IDyZntEEhNA4u+DFf2GM6ax+NiAT2/JUe
         3kyysRZcmEL52tCOCcMGLw0abGwjKn1VK7sLk/+SzdsuHNW9DHjMFk2IIbLYipbsH8m6
         MdSLr+q66OW+tMRe17rAC0Gx5GSCCXF8AoEbpQUoNI/xprDlH15yjrw1FSwlUZh8bo/D
         uwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YqW67nW6bTkFGqHQNfcK7tWsIBnLWJR7yEiV43TxJkA=;
        b=Q6MwT3VLArFxxZu94su0ECU1ZuzalwrODx1BlnHBYIkx9IxY7RFxFnlxw8LqMS5rXB
         4yn64u/ki0w+1DrM4lxjNnQuKwuefi6dUAUEsw2cokRTAuynjIAhtdKKB6N1xZJg8unU
         5hoCoUNUyXLO8Duw8FnC67C9W92TZAXlJpeuKOnGk+1qswHfsJ/VvrfzN2fIl78/YmXa
         XEoNjgreW/evalATKqOp8V6wdDBGvMFJGlUmHpHrJgHH+SJtqUe+bD3gFOVfS2ydNVpm
         9HSc3yVU1x6qp+ycMDfuZZOzZTaV/DLkf/0mdsGr80PHfnuRjI0J8d0wVHZJkRMU54L4
         7o6A==
X-Gm-Message-State: ACgBeo3OIkjCtfV5s/D3O89cny5Jshtdpn023bVibdAQ4cUZab54Wn0e
	DnNsnPtW5yqzr0q8JVr/HAxULRy1psW25HNA
X-Google-Smtp-Source: 
 AA6agR7avrR7P5p2H8to/2gDFk6vVKW5zf8soDnx/2IuZ7/kErdw2YhaLgNCdRXKNQFRilch0vl9pw==
X-Received: by 2002:a17:90a:e644:b0:200:2f9a:bd0a with SMTP id
 ep4-20020a17090ae64400b002002f9abd0amr4240541pjb.88.1663078729853;
        Tue, 13 Sep 2022 07:18:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/16] runqemu: display host uptime when starting
Date: Tue, 13 Sep 2022 04:17:57 -1000
Message-Id: 
 <08406e03abddc7290c0c2296aa179725a58155d3.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:19:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170595

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

In order to be able to debug issues on the host that have an impact on the
guest, it is useful to get the uptime of the host while starting so we can
match with the events in dmesg. Also include the uptime when cleaning up.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d96499823f7de6e16a461426491e015ba63c1ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 24c4a40b50..1525081ad5 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1500,6 +1500,9 @@ class BaseConfig(object):
         cmd = "%s %s" % (self.qemu_opt, kernel_opts)
         cmds = shlex.split(cmd)
         logger.info('Running %s\n' % cmd)
+        with open('/proc/uptime', 'r') as f:
+            uptime_seconds = f.readline().split()[0]
+        logger.info('Host uptime: %s\n' % uptime_seconds)
         pass_fds = []
         if self.taplock_descriptor:
             pass_fds = [self.taplock_descriptor.fileno()]
@@ -1523,6 +1526,9 @@ class BaseConfig(object):
         signal.signal(signal.SIGTERM, signal.SIG_IGN)
 
         logger.info("Cleaning up")
+        with open('/proc/uptime', 'r') as f:
+            uptime_seconds = f.readline().split()[0]
+        logger.info('Host uptime: %s\n' % uptime_seconds)
         if self.cleantap:
             cmd = ('sudo', self.qemuifdown, self.tap, self.bindir_native)
             logger.debug('Running %s' % str(cmd))
-- 
2.25.1


