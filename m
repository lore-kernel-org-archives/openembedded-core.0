Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C61E83EF9
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:43:07 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20603.1770212579433521097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 05:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=rMMBgkXP;
 spf=pass (domain: ericsson.com, ip: 52.101.65.4, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wehAXO25zkekGAapiKTKF2/gb0rlfDaVUsP5aMML1c/yfrlgvC0aebjJq7Du2SVDnY1e07CQTX7JqcZFKgCWMIk3kDN1JCC4DWvhaw6NeXfUnFNf39ia7ITBFrXZtrYLhz2EeVaxEBEg2sDfkuATRNDJGcwSiTkbcUyVXPsKXg1TVNMENi3CFbaD+aWCSDg9PLz++CACysR2sAv59Q3YeAos5OMpsNTjugArnyf+lz/LE+Zqq+lgCfqm0+WJwdXt4g5Uc8K7hCrn36sYomXFmVEkMJ0JZ3wvLUVEg3fwVdfD9nR0l8ymSUZbCPpZLieqqvzcuBGd/Tt2aVaC/phung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEhHHzzWtxwCC5H6PDHC5ZrRI3Liy9qHqoh52JK2+Lk=;
 b=RsDrnQLAYfyFx1ppHVDYAZFnS/ZwdwikzOmfWSHOymWdPg6ahEI4oLoIpsSP/RqYnXsxsFhDR1QW99nIvqC5CuFKTLCfbECHo8g2kPr9xYh75vLk+owx3d6FDvkXjgQwjO7gTs/83IgZIJh25XiScikKYfalptX48GIVxejE7S2GjAUBYg943qf3ubR6pCPEl/+qFD3GTFQMdWGg0sI21CwmjVIBnyD5dd4aKcw1BENfVVng2bR6xt8MrZXxfD7meyqVM8J/Zdfisr43GHa7L9SCDsNyzLkmrOVm4fiVM0k3nUBZW8Qn5G1yzrZG6sOaWYcpfETrPwrS6NqoS69qcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEhHHzzWtxwCC5H6PDHC5ZrRI3Liy9qHqoh52JK2+Lk=;
 b=rMMBgkXPqy7Y6N09zknJ8QoJGgoRHJKBkZYCfvvf0v88357S2vkAMoNWyN6JDjMkUGQ9YxJIy4AIlHSJ/4y4LjTS2jxwvctCqUbGsukt3cbGW81VZ1Yy/oIU+/uVxDfPfClZ9ZfPvdNJEOaTOK0ju790ungPGYuOYXh6I15tWyIwuZLvhb8d47fPHqkMj21WUhTjtWa+sKdKq1lg2+athBFP/HpGPZSjFYhiMdFdxntEYWzWjNRTguDUSQVBtBqd19pCq09BgA5nLHcz8/d1P+HaKA0Rm+7ONd9twGT5ByJj/skBlzdyiA7ZoIo6aYY9ZKm/jmcvE7kCICtkDOlptQ==
Received: from DUZP191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::11)
 by VI0PR07MB11258.eurprd07.prod.outlook.com (2603:10a6:800:2fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 13:42:55 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com (2603:10a6:10:4f9::4)
 by DUZP191CA0007.outlook.office365.com (2603:10a6:10:4f9::11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13
 via Frontend Transport; Wed, 4 Feb 2026 13:42:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 13:42:54 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Feb 2026 14:42:54 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 0B4574020B7B;
	Wed,  4 Feb 2026 14:42:53 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id E4F237000699; Wed,  4 Feb 2026 14:42:53 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 4/4] improve_kernel_cve_report: validate that cve details field exists
Date: Wed, 4 Feb 2026 14:42:35 +0100
Message-ID: <20260204134235.3274889-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260204134235.3274889-1-daniel.turull@ericsson.com>
References: <20260204134235.3274889-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|VI0PR07MB11258:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d512a6-3d13-4229-62b6-08de63f34c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VAj/Xw73ZvDBG/vS3YrWhDZbf2t4PA6XoYgGN8MZIYylERDBHyauz6U7Q3NF?=
 =?us-ascii?Q?7CmFTt531WB/J0aEj6IMsBNBfQUtj3RBjl3HWQo3+/8L9CIdjrwvNwDXb6WK?=
 =?us-ascii?Q?46013S7HyvTlGLCsGUtkWNHi3Nuwmf2EVdE2HVA6ketVVuKwhR43/ihLDW77?=
 =?us-ascii?Q?Ukqqf5E7LYC3F4zSLNubB5mwd1lafmCaXDABwieSQZ17jyijN2fDqGNX2XQm?=
 =?us-ascii?Q?LbTCmzZFNzVZWkhAlyzWdNKgu383VbGBGAil4P7tYceBaDNQQfFJMgCIBTgK?=
 =?us-ascii?Q?dNt2TptB0DmrvSG4imlOWNomxnqMuXaXUPQac3wXL/jVSjljhiVnyvbePLKA?=
 =?us-ascii?Q?HNwRiLM0ZWt7AiX1d/X7Jo2MNDfVfhXtbRkMbPvqoVK9xx7qwzAUfBPLfllv?=
 =?us-ascii?Q?MaEgHGrcEsdUZ7UVoJn+SB9ZT0Zx2fE/cCWN6F4j4uw3AD6Zuc4Bc/rBxoFb?=
 =?us-ascii?Q?/Jzbl8NuOgi3pFFWT5og/wvTfxidmZqfwUE3OcBO9JOjhN1sJfC/D+HLOijl?=
 =?us-ascii?Q?NpRkrYdG1OLS2uZrZM1+/N07RXazdPOedwgHXOAJYYu0yRqDzR1Ab7EF8lQ4?=
 =?us-ascii?Q?sLCp+/RI55ZCbk27X+ZtxPWJRIVihoiWJCbOYqoVTzKnfMSkm4u7FiRbkUjJ?=
 =?us-ascii?Q?eMc1oQdqtlYxnDToFSHYrKCoM8e9QJmaZWKM3K9BLIQun6owLwiK5eSQO0HN?=
 =?us-ascii?Q?o7RhbewuakntSrKpRoGCq6ZlczK5+JQ/1/XiD2uo6H7zViktt3wcleF/tlzZ?=
 =?us-ascii?Q?TIrhZBVgn7AnC1tHu+xHB1qaS48w0Hx4u60w+E9Omf1XtHRdAx1/GyIRG8Mg?=
 =?us-ascii?Q?qS5JJ2SrOLx/kLBe0oac4Q1mWQHlL3y1Nh9AxMDzd3nzUbVHmb4J7/Uivxwy?=
 =?us-ascii?Q?ebmy2zeSDQ783E5tHkVLJdM0kMC0N7wb6W3TgH5DDUnsvMXYNb7hBPYiJNx8?=
 =?us-ascii?Q?i9qlHH3F28J/FOLFKj+HycRbOdMCVHnxhI1zbqEWvP4CT1y0ewzaR22TgAuA?=
 =?us-ascii?Q?9j8Ml3pY366MGAeV2lwDA5Ys5XkEa66+4/w51JypqlIrZRQEYs4qtilLG/u7?=
 =?us-ascii?Q?2DW25sud/VPjgnWztZlyTVnxfkthJt/1DlbNmXPguAGtjLvmc5mAqrriDahM?=
 =?us-ascii?Q?H42MpoNZlxG23AlPBGA2f/j0PSnzrnoTvXNrJbEcKDJpBgvz7aooQD1lUVqY?=
 =?us-ascii?Q?FhPnAwao8Gdr5/uyziz5H0z/p6nU4ZMnB/lX/KrK95RUKyvi+3uCOKrzOkQo?=
 =?us-ascii?Q?2h/UVhdIDe4MLtKP4GWxIwaoqgJ4Lbgr1JqxBBmtR1h1eIo7rnbQGY2NqW9x?=
 =?us-ascii?Q?NEd6KKxBhJOBH7EzJpfvFTwkmJ9veOEsBpsjpQRi/CnNvnLeBLEDErVE1F5D?=
 =?us-ascii?Q?bFS0CAGX9rAs7j6vP6gUNt+D3NiQyes5ofS/1f8kfhvF7z+XrUYKp9Bk0WeV?=
 =?us-ascii?Q?QYYVvUDG0LNbtjy5yOQlx6k4I5GqMKeflErVLe08sF4jmTgjPSColBB5ofrr?=
 =?us-ascii?Q?t/mkHZM4CLl3gceMQjaggzXiF4ACI50B5XwbBebpr2HY8gFgzMzfajK2xV4F?=
 =?us-ascii?Q?slEAyAK6kM8tZG75FeSVB0mWVk2N+XjJ4zAglTtwWDC+PHO2dlWq6LhgyEq7?=
 =?us-ascii?Q?3Gkumn/N9gp32vnNgsIwJrY1xniZsy3ycgYLK2aTKBNfv4gE3bFNxb0m5m09?=
 =?us-ascii?Q?VMTnJA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lipqFUwT66IUp39p7BVT8ufSHSWmK4eZTR0rLMBpLo+pqbe/uUDjWNlhtvdmVZfA24cJ+2+pwYICgYWuaoentNV6BgKM+LRO4FCJTNuk0rcU6ri+J7H68wql0UgQrtRL9NT08uKWEmj+1aRkdVgJPnyNqeJmZ0twpDEQKttLP8bHwBFCmk7diYm3nqF92JLpI6NLqNEpU//3k896uDMC8aGNUMkzfeB1P+4YWR0Xayl8WqkUGPv7GowlkrUJbS0VSiZV7qZTs6HTYMJ0oIZdfAkW3hPBfA8Dw4kQ/3AQWA4/Aw1YPsuZHI/wrfsB05Hsy//yE4Dv92Dt/3rBzSfbAXLJFIJH3U2XDmwToJvtfYI+zJwHyI5XFQxG5l0aZzSvTV4Oxexh/keQPfT1nZ/PTMJYwCYWlnoz8n2p+riwIy2kycJ6LOmTqeVABGik8j4X
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 13:42:54.6098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d512a6-3d13-4229-62b6-08de63f34c9e
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB11258
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 13:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230524

From: Daniel Turull <daniel.turull@ericsson.com>

Check if the cve information has the details field to avoid crashing

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
index 903de0000c..b386c9383a 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -363,7 +363,7 @@ def cve_update(cve_data, cve, entry):
     if entry['status'] =3D=3D "Unpatched" and cve_data[cve]['status'] =3D=
=3D "Patched":
         # Backported-patch (e.g. vendor kernel repo with cherry-picked CVE=
 patch)
         # has priority over unpatch from CNA
-        if cve_data[cve]['detail'] =3D=3D "backported-patch":
+        if "detail" in cve_data and cve_data[cve]['detail'] =3D=3D "backpo=
rted-patch":
             return
         logging.warning("CVE entry %s update from Patched to Unpatched fro=
m the scan result", cve)
         cve_data[cve] =3D copy_data(cve_data[cve], entry)

