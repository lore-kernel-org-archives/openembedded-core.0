Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BF6C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 14:04:08 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.10833.1651154644313024039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=gmbymGOL;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651154645;
  x=1682690645;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=c6LGh7bki8L8v8sVtZyD0DFXluSg38EMFU+OmLoX+go=;
  b=gmbymGOLe6b1H0Sre745xE6fAuiVj1qjds0XDirwaZN2nGP7YPF+38AA
   GSTkq45lo5yjH/wfvs3FIYM7LM08f2V1UQFTRG6KMSMNKRtiVkeHRcpF0
   birKwQQs4rb5x5ErVxz4793hN/M3MDGFowzCDu8gdcp51RTXnnw+KOLzc
   UkeqjL/ul7B2sQ80MJQrvpcvRyBFRrxEd1/PqmwMIocUKHwpaHa+G9liE
   mRnE0tZRJzCtdo5z1poKrU0Uzv9U8AHdflpxGA29jcRuN9oG///T3/sZi
   bhGW9VGFrA8s11jr7TTKKCpI5XU0sQ7MxhB8rfWzILoYiq47Zcr5nbgLG
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [honister][PATCH 2/2] knotty: reduce keep-alive timeout from 5000s
 (83 minutes) to 10 minutes
Date: Thu, 28 Apr 2022 16:03:59 +0200
Message-ID: <20220428140359.17240-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220428140359.17240-1-pkj@axis.com>
References: <20220428140359.17240-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 14:04:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164965

From: Ross Burton <ross@burtonini.com>

The keep alive timeout is excessively long at 83 minutes (5000 seconds),
reduce this to 10 minutes: this should be long enough that it rarely
triggers in normal builds, but when it does it has useful information.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 bitbake/lib/bb/ui/knotty.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/bitbake/lib/bb/ui/knotty.py b/bitbake/lib/bb/ui/knotty.py
index 64e33d81a6..3ba5579ca4 100644
--- a/bitbake/lib/bb/ui/knotty.py
+++ b/bitbake/lib/bb/ui/knotty.py
@@ -607,7 +607,8 @@ def main(server, eventHandler, params, tf = TerminalFilter):
     warnings = 0
     taskfailures = []
 
-    printinterval = 5000
+    printintervaldelta = 10 * 60 # 10 minutes
+    printinterval = printintervaldelta
     lastprint = time.time()
 
     termfilter = tf(main, helper, console_handlers, params.options.quiet)
@@ -617,7 +618,7 @@ def main(server, eventHandler, params, tf = TerminalFilter):
         try:
             if (lastprint + printinterval) <= time.time():
                 termfilter.keepAlive(printinterval)
-                printinterval += 5000
+                printinterval += printintervaldelta
             event = eventHandler.waitEvent(0)
             if event is None:
                 if main.shutdown > 1:
@@ -648,7 +649,7 @@ def main(server, eventHandler, params, tf = TerminalFilter):
 
             if isinstance(event, logging.LogRecord):
                 lastprint = time.time()
-                printinterval = 5000
+                printinterval = printintervaldelta
                 if event.levelno >= bb.msg.BBLogFormatter.ERROR:
                     errors = errors + 1
                     return_value = 1

