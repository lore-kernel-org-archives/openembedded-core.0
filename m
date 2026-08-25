Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8C9C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 12:56:55 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20819.1787662610127362322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 05:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=HI7nZY8U;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1328017-20260825125647e059f899a7000207c3-ybdf0x@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260825125647e059f899a7000207c3
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Aug 2026 14:56:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=20Lf85CYaczU9lmL13cssuD7xBfvg7nMpgNqwz1QE0E=;
 b=HI7nZY8UA2NlknRdwofLenI/6wLJ8HBN3y84KR83JlfFelApYwbLeqUWwqQRyPOayjEGyL
 sYM3n7J7x3zMslOX7i/C3n6jv5l5qmKWzEIMZRb3wM9fL6uzkIx7PhKtmeKOmWB3vks7Eh0Y
 +9RVGCW03jFWyKZwoiIeRw5fOCCmVwgwy222oYVuWDxHXiheIgsUsPDD9MkQRHIH86LiwQtc
 Oc0PYSVX3EeGKJalSIihXoeFKSo9JWnq+4kqV4qTAIr23R+QbldDq/s2oK5d11glohfl3Yaz
 naGyj3C1RFi3KclB2RPzvyIwA7aum8oYbNhpJl3aDbGj74Ob6Q77AN6A==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [scarthgap][PATCH] testimage: avoid symlinking missing qemu boot log
Date: Tue, 25 Aug 2026 14:56:17 +0200
Message-Id: <20260825125617.192989-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 12:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244235

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

When qemu test runs only produce suffixed bootlog variants, the base
bootlog path may not exist. Guard the symlink creation and log a note.

(From OE-Core rev: 7a6596925cb0eb8dd48a0362a51875cdd60152bc)

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/classes-recipe/testimage.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 33b1c13f9d..744de5d7de 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -395,7 +395,10 @@ def testimage_main(d):
     # Copy additional logs to tmp/log/oeqa so it's easier to find them
     targetdir = os.path.join(get_json_result_dir(d), d.getVar("PN"))
     os.makedirs(targetdir, exist_ok=True)
-    os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
+    if os.path.exists(bootlog):
+        os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
+    else:
+        bb.note("testimage: boot log not found at %s" % bootlog)
     os.symlink(d.getVar("BB_LOGFILE"), os.path.join(targetdir, os.path.basename(d.getVar("BB_LOGFILE") + "." + d.getVar('DATETIME'))))
 
     if not results or not complete:
-- 
2.39.5


