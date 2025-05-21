Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302DEC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 18:33:04 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.6380.1747852378759190491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 11:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YwVKUfqG;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54LIWw4c369179
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747852378;
	bh=WLDwWW44/ZDgIJaiZ2/Xf4GqLq+DUI0NTEbQMgmAzSw=;
	h=From:To:Subject:Date;
	b=YwVKUfqGrzHvm/KzYs5fN2jj3r3t6gcr6qTgx8SyGWmsmF89HuQ4tRW7bxR+fLjl9
	 LhAOHUaNMRtJYpa+TC15dvGZsGmQ7AnD7rq7h43ZbG1PpzAOzRnVT7pPMO4QfzxwAU
	 G5Fjfj/+K3HfyisZN7tDI/PLIIbSAcP4uJfmfSHU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54LIWwG32359468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:32:58 -0500
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 May 2025 13:32:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Wed, 21 May
 2025 13:32:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 May 2025 13:32:57 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54LIWvXD153983
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:32:57 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uHoFN-0000E1-Du
	for openembedded-core@lists.openembedded.org; Wed, 21 May 2025 13:32:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v2] sbc: Fix for gcc 15 compile error
Date: Wed, 21 May 2025 13:32:57 -0500
Message-ID: <20250521183257.823-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 18:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217052

With the move to gcc 15, the code is now generating a compile error.

../sbc-2.1/sbc/sbc_primitives_armv6.c:284:9:
   error: too many arguments to function 'sbc_analyze_eight_armv6';
      expected 0, have 3

Simple fix is to drop the C standard down to gnu17 to avoid this new
error.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix typo in commit message.

 meta/recipes-multimedia/sbc/sbc_2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/sbc/sbc_2.1.bb b/meta/recipes-multimedia/sbc/sbc_2.1.bb
index 5aaa52313f..8b91e7e65b 100644
--- a/meta/recipes-multimedia/sbc/sbc_2.1.bb
+++ b/meta/recipes-multimedia/sbc/sbc_2.1.bb
@@ -19,5 +19,7 @@ SRC_URI[sha256sum] = "426633cabd7c798236443516dfa8335b47e004b0ef37ff107e0c7ead32
 
 inherit autotools pkgconfig
 
+CFLAGS += "-std=gnu17"
+
 PACKAGES =+ "${PN}-examples"
 FILES:${PN}-examples += "${bindir}/*"
-- 
2.17.1


