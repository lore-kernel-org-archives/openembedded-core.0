Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7A8C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 14:04:08 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.10833.1651154644313024039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=B/GhVDkK;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651154644;
  x=1682690644;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VTFhbml1liBkkGfdLlO/o1zS3mTmx+e1LaTNAZkR6xc=;
  b=B/GhVDkK3LqPix0rVvIDhQTl9Qp7zc0GgueF3M0N4nMriVt3XGg0Di+0
   KB50U4S1J2nw8g1rELvMZEGMHgxM4gkof3scMD2xuzjBRYvhDaNMduw0X
   XM5NfvH7aP0V8Rgh4vXX1hJbh0UENw6bIwjY5Q8RCySy8m9A3WEwZGSrR
   3+2ILa+1Ndnlwm9O4IZLsDiqwV9KSBXG38NvTV85D2xAM6+j8MNpvxlMg
   irvlJJ+M3T9EqGPmgLtlAsW4RBtj410eguKpveCECAFbqhIkfJ9U0be7j
   GAi7lWTdLKFqFMtB1NwCeTYy1frrd+07sp0A5wfZIZenTmXlYS5GXcrzk
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [honister][PATCH 1/2] knotty: display active tasks when printing
 keepAlive() message
Date: Thu, 28 Apr 2022 16:03:58 +0200
Message-ID: <20220428140359.17240-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 14:04:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164964

From: Ross Burton <ross@burtonini.com>

In interactive bitbake sessions it is obvious what tasks are running
when one of them hangs or otherwise takes a long time. However, in
non-interactive sessions (such as automated builds) bitbake just prints
a message saying that it is "still alive" with no clues as to what tasks
are active still.

By simply listing the active tasks when printing the keep alive message,
we don't need to parse the bitbake log to identify which of the tasks
is still active and has presumably hung.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 bitbake/lib/bb/ui/knotty.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/ui/knotty.py b/bitbake/lib/bb/ui/knotty.py
index 484545a684..64e33d81a6 100644
--- a/bitbake/lib/bb/ui/knotty.py
+++ b/bitbake/lib/bb/ui/knotty.py
@@ -228,7 +228,9 @@ class TerminalFilter(object):
 
     def keepAlive(self, t):
         if not self.cuu:
-            print("Bitbake still alive (%ds)" % t)
+            print("Bitbake still alive (no events for %ds). Active tasks:" % t)
+            for t in self.helper.running_tasks:
+                print(t)
             sys.stdout.flush()
 
     def updateFooter(self):

