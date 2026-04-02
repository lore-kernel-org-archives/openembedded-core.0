Return-Path: <pavel@loebl.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99290CC6B19
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 07:35:38 +0000 (UTC)
Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10686.1775115331979370942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 00:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emailprofi.seznam.cz header.s=szn1 header.b=RbPNSa5q;
 spf=none, err=permanent DNS error (domain: loebl.cz, ip: 77.75.78.89, mailfrom: pavel@loebl.cz)
Received: from email.seznam.cz
	by smtpc-mxb-798b96f97c-dtvjf
	(smtpc-mxb-798b96f97c-dtvjf [2a02:598:128:8a00::1000:904])
	id 1bf4b9d7006634031f110055;
	Thu, 02 Apr 2026 09:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1775115328;
	bh=gJcyQFkPVhBgw+9pazvEYIEabNTGgDp397rTZ3+Ykws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=RbPNSa5qznRhlVZfeDo9tB+vk5oQ2cWEbrtKty5D3mJynnIOjrD4WYoebhMsK+8QY
	 sPvtNV2uFH5Sy5BlSQFbRRNy5/wFAp/3oTf3oN08DkofTojgswo2h4RtjnULvBgP62
	 520lPG1spGEMs7fOPDdBRsNWZOoDWnXv60rO+CTSPkF949oUmOpZwk/+LQwU8wyN+K
	 ST/9mdM0Yo5xgPnKTgnvb9tadDtdLaM+y9WQYqzuU7J0aNeoH92KWSkT9I8LMHAMx8
	 joGhN9tzdZ7RUGkqB/mfmh0wW3Krv7ct428PUfjmaDw7+1BtiXHtfya6NROIwKbP7j
	 g1mggDzXOY7GA==
Received: from localhost ([2a03:a900:1020:47::f71])
	by smtpd-relay-789d8dfb5c-8rrnf (szn-email-smtpd/2.0.71) with ESMTPA
	id b0b4add6-fd04-455f-9dd5-36bc41df70a4;
	Thu, 02 Apr 2026 09:35:11 +0200
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: openembedded-core@lists.openembedded.org
Cc: Michelle Lin <michelle.linto91@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	=?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH] uki.bbclass: fix ukify arguments assembly
Date: Thu,  2 Apr 2026 09:33:15 +0200
Message-ID: <20260402073331.2436504-1-pavel@loebl.cz>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234501

Missing space before --uname ukify option mangles the command line
string when KERNEL_VERSION is set.

Signed-off-by: Pavel Löbl <pavel@loebl.cz>
---
 meta/classes-recipe/uki.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index 326697a06660..a89e92b77869 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -140,7 +140,7 @@ python do_uki() {
         # not always needed, ukify can detect version from kernel binary
         kernel_version = d.getVar('KERNEL_VERSION')
         if kernel_version:
-            ukify_cmd += "--uname %s" % (kernel_version)
+            ukify_cmd += " --uname %s" % (kernel_version)
     else:
         bb.fatal("ERROR - UKI_KERNEL_FILENAME not set")
 
-- 
2.53.0


