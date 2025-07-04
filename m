Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A1CC8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 13:03:27 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.28])
 by mx.groups.io with SMTP id smtpd.web11.11960.1751634200737005396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 06:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Ek18BRRO;
 spf=pass (domain: ericsson.com, ip: 52.101.66.28, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7EWFo/cpC7bk10t7gIYNooizN0nk58F7GuoyrVJ56RZb4aBN4cwBbfsVseRXt9qOXMnbg6KItkK6HayKPrrl0XUIXh3PzrBmo8yrWv088OXPyp5VAJvGoBJJ7jAhfcOM76Qkc3l6/Wm83UVvfmUjbVnYqnRyyWZnGuX0GwxJLS6ibXrISKykaOck5oAqRtPgDFU485hC5B/7NQpz5eRP1H0zE/Uv8iSVuvADb6FjrCs/ON4YBYwVYRkkiZUFjsSJT7AkgiEp4xYZRHJ2t7slk87OqdLhIlMEJsmltXmc5MyYh+s/JzvTUNoRGs4FU4Wtzh0A0ilLRYCRe1NdTbPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Go9+4PkEGwiSS4GYZ4LO2VlIEvotOPp0KnAJK0OzYHQ=;
 b=D7Y9wlgY0r+99x3WScItbAldq8m38qd4L9dTyrct6v5UGyj3NtUEHY+AAQnih24IDyNbDl5GxrHZdrVyN1elnCWiNxm1A2SIS0iUMcfSB2o1DJLH7HsO68MT/eGP0domWvUt9CwNsYRkNHYlplOi3cHRk8BLxHDododGwxHarGU26Alisa7fdirZf5/QcY1wiahGB5EkOnuDJkPozRk/u4ynydrgqJOT7p0CsImnis6ZqO34jiru0ye2jg/BvwHjhRbyZOJCDBjFgeM0NlOxMtMm/DGukHqMGMH+WA00Kt062z3QCHDAB9t4tmmnOUXHn+UMuKY60ZBTTwmBEotA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Go9+4PkEGwiSS4GYZ4LO2VlIEvotOPp0KnAJK0OzYHQ=;
 b=Ek18BRRONf8LxqGIC4qcEVan1OS7R3DvhSxWgNWfKBMzjnl9h43tmyP4DRhu5y5HVLfQTj3UUpqJXIGJW7QNMm/sgvDKCGePQFxiroihe2Hw+Bh+ja3VbYycUlMWt0f1N9Xk0SjX+ji2gjnDOcrM4LG/00LfOSSRSIhHgExf9Tz3QMS6ZbP4QVlR+gP2VePcBwBJCk4zz8oSA3ef/YjKHJHRC1IT5melzLuc34n8aFTerg+llWxp6d9LF5XPx7twsPIKQG1B93QoNNce+gXKEYAjnIz/7B+cThpavcb1w7S7iKzABaGg90Nf/o0QdD52xIbciiVHSLSmLGYjyEv1Ig==
Received: from AM0PR06CA0107.eurprd06.prod.outlook.com (2603:10a6:208:fa::48)
 by AS5PR07MB10059.eurprd07.prod.outlook.com (2603:10a6:20b:680::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 13:03:17 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:208:fa:cafe::5) by AM0PR06CA0107.outlook.office365.com
 (2603:10a6:208:fa::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 13:03:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 13:03:17 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 4 Jul 2025 15:03:16 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 56A394020F0A;
	Fri,  4 Jul 2025 15:03:14 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3A0D2705E341; Fri,  4 Jul 2025 15:03:14 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 2/2] improve_kernel_cve_report: do not use custom version
Date: Fri, 4 Jul 2025 15:02:55 +0200
Message-ID: <20250704130255.1157673-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704130255.1157673-1-daniel.turull@ericsson.com>
References: <20250704130255.1157673-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|AS5PR07MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f82d4e7-3a7a-4c18-9241-08ddbafb24ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O0h2+uXqtIKc/gwaWozHRNt7X74618m+Q7JlApC+kZkrZ/04sJtrUxHvKCgM?=
 =?us-ascii?Q?t74jscwXlje6LD78XUh8av+HRA9dgYa4vqmXjf4KFJ2WYj0JiU//TZD7LIHQ?=
 =?us-ascii?Q?k5sbYJP3uH8MvjdFhjdYl+fAXRyf+TaW6WAbtYjOv1m/cCbFm6vDeU7XPmUy?=
 =?us-ascii?Q?5QkJNBaopEzwGgBi8bE0QrPgBeWZItM7nBvFTh2PREF8nWZKcsczjPkcWY1+?=
 =?us-ascii?Q?5og3y9noviNvXcEi6UYyz58qmsBtUNtNIJlZBkGMZMkQvZaiFwIFqeGuGbx0?=
 =?us-ascii?Q?hUigtvKqT5RQBprEv85bLxFJ6/n0vRAeB9E19xRqkjTzrR8hMfpss3qzD7aG?=
 =?us-ascii?Q?iphUBS0TDpcu4coPQ8mZHU3V+8afCT3KoePC8Oemfy8aq9R5EFERCIhP0Onu?=
 =?us-ascii?Q?z/SDc6qYTK8D8zcDCFSr+bkrUA0qxRzowzbWC7uzNxiwVX85KTwISmU980m6?=
 =?us-ascii?Q?bW9I/UmjR1Gwk7WluOygwEK2308o+Dwsi0DqEle8cX3u9Ka8r7Sw9mDu+/G8?=
 =?us-ascii?Q?A4f74D5C+hfXYp8hfCVbTf/L0rM0u2j/Cd5K8z4SrqOH0EUIKgz9S9K2Dv6K?=
 =?us-ascii?Q?gGLx/RSWV1cqdIk0fmlrLlo+yk2Z/EOVKFbfSrXvU1jnixG49PYgXvrcE7X0?=
 =?us-ascii?Q?8nq1wLossgBEhetKCQ5PXX43Ff28DYfz5s305JjNZ2ftp8SGYgEc6oSsjsfE?=
 =?us-ascii?Q?QUpo1IvhZxB6bEGKd95mAkNMAylHfd9Hb0h/HMyocGlWU64+r3wmFF6PiM+h?=
 =?us-ascii?Q?Wi84lnX2PRoLoq/poVxJSCA9mQxeAwWBKVWXdbUpkcVOIuGN/SJY2Sgj8v74?=
 =?us-ascii?Q?KtlK3qGRirHlvss+q+NAcaPMbfaKXi58IKKf+K+Tirl/ZFAmcI4QbjHushFy?=
 =?us-ascii?Q?8s5J6NL3gWa7iMl/fyo6bBYA7E9iWlsMu+YAYZ7pfJQc++M12ta2aeTVRmmk?=
 =?us-ascii?Q?62e1oxNszaUZA+2eT/xTOjH5ZcOxyGxiyJ5eH2F7WEHfBomkpIGMAspfqkG7?=
 =?us-ascii?Q?9o2MU1PBYyW5UZhiyJIsGs6HRJAMZbQ5ecZNWWi55G7QcnRTWrgOc1wLO0YH?=
 =?us-ascii?Q?PkwV3ocfUIBqYD3xhuu+ShW7ewUYOaUt4pGCuzBL38xMoy1rl31dRAxh2EjC?=
 =?us-ascii?Q?wazPu0Wdv2cTzE1ibD6sXX2yuMnxt8vNqkflQvZNEGAy1pR4rbbQzdCsFeUK?=
 =?us-ascii?Q?mqp8abNzcRoFQk1SUKqjAUcdwxU99osUp7pLrdoW8UIC+qRTzD01iRGfDItz?=
 =?us-ascii?Q?/jR1CwHL4rdoiwygOebguzEf+ROXUZxKMIf3SpDz2l80N/id8ewEcUTfylWB?=
 =?us-ascii?Q?nMgd2Q9DuJyxSaMNPgoY41LquyKfoXl7HRuTj1/Fhhr6ryYMyPCNinyUMUYv?=
 =?us-ascii?Q?AV7Zsu2yCqHPqOS2eKO8y6I7WbA4u15mQX0IhQGSGdN+X+c6/hbtjJ9hCVZs?=
 =?us-ascii?Q?HvV+L89YqcqTE3gz6Gsy53Wkp06zvrUp2R/EuLnux7dEdQuZ1Xzr/syYBsk6?=
 =?us-ascii?Q?aedz24F7cp8ZY9/nreHFBzCJQ/xWT05pHX0n?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 13:03:17.0874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f82d4e7-3a7a-4c18-9241-08ddbafb24ae
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR07MB10059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 13:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219921

From: Daniel Turull <daniel.turull@ericsson.com>

When using the version specified in cve-summary.json, we need to
remove the suffix containing the custom version to match the
versions from the CVEs.

This patch truncates the version from cve-summary.json to use only
the base version of the kernel.

This is only applicable for kernels where the user has added their
own version.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
index a81aa0ff94..5c39df05a5 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -445,10 +445,12 @@ def main():
                 is_kernel=3DTrue
         if not is_kernel:
             continue
-
+        # We remove custom versions after -
+        upstream_version =3D Version(pkg["version"].split("-")[0])
+        logging.info("Checking kernel %s", upstream_version)
         kernel_cves =3D get_kernel_cves(args.datadir,
                                       compiled_files,
-                                      Version(pkg["version"]))
+                                      upstream_version)
         logging.info("Total kernel cves from kernel CNA: %s", len(kernel_c=
ves))
         cves =3D {issue["id"]: issue for issue in pkg["issue"]}
         logging.info("Total kernel before processing cves: %s", len(cves))

