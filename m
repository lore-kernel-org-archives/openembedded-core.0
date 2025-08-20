Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AE2CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 16:25:14 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.1490.1755707106647974726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 09:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LvSVscjD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250820162501fd7cd71c7bc7d99777-mc1y7y@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250820162501fd7cd71c7bc7d99777
        for <openembedded-core@lists.openembedded.org>;
        Wed, 20 Aug 2025 18:25:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vYb1cpdR7SYf6Wq4h8tIE7pZS6K0w8XNiMiPky50Kdg=;
 b=LvSVscjDpiD47Ww/ThoiPqLieXm7xxVwX+OQfeukcugiS3zDQOM+5E0YzIxgH6GaoF4Kf9
 3d8dvMQaV6L1WYerHf0s5WtZ/eVedYlaQBRKzrP3exNAHIyhRtDr5b9+5538nxoRs41IJ8kj
 2ewkz15YbXEov9tcDsHeFcSoVRq/WkOF0+39wtvGGm04f7lb/Bggg7npJsJce+jNq4af9IfV
 0Fvyg6OYIBhq3gXhKMxTkJwjhi2Z9eKX1KMLDPecFFdSWNATiZZzmd3Hh1MwpEYYW0gaU1hR
 AP9unbg8JXTcX1Tl5PzznP5NyKi7QyhLRsQK8hnsTJy5O+K9H0s3dkBQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH] Revert "dpkg: set status for CVE-2025-6297"
Date: Wed, 20 Aug 2025 18:24:14 +0200
Message-Id: <20250820162414.9353-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 16:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222192

From: Peter Marko <peter.marko@siemens.com>

This reverts commit 5dce840ba8f409490cca5dce9fe504c9115fb4e5.

CVE entry was corrected in NVD DB.
It looks like NVD is now getting faster and more reliable with
annotations...

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/dpkg/dpkg_1.22.21.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
index 69b3c3d880..d793c26d57 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
@@ -19,6 +19,3 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.22.
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
 SRCREV = "d72b038fd2113cb62972e4071db03dd1388394d8"
-
-# NVD tracks this CVE as "Up to (excluding) 2025-06-30" (which is fix commit date, not dpkg version)
-CVE_STATUS[CVE-2025-6297] = "cpe-incorrect: this is fixed in 1.22.21"

