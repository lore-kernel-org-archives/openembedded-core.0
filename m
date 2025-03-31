Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A54C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 11:12:31 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.49244.1743419548730020127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 04:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=fV00BAGb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202503311112269d8398333884602c25-gpnafq@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202503311112269d8398333884602c25
        for <openembedded-core@lists.openembedded.org>;
        Mon, 31 Mar 2025 13:12:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Wl8oKLdvVtlML1XkFgw9ZHxRoUNocrSELvxSZbrjk+g=;
 b=fV00BAGbD+jHR4oujjDiQh3ysz1U8eXnkmwDQSt6SqK0DG5tv0YmbroAZjfa45ibm/NC60
 XwDJLZIQzH4bP9xBQqlH/ZhEKTrKRy28y7cJ1S3cfCuLkl6++W4W5/Lg/GnueA9g/tznwFj+
 eQBOO8/3eD9Jhnij5zHE90RKiypKrtgDxa5PgI4ECUC4x0HzWH56Dqr43C8kP7cdN57gCagn
 EGUFDvhrTAOj+mUyv3v4ZcWC0pj5lPCCwFIqd94A7RBZrzKMiKFdK6Pw8tqPNULfx1XD+X5b
 1MACcQX/iP8vo483wl6YT61g+efoeA+F5jcejDCsHV3e7CL77InInrTQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/2] create-spdx-3.0: make create_spdx depend on CVE_STATUS
Date: Mon, 31 Mar 2025 13:11:27 +0200
Message-Id: <20250331111128.317469-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 11:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213964

From: Peter Marko <peter.marko@siemens.com>

SPDX3 classes now add CVE_STATUS information to spdx.
So the task needs to be rebuilt when CVE_STATUS changes.

This is true since commit 1ff496546279d8a97df5ec475007cfb095c2a0bc

Signed-off-by: Peter Marko <peter.marko@siemens.com>
cc: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 044517d9f7..235bd804bd 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -138,6 +138,7 @@ python do_create_spdx() {
     oe.spdx30_tasks.create_spdx(d)
 }
 do_create_spdx[vardeps] += "\
+    CVE_STATUS \
     SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
     SPDX_PACKAGE_ADDITIONAL_PURPOSE \
     SPDX_PROFILES \

