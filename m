Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8354DC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 12:16:38 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.5956.1742472994711358743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 05:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=a00amRqY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202503201216314fc85ba91791087546-wntxp6@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202503201216314fc85ba91791087546
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Mar 2025 13:16:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=l3i7b5DKVYGWmfX16azqKbN08oV20KZEqiGR+IOCuuE=;
 b=a00amRqY/7SY4v85bqq6G7OFh0VsL1xvOi1ialubeyiv1Yjti4VPYNuNsKYiRL6NdREQ/H
 BvP5+QDVOfYknDNxzH/Va4IKEKa8edmwXHwRUDfOej4UF60WJcP4GEVBZ/cJQZ6kEyO3e2DZ
 cmOpRWaehEe89ppMhcAKpPk3uMqjNNtlGAEg8nOgks1x6NYuol7xUPm9EGaqZ5Ld4tDwbd5o
 CVAGauKijIDMLpzgz19DLZyAOjx/XIU359tQd2oHfFc9a8/p1FWBdInJ7I50mc7/0bVAEfmY
 2WJ1mn7aDaQJfyxhzCIRjW7+n091TtwmQsDn5BKZqG5E/Jr7/WB59tNA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] spdx30: handle links to inaccessible locations
Date: Thu, 20 Mar 2025 13:15:33 +0100
Message-Id: <20250320121533.39356-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 12:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213385

From: Peter Marko <peter.marko@siemens.com>

This is the same as e105befbe4ee0d85e94c2048a744f0373e2dbcdf on
additional place in the code.

When a link is pointing to location inaccessible to build user (e.g. "/root/something"),
filepath.is_file() throws "PermissionError: [Errno 13] Permission denied".
Fix this by first checking if it is a link.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 0618f2f139..bba11ae930 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1068,7 +1068,7 @@ def create_rootfs_spdx(d):
         filenames.sort()
         for fn in filenames:
             fpath = Path(dirpath) / fn
-            if not fpath.is_file() or fpath.is_symlink():
+            if fpath.is_symlink() or not fpath.is_file():
                 continue
 
             relpath = str(fpath.relative_to(image_rootfs))

