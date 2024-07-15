Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B8BC3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:56:12 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.946.1721073370797573437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46FJu7tD023758;
	Mon, 15 Jul 2024 14:56:08 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH 1/2] create-sdpx-2.2.bbclass: Switch from exists to isfile checking debugsrc
Date: Mon, 15 Jul 2024 14:56:06 -0500
Message-Id: <1721073367-2668-2-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721073367-2668-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1721073367-2668-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202066

From: Mark Hatle <mark.hatle@amd.com>

While debugsrc is almost always a file (or link), there are apparently
cases where a directory could be returned from the dwarfsrcfiles
processing.  When this happens, the hashing fails and an error results
when building the SPDX documents.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/create-spdx-2.2.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 239a95d..13d2aa1 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -223,7 +223,8 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
                     debugsrc_path = search / debugsrc.replace('/usr/src/kernel/', '')
                 else:
                     debugsrc_path = search / debugsrc.lstrip("/")
-                if not debugsrc_path.exists():
+                # We can only hash files below, skip directories, links, etc.
+                if not os.path.isfile(debugsrc_path):
                     continue
 
                 file_sha256 = bb.utils.sha256_file(debugsrc_path)
-- 
1.8.3.1


