Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B41BC77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 21:36:38 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9113.1683840994293289652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 14:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HwsRNzXJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34BLaLqC004678;
	Thu, 11 May 2023 16:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683840981;
	bh=Xg8UtHgihSFKGWggaBkC71avsjD91En4lRIULd/4BbA=;
	h=From:To:CC:Subject:Date;
	b=HwsRNzXJmttBv3c4A8+tLbGhOYH/7e7kR6dw18gpq70+PWO29Y+UeewiQkmAeMH3K
	 x+gJBfVTcjy5cF0YXFfRB80AEmFJ0NB/YDitkeYP/srbsAuVJJ0nXREgz03ucZDTe5
	 6IrWsCTChNdeUizXS7vh5y+ExB9Q4AI12AZLpkFI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34BLaL2q031140
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 May 2023 16:36:21 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 May 2023 16:36:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 May 2023 16:36:21 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34BLaLX9012865;
	Thu, 11 May 2023 16:36:21 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <martin.jansa@gmail.com>, <peter.kjellerstedt@axis.com>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCH 0/2] Fix: allow specification of dtb directory
Date: Thu, 11 May 2023 16:36:12 -0500
Message-ID: <20230511213614.466484-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 21:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181157

From: Randolph Sapp <rs@ti.com>

Fix a few of the oddities introduced by the previous patch that allowed
specification of the DTB install directory and specification of vendor
directories in that directory.

Add a recursive search for dtb and dtbo files to make sure
upstream dtb directory standards don't break our packages.

Makes the kernel-devicetree class posix compliant again by using BB
variables more efficiently.

Martin Jansa (1):
  kernel-devicetree: make shell scripts posix compliant

Randolph Sapp (1):
  kernel-devicetree: recursively search for dtbs

 meta/classes-recipe/kernel-devicetree.bbclass | 26 +++++++++++++------
 meta/classes-recipe/kernel.bbclass            |  2 +-
 2 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.40.1


