Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08155C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 11:46:52 +0000 (UTC)
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
 by mx.groups.io with SMTP id smtpd.web11.67729.1738928807454780435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 03:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YqByY4hByz15FL;
	Fri,  7 Feb 2025 12:46:45 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YqByX6VlhzLFT;
	Fri,  7 Feb 2025 12:46:44 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 07 Feb 2025 12:46:35 +0100
Subject: [PATCH] b4-wrapper-poky.py: send changes to .b4-config to the poky
 mailing list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-b4-config-poky-v1-1-77e73a81b12d@cherry.de>
X-B4-Tracking: v=1; b=H4sIAJrypWcC/x3MQQqAIBBA0avErBuwoRK7SrTIGmsINBSiCO+et
 HyL/19IHIUTDNULkS9JEnxBU1ew7LPfGGUtBlLUKVIabYtL8E42PMPxIFtDvXaWrDJQojOyk/s
 fjlPOH1DAc9lgAAAA
X-Change-ID: 20250207-b4-config-poky-eb9267fb2b09
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 11:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210980

From: Quentin Schulz <quentin.schulz@cherry.de>

Both OE-Core and poky git repos have a .b4-config, both at the same
location and both different.

Therefore, changes made to .b4-config for OE-Core need to be sent to the
OE-Core mailing list and changes made to .b4-config for poky sent to the
poky mailing list.

Changes made to OE-Core's .b4-config can only be made from a vanilla
OE-Core git repo, not from poky git repo. With the current content of
OE-Core's .b4-config, b4-wrapper-poky.py script is NOT called to figure
out where to send patches, b4 gets it from the hardcoded value in
send-series-to.

Thus, we can say that if b4-wrapper-poky.py detects changes for
.b4-config, those changes are for poky since this script wouldn't be run
by b4 outside of poky git repo.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 scripts/b4-wrapper-poky.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/b4-wrapper-poky.py b/scripts/b4-wrapper-poky.py
index 30a7b95ff3acda5e56cab8ad15a2713f11e2feec..ec6568eb9b7cab389178c08173a43caa2fc6bd48 100755
--- a/scripts/b4-wrapper-poky.py
+++ b/scripts/b4-wrapper-poky.py
@@ -102,6 +102,11 @@ try:
                     "meta-yocto-bsp/*",
                     "README.hardware.md",
                     "README.poky.md",
+                    # scripts/b4-wrapper-poky.py is only run by b4 when in poky
+                    # git repo. With that limitation, changes made to .b4-config
+                    # can only be for poky's and not OE-Core's as only poky's is
+                    # stored in poky git repo.
+                    ".b4-config",
                     ],
         }
 

---
base-commit: 136f0edb75d9601a0ae56e025419d3cddfb90219
change-id: 20250207-b4-config-poky-eb9267fb2b09

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


