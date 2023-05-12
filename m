Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BB6C77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 17:22:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.30688.1683912154705986132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 10:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nZuUc7FT;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34CHMPFn038187;
	Fri, 12 May 2023 12:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683912145;
	bh=3nMTDUTtVhET6wEjVo9MNfE72AeDsg81fFX+DTtO3xk=;
	h=From:To:CC:Subject:Date;
	b=nZuUc7FTvWYi0hhbgN4IVKlN173QVRRJCTegZGTKixfemqHZMXrZJGWZgZW03WQod
	 dJvGZg+evg81stkOr5cvCuPOF8RnrmENsSKbkReiinHFoITvEza0wZ/xlsM4vS8lhd
	 tVT6BAkILYS4LMsTlYEqGjUC0cQi1wA1tRYiOerA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34CHMPlf121705
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 May 2023 12:22:25 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 May 2023 12:22:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 May 2023 12:22:25 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34CHMPwp108192;
	Fri, 12 May 2023 12:22:25 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <martin.jansa@gmail.com>, <peter.kjellerstedt@axis.com>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCHv2 0/2] Fix: allow specification of dtb directory
Date: Fri, 12 May 2023 12:22:19 -0500
Message-ID: <20230512172221.4062722-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 17:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181189

From: Randolph Sapp <rs@ti.com>

Fix a few of the oddities introduced by the previous patch that allowed
specification of the DTB install directory and specification of vendor
directories in that directory.

Add a recursive search for dtb and dtbo files to make sure upstream dtb
directory standards don't break our packages. This uses a seperate
function to avoid metadata changes as reported with the previous
revision [1].

Makes the kernel-devicetree class posix compliant again by using BB
variables more efficiently.

[1] https://lists.openembedded.org/g/openembedded-core/message/181157

Martin Jansa (1):
  kernel-devicetree: make shell scripts posix compliant

Randolph Sapp (1):
  kernel-devicetree: recursively search for dtbs

 meta/classes-recipe/kernel-devicetree.bbclass | 25 +++++++++++++------
 meta/classes-recipe/kernel.bbclass            |  2 +-
 2 files changed, 18 insertions(+), 9 deletions(-)

-- 
2.40.1


