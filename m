Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04B3C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 21:54:10 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web12.294.1665093250055011107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 14:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 296Ls9Lc022252
	for <openembedded-core@lists.openembedded.org>;
 Thu, 6 Oct 2022 16:54:09 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [langdale,master][PATCH] insane.bbclass: Allow hashlib version that
 only accepts on parameter
Date: Thu,  6 Oct 2022 16:54:07 -0500
Message-Id: <1665093247-28287-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 21:54:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171515

Some versions of hashlib don't appear to implement the second FIPS
related argument.  Detect this and support both versions.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
This was found on an internal Ubuntu 18.04 container.  Unfortunately I
don't have access to the container itself but this resolves the issue.

 meta/classes-global/insane.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index db34b4bdb5..dc46857a19 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -555,7 +555,10 @@ python populate_lic_qa_checksum() {
                 import hashlib
                 lineno = 0
                 license = []
-                m = hashlib.new('MD5', usedforsecurity=False)
+                try:
+                    m = hashlib.new('MD5', usedforsecurity=False)
+                except TypeError:
+                    m = hashlib.new('MD5')
                 for line in f:
                     lineno += 1
                     if (lineno >= beginline):
-- 
2.17.1


