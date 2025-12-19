Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D3AD767DB
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 11:12:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14716.1766142767215908782
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 03:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ttVGrXM0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 908124E41CB6
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:12:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6720A6071D
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:12:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8702102F0C7E;
	Fri, 19 Dec 2025 12:12:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766142761; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gsEkydNePmiZjap2jQepmKwKMpk0sMOpC/5liUqSylU=;
	b=ttVGrXM0mP+wGf8kf3nZmL5uai67P+Q8p5pYj2mY9D35iUHA0ypjGpAyM+y69p/tBIf4o8
	AgQHehO/ewbwyVjmaAGZGhH/S/rBHfZA/KvC90Sl9Lb04N8VexwJBUMWBQMViETFHvmJHy
	lYabHNNYIA/Bax5EzvpNyyGFYPvVXjX0FwDPatgZND+JUqN+gFyletpSxXwE/PVhmPcGf+
	IwHGz16IExrVvazzyex7jt0ELZeWz5GcHQ+DTFrPzIPMaGZC7Ac5yjwPL3xYMDOspcTpQt
	k/8+5dMdxN8UdHVbT073HEp/CGeVJge++ZNxo7wevYnow5fIENz7JV0LB/Ca0Q==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 19 Dec 2025 12:12:10 +0100
Subject: [PATCH] fragments/autobuilder: Add back PTEST_EXPECT_FAILURE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-mathieu-ptest-expect-fail-v1-1-d8f30c8b3e68@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAkzRWkC/x3MQQqDMBBG4avIrB1IolXaqxQX0f7RgdaGJEpAv
 LvB5bd476CIIIj0qg4K2CXKfy3QdUXTYtcZLJ9iMso8tNFP/tm0CDb2CTExsseU2Fn5su3H1qF
 RqnM9ld4HOMn3+z2c5wXTR5xqawAAAA==
X-Change-ID: 20251219-mathieu-ptest-expect-fail-a7b4fe3006f7
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766142760; l=1240;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=E7pkD09jGQfTaZNANSqV/LCZ5vjj1eMePkXp4HAhW0w=;
 b=iBZxdKjbfbXJhBSXro0xp/9uKBm+lPNASwvywwUbkD0ScGTiy/Buuf2/th57x5I950TcDXNeM
 CD30uVmQFhvB/sA7055QUuarzLTTSU6sVts28T+iiclhbOU1OyQ2hSX
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228212

The PTEST_EXPECT_FAILURE option setting was recently dropped from
core-image-ptest [1]. This is probably the right thing to do, but we
still want to use it on the autobuilder.

Note, this will now be enabled on all images and not just the ptest
ones, but this should not change the whole behaviour.

[1] https://lists.openembedded.org/g/openembedded-core/message/227412

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/conf/fragments/yocto-autobuilder/autobuilder.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
index 85987b08995a..a9ae99a451e6 100644
--- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -10,4 +10,5 @@ SDK_EXT_TYPE = 'minimal'
 SDK_INCLUDE_TOOLCHAIN = '1'
 ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
 SDK_TOOLCHAIN_LANGS += 'go rust'
+PTEST_EXPECT_FAILURE = '1'
 

---
base-commit: 4bd920ad7d7279020ea6e561d0584ae70f33f751
change-id: 20251219-mathieu-ptest-expect-fail-a7b4fe3006f7

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


