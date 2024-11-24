Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0893E668A7
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 12:28:09 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.65582.1732451285062796738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 04:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=QoXWWXCr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241124122801cf40a6ff1e8ddbf1f8-ws07mb@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241124122801cf40a6ff1e8ddbf1f8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Nov 2024 13:28:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ENN7wwzIYNoBauoA25K3VMITgIkHsoUWLi7ECeby4BE=;
 b=QoXWWXCr/dBRHuqyDAd99berAwXP7gwA4axNTftU5+cqbqHrZq6TSWwg/pY66Cxq73rlCh
 jQNUz7TjZ01GxCQ8M01kpzdrrgYxveGEP3ZBdUJuh5P32IM4jdM01xVBnvorWEUmqLkNRbiS
 8aED0w0vS/LRCfpPt6vtxyX0nO4fjbagHaN7kgeVf91o5gN7SRMSIzid2+9nhkvoi8EyZqIB
 zw0e8QXI5wCBjEI0baMOI5ELk6OraXGDtaU0/wT6yH8ZRlf8NCX8wxJThG8nltD7rj8vcGVr
 oW8I60CBeZ7uYREV2/55ioa6AYsE18eMW5jeuLPsnz4yrLhVATI5CxWA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] builder: set CVE_PRODUCT
Date: Sun, 24 Nov 2024 13:27:11 +0100
Message-Id: <20241124122711.18001-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207697

From: Peter Marko <peter.marko@siemens.com>

Builder is a common word and there are many other builder components
which makes us to ignore CVEs for all of them.
There is already 1 ignored and currently 3 new ones.

Instead, set product to yocto to filter them.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 7719b783c2..c0c271d564 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,4 +29,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
-CVE_STATUS[CVE-2008-4178] = "cpe-incorrect: This CVE is for an unrelated builder"
+# do not report CVEs for other builder apps
+CVE_PRODUCT = "yocto:builder"
-- 
2.30.2


