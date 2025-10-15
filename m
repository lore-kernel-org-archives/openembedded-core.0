Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F730CCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 20:42:16 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.28833.1760560925892165265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 13:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm2 header.b=WDf2Et1t;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-664519-20251015204200a534a45e250002073e-mfhher@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20251015204200a534a45e250002073e
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Oct 2025 22:42:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=swqGBRGRLKpWUsld4MCqRFLmX/3o48kvIUJ2MOxnjPg=;
 b=WDf2Et1t3u4a5PzjGBm8RjAHX+1mGny3Rrmh2DkUyfJI77HZvfP37hQ0oLckc/T+C1K8q1
 JSNRJ2hWoa20QoU5ygWd/ELLrT9yq2lBHu9wIELr10SQKLhEqT0ISdzHZ5rQR3IbIYBnDAuE
 N6VR05EtY2+4MWBUL1FiXHtuOrBP6b5pFq17D2qXfY2B7vkRLaW09ET2DYBOITPMcqcjXKZT
 kGiyzPlIGZNGbfYY8KnGcF24lh0LGxYFws4FXxVBFVZoBb17B76sdMvhfMNV+6Dcz74I0nBA
 q5QKZr+2SGkj5B/zICczrZuTB5RYpMgPFQeS5/P+Wn5Ub02eXd0l6hLA==;
From: Michael Haener <michael.haener@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Haener <michael.haener@siemens.com>
Subject: [scarthgap][PATCH] oeqa/runtime/ping: don't bother trying to ping localhost
Date: Wed, 15 Oct 2025 22:41:31 +0200
Message-Id: <20251015204131.14992-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224905

If SLIRP is being used instead of TAP for networking to the guest then
the target IP will be localhost.  There's no point in pinging localhost
to see if the target is up but whilst you'd think it is harmless, in
some containers ping doesn't actually have enough rights to work:

  ping: socktype: SOCK_RAW
  ping: socket: Operation not permitted
  ping: => missing cap_net_raw+p capability or setuid?

Look at the target address and if it's localhost or 127.0.0.* return
immediately.

(Backport from OE-Core rev: a06ef43d2a50e16c32bd6edbdc7b32c3528687d5)

Signed-off-by: Michael Haener <michael.haener@siemens.com>
---
 meta/lib/oeqa/runtime/cases/ping.py | 7 +++++++
 test                                | 0
 2 files changed, 7 insertions(+)
 create mode 100644 test

diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index f72460e7f3..bc543f6c41 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -18,6 +18,13 @@ class PingTest(OERuntimeTestCase):
         output = ''
         count = 0
         self.assertNotEqual(len(self.target.ip), 0, msg="No target IP address set")
+
+        # If the target IP is localhost (because user-space networking is being used),
+        # then there's no point in pinging it.
+        if self.target.ip.startswith("127.0.0.") or self.target.ip in ("localhost", "::1"):
+            print("runtime/ping: localhost detected, not pinging")
+            return
+
         try:
             while count < 5:
                 cmd = 'ping -c 1 %s' % self.target.ip
diff --git a/test b/test
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.34.1


