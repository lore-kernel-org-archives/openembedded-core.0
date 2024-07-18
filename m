Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DE3C41513
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 23:28:11 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.7390.1721345287879731951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 16:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46INS2Pj018611;
	Thu, 18 Jul 2024 18:28:04 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH v2 2/4] package.py: Fix inode link target
Date: Thu, 18 Jul 2024 18:28:00 -0500
Message-Id: <1721345282-10901-3-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721345282-10901-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1721345282-10901-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 23:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202245

From: Mark Hatle <mark.hatle@amd.com>

The process_split_and_strip_files attempts to reconstruct hardlinks
through the .debug directory components.  Unfortunately there was an error
in the 'dest' calculation that cause the SRC and DEST to be the same when
they both exist in the same path.  This did not trigger an error due to
the os.access(fpath) check in the original code.  Fix the dest calculation
by using 'file' instead of target, as this will ensure we get the correct
target filename at all times.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 8a64e13..ce599f1 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1207,7 +1207,7 @@ def process_split_and_strip_files(d):
             target = inodes[ref][0][len(dvar):]
             for file in inodes[ref][1:]:
                 src = file[len(dvar):]
-                dest = dv["libdir"] + os.path.dirname(src) + dv["dir"] + "/" + os.path.basename(target) + dv["append"]
+                dest = dv["libdir"] + os.path.dirname(src) + dv["dir"] + "/" + os.path.basename(file) + dv["append"]
                 fpath = dvar + dest
                 ftarget = dvar + dv["libdir"] + os.path.dirname(target) + dv["dir"] + "/" + os.path.basename(target) + dv["append"]
                 bb.utils.mkdirhier(os.path.dirname(fpath))
-- 
1.8.3.1


