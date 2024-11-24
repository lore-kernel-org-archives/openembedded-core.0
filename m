Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDC1E668AC
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 12:40:29 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.66092.1732452026168809711
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 04:40:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=RvLYIwTK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20241124124023b59a9e0d5c74e9684a-u_r1ka@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20241124124023b59a9e0d5c74e9684a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Nov 2024 13:40:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=7zHH4yPSBpWZ424OrlygUZMcfrM/+BkAg/wf+OAE37k=;
 b=RvLYIwTKI2/miNYjMTGKZoCBBsp2xhBfhaN9Lukyp7F6fqRGCDcV28JzIMfWGW+VVS/t2Y
 wVoVClQjZknuezVWfROMlAsdicTmT5DWZCa/4sL4qlm+JnoQcwkM0ih+kT3FRkTtufkc0mY/
 jNmIMXA+3WY4P9sR1gjLztL175tmfeL8Oz2biUEuIAOQVx7kFkX3sLiR3777XJ1W98rlIjLE
 x/upr4HDVeFCc4I58/myVZp89fkZHhjuqliJLwfec4GLljRHJc0cKRaSEgZ4f0+inh7lzpFU
 6G+MFDgbQnCzLIhjsEVADXv4k8X7zB1cH/OxwXDMyIOIXxAWOS+f/8ww==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH v2] builder: set CVE_PRODUCT
Date: Sun, 24 Nov 2024 13:39:35 +0100
Message-Id: <20241124123935.19595-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 12:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207702

From: Peter Marko <peter.marko@siemens.com>

Builder is a common word and there are many other builder components
which makes us to ignore CVEs for all of them.
There is already 1 ignored and currently 3 new ones.

Instead, set product to yocto to filter them.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: change vendor from yocto to yoctoproject

 meta/recipes-graphics/builder/builder_0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 39be3bd63f..719db90530 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,5 +29,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
-# -4178 is an unrelated 'builder'
-CVE_CHECK_IGNORE = "CVE-2008-4178"
+# do not report CVEs for other builder apps
+CVE_PRODUCT = "yoctoproject:builder"
-- 
2.30.2


