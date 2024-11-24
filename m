Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F70E668AA
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 12:38:59 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.65691.1732451928837455824
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 04:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=AjwKANQt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20241124123845aaac0f6254e30029e3-wqp11q@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20241124123845aaac0f6254e30029e3
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Nov 2024 13:38:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AC5ZkdX+ILn9//4s8BZwqkkckQgKb5gtDDS+qT3dTlU=;
 b=AjwKANQt5fkQkZ2ySDhY2NoGMaOpStUUF9XIC5QMmpslwhvUDFgOvC/Bv1h17hD5ICg3KL
 jjB8pQQWSxAkcxWHdqyOpOeub3Sn2BDS7fadQ9jyh0rSGU6fRv6W79607/yJh0ev5SErpFPC
 OEQJdyYd4l+EFEbM/KarzClbO8jWKCJIGaPL6ptDS4Yixda3ILmsUnoSOEoC7lmUO1N6XIOj
 aAZZYPUy1/Fq36zPiGiQ/0js4VSElMSFM50hGuv7Cghcz4CcJvmAsVKn9LFGFdhqpBbz/S4h
 mqryadsJulH+RO1ZoXq7neBmSqxdpiyCRxNYAKqbQ6u/FHkbnMF3ojMw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2] builder: set CVE_PRODUCT
Date: Sun, 24 Nov 2024 13:37:58 +0100
Message-Id: <20241124123758.19491-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 12:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207700

From: Peter Marko <peter.marko@siemens.com>

Builder is a common word and there are many other builder components
which makes us to ignore CVEs for all of them.
There is already 1 ignored and currently 3 new ones.

Instead, set product to yocto to filter them.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: change vendor from yocto to yoctoproject

 meta/recipes-graphics/builder/builder_0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 7719b783c2..39abaf31ce 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,4 +29,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
-CVE_STATUS[CVE-2008-4178] = "cpe-incorrect: This CVE is for an unrelated builder"
+# do not report CVEs for other builder apps
+CVE_PRODUCT = "yoctoproject:builder"
-- 
2.30.2


