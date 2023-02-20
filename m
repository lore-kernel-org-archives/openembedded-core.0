Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B880BC636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:52 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.28072.1676931649220526811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oOusrame;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id e5so4042428plg.8
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXQ2CWnD1RjRbvXlgFpTkYk4PMmsSo3O/ylMc49sPnE=;
        b=oOusrameUO7AHYoT4pxHqDW+QEq3ut3c7lIXx2gY4gLhQQCA7C4bQupnpORF0qXPZt
         cJu2P6lXZimG4isrg41tFzrEeVv/ivG8gUxCuRHst8Xk8L6W5kx3BIoZehdEEQmwEQAW
         9HVR9r7jI5MMbn+lNEwDhDFdEt0dlFlGVzJHzMWS3EZ9mC3fAO83lXkai3B3YKmMH0vT
         4cCZmv1JAPAHOqlt/eGMUuYs8cNskHIy5InS14czHTELzkxXCGPyxboTbh7GFLoBVRCY
         BnJ0qyU6bLWWIC553n9hWJD3xOMU0C2bCfwaXWScYAQkEK3JY7wd1U0FSzg1fQYom69/
         PxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXQ2CWnD1RjRbvXlgFpTkYk4PMmsSo3O/ylMc49sPnE=;
        b=EktyU+1ea32VvCby5B0IfOIKK4Wnf3daYIoF7av1B6WbZJ7THXITgh0e9EZH/qtmnK
         Wk3apWa9WcaVY3UNnLe0bdzwdgDsNAorX8JXZyYrj9kJWI87gAWWvYVMG7B4lUYyuxuY
         At80luOb3NY3M/LUZneil7qwIz3TNizTY/fYL+p/DCl/MFwcyQ7zqRP/5xH1G4hfgvel
         RSpEp3cM40KuWZyL+UoZmoqZf2lN1t75on060BrMUuXzylBxjSM9NNegQGBLqH/Gmx0n
         buvB5NiZPFm67pm5Y23nMcQTFKU4vHlwODdTjqPrtzx8ThCBDsyRh9rrKZ12tccIxeKx
         xKWA==
X-Gm-Message-State: AO0yUKVZxuNveQm+vyhUCyNzgeokWZkRJppxgw0iqvxNUo7VaF3cRo/4
	w4ERHnnxN80GA/In3z4JrAfezA8O2ol2xmwTgZM=
X-Google-Smtp-Source: AK7set823U0VewTZ20vpWgEuZ0ZsTLIa85orhpslt06i8UR6pJzGiNnkkCeMtLMIYmEQaiv2zfWp2w==
X-Received: by 2002:a17:903:78c:b0:196:f00:c8f9 with SMTP id kn12-20020a170903078c00b001960f00c8f9mr2330216plb.10.1676931649858;
        Mon, 20 Feb 2023 14:20:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/16] oeqa/qemurunner: do not use Popen.poll() when terminating runqemu with a signal
Date: Mon, 20 Feb 2023 12:20:18 -1000
Message-Id: <3793662bcfdab230d7b98bde2bc6757949b0aca0.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177471

From: Alexander Kanavin <alex.kanavin@gmail.com>

This does not actually guarantee that the child runqemu process has completely exited:
poll() may return prematurely while the SIGTERM handler in runqemu is still running.
This thwarts the rest of the processing, and may terminate the handler before
it completes.

Use Popen.communicate() instead: this is what python documentation recommends as well:
https://docs.python.org/3/library/subprocess.html#subprocess.Popen.communicate

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd3e55606c427287f37585c5d7cde936471e52f4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index de0dff3ff0..c84d299a80 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -432,10 +432,13 @@ class QemuRunner:
                 except OSError as e:
                     if e.errno != errno.ESRCH:
                         raise
-            endtime = time.time() + self.runqemutime
-            while self.runqemu.poll() is None and time.time() < endtime:
-                time.sleep(1)
-            if self.runqemu.poll() is None:
+            try:
+                outs, errs = self.runqemu.communicate(timeout = self.runqemutime)
+                if outs:
+                    self.logger.info("Output from runqemu:\n%s", outs.decode("utf-8"))
+                if errs:
+                    self.logger.info("Stderr from runqemu:\n%s", errs.decode("utf-8"))
+            except TimeoutExpired:
                 self.logger.debug("Sending SIGKILL to runqemu")
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
             if not self.runqemu.stdout.closed:
-- 
2.34.1


