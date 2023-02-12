Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7ACC64EC7
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:23 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.2.1676236280377481403
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0bir3cYF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso12486114pju.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPb5dBa2Rw1itzSLGdqm+dZZF6rSyVcypavMOe2iOoY=;
        b=0bir3cYFRqyE4ME8yuVVvrZCSQK+9/J1Fhqaic1FWyO0xn77e3ZJTz7HEfjMjURQhl
         6DDmLyji0nVlSGiObnkWyQAkpFifAZXMHrAK8RLJL8pE2oDpqYMCGqh5cnvDifnF7+1q
         tVv+BdQnsaPh3DTHnG9tYrJDM4lADNFI978Yj7MdSlTdKtNcioImogBZAaMLhurybyef
         bcv2Md6Ws+0kbOwDwJd3kvLNXaHyaOe5R95k7b8aLqN32rD9z1wgViONF31TJJcRa2uR
         gMqh0oDdHk/abi7vrDyETG/c+Yq75q1mDqxkqz0IZPA0HRlhCyt9HPKEV2A08ssO8k36
         XlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPb5dBa2Rw1itzSLGdqm+dZZF6rSyVcypavMOe2iOoY=;
        b=mNklhEtbkVPQ6ybOgMekUtK1cbtvURxdaZVe3myumTGQHQEZnPoqFnv2oro9a99Xuy
         10BhyNuV6fB5UxJ0+TVarMt5xJKhRrTW5c4+OnSwoA463NxAd7xfa1ap/oenXYdZgmN8
         6iRHYRnCXhSn6B2v9IHQC3dINrGQ02fgEvFvK2Q9KlMNzSxzXV5IhAZfWJoky0x9HzRS
         sM63RlFhhs/dtyJHmYqhxLY8z2Mo7fuEuPGNvYZN7QrJE/jBNcMzCsWzhyohNHS5ACAb
         K9k4dW6FCwIT8xZ2VeLgYEi9ey1v6TZeqNccRZ4aw/LqwpDxtzKYv9f56tsglTUe5IxA
         bZTA==
X-Gm-Message-State: AO0yUKXVqiMbcv0DnbLsXM1ygLMfXdEskhUhXY2sCGEzCe3d0pssTLIP
	JaKbsONUQDAdIRD6sj6Jazz5xn+Ms0j8oTp0uT0=
X-Google-Smtp-Source: AK7set95U5EyHdj3p+zGOsddCvpXqGWnYja+VaJC4yMv69N7kTGJ19limTQWH/o8fr+WXwvdq4xCjw==
X-Received: by 2002:a17:903:22cb:b0:19a:5958:15e7 with SMTP id y11-20020a17090322cb00b0019a595815e7mr15127159plg.15.1676236279471;
        Sun, 12 Feb 2023 13:11:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/27] oeqa/qemurunner: do not use Popen.poll() when terminating runqemu with a signal
Date: Sun, 12 Feb 2023 11:10:31 -1000
Message-Id: <88e7bac0f06d4f12cd6f078d37e4e9975871860f.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177058

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
index c19164e6e7..9a99859388 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -532,10 +532,13 @@ class QemuRunner:
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


