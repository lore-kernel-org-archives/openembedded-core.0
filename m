Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD7AC3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 11:12:41 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.49246.1743419554745927357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 04:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=G9emu4Kk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250331111232f7f07222c02e262649-bvlovt@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250331111232f7f07222c02e262649
        for <openembedded-core@lists.openembedded.org>;
        Mon, 31 Mar 2025 13:12:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+TeNd0rsTD8JixmRh5soafbdaJZS8wR26uU0ZHuRjFs=;
 b=G9emu4KkeJwdXb209yY90R3QrGB6JOxQoh7VtExxILMzpNOD6HfLWn4RwegJ/dUprtVO6z
 4ymyFqRdrTd/CeeUHzEcs+MvhCXtdItJHTrEckcN8NY1LCDELglz/Eq4nxzZTlNnMgwz/A6f
 ycrJfIHStWtqqIsjgGtr+5vLThgAO6XjshPWzmZZuyOxYs0BWRKLuxlMLJ/jMxXlOQ8UCW+C
 4ui2aPzzlsN9aEhJw/hfCupyPxR8LIC4DqTrB6nAO2MuBCczyLX4PiIAasERhMK1N8daxpBq
 a27KZW3dvzi/QUkrYWxOegOPaG6rmeyvgo1U1DtyWUmn+DSfy/C/EBfA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Marta Rybczynska <rybczynska@gmail.com>
Subject: [OE-core][PATCH 2/2] spdx30: handle Unknown CVE_STATUS
Date: Mon, 31 Mar 2025 13:11:28 +0200
Message-Id: <20250331111128.317469-2-peter.marko@siemens.com>
In-Reply-To: <20250331111128.317469-1-peter.marko@siemens.com>
References: <20250331111128.317469-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 11:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213965

From: Peter Marko <peter.marko@siemens.com>

CVE_STATUS can be also "Unknown" since oe-core commit
d25f1817752bc8a84c40dcbef75f7559801ce15e

When this status type is used, build fails with e.g.
ERROR: openssl-3.4.1-r0 do_create_spdx: Unknown CVE-2025-0001 status 'Unknown'

Since this is now a valid status, it needs to be handled.
It cannot be mapped to any VEX status (see below), so just skip it.
Possible VEX statuses are: NOT AFFECTED, AFFECTED, FIXED, and UNDER INVESTIGATION.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
cc: Marta Rybczynska <rybczynska@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 52329760b6..ba965821f8 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -724,6 +724,8 @@ def create_spdx(d):
                                 )
                         else:
                             bb.fatal(f"Unknown detail '{detail}' for ignored {cve}")
+                    elif status == "Unknown":
+                        bb.note(f"Skipping {cve} with status 'Unknown'")
                     else:
                         bb.fatal(f"Unknown {cve} status '{status}'")
 

