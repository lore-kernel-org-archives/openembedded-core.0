Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64D8E668A9
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 12:29:49 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.65997.1732451385254488253
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 04:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=S5vLaeSo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20241124122943d8e87a5b0e3f307f2a-1upuv4@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20241124122943d8e87a5b0e3f307f2a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Nov 2024 13:29:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=HDjyc1GSAbygRBTXtE2Wgom69pnCie78BTFHTBkYOz8=;
 b=S5vLaeSovFTovg6LTLl7kEcA8uWTMz9OKsHtXppEuPLQ0fUPf0xUvEZFcuBlctXbWmFguw
 doEqKR3eYxynw6qK7UFGXlUFjaAbSxF2gIShIPYx7u237GMHN3Mnez/+Gu9egRqDfjkUODFG
 5CLo04uJtBjD1rMluxVlEQ2FuMZQ2/ydhqCyChH0stVzlCexWM9vLxEJnI4PyYK8nLGMJJ+J
 hSNnZAOGIIq1x1Ivj+luqHVNVSa/EHDrcWzV/1/ekoOWRbwSX9eJzPUb/6EKo+BFRoNzQPdu
 SyfI8RqBcrZsqM/Ku6GmkVGpfJu/dTfcNOBbwXpsEF+7Wd9My8GP2aeA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] builder: set CVE_PRODUCT
Date: Sun, 24 Nov 2024 13:28:55 +0100
Message-Id: <20241124122855.18110-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 12:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207699

From: Peter Marko <peter.marko@siemens.com>

Builder is a common word and there are many other builder components
which makes us to ignore CVEs for all of them.
There is already 1 ignored and currently 3 new ones.

Instead, set product to yocto to filter them.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 39be3bd63f..d319ccab71 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,5 +29,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
-# -4178 is an unrelated 'builder'
-CVE_CHECK_IGNORE = "CVE-2008-4178"
+# do not report CVEs for other builder apps
+CVE_PRODUCT = "yocto:builder"
-- 
2.30.2


