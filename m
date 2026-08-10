Return-Path: <sh0127.shin@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21416C5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 09:40:03 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26364.1786354800150667852
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 02:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: sh0127.shin@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 10 Aug 2026 18:39:57 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: sh0127.shin@lge.com
Received: from unknown (HELO swfarm-oeci-r122-2204..) (156.147.61.178)
	by 156.147.1.121 with ESMTP; 10 Aug 2026 18:39:56 +0900
X-Original-SENDERIP: 156.147.61.178
X-Original-MAILFROM: sh0127.shin@lge.com
From: sh0127.shin@lge.com
To: openembedded-core@lists.openembedded.org,
	sh0127.shin@lge.com
Subject: [PATCH 1/2] npm.bbclass: fix typo in npm_pack tar exclude path
Date: Mon, 10 Aug 2026 09:39:46 +0000
Message-Id: <20260810093947.2289126-1-sh0127.shin@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 09:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243120

From: "sh0127.shin" <sh0127.shin@lge.com>

The hardcoded exclude path './node-modules' used a hyphen instead of
an underscore, which is the standard npm directory name. As a result,
the node_modules directory was never actually excluded during tar
packing.

Fix the typo by changing './node-modules' to './node_modules'.

Signed-off-by: sh0127.shin <sh0127.shin@lge.com>
---
 meta/classes-recipe/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index b1183a7ae3..f465ff10d7 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -82,7 +82,7 @@ def npm_pack(env, srcdir, workdir):
     # TODO: real 'npm pack' does not include directories while 'tar'
     # does.  But this does not seem to matter...
     subprocess.run(['tar', 'czf', tarball,
-                    '--exclude', './node-modules',
+                    '--exclude', './node_modules',
                     '--exclude-vcs',
                     '--transform', r's,^\./,package/,',
                     '--mtime', '1985-10-26T08:15:00.000Z',
-- 
2.34.1


