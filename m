Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280E5C3DA7E
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 23:28:11 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.7352.1721345287416866280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 16:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46INS2Pi018611;
	Thu, 18 Jul 2024 18:28:03 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH v2 1/4] package.py: Fix static debuginfo split
Date: Thu, 18 Jul 2024 18:27:59 -0500
Message-Id: <1721345282-10901-2-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721345282-10901-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1721345282-10901-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 23:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202243

From: Mark Hatle <mark.hatle@amd.com>

Fix:
  NameError: name 'shutil' is not defined

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/lib/oe/package.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index e6b46a0..8a64e13 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -838,6 +838,8 @@ def splitdebuginfo(file, dvar, dv, d):
     return (file, sources)
 
 def splitstaticdebuginfo(file, dvar, dv, d):
+    import shutil
+
     # Unlike the function above, there is no way to split a static library
     # two components.  So to get similar results we will copy the unmodified
     # static library (containing the debug symbols) into a new directory.
-- 
1.8.3.1


