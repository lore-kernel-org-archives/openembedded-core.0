Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DBCC4450A
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 21:02:18 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1042.1784149336260763536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 14:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MPwyMsaz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202607152102135ab897e95c000207cf-qb4laq@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202607152102135ab897e95c000207cf
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Jul 2026 23:02:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1cRy4t4cX6jFdpWErdJvaQWBCZOl/82TIJzcGgNx2Gc=;
 b=MPwyMsazP34kWtyIcNoJZVDJV/OfPxY5yQajMZT4Xl0aSNPoOo9YlxU9XqhjFAEhDqtrxY
 OM+qEWw97Qykz0SSihaDuAAfeG3R6HHYLFn27ob0dIFYVjeCJyJvezOE7OC1FC0830X+ZtUZ
 ujDRcPWajsKDic8mu3yifdvtngQfCvZI87RghjiyWLzbxu7B8yOqPC1Kwqaic3kDli/byl7Y
 HAm+wViCOcL4g8VknWRJ90VpPbDg7QUwY/VHjXqLisTFa8XGcgT8ZxilvEtFhQg7WKFik4VE
 pvzO+4zUnuCqsrieqyKbJAk2RgKR7+8cqoFHJjiGq638T3q9ze+CxIfA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/2] rootfs: move tasks using image_list_installed_packages to postuninstall
Date: Wed, 15 Jul 2026 23:01:32 +0200
Message-ID: <20260715210132.4974-2-peter.marko@siemens.com>
In-Reply-To: <20260715210132.4974-1-peter.marko@siemens.com>
References: <20260715210132.4974-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 21:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241037

From: Peter Marko <peter.marko@siemens.com>

Since some packages can be uninstalled, any task querying installed
packages should be run only after both installation and uninstallation
is completed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c3097962ac925538e99b17b771c541950a8b8c26)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/license_image.bbclass | 2 +-
 meta/classes/vex.bbclass                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index 95e0a9ba2e..1ecd8f88bc 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -353,7 +353,7 @@ def get_deployed_files(man_file):
             dep_files.append(os.path.basename(f))
     return dep_files
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "write_package_manifest license_create_manifest "
+ROOTFS_POSTUNINSTALL_COMMAND:prepend = "write_package_manifest license_create_manifest "
 POPULATE_SDK_POST_HOST_COMMAND:prepend = "write_sdk_host_package_manifest license_create_sdk_host_manifest "
 POPULATE_SDK_POST_TARGET_COMMAND:prepend = "write_sdk_target_package_manifest license_create_sdk_target_manifest "
 do_rootfs[recrdeptask] += "do_populate_lic"
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 4c36cab581..71be705fc1 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -211,7 +211,7 @@ python vex_write_rootfs_manifest () {
     bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
 }
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest "
+ROOTFS_POSTUNINSTALL_COMMAND:prepend = "vex_write_rootfs_manifest "
 do_rootfs[recrdeptask] += "do_generate_vex "
 do_populate_sdk[recrdeptask] += "do_generate_vex "
 

