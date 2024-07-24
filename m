Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FE4C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 23:39:33 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.24268.1721864362995532277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 16:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46ONdIs8026133;
	Wed, 24 Jul 2024 18:39:19 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH 1/2] spdx30_tasks.py: switch from exists to isfile checking debugsrc
Date: Wed, 24 Jul 2024 18:39:17 -0500
Message-Id: <1721864358-26583-2-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721864358-26583-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1721864358-26583-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 23:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202491

From: Mark Hatle <mark.hatle@amd.com>

Same change as previously made to the create-spdx-2.2.bbclass,
while debugsrc is almost always a file (or link), there are apparently
cases where a directory could be returned from the dwarfsrcfiles
processing.  When this happens, the hashing fails and an error results
when building the SPDX documents.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/lib/oe/spdx30_tasks.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 7baa6be70e..9d5bbadc0f 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -238,7 +238,8 @@ def get_package_sources_from_debug(
                     if file_sha256 is None:
                         continue
                 else:
-                    if not debugsrc_path.exists():
+                    # We can only hash files below, skip directories, links, etc.
+                    if not debugsrc_path.isfile():
                         source_hash_cache[debugsrc_path] = None
                         continue
 
-- 
2.34.1


