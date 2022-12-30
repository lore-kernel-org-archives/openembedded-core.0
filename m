Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96E7C4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:45:34 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.22432.1672418711091565250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4YQybFqo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id e21so5192228pfl.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JthftOZBKiREoqdGI/0jZSVtZ/UTaV2JTsrr9oPrGiA=;
        b=4YQybFqoOwUrcq0hRNySuRGYumD+0ftFWKrjUYnPTfCcXNStE+MgYAGbX6u2nbq1ch
         BZ0Fh53fU/jPgZd1Ot9klGD3W4gQXoEh2q/2olz2uNlrS3u/Iw1naKhoxyu1fth/eJJZ
         gDRORDSyYIuonn9USjK000/RoxEzfOgGNtZyHmoG9tDfO+H1fMCMglrL3nunU7Dbr2L1
         wQIvYZ7OFuqInY6gVhAL66L/iTi65RvlmddjF9oowRyrApZhgU8kyXGg3RbTgQyqa7MD
         xriq7gqWdfR6tJLIug6uiv0gPan4BLcbFj9XiP8RWkBlf4NVXtxyeTsSMyNosl3dBOEE
         P/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JthftOZBKiREoqdGI/0jZSVtZ/UTaV2JTsrr9oPrGiA=;
        b=mx0aPm5Sttdct5DZc+0r3OdvBKtp5+o40uAWJZFmEt5k5OeBsnnBEjR+e+OmGRO8Yo
         qacLXYkOulZZUtFsS1Ab8zTZYJSuj0BXrbst6AKn8LHMkEYoEcfvZz/Rcz/3bqMtPYam
         mhhBcNShq6iOk8I9V1XGLV5aEyj7SLJ+QF5Y5VYlMZvUGic8CA1MQ9HH0Z2W470HlCIl
         ZOwP0OTZJ4r8qog8Y5ZdPKqmMwsjCnu8GOjeMe1LV9sOVKha/q+S2cqALNEhS+4aBwoe
         TZwVsQC/vx5jqEmCo3XGvFzNsXut4dZUVqlOIEIkZdl8ebOaH48F6Z/qyjn55jNPOzDe
         9SaA==
X-Gm-Message-State: AFqh2kpGGfFVkZm8HvvET5BU5zKndRmNbczMGimi5rFJbUOR1jXqdy+p
	wnXQc9dgdJtHERpE9LK11AG3ljkmHPxSEDgJJQY=
X-Google-Smtp-Source: AMrXdXswniyD6iGI23kolWNX/23kLSIj2X9BNMvx5Pjyr90A5ZcK9Y0xwUXDDJG/aUA8x9Qu7CDyyg==
X-Received: by 2002:a05:6a00:1d8e:b0:578:16e6:815d with SMTP id z14-20020a056a001d8e00b0057816e6815dmr35677403pfw.21.1672418725558;
        Fri, 30 Dec 2022 08:45:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.45.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:45:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/22] oeqa/concurrencytest: Add number of failures to summary output
Date: Fri, 30 Dec 2022 06:44:12 -1000
Message-Id: <36bcf9604ac8bde6c3a743cf97714cc59408f26e.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175163

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
index 383479c959..4f77589b00 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -59,6 +59,7 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
         self.outputbuf = output
         self.finalresult = finalresult
         self.finalresult.buffer = True
+        self.target = target
 
     def _add_result_with_semaphore(self, method, test, *args, **kwargs):
         self.semaphore.acquire()
@@ -67,13 +68,14 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
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


