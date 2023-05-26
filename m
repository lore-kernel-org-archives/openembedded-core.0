Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2909EC77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 23:36:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1519.1685144200346778256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 16:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PaYNKcA2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QNaJwI081731;
	Fri, 26 May 2023 18:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685144179;
	bh=3FuUtoFE771bz9CEImiLIJpyBPlTxGQlS0oZzYc0xFM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PaYNKcA22RObN0clhH7pFSZ7wAUYJsY7Xq0zURpgR7J45ti2tek2/dVy8o2Twwn0T
	 JVw6geiC90+BtSr9+h1SDqVoCExu+VKK+waSA8a3d8e8ZRHOKbKR6mq1J/hVM2dauB
	 lLZ+KMfP7uBsvTF3iuQyFGqdNkfaNI9rl9bRH9sA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QNaJBW002081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 18:36:19 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 18:36:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 18:36:19 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QNaJ4K013670;
	Fri, 26 May 2023 18:36:19 -0500
From: <rs@ti.com>
To: <steve@sakoman.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH 3/4] package: enable recursion on file globs
Date: Fri, 26 May 2023 18:36:15 -0500
Message-ID: <20230526233616.3623368-4-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526233616.3623368-1-rs@ti.com>
References: <20230526233616.3623368-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181784

From: Randolph Sapp <rs@ti.com>

Enable recursion of file globs. This just allows the use of '**' in file
globs to match 0 or more subdirectories, it should not make all current
globs recursive [1].

[1] https://docs.python.org/3.6/library/glob.html#glob.glob

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 67acc278d13..fed2f5531d3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -262,7 +262,7 @@ def files_from_filevars(filevars):
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


