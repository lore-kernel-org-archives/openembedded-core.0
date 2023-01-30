Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF8FC54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 22:11:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8488.1675116715443099521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 14:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rw26OEEH;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so2159174wmb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 14:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bN3dGEJxSN97lPEmJpGPo93gDyfp8uBqmeeHWKwFxQc=;
        b=Rw26OEEHQFsqiV1Yn/ymYhhPWbgJAf+xlEKY4z6RlE9pSSicnmqCZTu4Vo9fxv8s+m
         uyC3LNjlBPEb1l1hDEfO57gTFgA9BjO5gvE4Pwl1/XgyFfoXmo92RtbYqQiJVQcC/U8d
         i61fNvOwtCZv9E1pB1eQK/F52Gwx0rbLVanUj/sgEk0tNqYV3WjJuX/HLiF6bJAavgVV
         4//k5f1xnF6daYcavGLZ8+HnjCU0LDpxhH8qRWBc+rK28IoKE5cri4wgfatyBomuJzlf
         2Cn6W6yva1r2QxoJSnRbJ3/pT7ZQFi8BjOPEGrrs1yV8BNvGffsfT6QKzXUS7Y7HPzUA
         1YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bN3dGEJxSN97lPEmJpGPo93gDyfp8uBqmeeHWKwFxQc=;
        b=r0vS7GAxGdifW+mK7nWnwVUW4y7RzzkQ8xa7lAXneuebv07uVJbEhzwmVap+CFDhqc
         DY4EBnGOdXLtHUJXGAgye+BtMWF/M7LDiY/RGrHvk1WMcJEzaUM+VYg9pAeZEFjUskJV
         HZUNn20+yAJPFphk+K3Fka252SXFvB/mqWcDo8Z/4hMdzQze1F0n20RsO/frcCXc1zV2
         uRguHsFmKcPLUu2g9yiDnZ6Ibpxg4id5hYMwaWVMlPuHMxJXjEdpVQzWW1UzqNFVEsww
         oQv6XX1gqdj4CPSD+FnWPlmSJVC/u+JNmHSp4HwU7FUc0Uto17X5kSV2BVW9dX4bMCI0
         hPlg==
X-Gm-Message-State: AO0yUKXqZLoCF7s7vH43f68WtmEhv9Ln+u15mUpY6IWQWR1jh8RGwtC0
	LJKEHYN29Nv6gIfaWrJfTe80FOWqAG8=
X-Google-Smtp-Source: AK7set+jJwqVJw47aNJqRczbsny7cytB1H9cDzY2lPSNPfmWGbwEYwNxG6ZA6kXR3V8V3PotJL1kFg==
X-Received: by 2002:a05:600c:4f12:b0:3dc:5300:90a9 with SMTP id l18-20020a05600c4f1200b003dc530090a9mr7213240wmq.28.1675116713599;
        Mon, 30 Jan 2023 14:11:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id p7-20020a1c5447000000b003dc433355aasm10407330wmi.18.2023.01.30.14.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 14:11:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] oeqa/qemurunner: do not use Popen.poll() when terminating runqemu with a signal
Date: Mon, 30 Jan 2023 23:11:25 +0100
Message-Id: <20230130221125.2299244-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 22:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176502

This does not actually guarantee that the child runqemu process has completely exited:
poll() may return prematurely while the SIGTERM handler in runqemu is still running.
This thwarts the rest of the processing, and may terminate the handler before
it completes.

Use Popen.communicate() instead: this is what python documentation recommends as well:
https://docs.python.org/3/library/subprocess.html#subprocess.Popen.communicate

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/utils/qemurunner.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index b5fed6c9fe..8b893601d4 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -543,10 +543,13 @@ class QemuRunner:
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
2.30.2


