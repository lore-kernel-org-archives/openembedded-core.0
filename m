Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442CBC02195
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:00:50 +0000 (UTC)
Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
 by mx.groups.io with SMTP id smtpd.web10.91439.1738598448002897929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.169, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YmrnV2YdbzQD3;
	Mon,  3 Feb 2025 17:00:46 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YmrnT6Z8dzn2Y;
	Mon,  3 Feb 2025 17:00:45 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 03 Feb 2025 17:00:30 +0100
Subject: [PATCH RFC 2/6] patchtest: allow to pass patch from stdin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-b4-patchtest-v1-2-ef6ee5fcdd78@cherry.de>
References: <20250203-b4-patchtest-v1-0-ef6ee5fcdd78@cherry.de>
In-Reply-To: <20250203-b4-patchtest-v1-0-ef6ee5fcdd78@cherry.de>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
 openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210661

From: Quentin Schulz <quentin.schulz@cherry.de>

This allows to pass a patch via stdin to patchtest.
This will be useful when using b4 with patchtest, with the former
passing each patch to the latter via stdin.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 scripts/patchtest | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index bcd48dbcc39573d7abd3247bc34cb9ac8a8a5c2e..66a9f6470ca860c2233fb9ace042edf4b4737c88 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -205,11 +205,20 @@ def main():
         patch_list = [patch_path]
 
     for patch in patch_list:
-        if os.path.getsize(patch) == 0:
+        if patch == "-":
+            import tempfile
+
+            patch = tempfile.NamedTemporaryFile(delete=False)
+            patch.write(sys.stdin.buffer.read())
+            patch.flush()
+            logger.info('Testing patch from stdin')
+            tmp_patch = True
+            patch = patch.name
+        elif os.path.getsize(patch) == 0:
             logger.error('patchtest: patch is empty')
             return 1
-
-        logger.info('Testing patch %s' % patch)
+        else:
+            logger.info('Testing patch %s' % patch)
 
         if log_results:
             log_path = patch + ".testresult"

-- 
2.48.1


