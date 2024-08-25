Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B847C5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 21:45:06 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.40532.1724622297965190962
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 14:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=giYgsS0Q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20240825214455f5ce930bffab45d09c-exerhp@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20240825214455f5ce930bffab45d09c
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Aug 2024 23:44:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=w4DIVxZzV+zNht1Cah53ZI7b5emO0kP8deAPP2OipZY=;
 b=giYgsS0Q67jm909jghEwo44dpgS4OvxMPAumpyUz3F2mSWi7CnIfOKflVoYBetavu44Iyq
 K/M1RD8AwrbRhrrtE2MTJ+qUAEHyRlFseOiHiSmrAh4dKChwNcsXX6o0+ntQ0KgoiYQpaRyK
 HKJXFO1EdP0rj/gy3eszcKgrWWq9Hx2ODhKI4msUmgWx4QamIhS71q2r/RmytvudYL3uCFde
 vLqMuVh9WKLybun8R64AyAqUgPZKvRUWz6mKIvHsnkf39NrkOX/tfIpASd7xx0+UvjHG0KxT
 ueXPMMavzI016LnqD+YR2XrdlC0hr4yDRQV/VDqcpd9AvbZRcB9LGr8w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libyaml: Ignore CVE-2024-35325
Date: Sun, 25 Aug 2024 23:44:13 +0200
Message-Id: <20240825214413.2479354-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 21:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203734

This is similar CVE as the previous ones from the same author.
https://github.com/yaml/libyaml/issues/303 explain why this is misuse
(or wrong use) of libyaml.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index e30dc5a43f..514c60779c 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -20,5 +20,7 @@ DISABLE_STATIC:class-native = ""
 
 # upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302
 CVE_CHECK_IGNORE += "CVE-2024-35326 CVE-2024-35328"
+# upstream-wontfix: Upstream thinks this is a misuse (or wrong use) of the libyaml API - https://github.com/yaml/libyaml/issues/303
+CVE_CHECK_IGNORE += "CVE-2024-35325"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


