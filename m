Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D339BC021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 12:07:40 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.7644.1740830855293035047
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 04:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Iv26GLFZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250301120732bca7c55b025b94538d-oyzqst@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250301120732bca7c55b025b94538d
        for <openembedded-core@lists.openembedded.org>;
        Sat, 01 Mar 2025 13:07:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zrwvuBPoNVHHMdfJbrzWUDBW/uc3q+olVQPmu3MQkIU=;
 b=Iv26GLFZhRMhe4t5j1l7ae8uyzUEfON2FqZd3HMtC1bNiBzo5ao81HagB0CSXDYDsLvc8T
 Xj9AIpwsTiGl/+EFjw5jt80EBYjtwzEyD1qCiJ1aJKoQEJJu1OrnIyJMio7jnLIJVyW8u2I8
 yLheHozSuPJI4UBARaKKGIBbl3XTK4Qf0j2a0bmFhALvojbppWOk0pH9fOLW1DuK+zyXbIsy
 zJ4YRE6hsuygsY1dLDjY4xDJKN0ESAR9fIoYCzfZDBLf/FsazJjASnKy4pOpOtnzOwy1crN4
 D7zUmQ3MhfRciA/qAVmgMtAWb/HfgtbmPyHEjHxmk2L+4pNpHb8pN1JQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] Revert "cve-update-nvd2-native: Tweak to work better with NFS DL_DIR"
Date: Sat,  1 Mar 2025 13:06:39 +0100
Message-Id: <20250301120639.12037-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 12:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212181

From: Peter Marko <peter.marko@siemens.com>

This reverts commit 7adaec468d3a61d88c990b1b319b34850bee7e44.

It does not seem to fix the issue it was supposed to fix.
Additionally it breaks code which decides in full/partial update,
because it manipulates timestamp that code is relying on.
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 8ef13bdde6f..a68a8bb89f1 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -90,8 +90,6 @@ python do_fetch() {
     if update_db_file(db_tmp_file, d, database_time) == True:
         # Update downloaded correctly, can swap files
         shutil.move(db_tmp_file, db_file)
-        # Need to 'touch' the file to ensure NFS sees the data
-        os.utime(db_file)
     else:
         # Update failed, do not modify the database
         bb.warn("CVE database update failed")

