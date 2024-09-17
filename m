Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B755CAC59B
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 20:03:15 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.411.1726603393596431860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 13:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 48HK3CYC021018;
	Tue, 17 Sep 2024 15:03:12 -0500
Received: from localhost.localdomain (70-99-78-137.nuveramail.net [70.99.78.137] (may be forged))
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 48HK3BHQ009365;
	Tue, 17 Sep 2024 15:03:11 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][scarthgap][PATCH] create-sdpx-2.2.bbclass: Switch from exists to isfile checking debugsrc
Date: Tue, 17 Sep 2024 15:03:10 -0500
Message-Id: <20240917200310.3530-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 20:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204628

From: Mark Hatle <mark.hatle@amd.com>

While debugsrc is almost always a file (or link), there are apparently
cases where a directory could be returned from the dwarfsrcfiles
processing.  When this happens, the hashing fails and an error results
when building the SPDX documents.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 02e262c291c0b2066132b4cb2ca5fda8145284a9)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/create-spdx-2.2.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index d104668ffd..ade1a04be3 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -315,7 +315,8 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
                     debugsrc_path = search / debugsrc.replace('/usr/src/kernel/', '')
                 else:
                     debugsrc_path = search / debugsrc.lstrip("/")
-                if not debugsrc_path.exists():
+                # We can only hash files below, skip directories, links, etc.
+                if not os.path.isfile(debugsrc_path):
                     continue
 
                 file_sha256 = bb.utils.sha256_file(debugsrc_path)
-- 
2.39.5 (Apple Git-154)


