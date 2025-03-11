Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CFBC35FF2
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:15:53 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.17343.1741716942392990095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LK10LEFf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250311181547b1b555ee0732ecd5d3-myyrug@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250311181547b1b555ee0732ecd5d3
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:15:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=PYjx9OplIjAvkL5Xa/TbJpkiIeMbRWZ+gMWBCWtWSqA=;
 b=LK10LEFfN2d4Y9Jm8zgmu4SPZLYxL3Slq6Tcavp1IT8C5qTfRSurZcdrGJoL4ig9+ltbv8
 VY++qYVMJ4qQgmH6iPl/uC78Xf+no78mPbC8Of31S95Eiyp1OHRE8Z54j7ocLaltD+G0iicG
 k7TCl8/MSxd82BQP99YuDCeTciZBvR0Odio7oLJ10dzicg8jSjhjNJRx7fZRg2KR5hiFhb2y
 rLYtCq74pwDbTGKyrzSC6eZ7MSKA3U5z1uCt32lKeVgAr95e60sRQvV+tHUzIZ6InJBKQUNM
 Osj+Gdd9/j3lkIZ7mb+k42nmmsuyIg5v4p91w/Yb7ElIlNoRCqF5z7AQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 14/17] grub: patch CVE-2025-1118
Date: Tue, 11 Mar 2025 19:14:21 +0100
Message-Id: <20250311181424.8837-14-peter.marko@siemens.com>
In-Reply-To: <20250311181424.8837-1-peter.marko@siemens.com>
References: <20250311181424.8837-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212608

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2025-1118.patch            | 37 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-1118.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-1118.patch b/meta/recipes-bsp/grub/files/CVE-2025-1118.patch
new file mode 100644
index 0000000000..e6906d909c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-1118.patch
@@ -0,0 +1,37 @@
+From 34824806ac6302f91e8cabaa41308eaced25725f Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Thu, 18 Apr 2024 20:29:39 +0100
+Subject: [PATCH] commands/minicmd: Block the dump command in lockdown mode
+
+The dump enables a user to read memory which should not be possible
+in lockdown mode.
+
+Fixes: CVE-2025-1118
+
+Reported-by: B Horn <b@horn.uk>
+Reported-by: Jonathan Bar Or <jonathanbaror@gmail.com>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-1118
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=34824806ac6302f91e8cabaa41308eaced25725f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/commands/minicmd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/commands/minicmd.c b/grub-core/commands/minicmd.c
+index 286290866..8c5ee3e60 100644
+--- a/grub-core/commands/minicmd.c
++++ b/grub-core/commands/minicmd.c
+@@ -203,8 +203,8 @@ GRUB_MOD_INIT(minicmd)
+     grub_register_command ("help", grub_mini_cmd_help,
+ 			   0, N_("Show this message."));
+   cmd_dump =
+-    grub_register_command ("dump", grub_mini_cmd_dump,
+-			   N_("ADDR [SIZE]"), N_("Show memory contents."));
++    grub_register_command_lockdown ("dump", grub_mini_cmd_dump,
++				    N_("ADDR [SIZE]"), N_("Show memory contents."));
+   cmd_rmmod =
+     grub_register_command ("rmmod", grub_mini_cmd_rmmod,
+ 			   N_("MODULE"), N_("Remove a module."));
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 6f0c8a133f..bd0c9d2601 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -32,6 +32,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45776.patch \
            file://CVE-2024-45777.patch \
            file://CVE-2025-0690.patch \
+           file://CVE-2025-1118.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

