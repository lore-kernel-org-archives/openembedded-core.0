Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A48ED44156
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 09:19:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.128])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9095.1765531186725486787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 01:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=bNkgDCwv;
 spf=pass (domain: phytec.de, ip: 52.101.84.128, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHLuGA/dqmMvYGBv61zDFETdbZk4NK7Qcyt6GG2Sdorg97GPuBxL6cC0GQjHsTAo8B6bDr0y48544lQdZvVcsmLSQNHMsfzHGaEwhlB++/72h5v2GWkYtLqDbnY1UVDlsFJYfrN/VqNDxApP3MXk8L7DihxID/09P5kc+8XCrmyzIHmRPfPy7HbT97fUmxD7v3h6K1dxC+S0zdObTeFJpsyTEi0Z2waTUG/uXGEmynrp4UxOuWh0fNV0d8yGrdh62P0s8vHs04kI8Bwq8wJ1pzDcK/bZOSeOv5lNNkZHjuWqb+MH09EdtDE3Eo1/i8GpMh1jVzxLWYhp+Yuo4/D2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRwhftJR/0zoDoPCsqjsZfc3bKt+B7znQ8Z3nG7zTt4=;
 b=kMJRcDd2ZYj7CAuAB+xbBfpvBjgGVrh1orHtuxCtapvNXt3vfnGymhSsLJR8yje9VyIvxmZVj2W7VSTjZ1vqTIbd43XM+b0JsWPyCyn7nyULLUhro6QxGUIkgfiJ2No5w8NRsfzfcYpmvKwERbD04fnGrCoc0DMK4vfZK4r4OiYIDk1gpikTHD5H36CL/J+gkpynJd5sxRyoNWkin1rF7mNP9uDO3JxhMGx510IqSIZmMyq93a8AFw7ZIBNl19bDnjH2y6j6TaIyFaIKmlw6LBTZGteINDCxIoYuMBAgsYvMweazKp2yz9160ejVtvkAUyoYYzDOB22kHRoVYIXInw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRwhftJR/0zoDoPCsqjsZfc3bKt+B7znQ8Z3nG7zTt4=;
 b=bNkgDCwvuY7c9xCzM/gr+P30OtjfuIvsq8QRC22iPKCOS2sYbFVZV9+7K9o/rNMG4kJAYYiEFEUOsYMRtr/pfYiWzzZUlBK1XHcMF3hXJ/cSS4A7CcbuLeOLVZIf3zXSgpTqm65dwQd0IoB4Kz81nQR//hm/NlusQff6PZ5ieewgEBeV9bc4iCrjrXqlNSYT/KyKpMluMmO83XAvX7m7iIgxbyKezQ3ipWfJsN+QtEGi9impNIOX5YwRz1VuFf1dMIqdNdhVJ5mjog5l5XT30qU243sopJ/es6FPGsU+EMWI48h/wPtx4ukWd048jMNVWDDaBpgZihcMX0A/+CBqPQ==
Received: from AM6P194CA0017.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::30)
 by GV2PPF66DDA38E3.EURP195.PROD.OUTLOOK.COM (2603:10a6:158:401::8d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:19:42 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:209:90:cafe::c7) by AM6P194CA0017.outlook.office365.com
 (2603:10a6:209:90::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 09:19:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 09:19:42 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 12 Dec
 2025 10:19:41 +0100
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 4/5] cargo-update-recipe-crates: Properly close target file after writing
Date: Fri, 12 Dec 2025 10:19:25 +0100
Message-ID: <20251212091927.3741063-4-m.schwan@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212091927.3741063-1-m.schwan@phytec.de>
References: <20251212091927.3741063-1-m.schwan@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|GV2PPF66DDA38E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff45667-6c46-487b-6b1b-08de395f9589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uspPXZ/0OleK/KNxjCIAg7uefWWi2c8Xos49TK40cE9mk6FqLAWwNiRPEdtM?=
 =?us-ascii?Q?j9jcUlBsSwHSvDo3KdyCOh0Pz0XK5oRpK7PTLOrMq9hHMPHsd95PS4efq2xZ?=
 =?us-ascii?Q?fdFbvFv75R0Cbw1KCvvJF3J+4lEPSmJSh1v0MVeYHy2iWk/cftXN550GQc+s?=
 =?us-ascii?Q?4JoBTGDieuINQcwj0VKJQyd76Ww+DXlHoq4G+i+Ibh5M+6VCcroenMKy0tyf?=
 =?us-ascii?Q?HmAPM6t7B1c1mxDOW8iEIglCvpYpL6CoYdCGbdZrjtI/zY0Zd0rtK10jiBrS?=
 =?us-ascii?Q?Gd00+IZUglfMQZn9ajhDBfjFyXh82nu9Xec3VVW9oafX17exSxxgXwSVPwOe?=
 =?us-ascii?Q?LtskBCYLvB/u3SUSrXkK0ut79L6ufEfXcXKtq8hhCyU2SX7axAjOHeaUTAo5?=
 =?us-ascii?Q?AkB0cQ9ZLUdYnc0GXgfcWRRVcYCLzBTtbnxGABVtGf7Xfy5FPiBHpk5xrPY3?=
 =?us-ascii?Q?wbDbpq4wus5uuB5X0OtZoEMJJaH9k60W/S7lZMwwLJ8vwIeXIRmnDHhZFWBC?=
 =?us-ascii?Q?5merSdaMICOrY0ngx04RVm+SaLYolV5Idv34EIz6mDxtskgQuwTRf2111N9N?=
 =?us-ascii?Q?MkDqAUqpoijf/OnI3lEWrRetwn3Mo/AWFJDkU67yA6AD1XHLIisWgpq5uf/x?=
 =?us-ascii?Q?Wkr40lVqY41Gu+xbdTcgR3JX1khdqJHM+Syjhv2RehNT+gTx9l5iiHTbqjze?=
 =?us-ascii?Q?0yqwal8K408hZX6YIFEAYl9PaoGzlxKv4ZoNmTOC630Ylz/hR9WK1jqNRxgF?=
 =?us-ascii?Q?Q+oRx07/XYI6ZsQHdmCfKXpxf2CTOKhnZZR++DEkR+C6J3ZujR4prBYc8Ce/?=
 =?us-ascii?Q?td8IA4dsrL+saOmibRJzdq5Y7IIWJksMczzOajbHplVhbhK1hxR5n7n7x/tg?=
 =?us-ascii?Q?TCdLoXthwF25gVckcIjSXyzVeCdL9WNCSMheANm2Y008uDZ29KZo2/8tVpOy?=
 =?us-ascii?Q?fzB54OcrWBUeMqGb1/gGaOQybsWZbyn0CSxOgtgFQ/ffoA84YpzMJ02/xxnt?=
 =?us-ascii?Q?NbF8NaT+tevaPElOa43zVQywNVVkuGOV/ToP1gbznpMP0cg7aHb/DYeewSL9?=
 =?us-ascii?Q?gL35LwuW34jlpBHqCDqdEbMz8NO7hGSPeRYF4rFv2F8ceBxjQyoYK8rOZhL4?=
 =?us-ascii?Q?/vTd8a2dwryCepUlGIFhANOg/p4KdyGcH9K0Ji/p5sIxcIRjHi/3HX+zsAXv?=
 =?us-ascii?Q?ycm03HIm/VfwtdjIdBq8d2lwLhCINbVe3X1lEyfcSvrSEc3VqVkbx+PNvaay?=
 =?us-ascii?Q?LRiWEDZQRO1r8q/1+AO11eZeY3Hn+VpuRicg3Pr4iM8LSHt0RvcQiyFsX9lH?=
 =?us-ascii?Q?2V4DWZctjrvx6wUSGMNwr9L4/KNSn6Y4f2WRWRPAG46MH9GZ6uD5Qqinj25a?=
 =?us-ascii?Q?vj7RfIt1TX5Pc5wLwSpn41k1K9qa1p7bKzeYjs8wz9tZpKyMqhlbtU3aDXjE?=
 =?us-ascii?Q?s9+9ECsKajlmKBW+6yQsXggsdhz5fCVnAx3taXG4IaVBMomCrZNzE8BkWo60?=
 =?us-ascii?Q?Tj8F3YgCVRUsg3cpQeBmB9LFZNT7zwHmBLrZ7RgeF8DPNTOoBfccpaqYXVzW?=
 =?us-ascii?Q?qKACPB55Z1zta7U2v2c=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:19:42.6253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff45667-6c46-487b-6b1b-08de395f9589
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PPF66DDA38E3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 09:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227572

In do_update_crates(), properly close the target_file after writing to
it using the "with" statement.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
Changes in v2:
  - Split changes into multiple patches, for improved readability
---
 meta/classes-recipe/cargo-update-recipe-crates.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/=
classes-recipe/cargo-update-recipe-crates.bbclass
index 6e82bd4a51..6e933d3afc 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -74,7 +74,8 @@ python do_update_crates() {
                     crates +=3D c
     if crates is None:
         bb.error(f'Unable to find any Cargo.lock in {cargo_lock_src_dir}')
-    open(target_file, 'w').write(crates)
+    with open(target_file, 'w') as f:
+        f.write(crates)
=20
     bb.note(f'Successfully update crates inside \'{target_file}\'')
 }
--=20
2.43.0


