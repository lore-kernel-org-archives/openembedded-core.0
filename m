Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09D9C46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:55 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.16037.1672594735271715154
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wjgf9j7n;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so26277830pjj.4
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqOr8dAQvReZ7MtEr6gRvw+mS1IuEJvmn6pHZIWe8Dk=;
        b=wjgf9j7nCMvJv/rabiNE6g5Z0ZoI0humhnlhFRkpO1AdtPRq+3GuNKrSd51slUuDt5
         ByvjL6NAg8STV1zRDFTxfe4KRUcaFcc0GfWQcXaJ9wUlKBkVNzd8itifrPMXzbNcbpD9
         /Z0OFMz/s7mcMmyGInDLkP74Fh9DpzpabTMS+Gdc7eUh2XnMGLvI/91ZIDn3QHizvEwM
         q3rRe3/uClk6gcX9wgvLkU7OKHu1V/C9Uidl4BSrvIHejRtRsUFCnmbTX7vYkGeRb91E
         i7m3HTXGOmhi+uz9Xc/tS8V8kJSCYW0oTwpKg+ZjpFMmModD52RX4YXJqHKAkvZiKkU5
         tYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqOr8dAQvReZ7MtEr6gRvw+mS1IuEJvmn6pHZIWe8Dk=;
        b=20BgZCDoRodQ9DA3QeHwng2VYE/88Rf5s2ZZgMV8tFQzlWZU/Ewg/Zg3n3PYfdDY8U
         dKA/tZ3cZ2UqK7mcO2biSuZNbcGAg3oyi/8UEQKinT5pnD+TmcNFykywoDA4+Nobixv1
         sAdDRrVc65PgFDwtDeNM6V7E049UHOkYpWsiS/4JN743R42Mz/+KSqi+7qFhwS+O26rX
         UYCeiv4sooqcC0jdYEmkb7Sk86PJtJuKwJmZGdDkjMcdxjjFOzeDPaGheeUq5+V/r1j6
         OKB91YnvqEz9QhMckxKFMsnaO9mf8H6OSdTS/YrCcKNAy89kBG7hXMTrKztuf4ePfGBI
         IzxA==
X-Gm-Message-State: AFqh2kq5IpvzYnGJ0qvDYwyFUTaiAwI+YebMxljlk2QksmHl42JsTJ4y
	xQk7RNSXWJtxv1NEt098PpsgdYX892RxmoXlapI=
X-Google-Smtp-Source: AMrXdXvEP136844adZPF67coClSH5JnqKyUELwKzcCdDkmNOM7XnUTHixqFweiJ3akdBxzr4Zw7Y3g==
X-Received: by 2002:a05:6a20:13a0:b0:9d:efbe:a0f5 with SMTP id w32-20020a056a2013a000b0009defbea0f5mr61893124pzh.5.1672594734370;
        Sun, 01 Jan 2023 09:38:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/29] oeqa/concurrencytest: Add number of failures to summary output
Date: Sun,  1 Jan 2023 07:37:51 -1000
Message-Id: <fed1c334e07bf3e2f6296d18ffccfd49a11f820a.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175217

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When running oe-selftest and seeing the end of a running log, it is
extremely helpful to know if there have been failures or not to save
looking at the rest of the log. Add the number of failures to the summary
line so that people monitoring builds have an easier time before the end
totals are printed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b23996911d91f7f99774646c6db9f3490b4cb62)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 161a2f6e90..fe6ea29525 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -57,6 +57,7 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
         self.outputbuf = output
         self.finalresult = finalresult
         self.finalresult.buffer = True
+        self.target = target
 
     def _add_result_with_semaphore(self, method, test, *args, **kwargs):
         self.semaphore.acquire()
@@ -65,13 +66,14 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
                 self.result.starttime[test.id()] = self._test_start.timestamp()
                 self.result.threadprogress[self.threadnum].append(test.id())
                 totalprogress = sum(len(x) for x in self.result.threadprogress.values())
-                self.result.progressinfo[test.id()] = "%s: %s/%s %s/%s (%ss) (%s)" % (
+                self.result.progressinfo[test.id()] = "%s: %s/%s %s/%s (%ss) (%s failed) (%s)" % (
                     self.threadnum,
                     len(self.result.threadprogress[self.threadnum]),
                     self.totalinprocess,
                     totalprogress,
                     self.totaltests,
                     "{0:.2f}".format(time.time()-self._test_start.timestamp()),
+                    self.target.failed_tests,
                     test.id())
         finally:
             self.semaphore.release()
-- 
2.25.1


