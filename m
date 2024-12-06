Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9CEE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 16:52:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.42309.1733503923703770301
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 08:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JBe5QANw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF55C20009;
	Fri,  6 Dec 2024 16:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733503922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BEk0QqU9+2LDBsu5qJi0YXcZ/b5Aenx37XKEagsE5do=;
	b=JBe5QANwulzZFW7j/TGyJl7j5kP9OkQ+M+mCcKJiYGts0qIpHhmhNKhMkA8KoEO6IDd1Qu
	c+95X0B5DFHPYvFbLOuILLdEGPymmu4mH1eUKab9QhFKtEhFnpAYM1IQv/pp6ZqN6D9Vie
	lXrSLd876X/tlFsyk2KzibmI2lqZLGVOJ9a17vp3bhwoInQ+SCPOmF9kXG7ImxMDYcTogi
	HXABCIwLpx5tv9WUVkHNKVH7axg9USC8+QMxshyXR6J9H6svkE4++wx6wYS2PBJ58UI5Q6
	k+cljDX3Yu0nXs8A76K317wpRxZYWSe7WWoWKNz/dinW5nVMl0Gl5Ek3EHClIQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 06 Dec 2024 17:51:48 +0100
Subject: [PATCH] qemurunner: Fix stack trace generation in exception
 handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-mathieu-qemurunner_exception-v1-1-24f72c23dada@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKMrU2cC/x3MywqDMBBG4VeRWRtIYkehryJSvPytszDViSmC+
 O4NLr/FOSdFqCDSszhJ8ZMo35DhyoLGuQ8fGJmyyVv/cN7WZun3WZDMhiVpCgH6wjFi3XNo0Hj
 mwXHFlikvVsVbjnvfdtf1B02UrrluAAAA
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 16:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208433

Qemurunner exception handling code currently formats the stack trace
using traceback.format_exception(), with parameters introduced in python
3.10. This will fail on platforms with an older python version.

Change this to the old parameter order, still supported in current
python versions.

https://docs.python.org/3/library/traceback.html#traceback.format_exception

Fixes [YOCTO #15675]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 98a11e1a2c3c..6cab9aa6b202 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -746,8 +746,10 @@ class LoggingThread(threading.Thread):
     def threadtarget(self):
         try:
             self.eventloop()
-        except Exception as e:
-            self.logger.warning("Exception %s in logging thread" % traceback.format_exception(e))
+        except Exception:
+            exc_type, exc_value, exc_traceback = sys.exc_info()
+            self.logger.warning("Exception %s in logging thread" %
+                                traceback.format_exception(exc_type, exc_value, exc_traceback))
         finally:
             self.teardown()
 

---
base-commit: 942b6ab25f0c1df02920997b63db89187fbdeea1
change-id: 20241206-mathieu-qemurunner_exception-e7255b153505

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


