Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54A6E668A8
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 12:28:59 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.65991.1732451338550336715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 04:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=dczufavo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202411241228562627748a9460f7d20a-_mzhpm@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202411241228562627748a9460f7d20a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Nov 2024 13:28:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=doxFIzYB4AL6hg6ew/QacvOOV46yPQ3cDdfQwnezmHs=;
 b=dczufavospoc4M7sgnMHmYotm+T90gATkpW1NrhBz3/zaWfAoeMP64RsiK9GABE0MmDPgw
 fprSNcvytnuC972u/0fIzKBxbDAleIVOdfZswclh+KmH4K1vay11DVM51jrceeuDfO0b416k
 pEp0NpEgJSlrn41vTrjUXxT8vqquLoGv8qYdbYibLbzClRKKAwU2N89GeFXzpMv3mkhv+lo0
 aSSqgrpzSz1XMKnzE+mjuYELVxaqJ8S3YFRz2PVSv4wBmqWazZwZEAMB9pJCOvTs08+AYL35
 mO3BDSAIW6wB64RjYbBPv04SPTC/6ESlwChuVTo0Ha4QPAgGzjgG/XOw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] builder: set CVE_PRODUCT
Date: Sun, 24 Nov 2024 13:27:58 +0100
Message-Id: <20241124122758.18056-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 12:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207698

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
index 52c9351f93..f0de410664 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -28,4 +28,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
-CVE_STATUS[CVE-2008-4178] = "cpe-incorrect: This CVE is for an unrelated builder"
+# do not report CVEs for other builder apps
+CVE_PRODUCT = "yocto:builder"
-- 
2.30.2


