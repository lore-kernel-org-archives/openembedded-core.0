Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41ECEC7EE2A
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 20:46:35 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3120.1684788388749107112
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 13:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kQ6a+lVf;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MKkJhW015674;
	Mon, 22 May 2023 15:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684788379;
	bh=nKIi0up9LJE61nIQ8DPV2rXJ/caLKbnrKu2ycQW0Qm0=;
	h=From:To:CC:Subject:Date;
	b=kQ6a+lVfHeVxDyiwEsC4ID2arcL/Em+I4lQVVaeYZWcFa6XEp7mhHzdT+ecDiJ3tS
	 8HFWilqXmHWD7be14ugfNxu4BtAVdvBSgOmuXXtMT1Ck8gOkz4+J8m4+NwRReHEorW
	 ND6JbsICZ6NhD4oygmFxa6JXqKWjDs4J+Wxsghas=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MKkJX8028256
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 15:46:19 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 15:46:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 15:46:19 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MKkJ6p078155;
	Mon, 22 May 2023 15:46:19 -0500
From: <rs@ti.com>
To: <luca.ceresoli@bootlin.com>, <richard.purdie@linuxfoundation.org>,
        <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <martin.jansa@gmail.com>, <peter.kjellerstedt@axis.com>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCHv3 0/3] Fix: allow specification of dtb directory
Date: Mon, 22 May 2023 15:46:09 -0500
Message-ID: <20230522204612.3882158-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 20:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181614

From: Randolph Sapp <rs@ti.com>

Fix a few of the oddities introduced by the previous patch that allowed
specification of the DTB install directory and specification of vendor
directories in that directory.

Add a recursive search for dtb and dtbo files to make sure upstream dtb
directory standards don't break our packages. This is done by enabling
the recursive flag for all file globs. This shouldn't have any
performance issues for recipes that don't explicitly use '**' in their
globs.

Makes the kernel-devicetree class posix compliant again by using BB
variables more efficiently.

Martin Jansa (1):
  kernel-devicetree: make shell scripts posix compliant

Randolph Sapp (2):
  package: enable recursion on file globs
  kernel-devicetree: recursively search for dtbs

 meta/classes-recipe/kernel-devicetree.bbclass | 12 ++++++------
 meta/classes-recipe/kernel.bbclass            |  2 +-
 meta/lib/oe/package.py                        |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.40.1


