Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D3DC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 01:37:29 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web08.3372.1646098648954462238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net (ip203.trans.bevcomm.net
 [76.164.132.203] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2211bRbR020212
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 19:37:27 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] insane.bbclass: Update insane.bbclass to work on FIPS
 enabled hosts
Date: Mon, 28 Feb 2022 19:37:26 -0600
Message-Id: <20220301013726.1381053-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301013726.1381053-1-mark.hatle@kernel.crashing.org>
References: <20220301013726.1381053-1-mark.hatle@kernel.crashing.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 01:37:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162520

hashlib.md5() is not permitted on a FIPS enabled host system.  This is due
to md5 not being an approved hash algorithm.

Instead use:
 hashlib.new('MD5', usedforsecurity=False)

This is allowed, as it's clear the hash is used for a non-security purpose.

Using an md5 to identify when a license has changed is permitted, as we're
not using it for file integrity.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 890e865a8f..29b9b3d466 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -549,7 +549,7 @@ python populate_lic_qa_checksum() {
                 import hashlib
                 lineno = 0
                 license = []
-                m = hashlib.md5()
+                m = hashlib.new('MD5', usedforsecurity=False)
                 for line in f:
                     lineno += 1
                     if (lineno >= beginline):
-- 
2.25.1


