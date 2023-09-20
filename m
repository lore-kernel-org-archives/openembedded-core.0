Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43386C04A97
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 15:30:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.42985.1695223850404259981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 08:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=L+HVOmcp;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38KFUnmw047140
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695223849;
	bh=8R2+/1pMZygleFLrVU0iMoXP/r4OfDOYZUpU/NKEhC0=;
	h=From:To:Subject:Date;
	b=L+HVOmcpD5YPvgehEuaATOq7C/Yz6YCHdHjTf5RBfHRHfaHHK0FoCdYGIMm4R0riK
	 qO6w66Sg2ZMP1gRVxaIhty6y20i6i5Bz5pkzzTXDnZe2KfxQY8S33BHLFbqiZN67Dm
	 R96xXDjTxvwHlE+IINVpB5pn/tFrwoH1FbOoF5ac=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38KFUnYC100505
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:30:49 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Sep 2023 10:30:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Sep 2023 10:30:49 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38KFUnp0016282
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:30:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qizA9-0003bp-2m
	for openembedded-core@lists.openembedded.org; Wed, 20 Sep 2023 10:30:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] classes/create-spdx-2.2: Add missing import oe.packagedata
Date: Wed, 20 Sep 2023 10:30:49 -0500
Message-ID: <20230920153049.13833-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187930

Add missing import statement to fix build failures:

File: '/scratch/jenkins_builds/arago-master-wip/build/sources/oe-core/meta/classes/create-spdx-2.2.bbclass', lineno: 722, function: collect_package_providers
     0718:    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME")))
     0719:
     0720:    for dep_pn, dep_hashfn in deps:
     0721:        localdata = d
 *** 0722:        recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
     0723:        if not recipe_data:
     0724:            localdata = bb.data.createCopy(d)
     0725:            localdata.setVar("PKGDATA_DIR", "${PKGDATA_DIR_SDK}")
     0726:            recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
Exception: AttributeError: module 'oe' has no attribute 'packagedata'

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes/create-spdx-2.2.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 9b28d124c7..ff319207f7 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -708,6 +708,7 @@ def collect_package_providers(d):
     from pathlib import Path
     import oe.sbom
     import oe.spdx
+    import oe.packagedata
     import json
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
-- 
2.17.1


