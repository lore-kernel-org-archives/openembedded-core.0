Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D92C64ED8
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:27 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.19571.1676150663516051117
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7tc5DDnJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id j184so786812pfg.10
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vYNPgNjPeUM14XF6FtMSxGvF8i2KVAtWTBdz2BrNBs=;
        b=7tc5DDnJri3w597zeyiqvX1lEnHXkg72qVkH6QXwv78MHAyBghIqYDmDANfnI8K+z8
         j7UpdLMreH1Y1fEoga+vRuoJnEBBxdlHMQ+JlSB+/U2XwDgdU/o3LeoV3O68fdVR4zpW
         1ie83V68yw37PCpjsLEVN2n/16kPoHf8uM5vxGIFlXrnoq9NCoV1HdKfdIKE41L3Mngl
         XrStEhE7a5sOdZt96eAUltus4zt4cYpiTV6tVZ+41fkG9ZGyunyebm9Ik2BAFbSJKtXS
         f9FvCuNWFTm39HueGp8RLpI+zwZzs6RB2t97ee5JtTsfiFYshLIQl0ntAOm4PQ7f+rrj
         n9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vYNPgNjPeUM14XF6FtMSxGvF8i2KVAtWTBdz2BrNBs=;
        b=bs1dQCzoIqZkYB3vibwlNu7OkwqICHb693X91f7UDolgM75aM/JQ6jBmk1bDmxnVvE
         99/zWLyx31t1toc4uylS0+VZiiduRJaaeMSIWBXMbtTm4f7SaAANqvkjgvciEyHT2NK5
         jg/3eiEsPkSNgfpkkpa1yyQgFHlVpT1uU6QMWtBGczdlwobnUH0dpK3eS0fsYtXWqwbR
         WTF1FcdYN5SOjIsD0jRShzq3CICObjgAwC6wVq5gDerGhJDWmRmwYVFuSrbi/Hdt6/Es
         EAzMtiZn7fHHUbkFp4vf1spdHUhHPrpz12FPscPPIDEKGYw5OdAWwf2XfUGm1V2su6Nc
         APmA==
X-Gm-Message-State: AO0yUKXU6l/DA1K3zt8Cre3pB+BHiKC0CepB7XlSUXc2gkZn+RBJBRnK
	00dAUdLzcMjl5ZvAx4GdSeqaKK6+fqT7iU+jHaQ=
X-Google-Smtp-Source: AK7set9HKcF7x6lg9+rzcFCXnG0b12awDbgMmDGqlzjYAY3ad4VAGtt9moqE0UOApstFvjlnnNDlHg==
X-Received: by 2002:a62:485:0:b0:5a8:52d5:3bc6 with SMTP id 127-20020a620485000000b005a852d53bc6mr8029637pfe.26.1676150662511;
        Sat, 11 Feb 2023 13:24:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/28] oeqa/qemurunner: do not use Popen.poll() when terminating runqemu with a signal
Date: Sat, 11 Feb 2023 11:23:37 -1000
Message-Id: <b228cdf9d4b00411d772a7b605566d33a3a1b82b.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177024

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
index 6a85f57e49..c68974f25c 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -538,10 +538,13 @@ class QemuRunner:
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


