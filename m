Return-Path: <pbarker.renesas@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146CEC54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:29:17 +0000 (UTC)
Received: from relmlie6.idc.renesas.com (relmlie6.idc.renesas.com [210.160.252.172])
 by mx.groups.io with SMTP id smtpd.web11.1917.1710350951633907017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: bp.renesas.com, ip: 210.160.252.172, mailfrom: paul.barker.ct@bp.renesas.com)
X-IronPort-AV: E=Sophos;i="6.07,123,1708354800"; 
   d="scan'208";a="201534699"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Mar 2024 02:29:09 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.237])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2CBF44007533;
	Thu, 14 Mar 2024 02:29:07 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: [PATCH] kernel: Fix check_oldest_kernel
Date: Wed, 13 Mar 2024 17:28:41 +0000
Message-Id: <20240313172842.4631-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197052

The check_oldest_kernel() function requires utsrelease.h to be
generated. This file is generated during do_compile, so we need to delay
calling check_oldest_kernel() until after this.

With this change in place, I now see the expected warning when building
Linux 5.10.y.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index db4461e551e4..b084d6d69dc1 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -645,7 +645,7 @@ python check_oldest_kernel() {
 }
 
 check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
-do_configure[prefuncs] += "check_oldest_kernel"
+do_compile[postfuncs] += "check_oldest_kernel"
 
 KERNEL_LOCALVERSION ??= ""
 
-- 
2.44.0


