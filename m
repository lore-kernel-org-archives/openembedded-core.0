Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B078C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 19:16:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.21627.1707506208001667549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 11:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Y0Fy8Rh8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 419JGifA105824;
	Fri, 9 Feb 2024 13:16:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707506204;
	bh=KF3RZMjXpfwvF5yOAi2q9VXR+mCiqyDt9rSUwdY3Bco=;
	h=From:To:CC:Subject:Date;
	b=Y0Fy8Rh8jVnS2uaf8oy0u20Z6F1uA1kAQfowORx89JwOl0loiCzkbVxKYvd1wC9fx
	 Lz0smPiqCJXgGtIGqlGhUHPlPIiQi6l80idd4fp1axpEP98TQiTdcz6L+1KeiAvHAw
	 QyRZ9RZbixE7Hp/2jkrkNr2zGTnmrBtktQoSPjhI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 419JGitl128122
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 13:16:44 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 13:16:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 13:16:43 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 419JGhs2020049;
	Fri, 9 Feb 2024 13:16:43 -0600
From: <rs@ti.com>
To: <c-shilwant@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH] mirrors.bbclass: add infraroot as an https mirror
Date: Fri, 9 Feb 2024 13:16:43 -0600
Message-ID: <20240209191643.2898642-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 19:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195244

From: Randolph Sapp <rs@ti.com>

Add the new infraroot.at mirror to the MIRRORS string for https sources
since infradead.org does not support https and certain proxy configs
cause this fetch to fail.

Mirror info fetched from the following announcement:
https://lists.infradead.org/pipermail/linux-mtd/2023-August/100922.html

Signed-off-by: Randolph Sapp <rs@ti.com>
---

I've got a second version of this patch that applies the mirror explicitly to
the 2 recipes currently using infradead.org as a source. Let me know if that is
preferred.

 meta/classes-global/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index ad070d44911..af66fb1832f 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -78,6 +78,7 @@ https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.kernel.org/y
 MIRRORS += "\
 git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=https \
 git://git.gnome.org/.*        git://gitlab.gnome.org/GNOME/PATH;protocol=https \
+git://git.infradead.org/.*    git://git.infraroot.at/PATH;protocol=https \
 git://.*/.*                   git://HOST/PATH;protocol=https \
 git://.*/.*                   git://HOST/git/PATH;protocol=https \
 "
-- 
2.43.0


