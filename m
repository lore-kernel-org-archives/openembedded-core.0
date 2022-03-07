Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83114C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 10:13:12 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.120])
 by mx.groups.io with SMTP id smtpd.web11.24654.1646647989011939735
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 02:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=Ro9Z7ZnH;
 spf=pass (domain: arri.de, ip: 40.107.5.120, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5FMM++CNZtWTmi3NQo08WbxyP2szzGeHT1laOugyh2xjmAiJZ6fvavMSPN2PCZ1pMdgJBRdt+osgi53kWw6RzcVC3/PQ3gkXLGHbQ5zDsMsNYMOyhH/BbeCFqbxomIwFsIGf+8KeYaK4+Q5CQzo/t0beQWntQW9IckOir+zUuhh4oEpN01ISGBY50H5hbHqDoWchXrgJ5DoFXFHHyIqgta82Ysi9QNvpg7ui62ejZ5AQjkg/YV5w/aav/tdcKauSNTj5JOv8I8grB+a1NTnqtnI2pFLq3tLI+weFMQDaeQjoUGiggxBo5UGejpxUQ6scn71LHVej9e+e9yJBS5cgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8eCLz1wk+Ra537arpeJwOTeBzNIkg17Mzp8PIdDu7Q=;
 b=JT9VyJcHhIZQitKpgxVc9ZO1nZBF/qq1BOc2N8cAaRhohwJtzVuwMSj8//Uf1fimxgHajRMBBmi/ReJcmQn9H3xYuBdWzBnZk+bkF1MQSuvUEvennL4kddr3o3P1WtwddknRLrb1s4RcPLcpY/1hh3vuOq5PZ9RBxSZ2f6m+NbeAtTbPFvmg3zGCxfPNTzVdEIo59hg7OnGo/aqulbebbj/bKyjNz7/zcrzJNpNV3afg/fUZTreMnaE1hFJIdm1LbXoNFN2AWQMB6RcXTKaFd1JXwo4ZJzM8QBtMUo/O+NG2Jc12rSmOvdIrdZxU8lboi3qNY4RcwPdggjZDLFeT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8eCLz1wk+Ra537arpeJwOTeBzNIkg17Mzp8PIdDu7Q=;
 b=Ro9Z7ZnHBqjMpOJn+WzypqrTL3DvNCIgVo4FVJxcwaCMC4pj+3vIvbtW89Z9A3v7hJgVg1jolZYO9ZYLpvAg/uSZOszCVGdp/4MuL08EhMQZwT/4NQnreMTKihse15b75eSnMhKzeBYsGCH7+OnDC1EKORduRJ7rHyMnz/+x8W8=
Received: from AS8PR04CA0067.eurprd04.prod.outlook.com (2603:10a6:20b:313::12)
 by AM8PR07MB8137.eurprd07.prod.outlook.com (2603:10a6:20b:36c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.9; Mon, 7 Mar
 2022 10:13:05 +0000
Received: from AM5EUR02FT050.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::f3) by AS8PR04CA0067.outlook.office365.com
 (2603:10a6:20b:313::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.16 via Frontend
 Transport; Mon, 7 Mar 2022 10:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT050.mail.protection.outlook.com (10.152.9.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Mon, 7 Mar 2022 10:13:04 +0000
Received: from localhost.de (192.168.201.134) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 7 Mar 2022
 11:13:04 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] license: expand_wildcard_licenses: add AGPL-3.0* wildcard
Date: Mon, 7 Mar 2022 11:12:55 +0100
Message-ID: <20220307101255.18951-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.201.134]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb963df9-3121-49a6-ec1e-08da002311b9
X-MS-TrafficTypeDiagnostic: AM8PR07MB8137:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR07MB8137AE119D5FB9498B61D71FBF089@AM8PR07MB8137.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jeVIgZh+aPwOQFm6t9jR7fVlhK9z1Dt/fT6Npm/G1HwYb9i93mQRdd+Q/0LVpJGiI6Jkl5O5xM2Ze0Y2ktJwu+CQVrSdKtjq9pDh1ZX/K/MaaouQF+ENk+Qruc2coA+tt2gMLSvWYLD6R9ni20Htc699L4YqluxHt7D8JtY/peug/pLgCbOtxpapP9+FETxJ1uTee9PTmuVN8CizgBKZ+55r9e22vKpnNjRD807b+lEQYGzpPXpO581CGTbpwE7QBnssF1+FOPRxZgfD0H/9iCK7Hlq+sVJ8D6164rChKvkJsZ1sYOuyLOytATZGbI2iEkPTJTGs20775F1cknuXzl1lzS8zC1ajXFV2YYiCvTZpBq+2SyluxNUy8N938fAFimmVCZ49I6lYUnPqTZuKibGcc7Ik+KHHJ4FUoFLzBdPeUfk3XtoYby2ui959hrdyUcg11PAXZkImSahPXul2hUltMgJ5fYGXQ6sLvEZEliW1TuAj4fA0+YFmNWd/4JanYt0jWDm2z9evMJ7l2tiz+7SJNkuBVpRnU2yqjAn2qT/YavPmqVyaJtp8obffQ2udTM5F6UCJQNackxoBv17MFZoP4EgGTyi1nZfwI0L7FIcp3+PfL2HRra6iRr582hg9/B/5TXO/BUaE9WQGcUVq84fAQ+dNUwQqhUVDhNfhie52pRt4cThYHZ2vkl8ZzoazwHnLc5AJz5EtHih+85TVQxZ7gR4CWLA9L5wymh80zH84SQ0KnA5QaSVeP7BHg4ddGr6t3Fv9CXRM2sIDbH40lw==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(4744005)(82310400004)(6916009)(316002)(8676002)(356005)(186003)(2616005)(81166007)(26005)(426003)(107886003)(1076003)(16526019)(336012)(5660300002)(70206006)(508600001)(70586007)(2906002)(6666004)(47076005)(4326008)(36860700001)(966005)(36756003)(86362001)(8936002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 10:13:04.7286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb963df9-3121-49a6-ec1e-08da002311b9
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT050.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB8137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 10:13:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162804

The Yocto reference manual suggests also settings AGPL-3.0 in
INCOMPATIBLE_LICENSE.

https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-INC=
OMPATIBLE_LICENSE

Fixes: 724fc8047cae ("license: Rework INCOMPATIBLE_LICENSE wildcard handlin=
g")
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index cb1f46983aca..94338be90a4f 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -282,6 +282,7 @@ def expand_wildcard_licenses(d, wildcard_licenses):
     """
     licenses =3D set(wildcard_licenses)
     mapping =3D {
+        "AGPL-3.0*" : ["AGPL-3.0-only", "AGPL-3.0-or-later"],
         "GPL-3.0*" : ["GPL-3.0-only", "GPL-3.0-or-later"],
         "LGPL-3.0*" : ["LGPL-3.0-only", "LGPL-3.0-or-later"],
     }
--=20
2.34.1


