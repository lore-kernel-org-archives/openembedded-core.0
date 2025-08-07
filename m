Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C809DC87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 17:51:42 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.2414.1754589097148011386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 10:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ZjgrEQ1y;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250807175133025d6c6cf48c80342e-zn8jx1@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250807175133025d6c6cf48c80342e
        for <openembedded-core@lists.openembedded.org>;
        Thu, 07 Aug 2025 19:51:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hVPNBt8He/sCCxOUk3RFXqyxLsXHyWTaKWJrw02xs+0=;
 b=ZjgrEQ1ynplNjC8pqFs1qjNlz8BvvcvojeeIQWHrp/O4rKCL00hsZTw0PsNErW2/3l5AO3
 ccrCoVxAJTzPA0IV5WD3cq98tk3k89oN7QHMUTR8boz9SQVlKWX5dLpwimgeuuXF7FB3BdqJ
 24sF4b82yYUJHUP6vv6cu9G/GAxubQjdMp0JjYX7gq1VktlCEbV4N/po5QM/kYHXDGvQ2ZgL
 8Q+/catPHn2Hghwy/YKg7oNf+QnpnTVhfZYQS4fSHiSf3U7t8HA+QgU4OAEtLYXbUrZn5hta
 1SUSGE/tfODd0WRRO04i2GVMUttHQT7egBEprlu2lAtWUnQhTPCNer3A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] ccache: do not use ccache if it is explicitly forbidden
Date: Thu,  7 Aug 2025 19:50:45 +0200
Message-Id: <20250807175045.13854-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 17:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221572

From: Peter Marko <peter.marko@siemens.com>

Some recipes explicitly disable ccache via CCACHE_DISABLE variable since
they are known issues with ccache in those recipes.
This setting should not be ignored also when ccache in in HOSTOOLS.

Rework a hard to read if clause so that it is in format
if (not CCACHE_DISABLE and (cond1 or cond2 or cond2)):

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/ccache.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 5ce23e50f3..f6bd972ff4 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -51,10 +51,10 @@ python() {
     Enable ccache for the recipe
     """
     pn = d.getVar('PN')
-    if ("ccache" in d.getVar("HOSTTOOLS").split() or
+    if (not bb.utils.to_boolean(d.getVar('CCACHE_DISABLE')) and
+        ("ccache" in d.getVar("HOSTTOOLS").split() or
         pn in d.getVar('CCACHE_NATIVE_RECIPES_ALLOWED') or
-        not (bb.data.inherits_class("native", d) or
-        bb.utils.to_boolean(d.getVar('CCACHE_DISABLE')))):
+        not bb.data.inherits_class("native", d))):
         d.appendVar('DEPENDS', ' ccache-native')
         d.setVar('CCACHE', 'ccache ')
 }

