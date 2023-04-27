Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC19C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 19:01:53 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.460.1682622111091307694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 12:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=iN5hBM/1;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1682622112;
  x=1714158112;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=86rKiUbiE7+sQUNlg38KXUqpYP/qslrLDY/6Dwx2RkI=;
  b=iN5hBM/1tsAQz5woYCn3mTpYMF9UEPbGr5j62vXMOw0M/SwT0GqTUKvg
   snMfUBiMZBLMKPoB6bTwBCg70+7tY+Mmw1eJoawcv6k9CSysIi7Ep10PM
   25uosbCmerDbp65u+TQiApM1NBrSjFI5ThOYSK+HZvlw76L0q8nAAQckY
   CSsUqd2Viud5KOKRvqMFt5zDGM4F7G6brRzyrCfloAbHAT1SvQ4WvF10J
   T9Z1bD26kQKhMYa+al5b0R+Fh3arpUC7Gw/K2+pAAF670x/q7RVka7Eqa
   9l4t8G0Fk9Ru1hhJ4aRCNzGoD4umQ/v+VD3EtlG/eZJHRqn6cwkHVa0DF
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] license.bbclass: Include LICENSE in the output when it fails to parse
Date: Thu, 27 Apr 2023 21:01:40 +0200
Message-ID: <20230427190140.2607641-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 19:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180499

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index 560acb8b6f..23625f0104 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -229,7 +229,7 @@ def find_license_files(d):
         bb.fatal('%s: %s' % (d.getVar('PF'), exc))
     except SyntaxError:
         oe.qa.handle_error("license-syntax",
-            "%s: Failed to parse it's LICENSE field." % (d.getVar('PF')), d)
+            "%s: Failed to parse LICENSE: %s" % (d.getVar('PF'), d.getVar('LICENSE')), d)
     # Add files from LIC_FILES_CHKSUM to list of license files
     lic_chksum_paths = defaultdict(OrderedDict)
     for path, data in sorted(lic_chksums.items()):

