Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37827C71135
	for <webhook@archiver.kernel.org>; Sat, 14 Jun 2025 15:58:28 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.12410.1749916701757996457
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jun 2025 08:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=al11GhVy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20250614155815d016999539b4088e48-mbokez@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250614155815d016999539b4088e48
        for <openembedded-core@lists.openembedded.org>;
        Sat, 14 Jun 2025 17:58:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=G9ISHEfKIKuVUxaJ6KtvLEPJYXBeUNcHyJd91MjThig=;
 b=al11GhVyON7SCECazxNlNkvc/Iu9RCgjPfElAci5rBJKJEM8JO3RA9WsQNdNQsxjOtM7aG
 COqU9w/Wf99pzOrKZWG1/FBNdiZby/4dofSuXsiG5Ohgs8tpjJPsvvkKiJiDmtHshxMd7qi8
 FstRX/+CBNwSBNCxitjvG0rprcXXmq/+FovDbpflZELNwqYz8j/GdBTmMK5iDLIDMbgx/Asg
 cETFB+fE3/5qdxGUjZiGZeXcmk2I+3vb/qM2BDJFS2UujEHd/f88vbRFfRZDiMRzbl9Ec991
 ln5dhigWpZw7WbWrdIS6jHBd8GkzLTMFi+MDhEVhXJ5zRVa9k1qr3YBA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] oe-selftest: fitimage: replace cleansstate with compile -f
Date: Sat, 14 Jun 2025 17:58:12 +0200
Message-ID: <20250614155812.1213169-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 15:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218637

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Avoid using "cleansstate" in tests, as it can remove files from
SSTATE_DIR and disrupt parallel builds on autobuilders. Use
"bitbake kernel-signing-keys-native -c compile -f" to force key
regeneration without affecting shared state.

This issue was introduced in:
oe-selftest: fitimage: cleanup FIT_GENERATE_KEYS
OE-Core rev: 97e58d7c2bc1943f0696fc72984788f459f7f7c4

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index be291e4b0f4..265cfed39fe 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -918,7 +918,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         bb_vars = self._fit_get_bb_vars()
 
         # Ensure new keys are generated and FIT_GENERATE_KEYS = "1" is tested
-        bitbake("kernel-signing-keys-native -c cleansstate")
+        bitbake("kernel-signing-keys-native -c compile -f")
 
         self._test_fitimage(bb_vars)
 
-- 
2.49.0


