Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40714C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 20:46:35 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3095.1684788391567979364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 13:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jcF6ztIy;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MKkJGB059302;
	Mon, 22 May 2023 15:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684788379;
	bh=+nNSFnA9a4mo6pXNqb+VZw6GXGPh0tH+1lGpu9upi0Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jcF6ztIyv6t4d/8MWA9lmG7xVY9IM8LKygqMmYxxwXQ+mY2AX0S0tLXfrEm/HSTC2
	 TaCAh1y5bxhoiMvFlH7+9zYDtvT/PNVUWyd+RG/e6q8acX+WsBpOPDNz1PRblHDsCD
	 Bw21+iGcNTZWalG1Gzy1vxVYQBpxqdDv7VHVPFCc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MKkJOw054976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 15:46:19 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 15:46:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 15:46:19 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MKkJ6r078155;
	Mon, 22 May 2023 15:46:19 -0500
From: <rs@ti.com>
To: <luca.ceresoli@bootlin.com>, <richard.purdie@linuxfoundation.org>,
        <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <martin.jansa@gmail.com>, <peter.kjellerstedt@axis.com>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCHv3 2/3] package: enable recursion on file globs
Date: Mon, 22 May 2023 15:46:11 -0500
Message-ID: <20230522204612.3882158-3-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522204612.3882158-1-rs@ti.com>
References: <20230522204612.3882158-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 20:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181617

From: Randolph Sapp <rs@ti.com>

Enable recursion of file globs. This just allows the use of '**' in file
globs to match 0 or more subdirectories, it should not make all current
globs recursive [1].

[1] https://docs.python.org/3.6/library/glob.html#glob.glob

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index edb70daaf1..70040f09e7 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -550,7 +550,7 @@ def files_from_filevars(filevars):
             f = '.' + f
         if not f.startswith("./"):
             f = './' + f
-        globbed = glob.glob(f)
+        globbed = glob.glob(f, recursive=True)
         if globbed:
             if [ f ] != globbed:
                 files += globbed
-- 
2.40.1


