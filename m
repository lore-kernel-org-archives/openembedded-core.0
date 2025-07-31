Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41E6C87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 19:36:02 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.71113.1753990558169587001
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 12:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=AywHtNAz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202507311935539c4cdc21bb5c49d1d7-r7dso_@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202507311935539c4cdc21bb5c49d1d7
        for <openembedded-core@lists.openembedded.org>;
        Thu, 31 Jul 2025 21:35:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=L/kMMMoutOz1BYIznhNp+HijjlTxapmaM0/JIx5yfGc=;
 b=AywHtNAzLYXpSjEOLDnjUZKXvfxs2QbTUeLipzXPpQd+GlhAWguEyWc1L8Hy4j2pfhxsIt
 nY8RpRX54nl8KFrYcB8ayGiEFu8+fkguUmhiDmR2I+7Pqh6VXWM0voVlfESvaKNcDnLIKPhB
 86uEJlrY7/qCsZqbcuKGcQH5gBnymI7ot35X/DtfbjZ4GHiCPuTpwI4ZqnjMVkEMHWtYgF2b
 PYO4Haru73yVjejgE13AzxxtKnDk8KExix9E+QYQVxntAIzgCf/ALl9pyWcXUgKx8mkABYVK
 d56lgsm1CemCmin3TrBlPRRnLJU9wzzX8vcyrWKY/Xw7BitJYpUK1bew==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] oeqa: fix OETestCalledProcessError for check_output method
Date: Thu, 31 Jul 2025 21:35:06 +0200
Message-Id: <20250731193506.13665-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221208

From: Peter Marko <peter.marko@siemens.com>

Per documentation, subprocess.CalledProcessError exception has stderr
filled out only for run method, it's None for check_output method.
So serialize it only if it's not None.

Avoids:
  File "<poky-dir>/meta/lib/oeqa/utils/subprocesstweak.py", line 15, in __str__
    s = s + "\nStandard Error: " + strify(self.stderr)
        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
TypeError: can only concatenate str (not "NoneType") to str

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/utils/subprocesstweak.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/subprocesstweak.py b/meta/lib/oeqa/utils/subprocesstweak.py
index 1774513023..046667faa9 100644
--- a/meta/lib/oeqa/utils/subprocesstweak.py
+++ b/meta/lib/oeqa/utils/subprocesstweak.py
@@ -12,7 +12,9 @@ class OETestCalledProcessError(subprocess.CalledProcessError):
 
         s = super().__str__()
         s = s + "\nStandard Output: " + strify(self.output)
-        s = s + "\nStandard Error: " + strify(self.stderr)
+        # stderr is not available for check_output method
+        if self.stderr != None:
+            s = s + "\nStandard Error: " + strify(self.stderr)
         return s
 
 def errors_have_output():

