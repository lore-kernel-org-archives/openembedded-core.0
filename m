Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3374C71141
	for <webhook@archiver.kernel.org>; Sat, 14 Jun 2025 07:48:35 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.6230.1749887307146839992
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jun 2025 00:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=v77KDhYo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202506140748221a286e560a57320788-pjrkpd@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202506140748221a286e560a57320788
        for <openembedded-core@lists.openembedded.org>;
        Sat, 14 Jun 2025 09:48:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gKLgIRQgVOu13TsDCk87FKFqH+7NYhL5YWOeUeAucxM=;
 b=v77KDhYoHiHRCzgU23P2EiymS/Cbi75uDcS8I2fmJ3Vr079ImDdEnCflMvp5xhkeTlv5xF
 h7DnT7Oay5ItVM2L6FVUlwDMwn9RAL8Zyf1CLmjBLd2DJQiGwf2c0L7ttXo1FE4ia09+zcz7
 HUQGXiVVYDDZEnDf+0MncQGetd9HgKA6jYBeWLd8YbLWefNxvYOe6jQHLLvMruJmcuERRLl1
 Z80H7EU/D8Anc4jUfzfWa6PpLz0bTF/uHTiT4liEnpcL409hfVWW9IIfbPjaU0TNDmsuOs4m
 euAv723NezvUGEOWiciZTsYO2FX6K/vEUWSjsoP1aQzfNccpQuv2waSA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][walnascar][PATCH] testimage: get real os-release file
Date: Sat, 14 Jun 2025 09:47:33 +0200
Message-Id: <20250614074733.7751-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 07:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218634

From: Peter Marko <peter.marko@siemens.com>

/etc/os-release is a symlink to /usr/lib.
Symlink is retrieved as a dead link which points to nowhere if also the
original file is not accompanying it.
Fetch the real file in addition to this link.

Alternative could be to use "tar -h" (supported also by busybox tar),
however that could lose some important information if links are relevant
for failure analysis.

(From OE-Core rev: ed43f9ccb3c08845259e24440912631afd780d12)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index e090b1ef4b..847a6f18a8 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -26,7 +26,9 @@ TESTIMAGE_FAILED_QA_ARTIFACTS = "\
     ${localstatedir}/log \
     ${localstatedir}/volatile/log \
     ${sysconfdir}/version \
-    ${sysconfdir}/os-release"
+    ${sysconfdir}/os-release \
+    ${nonarch_libdir}/os-release \
+"
 
 # If some ptests are run and fail, retrieve corresponding directories
 TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/*/ptest', '', d)}"

