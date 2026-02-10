Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216C5EA3F22
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 08:20:33 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15658.1770711622543412051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 00:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ipJuP6Lk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260210082018303a65917a0002074f-0y0kbo@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260210082018303a65917a0002074f
        for <openembedded-core@lists.openembedded.org>;
        Tue, 10 Feb 2026 09:20:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BXLMvIQa6RRT/8B2JgBqUyFlaif51l1eJ1HbzevcAzI=;
 b=ipJuP6LknM8SutIfF8JbYv3sEd4iwPz9/HhpeZnJT2OQW9TVGI4PlLbcY2S2unvSpO75KL
 n2cZmcdDCN8VhCZz5GrfCwrdOGK5kcwjQMPCfoxF6BOcZmWZycfvcXZ//eZ2dxMo6Ln3Wmo1
 YfkRSwWhtwNp9lWuFuj6OBpb9hkpW2il9LTQm7i5WV283q0yz5zI7HuGnTo1QMtXPf7Tnpt0
 bNQ88fLK0VeMrTQ6mU6SSFffdWBwxrtdDjIlh9CGicS4iEj8ecD/+FFe9mRve2B+1C4Z/C5y
 XJe/E7KU+ZVpVzGWyJUJ1zwiCkZva6Z892o6XTHhfY+FA3lzJf4AEeSQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] mtd-utils: fix ubifs packaging
Date: Tue, 10 Feb 2026 09:20:12 +0100
Message-Id: <20260210082012.86981-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 08:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230862

From: Peter Marko <peter.marko@siemens.com>

This change moves fsck.ubifs and mount.ubifs to correct package.

Noticed when lzo was installed to ubi-less image additionally when
upgrading from scarthgap to master as being dependency of fsck.ubifs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
index 08ab677676..545f0d68d5 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
@@ -83,7 +83,7 @@ PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "ubifs", "mtd-utils-ubifs", "
 
 FILES:mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
 FILES:mtd-utils-ubifs = "\
-    ${sbindir}/mkfs.ubifs \
+    ${sbindir}/*.ubifs \
     ${sbindir}/ubi* \
     ${@bb.utils.contains('PACKAGECONFIG', 'ubihealthd-service', '${systemd_system_unitdir}/ubihealthd.service', '', d)} \
     "

