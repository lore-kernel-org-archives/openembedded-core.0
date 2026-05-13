Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB7DCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 17:06:36 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2356.1778691986697761134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 10:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=W73l3WWF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202605131706243c51efb91e00020791-rbuktj@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202605131706243c51efb91e00020791
        for <openembedded-core@lists.openembedded.org>;
        Wed, 13 May 2026 19:06:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=hQvB7vB7q+3aCzPbTMrwBj0zY2OA2eKzke3u6OCGSGg=;
 b=W73l3WWFI1iLiWFgGqXfbTpRO6GSzV21lPHWZdINLCvrPVp1iOGl1NMVrT4j/Bo5p0+P3Z
 ZNNs7h21PMbe+rsWfJCfesvzyyqDKYrn+yQJ77lW2UWke0BTQvRVZsAko++CKu6KVLlwScOB
 reAHPGOLHbzJVxruV/clpckaCsUtI88KzgTw3ewysG5ezUri2lb/AfhKpPFl0mBOggXly5F1
 tzKcW3ckFMFNkdPjl/uqrVpxy+sduTkJw92cMICevfXtsJPKnZM5eJTq/7ZE9mOlcX3pRFQg
 9M8ICwBV+EdK5oCf8590RJqmUbLbPplozOtzrHvuqX9+a8cDbJBDqyUA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [scarthgap][PATCH 3/3] oeqa: runtime: go: Increase test_go_compile/test_go_module timeout
Date: Wed, 13 May 2026 19:05:33 +0200
Message-ID: <20260513170533.2467950-3-peter.marko@siemens.com>
In-Reply-To: <20260513170533.2467950-1-peter.marko@siemens.com>
References: <20260513170533.2467950-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 17:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236995

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

These tests tend do take a bit of time, and this is probably why they
have been seen failing a few times in the past months. Rising the
timeout from 5 to 10 minutes appears to help.

Fixes [YOCTO #15999]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 998ebfc77db4c8d7567d82560595e0994a310ae0)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/runtime/cases/go.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
index d4b69438a56..0c9c4ff4cd3 100644
--- a/meta/lib/oeqa/runtime/cases/go.py
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -35,7 +35,7 @@ class GoCompileTest(OERuntimeTestCase):
             self.skipTest('go command not found, output: %s' % output)
 
         # Compile the simple Go program
-        status, output = self.target.run('go build -o /tmp/test /tmp/test.go')
+        status, output = self.target.run('go build -o /tmp/test /tmp/test.go', 600)
         msg = 'go compile failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
@@ -65,7 +65,7 @@ class GoCompileTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
         # Build the module
-        status, output = self.target.run('cd /tmp/hello-go && go build -o hello main.go')
+        status, output = self.target.run('cd /tmp/hello-go && go build -o hello main.go', 600)
         msg = 'go build failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 

