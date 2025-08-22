Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA500CA0EFC
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 12:26:23 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.32])
 by mx.groups.io with SMTP id smtpd.web11.8592.1755864776521162102
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 05:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=WODsLAS+;
 spf=pass (domain: axis.com, ip: 52.101.70.32, mailfrom: per.x.johansson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1O3ZigJY01xosEVU4qg5GdCqwvYFFIUwNLN9w0BdLvrjxuT0zsLrWdjMY3QbYygMPdj+WrxD4/pyO9vA/yJANBa3BIMa/Tz8RNNrGjFxCZvXFbBYuJQvBDqTGl1/nhIHhI6KKZvP/dVkrAdqgEpx9O0ApjXoJSG22IngB5PoRMWiO66S1HVSOkIa81SFpuns557kgfTiqjLZ9UDCe7xwxwAWi6oO4WcCLzm+vwJrr5K8ofoVCf7m9CpdJc3EiRPSt7k0Y62wDKY8Y0gBfv/bD9TcTQGzKzWj58QEKpaKZAO3N5sLomgWddJ048ZqRwd55NrH9XFdKhRC0HRn9f8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu6ZxZUZMvHUdZhHUB9hrC21iP3KSURE6+7SaUvh3ow=;
 b=ak+0XWdv2p6pDaCr3NqiqN8oZNRtWzTqVifsJjrKZThp9vvjNNLCQ4P87/YwK+Q7ne0kN5YahhtYpw+6paFWu7GSfLqLnJWj/BchWamnV702Znua6PFVzU04v8bzjCUtbzvvihAi+PWg0hJqNKmkl419eYIC6JlqEYbl8T7PvJymT6rgE4IC4P+UPfNH7dF2GV95HEM+L6V+wkDfQWeuNTdmnGllLN7gLi8/TXjQlws2S7XTKrVsdJ0nfikHgzDERJi0ylcsVUbrDRy30yD6C3cv4v8EO63UskhVrXka9Tvw6GRGchP0BFWmGVOqZ2q0dFbNfGh2A+MgcZO6pH59oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uu6ZxZUZMvHUdZhHUB9hrC21iP3KSURE6+7SaUvh3ow=;
 b=WODsLAS+OF3LGUVYSTghbtyaCzDokPowFBURjhtEQ5e+Q5fBlidQDbxpZ0mYdqk7VzZRjc3gpRsrmoTJjHIxwED8FymdiU/H2nqWjdFY6GA/KEbkm9VrOQe4wUQjFFrtbUESY6+qv8p/desToE0WLH6Ismk7MRd2JrZjw/Skr00=
Received: from DU7PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::20) by VI1PR02MB5757.eurprd02.prod.outlook.com
 (2603:10a6:803:134::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 11:58:08 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::3e) by DU7PR01CA0038.outlook.office365.com
 (2603:10a6:10:50e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.17 via Frontend Transport; Fri,
 22 Aug 2025 11:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 11:58:07 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 22 Aug
 2025 13:58:07 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 13:58:07 +0200
Received: from pc54064-2316.se.axis.com (pc54064-2316.se.axis.com [10.92.172.173])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 604A83083;
	Fri, 22 Aug 2025 13:58:07 +0200 (CEST)
Received: by pc54064-2316.se.axis.com (Postfix, from userid 21198)
	id 5DB8658C33D2; Fri, 22 Aug 2025 13:58:07 +0200 (CEST)
From: Per x Johansson <perxjoh@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Per x Johansson <perxjoh@axis.com>
Subject: [PATCH] rust-target-config: Add has-thread-local option
Date: Fri, 22 Aug 2025 13:58:05 +0200
Message-ID: <20250822115805.1982013-1-perxjoh@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E9:EE_|VI1PR02MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc87d2b-2b5f-4cf2-f89b-08dde17328c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kVy1WIbPpKYML6bPddu6N9KjyCIWBlKSLQ8igUN+jzVhHSQ+0yGMGy9fjTQJ?=
 =?us-ascii?Q?lfpAvgXipwbgFkrdCbizJURlhNYLtovE7nX/JVbl51ECXvDR3OWHxkicrohL?=
 =?us-ascii?Q?JLNvOW8ZkjApBfWQCXMsjcXfhmadw3Q32vMfvm+pRmj6eCgFK8ONvyAhMH8m?=
 =?us-ascii?Q?E0/AYk1WVX4OeyhEFIdFok8N6ggzvCU6n1TnWDK5m2VEQsviMmd8ePgPlARm?=
 =?us-ascii?Q?rRAruqWqPhBwkJCIDkodH+HeJp0NiWGBHK5J8HS6wD3Ff7if9EnmI0G8Q2ak?=
 =?us-ascii?Q?cJu+DTsEcUj7gpSfGzkKh/j6xCvla1x9Xw/4029Z+t/2Yml+aYbXyjfHXmQG?=
 =?us-ascii?Q?+G1zTL6KkmzFjacGq10pr5JFeJSMR0T+uFaDMaNm9VdZ5Htv0N2ktmx5xMZW?=
 =?us-ascii?Q?kq6pXSPtADC/VVrRjxA4R6HuOZVBexrKpeAHm6kujg0cZhupSOxuYYh1xQmN?=
 =?us-ascii?Q?izN14zkRikhDM6vr507/0por1ZjmToxEHn2Yq+bJbNpA/ESzv9pqMH+UPx9n?=
 =?us-ascii?Q?v79UrY5zmwH9dkwDC6DMU8uvu85c9Z/c3ltBupsR5s1eZ/U6fjHwHLmw3yqj?=
 =?us-ascii?Q?YpQVE43/Ab18yyM5e/XLQcJThowFIgB6RlEgrfv2fOw7y0lZFy8NNVmE1Ynz?=
 =?us-ascii?Q?jje8sWdPtDPzmU/6eh39QxDlJVQhBblwtUwooNdcMYQ7+6NIE5uYKDURu0PB?=
 =?us-ascii?Q?mDRHU6VdNkogWxH0elhK2cJv8vI4JvULvkHR7mGQ26euZadGCBVyicu/cHtk?=
 =?us-ascii?Q?jP6Ct9oFc4704q3Qaw801hCk8WCwaHhTjMH4qoOFJud/0NMWBjwhtx+0CvXt?=
 =?us-ascii?Q?92aS7fyT+UTdXjiF3lmuz89yIFHSmmuKi2gmALIj4dJFXvtmHq7D6Y8wNNHb?=
 =?us-ascii?Q?JlUdjmj+0DcesS1MPJQZyrCA3/+nFhpoxZIjnNyZNmQ6LKkA7YfGXigs3hjZ?=
 =?us-ascii?Q?KAjkQYhzhcYvoWfB46RG54bJBs7g/PAQzj91yExGovd49FNYtI7TZHLRitJf?=
 =?us-ascii?Q?A4H3+2lASB6KXDEafqRf4bd0oiQpyOITV4vDyeZhvV0HCNjYb4etOyapO5NR?=
 =?us-ascii?Q?XandLHNdlHpMejhKinDEp1s4f3NNCIoIVf8S5IAOiqTYq6LG3nMZ9U12Kh82?=
 =?us-ascii?Q?B6KMjMJZnv3Di7YZLldfQUh19R+tK2qgig1G9dkKLnYmvtXstqZt/Nm3KCYw?=
 =?us-ascii?Q?skitjIQtZdXRtvLL8HkPLeiqYZxLYeYRAVIqjistEmPd6eB4+9UKgNprqJxk?=
 =?us-ascii?Q?UZp1ctNmMEQpyW5sDmaG84Z81iy5i+AAL2yF0DVjthxgPGgYETZrP8cXcg/k?=
 =?us-ascii?Q?y2rHf4JPa+o2RsoaaXp2ohvmxM8iEzl7JOX3SJHo3NNT/pp+wBMLgCI0XnfA?=
 =?us-ascii?Q?sTOGZDmKwy4leEVEFA9YAihPEKrVA++876R80wznao9uK/fp9CdXbF2tcOZo?=
 =?us-ascii?Q?duhZSLeEh2r02VV6+j83RxqRh2OjuCLdx4W2cCVF6v2pPKAUhAMZgJ6F7SRM?=
 =?us-ascii?Q?e7Oa7WII8VcOwyj3oj01Bjvv7Qkm6L5z6kK5?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 11:58:07.7698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc87d2b-2b5f-4cf2-f89b-08dde17328c8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5757
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 12:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222314

The "has-elf-tls" option was removed by the commit
8e1614a906086fb46c5dd7b7f2dffab91194165c. However is should have been
renamed to "has-thread-local", since it was renamed and not removed in
rust by this commit.
https://github.com/rust-lang/rust/commit/391332c5d9d5a5e97a0d36e011a87ad430=
45cfd3

Change-Id: Ia1fdf7698ebeef62a88052713645d5b499164353
Signed-off-by: Per x Johansson <perxjoh@axis.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-=
recipe/rust-target-config.bbclass
index cac6e90a9e..0df6f0904c 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['linker-is-gnu'] =3D True
     tspec['linker-flavor'] =3D "gcc"
     tspec['has-rpath'] =3D True
+    tspec['has-thread-local'] =3D True
     tspec['position-independent-executables'] =3D True
     tspec['panic-strategy'] =3D d.getVar("RUST_PANIC_STRATEGY")
=20
--=20
2.39.5


