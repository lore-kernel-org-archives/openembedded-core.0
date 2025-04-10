Return-Path: <daniel.turull@ericsson.com>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0681DC369A4
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 09:49:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.68])
 by mx.groups.io with SMTP id smtpd.web11.30523.1744278575687239310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 02:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=mAGbKNtT;
 spf=pass (domain: ericsson.com, ip: 40.107.21.68, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewEj/ovev9TXfhLKVtMW3LsRxHMbwjadKvWhhmXfAdl6p8AZinIuWzV4PEvE6W7xSOgK9u5xQCXdRePtw516wzOZFWyWMJkGlBy2cm9lQv7M7044nRCZ4erwEwxldZ0QZ0FSoyUKvLmXX3f+U2Dt+5SiIfrkBspNJbpVdlyP4vfuhqp+rEHnEsecfX663VE3L5gOgOCocj7NZxZvHaVVYi4ceCpZyAfGkluNe/wvH4FRBPYonpM0e9yOW+rrPdo35jMJoVhnw0cV4P9onDf0GsK+Buu7OgNTglkg4lXTJY7OYkDHuWNxesz+kfTmK4Y+Do/ymx88jVkeydtvFGy7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvlU3dx3O4BuHy1pGxgxeP6794q9fawJPcKBdaxchHs=;
 b=iKZq5uwmSqTc/4IeGB6Naw/Yr4Hjm/AkX9L3liIx6BWcdQLsTfG+h9AdWb/hfsurgJ7AFtpCehkqtAKlWUX+DpEP9Z6SkQDQ0+8HT3zoaoTF5vtAjxxKq9bNoGkapA2yLkfNwQzKhCq69To3CgDlYNFtOXLgmjzm/qY3j2K9AG5VDs/5gdVL1NT11yVFWQXZNYLdSAGtqpTohIcur5O3cZDWeWXNsklhZ5MDZnef/DRFrpJNmcBefYoLI/GsenQjWGkS5B4/LZVwTTcMkzLz/LIzKD1sWg26QEUzPGmSq65BBPIi+YiZWkaKdCJo/UB79WO7powPmNnWzuhox5y2CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvlU3dx3O4BuHy1pGxgxeP6794q9fawJPcKBdaxchHs=;
 b=mAGbKNtTrxYZ+jjFIKrl/cSAvs3lkKBcc4szdTU+3O5ENSTi3qNz0W8qHOwmVBuN7D/FApMWJHtU170jyO7i6zHqBsfXZlnTQDM2jFPnwtXvHp0MUG/6qixq/Z8ob1TuTE/3lfJvHH4zBsLTr6qXc/mNMdIqe6NW1/NY4tuRvNWaZXfr/MGOb8Cs+yTdeFu+nEKbRFj38f8gnQhzxUAcq50ADEfPeDgWlYInZCCVO0x7VZsGpmZ34NE9ASjZu1VEtIyPHcgCGK+pLqrMRj3nbugi/aHK6JCeEzLIir/5I3uvdBVGe6wOyAJ/CKpgcvEMrw/iU+3nWDkGpwKv/208Xg==
Received: from AS4P250CA0030.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::20)
 by AM9PR07MB7252.eurprd07.prod.outlook.com (2603:10a6:20b:2c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 09:49:26 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::52) by AS4P250CA0030.outlook.office365.com
 (2603:10a6:20b:5e3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.23 via Frontend Transport; Thu,
 10 Apr 2025 09:49:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 09:49:26 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 11:49:25 +0200
Received: from seroius08534.sero.gic.ericsson.se (seroius08534.sero.gic.ericsson.se [10.63.237.244])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id DC7D89582F;
	Thu, 10 Apr 2025 11:49:24 +0200 (CEST)
Received: by seroius08534.sero.gic.ericsson.se (Postfix, from userid 160155)
	id C7D61700DD49; Thu, 10 Apr 2025 11:49:24 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 2/2] cve-exclusions: update with all CVEs from linuxkernelcve
Date: Thu, 10 Apr 2025 11:48:36 +0200
Message-ID: <20250410094837.897013-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410094837.897013-1-daniel.turull@ericsson.com>
References: <20250410094837.897013-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|AM9PR07MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d29a285-10eb-4922-ade9-08dd7814faf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O4R2TllgYA0kOxaprvnuZAqemwvwr5JXbvdT7JL8QcW/tQutYKVvKN3mfeAa?=
 =?us-ascii?Q?fLTrHKm7lojGFJqIm7cOv5DQzjD645kkkSpYAo1GmSF4bzOP3wTD7+yjeE+a?=
 =?us-ascii?Q?TC+qNBunHq899KvdaP7jGSkpI7YpC8+6dX7WokzgzGo4X2CTfAa/MTFAfdY5?=
 =?us-ascii?Q?ZaJPLGay4TWOCOvGoPaAy2U2zNExxsKWekZQzvlfba/+rckcMIpGNKSn6/UV?=
 =?us-ascii?Q?c3tEP+sORXYC/hFfw4fbC70Xv5Wn40CQ7npsseeHEt0bv7cyjfhjWYO9xzt6?=
 =?us-ascii?Q?278pF19QKeQsNVs8MYs59rjCzB9ISWywM05M1T7XGMZICQbhcIaETqEY++nv?=
 =?us-ascii?Q?NXePbVxIHnawJ3Z/tJB3LeZd0cHGgZL1tu8P9XJMOBwOTsFZIgKy44XZl9AB?=
 =?us-ascii?Q?W1lIMweXAwwbG+29kzBL3YPF3spSzndy9fn+8err1yF/m2SUV6LnmHYvaAEd?=
 =?us-ascii?Q?0bK+ZpX0CJuR8gvWaeXQAPuL/b+SxMM2tmu5n4tgw0Z4hC1zBOgsxY5IQw77?=
 =?us-ascii?Q?IbZ84jPjcmNK1YpQphlY6wbWaG7s5KL3yi+dMebUJ7VDX9ovqXqpqJIkpRgR?=
 =?us-ascii?Q?dTW5BVd3VocyHTzC3AbLza1Sto1vq74nu6QOeQIycvjDxW84DBuEZNO/YsR2?=
 =?us-ascii?Q?Dh2OWk8eOT2SwM+H90kzV4o8Bb/V3jGVR/3NUq/O7IduQ6+z1YWRmPKM+LKa?=
 =?us-ascii?Q?nCKWn5ot+Q06juxiWzzrtzmL8UhCrBkG090j4hWgKQzyzA5agPBCf2g4+wl9?=
 =?us-ascii?Q?pqLXRYvvGZIWH8Ng40fYP38BC4uldVsIvPIgeyTbbzJP949xL2K5hbO7wZH8?=
 =?us-ascii?Q?AhycL/n/sGRoueD5Uqi8dY0pId4OPDFxjMwdZO6MBquAbWkpehRRFAlf5baf?=
 =?us-ascii?Q?TJs0P+1ESHB5GnHHFe+Bo2wJR3X4LfSQtms241B+s6D3odFXIUi1AgJ2XHqL?=
 =?us-ascii?Q?DFKVs/z8mQjKJ2eJieTpbxp6HQirETSala6/qsCCj9x8414E0RaYW/DIOs0J?=
 =?us-ascii?Q?oKBp1MAXLQx7uDBN4us1KbN+VPoMKAhciliiBMiBZZt4PnJ32w5pvBpTiKYU?=
 =?us-ascii?Q?7fieAOg6C0CulQd1PMMJ/flYVi1qDKbThT9SXZEPSC6YXMUGO5cQ7z4xtZ9o?=
 =?us-ascii?Q?FXwsCsVkyull6kUB3YnRNJGpclf7YGhoZ2ue47ZvD/5wvDQSDrrvw2IELSmE?=
 =?us-ascii?Q?TD8k5P042wi5sDYaupHgdzNq9Uc835PiADhlLgE3RuCO4q7Kc/KWBHteBKIW?=
 =?us-ascii?Q?VoN6TUbF2P4za2qI8vfEwdxAk8MaOuH1rJA9FRIHkg5w2hZzs59euPVMkmSX?=
 =?us-ascii?Q?cB86RRWkID2hDmMtOADkN8pPYJBRKGNblspbr5NoGF2PIhSPUyNyOS2EPw0i?=
 =?us-ascii?Q?HWODaAOHaQxJ68C6XkrPCSsA7zhfuHaxFWP+uSg4djdAgKrzPXPBEBXLlbnr?=
 =?us-ascii?Q?TwgIPAxFrGk35p+fck/jPf3RDQJrCNiWwpDEduiEHcONzH2L3xgg66A1Ze4l?=
 =?us-ascii?Q?Hgk6jcKomYw86uvS149UMysmoPf8ho6zIwQ3?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 09:49:26.0650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d29a285-10eb-4922-ade9-08dd7814faf3
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7252
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 09:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214635

From: Daniel Turull <daniel.turull@ericsson.com>

Execute new script generate-cve-exclusions.py
./generate-cve-exclusions.py ~/cvelistV5/ 6.12.19 > cve-exclusion_6.12.inc

After using the database from CVEproject, some old
CVEs did not have correct metadata, therefore moving missing ones
from old cve-exclusions_6.12.inc into cve-exclusion.inc

Comparing output from cve_check before and after, two CVEs are removed:
CVE-2023-52904 and CVE-2024-38381

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc   |  118 +
 .../linux/cve-exclusion_6.12.inc              | 9194 +++++++++++------
 2 files changed, 5980 insertions(+), 3332 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-ker=
nel/linux/cve-exclusion.inc
index 7857633943..5f96a81bdd 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -32,3 +32,121 @@ CVE_STATUS[CVE-2020-11935] =3D "not-applicable-config: =
Issue only affects aufs, wh
 CVE_STATUS[CVE-2023-23005] =3D "disputed: There are no realistic cases \
 in which a user can cause the alloc_memory_type error case to be reached. =
\
 See: https://bugzilla.suse.com/show_bug.cgi?id=3D1208844#c2"
+
+# Old CVES taken before using new data from kernel CNA
+
+CVE_STATUS[CVE-2014-8171] =3D "fixed-version: Fixed from version 3.12rc1"
+
+CVE_STATUS[CVE-2017-1000255] =3D "fixed-version: Fixed from version 4.14rc=
5"
+
+CVE_STATUS[CVE-2018-10840] =3D "fixed-version: Fixed from version 4.18rc1"
+
+CVE_STATUS[CVE-2018-10876] =3D "fixed-version: Fixed from version 4.18rc4"
+
+CVE_STATUS[CVE-2018-10882] =3D "fixed-version: Fixed from version 4.18rc4"
+
+CVE_STATUS[CVE-2018-10902] =3D "fixed-version: Fixed from version 4.18rc6"
+
+CVE_STATUS[CVE-2018-14625] =3D "fixed-version: Fixed from version 4.20rc6"
+
+CVE_STATUS[CVE-2019-3016] =3D "fixed-version: Fixed from version 5.6rc1"
+
+CVE_STATUS[CVE-2019-3819] =3D "fixed-version: Fixed from version 5.0rc6"
+
+CVE_STATUS[CVE-2019-3887] =3D "fixed-version: Fixed from version 5.1rc4"
+
+CVE_STATUS[CVE-2020-10742] =3D "fixed-version: Fixed from version 3.16rc1"
+
+CVE_STATUS[CVE-2020-16119] =3D "fixed-version: Fixed from version 5.15rc2"
+
+CVE_STATUS[CVE-2020-1749] =3D "fixed-version: Fixed from version 5.5rc1"
+
+CVE_STATUS[CVE-2020-25672] =3D "fixed-version: Fixed from version 5.12rc7"
+
+CVE_STATUS[CVE-2020-27815] =3D "fixed-version: Fixed from version 5.11rc1"
+
+CVE_STATUS[CVE-2020-8834] =3D "fixed-version: Fixed from version 4.18rc1"
+
+CVE_STATUS[CVE-2021-20194] =3D "fixed-version: Fixed from version 5.10rc1"
+
+CVE_STATUS[CVE-2021-20265] =3D "fixed-version: Fixed from version 4.5rc3"
+
+CVE_STATUS[CVE-2021-3564] =3D "fixed-version: Fixed from version 5.13rc5"
+
+CVE_STATUS[CVE-2021-3669] =3D "fixed-version: Fixed from version 5.15rc1"
+
+CVE_STATUS[CVE-2021-3759] =3D "fixed-version: Fixed from version 5.15rc1"
+
+CVE_STATUS[CVE-2021-4218] =3D "fixed-version: Fixed from version 5.8rc1"
+
+CVE_STATUS[CVE-2022-0286] =3D "fixed-version: Fixed from version 5.14rc2"
+
+CVE_STATUS[CVE-2022-1462] =3D "fixed-version: Fixed from version 5.19rc7"
+
+CVE_STATUS[CVE-2022-2308] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-2327] =3D "fixed-version: Fixed from version 5.12rc1"
+
+CVE_STATUS[CVE-2022-2663] =3D "fixed-version: Fixed from version 6.0rc5"
+
+CVE_STATUS[CVE-2022-2785] =3D "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3435] =3D "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3523] =3D "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3534] =3D "fixed-version: Fixed from version 6.2rc1"
+
+CVE_STATUS[CVE-2022-3566] =3D "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3567] =3D "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3619] =3D "fixed-version: Fixed from version 6.1rc4"
+
+CVE_STATUS[CVE-2022-3621] =3D "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-3624] =3D "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3629] =3D "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3630] =3D "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3633] =3D "fixed-version: Fixed from version 6.0rc1"
+
+CVE_STATUS[CVE-2022-3636] =3D "fixed-version: Fixed from version 5.19rc1"
+
+CVE_STATUS[CVE-2022-36402] =3D "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2022-3646] =3D "fixed-version: Fixed from version 6.1rc1"
+
+CVE_STATUS[CVE-2022-42895] =3D "fixed-version: Fixed from version 6.1rc4"
+
+CVE_STATUS[CVE-2022-4382] =3D "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-1073] =3D "fixed-version: Fixed from version 6.2rc5"
+
+CVE_STATUS[CVE-2023-1074] =3D "fixed-version: Fixed from version 6.2rc6"
+
+CVE_STATUS[CVE-2023-1075] =3D "fixed-version: Fixed from version 6.2rc7"
+
+CVE_STATUS[CVE-2023-1076] =3D "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2023-2898] =3D "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-3772] =3D "fixed-version: Fixed from version 6.5rc7"
+
+CVE_STATUS[CVE-2023-3773] =3D "fixed-version: Fixed from version 6.5rc7"
+
+CVE_STATUS[CVE-2023-4155] =3D "fixed-version: Fixed from version 6.5rc6"
+
+CVE_STATUS[CVE-2023-6176] =3D "fixed-version: Fixed from version 6.6rc2"
+
+CVE_STATUS[CVE-2023-6270] =3D "cpe-stable-backport: Backported in 6.6.23"
+
+CVE_STATUS[CVE-2023-6610] =3D "cpe-stable-backport: Backported in 6.6.13"
+
+CVE_STATUS[CVE-2023-6679] =3D "fixed-version: only affects 6.7rc1 onwards"
+
+CVE_STATUS[CVE-2023-7042] =3D "cpe-stable-backport: Backported in 6.6.23"
+
+CVE_STATUS[CVE-2024-0193] =3D "cpe-stable-backport: Backported in 6.6.10"
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipe=
s-kernel/linux/cve-exclusion_6.12.inc
index 32a0701edf..4cfe0944bc 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6660 +1,9190 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-06-06 20:41:33.044442+00:00 for version 6.6.32
+# Generated at 2025-04-10 09:01:06.745895+00:00 for version 6.12.19
=20
-#python check_kernel_cve_status_version() {
-#    this_version =3D "6.6.29"
-#    kernel_version =3D d.getVar("LINUX_VERSION")
-#    if kernel_version !=3D this_version:
-#        bb.warn("Kernel CVE status needs updating: generated for %s but k=
ernel is %s" % (this_version, kernel_version))
-#}
-#do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
+python check_kernel_cve_status_version() {
+    this_version =3D "6.12.19"
+    kernel_version =3D d.getVar("LINUX_VERSION")
+    if kernel_version !=3D this_version:
+        bb.warn("Kernel CVE status needs updating: generated for %s but ke=
rnel is %s" % (this_version, kernel_version))
+}
+do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
=20
-CVE_STATUS[CVE-2003-1604] =3D "fixed-version: Fixed from version 2.6.12rc2=
"
+CVE_STATUS[CVE-2019-25160] =3D "fixed-version: Fixed from version 5.0"
+
+CVE_STATUS[CVE-2019-25162] =3D "fixed-version: Fixed from version 6.0"
+
+# CVE-2019-3459 has no known resolution
+
+# CVE-2019-3460 has no known resolution
+
+CVE_STATUS[CVE-2020-36775] =3D "fixed-version: Fixed from version 5.7"
+
+CVE_STATUS[CVE-2020-36776] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36777] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36778] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36779] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36780] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36781] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36782] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36783] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36784] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36785] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36786] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36787] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2020-36788] =3D "fixed-version: Fixed from version 5.15"
+
+# CVE-2021-28688 has no known resolution
+
+# CVE-2021-28691 has no known resolution
+
+# CVE-2021-28711 has no known resolution
+
+# CVE-2021-28712 has no known resolution
+
+# CVE-2021-28713 has no known resolution
+
+# CVE-2021-28714 has no known resolution
+
+# CVE-2021-28715 has no known resolution
+
+CVE_STATUS[CVE-2021-46904] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46905] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46906] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46908] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46909] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46910] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46911] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46912] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46913] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46914] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46915] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46916] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46917] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46918] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46919] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46920] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46921] =3D "fixed-version: Fixed from version 5.12"
+
+CVE_STATUS[CVE-2021-46922] =3D "fixed-version: Fixed from version 5.10.33"
+
+CVE_STATUS[CVE-2021-46923] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46924] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46925] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46926] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46927] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46928] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46929] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46930] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46931] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46932] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46933] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46934] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46935] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46936] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46937] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-46938] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46939] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46940] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46941] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46942] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46943] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46944] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46945] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46947] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46948] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46949] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46950] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46951] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46952] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46953] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46954] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46955] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46956] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46957] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46958] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46959] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46960] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46961] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46962] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46963] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46964] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46965] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46966] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46967] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46968] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46969] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46970] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46971] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46972] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46973] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46974] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46976] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46977] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46978] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46979] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46980] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46981] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46982] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46983] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46984] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46985] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46986] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46987] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46988] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46989] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46990] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46991] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46992] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46993] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46994] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46995] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46996] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46997] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46998] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-46999] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47000] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47001] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47002] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47003] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47004] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47005] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47006] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47007] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47008] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47009] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47010] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47011] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47012] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47013] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47014] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47015] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47016] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47017] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47018] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47019] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47020] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47021] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47022] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47023] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47024] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47025] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47026] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47027] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47028] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47029] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47030] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47031] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47032] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47033] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47034] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47035] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47036] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47037] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47038] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47039] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47040] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47041] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47042] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47043] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47044] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47045] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47046] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47047] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47048] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47049] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47050] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47051] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47052] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47053] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47054] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47055] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47056] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47057] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47058] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47059] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47060] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47061] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47062] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47063] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47064] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47065] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47066] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47067] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47068] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47069] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47070] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47071] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47072] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47073] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47074] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47075] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47076] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47077] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47078] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47079] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47080] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47081] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47082] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47083] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47086] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47087] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47088] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47089] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47090] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47091] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47092] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47093] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47094] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47095] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47096] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47097] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47098] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47099] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47100] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47101] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47102] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47103] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47104] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47105] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47106] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47107] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47108] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47109] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47110] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47111] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47112] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47113] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47114] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47116] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47117] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47118] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47119] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47120] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47121] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47122] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47123] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47124] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47125] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47126] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47127] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47128] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47129] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47130] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47131] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47132] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47133] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47134] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47135] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47136] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47137] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47138] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47139] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47140] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47141] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47142] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47143] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47144] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47145] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47146] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47147] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47148] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47149] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47150] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47151] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47152] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47153] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47158] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47159] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47160] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47161] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47162] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47163] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47164] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47165] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47166] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47167] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47168] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47169] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47170] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47171] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47172] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47173] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47174] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47175] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47176] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47177] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47178] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47179] =3D "fixed-version: Fixed from version 4.9.271"
+
+CVE_STATUS[CVE-2021-47180] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47181] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47182] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47183] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47184] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47185] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47186] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47187] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47188] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47189] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47190] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47191] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47192] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47193] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47194] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47195] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47196] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47197] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47198] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47199] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47200] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47201] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47202] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47203] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47204] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47205] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47206] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47207] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47209] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47210] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47211] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47212] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47214] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47215] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47216] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47217] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47218] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47219] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47221] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47222] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47223] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47224] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47225] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47226] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47227] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47228] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47229] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47230] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47231] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47232] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47233] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47234] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47235] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47236] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47237] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47238] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47239] =3D "fixed-version: Fixed from version 4.4.274"
+
+CVE_STATUS[CVE-2021-47240] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47241] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47242] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47243] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47244] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47245] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47246] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47247] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47248] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47249] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47250] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47251] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47252] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47253] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47254] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47255] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47256] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47257] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47258] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47259] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47260] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47261] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47262] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47263] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47264] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47265] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47266] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47267] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47268] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47269] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47270] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47271] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47272] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47273] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47274] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47275] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47276] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47277] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47278] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47279] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47280] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47281] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47282] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47283] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47284] =3D "fixed-version: Fixed from version 5.13"
+
+CVE_STATUS[CVE-2021-47286] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47287] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47288] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47289] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47290] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47291] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47292] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47293] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47294] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47295] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47296] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47297] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47298] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47299] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47300] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47301] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47302] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47303] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47304] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47305] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47306] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47307] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47308] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47309] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47310] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47311] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47312] =3D "fixed-version: Fixed from version 5.13.5"
+
+CVE_STATUS[CVE-2021-47313] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47314] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47315] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47316] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47317] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47318] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47319] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47320] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47321] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47322] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47323] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47324] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47325] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47327] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47328] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47329] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47330] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47331] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47332] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47333] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47334] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47335] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47336] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47337] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47338] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47339] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47340] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47341] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47342] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47343] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47344] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47345] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47346] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47347] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47348] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47349] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47350] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47351] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47352] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47353] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47354] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47355] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47356] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47357] =3D "fixed-version: Fixed from version 5.14"
+
+CVE_STATUS[CVE-2021-47358] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47359] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47360] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47361] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47362] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47363] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47364] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47365] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47366] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47367] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47368] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47369] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47370] =3D "fixed-version: Fixed from version 5.14.9"
+
+CVE_STATUS[CVE-2021-47371] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47372] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47373] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47374] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47375] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47376] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47378] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47379] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47380] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47381] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47382] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47383] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47384] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47385] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47386] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47387] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47388] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47389] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47390] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47391] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47392] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47393] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47394] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47395] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47396] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47397] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47398] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47399] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47400] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47401] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47402] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47403] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47404] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47405] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47406] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47407] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47408] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47409] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47410] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47412] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47413] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47414] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47415] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47416] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47417] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47418] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47419] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47420] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47421] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47422] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47423] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47424] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47425] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47426] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47427] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47428] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47429] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47430] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47431] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47432] =3D "fixed-version: Fixed from version 6.7"
+
+CVE_STATUS[CVE-2021-47433] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47434] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47435] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47436] =3D "fixed-version: Fixed from version 4.14.252=
"
+
+CVE_STATUS[CVE-2021-47437] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47438] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47439] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47440] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47441] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47442] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47443] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47444] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47445] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47446] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47447] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47448] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47449] =3D "fixed-version: Fixed from version 5.14.14"
+
+CVE_STATUS[CVE-2021-47450] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47451] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47452] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47453] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47454] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47455] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47456] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47457] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47458] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47459] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47460] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47461] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47462] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47463] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47464] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47465] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47466] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47467] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47468] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47469] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47470] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47471] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47473] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47474] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47475] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47476] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47477] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47478] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47479] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47480] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47481] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47482] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47483] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47484] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47485] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47486] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47489] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47490] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47491] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47492] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47493] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47494] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47495] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47496] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47497] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47498] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-47499] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47500] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47501] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47502] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47503] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47504] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47505] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47506] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47507] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47508] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47509] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47510] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47511] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47512] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47513] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47514] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47515] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47516] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47517] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47518] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47519] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47520] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47521] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47522] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47523] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47524] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47525] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47526] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47527] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47528] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47529] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47530] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47531] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47532] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47533] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47534] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47535] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47536] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47537] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47538] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47539] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47540] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47541] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47542] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47544] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47546] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47547] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47548] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47549] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47550] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47551] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47552] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47553] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47554] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47555] =3D "fixed-version: Fixed from version 5.4.163"
+
+CVE_STATUS[CVE-2021-47556] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47557] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47558] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47559] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47560] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47561] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47562] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47563] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47564] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47565] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47566] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47567] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47568] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47569] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47570] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47571] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47572] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47576] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47577] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47578] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47579] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47580] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47582] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47583] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47584] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47585] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47586] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47587] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47588] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47589] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47590] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47591] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47592] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47593] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47594] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47595] =3D "fixed-version: Fixed from version 5.10.88"
+
+CVE_STATUS[CVE-2021-47596] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47597] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47598] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47599] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47600] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47601] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47602] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47603] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47604] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47605] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47606] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47607] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47608] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47609] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47610] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47611] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47612] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47613] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47614] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47616] =3D "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2021-47617] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47618] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47619] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47620] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47622] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47623] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-47624] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-4439] =3D "fixed-version: Fixed from version 5.15"
+
+CVE_STATUS[CVE-2021-4440] =3D "fixed-version: Fixed from version 5.10.218"
+
+CVE_STATUS[CVE-2021-4441] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2021-4442] =3D "fixed-version: Fixed from version 5.12"
+
+# CVE-2022-26365 has no known resolution
+
+# CVE-2022-33740 has no known resolution
+
+# CVE-2022-33741 has no known resolution
+
+# CVE-2022-33742 has no known resolution
+
+# CVE-2022-33743 has no known resolution
+
+# CVE-2022-33744 has no known resolution
+
+# CVE-2022-3643 has no known resolution
+
+# CVE-2022-42328 has no known resolution
+
+# CVE-2022-42329 has no known resolution
+
+CVE_STATUS[CVE-2022-48626] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48627] =3D "fixed-version: Fixed from version 5.19"
+
+CVE_STATUS[CVE-2022-48628] =3D "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2022-48629] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48630] =3D "fixed-version: Fixed from version 5.18"
+
+CVE_STATUS[CVE-2022-48631] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48632] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48633] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48634] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48635] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48636] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48637] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48638] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48639] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48640] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48641] =3D "fixed-version: Fixed from version 4.14.295=
"
+
+CVE_STATUS[CVE-2022-48642] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48643] =3D "fixed-version: Fixed from version 5.10.146=
"
+
+CVE_STATUS[CVE-2022-48644] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48645] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48646] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48647] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48648] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48649] =3D "fixed-version: Fixed from version 5.19.12"
+
+CVE_STATUS[CVE-2022-48650] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48651] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48652] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48653] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48654] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48655] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48656] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48657] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48658] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48659] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48660] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48661] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48662] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48663] =3D "fixed-version: Fixed from version 5.10.146=
"
+
+CVE_STATUS[CVE-2022-48664] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48665] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48666] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48667] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48668] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48669] =3D "fixed-version: Fixed from version 6.9"
+
+CVE_STATUS[CVE-2022-48670] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48671] =3D "fixed-version: Fixed from version 5.4.215"
+
+CVE_STATUS[CVE-2022-48672] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48673] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48674] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48675] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48686] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48687] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48688] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48689] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48690] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48691] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48692] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48693] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48694] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48695] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48696] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48697] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48698] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48699] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48701] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48702] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48703] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48704] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48705] =3D "fixed-version: Fixed from version 6.0"
+
+CVE_STATUS[CVE-2022-48706] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48707] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48708] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48709] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48710] =3D "fixed-version: Fixed from version 5.19"
+
+CVE_STATUS[CVE-2022-48711] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48712] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48713] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48714] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48715] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48716] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48717] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48718] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48719] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48720] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48721] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48722] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48723] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48724] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48725] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48726] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48727] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48728] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48729] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48730] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48731] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48732] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48733] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48734] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48735] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48738] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48739] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48740] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48741] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48742] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48743] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48744] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48745] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48746] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48747] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48748] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48749] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48750] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48751] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48752] =3D "fixed-version: Fixed from version 5.10.96"
+
+CVE_STATUS[CVE-2022-48753] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48754] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48755] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48756] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48757] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48758] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48759] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48760] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48761] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48762] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48763] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48764] =3D "fixed-version: Fixed from version 5.16.5"
+
+CVE_STATUS[CVE-2022-48765] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48766] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48767] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48768] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48769] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48770] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48771] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48772] =3D "fixed-version: Fixed from version 6.10"
+
+CVE_STATUS[CVE-2022-48773] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48774] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48775] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48776] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48777] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48778] =3D "fixed-version: Fixed from version 5.4.181"
+
+CVE_STATUS[CVE-2022-48779] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48780] =3D "fixed-version: Fixed from version 5.15.25"
+
+CVE_STATUS[CVE-2022-48781] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48782] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48783] =3D "fixed-version: Fixed from version 5.10.102=
"
+
+CVE_STATUS[CVE-2022-48784] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48785] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48786] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48787] =3D "fixed-version: Fixed from version 4.14.268=
"
+
+CVE_STATUS[CVE-2022-48788] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48789] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48790] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48791] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48792] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48793] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48794] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48795] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48796] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48797] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48798] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48799] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48800] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48801] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48802] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48803] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48804] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48805] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48806] =3D "fixed-version: Fixed from version 5.4.180"
+
+CVE_STATUS[CVE-2022-48807] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48808] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48809] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48810] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48811] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48812] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48813] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48814] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48815] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48816] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48817] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48818] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48819] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48820] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48821] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48822] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48823] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48824] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48825] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48826] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48827] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48828] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48829] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48830] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48831] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48832] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48833] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48834] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48835] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48836] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48837] =3D "fixed-version: Fixed from version 4.9.308"
+
+CVE_STATUS[CVE-2022-48838] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48839] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48840] =3D "fixed-version: Fixed from version 5.15.31"
+
+CVE_STATUS[CVE-2022-48841] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48842] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48843] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48844] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48845] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48846] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48847] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48848] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48849] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48850] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48851] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48852] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48853] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48854] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48855] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48856] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48857] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48858] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48859] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48860] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48861] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48862] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48863] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48864] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48865] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48866] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48867] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48868] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48869] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48870] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48871] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48872] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48873] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48874] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48875] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48876] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48877] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48878] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48879] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48880] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48881] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48882] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48883] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48884] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48885] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48886] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48887] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48888] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48889] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48890] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48891] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48892] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48893] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48894] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48895] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48896] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48897] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48898] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48899] =3D "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-48901] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48902] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48903] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48904] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48905] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48906] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48907] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48908] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48909] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48910] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48911] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48912] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48913] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48914] =3D "fixed-version: Fixed from version 4.19.233=
"
+
+CVE_STATUS[CVE-2022-48915] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48916] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48917] =3D "fixed-version: Fixed from version 4.9.305"
+
+CVE_STATUS[CVE-2022-48918] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48919] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48920] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48921] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48922] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48923] =3D "fixed-version: Fixed from version 5.17"
+
+CVE_STATUS[CVE-2022-48924] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2004-0230] =3D "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-48925] =3D "fixed-version: Fixed from version 5.17"
=20
-# CVE-2005-3660 has no known resolution
+CVE_STATUS[CVE-2022-48926] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2006-3635] =3D "fixed-version: Fixed from version 2.6.26rc5=
"
+CVE_STATUS[CVE-2022-48927] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2006-5331] =3D "fixed-version: Fixed from version 2.6.19rc3=
"
+CVE_STATUS[CVE-2022-48928] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2006-6128] =3D "fixed-version: Fixed from version 2.6.19rc2=
"
+CVE_STATUS[CVE-2022-48929] =3D "fixed-version: Fixed from version 5.16.12"
=20
-# CVE-2007-3719 has no known resolution
+CVE_STATUS[CVE-2022-48930] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2007-4774] =3D "fixed-version: Fixed from version 2.6.12rc2=
"
+CVE_STATUS[CVE-2022-48931] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2007-6761] =3D "fixed-version: Fixed from version 2.6.24rc6=
"
+CVE_STATUS[CVE-2022-48932] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2007-6762] =3D "fixed-version: Fixed from version 2.6.20rc5=
"
+CVE_STATUS[CVE-2022-48933] =3D "fixed-version: Fixed from version 5.17"
=20
-# CVE-2008-2544 has no known resolution
+CVE_STATUS[CVE-2022-48934] =3D "fixed-version: Fixed from version 5.17"
=20
-# CVE-2008-4609 has no known resolution
+CVE_STATUS[CVE-2022-48935] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2008-7316] =3D "fixed-version: Fixed from version 2.6.25rc1=
"
+CVE_STATUS[CVE-2022-48937] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2009-2692] =3D "fixed-version: Fixed from version 2.6.31rc6=
"
+CVE_STATUS[CVE-2022-48938] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2010-0008] =3D "fixed-version: Fixed from version 2.6.23rc9=
"
+CVE_STATUS[CVE-2022-48939] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2010-3432] =3D "fixed-version: Fixed from version 2.6.36rc5=
"
+CVE_STATUS[CVE-2022-48940] =3D "fixed-version: Fixed from version 5.17"
=20
-# CVE-2010-4563 has no known resolution
+CVE_STATUS[CVE-2022-48941] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2010-4648] =3D "fixed-version: Fixed from version 2.6.37rc6=
"
+CVE_STATUS[CVE-2022-48942] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2010-5313] =3D "fixed-version: Fixed from version 2.6.38rc1=
"
+CVE_STATUS[CVE-2022-48943] =3D "fixed-version: Fixed from version 5.17"
=20
-# CVE-2010-5321 has no known resolution
+CVE_STATUS[CVE-2022-48944] =3D "fixed-version: Fixed from version 5.17"
=20
-CVE_STATUS[CVE-2010-5328] =3D "fixed-version: Fixed from version 2.6.35rc1=
"
+CVE_STATUS[CVE-2022-48945] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2010-5329] =3D "fixed-version: Fixed from version 2.6.39rc1=
"
+CVE_STATUS[CVE-2022-48946] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2010-5331] =3D "fixed-version: Fixed from version 2.6.34rc7=
"
+CVE_STATUS[CVE-2022-48947] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2010-5332] =3D "fixed-version: Fixed from version 2.6.37rc1=
"
+CVE_STATUS[CVE-2022-48948] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2011-4098] =3D "fixed-version: Fixed from version 3.2rc1"
+CVE_STATUS[CVE-2022-48949] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2011-4131] =3D "fixed-version: Fixed from version 3.3rc1"
+CVE_STATUS[CVE-2022-48950] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2011-4915] =3D "fixed-version: Fixed from version 3.2rc1"
+CVE_STATUS[CVE-2022-48951] =3D "fixed-version: Fixed from version 6.1"
=20
-# CVE-2011-4916 has no known resolution
+CVE_STATUS[CVE-2022-48952] =3D "fixed-version: Fixed from version 6.2"
=20
-# CVE-2011-4917 has no known resolution
+CVE_STATUS[CVE-2022-48953] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2011-5321] =3D "fixed-version: Fixed from version 3.2rc1"
+CVE_STATUS[CVE-2022-48954] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2011-5327] =3D "fixed-version: Fixed from version 3.1rc1"
+CVE_STATUS[CVE-2022-48955] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-0957] =3D "fixed-version: Fixed from version 3.7rc2"
+CVE_STATUS[CVE-2022-48956] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-2119] =3D "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-48957] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-2136] =3D "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-48958] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-2137] =3D "fixed-version: Fixed from version 3.5rc2"
+CVE_STATUS[CVE-2022-48959] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-2313] =3D "fixed-version: Fixed from version 3.4rc6"
+CVE_STATUS[CVE-2022-48960] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-2319] =3D "fixed-version: Fixed from version 3.4rc6"
+CVE_STATUS[CVE-2022-48961] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-2372] =3D "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2022-48962] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-2375] =3D "fixed-version: Fixed from version 3.4rc1"
+CVE_STATUS[CVE-2022-48963] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-2390] =3D "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-48964] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-2669] =3D "fixed-version: Fixed from version 3.5rc4"
+CVE_STATUS[CVE-2022-48965] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-2744] =3D "fixed-version: Fixed from version 2.6.34rc1=
"
+CVE_STATUS[CVE-2022-48966] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-2745] =3D "fixed-version: Fixed from version 3.4rc3"
+CVE_STATUS[CVE-2022-48967] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-3364] =3D "fixed-version: Fixed from version 3.5rc6"
+CVE_STATUS[CVE-2022-48968] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-3375] =3D "fixed-version: Fixed from version 3.4rc5"
+CVE_STATUS[CVE-2022-48969] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-3400] =3D "fixed-version: Fixed from version 3.5rc5"
+CVE_STATUS[CVE-2022-48970] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-3412] =3D "fixed-version: Fixed from version 3.6rc2"
+CVE_STATUS[CVE-2022-48971] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-3430] =3D "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-48972] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-3510] =3D "fixed-version: Fixed from version 2.6.19rc4=
"
+CVE_STATUS[CVE-2022-48973] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-3511] =3D "fixed-version: Fixed from version 3.5rc6"
+CVE_STATUS[CVE-2022-48974] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-3520] =3D "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48975] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-3552] =3D "fixed-version: Fixed from version 3.0rc1"
+CVE_STATUS[CVE-2022-48976] =3D "fixed-version: Fixed from version 6.1"
=20
-# Skipping CVE-2012-4220, no affected_versions
+CVE_STATUS[CVE-2022-48977] =3D "fixed-version: Fixed from version 6.1"
=20
-# Skipping CVE-2012-4221, no affected_versions
+CVE_STATUS[CVE-2022-48978] =3D "fixed-version: Fixed from version 6.1"
=20
-# Skipping CVE-2012-4222, no affected_versions
+CVE_STATUS[CVE-2022-48979] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-4398] =3D "fixed-version: Fixed from version 3.4rc1"
+CVE_STATUS[CVE-2022-48980] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-4444] =3D "fixed-version: Fixed from version 2.6.36rc4=
"
+CVE_STATUS[CVE-2022-48981] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-4461] =3D "fixed-version: Fixed from version 3.7rc6"
+CVE_STATUS[CVE-2022-48982] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-4467] =3D "fixed-version: Fixed from version 3.6rc5"
+CVE_STATUS[CVE-2022-48983] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-4508] =3D "fixed-version: Fixed from version 3.7rc3"
+CVE_STATUS[CVE-2022-48984] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-4530] =3D "fixed-version: Fixed from version 3.8rc1"
+CVE_STATUS[CVE-2022-48985] =3D "fixed-version: Fixed from version 6.1"
=20
-# CVE-2012-4542 has no known resolution
+CVE_STATUS[CVE-2022-48986] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-4565] =3D "fixed-version: Fixed from version 3.7rc4"
+CVE_STATUS[CVE-2022-48987] =3D "fixed-version: Fixed from version 4.9.336"
=20
-CVE_STATUS[CVE-2012-5374] =3D "fixed-version: Fixed from version 3.8rc1"
+CVE_STATUS[CVE-2022-48988] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-5375] =3D "fixed-version: Fixed from version 3.8rc1"
+CVE_STATUS[CVE-2022-48989] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-5517] =3D "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-48990] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6536] =3D "fixed-version: Fixed from version 3.6rc7"
+CVE_STATUS[CVE-2022-48991] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6537] =3D "fixed-version: Fixed from version 3.6rc7"
+CVE_STATUS[CVE-2022-48992] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6538] =3D "fixed-version: Fixed from version 3.6rc7"
+CVE_STATUS[CVE-2022-48994] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6539] =3D "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48995] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6540] =3D "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48996] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6541] =3D "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48997] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6542] =3D "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48998] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6543] =3D "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-48999] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6544] =3D "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-49000] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6545] =3D "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-49001] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6546] =3D "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2022-49002] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6547] =3D "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-49003] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6548] =3D "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-49004] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6549] =3D "fixed-version: Fixed from version 3.6rc1"
+CVE_STATUS[CVE-2022-49005] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6638] =3D "fixed-version: Fixed from version 3.3rc1"
+CVE_STATUS[CVE-2022-49006] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6647] =3D "fixed-version: Fixed from version 3.6rc2"
+CVE_STATUS[CVE-2022-49007] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6657] =3D "fixed-version: Fixed from version 3.6"
+CVE_STATUS[CVE-2022-49008] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6689] =3D "fixed-version: Fixed from version 3.6rc5"
+CVE_STATUS[CVE-2022-49009] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6701] =3D "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-49010] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6703] =3D "fixed-version: Fixed from version 3.7rc1"
+CVE_STATUS[CVE-2022-49011] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6704] =3D "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-49012] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2012-6712] =3D "fixed-version: Fixed from version 3.4rc1"
+CVE_STATUS[CVE-2022-49013] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0160] =3D "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2022-49014] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0190] =3D "fixed-version: Fixed from version 3.8rc5"
+CVE_STATUS[CVE-2022-49015] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0216] =3D "fixed-version: Fixed from version 3.8rc7"
+CVE_STATUS[CVE-2022-49016] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0217] =3D "fixed-version: Fixed from version 3.8rc7"
+CVE_STATUS[CVE-2022-49017] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0228] =3D "fixed-version: Fixed from version 3.8"
+CVE_STATUS[CVE-2022-49018] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0231] =3D "fixed-version: Fixed from version 3.8rc7"
+CVE_STATUS[CVE-2022-49019] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0268] =3D "fixed-version: Fixed from version 3.8rc6"
+CVE_STATUS[CVE-2022-49020] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0290] =3D "fixed-version: Fixed from version 3.8"
+CVE_STATUS[CVE-2022-49021] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0309] =3D "fixed-version: Fixed from version 3.7rc1"
+CVE_STATUS[CVE-2022-49022] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0310] =3D "fixed-version: Fixed from version 3.5"
+CVE_STATUS[CVE-2022-49023] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0311] =3D "fixed-version: Fixed from version 3.7rc8"
+CVE_STATUS[CVE-2022-49024] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0313] =3D "fixed-version: Fixed from version 3.8rc5"
+CVE_STATUS[CVE-2022-49025] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0343] =3D "fixed-version: Fixed from version 3.11rc7"
+CVE_STATUS[CVE-2022-49026] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0349] =3D "fixed-version: Fixed from version 3.8rc6"
+CVE_STATUS[CVE-2022-49027] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0871] =3D "fixed-version: Fixed from version 3.8rc5"
+CVE_STATUS[CVE-2022-49028] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0913] =3D "fixed-version: Fixed from version 3.9rc4"
+CVE_STATUS[CVE-2022-49029] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-0914] =3D "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2022-49030] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-1059] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2022-49031] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-1763] =3D "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2022-49032] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-1767] =3D "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2022-49033] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-1772] =3D "fixed-version: Fixed from version 3.5rc1"
+CVE_STATUS[CVE-2022-49034] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2013-1773] =3D "fixed-version: Fixed from version 3.3rc1"
+CVE_STATUS[CVE-2022-49035] =3D "fixed-version: Fixed from version 6.1"
=20
-CVE_STATUS[CVE-2013-1774] =3D "fixed-version: Fixed from version 3.8rc5"
+# CVE-2023-34319 has no known resolution
=20
-CVE_STATUS[CVE-2013-1792] =3D "fixed-version: Fixed from version 3.9rc3"
+# CVE-2023-34324 has no known resolution
=20
-CVE_STATUS[CVE-2013-1796] =3D "fixed-version: Fixed from version 3.9rc4"
+# CVE-2023-46838 has no known resolution
=20
-CVE_STATUS[CVE-2013-1797] =3D "fixed-version: Fixed from version 3.9rc4"
+CVE_STATUS[CVE-2023-52433] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-1798] =3D "fixed-version: Fixed from version 3.9rc4"
+CVE_STATUS[CVE-2023-52434] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2013-1819] =3D "fixed-version: Fixed from version 3.8rc6"
+CVE_STATUS[CVE-2023-52435] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2013-1826] =3D "fixed-version: Fixed from version 3.6rc7"
+CVE_STATUS[CVE-2023-52436] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-1827] =3D "fixed-version: Fixed from version 3.6rc3"
+CVE_STATUS[CVE-2023-52438] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-1828] =3D "fixed-version: Fixed from version 3.9rc2"
+CVE_STATUS[CVE-2023-52439] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-1848] =3D "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52440] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-1858] =3D "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52441] =3D "fixed-version: Fixed from version 6.5"
=20
-CVE_STATUS[CVE-2013-1860] =3D "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52442] =3D "fixed-version: Fixed from version 6.5"
=20
-CVE_STATUS[CVE-2013-1928] =3D "fixed-version: Fixed from version 3.7rc3"
+CVE_STATUS[CVE-2023-52443] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-1929] =3D "fixed-version: Fixed from version 3.9rc6"
+CVE_STATUS[CVE-2023-52444] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2013-1935, no affected_versions
+CVE_STATUS[CVE-2023-52445] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-1943] =3D "fixed-version: Fixed from version 3.0rc1"
+CVE_STATUS[CVE-2023-52446] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-1956] =3D "fixed-version: Fixed from version 3.9rc5"
+CVE_STATUS[CVE-2023-52447] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-1957] =3D "fixed-version: Fixed from version 3.9rc5"
+CVE_STATUS[CVE-2023-52448] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-1958] =3D "fixed-version: Fixed from version 3.9rc5"
+CVE_STATUS[CVE-2023-52449] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-1959] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52450] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-1979] =3D "fixed-version: Fixed from version 3.9rc8"
+CVE_STATUS[CVE-2023-52451] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2015] =3D "fixed-version: Fixed from version 3.8rc2"
+CVE_STATUS[CVE-2023-52452] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2017] =3D "fixed-version: Fixed from version 2.6.34"
+CVE_STATUS[CVE-2023-52453] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2058] =3D "fixed-version: Fixed from version 3.8rc4"
+CVE_STATUS[CVE-2023-52454] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2094] =3D "fixed-version: Fixed from version 3.9rc8"
+CVE_STATUS[CVE-2023-52455] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2128] =3D "fixed-version: Fixed from version 2.6.34rc4=
"
+CVE_STATUS[CVE-2023-52456] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2140] =3D "fixed-version: Fixed from version 3.11rc3"
+CVE_STATUS[CVE-2023-52457] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2141] =3D "fixed-version: Fixed from version 3.9rc8"
+CVE_STATUS[CVE-2023-52458] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2146] =3D "fixed-version: Fixed from version 3.9rc8"
+CVE_STATUS[CVE-2023-52459] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2147] =3D "fixed-version: Fixed from version 3.12rc3"
+CVE_STATUS[CVE-2023-52460] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2148] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52461] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2164] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52462] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2013-2188, no affected_versions
+CVE_STATUS[CVE-2023-52463] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2206] =3D "fixed-version: Fixed from version 3.9rc4"
+CVE_STATUS[CVE-2023-52464] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2013-2224, no affected_versions
+CVE_STATUS[CVE-2023-52465] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2232] =3D "fixed-version: Fixed from version 3.10"
+CVE_STATUS[CVE-2023-52467] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2234] =3D "fixed-version: Fixed from version 3.10"
+CVE_STATUS[CVE-2023-52468] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2237] =3D "fixed-version: Fixed from version 3.9rc6"
+CVE_STATUS[CVE-2023-52469] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2013-2239, no affected_versions
+CVE_STATUS[CVE-2023-52470] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2546] =3D "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2023-52471] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2547] =3D "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2023-52472] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2548] =3D "fixed-version: Fixed from version 3.9rc1"
+CVE_STATUS[CVE-2023-52473] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2596] =3D "fixed-version: Fixed from version 3.9rc8"
+CVE_STATUS[CVE-2023-52474] =3D "fixed-version: Fixed from version 6.4"
=20
-CVE_STATUS[CVE-2013-2634] =3D "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52475] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-2635] =3D "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52476] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-2636] =3D "fixed-version: Fixed from version 3.9rc3"
+CVE_STATUS[CVE-2023-52477] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-2850] =3D "fixed-version: Fixed from version 3.10rc4"
+CVE_STATUS[CVE-2023-52478] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-2851] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52479] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-2852] =3D "fixed-version: Fixed from version 3.10rc6"
+CVE_STATUS[CVE-2023-52480] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-2888] =3D "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52481] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-2889] =3D "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52482] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-2890] =3D "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52483] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-2891] =3D "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52484] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-2892] =3D "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52485] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2893] =3D "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52486] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2894] =3D "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52487] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2895] =3D "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52488] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2896] =3D "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52489] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2897] =3D "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52490] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2898] =3D "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52491] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2899] =3D "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52492] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2929] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52493] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-2930] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52494] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-3076] =3D "fixed-version: Fixed from version 3.9"
+CVE_STATUS[CVE-2023-52495] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-3222] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52497] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-3223] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52498] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-3224] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52499] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3225] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52500] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3226] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52501] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3227] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52502] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3228] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52503] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3229] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52504] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3230] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52505] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3231] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52506] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3232] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52507] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3233] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52508] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3234] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52509] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3235] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52510] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3236] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52511] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3237] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52512] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3301] =3D "fixed-version: Fixed from version 3.9rc7"
+CVE_STATUS[CVE-2023-52513] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-3302] =3D "fixed-version: Fixed from version 3.8rc3"
+CVE_STATUS[CVE-2023-52515] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4125] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52516] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4127] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52517] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4129] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52518] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4162] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52519] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4163] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52520] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4205] =3D "fixed-version: Fixed from version 3.11rc5"
+CVE_STATUS[CVE-2023-52522] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4220] =3D "fixed-version: Fixed from version 3.10rc4"
+CVE_STATUS[CVE-2023-52523] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4247] =3D "fixed-version: Fixed from version 3.10rc5"
+CVE_STATUS[CVE-2023-52524] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4254] =3D "fixed-version: Fixed from version 3.11rc6"
+CVE_STATUS[CVE-2023-52525] =3D "fixed-version: Fixed from version 4.14.327=
"
=20
-CVE_STATUS[CVE-2013-4270] =3D "fixed-version: Fixed from version 3.12rc4"
+CVE_STATUS[CVE-2023-52526] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4299] =3D "fixed-version: Fixed from version 3.12rc6"
+CVE_STATUS[CVE-2023-52527] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4300] =3D "fixed-version: Fixed from version 3.11"
+CVE_STATUS[CVE-2023-52528] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4312] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2023-52529] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4343] =3D "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52530] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4345] =3D "fixed-version: Fixed from version 3.13rc2"
+CVE_STATUS[CVE-2023-52531] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4348] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52532] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4350] =3D "fixed-version: Fixed from version 3.12rc2"
+CVE_STATUS[CVE-2023-52559] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4387] =3D "fixed-version: Fixed from version 3.12rc4"
+CVE_STATUS[CVE-2023-52560] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4470] =3D "fixed-version: Fixed from version 3.12rc7"
+CVE_STATUS[CVE-2023-52561] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4483] =3D "fixed-version: Fixed from version 3.10rc1"
+CVE_STATUS[CVE-2023-52562] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4511] =3D "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52563] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4512] =3D "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52564] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4513] =3D "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52565] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4514] =3D "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52566] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4515] =3D "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52567] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4516] =3D "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52568] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4563] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52569] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4579] =3D "fixed-version: Fixed from version 3.13rc7"
+CVE_STATUS[CVE-2023-52570] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4587] =3D "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2023-52571] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4588] =3D "fixed-version: Fixed from version 2.6.33rc4=
"
+CVE_STATUS[CVE-2023-52572] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4591] =3D "fixed-version: Fixed from version 3.8rc1"
+CVE_STATUS[CVE-2023-52573] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-4592] =3D "fixed-version: Fixed from version 3.7rc1"
+CVE_STATUS[CVE-2023-52574] =3D "fixed-version: Fixed from version 6.6"
=20
-# Skipping CVE-2013-4737, no affected_versions
+CVE_STATUS[CVE-2023-52576] =3D "fixed-version: Fixed from version 6.6"
=20
-# Skipping CVE-2013-4738, no affected_versions
+CVE_STATUS[CVE-2023-52577] =3D "fixed-version: Fixed from version 4.14.327=
"
=20
-# Skipping CVE-2013-4739, no affected_versions
+CVE_STATUS[CVE-2023-52578] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-5634] =3D "fixed-version: Fixed from version 3.10rc5"
+CVE_STATUS[CVE-2023-52580] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-6282] =3D "fixed-version: Fixed from version 3.6rc6"
+CVE_STATUS[CVE-2023-52581] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-6367] =3D "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2023-52582] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2013-6368] =3D "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2023-52583] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-6376] =3D "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2023-52584] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-6378] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52585] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-6380] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52586] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-6381] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52587] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-6382] =3D "fixed-version: Fixed from version 3.13rc4"
+CVE_STATUS[CVE-2023-52588] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-6383] =3D "fixed-version: Fixed from version 3.12"
+CVE_STATUS[CVE-2023-52589] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2013-6392, no affected_versions
+CVE_STATUS[CVE-2023-52590] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-6431] =3D "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52591] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-6432] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52593] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-6885] =3D "fixed-version: Fixed from version 3.14rc1"
+CVE_STATUS[CVE-2023-52594] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7026] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52595] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7027] =3D "fixed-version: Fixed from version 3.12rc7"
+CVE_STATUS[CVE-2023-52596] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7263] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52597] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7264] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52598] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7265] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52599] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7266] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52600] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7267] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52601] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7268] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52602] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7269] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52603] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7270] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52604] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7271] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52606] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7281] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52607] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7339] =3D "fixed-version: Fixed from version 3.13rc7"
+CVE_STATUS[CVE-2023-52608] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7348] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52609] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7421] =3D "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52610] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2013-7445 has no known resolution
+CVE_STATUS[CVE-2023-52611] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7446] =3D "fixed-version: Fixed from version 4.4rc4"
+CVE_STATUS[CVE-2023-52612] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2013-7470] =3D "fixed-version: Fixed from version 3.12rc7"
+CVE_STATUS[CVE-2023-52613] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0038] =3D "fixed-version: Fixed from version 3.14rc1"
+CVE_STATUS[CVE-2023-52614] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0049] =3D "fixed-version: Fixed from version 3.14rc5"
+CVE_STATUS[CVE-2023-52615] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0055] =3D "fixed-version: Fixed from version 3.14"
+CVE_STATUS[CVE-2023-52616] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0069] =3D "fixed-version: Fixed from version 3.14rc4"
+CVE_STATUS[CVE-2023-52617] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0077] =3D "fixed-version: Fixed from version 3.14"
+CVE_STATUS[CVE-2023-52618] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0100] =3D "fixed-version: Fixed from version 3.14rc7"
+CVE_STATUS[CVE-2023-52619] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0101] =3D "fixed-version: Fixed from version 3.14rc6"
+CVE_STATUS[CVE-2023-52620] =3D "fixed-version: Fixed from version 6.4"
=20
-CVE_STATUS[CVE-2014-0102] =3D "fixed-version: Fixed from version 3.14rc6"
+CVE_STATUS[CVE-2023-52621] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0131] =3D "fixed-version: Fixed from version 3.14rc7"
+CVE_STATUS[CVE-2023-52622] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0155] =3D "fixed-version: Fixed from version 3.15rc2"
+CVE_STATUS[CVE-2023-52623] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0181] =3D "fixed-version: Fixed from version 3.15rc5"
+CVE_STATUS[CVE-2023-52624] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0196] =3D "fixed-version: Fixed from version 3.15rc5"
+CVE_STATUS[CVE-2023-52625] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0203] =3D "fixed-version: Fixed from version 2.6.33rc5=
"
+CVE_STATUS[CVE-2023-52626] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0205] =3D "fixed-version: Fixed from version 2.6.37rc1=
"
+CVE_STATUS[CVE-2023-52627] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-0206] =3D "fixed-version: Fixed from version 3.16rc3"
+CVE_STATUS[CVE-2023-52628] =3D "fixed-version: Fixed from version 6.6"
=20
-# Skipping CVE-2014-0972, no affected_versions
+CVE_STATUS[CVE-2023-52629] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2014-1438] =3D "fixed-version: Fixed from version 3.13"
+CVE_STATUS[CVE-2023-52631] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-1444] =3D "fixed-version: Fixed from version 3.12rc7"
+CVE_STATUS[CVE-2023-52632] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-1445] =3D "fixed-version: Fixed from version 3.12rc7"
+CVE_STATUS[CVE-2023-52633] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-1446] =3D "fixed-version: Fixed from version 3.13rc7"
+CVE_STATUS[CVE-2023-52634] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-1690] =3D "fixed-version: Fixed from version 3.13rc8"
+CVE_STATUS[CVE-2023-52635] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-1737] =3D "fixed-version: Fixed from version 3.15rc5"
+CVE_STATUS[CVE-2023-52636] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-1738] =3D "fixed-version: Fixed from version 3.15rc5"
+CVE_STATUS[CVE-2023-52637] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-1739] =3D "fixed-version: Fixed from version 3.15rc6"
+CVE_STATUS[CVE-2023-52638] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-1874] =3D "fixed-version: Fixed from version 3.14rc2"
+CVE_STATUS[CVE-2023-52639] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-2038] =3D "fixed-version: Fixed from version 3.14rc1"
+CVE_STATUS[CVE-2023-52640] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-2039] =3D "fixed-version: Fixed from version 3.14rc3"
+CVE_STATUS[CVE-2023-52641] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-2309] =3D "fixed-version: Fixed from version 3.14rc7"
+CVE_STATUS[CVE-2023-52642] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-2523] =3D "fixed-version: Fixed from version 3.14rc1"
+CVE_STATUS[CVE-2023-52643] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-2568] =3D "fixed-version: Fixed from version 3.14"
+CVE_STATUS[CVE-2023-52644] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-2580] =3D "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52645] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-2672] =3D "fixed-version: Fixed from version 3.14rc6"
+CVE_STATUS[CVE-2023-52646] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-2673] =3D "fixed-version: Fixed from version 3.14rc6"
+CVE_STATUS[CVE-2023-52647] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-2678] =3D "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52648] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-2706] =3D "fixed-version: Fixed from version 3.14rc6"
+CVE_STATUS[CVE-2023-52649] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-2739] =3D "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52650] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-2851] =3D "fixed-version: Fixed from version 3.15rc2"
+CVE_STATUS[CVE-2023-52652] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-2889] =3D "fixed-version: Fixed from version 3.2rc7"
+CVE_STATUS[CVE-2023-52653] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-3122] =3D "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52654] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-3144] =3D "fixed-version: Fixed from version 3.15rc2"
+CVE_STATUS[CVE-2023-52655] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-3145] =3D "fixed-version: Fixed from version 3.15rc2"
+CVE_STATUS[CVE-2023-52656] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3153] =3D "fixed-version: Fixed from version 3.15"
+CVE_STATUS[CVE-2023-52657] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3180] =3D "fixed-version: Fixed from version 3.17rc4"
+CVE_STATUS[CVE-2023-52658] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3181] =3D "fixed-version: Fixed from version 3.17rc3"
+CVE_STATUS[CVE-2023-52659] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-3182] =3D "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52660] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3183] =3D "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52661] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-3184] =3D "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52662] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-3185] =3D "fixed-version: Fixed from version 3.17rc3"
+CVE_STATUS[CVE-2023-52663] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-3186] =3D "fixed-version: Fixed from version 3.17rc3"
+CVE_STATUS[CVE-2023-52664] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2014-3519, no affected_versions
+CVE_STATUS[CVE-2023-52667] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3534] =3D "fixed-version: Fixed from version 3.16rc7"
+CVE_STATUS[CVE-2023-52668] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3535] =3D "fixed-version: Fixed from version 2.6.36rc1=
"
+CVE_STATUS[CVE-2023-52669] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3601] =3D "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52670] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3610] =3D "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52671] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3611] =3D "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52672] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3631] =3D "fixed-version: Fixed from version 3.17rc5"
+CVE_STATUS[CVE-2023-52673] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3645] =3D "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52674] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3646] =3D "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52675] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3647] =3D "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52676] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3673] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52677] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3687] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52678] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3688] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52679] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3690] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52680] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3917] =3D "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52681] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-3940] =3D "fixed-version: Fixed from version 3.15"
+CVE_STATUS[CVE-2023-52682] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4014] =3D "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52683] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4027] =3D "fixed-version: Fixed from version 3.14rc1"
+CVE_STATUS[CVE-2023-52684] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4157] =3D "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52686] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4171] =3D "fixed-version: Fixed from version 3.16rc3"
+CVE_STATUS[CVE-2023-52687] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2014-4322, no affected_versions
+CVE_STATUS[CVE-2023-52688] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2014-4323, no affected_versions
+CVE_STATUS[CVE-2023-52689] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4508] =3D "fixed-version: Fixed from version 3.16rc3"
+CVE_STATUS[CVE-2023-52690] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4608] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52691] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4611] =3D "fixed-version: Fixed from version 3.16rc3"
+CVE_STATUS[CVE-2023-52692] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4652] =3D "fixed-version: Fixed from version 3.16rc2"
+CVE_STATUS[CVE-2023-52693] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4653] =3D "fixed-version: Fixed from version 3.16rc2"
+CVE_STATUS[CVE-2023-52694] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4654] =3D "fixed-version: Fixed from version 3.16rc2"
+CVE_STATUS[CVE-2023-52695] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4655] =3D "fixed-version: Fixed from version 3.16rc2"
+CVE_STATUS[CVE-2023-52696] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4656] =3D "fixed-version: Fixed from version 3.16rc2"
+CVE_STATUS[CVE-2023-52697] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4667] =3D "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52698] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2014-4699] =3D "fixed-version: Fixed from version 3.16rc4"
+CVE_STATUS[CVE-2023-52699] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2014-4943] =3D "fixed-version: Fixed from version 3.16rc6"
+CVE_STATUS[CVE-2023-52700] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-5045] =3D "fixed-version: Fixed from version 3.16rc7"
+CVE_STATUS[CVE-2023-52701] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-5077] =3D "fixed-version: Fixed from version 3.16"
+CVE_STATUS[CVE-2023-52702] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-5206] =3D "fixed-version: Fixed from version 3.17rc1"
+CVE_STATUS[CVE-2023-52703] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-5207] =3D "fixed-version: Fixed from version 3.17rc1"
+CVE_STATUS[CVE-2023-52704] =3D "fixed-version: Fixed from version 6.2"
=20
-# Skipping CVE-2014-5332, no affected_versions
+CVE_STATUS[CVE-2023-52705] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-5471] =3D "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52706] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-5472] =3D "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52707] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-6410] =3D "fixed-version: Fixed from version 3.17rc5"
+CVE_STATUS[CVE-2023-52708] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-6416] =3D "fixed-version: Fixed from version 3.17rc5"
+CVE_STATUS[CVE-2023-52730] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-6417] =3D "fixed-version: Fixed from version 3.17rc5"
+CVE_STATUS[CVE-2023-52731] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-6418] =3D "fixed-version: Fixed from version 3.17rc5"
+CVE_STATUS[CVE-2023-52732] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-7145] =3D "fixed-version: Fixed from version 3.17rc2"
+CVE_STATUS[CVE-2023-52733] =3D "fixed-version: Fixed from version 6.2"
=20
-# Skipping CVE-2014-7207, no affected_versions
+CVE_STATUS[CVE-2023-52735] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-7283] =3D "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52736] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-7284] =3D "fixed-version: Fixed from version 3.15rc7"
+CVE_STATUS[CVE-2023-52737] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-7822] =3D "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52738] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-7825] =3D "fixed-version: Fixed from version 3.18rc3"
+CVE_STATUS[CVE-2023-52739] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-7826] =3D "fixed-version: Fixed from version 3.18rc3"
+CVE_STATUS[CVE-2023-52740] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-7841] =3D "fixed-version: Fixed from version 3.18rc5"
+CVE_STATUS[CVE-2023-52741] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-7842] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52742] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-7843] =3D "fixed-version: Fixed from version 3.18rc5"
+CVE_STATUS[CVE-2023-52743] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-7970] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52744] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-7975] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52745] =3D "fixed-version: Fixed from version 5.4.232"
=20
-CVE_STATUS[CVE-2014-8086] =3D "fixed-version: Fixed from version 3.18rc3"
+CVE_STATUS[CVE-2023-52746] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-8133] =3D "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52747] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2014-8134] =3D "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52748] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8159] =3D "fixed-version: Fixed from version 4.0rc7"
+CVE_STATUS[CVE-2023-52749] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8160] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52750] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8171] =3D "fixed-version: Fixed from version 3.12rc1"
+CVE_STATUS[CVE-2023-52751] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8172] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52752] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8173] =3D "fixed-version: Fixed from version 3.13rc5"
+CVE_STATUS[CVE-2023-52753] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-8181, no affected_versions
+CVE_STATUS[CVE-2023-52754] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8369] =3D "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52755] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8480] =3D "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52757] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8481] =3D "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52760] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8559] =3D "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52761] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8709] =3D "fixed-version: Fixed from version 3.14rc3"
+CVE_STATUS[CVE-2023-52762] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8884] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2023-52763] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-8989] =3D "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52764] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9090] =3D "fixed-version: Fixed from version 3.18rc6"
+CVE_STATUS[CVE-2023-52765] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9322] =3D "fixed-version: Fixed from version 3.18rc6"
+CVE_STATUS[CVE-2023-52766] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9419] =3D "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52767] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9420] =3D "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52768] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9428] =3D "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52769] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9529] =3D "fixed-version: Fixed from version 3.19rc4"
+CVE_STATUS[CVE-2023-52770] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9584] =3D "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52771] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9585] =3D "fixed-version: Fixed from version 3.19rc4"
+CVE_STATUS[CVE-2023-52772] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9644] =3D "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52773] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9683] =3D "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52774] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9710] =3D "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52775] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9715] =3D "fixed-version: Fixed from version 3.15rc1"
+CVE_STATUS[CVE-2023-52776] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9717] =3D "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52777] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9728] =3D "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52778] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9729] =3D "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52779] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9730] =3D "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52780] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9731] =3D "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2023-52781] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9777, no affected_versions
+CVE_STATUS[CVE-2023-52782] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9778, no affected_versions
+CVE_STATUS[CVE-2023-52783] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9779, no affected_versions
+CVE_STATUS[CVE-2023-52784] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9780, no affected_versions
+CVE_STATUS[CVE-2023-52785] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9781, no affected_versions
+CVE_STATUS[CVE-2023-52786] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9782, no affected_versions
+CVE_STATUS[CVE-2023-52787] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9783, no affected_versions
+CVE_STATUS[CVE-2023-52788] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9784, no affected_versions
+CVE_STATUS[CVE-2023-52789] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9785, no affected_versions
+CVE_STATUS[CVE-2023-52790] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9786, no affected_versions
+CVE_STATUS[CVE-2023-52791] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9787, no affected_versions
+CVE_STATUS[CVE-2023-52792] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9788, no affected_versions
+CVE_STATUS[CVE-2023-52794] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9789, no affected_versions
+CVE_STATUS[CVE-2023-52795] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9803] =3D "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52796] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9863, no affected_versions
+CVE_STATUS[CVE-2023-52797] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9864, no affected_versions
+CVE_STATUS[CVE-2023-52798] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9865, no affected_versions
+CVE_STATUS[CVE-2023-52799] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9866, no affected_versions
+CVE_STATUS[CVE-2023-52800] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9867, no affected_versions
+CVE_STATUS[CVE-2023-52801] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9868, no affected_versions
+CVE_STATUS[CVE-2023-52803] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9869, no affected_versions
+CVE_STATUS[CVE-2023-52804] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9870] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52805] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9871, no affected_versions
+CVE_STATUS[CVE-2023-52806] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9872, no affected_versions
+CVE_STATUS[CVE-2023-52807] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9873, no affected_versions
+CVE_STATUS[CVE-2023-52808] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9874, no affected_versions
+CVE_STATUS[CVE-2023-52809] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9875, no affected_versions
+CVE_STATUS[CVE-2023-52810] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9876, no affected_versions
+CVE_STATUS[CVE-2023-52811] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9877, no affected_versions
+CVE_STATUS[CVE-2023-52812] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9878, no affected_versions
+CVE_STATUS[CVE-2023-52813] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9879, no affected_versions
+CVE_STATUS[CVE-2023-52814] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9880, no affected_versions
+CVE_STATUS[CVE-2023-52815] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9881, no affected_versions
+CVE_STATUS[CVE-2023-52816] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9882, no affected_versions
+CVE_STATUS[CVE-2023-52817] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9883, no affected_versions
+CVE_STATUS[CVE-2023-52818] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9884, no affected_versions
+CVE_STATUS[CVE-2023-52819] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9885, no affected_versions
+CVE_STATUS[CVE-2023-52821] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9886, no affected_versions
+CVE_STATUS[CVE-2023-52825] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9887, no affected_versions
+CVE_STATUS[CVE-2023-52826] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9888] =3D "fixed-version: Fixed from version 3.13rc1"
+CVE_STATUS[CVE-2023-52827] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9889, no affected_versions
+CVE_STATUS[CVE-2023-52828] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9890, no affected_versions
+CVE_STATUS[CVE-2023-52829] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9891, no affected_versions
+CVE_STATUS[CVE-2023-52831] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9892, no affected_versions
+CVE_STATUS[CVE-2023-52832] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9893, no affected_versions
+CVE_STATUS[CVE-2023-52833] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9894, no affected_versions
+CVE_STATUS[CVE-2023-52834] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9895] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2023-52835] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9896, no affected_versions
+CVE_STATUS[CVE-2023-52836] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9897, no affected_versions
+CVE_STATUS[CVE-2023-52837] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9898, no affected_versions
+CVE_STATUS[CVE-2023-52838] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9899, no affected_versions
+CVE_STATUS[CVE-2023-52839] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2014-9900, no affected_versions
+CVE_STATUS[CVE-2023-52840] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9903] =3D "fixed-version: Fixed from version 3.14rc4"
+CVE_STATUS[CVE-2023-52841] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9904] =3D "fixed-version: Fixed from version 3.17rc1"
+CVE_STATUS[CVE-2023-52842] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9914] =3D "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52843] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9922] =3D "fixed-version: Fixed from version 3.18rc2"
+CVE_STATUS[CVE-2023-52844] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2014-9940] =3D "fixed-version: Fixed from version 3.19rc1"
+CVE_STATUS[CVE-2023-52845] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-0239] =3D "fixed-version: Fixed from version 3.19rc6"
+CVE_STATUS[CVE-2023-52846] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-0274] =3D "fixed-version: Fixed from version 3.15rc5"
+CVE_STATUS[CVE-2023-52847] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-0275] =3D "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52848] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2015-0777, no affected_versions
+CVE_STATUS[CVE-2023-52849] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2015-1328, no affected_versions
+CVE_STATUS[CVE-2023-52850] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-1333] =3D "fixed-version: Fixed from version 4.2rc5"
+CVE_STATUS[CVE-2023-52851] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-1339] =3D "fixed-version: Fixed from version 4.4rc5"
+CVE_STATUS[CVE-2023-52852] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-1350] =3D "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2023-52853] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-1420] =3D "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52854] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-1421] =3D "fixed-version: Fixed from version 3.19rc7"
+CVE_STATUS[CVE-2023-52855] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-1465] =3D "fixed-version: Fixed from version 3.19rc7"
+CVE_STATUS[CVE-2023-52856] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-1573] =3D "fixed-version: Fixed from version 3.19rc5"
+CVE_STATUS[CVE-2023-52857] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-1593] =3D "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2023-52858] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-1805] =3D "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2023-52859] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-2041] =3D "fixed-version: Fixed from version 3.19rc7"
+CVE_STATUS[CVE-2023-52860] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-2042] =3D "fixed-version: Fixed from version 3.19"
+CVE_STATUS[CVE-2023-52861] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-2150] =3D "fixed-version: Fixed from version 4.0rc4"
+CVE_STATUS[CVE-2023-52862] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-2666] =3D "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2023-52863] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-2672] =3D "fixed-version: Fixed from version 4.0rc3"
+CVE_STATUS[CVE-2023-52864] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-2686] =3D "fixed-version: Fixed from version 4.0rc6"
+CVE_STATUS[CVE-2023-52865] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-2830] =3D "fixed-version: Fixed from version 4.0rc3"
+CVE_STATUS[CVE-2023-52866] =3D "fixed-version: Fixed from version 6.7"
=20
-# CVE-2015-2877 has no known resolution
+CVE_STATUS[CVE-2023-52867] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-2922] =3D "fixed-version: Fixed from version 4.0rc7"
+CVE_STATUS[CVE-2023-52868] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-2925] =3D "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2023-52869] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-3212] =3D "fixed-version: Fixed from version 4.2rc1"
+CVE_STATUS[CVE-2023-52870] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-3214] =3D "fixed-version: Fixed from version 2.6.33rc8=
"
+CVE_STATUS[CVE-2023-52871] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-3288] =3D "fixed-version: Fixed from version 4.2rc2"
+CVE_STATUS[CVE-2023-52872] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-3290] =3D "fixed-version: Fixed from version 4.2rc3"
+CVE_STATUS[CVE-2023-52873] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-3291] =3D "fixed-version: Fixed from version 4.2rc3"
+CVE_STATUS[CVE-2023-52874] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-3331] =3D "fixed-version: Fixed from version 4.0rc5"
+CVE_STATUS[CVE-2023-52875] =3D "fixed-version: Fixed from version 6.7"
=20
-# Skipping CVE-2015-3332, no affected_versions
+CVE_STATUS[CVE-2023-52876] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-3339] =3D "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52877] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-3636] =3D "fixed-version: Fixed from version 4.1rc2"
+CVE_STATUS[CVE-2023-52878] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-4001] =3D "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52879] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-4002] =3D "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52880] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2015-4003] =3D "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52881] =3D "fixed-version: Fixed from version 6.7"
=20
-CVE_STATUS[CVE-2015-4004] =3D "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2023-52882] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2015-4036] =3D "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2023-52883] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2015-4167] =3D "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2023-52884] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2015-4170] =3D "fixed-version: Fixed from version 3.13rc5"
+CVE_STATUS[CVE-2023-52885] =3D "fixed-version: Fixed from version 6.5"
=20
-CVE_STATUS[CVE-2015-4176] =3D "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52886] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2015-4177] =3D "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52887] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2015-4178] =3D "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52888] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2015-4692] =3D "fixed-version: Fixed from version 4.2rc1"
+CVE_STATUS[CVE-2023-52889] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2015-4700] =3D "fixed-version: Fixed from version 4.1rc6"
+CVE_STATUS[CVE-2023-52893] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-5156] =3D "fixed-version: Fixed from version 4.2rc7"
+CVE_STATUS[CVE-2023-52894] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-5157] =3D "fixed-version: Fixed from version 4.2rc3"
+CVE_STATUS[CVE-2023-52895] =3D "fixed-version: Fixed from version 6.1.8"
=20
-CVE_STATUS[CVE-2015-5257] =3D "fixed-version: Fixed from version 4.3rc3"
+CVE_STATUS[CVE-2023-52896] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-5283] =3D "fixed-version: Fixed from version 4.3rc3"
+CVE_STATUS[CVE-2023-52897] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-5307] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2023-52898] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-5327] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2023-52899] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-5364] =3D "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52900] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-5366] =3D "fixed-version: Fixed from version 4.1rc7"
+CVE_STATUS[CVE-2023-52901] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-5697] =3D "fixed-version: Fixed from version 4.2rc6"
+CVE_STATUS[CVE-2023-52902] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-5706] =3D "fixed-version: Fixed from version 4.1rc3"
+CVE_STATUS[CVE-2023-52903] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-5707] =3D "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52904] =3D "fixed-version: Fixed from version 5.15.168=
"
=20
-CVE_STATUS[CVE-2015-6252] =3D "fixed-version: Fixed from version 4.2rc5"
+CVE_STATUS[CVE-2023-52905] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-6526] =3D "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2023-52906] =3D "fixed-version: Fixed from version 6.2"
=20
-# CVE-2015-6619 has no known resolution
+CVE_STATUS[CVE-2023-52907] =3D "fixed-version: Fixed from version 6.2"
=20
-# CVE-2015-6646 has no known resolution
+CVE_STATUS[CVE-2023-52908] =3D "fixed-version: Fixed from version 6.1.7"
=20
-CVE_STATUS[CVE-2015-6937] =3D "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2023-52909] =3D "fixed-version: Fixed from version 6.2"
=20
-# Skipping CVE-2015-7312, no affected_versions
+CVE_STATUS[CVE-2023-52910] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-7509] =3D "fixed-version: Fixed from version 3.7rc1"
+CVE_STATUS[CVE-2023-52911] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-7513] =3D "fixed-version: Fixed from version 4.4rc7"
+CVE_STATUS[CVE-2023-52912] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-7515] =3D "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2023-52913] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2015-7550] =3D "fixed-version: Fixed from version 4.4rc8"
+CVE_STATUS[CVE-2023-52914] =3D "fixed-version: Fixed from version 6.2"
=20
-# Skipping CVE-2015-7553, no affected_versions
+CVE_STATUS[CVE-2023-52915] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2015-7566] =3D "fixed-version: Fixed from version 4.5rc2"
+CVE_STATUS[CVE-2023-52916] =3D "fixed-version: Fixed from version 6.6"
=20
-CVE_STATUS[CVE-2015-7613] =3D "fixed-version: Fixed from version 4.3rc4"
+CVE_STATUS[CVE-2023-52917] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2015-7799] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2023-52918] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2015-7833] =3D "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2023-52919] =3D "fixed-version: Fixed from version 6.6"
=20
-# Skipping CVE-2015-7837, no affected_versions
+CVE_STATUS[CVE-2023-52920] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-7872] =3D "fixed-version: Fixed from version 4.3rc7"
+CVE_STATUS[CVE-2023-52921] =3D "fixed-version: Fixed from version 6.5"
=20
-CVE_STATUS[CVE-2015-7884] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2023-52922] =3D "fixed-version: Fixed from version 6.5"
=20
-CVE_STATUS[CVE-2015-7885] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2023-52923] =3D "fixed-version: Fixed from version 6.5"
=20
-CVE_STATUS[CVE-2015-7990] =3D "fixed-version: Fixed from version 4.4rc4"
+CVE_STATUS[CVE-2023-52924] =3D "fixed-version: Fixed from version 6.5"
=20
-# Skipping CVE-2015-8019, no affected_versions
+CVE_STATUS[CVE-2023-52925] =3D "fixed-version: Fixed from version 6.4.12"
=20
-CVE_STATUS[CVE-2015-8104] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26581] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8215] =3D "fixed-version: Fixed from version 4.0rc3"
+CVE_STATUS[CVE-2024-26582] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8324] =3D "fixed-version: Fixed from version 2.6.34rc1=
"
+CVE_STATUS[CVE-2024-26583] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8374] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26584] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8539] =3D "fixed-version: Fixed from version 4.4rc3"
+CVE_STATUS[CVE-2024-26585] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8543] =3D "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26586] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8550] =3D "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26587] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8551] =3D "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26588] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8552] =3D "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26589] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8553] =3D "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26590] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8569] =3D "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26591] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8575] =3D "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26592] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8660] =3D "fixed-version: Fixed from version 4.4rc4"
+CVE_STATUS[CVE-2024-26593] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8709] =3D "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26594] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8746] =3D "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2024-26595] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8767] =3D "fixed-version: Fixed from version 4.3rc4"
+CVE_STATUS[CVE-2024-26596] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8785] =3D "fixed-version: Fixed from version 4.4rc5"
+CVE_STATUS[CVE-2024-26597] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8787] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26598] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8812] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26599] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8816] =3D "fixed-version: Fixed from version 4.4rc6"
+CVE_STATUS[CVE-2024-26600] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8830] =3D "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2024-26601] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8839] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26602] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8844] =3D "fixed-version: Fixed from version 4.4rc3"
+CVE_STATUS[CVE-2024-26603] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8845] =3D "fixed-version: Fixed from version 4.4rc3"
+CVE_STATUS[CVE-2024-26604] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2015-8937, no affected_versions
+CVE_STATUS[CVE-2024-26605] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2015-8938, no affected_versions
+CVE_STATUS[CVE-2024-26606] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2015-8939, no affected_versions
+CVE_STATUS[CVE-2024-26607] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2015-8940, no affected_versions
+CVE_STATUS[CVE-2024-26608] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2015-8941, no affected_versions
+CVE_STATUS[CVE-2024-26610] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2015-8942, no affected_versions
+CVE_STATUS[CVE-2024-26611] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2015-8943, no affected_versions
+CVE_STATUS[CVE-2024-26612] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2015-8944, no affected_versions
+CVE_STATUS[CVE-2024-26614] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8950] =3D "fixed-version: Fixed from version 4.1rc2"
+CVE_STATUS[CVE-2024-26615] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8952] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26616] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8953] =3D "fixed-version: Fixed from version 4.3"
+CVE_STATUS[CVE-2024-26617] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8955] =3D "fixed-version: Fixed from version 4.1rc1"
+CVE_STATUS[CVE-2024-26618] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8956] =3D "fixed-version: Fixed from version 4.2rc1"
+CVE_STATUS[CVE-2024-26619] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8961] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26620] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8962] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26621] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8963] =3D "fixed-version: Fixed from version 4.4"
+CVE_STATUS[CVE-2024-26622] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8964] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26623] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8966] =3D "fixed-version: Fixed from version 4.4rc8"
+CVE_STATUS[CVE-2024-26625] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-8967] =3D "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2024-26626] =3D "fixed-version: Fixed from version 6.1.77"
=20
-CVE_STATUS[CVE-2015-8970] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26627] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-9004] =3D "fixed-version: Fixed from version 3.19rc7"
+CVE_STATUS[CVE-2024-26629] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-9016] =3D "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2024-26630] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2015-9289] =3D "fixed-version: Fixed from version 4.2rc1"
+CVE_STATUS[CVE-2024-26631] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-0617] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26632] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-0723] =3D "fixed-version: Fixed from version 4.5rc2"
+CVE_STATUS[CVE-2024-26633] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-0728] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26634] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-0758] =3D "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26635] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-0774, no affected_versions
+CVE_STATUS[CVE-2024-26636] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-0821] =3D "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2024-26637] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-0823] =3D "fixed-version: Fixed from version 4.0rc5"
+CVE_STATUS[CVE-2024-26638] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10044] =3D "fixed-version: Fixed from version 4.8rc7"
+CVE_STATUS[CVE-2024-26640] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10088] =3D "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26641] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10147] =3D "fixed-version: Fixed from version 4.9"
+CVE_STATUS[CVE-2024-26642] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10150] =3D "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26643] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10153] =3D "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26644] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10154] =3D "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26645] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10200] =3D "fixed-version: Fixed from version 4.9rc7"
+CVE_STATUS[CVE-2024-26646] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10208] =3D "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26647] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10229] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26648] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10318] =3D "fixed-version: Fixed from version 4.8rc6"
+CVE_STATUS[CVE-2024-26649] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10723] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-26651] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2016-10741] =3D "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26652] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-10764] =3D "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26653] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2016-10905] =3D "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-26654] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2016-10906] =3D "fixed-version: Fixed from version 4.5rc6"
+CVE_STATUS[CVE-2024-26655] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2016-10907] =3D "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2024-26656] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2016-1237] =3D "fixed-version: Fixed from version 4.7rc5"
+CVE_STATUS[CVE-2024-26657] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2016-1575] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26658] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-1576] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26659] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-1583] =3D "fixed-version: Fixed from version 4.7rc3"
+CVE_STATUS[CVE-2024-26660] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2053] =3D "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2024-26661] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2069] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26662] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2070] =3D "fixed-version: Fixed from version 4.4"
+CVE_STATUS[CVE-2024-26663] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2085] =3D "fixed-version: Fixed from version 4.5rc4"
+CVE_STATUS[CVE-2024-26664] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2117] =3D "fixed-version: Fixed from version 4.6rc5"
+CVE_STATUS[CVE-2024-26665] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2143] =3D "fixed-version: Fixed from version 4.5"
+CVE_STATUS[CVE-2024-26666] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2184] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26667] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2185] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26668] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2186] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26669] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2187] =3D "fixed-version: Fixed from version 4.6rc5"
+CVE_STATUS[CVE-2024-26670] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2188] =3D "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-26671] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2383] =3D "fixed-version: Fixed from version 4.5rc4"
+CVE_STATUS[CVE-2024-26672] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2384] =3D "fixed-version: Fixed from version 4.5rc4"
+CVE_STATUS[CVE-2024-26673] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2543] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26674] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2544] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26675] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2545] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26676] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2546] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26677] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2547] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26678] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2548] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26679] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2549] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26680] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2550] =3D "fixed-version: Fixed from version 4.5rc4"
+CVE_STATUS[CVE-2024-26681] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2782] =3D "fixed-version: Fixed from version 4.5rc2"
+CVE_STATUS[CVE-2024-26682] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-2847] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26683] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-2853, no affected_versions
+CVE_STATUS[CVE-2024-26684] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-2854, no affected_versions
+CVE_STATUS[CVE-2024-26685] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3044] =3D "fixed-version: Fixed from version 4.5"
+CVE_STATUS[CVE-2024-26686] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3070] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26687] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3134] =3D "fixed-version: Fixed from version 4.6rc2"
+CVE_STATUS[CVE-2024-26688] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3135] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26689] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3136] =3D "fixed-version: Fixed from version 4.6rc3"
+CVE_STATUS[CVE-2024-26690] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3137] =3D "fixed-version: Fixed from version 4.6rc3"
+CVE_STATUS[CVE-2024-26691] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3138] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26692] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3139] =3D "fixed-version: Fixed from version 3.17rc1"
+CVE_STATUS[CVE-2024-26693] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3140] =3D "fixed-version: Fixed from version 4.6rc3"
+CVE_STATUS[CVE-2024-26694] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3156] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26695] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3157] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26696] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3672] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26697] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3689] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26698] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-3695, no affected_versions
+CVE_STATUS[CVE-2024-26699] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-3699, no affected_versions
+CVE_STATUS[CVE-2024-26700] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-3707, no affected_versions
+CVE_STATUS[CVE-2024-26702] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3713] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26703] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2016-3775 has no known resolution
+CVE_STATUS[CVE-2024-26704] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2016-3802 has no known resolution
+CVE_STATUS[CVE-2024-26705] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2016-3803 has no known resolution
+CVE_STATUS[CVE-2024-26706] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3841] =3D "fixed-version: Fixed from version 4.4rc4"
+CVE_STATUS[CVE-2024-26707] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3857] =3D "fixed-version: Fixed from version 4.8rc2"
+CVE_STATUS[CVE-2024-26708] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3951] =3D "fixed-version: Fixed from version 4.5"
+CVE_STATUS[CVE-2024-26709] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-3955] =3D "fixed-version: Fixed from version 4.6rc3"
+# CVE-2024-26710 has no known resolution
=20
-CVE_STATUS[CVE-2016-3961] =3D "fixed-version: Fixed from version 4.6rc5"
+CVE_STATUS[CVE-2024-26711] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4440] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26712] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4470] =3D "fixed-version: Fixed from version 4.7rc4"
+CVE_STATUS[CVE-2024-26714] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4482] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26715] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4485] =3D "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26716] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4486] =3D "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26717] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4557] =3D "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2024-26718] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4558] =3D "fixed-version: Fixed from version 4.6rc7"
+CVE_STATUS[CVE-2024-26719] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4565] =3D "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2024-26721] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4568] =3D "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2024-26722] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4569] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26723] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4578] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26724] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4580] =3D "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26725] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4581] =3D "fixed-version: Fixed from version 4.6rc7"
+CVE_STATUS[CVE-2024-26726] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4794] =3D "fixed-version: Fixed from version 4.7rc4"
+CVE_STATUS[CVE-2024-26727] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4805] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26728] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4913] =3D "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26729] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4951] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26730] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4997] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26731] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-4998] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26732] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-5195] =3D "fixed-version: Fixed from version 4.9rc2"
+CVE_STATUS[CVE-2024-26733] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-5243] =3D "fixed-version: Fixed from version 4.7rc3"
+CVE_STATUS[CVE-2024-26734] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-5244] =3D "fixed-version: Fixed from version 4.7rc3"
+CVE_STATUS[CVE-2024-26735] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-5340, no affected_versions
+CVE_STATUS[CVE-2024-26736] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-5342, no affected_versions
+CVE_STATUS[CVE-2024-26737] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-5343, no affected_versions
+CVE_STATUS[CVE-2024-26738] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-5344, no affected_versions
+CVE_STATUS[CVE-2024-26739] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-5400] =3D "fixed-version: Fixed from version 4.7"
+CVE_STATUS[CVE-2024-26740] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-5412] =3D "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-26741] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-5696] =3D "fixed-version: Fixed from version 4.7"
+CVE_STATUS[CVE-2024-26742] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-5728] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26743] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-5828] =3D "fixed-version: Fixed from version 4.7rc6"
+CVE_STATUS[CVE-2024-26744] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-5829] =3D "fixed-version: Fixed from version 4.7rc5"
+CVE_STATUS[CVE-2024-26745] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2016-5870 has no known resolution
+CVE_STATUS[CVE-2024-26746] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6130] =3D "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2024-26747] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6136] =3D "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-26748] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6156] =3D "fixed-version: Fixed from version 4.7rc7"
+CVE_STATUS[CVE-2024-26749] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6162] =3D "fixed-version: Fixed from version 4.7"
+CVE_STATUS[CVE-2024-26750] =3D "fixed-version: Fixed from version 5.15.151=
"
=20
-CVE_STATUS[CVE-2016-6187] =3D "fixed-version: Fixed from version 4.7rc7"
+CVE_STATUS[CVE-2024-26751] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6197] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26752] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6198] =3D "fixed-version: Fixed from version 4.6"
+CVE_STATUS[CVE-2024-26753] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6213] =3D "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2024-26754] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6327] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26755] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6480] =3D "fixed-version: Fixed from version 4.8rc3"
+CVE_STATUS[CVE-2024-26756] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6516] =3D "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-26757] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-6753, no affected_versions
+CVE_STATUS[CVE-2024-26758] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6786] =3D "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2024-26759] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6787] =3D "fixed-version: Fixed from version 4.0rc1"
+CVE_STATUS[CVE-2024-26760] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-6828] =3D "fixed-version: Fixed from version 4.8rc5"
+CVE_STATUS[CVE-2024-26761] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7039] =3D "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26762] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7042] =3D "fixed-version: Fixed from version 4.9rc3"
+CVE_STATUS[CVE-2024-26763] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7097] =3D "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2024-26764] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7117] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26765] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-7118, no affected_versions
+CVE_STATUS[CVE-2024-26766] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7425] =3D "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2024-26767] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7910] =3D "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-26768] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7911] =3D "fixed-version: Fixed from version 4.7rc7"
+CVE_STATUS[CVE-2024-26769] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7912] =3D "fixed-version: Fixed from version 4.6rc5"
+CVE_STATUS[CVE-2024-26770] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7913] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26771] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7914] =3D "fixed-version: Fixed from version 4.6rc4"
+CVE_STATUS[CVE-2024-26772] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7915] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26773] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7916] =3D "fixed-version: Fixed from version 4.6rc7"
+CVE_STATUS[CVE-2024-26774] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-7917] =3D "fixed-version: Fixed from version 4.5rc6"
+CVE_STATUS[CVE-2024-26775] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-8399] =3D "fixed-version: Fixed from version 4.9"
+CVE_STATUS[CVE-2024-26776] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-8401, no affected_versions
+CVE_STATUS[CVE-2024-26777] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-8402, no affected_versions
+CVE_STATUS[CVE-2024-26778] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-8403, no affected_versions
+CVE_STATUS[CVE-2024-26779] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-8404, no affected_versions
+CVE_STATUS[CVE-2024-26780] =3D "fixed-version: Fixed from version 6.1.81"
=20
-CVE_STATUS[CVE-2016-8405] =3D "fixed-version: Fixed from version 4.10rc6"
+CVE_STATUS[CVE-2024-26781] =3D "fixed-version: Fixed from version 5.10.212=
"
=20
-# Skipping CVE-2016-8406, no affected_versions
+CVE_STATUS[CVE-2024-26782] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-8407, no affected_versions
+CVE_STATUS[CVE-2024-26783] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-8630] =3D "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26784] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-8632] =3D "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26785] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-8633] =3D "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26786] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-8636] =3D "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-26787] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-8645] =3D "fixed-version: Fixed from version 4.9rc6"
+CVE_STATUS[CVE-2024-26788] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-8646] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-26789] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-8650] =3D "fixed-version: Fixed from version 4.9rc7"
+CVE_STATUS[CVE-2024-26790] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-8655] =3D "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26791] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-8658] =3D "fixed-version: Fixed from version 4.8rc7"
+CVE_STATUS[CVE-2024-26792] =3D "fixed-version: Fixed from version 6.1.81"
=20
-# CVE-2016-8660 has no known resolution
+CVE_STATUS[CVE-2024-26793] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-8666] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26794] =3D "fixed-version: Fixed from version 6.6.21"
=20
-CVE_STATUS[CVE-2016-9083] =3D "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26795] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9084] =3D "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26796] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9120] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26797] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9178] =3D "fixed-version: Fixed from version 4.8rc7"
+CVE_STATUS[CVE-2024-26798] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9191] =3D "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-26799] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9313] =3D "fixed-version: Fixed from version 4.9rc3"
+CVE_STATUS[CVE-2024-26800] =3D "fixed-version: Fixed from version 6.6.21"
=20
-CVE_STATUS[CVE-2016-9555] =3D "fixed-version: Fixed from version 4.9rc4"
+CVE_STATUS[CVE-2024-26801] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9576] =3D "fixed-version: Fixed from version 4.9"
+CVE_STATUS[CVE-2024-26802] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9588] =3D "fixed-version: Fixed from version 4.10rc1"
+CVE_STATUS[CVE-2024-26803] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9604] =3D "fixed-version: Fixed from version 4.11rc8"
+CVE_STATUS[CVE-2024-26804] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2016-9644, no affected_versions
+CVE_STATUS[CVE-2024-26805] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9685] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-26806] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9754] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26807] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9755] =3D "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26808] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2016-9756] =3D "fixed-version: Fixed from version 4.9rc7"
+CVE_STATUS[CVE-2024-26809] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2016-9777] =3D "fixed-version: Fixed from version 4.9rc7"
+CVE_STATUS[CVE-2024-26810] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2016-9793] =3D "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26811] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2016-9794] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26812] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2016-9806] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26813] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2016-9919] =3D "fixed-version: Fixed from version 4.9rc8"
+CVE_STATUS[CVE-2024-26814] =3D "fixed-version: Fixed from version 6.9"
=20
-# Skipping CVE-2017-0403, no affected_versions
+CVE_STATUS[CVE-2024-26815] =3D "fixed-version: Fixed from version 6.9"
=20
-# Skipping CVE-2017-0404, no affected_versions
+CVE_STATUS[CVE-2024-26816] =3D "fixed-version: Fixed from version 6.9"
=20
-# Skipping CVE-2017-0426, no affected_versions
+CVE_STATUS[CVE-2024-26817] =3D "fixed-version: Fixed from version 6.9"
=20
-# Skipping CVE-2017-0427, no affected_versions
+CVE_STATUS[CVE-2024-26818] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2017-0507 has no known resolution
+CVE_STATUS[CVE-2024-26820] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2017-0508 has no known resolution
+CVE_STATUS[CVE-2024-26822] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2017-0510, no affected_versions
+CVE_STATUS[CVE-2024-26823] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2017-0528, no affected_versions
+CVE_STATUS[CVE-2024-26824] =3D "fixed-version: Fixed from version 6.8"
=20
-# Skipping CVE-2017-0537, no affected_versions
+CVE_STATUS[CVE-2024-26825] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2017-0564 has no known resolution
+CVE_STATUS[CVE-2024-26826] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-0605] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26828] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-0627] =3D "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26829] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2017-0630 has no known resolution
+CVE_STATUS[CVE-2024-26830] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2017-0749 has no known resolution
+CVE_STATUS[CVE-2024-26831] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-0750] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26832] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-0786] =3D "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26833] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-0861] =3D "fixed-version: Fixed from version 4.15rc3"
+CVE_STATUS[CVE-2024-26834] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000] =3D "fixed-version: Fixed from version 4.13rc5"
+CVE_STATUS[CVE-2024-26835] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000111] =3D "fixed-version: Fixed from version 4.13rc=
5"
+CVE_STATUS[CVE-2024-26836] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000112] =3D "fixed-version: Fixed from version 4.13rc=
5"
+CVE_STATUS[CVE-2024-26837] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000251] =3D "fixed-version: Fixed from version 4.14rc=
1"
+CVE_STATUS[CVE-2024-26838] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000252] =3D "fixed-version: Fixed from version 4.14rc=
1"
+CVE_STATUS[CVE-2024-26839] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000253] =3D "fixed-version: Fixed from version 4.1rc1=
"
+CVE_STATUS[CVE-2024-26840] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000255] =3D "fixed-version: Fixed from version 4.14rc=
5"
+CVE_STATUS[CVE-2024-26841] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000363] =3D "fixed-version: Fixed from version 4.12rc=
2"
+CVE_STATUS[CVE-2024-26842] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000364] =3D "fixed-version: Fixed from version 4.12rc=
6"
+CVE_STATUS[CVE-2024-26843] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000365] =3D "fixed-version: Fixed from version 4.12rc=
7"
+CVE_STATUS[CVE-2024-26844] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000370] =3D "fixed-version: Fixed from version 4.13rc=
1"
+CVE_STATUS[CVE-2024-26845] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000371] =3D "fixed-version: Fixed from version 4.13rc=
1"
+CVE_STATUS[CVE-2024-26846] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000379] =3D "fixed-version: Fixed from version 4.12rc=
6"
+CVE_STATUS[CVE-2024-26847] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000380] =3D "fixed-version: Fixed from version 4.12rc=
5"
+CVE_STATUS[CVE-2024-26849] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000405] =3D "fixed-version: Fixed from version 4.15rc=
2"
+CVE_STATUS[CVE-2024-26850] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000407] =3D "fixed-version: Fixed from version 4.15rc=
3"
+CVE_STATUS[CVE-2024-26851] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-1000410] =3D "fixed-version: Fixed from version 4.15rc=
8"
+CVE_STATUS[CVE-2024-26852] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-10661] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-26853] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-10662] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26854] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-10663] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26855] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-10810] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26856] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-10911] =3D "fixed-version: Fixed from version 4.12rc7"
+CVE_STATUS[CVE-2024-26857] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-11089] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26858] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-11176] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26859] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-11472] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26860] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-11473] =3D "fixed-version: Fixed from version 4.13rc2"
+CVE_STATUS[CVE-2024-26861] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-11600] =3D "fixed-version: Fixed from version 4.13"
+CVE_STATUS[CVE-2024-26862] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-12134] =3D "fixed-version: Fixed from version 4.13rc6"
+CVE_STATUS[CVE-2024-26863] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-12146] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26864] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-12153] =3D "fixed-version: Fixed from version 4.14rc2"
+CVE_STATUS[CVE-2024-26865] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-12154] =3D "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26866] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-12168] =3D "fixed-version: Fixed from version 4.9rc6"
+CVE_STATUS[CVE-2024-26867] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-12188] =3D "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26868] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-12190] =3D "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26869] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-12192] =3D "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26870] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-12193] =3D "fixed-version: Fixed from version 4.14rc7"
+CVE_STATUS[CVE-2024-26871] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-12762] =3D "fixed-version: Fixed from version 4.13rc4"
+CVE_STATUS[CVE-2024-26872] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-13080] =3D "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26873] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-13166] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-26874] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-13167] =3D "fixed-version: Fixed from version 4.5rc4"
+CVE_STATUS[CVE-2024-26875] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-13168] =3D "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-26876] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-13215] =3D "fixed-version: Fixed from version 4.5rc1"
+CVE_STATUS[CVE-2024-26877] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-13216] =3D "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-26878] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-13220] =3D "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2024-26879] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2017-13221 has no known resolution
+CVE_STATUS[CVE-2024-26880] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2017-13222 has no known resolution
+CVE_STATUS[CVE-2024-26881] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-13305] =3D "fixed-version: Fixed from version 4.12rc5"
+CVE_STATUS[CVE-2024-26882] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-13686] =3D "fixed-version: Fixed from version 4.13rc7"
+CVE_STATUS[CVE-2024-26883] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2017-13693 has no known resolution
+CVE_STATUS[CVE-2024-26884] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2017-13694 has no known resolution
+CVE_STATUS[CVE-2024-26885] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-13695] =3D "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-26886] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-13715] =3D "fixed-version: Fixed from version 4.3rc1"
+CVE_STATUS[CVE-2024-26887] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-14051] =3D "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26888] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-14106] =3D "fixed-version: Fixed from version 4.12rc3"
+CVE_STATUS[CVE-2024-26889] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-14140] =3D "fixed-version: Fixed from version 4.13rc6"
+CVE_STATUS[CVE-2024-26890] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-14156] =3D "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26891] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-14340] =3D "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26892] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-14489] =3D "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26893] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-14497] =3D "fixed-version: Fixed from version 4.13"
+CVE_STATUS[CVE-2024-26894] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-14954] =3D "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26895] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-14991] =3D "fixed-version: Fixed from version 4.14rc2"
+CVE_STATUS[CVE-2024-26896] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-15102] =3D "fixed-version: Fixed from version 4.9rc1"
+CVE_STATUS[CVE-2024-26897] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-15115] =3D "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26898] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-15116] =3D "fixed-version: Fixed from version 4.2rc1"
+CVE_STATUS[CVE-2024-26899] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-15121] =3D "fixed-version: Fixed from version 3.11rc1"
+CVE_STATUS[CVE-2024-26900] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-15126] =3D "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26901] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-15127] =3D "fixed-version: Fixed from version 4.13rc5"
+CVE_STATUS[CVE-2024-26902] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-15128] =3D "fixed-version: Fixed from version 4.14rc8"
+CVE_STATUS[CVE-2024-26903] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-15129] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26906] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-15265] =3D "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26907] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-15274] =3D "fixed-version: Fixed from version 4.12rc5"
+CVE_STATUS[CVE-2024-26909] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-15299] =3D "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26910] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-15306] =3D "fixed-version: Fixed from version 4.14rc7"
+CVE_STATUS[CVE-2024-26911] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-15537] =3D "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26912] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-15649] =3D "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26913] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-15868] =3D "fixed-version: Fixed from version 3.19rc3"
+CVE_STATUS[CVE-2024-26914] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-15951] =3D "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26915] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-16525] =3D "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26916] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-16526] =3D "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26917] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-16527] =3D "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26918] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-16528] =3D "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-26919] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-16529] =3D "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26920] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-16530] =3D "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26921] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16531] =3D "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26922] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16532] =3D "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26923] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16533] =3D "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26924] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16534] =3D "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-26925] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16535] =3D "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26926] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16536] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26927] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16537] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26928] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16538] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-26930] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16643] =3D "fixed-version: Fixed from version 4.14rc7"
+CVE_STATUS[CVE-2024-26931] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16644] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-26932] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16645] =3D "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-26933] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16646] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26934] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16647] =3D "fixed-version: Fixed from version 4.14"
+CVE_STATUS[CVE-2024-26935] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16648] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26936] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16649] =3D "fixed-version: Fixed from version 4.14"
+CVE_STATUS[CVE-2024-26937] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16650] =3D "fixed-version: Fixed from version 4.14"
+CVE_STATUS[CVE-2024-26938] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16911] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26939] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16912] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26940] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16913] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26941] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16914] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26942] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16939] =3D "fixed-version: Fixed from version 4.14rc7"
+CVE_STATUS[CVE-2024-26943] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16994] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26944] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16995] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26945] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-16996] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26946] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17052] =3D "fixed-version: Fixed from version 4.13rc7"
+CVE_STATUS[CVE-2024-26947] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17053] =3D "fixed-version: Fixed from version 4.13rc7"
+CVE_STATUS[CVE-2024-26948] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17448] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26949] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17449] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26950] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17450] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26951] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17558] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26952] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17712] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26953] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17741] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26954] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17805] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26955] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17806] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26956] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17807] =3D "fixed-version: Fixed from version 4.15rc3"
+CVE_STATUS[CVE-2024-26957] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17852] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26958] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17853] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26959] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17854] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26960] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17855] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26961] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17856] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26962] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17857] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26963] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17862] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26964] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17863] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26965] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17864] =3D "fixed-version: Fixed from version 4.15rc5"
+CVE_STATUS[CVE-2024-26966] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-17975] =3D "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-26967] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18017] =3D "fixed-version: Fixed from version 4.11rc7"
+CVE_STATUS[CVE-2024-26968] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18075] =3D "fixed-version: Fixed from version 4.15rc7"
+CVE_STATUS[CVE-2024-26969] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18079] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26970] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2017-18169 has no known resolution
+CVE_STATUS[CVE-2024-26971] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18174] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-26973] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18193] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26974] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18200] =3D "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-26975] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18202] =3D "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-26976] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18203] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26977] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18204] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26978] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18208] =3D "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-26980] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18216] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26981] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18218] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26982] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18221] =3D "fixed-version: Fixed from version 4.12rc4"
+CVE_STATUS[CVE-2024-26983] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18222] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26984] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18224] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-26985] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18232] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-26986] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18241] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26987] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18249] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-26988] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18255] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-26989] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18257] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-26990] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18261] =3D "fixed-version: Fixed from version 4.13rc6"
+CVE_STATUS[CVE-2024-26991] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18270] =3D "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26992] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18344] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-26993] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18360] =3D "fixed-version: Fixed from version 4.12rc2"
+CVE_STATUS[CVE-2024-26994] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18379] =3D "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-26995] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18509] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-26996] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18549] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26997] =3D "fixed-version: Fixed from version 4.19.313=
"
=20
-CVE_STATUS[CVE-2017-18550] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-26998] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18551] =3D "fixed-version: Fixed from version 4.15rc9"
+CVE_STATUS[CVE-2024-26999] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18552] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27000] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-18595] =3D "fixed-version: Fixed from version 4.15rc6"
+CVE_STATUS[CVE-2024-27001] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-2583] =3D "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27002] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-2584] =3D "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27003] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-2596] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27004] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-2618] =3D "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27005] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-2634] =3D "fixed-version: Fixed from version 2.6.25rc1=
"
+CVE_STATUS[CVE-2024-27006] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-2636] =3D "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-27007] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-2647] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2024-27008] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-2671] =3D "fixed-version: Fixed from version 4.11rc6"
+CVE_STATUS[CVE-2024-27009] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5123] =3D "fixed-version: Fixed from version 4.14rc5"
+CVE_STATUS[CVE-2024-27010] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5546] =3D "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27011] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5547] =3D "fixed-version: Fixed from version 4.10rc5"
+CVE_STATUS[CVE-2024-27012] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5548] =3D "fixed-version: Fixed from version 4.10rc5"
+CVE_STATUS[CVE-2024-27013] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5549] =3D "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27014] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5550] =3D "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27015] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5551] =3D "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27016] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5576] =3D "fixed-version: Fixed from version 4.10rc6"
+CVE_STATUS[CVE-2024-27017] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5577] =3D "fixed-version: Fixed from version 4.10rc6"
+CVE_STATUS[CVE-2024-27018] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5669] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27019] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5715] =3D "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-27020] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5753] =3D "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-27021] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5754] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-27022] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5897] =3D "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27023] =3D "fixed-version: Fixed from version 6.1.80"
=20
-CVE_STATUS[CVE-2017-5967] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27024] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-5970] =3D "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27025] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5972] =3D "fixed-version: Fixed from version 4.4rc1"
+CVE_STATUS[CVE-2024-27026] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-5986] =3D "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27027] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-6001] =3D "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27028] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-6074] =3D "fixed-version: Fixed from version 4.10"
+CVE_STATUS[CVE-2024-27029] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-6214] =3D "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27030] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-6345] =3D "fixed-version: Fixed from version 4.10"
+CVE_STATUS[CVE-2024-27031] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-6346] =3D "fixed-version: Fixed from version 4.10"
+CVE_STATUS[CVE-2024-27032] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-6347] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27033] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-6348] =3D "fixed-version: Fixed from version 4.10"
+CVE_STATUS[CVE-2024-27034] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-6353] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27035] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-6874] =3D "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-27036] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-6951] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2024-27037] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7184] =3D "fixed-version: Fixed from version 4.11rc5"
+CVE_STATUS[CVE-2024-27038] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7187] =3D "fixed-version: Fixed from version 4.11rc5"
+CVE_STATUS[CVE-2024-27039] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7261] =3D "fixed-version: Fixed from version 4.11rc6"
+CVE_STATUS[CVE-2024-27040] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7273] =3D "fixed-version: Fixed from version 4.10rc4"
+CVE_STATUS[CVE-2024-27041] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7277] =3D "fixed-version: Fixed from version 4.11rc4"
+CVE_STATUS[CVE-2024-27042] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7294] =3D "fixed-version: Fixed from version 4.11rc6"
+CVE_STATUS[CVE-2024-27043] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7308] =3D "fixed-version: Fixed from version 4.11rc6"
+CVE_STATUS[CVE-2024-27044] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7346] =3D "fixed-version: Fixed from version 4.12rc5"
+CVE_STATUS[CVE-2024-27045] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2017-7369 has no known resolution
+CVE_STATUS[CVE-2024-27046] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7374] =3D "fixed-version: Fixed from version 4.11rc4"
+CVE_STATUS[CVE-2024-27047] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7472] =3D "fixed-version: Fixed from version 4.11rc8"
+CVE_STATUS[CVE-2024-27048] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7477] =3D "fixed-version: Fixed from version 4.11"
+CVE_STATUS[CVE-2024-27049] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7482] =3D "fixed-version: Fixed from version 4.12rc7"
+CVE_STATUS[CVE-2024-27050] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7487] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-27051] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7495] =3D "fixed-version: Fixed from version 4.7rc1"
+CVE_STATUS[CVE-2024-27052] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7518] =3D "fixed-version: Fixed from version 4.12rc7"
+CVE_STATUS[CVE-2024-27053] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7533] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27054] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7541] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27055] =3D "fixed-version: Fixed from version 6.6.25"
=20
-CVE_STATUS[CVE-2017-7542] =3D "fixed-version: Fixed from version 4.13rc2"
+CVE_STATUS[CVE-2024-27056] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-7558] =3D "fixed-version: Fixed from version 4.13"
+CVE_STATUS[CVE-2024-27057] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-7616] =3D "fixed-version: Fixed from version 4.11rc6"
+CVE_STATUS[CVE-2024-27058] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-7618] =3D "fixed-version: Fixed from version 4.11rc8"
+CVE_STATUS[CVE-2024-27059] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-7645] =3D "fixed-version: Fixed from version 4.11"
+CVE_STATUS[CVE-2024-27060] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-7889] =3D "fixed-version: Fixed from version 4.11rc7"
+CVE_STATUS[CVE-2024-27061] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-7895] =3D "fixed-version: Fixed from version 4.11"
+CVE_STATUS[CVE-2024-27062] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-7979] =3D "fixed-version: Fixed from version 4.11rc8"
+CVE_STATUS[CVE-2024-27063] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8061] =3D "fixed-version: Fixed from version 4.11rc4"
+CVE_STATUS[CVE-2024-27064] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8062] =3D "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-27065] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8063] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27066] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8064] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27067] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8065] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27068] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8066] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27069] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8067] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27070] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8068] =3D "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27071] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8069] =3D "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27072] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8070] =3D "fixed-version: Fixed from version 4.10rc8"
+CVE_STATUS[CVE-2024-27073] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8071] =3D "fixed-version: Fixed from version 4.10rc7"
+CVE_STATUS[CVE-2024-27074] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8072] =3D "fixed-version: Fixed from version 4.10rc7"
+CVE_STATUS[CVE-2024-27075] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8106] =3D "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2024-27076] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8240] =3D "fixed-version: Fixed from version 3.19rc6"
+CVE_STATUS[CVE-2024-27077] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2017-8242 has no known resolution
+CVE_STATUS[CVE-2024-27078] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2017-8244 has no known resolution
+CVE_STATUS[CVE-2024-27079] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2017-8245 has no known resolution
+CVE_STATUS[CVE-2024-27080] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2017-8246 has no known resolution
+CVE_STATUS[CVE-2024-27388] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8797] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-27389] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8824] =3D "fixed-version: Fixed from version 4.15rc3"
+CVE_STATUS[CVE-2024-27390] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8831] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27391] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8890] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-27392] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8924] =3D "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-27393] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-8925] =3D "fixed-version: Fixed from version 4.11rc2"
+CVE_STATUS[CVE-2024-27394] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-9059] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-27395] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-9074] =3D "fixed-version: Fixed from version 4.12rc2"
+CVE_STATUS[CVE-2024-27396] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-9075] =3D "fixed-version: Fixed from version 4.12rc2"
+CVE_STATUS[CVE-2024-27397] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-9076] =3D "fixed-version: Fixed from version 4.12rc2"
+CVE_STATUS[CVE-2024-27398] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-9077] =3D "fixed-version: Fixed from version 4.12rc2"
+CVE_STATUS[CVE-2024-27399] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-9150] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-27400] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-9211] =3D "fixed-version: Fixed from version 4.12rc3"
+CVE_STATUS[CVE-2024-27401] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2017-9242] =3D "fixed-version: Fixed from version 4.12rc3"
+CVE_STATUS[CVE-2024-27402] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-9605] =3D "fixed-version: Fixed from version 4.12rc5"
+CVE_STATUS[CVE-2024-27403] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-9725] =3D "fixed-version: Fixed from version 4.3rc7"
+CVE_STATUS[CVE-2024-27404] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-9984] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27405] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-9985] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27406] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2017-9986] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-27407] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-1000004] =3D "fixed-version: Fixed from version 4.15rc=
9"
+CVE_STATUS[CVE-2024-27408] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-1000026] =3D "fixed-version: Fixed from version 4.16rc=
1"
+CVE_STATUS[CVE-2024-27409] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-1000028] =3D "fixed-version: Fixed from version 4.15"
+CVE_STATUS[CVE-2024-27410] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-1000199] =3D "fixed-version: Fixed from version 4.16"
+CVE_STATUS[CVE-2024-27411] =3D "fixed-version: Fixed from version 6.7.9"
=20
-CVE_STATUS[CVE-2018-1000200] =3D "fixed-version: Fixed from version 4.17rc=
5"
+CVE_STATUS[CVE-2024-27412] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-1000204] =3D "fixed-version: Fixed from version 4.17rc=
7"
+CVE_STATUS[CVE-2024-27413] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-10021] =3D "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-27414] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-10074] =3D "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-27415] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-10087] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27416] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-10124] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-27417] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-10322] =3D "fixed-version: Fixed from version 4.17rc4"
+CVE_STATUS[CVE-2024-27418] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-10323] =3D "fixed-version: Fixed from version 4.17rc4"
+CVE_STATUS[CVE-2024-27419] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-1065] =3D "fixed-version: Fixed from version 4.16rc3"
+CVE_STATUS[CVE-2024-27431] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-1066] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-27432] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-10675] =3D "fixed-version: Fixed from version 4.13rc6"
+CVE_STATUS[CVE-2024-27433] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-1068] =3D "fixed-version: Fixed from version 4.16rc5"
+CVE_STATUS[CVE-2024-27434] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-10840] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-27435] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-10853] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-27436] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-1087] =3D "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-27437] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2018-10872 has no known resolution
+CVE_STATUS[CVE-2024-31076] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2018-10876] =3D "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-32936] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2018-10877] =3D "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-33619] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2018-10878] =3D "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-33621] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2018-10879] =3D "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-33847] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2018-10880] =3D "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-34027] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2018-10881] =3D "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-34030] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2018-10882] =3D "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-34777] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2018-10883] =3D "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-35247] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2018-10901] =3D "fixed-version: Fixed from version 2.6.36rc=
1"
+CVE_STATUS[CVE-2024-35784] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-10902] =3D "fixed-version: Fixed from version 4.18rc6"
+CVE_STATUS[CVE-2024-35785] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-1091] =3D "fixed-version: Fixed from version 4.14rc2"
+CVE_STATUS[CVE-2024-35786] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-1092] =3D "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35787] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-1093] =3D "fixed-version: Fixed from version 4.17rc1"
+# CVE-2024-35788 has no known resolution
=20
-CVE_STATUS[CVE-2018-10938] =3D "fixed-version: Fixed from version 4.13rc5"
+CVE_STATUS[CVE-2024-35789] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-1094] =3D "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35790] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-10940] =3D "fixed-version: Fixed from version 4.17rc3"
+CVE_STATUS[CVE-2024-35791] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-1095] =3D "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35792] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-1108] =3D "fixed-version: Fixed from version 4.17rc2"
+CVE_STATUS[CVE-2024-35793] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-1118] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35794] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-1120] =3D "fixed-version: Fixed from version 4.17rc6"
+CVE_STATUS[CVE-2024-35795] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2018-1121 has no known resolution
+CVE_STATUS[CVE-2024-35796] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-11232] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-35797] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-1128] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35798] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-1129] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35799] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-1130] =3D "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-35800] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-11412] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35801] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-11506] =3D "fixed-version: Fixed from version 4.17rc7"
+CVE_STATUS[CVE-2024-35803] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-11508] =3D "fixed-version: Fixed from version 4.17rc5"
+CVE_STATUS[CVE-2024-35804] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2018-11987 has no known resolution
+CVE_STATUS[CVE-2024-35805] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-12126] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35806] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-12127] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35807] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-12130] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35808] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-12207] =3D "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-35809] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-12232] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35810] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-12233] =3D "fixed-version: Fixed from version 4.18rc2"
+CVE_STATUS[CVE-2024-35811] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-12633] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35813] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-12714] =3D "fixed-version: Fixed from version 4.18rc2"
+CVE_STATUS[CVE-2024-35814] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-12896] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35815] =3D "fixed-version: Fixed from version 4.19.312=
"
=20
-CVE_STATUS[CVE-2018-12904] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35816] =3D "fixed-version: Fixed from version 6.8"
=20
-# CVE-2018-12928 has no known resolution
+CVE_STATUS[CVE-2024-35817] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2018-12929 has no known resolution
+CVE_STATUS[CVE-2024-35818] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2018-12930 has no known resolution
+CVE_STATUS[CVE-2024-35819] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2018-12931 has no known resolution
+CVE_STATUS[CVE-2024-35821] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-13053] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35822] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-13093] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35823] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-13094] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35824] =3D "fixed-version: Fixed from version 6.1.84"
=20
-CVE_STATUS[CVE-2018-13095] =3D "fixed-version: Fixed from version 4.18rc3"
+CVE_STATUS[CVE-2024-35825] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-13096] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35826] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-13097] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35827] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-13098] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35828] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-13099] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35829] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-13100] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35830] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-13405] =3D "fixed-version: Fixed from version 4.18rc4"
+CVE_STATUS[CVE-2024-35831] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-13406] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35832] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-14609] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35833] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-14610] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35834] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-14611] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35835] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-14612] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35836] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-14613] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35837] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-14614] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35838] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-14615] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35839] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-14616] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35840] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-14617] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35841] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-14619] =3D "fixed-version: Fixed from version 4.15rc4"
+CVE_STATUS[CVE-2024-35842] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2018-14625] =3D "fixed-version: Fixed from version 4.20rc6"
+CVE_STATUS[CVE-2024-35843] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-14633] =3D "fixed-version: Fixed from version 4.19rc6"
+CVE_STATUS[CVE-2024-35844] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-14634] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-35845] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-14641] =3D "fixed-version: Fixed from version 4.19rc4"
+CVE_STATUS[CVE-2024-35846] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-14646] =3D "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-35847] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-14656] =3D "fixed-version: Fixed from version 4.19rc2"
+CVE_STATUS[CVE-2024-35848] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-14678] =3D "fixed-version: Fixed from version 4.18rc8"
+CVE_STATUS[CVE-2024-35849] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-14734] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35850] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-15471] =3D "fixed-version: Fixed from version 4.19rc7"
+CVE_STATUS[CVE-2024-35851] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-15572] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35852] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-15594] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35853] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-16276] =3D "fixed-version: Fixed from version 4.18rc5"
+CVE_STATUS[CVE-2024-35854] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-16597] =3D "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-35855] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-16658] =3D "fixed-version: Fixed from version 4.19rc2"
+CVE_STATUS[CVE-2024-35856] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-16862] =3D "fixed-version: Fixed from version 4.20rc5"
+CVE_STATUS[CVE-2024-35857] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-16871] =3D "fixed-version: Fixed from version 4.20rc3"
+CVE_STATUS[CVE-2024-35858] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-16880] =3D "fixed-version: Fixed from version 5.0rc5"
+CVE_STATUS[CVE-2024-35859] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-16882] =3D "fixed-version: Fixed from version 4.20"
+CVE_STATUS[CVE-2024-35860] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-16884] =3D "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-35861] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2018-16885 has no known resolution
+CVE_STATUS[CVE-2024-35862] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-17182] =3D "fixed-version: Fixed from version 4.19rc4"
+CVE_STATUS[CVE-2024-35863] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-17972] =3D "fixed-version: Fixed from version 4.19rc7"
+CVE_STATUS[CVE-2024-35864] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2018-17977 has no known resolution
+CVE_STATUS[CVE-2024-35865] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-18021] =3D "fixed-version: Fixed from version 4.19rc7"
+CVE_STATUS[CVE-2024-35866] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-18281] =3D "fixed-version: Fixed from version 4.19"
+CVE_STATUS[CVE-2024-35867] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-18386] =3D "fixed-version: Fixed from version 4.15rc6"
+CVE_STATUS[CVE-2024-35868] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-18397] =3D "fixed-version: Fixed from version 4.20rc5"
+CVE_STATUS[CVE-2024-35869] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-18445] =3D "fixed-version: Fixed from version 4.19rc7"
+CVE_STATUS[CVE-2024-35870] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-18559] =3D "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35871] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2018-18653 has no known resolution
+CVE_STATUS[CVE-2024-35872] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-18690] =3D "fixed-version: Fixed from version 4.17rc4"
+CVE_STATUS[CVE-2024-35873] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-18710] =3D "fixed-version: Fixed from version 4.20rc1"
+CVE_STATUS[CVE-2024-35874] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-18955] =3D "fixed-version: Fixed from version 4.20rc2"
+CVE_STATUS[CVE-2024-35875] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-19406] =3D "fixed-version: Fixed from version 4.20rc5"
+CVE_STATUS[CVE-2024-35877] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-19407] =3D "fixed-version: Fixed from version 4.20rc5"
+CVE_STATUS[CVE-2024-35878] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-19824] =3D "fixed-version: Fixed from version 4.20rc6"
+CVE_STATUS[CVE-2024-35879] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-19854] =3D "fixed-version: Fixed from version 4.20rc3"
+CVE_STATUS[CVE-2024-35880] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-19985] =3D "fixed-version: Fixed from version 4.20"
+CVE_STATUS[CVE-2024-35882] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20169] =3D "fixed-version: Fixed from version 4.20rc6"
+CVE_STATUS[CVE-2024-35883] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20449] =3D "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35884] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20509] =3D "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-35885] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20510] =3D "fixed-version: Fixed from version 4.16rc3"
+CVE_STATUS[CVE-2024-35886] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20511] =3D "fixed-version: Fixed from version 4.19rc5"
+CVE_STATUS[CVE-2024-35887] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20669] =3D "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-35888] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20784] =3D "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-35889] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20836] =3D "fixed-version: Fixed from version 4.20rc1"
+CVE_STATUS[CVE-2024-35890] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20854] =3D "fixed-version: Fixed from version 4.20rc1"
+CVE_STATUS[CVE-2024-35891] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20855] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35892] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20856] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35893] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20961] =3D "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35894] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-20976] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35895] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-21008] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-35896] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-25015] =3D "fixed-version: Fixed from version 4.15rc9"
+CVE_STATUS[CVE-2024-35897] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-25020] =3D "fixed-version: Fixed from version 4.17rc7"
+CVE_STATUS[CVE-2024-35898] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2018-3574 has no known resolution
+CVE_STATUS[CVE-2024-35899] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-3620] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35900] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-3639] =3D "fixed-version: Fixed from version 4.17rc7"
+CVE_STATUS[CVE-2024-35901] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-3646] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35902] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-3665] =3D "fixed-version: Fixed from version 3.7rc1"
+CVE_STATUS[CVE-2024-35903] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-3693] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35904] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5332] =3D "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-35905] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5333] =3D "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-35907] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5344] =3D "fixed-version: Fixed from version 4.15rc8"
+CVE_STATUS[CVE-2024-35908] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5390] =3D "fixed-version: Fixed from version 4.18rc7"
+CVE_STATUS[CVE-2024-35909] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5391] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35910] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5703] =3D "fixed-version: Fixed from version 4.16rc5"
+CVE_STATUS[CVE-2024-35911] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5750] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35912] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5803] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35913] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5814] =3D "fixed-version: Fixed from version 4.17rc6"
+CVE_STATUS[CVE-2024-35914] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5848] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35915] =3D "fixed-version: Fixed from version 6.9"
=20
-# Skipping CVE-2018-5856, no affected_versions
+CVE_STATUS[CVE-2024-35916] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5873] =3D "fixed-version: Fixed from version 4.11rc8"
+CVE_STATUS[CVE-2024-35917] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5953] =3D "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35919] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-5995] =3D "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35920] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-6412] =3D "fixed-version: Fixed from version 4.16rc5"
+CVE_STATUS[CVE-2024-35921] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-6554] =3D "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35922] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-6555] =3D "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-35924] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2018-6559 has no known resolution
+CVE_STATUS[CVE-2024-35925] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-6927] =3D "fixed-version: Fixed from version 4.15rc9"
+CVE_STATUS[CVE-2024-35926] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-7191] =3D "fixed-version: Fixed from version 4.14rc6"
+CVE_STATUS[CVE-2024-35927] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-7273] =3D "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35929] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-7480] =3D "fixed-version: Fixed from version 4.11rc1"
+CVE_STATUS[CVE-2024-35930] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-7492] =3D "fixed-version: Fixed from version 4.15rc3"
+CVE_STATUS[CVE-2024-35931] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-7566] =3D "fixed-version: Fixed from version 4.16rc2"
+CVE_STATUS[CVE-2024-35932] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-7740] =3D "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-35933] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-7754] =3D "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-35934] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-7755] =3D "fixed-version: Fixed from version 4.19rc5"
+CVE_STATUS[CVE-2024-35935] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-7757] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35936] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-7995] =3D "fixed-version: Fixed from version 4.16rc5"
+CVE_STATUS[CVE-2024-35937] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-8043] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35938] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-8087] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-35939] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-8781] =3D "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-35940] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-8822] =3D "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-35942] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-8897] =3D "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-35943] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-9363] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-35944] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-9385] =3D "fixed-version: Fixed from version 4.17rc3"
+CVE_STATUS[CVE-2024-35945] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-9415] =3D "fixed-version: Fixed from version 4.17rc3"
+CVE_STATUS[CVE-2024-35946] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-9422] =3D "fixed-version: Fixed from version 4.6rc1"
+CVE_STATUS[CVE-2024-35947] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-9465] =3D "fixed-version: Fixed from version 4.15rc6"
+CVE_STATUS[CVE-2024-35948] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-9516] =3D "fixed-version: Fixed from version 4.18rc5"
+CVE_STATUS[CVE-2024-35949] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-9517] =3D "fixed-version: Fixed from version 4.14rc1"
+CVE_STATUS[CVE-2024-35950] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-9518] =3D "fixed-version: Fixed from version 4.16rc3"
+CVE_STATUS[CVE-2024-35951] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2018-9568] =3D "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-35952] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-0136] =3D "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-35953] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-0145] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35954] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-0146] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35955] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-0147] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35956] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-0148] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35957] =3D "fixed-version: Fixed from version 6.8.7"
=20
-CVE_STATUS[CVE-2019-0149] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35958] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-0154] =3D "fixed-version: Fixed from version 5.4rc8"
+CVE_STATUS[CVE-2024-35959] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-0155] =3D "fixed-version: Fixed from version 5.4rc8"
+CVE_STATUS[CVE-2024-35960] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-10124] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-35961] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-10125] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-35962] =3D "fixed-version: Fixed from version 5.10.216=
"
=20
-CVE_STATUS[CVE-2019-10126] =3D "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-35963] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2019-10140 has no known resolution
+CVE_STATUS[CVE-2024-35964] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-10142] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35965] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-10207] =3D "fixed-version: Fixed from version 5.3rc3"
+CVE_STATUS[CVE-2024-35966] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-10220] =3D "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-35967] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-10638] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35968] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-10639] =3D "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-35969] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11085] =3D "fixed-version: Fixed from version 5.0rc3"
+CVE_STATUS[CVE-2024-35970] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11091] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35971] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11135] =3D "fixed-version: Fixed from version 5.4rc8"
+CVE_STATUS[CVE-2024-35972] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11190] =3D "fixed-version: Fixed from version 4.8rc5"
+CVE_STATUS[CVE-2024-35973] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11191] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-35974] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-1125] =3D "fixed-version: Fixed from version 5.3rc4"
+CVE_STATUS[CVE-2024-35975] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11477] =3D "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-35976] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11478] =3D "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-35977] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11479] =3D "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-35978] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11486] =3D "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-35979] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11487] =3D "fixed-version: Fixed from version 5.1rc5"
+CVE_STATUS[CVE-2024-35980] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11599] =3D "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-35981] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11683] =3D "fixed-version: Fixed from version 5.1"
+CVE_STATUS[CVE-2024-35982] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11810] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-35983] =3D "fixed-version: Fixed from version 5.4.275"
=20
-CVE_STATUS[CVE-2019-11811] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-35984] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11815] =3D "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-35985] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11833] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35986] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-11884] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-35987] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12378] =3D "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-35988] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12379] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35989] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12380] =3D "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-35990] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12381] =3D "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-35991] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12382] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35992] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12454] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35993] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12455] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35994] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2019-12456 has no known resolution
+CVE_STATUS[CVE-2024-35995] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12614] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-35996] =3D "fixed-version: Fixed from version 5.15.158=
"
=20
-CVE_STATUS[CVE-2019-12615] =3D "fixed-version: Fixed from version 5.2rc4"
+CVE_STATUS[CVE-2024-35997] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12817] =3D "fixed-version: Fixed from version 5.2rc7"
+CVE_STATUS[CVE-2024-35998] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12818] =3D "fixed-version: Fixed from version 5.0"
+CVE_STATUS[CVE-2024-35999] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12819] =3D "fixed-version: Fixed from version 5.0rc8"
+CVE_STATUS[CVE-2024-36000] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12881] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-36001] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-12984] =3D "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-36002] =3D "fixed-version: Fixed from version 6.8.9"
=20
-CVE_STATUS[CVE-2019-13233] =3D "fixed-version: Fixed from version 5.2rc4"
+CVE_STATUS[CVE-2024-36003] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-13272] =3D "fixed-version: Fixed from version 5.2"
+CVE_STATUS[CVE-2024-36004] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-13631] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36005] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-13648] =3D "fixed-version: Fixed from version 5.3rc2"
+CVE_STATUS[CVE-2024-36006] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-14283] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36007] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-14284] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36008] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-14615] =3D "fixed-version: Fixed from version 5.5rc7"
+CVE_STATUS[CVE-2024-36009] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-14763] =3D "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-36010] =3D "fixed-version: Fixed from version 6.8"
=20
-CVE_STATUS[CVE-2019-14814] =3D "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-36011] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-14815] =3D "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-36012] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-14816] =3D "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-36013] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-14821] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36014] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-14835] =3D "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-36015] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-14895] =3D "fixed-version: Fixed from version 5.5rc3"
+CVE_STATUS[CVE-2024-36016] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-14896] =3D "fixed-version: Fixed from version 5.5"
+CVE_STATUS[CVE-2024-36017] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-14897] =3D "fixed-version: Fixed from version 5.5"
+CVE_STATUS[CVE-2024-36018] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2019-14898 has no known resolution
+CVE_STATUS[CVE-2024-36019] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-14901] =3D "fixed-version: Fixed from version 5.5rc3"
+CVE_STATUS[CVE-2024-36020] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15030] =3D "fixed-version: Fixed from version 5.3rc8"
+CVE_STATUS[CVE-2024-36021] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15031] =3D "fixed-version: Fixed from version 5.3rc8"
+CVE_STATUS[CVE-2024-36022] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15090] =3D "fixed-version: Fixed from version 5.2rc2"
+CVE_STATUS[CVE-2024-36023] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15098] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36024] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15099] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36025] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15117] =3D "fixed-version: Fixed from version 5.3rc5"
+CVE_STATUS[CVE-2024-36026] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15118] =3D "fixed-version: Fixed from version 5.3rc5"
+CVE_STATUS[CVE-2024-36027] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15211] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36028] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15212] =3D "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-36029] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15213] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36030] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15214] =3D "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-36031] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-15215] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36032] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15216] =3D "fixed-version: Fixed from version 5.1"
+CVE_STATUS[CVE-2024-36033] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15217] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36244] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-15218] =3D "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-36270] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-15219] =3D "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-36281] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-15220] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36286] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-15221] =3D "fixed-version: Fixed from version 5.2"
+CVE_STATUS[CVE-2024-36288] =3D "fixed-version: Fixed from version 6.9.4"
=20
-CVE_STATUS[CVE-2019-15222] =3D "fixed-version: Fixed from version 5.3rc3"
+CVE_STATUS[CVE-2024-36476] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2019-15223] =3D "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-36477] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2019-15239 has no known resolution
+CVE_STATUS[CVE-2024-36478] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2019-15290 has no known resolution
+CVE_STATUS[CVE-2024-36479] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-15291] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36481] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-15292] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36484] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-15504] =3D "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-36489] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-15505] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36880] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15538] =3D "fixed-version: Fixed from version 5.3rc6"
+CVE_STATUS[CVE-2024-36881] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15666] =3D "fixed-version: Fixed from version 5.1"
+CVE_STATUS[CVE-2024-36882] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2019-15791 has no known resolution
+CVE_STATUS[CVE-2024-36883] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2019-15792 has no known resolution
+CVE_STATUS[CVE-2024-36884] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2019-15793 has no known resolution
+CVE_STATUS[CVE-2024-36886] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15794] =3D "fixed-version: Fixed from version 5.12"
+CVE_STATUS[CVE-2024-36887] =3D "fixed-version: Fixed from version 6.6.31"
=20
-CVE_STATUS[CVE-2019-15807] =3D "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-36888] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2019-15902 has no known resolution
+CVE_STATUS[CVE-2024-36889] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15916] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36890] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15917] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36891] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15918] =3D "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-36892] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15919] =3D "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-36893] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15920] =3D "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-36894] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15921] =3D "fixed-version: Fixed from version 5.1rc3"
+CVE_STATUS[CVE-2024-36895] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15922] =3D "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-36896] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15923] =3D "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-36897] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15924] =3D "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-36898] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15925] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36899] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15926] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36900] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-15927] =3D "fixed-version: Fixed from version 5.0rc2"
+CVE_STATUS[CVE-2024-36901] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2019-16089 has no known resolution
+CVE_STATUS[CVE-2024-36902] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-16229] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36903] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-16230] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36904] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-16231] =3D "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36905] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-16232] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36906] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-16233] =3D "fixed-version: Fixed from version 5.4rc5"
+# CVE-2024-36907 has no known resolution
=20
-CVE_STATUS[CVE-2019-16234] =3D "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-36908] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-16413] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36909] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-16714] =3D "fixed-version: Fixed from version 5.3rc7"
+CVE_STATUS[CVE-2024-36910] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-16746] =3D "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36911] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-16921] =3D "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-36912] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-16994] =3D "fixed-version: Fixed from version 5.0"
+CVE_STATUS[CVE-2024-36913] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-16995] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36914] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-17052] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36915] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-17053] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36916] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-17054] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36917] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-17055] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36918] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-17056] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36919] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-17075] =3D "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36920] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-17133] =3D "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-36921] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-17351] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-36922] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-17666] =3D "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36923] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18198] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36924] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18282] =3D "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36925] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18660] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36926] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18675] =3D "fixed-version: Fixed from version 4.17rc5"
+CVE_STATUS[CVE-2024-36927] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2019-18680 has no known resolution
+CVE_STATUS[CVE-2024-36928] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18683] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36929] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18786] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36930] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18805] =3D "fixed-version: Fixed from version 5.1rc7"
+CVE_STATUS[CVE-2024-36931] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18806] =3D "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36932] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18807] =3D "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36933] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18808] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36934] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18809] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36935] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18810] =3D "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36936] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18811] =3D "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-36937] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18812] =3D "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-36938] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18813] =3D "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36939] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18814] =3D "fixed-version: Fixed from version 5.7rc7"
+CVE_STATUS[CVE-2024-36940] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-18885] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-36941] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19036] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36942] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19037] =3D "fixed-version: Fixed from version 5.5rc3"
+CVE_STATUS[CVE-2024-36943] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19039] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-36944] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19043] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36945] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19044] =3D "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36946] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19045] =3D "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36947] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19046] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36948] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19047] =3D "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36949] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19048] =3D "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36950] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19049] =3D "fixed-version: Fixed from version 5.4rc5"
+CVE_STATUS[CVE-2024-36951] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19050] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36952] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19051] =3D "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-36953] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19052] =3D "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-36954] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19053] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36955] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19054] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36956] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19055] =3D "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-36957] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19056] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36958] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19057] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36959] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19058] =3D "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-36960] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19059] =3D "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-36961] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19060] =3D "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36962] =3D "fixed-version: Fixed from version 6.1.91"
=20
-CVE_STATUS[CVE-2019-19061] =3D "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36963] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19062] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36964] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19063] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36965] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19064] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36966] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-19065] =3D "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36967] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19066] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36968] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19067] =3D "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36969] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19068] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36970] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19069] =3D "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-36971] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19070] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36972] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19071] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-36973] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19072] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36974] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19073] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36975] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19074] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36976] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19075] =3D "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-36977] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19076] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36978] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19077] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-36979] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19078] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-37021] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19079] =3D "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-37026] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19080] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-37078] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19081] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-37354] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19082] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-37356] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19083] =3D "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-38306] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19227] =3D "fixed-version: Fixed from version 5.1rc3"
+CVE_STATUS[CVE-2024-38381] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19241] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38384] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19252] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38385] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19318] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-38388] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19319] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38390] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19332] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38538] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19338] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38539] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19377] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-38540] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2019-19378 has no known resolution
+CVE_STATUS[CVE-2024-38541] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19447] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38542] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19448] =3D "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-38543] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19449] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-38544] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19462] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-38545] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19523] =3D "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-38546] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19524] =3D "fixed-version: Fixed from version 5.4rc8"
+CVE_STATUS[CVE-2024-38547] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19525] =3D "fixed-version: Fixed from version 5.4rc2"
+CVE_STATUS[CVE-2024-38548] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19526] =3D "fixed-version: Fixed from version 5.4rc4"
+CVE_STATUS[CVE-2024-38549] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19527] =3D "fixed-version: Fixed from version 5.3rc4"
+CVE_STATUS[CVE-2024-38550] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19528] =3D "fixed-version: Fixed from version 5.4rc3"
+CVE_STATUS[CVE-2024-38551] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19529] =3D "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-38552] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19530] =3D "fixed-version: Fixed from version 5.3rc5"
+CVE_STATUS[CVE-2024-38553] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19531] =3D "fixed-version: Fixed from version 5.3rc4"
+CVE_STATUS[CVE-2024-38554] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19532] =3D "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-38555] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19533] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-38556] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19534] =3D "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-38557] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19535] =3D "fixed-version: Fixed from version 5.3rc4"
+CVE_STATUS[CVE-2024-38558] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19536] =3D "fixed-version: Fixed from version 5.3rc4"
+CVE_STATUS[CVE-2024-38559] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19537] =3D "fixed-version: Fixed from version 5.3rc5"
+CVE_STATUS[CVE-2024-38560] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19543] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38561] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19602] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38562] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19767] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-38563] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19768] =3D "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-38564] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19769] =3D "fixed-version: Fixed from version 5.6rc5"
+CVE_STATUS[CVE-2024-38565] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19770] =3D "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-38566] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19807] =3D "fixed-version: Fixed from version 5.4rc7"
+CVE_STATUS[CVE-2024-38567] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19813] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38568] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2019-19814 has no known resolution
+CVE_STATUS[CVE-2024-38569] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19815] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-38570] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19816] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38571] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19922] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-38572] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19927] =3D "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-38573] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19947] =3D "fixed-version: Fixed from version 5.5rc3"
+CVE_STATUS[CVE-2024-38574] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19965] =3D "fixed-version: Fixed from version 5.5rc2"
+CVE_STATUS[CVE-2024-38575] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-19966] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38576] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-1999] =3D "fixed-version: Fixed from version 5.1rc3"
+CVE_STATUS[CVE-2024-38577] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-20054] =3D "fixed-version: Fixed from version 5.1rc3"
+CVE_STATUS[CVE-2024-38578] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-20095] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38579] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-20096] =3D "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-38580] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-2024] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-38581] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2019-2025] =3D "fixed-version: Fixed from version 4.20rc5"
+CVE_STATUS[CVE-2024-38582] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-20422] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-38583] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-2054] =3D "fixed-version: Fixed from version 4.8rc1"
+CVE_STATUS[CVE-2024-38584] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-20636] =3D "fixed-version: Fixed from version 5.5rc6"
+CVE_STATUS[CVE-2024-38585] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2019-20794 has no known resolution
+CVE_STATUS[CVE-2024-38586] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-20806] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38587] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-20810] =3D "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-38588] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-20811] =3D "fixed-version: Fixed from version 5.1rc3"
+CVE_STATUS[CVE-2024-38589] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-20812] =3D "fixed-version: Fixed from version 5.5rc3"
+CVE_STATUS[CVE-2024-38590] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-20908] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-38591] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-20934] =3D "fixed-version: Fixed from version 5.3rc2"
+CVE_STATUS[CVE-2024-38592] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-2101] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38593] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-2181] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38594] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-2182] =3D "fixed-version: Fixed from version 4.16rc3"
+CVE_STATUS[CVE-2024-38595] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-2213] =3D "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-38596] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-2214] =3D "fixed-version: Fixed from version 5.3rc2"
+CVE_STATUS[CVE-2024-38597] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-2215] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-38598] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-25044] =3D "fixed-version: Fixed from version 5.2rc4"
+CVE_STATUS[CVE-2024-38599] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-25045] =3D "fixed-version: Fixed from version 5.1"
+CVE_STATUS[CVE-2024-38600] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-25160] =3D "fixed-version: Fixed from version 5.0"
+CVE_STATUS[CVE-2024-38601] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-25162] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-38602] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3016] =3D "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-38603] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3459] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38604] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3460] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38605] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3701] =3D "fixed-version: Fixed from version 5.0rc3"
+CVE_STATUS[CVE-2024-38606] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3819] =3D "fixed-version: Fixed from version 5.0rc6"
+CVE_STATUS[CVE-2024-38607] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3837] =3D "fixed-version: Fixed from version 3.18rc1"
+CVE_STATUS[CVE-2024-38608] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3846] =3D "fixed-version: Fixed from version 5.2rc6"
+CVE_STATUS[CVE-2024-38609] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3874] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38610] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3882] =3D "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-38611] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3887] =3D "fixed-version: Fixed from version 5.1rc4"
+CVE_STATUS[CVE-2024-38612] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3892] =3D "fixed-version: Fixed from version 5.1rc6"
+CVE_STATUS[CVE-2024-38613] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3896] =3D "fixed-version: Fixed from version 2.6.35rc1=
"
+CVE_STATUS[CVE-2024-38614] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3900] =3D "fixed-version: Fixed from version 5.2rc4"
+CVE_STATUS[CVE-2024-38615] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-3901] =3D "fixed-version: Fixed from version 4.6rc6"
+CVE_STATUS[CVE-2024-38616] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-5108] =3D "fixed-version: Fixed from version 5.3"
+CVE_STATUS[CVE-2024-38617] =3D "fixed-version: Fixed from version 6.10"
=20
-# Skipping CVE-2019-5489, no affected_versions
+CVE_STATUS[CVE-2024-38618] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-6133] =3D "fixed-version: Fixed from version 5.0rc2"
+CVE_STATUS[CVE-2024-38619] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-6974] =3D "fixed-version: Fixed from version 5.0rc6"
+CVE_STATUS[CVE-2024-38620] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-7221] =3D "fixed-version: Fixed from version 5.0rc6"
+CVE_STATUS[CVE-2024-38621] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-7222] =3D "fixed-version: Fixed from version 5.0rc6"
+CVE_STATUS[CVE-2024-38622] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-7308] =3D "fixed-version: Fixed from version 5.0rc3"
+CVE_STATUS[CVE-2024-38623] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-8912] =3D "fixed-version: Fixed from version 5.0rc8"
+CVE_STATUS[CVE-2024-38624] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-8956] =3D "fixed-version: Fixed from version 5.0rc6"
+CVE_STATUS[CVE-2024-38625] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-8980] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38626] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9003] =3D "fixed-version: Fixed from version 5.0rc4"
+CVE_STATUS[CVE-2024-38627] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9162] =3D "fixed-version: Fixed from version 5.0rc7"
+CVE_STATUS[CVE-2024-38628] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9213] =3D "fixed-version: Fixed from version 5.0"
+CVE_STATUS[CVE-2024-38629] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9245] =3D "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-38630] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9444] =3D "fixed-version: Fixed from version 4.15rc2"
+CVE_STATUS[CVE-2024-38631] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9445] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38632] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9453] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-38633] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9454] =3D "fixed-version: Fixed from version 4.15rc9"
+CVE_STATUS[CVE-2024-38634] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9455] =3D "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-38635] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9456] =3D "fixed-version: Fixed from version 4.16rc6"
+CVE_STATUS[CVE-2024-38636] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9457] =3D "fixed-version: Fixed from version 4.13rc1"
+CVE_STATUS[CVE-2024-38637] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9458] =3D "fixed-version: Fixed from version 4.19rc7"
+CVE_STATUS[CVE-2024-38659] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9466] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38661] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9500] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38662] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9503] =3D "fixed-version: Fixed from version 5.1rc1"
+CVE_STATUS[CVE-2024-38663] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9506] =3D "fixed-version: Fixed from version 5.2"
+CVE_STATUS[CVE-2024-38664] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2019-9857] =3D "fixed-version: Fixed from version 5.1rc2"
+CVE_STATUS[CVE-2024-38667] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0009] =3D "fixed-version: Fixed from version 5.6rc3"
+CVE_STATUS[CVE-2024-38780] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0030] =3D "fixed-version: Fixed from version 4.16rc3"
+CVE_STATUS[CVE-2024-39276] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0041] =3D "fixed-version: Fixed from version 5.5rc2"
+CVE_STATUS[CVE-2024-39277] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0066] =3D "fixed-version: Fixed from version 4.3rc7"
+CVE_STATUS[CVE-2024-39282] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2020-0067] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-39291] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0110] =3D "fixed-version: Fixed from version 5.6rc2"
+CVE_STATUS[CVE-2024-39292] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0255] =3D "fixed-version: Fixed from version 5.7rc4"
+CVE_STATUS[CVE-2024-39293] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0305] =3D "fixed-version: Fixed from version 5.5rc6"
+CVE_STATUS[CVE-2024-39296] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-0347 has no known resolution
+CVE_STATUS[CVE-2024-39298] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0404] =3D "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-39301] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0423] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-39371] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0427] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-39461] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0429] =3D "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-39462] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0430] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-39463] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0431] =3D "fixed-version: Fixed from version 5.5rc6"
+CVE_STATUS[CVE-2024-39464] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0432] =3D "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-39465] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0433] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-39466] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0435] =3D "fixed-version: Fixed from version 4.19rc1"
+CVE_STATUS[CVE-2024-39467] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0444] =3D "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-39468] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0465] =3D "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-39469] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0466] =3D "fixed-version: Fixed from version 5.9rc2"
+CVE_STATUS[CVE-2024-39470] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-0543] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39471] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10135] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39472] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10690] =3D "fixed-version: Fixed from version 5.5rc5"
+CVE_STATUS[CVE-2024-39473] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-10708 has no known resolution
+CVE_STATUS[CVE-2024-39474] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10711] =3D "fixed-version: Fixed from version 5.7rc6"
+CVE_STATUS[CVE-2024-39475] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10720] =3D "fixed-version: Fixed from version 5.2rc3"
+CVE_STATUS[CVE-2024-39476] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10732] =3D "fixed-version: Fixed from version 5.7"
+CVE_STATUS[CVE-2024-39477] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10742] =3D "fixed-version: Fixed from version 3.16rc1"
+CVE_STATUS[CVE-2024-39478] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10751] =3D "fixed-version: Fixed from version 5.7rc4"
+CVE_STATUS[CVE-2024-39479] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10757] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39480] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10766] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39481] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10767] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39482] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10768] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39483] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10769] =3D "fixed-version: Fixed from version 5.0rc3"
+CVE_STATUS[CVE-2024-39484] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10773] =3D "fixed-version: Fixed from version 5.4rc6"
+CVE_STATUS[CVE-2024-39485] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-10774 has no known resolution
+CVE_STATUS[CVE-2024-39486] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10781] =3D "fixed-version: Fixed from version 5.8rc6"
+CVE_STATUS[CVE-2024-39487] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-10942] =3D "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-39488] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-11494] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39489] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-11565] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39490] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-11608] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39491] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-11609] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39492] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-11668] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39493] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-11669] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-39494] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-11725 has no known resolution
+CVE_STATUS[CVE-2024-39495] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-11884] =3D "fixed-version: Fixed from version 5.7rc4"
+CVE_STATUS[CVE-2024-39496] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-11935 has no known resolution
+CVE_STATUS[CVE-2024-39497] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12114] =3D "fixed-version: Fixed from version 5.3rc1"
+CVE_STATUS[CVE-2024-39498] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12351] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-39499] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12352] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-39500] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12362] =3D "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-39501] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12363] =3D "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-39502] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12364] =3D "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-39503] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12464] =3D "fixed-version: Fixed from version 5.7rc3"
+CVE_STATUS[CVE-2024-39504] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12465] =3D "fixed-version: Fixed from version 5.6rc6"
+CVE_STATUS[CVE-2024-39505] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12652] =3D "fixed-version: Fixed from version 5.5rc7"
+CVE_STATUS[CVE-2024-39506] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12653] =3D "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-39507] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12654] =3D "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-39508] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12655] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-39509] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12656] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-39510] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12657] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-40899] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12659] =3D "fixed-version: Fixed from version 5.7rc2"
+CVE_STATUS[CVE-2024-40900] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12768] =3D "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-40901] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12769] =3D "fixed-version: Fixed from version 5.5rc6"
+CVE_STATUS[CVE-2024-40902] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12770] =3D "fixed-version: Fixed from version 5.7rc3"
+CVE_STATUS[CVE-2024-40903] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12771] =3D "fixed-version: Fixed from version 5.8rc2"
+CVE_STATUS[CVE-2024-40904] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12826] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-40905] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12888] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-40906] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-12912] =3D "fixed-version: Fixed from version 5.10rc4"
+CVE_STATUS[CVE-2024-40907] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-13143] =3D "fixed-version: Fixed from version 5.7rc6"
+CVE_STATUS[CVE-2024-40908] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-13974] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-40909] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-14304 has no known resolution
+CVE_STATUS[CVE-2024-40910] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-14305] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-40911] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-14314] =3D "fixed-version: Fixed from version 5.9rc2"
+CVE_STATUS[CVE-2024-40912] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-14331] =3D "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-40913] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-14351] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40914] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-14353] =3D "fixed-version: Fixed from version 4.14rc3"
+CVE_STATUS[CVE-2024-40915] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-14356] =3D "fixed-version: Fixed from version 5.8rc5"
+CVE_STATUS[CVE-2024-40916] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-14381] =3D "fixed-version: Fixed from version 5.6rc6"
+CVE_STATUS[CVE-2024-40917] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-14385] =3D "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-40918] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-14386] =3D "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-40919] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-14390] =3D "fixed-version: Fixed from version 5.9rc6"
+CVE_STATUS[CVE-2024-40920] =3D "fixed-version: Fixed from version 6.1.95"
=20
-CVE_STATUS[CVE-2020-14416] =3D "fixed-version: Fixed from version 5.5"
+CVE_STATUS[CVE-2024-40921] =3D "fixed-version: Fixed from version 6.1.95"
=20
-CVE_STATUS[CVE-2020-15393] =3D "fixed-version: Fixed from version 5.8rc3"
+CVE_STATUS[CVE-2024-40922] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-15436] =3D "fixed-version: Fixed from version 5.8rc2"
+CVE_STATUS[CVE-2024-40923] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-15437] =3D "fixed-version: Fixed from version 5.8rc7"
+CVE_STATUS[CVE-2024-40924] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-15780] =3D "fixed-version: Fixed from version 5.8rc3"
+CVE_STATUS[CVE-2024-40925] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-15802 has no known resolution
+CVE_STATUS[CVE-2024-40926] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-15852] =3D "fixed-version: Fixed from version 5.8rc6"
+CVE_STATUS[CVE-2024-40927] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-16119] =3D "fixed-version: Fixed from version 5.15rc2"
+CVE_STATUS[CVE-2024-40928] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-16120] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-40929] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-16166] =3D "fixed-version: Fixed from version 5.8"
+CVE_STATUS[CVE-2024-40930] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-1749] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-40931] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-24394] =3D "fixed-version: Fixed from version 5.8rc4"
+CVE_STATUS[CVE-2024-40932] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-24490] =3D "fixed-version: Fixed from version 5.8"
+CVE_STATUS[CVE-2024-40933] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-24502 has no known resolution
+CVE_STATUS[CVE-2024-40934] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-24503 has no known resolution
+CVE_STATUS[CVE-2024-40935] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-24504] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-40936] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-24586] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40937] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-24587] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40938] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-24588] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40939] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25211] =3D "fixed-version: Fixed from version 5.9rc7"
+CVE_STATUS[CVE-2024-40940] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25212] =3D "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-40941] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-25220 has no known resolution
+CVE_STATUS[CVE-2024-40942] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25221] =3D "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-40943] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25284] =3D "fixed-version: Fixed from version 5.9rc5"
+CVE_STATUS[CVE-2024-40944] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25285] =3D "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-40945] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25639] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-40947] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25641] =3D "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-40948] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25643] =3D "fixed-version: Fixed from version 5.9rc7"
+CVE_STATUS[CVE-2024-40949] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25645] =3D "fixed-version: Fixed from version 5.9rc7"
+CVE_STATUS[CVE-2024-40950] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25656] =3D "fixed-version: Fixed from version 5.10rc2"
+CVE_STATUS[CVE-2024-40951] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-25661 has no known resolution
+CVE_STATUS[CVE-2024-40952] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-25662 has no known resolution
+CVE_STATUS[CVE-2024-40953] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25668] =3D "fixed-version: Fixed from version 5.10rc3"
+CVE_STATUS[CVE-2024-40954] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25669] =3D "fixed-version: Fixed from version 5.10rc5"
+CVE_STATUS[CVE-2024-40955] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25670] =3D "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-40956] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25671] =3D "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-40957] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25672] =3D "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-40958] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25673] =3D "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-40959] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25704] =3D "fixed-version: Fixed from version 5.10rc3"
+CVE_STATUS[CVE-2024-40960] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-25705] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40961] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-26088] =3D "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-40962] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-26139] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40963] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-26140 has no known resolution
+CVE_STATUS[CVE-2024-40964] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-26141] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40965] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-26142 has no known resolution
+CVE_STATUS[CVE-2024-40966] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-26143 has no known resolution
+CVE_STATUS[CVE-2024-40967] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-26145] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40968] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-26147] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-40969] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-26541] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-40970] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-26555] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-40971] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-26556 has no known resolution
+CVE_STATUS[CVE-2024-40972] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-26557 has no known resolution
+CVE_STATUS[CVE-2024-40973] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-26558] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-40974] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-26559 has no known resolution
+CVE_STATUS[CVE-2024-40975] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-26560 has no known resolution
+CVE_STATUS[CVE-2024-40976] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27066] =3D "fixed-version: Fixed from version 5.6"
+CVE_STATUS[CVE-2024-40977] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27067] =3D "fixed-version: Fixed from version 4.14rc4"
+CVE_STATUS[CVE-2024-40978] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27068] =3D "fixed-version: Fixed from version 5.6rc2"
+CVE_STATUS[CVE-2024-40979] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27152] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40980] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27170] =3D "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-40981] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27171] =3D "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-40982] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27194] =3D "fixed-version: Fixed from version 5.9"
+CVE_STATUS[CVE-2024-40983] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-2732] =3D "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-40984] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27418] =3D "fixed-version: Fixed from version 5.6rc5"
+CVE_STATUS[CVE-2024-40985] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27673] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40986] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27675] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40987] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27777] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40988] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27784] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40989] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27786] =3D "fixed-version: Fixed from version 5.7rc6"
+CVE_STATUS[CVE-2024-40990] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27815] =3D "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-40991] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27820] =3D "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-40992] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27825] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-40993] =3D "fixed-version: Fixed from version 6.1.96"
=20
-CVE_STATUS[CVE-2020-27830] =3D "fixed-version: Fixed from version 5.10rc7"
+CVE_STATUS[CVE-2024-40994] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-27835] =3D "fixed-version: Fixed from version 5.10rc6"
+CVE_STATUS[CVE-2024-40995] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-28097] =3D "fixed-version: Fixed from version 5.9rc6"
+CVE_STATUS[CVE-2024-40996] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-28374] =3D "fixed-version: Fixed from version 5.11rc4"
+CVE_STATUS[CVE-2024-40997] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-28588] =3D "fixed-version: Fixed from version 5.10rc7"
+CVE_STATUS[CVE-2024-40998] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-28915] =3D "fixed-version: Fixed from version 5.9"
+CVE_STATUS[CVE-2024-40999] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-28941] =3D "fixed-version: Fixed from version 5.10rc5"
+CVE_STATUS[CVE-2024-41000] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-28974] =3D "fixed-version: Fixed from version 5.10rc3"
+CVE_STATUS[CVE-2024-41001] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-29368] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-41002] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-29369] =3D "fixed-version: Fixed from version 5.8rc7"
+CVE_STATUS[CVE-2024-41003] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-29370] =3D "fixed-version: Fixed from version 5.6rc7"
+CVE_STATUS[CVE-2024-41004] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-29371] =3D "fixed-version: Fixed from version 5.9rc2"
+CVE_STATUS[CVE-2024-41005] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-29372] =3D "fixed-version: Fixed from version 5.7rc3"
+CVE_STATUS[CVE-2024-41006] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-29373] =3D "fixed-version: Fixed from version 5.6rc2"
+CVE_STATUS[CVE-2024-41007] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-29374] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-41008] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2020-29534] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-41009] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-29568] =3D "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-41010] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-29569] =3D "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-41011] =3D "fixed-version: Fixed from version 6.9"
=20
-CVE_STATUS[CVE-2020-29660] =3D "fixed-version: Fixed from version 5.10rc7"
+CVE_STATUS[CVE-2024-41012] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-29661] =3D "fixed-version: Fixed from version 5.10rc7"
+CVE_STATUS[CVE-2024-41013] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2020-35499] =3D "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-41014] =3D "fixed-version: Fixed from version 6.11"
=20
-# CVE-2020-35501 has no known resolution
+CVE_STATUS[CVE-2024-41015] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2020-35508] =3D "fixed-version: Fixed from version 5.10rc3"
+CVE_STATUS[CVE-2024-41016] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2020-35513] =3D "fixed-version: Fixed from version 4.17rc1"
+CVE_STATUS[CVE-2024-41017] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2020-35519] =3D "fixed-version: Fixed from version 5.10rc7"
+CVE_STATUS[CVE-2024-41018] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2020-36158] =3D "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-41019] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2020-36310] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-41020] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2020-36311] =3D "fixed-version: Fixed from version 5.9rc5"
+CVE_STATUS[CVE-2024-41021] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2020-36312] =3D "fixed-version: Fixed from version 5.9rc5"
+CVE_STATUS[CVE-2024-41022] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2020-36313] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-41023] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36322] =3D "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-41025] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36385] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-41026] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36386] =3D "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-41027] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36387] =3D "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-41028] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36516] =3D "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-41029] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36557] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-41030] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36558] =3D "fixed-version: Fixed from version 5.6rc3"
+CVE_STATUS[CVE-2024-41031] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36691] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-41032] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36694] =3D "fixed-version: Fixed from version 5.10"
+CVE_STATUS[CVE-2024-41033] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36766] =3D "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-41034] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36775] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-41035] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36776] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41036] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36777] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41037] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36778] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41038] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36779] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41039] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36780] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41040] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36781] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41041] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36782] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41042] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36783] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41043] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36784] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41044] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36785] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41045] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36786] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41046] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-36787] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41047] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-3702] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-41048] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-4788] =3D "fixed-version: Fixed from version 5.10rc5"
+CVE_STATUS[CVE-2024-41049] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-7053] =3D "fixed-version: Fixed from version 5.2rc1"
+CVE_STATUS[CVE-2024-41050] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-8428] =3D "fixed-version: Fixed from version 5.5"
+CVE_STATUS[CVE-2024-41051] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-8647] =3D "fixed-version: Fixed from version 5.6rc5"
+CVE_STATUS[CVE-2024-41052] =3D "fixed-version: Fixed from version 6.6.41"
=20
-CVE_STATUS[CVE-2020-8648] =3D "fixed-version: Fixed from version 5.6rc3"
+CVE_STATUS[CVE-2024-41053] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-8649] =3D "fixed-version: Fixed from version 5.6rc5"
+CVE_STATUS[CVE-2024-41054] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-8694] =3D "fixed-version: Fixed from version 5.10rc4"
+CVE_STATUS[CVE-2024-41055] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2020-8832 has no known resolution
+CVE_STATUS[CVE-2024-41056] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-8834] =3D "fixed-version: Fixed from version 4.18rc1"
+CVE_STATUS[CVE-2024-41057] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-8835] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-41058] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-8992] =3D "fixed-version: Fixed from version 5.6rc2"
+CVE_STATUS[CVE-2024-41059] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-9383] =3D "fixed-version: Fixed from version 5.6rc4"
+CVE_STATUS[CVE-2024-41060] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2020-9391] =3D "fixed-version: Fixed from version 5.6rc3"
+CVE_STATUS[CVE-2024-41061] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0129] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41062] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0342] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-41063] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-0399 has no known resolution
+CVE_STATUS[CVE-2024-41064] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0447] =3D "fixed-version: Fixed from version 4.15rc1"
+CVE_STATUS[CVE-2024-41065] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0448] =3D "fixed-version: Fixed from version 5.9rc7"
+CVE_STATUS[CVE-2024-41066] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0512] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-41067] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0605] =3D "fixed-version: Fixed from version 5.8"
+CVE_STATUS[CVE-2024-41068] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-0606 has no known resolution
+CVE_STATUS[CVE-2024-41069] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-0695 has no known resolution
+CVE_STATUS[CVE-2024-41070] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0707] =3D "fixed-version: Fixed from version 5.11rc3"
+CVE_STATUS[CVE-2024-41072] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0920] =3D "fixed-version: Fixed from version 5.14rc4"
+CVE_STATUS[CVE-2024-41073] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-0924 has no known resolution
+CVE_STATUS[CVE-2024-41074] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0929] =3D "fixed-version: Fixed from version 5.6rc1"
+CVE_STATUS[CVE-2024-41075] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0935] =3D "fixed-version: Fixed from version 4.16rc7"
+CVE_STATUS[CVE-2024-41076] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-0936 has no known resolution
+CVE_STATUS[CVE-2024-41077] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0937] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-41078] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0938] =3D "fixed-version: Fixed from version 5.10rc4"
+CVE_STATUS[CVE-2024-41079] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-0941] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-41080] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-0961 has no known resolution
+CVE_STATUS[CVE-2024-41081] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-1048] =3D "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-41082] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-20177] =3D "fixed-version: Fixed from version 5.5rc1"
+CVE_STATUS[CVE-2024-41083] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-20194] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-41084] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-20219 has no known resolution
+CVE_STATUS[CVE-2024-41085] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-20226] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-41086] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-20239] =3D "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-41087] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-20261] =3D "fixed-version: Fixed from version 4.5rc5"
+CVE_STATUS[CVE-2024-41088] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-20265] =3D "fixed-version: Fixed from version 4.5rc3"
+CVE_STATUS[CVE-2024-41089] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-20268] =3D "fixed-version: Fixed from version 5.11rc5"
+CVE_STATUS[CVE-2024-41090] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-20292] =3D "fixed-version: Fixed from version 5.9rc1"
+CVE_STATUS[CVE-2024-41091] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-20317] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-41092] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-20320] =3D "fixed-version: Fixed from version 5.15rc3"
+CVE_STATUS[CVE-2024-41093] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-20321] =3D "fixed-version: Fixed from version 5.15rc5"
+CVE_STATUS[CVE-2024-41094] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-20322] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-41095] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-21781] =3D "fixed-version: Fixed from version 5.11rc7"
+CVE_STATUS[CVE-2024-41096] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-22543] =3D "fixed-version: Fixed from version 5.13"
+CVE_STATUS[CVE-2024-41097] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-22555] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-41098] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-22600] =3D "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-41149] =3D "fixed-version: Fixed from version 6.12.7"
=20
-CVE_STATUS[CVE-2021-23133] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-41932] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2021-23134] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-41935] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2021-26401] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-42063] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-26708] =3D "fixed-version: Fixed from version 5.11rc7"
+CVE_STATUS[CVE-2024-42064] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-26930] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42065] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-26931] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42066] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-26932] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42067] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-26934 has no known resolution
+CVE_STATUS[CVE-2024-42068] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-27363] =3D "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42069] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-27364] =3D "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42070] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-27365] =3D "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42071] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28038] =3D "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42072] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28039] =3D "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42073] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28375] =3D "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42074] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28660] =3D "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42075] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28688] =3D "fixed-version: Fixed from version 5.12rc6"
+CVE_STATUS[CVE-2024-42076] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28691] =3D "fixed-version: Fixed from version 5.13rc6"
+CVE_STATUS[CVE-2024-42077] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28711] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42078] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28712] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42079] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28713] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42080] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28714] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42081] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28715] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42082] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28950] =3D "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42083] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28951] =3D "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42084] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28952] =3D "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42085] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28964] =3D "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42086] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28971] =3D "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42087] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-28972] =3D "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42088] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-29154] =3D "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-42089] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-29155] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-42090] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-29264] =3D "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42091] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-29265] =3D "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42092] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-29266] =3D "fixed-version: Fixed from version 5.12rc4"
+CVE_STATUS[CVE-2024-42093] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-29646] =3D "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42094] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-29647] =3D "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42095] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-29648] =3D "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42096] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-29649] =3D "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42097] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-29650] =3D "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42098] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-29657] =3D "fixed-version: Fixed from version 5.12rc6"
+CVE_STATUS[CVE-2024-42099] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-30002] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42100] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-30178] =3D "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-42101] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-31440] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42102] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3178] =3D "fixed-version: Fixed from version 5.11rc5"
+CVE_STATUS[CVE-2024-42103] =3D "fixed-version: Fixed from version 5.15.163=
"
=20
-CVE_STATUS[CVE-2021-31829] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42104] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-31916] =3D "fixed-version: Fixed from version 5.12rc5"
+CVE_STATUS[CVE-2024-42105] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-32078] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42106] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-32399] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42107] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-32606] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-42108] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33033] =3D "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42109] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33034] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42110] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33061] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-42111] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33098] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-42112] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33135] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-42113] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33200] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-42114] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3347] =3D "fixed-version: Fixed from version 5.11rc6"
+CVE_STATUS[CVE-2024-42115] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3348] =3D "fixed-version: Fixed from version 5.11rc6"
+CVE_STATUS[CVE-2024-42117] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33624] =3D "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42118] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33630] =3D "fixed-version: Fixed from version 5.4rc1"
+CVE_STATUS[CVE-2024-42119] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33631] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-42120] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33655] =3D "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-42121] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33656] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42122] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-33909] =3D "fixed-version: Fixed from version 5.14rc3"
+CVE_STATUS[CVE-2024-42123] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3411] =3D "fixed-version: Fixed from version 5.10"
+CVE_STATUS[CVE-2024-42124] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3428] =3D "fixed-version: Fixed from version 5.9rc2"
+CVE_STATUS[CVE-2024-42125] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3444] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42126] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-34556] =3D "fixed-version: Fixed from version 5.14rc4"
+CVE_STATUS[CVE-2024-42127] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-34693] =3D "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42128] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3483] =3D "fixed-version: Fixed from version 5.12rc6"
+CVE_STATUS[CVE-2024-42129] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-34866] =3D "fixed-version: Fixed from version 5.14"
+CVE_STATUS[CVE-2024-42130] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3489] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-42131] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3490] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-42132] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3491] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42133] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-3492 has no known resolution
+CVE_STATUS[CVE-2024-42134] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3493] =3D "fixed-version: Fixed from version 5.11rc1"
+CVE_STATUS[CVE-2024-42135] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-34981] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42136] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3501] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-42137] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-35039] =3D "fixed-version: Fixed from version 5.13"
+CVE_STATUS[CVE-2024-42138] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3506] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42139] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-3542 has no known resolution
+CVE_STATUS[CVE-2024-42140] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3543] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42141] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-35477] =3D "fixed-version: Fixed from version 5.14rc4"
+CVE_STATUS[CVE-2024-42142] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3564] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-42144] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3573] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-42145] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3587] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-42146] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3600] =3D "fixed-version: Fixed from version 5.11"
+CVE_STATUS[CVE-2024-42147] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3609] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42148] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3612] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42149] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3635] =3D "fixed-version: Fixed from version 5.5rc7"
+CVE_STATUS[CVE-2024-42150] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3640] =3D "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-42151] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3653] =3D "fixed-version: Fixed from version 5.14rc7"
+CVE_STATUS[CVE-2024-42152] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3655] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42153] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3656] =3D "fixed-version: Fixed from version 5.14rc7"
+CVE_STATUS[CVE-2024-42154] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3659] =3D "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-42155] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3669] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42156] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3679] =3D "fixed-version: Fixed from version 5.14rc3"
+CVE_STATUS[CVE-2024-42157] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-3714 has no known resolution
+CVE_STATUS[CVE-2024-42158] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3715] =3D "fixed-version: Fixed from version 5.6"
+CVE_STATUS[CVE-2024-42159] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-37159] =3D "fixed-version: Fixed from version 5.14rc3"
+CVE_STATUS[CVE-2024-42160] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3732] =3D "fixed-version: Fixed from version 5.14rc6"
+CVE_STATUS[CVE-2024-42161] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3736] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42162] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3739] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42223] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3743] =3D "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42224] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3744] =3D "fixed-version: Fixed from version 5.15rc4"
+CVE_STATUS[CVE-2024-42225] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3752] =3D "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-42227] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3753] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42228] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-37576] =3D "fixed-version: Fixed from version 5.14rc3"
+CVE_STATUS[CVE-2024-42229] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3759] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42230] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3760] =3D "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42231] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3764] =3D "fixed-version: Fixed from version 5.15rc4"
+CVE_STATUS[CVE-2024-42232] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3772] =3D "fixed-version: Fixed from version 5.15"
+CVE_STATUS[CVE-2024-42233] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38160] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42234] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38166] =3D "fixed-version: Fixed from version 5.14rc6"
+CVE_STATUS[CVE-2024-42235] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38198] =3D "fixed-version: Fixed from version 5.13rc6"
+CVE_STATUS[CVE-2024-42236] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38199] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42237] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38200] =3D "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42238] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38201] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42239] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38202] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42240] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38203] =3D "fixed-version: Fixed from version 5.14rc2"
+CVE_STATUS[CVE-2024-42241] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38204] =3D "fixed-version: Fixed from version 5.14rc3"
+CVE_STATUS[CVE-2024-42242] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38205] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42243] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38206] =3D "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42244] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38207] =3D "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42245] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38208] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-42246] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38209] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42247] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-38300] =3D "fixed-version: Fixed from version 5.15rc4"
+CVE_STATUS[CVE-2024-42248] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-3847 has no known resolution
+CVE_STATUS[CVE-2024-42249] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-3864 has no known resolution
+CVE_STATUS[CVE-2024-42250] =3D "fixed-version: Fixed from version 6.10"
=20
-# CVE-2021-3892 has no known resolution
+CVE_STATUS[CVE-2024-42251] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3894] =3D "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42252] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3896] =3D "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42253] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-3923] =3D "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2024-42254] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39633] =3D "fixed-version: Fixed from version 5.14"
+CVE_STATUS[CVE-2024-42255] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39634] =3D "fixed-version: Fixed from version 5.9rc8"
+CVE_STATUS[CVE-2024-42256] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39636] =3D "fixed-version: Fixed from version 4.16rc1"
+CVE_STATUS[CVE-2024-42257] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39648] =3D "fixed-version: Fixed from version 5.11rc3"
+CVE_STATUS[CVE-2024-42258] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39656] =3D "fixed-version: Fixed from version 5.12rc3"
+CVE_STATUS[CVE-2024-42259] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39657] =3D "fixed-version: Fixed from version 5.11rc4"
+CVE_STATUS[CVE-2024-42260] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39685] =3D "fixed-version: Fixed from version 5.16rc5"
+CVE_STATUS[CVE-2024-42261] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39686] =3D "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-42262] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39698] =3D "fixed-version: Fixed from version 5.16rc5"
+CVE_STATUS[CVE-2024-42263] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39711] =3D "fixed-version: Fixed from version 4.18rc6"
+CVE_STATUS[CVE-2024-42264] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39713] =3D "fixed-version: Fixed from version 4.20rc1"
+CVE_STATUS[CVE-2024-42265] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-39714] =3D "fixed-version: Fixed from version 4.12rc1"
+CVE_STATUS[CVE-2024-42266] =3D "fixed-version: Fixed from version 6.11"
=20
-# CVE-2021-39800 has no known resolution
+CVE_STATUS[CVE-2024-42267] =3D "fixed-version: Fixed from version 6.11"
=20
-# CVE-2021-39801 has no known resolution
+CVE_STATUS[CVE-2024-42268] =3D "fixed-version: Fixed from version 6.11"
=20
-# CVE-2021-39802 has no known resolution
+CVE_STATUS[CVE-2024-42269] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4001] =3D "fixed-version: Fixed from version 5.16rc2"
+CVE_STATUS[CVE-2024-42270] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4002] =3D "fixed-version: Fixed from version 5.16rc3"
+CVE_STATUS[CVE-2024-42271] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4023] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42272] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4028] =3D "fixed-version: Fixed from version 5.15rc4"
+CVE_STATUS[CVE-2024-42273] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4032] =3D "fixed-version: Fixed from version 5.15rc7"
+CVE_STATUS[CVE-2024-42274] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4037] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-42275] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-40490] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42276] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4083] =3D "fixed-version: Fixed from version 5.16rc4"
+CVE_STATUS[CVE-2024-42277] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4090] =3D "fixed-version: Fixed from version 5.16rc2"
+CVE_STATUS[CVE-2024-42278] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4093] =3D "fixed-version: Fixed from version 5.15rc7"
+CVE_STATUS[CVE-2024-42279] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4095] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-42280] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-41073] =3D "fixed-version: Fixed from version 5.15rc2"
+CVE_STATUS[CVE-2024-42281] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4135] =3D "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-42282] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4148] =3D "fixed-version: Fixed from version 5.15"
+CVE_STATUS[CVE-2024-42283] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4149] =3D "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42284] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4150] =3D "fixed-version: Fixed from version 5.15rc7"
+CVE_STATUS[CVE-2024-42285] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4154] =3D "fixed-version: Fixed from version 5.14rc2"
+CVE_STATUS[CVE-2024-42286] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4155] =3D "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2024-42287] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4157] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42288] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4159] =3D "fixed-version: Fixed from version 5.7rc1"
+CVE_STATUS[CVE-2024-42289] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-41864] =3D "fixed-version: Fixed from version 5.15rc5"
+CVE_STATUS[CVE-2024-42290] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4197] =3D "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2024-42291] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-42008] =3D "fixed-version: Fixed from version 5.14rc7"
+CVE_STATUS[CVE-2024-42292] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4202] =3D "fixed-version: Fixed from version 5.16rc2"
+CVE_STATUS[CVE-2024-42293] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4203] =3D "fixed-version: Fixed from version 5.15rc4"
+CVE_STATUS[CVE-2024-42294] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4204] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-42295] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-4218] =3D "fixed-version: Fixed from version 5.8rc1"
+CVE_STATUS[CVE-2024-42296] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-42252] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-42297] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-42327] =3D "fixed-version: Fixed from version 5.15"
+CVE_STATUS[CVE-2024-42298] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-42739] =3D "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-42299] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-43056] =3D "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42300] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-43057] =3D "fixed-version: Fixed from version 5.15rc3"
+CVE_STATUS[CVE-2024-42301] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-43267] =3D "fixed-version: Fixed from version 5.15"
+CVE_STATUS[CVE-2024-42302] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-43389] =3D "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-42303] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-43975] =3D "fixed-version: Fixed from version 5.16rc2"
+CVE_STATUS[CVE-2024-42304] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-43976] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-42305] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-44733] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42306] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-44879] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-42307] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-45095] =3D "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-42309] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-45100] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-42310] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-45402] =3D "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-42311] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-45469] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-42312] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-45480] =3D "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-42313] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-45485] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-42314] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-45486] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42315] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-45868] =3D "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-42316] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46283] =3D "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-42317] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46904] =3D "fixed-version: Fixed from version 5.12rc7"
+CVE_STATUS[CVE-2024-42318] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46905] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-42319] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46906] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-42320] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46908] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-42321] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46909] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-42322] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46910] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43098] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2021-46911] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43815] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46912] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43816] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46913] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43817] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46914] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43818] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46915] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43819] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46916] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43820] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46917] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43821] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46918] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43822] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46919] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43823] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46920] =3D "fixed-version: Fixed from version 5.12rc8"
+CVE_STATUS[CVE-2024-43824] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46921] =3D "fixed-version: Fixed from version 5.12"
+CVE_STATUS[CVE-2024-43825] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46922] =3D "fixed-version: Fixed from version 5.12"
+CVE_STATUS[CVE-2024-43826] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46923] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43827] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46924] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43828] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46925] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43829] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46926] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-43830] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46927] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43831] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46928] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-43832] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46929] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43833] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46930] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43834] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46931] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43835] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46932] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43836] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46933] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43837] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46934] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43838] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46935] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43839] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46936] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43840] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46937] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-43841] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46938] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43842] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46939] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43843] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46940] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43844] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46941] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43845] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46942] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43846] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46943] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43847] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46944] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43848] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46945] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43849] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46947] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43850] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46948] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43851] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46949] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43852] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46950] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43853] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46951] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43854] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46952] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43855] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46953] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43856] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46954] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43857] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46955] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43858] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46956] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43859] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46957] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43860] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46958] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43861] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46959] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43862] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46960] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43863] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46961] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43864] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46962] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43865] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46963] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43866] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46964] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43867] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46965] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43868] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46966] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43869] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46967] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43870] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46968] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43871] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46969] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43872] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46970] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43873] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46971] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43874] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46972] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43875] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46973] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43876] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46974] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43877] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46976] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43878] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46977] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43879] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46978] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43880] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46979] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43881] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46980] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43882] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46981] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43883] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46982] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43884] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46983] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43886] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46984] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43887] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46985] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43888] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46986] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43889] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46987] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43890] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46988] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43891] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46989] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43892] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46990] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43893] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46991] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43894] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46992] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43895] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46993] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43896] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46994] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43897] =3D "fixed-version: Fixed from version 5.15.167=
"
=20
-CVE_STATUS[CVE-2021-46995] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43899] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46996] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43900] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46997] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43901] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46998] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43902] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-46999] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43904] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47000] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43905] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47001] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43906] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47002] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43907] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47003] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43908] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47004] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43909] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47005] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43910] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47006] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43911] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47007] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43912] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47008] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-43913] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47009] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-43914] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47010] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44931] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47011] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44932] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47012] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44933] =3D "fixed-version: Fixed from version 6.10.5"
=20
-CVE_STATUS[CVE-2021-47013] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44934] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47014] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44935] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47015] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44936] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47016] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44937] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47017] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44938] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47018] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44939] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47019] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44940] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47020] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44941] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47021] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44942] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47022] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44943] =3D "fixed-version: Fixed from version 6.10"
=20
-CVE_STATUS[CVE-2021-47023] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44944] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47024] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44945] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47025] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44946] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47026] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44947] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47027] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44948] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47028] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44949] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47029] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44950] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47030] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44951] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47031] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44953] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47032] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44954] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47033] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44955] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47034] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44956] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47035] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44957] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47036] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44958] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47037] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44959] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47038] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44960] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47039] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44961] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47040] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44962] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47041] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44963] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47042] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44964] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47043] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44965] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47044] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44966] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47045] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44967] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47046] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44968] =3D "fixed-version: Fixed from version 6.1.105"
=20
-CVE_STATUS[CVE-2021-47047] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44969] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47048] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44970] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47049] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44971] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47050] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44972] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47051] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44973] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47052] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44974] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47053] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44975] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47054] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44976] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47055] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44977] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47056] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44978] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47057] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44979] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47058] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44980] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47059] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44981] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47060] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44982] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47061] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44983] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47062] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44984] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47063] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44985] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47064] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44986] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47065] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44987] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47066] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44988] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47067] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44989] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47068] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-44990] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47069] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44991] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47070] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44992] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47071] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44993] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47072] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44994] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47073] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44995] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47074] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44996] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47075] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44997] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47076] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44998] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47077] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-44999] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47078] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-45000] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47079] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-45001] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47080] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-45002] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47081] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-45003] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47082] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45004] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47083] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45005] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47086] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45006] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47087] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45007] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47088] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45008] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47089] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45009] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47090] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45010] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47091] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45011] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47092] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45012] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47093] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45013] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47094] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45014] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47095] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45015] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47096] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45016] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47097] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45017] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47098] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45018] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47099] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45019] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47100] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45020] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47101] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45021] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47102] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45022] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47103] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45023] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47104] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45024] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47105] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45025] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47106] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45026] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47107] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45027] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47108] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-45028] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47109] =3D "fixed-version: Fixed from version 5.13rc7"
+CVE_STATUS[CVE-2024-45029] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47110] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-45030] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47111] =3D "fixed-version: Fixed from version 5.13rc6"
+CVE_STATUS[CVE-2024-45828] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2021-47112] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-46672] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47113] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46673] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47114] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46674] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47116] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46675] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47117] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46676] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47118] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46677] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47119] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46678] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47120] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46679] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47121] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46680] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47122] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46681] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47123] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-46682] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47124] =3D "fixed-version: Fixed from version 5.13rc2"
+CVE_STATUS[CVE-2024-46683] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47125] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46684] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47126] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46685] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47127] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46686] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47128] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46687] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47129] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46688] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47130] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46689] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47131] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46690] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47132] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46691] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47133] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46692] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47134] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46693] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47135] =3D "fixed-version: Fixed from version 5.13rc5"
+CVE_STATUS[CVE-2024-46694] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47136] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46695] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47137] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46696] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47138] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46697] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47139] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46698] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47140] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46699] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47141] =3D "fixed-version: Fixed from version 5.13rc4"
+# CVE-2024-46700 has no known resolution
=20
-CVE_STATUS[CVE-2021-47142] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-46701] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47143] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46702] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47144] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-46703] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47145] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-46704] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47146] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46705] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47147] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46706] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47148] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46707] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47149] =3D "fixed-version: Fixed from version 5.13rc3"
+CVE_STATUS[CVE-2024-46708] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47150] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46709] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47151] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46710] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47152] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46711] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47153] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46712] =3D "fixed-version: Fixed from version 6.10.8"
=20
-CVE_STATUS[CVE-2021-47158] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46713] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47159] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46714] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47160] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46715] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47161] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46716] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47162] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46717] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47163] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46718] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47164] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46719] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47165] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46720] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47166] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46721] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47167] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46722] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47168] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46723] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47169] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46724] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47170] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46725] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47171] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46726] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47172] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46727] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47173] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46728] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47174] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46729] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47175] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46730] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47176] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46731] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47177] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46732] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47178] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46733] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2021-47179] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46734] =3D "fixed-version: Fixed from version 5.15.167=
"
=20
-CVE_STATUS[CVE-2021-47180] =3D "fixed-version: Fixed from version 5.13rc4"
+CVE_STATUS[CVE-2024-46735] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0001] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46736] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0002] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46737] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0168] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46738] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0171] =3D "fixed-version: Fixed from version 5.18rc4"
+CVE_STATUS[CVE-2024-46739] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0185] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46740] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0264] =3D "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-46741] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0286] =3D "fixed-version: Fixed from version 5.14rc2"
+CVE_STATUS[CVE-2024-46742] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0322] =3D "fixed-version: Fixed from version 5.15rc6"
+CVE_STATUS[CVE-2024-46743] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0330] =3D "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46744] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0382] =3D "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2024-46745] =3D "fixed-version: Fixed from version 6.11"
=20
-# CVE-2022-0400 has no known resolution
+CVE_STATUS[CVE-2024-46746] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0433] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46747] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0435] =3D "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-46748] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0480] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-46749] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0487] =3D "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-46750] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0492] =3D "fixed-version: Fixed from version 5.17rc3"
+CVE_STATUS[CVE-2024-46751] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0494] =3D "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2024-46752] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0500] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46753] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0516] =3D "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-46754] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0617] =3D "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46755] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0644] =3D "fixed-version: Fixed from version 5.15rc7"
+CVE_STATUS[CVE-2024-46759] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0646] =3D "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2024-46760] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0742] =3D "fixed-version: Fixed from version 5.17rc7"
+CVE_STATUS[CVE-2024-46761] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0812] =3D "fixed-version: Fixed from version 5.8rc6"
+CVE_STATUS[CVE-2024-46762] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0847] =3D "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-46763] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0850] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-46764] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0854] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46765] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0995] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46766] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-0998] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46767] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1011] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46768] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1012] =3D "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-46769] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1015] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46770] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1016] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46771] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1043] =3D "fixed-version: Fixed from version 5.14rc7"
+CVE_STATUS[CVE-2024-46772] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1048] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46773] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1055] =3D "fixed-version: Fixed from version 5.17rc3"
+CVE_STATUS[CVE-2024-46774] =3D "fixed-version: Fixed from version 6.11"
=20
-# CVE-2022-1116 has no known resolution
+CVE_STATUS[CVE-2024-46775] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1158] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46776] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1184] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46777] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1195] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-46778] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1198] =3D "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-46779] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1199] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46780] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1204] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46781] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1205] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46782] =3D "fixed-version: Fixed from version 6.11"
=20
-# CVE-2022-1247 has no known resolution
+CVE_STATUS[CVE-2024-46783] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1263] =3D "fixed-version: Fixed from version 5.18rc3"
+CVE_STATUS[CVE-2024-46784] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1280] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-46785] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1353] =3D "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-46786] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1419] =3D "fixed-version: Fixed from version 5.6rc2"
+CVE_STATUS[CVE-2024-46787] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1462] =3D "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-46788] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1508] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-46789] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1516] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46790] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1651] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46791] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1652] =3D "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-46792] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1671] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46793] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1678] =3D "fixed-version: Fixed from version 4.20rc1"
+CVE_STATUS[CVE-2024-46794] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1679] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-46795] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1729] =3D "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-46796] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1734] =3D "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-46797] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1786] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-46798] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1789] =3D "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-46799] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1836] =3D "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-46800] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1852] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46801] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1882] =3D "fixed-version: Fixed from version 5.19rc8"
+CVE_STATUS[CVE-2024-46802] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1943] =3D "fixed-version: Fixed from version 5.18rc7"
+CVE_STATUS[CVE-2024-46803] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1966] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46804] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1972] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46805] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1973] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46806] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1974] =3D "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-46807] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1975] =3D "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-46808] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1976] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46809] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-1998] =3D "fixed-version: Fixed from version 5.17rc3"
+CVE_STATUS[CVE-2024-46810] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20008] =3D "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2024-46811] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20132] =3D "fixed-version: Fixed from version 5.16rc5"
+CVE_STATUS[CVE-2024-46812] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20141] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-46813] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20148] =3D "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-46814] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20153] =3D "fixed-version: Fixed from version 5.13rc1"
+CVE_STATUS[CVE-2024-46815] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20154] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-46816] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20158] =3D "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-46817] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20166] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-46818] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20368] =3D "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-46819] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20369] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46820] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20409] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-46821] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20421] =3D "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-46822] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20422] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-46823] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20423] =3D "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-46824] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20424] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-46825] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20565] =3D "fixed-version: Fixed from version 5.9rc4"
+CVE_STATUS[CVE-2024-46826] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20566] =3D "fixed-version: Fixed from version 5.19"
+CVE_STATUS[CVE-2024-46827] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20567] =3D "fixed-version: Fixed from version 4.16rc5"
+CVE_STATUS[CVE-2024-46828] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20568] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-46829] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-20572] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46830] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2078] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46831] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-21123] =3D "fixed-version: Fixed from version 5.19rc3"
+CVE_STATUS[CVE-2024-46832] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-21125] =3D "fixed-version: Fixed from version 5.19rc3"
+CVE_STATUS[CVE-2024-46833] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-21166] =3D "fixed-version: Fixed from version 5.19rc3"
+CVE_STATUS[CVE-2024-46834] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-21385] =3D "fixed-version: Fixed from version 4.20"
+CVE_STATUS[CVE-2024-46835] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-21499] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46836] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-21505] =3D "fixed-version: Fixed from version 5.19rc8"
+CVE_STATUS[CVE-2024-46837] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2153] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46838] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2196] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-46840] =3D "fixed-version: Fixed from version 6.11"
=20
-# CVE-2022-2209 has no known resolution
+CVE_STATUS[CVE-2024-46841] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-22942] =3D "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46842] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-23036] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46843] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-23037] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46844] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-23038] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46845] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-23039] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46846] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-23040] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46847] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-23041] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46848] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-23042] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46849] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2308] =3D "fixed-version: Fixed from version 6.0"
+CVE_STATUS[CVE-2024-46850] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2318] =3D "fixed-version: Fixed from version 5.19rc5"
+CVE_STATUS[CVE-2024-46851] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-23222] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46852] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2327] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-46853] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2380] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-46854] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-23816] =3D "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-46855] =3D "fixed-version: Fixed from version 6.11"
=20
-# CVE-2022-23825 has no known resolution
+CVE_STATUS[CVE-2024-46856] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-23960] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-46857] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-24122] =3D "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46858] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-24448] =3D "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46859] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-24958] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-46860] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-24959] =3D "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-46861] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2503] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-46862] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-25258] =3D "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-46863] =3D "fixed-version: Fixed from version 6.11"
=20
-# CVE-2022-25265 has no known resolution
+CVE_STATUS[CVE-2024-46864] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-25375] =3D "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-46865] =3D "fixed-version: Fixed from version 5.10.227=
"
=20
-CVE_STATUS[CVE-2022-25636] =3D "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-46866] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2585] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-46867] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2586] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-46868] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2588] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-46869] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-2590] =3D "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-46870] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2602] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-46871] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-26365] =3D "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-46896] =3D "fixed-version: Fixed from version 6.12.7"
=20
-CVE_STATUS[CVE-2022-26373] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-47141] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2022-2639] =3D "fixed-version: Fixed from version 5.18rc4"
+CVE_STATUS[CVE-2024-47143] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2022-26490] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-47408] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2022-2663] =3D "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2024-47658] =3D "fixed-version: Fixed from version 6.11"
=20
-# CVE-2022-26878 has no known resolution
+CVE_STATUS[CVE-2024-47659] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-26966] =3D "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-47660] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-27223] =3D "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-47661] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-27666] =3D "fixed-version: Fixed from version 5.17rc8"
+CVE_STATUS[CVE-2024-47662] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-27672] =3D "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2024-47663] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2785] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-47664] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-27950] =3D "fixed-version: Fixed from version 5.17rc5"
+CVE_STATUS[CVE-2024-47665] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-28356] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47666] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-28388] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47667] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-28389] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47668] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-28390] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47669] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2873] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47670] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-28796] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47671] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-28893] =3D "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2024-47672] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2905] =3D "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-47673] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-29156] =3D "fixed-version: Fixed from version 5.17rc6"
+CVE_STATUS[CVE-2024-47674] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2022-2938] =3D "fixed-version: Fixed from version 5.17rc2"
+CVE_STATUS[CVE-2024-47675] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-29581] =3D "fixed-version: Fixed from version 5.18rc4"
+CVE_STATUS[CVE-2024-47676] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-29582] =3D "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2024-47677] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-2959] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47678] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2022-2961 has no known resolution
+CVE_STATUS[CVE-2024-47679] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-2964] =3D "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-47680] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-2977] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47681] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-2978] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47682] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-29900] =3D "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-47683] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-29901] =3D "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-47684] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-2991] =3D "fixed-version: Fixed from version 5.15rc1"
+CVE_STATUS[CVE-2024-47685] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-29968] =3D "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-47686] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3028] =3D "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-47687] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-30594] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47688] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3061] =3D "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-47689] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3077] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47690] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3078] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47691] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3103] =3D "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-47692] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3104] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47693] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3105] =3D "fixed-version: Fixed from version 5.16"
+CVE_STATUS[CVE-2024-47694] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3106] =3D "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-47695] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3107] =3D "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-47696] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3108] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-47697] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3110] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47698] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3111] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47699] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3112] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47700] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3113] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47701] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3114] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47702] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3115] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47703] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3169] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47704] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3170] =3D "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-47705] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3176] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-47706] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3202] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47707] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-32250] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47708] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-32296] =3D "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-47709] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2022-3238 has no known resolution
+CVE_STATUS[CVE-2024-47710] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3239] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-47711] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-32981] =3D "fixed-version: Fixed from version 5.19rc2"
+CVE_STATUS[CVE-2024-47712] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3303] =3D "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2024-47713] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3344] =3D "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-47714] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-33740] =3D "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47715] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-33741] =3D "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47716] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-33742] =3D "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47717] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-33743] =3D "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47718] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-33744] =3D "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47719] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-33981] =3D "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-47720] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3424] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-47721] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3435] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47723] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-34494] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47724] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-34495] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47726] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-34918] =3D "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47727] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3521] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47728] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3522] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47729] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3523] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47730] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3524] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47731] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3526] =3D "fixed-version: Fixed from version 5.18rc3"
+CVE_STATUS[CVE-2024-47732] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3531] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-47733] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3532] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-47734] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2022-3533 has no known resolution
+CVE_STATUS[CVE-2024-47735] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3534] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-47736] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3535] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47737] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3541] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47738] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3542] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47739] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3543] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47740] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2022-3544 has no known resolution
+CVE_STATUS[CVE-2024-47741] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3545] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-47742] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3564] =3D "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-47743] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3565] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47744] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3566] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47745] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3567] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47746] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3577] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-47747] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3586] =3D "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2024-47748] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3594] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47749] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3595] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47750] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2022-3606 has no known resolution
+CVE_STATUS[CVE-2024-47751] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-36123] =3D "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-47752] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3619] =3D "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-47753] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3621] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47754] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3623] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-47756] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3624] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-47757] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3625] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-47794] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2022-3628] =3D "fixed-version: Fixed from version 6.1rc5"
+CVE_STATUS[CVE-2024-47809] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2022-36280] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-48873] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2022-3629] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-48875] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2022-3630] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-48876] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2022-3633] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-48881] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2022-3635] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49568] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2022-3636] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-49569] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2022-3640] =3D "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-49571] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2022-36402] =3D "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2024-49573] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-# CVE-2022-3642 has no known resolution
+CVE_STATUS[CVE-2024-49850] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3643] =3D "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-49851] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3646] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49852] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3649] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49853] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-36879] =3D "fixed-version: Fixed from version 5.19rc8"
+# CVE-2024-49854 has no known resolution
=20
-CVE_STATUS[CVE-2022-36946] =3D "fixed-version: Fixed from version 5.19"
+CVE_STATUS[CVE-2024-49855] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3707] =3D "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2024-49856] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2022-38096 has no known resolution
+CVE_STATUS[CVE-2024-49857] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-38457] =3D "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49858] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3903] =3D "fixed-version: Fixed from version 6.1rc2"
+CVE_STATUS[CVE-2024-49859] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3910] =3D "fixed-version: Fixed from version 6.0rc6"
+CVE_STATUS[CVE-2024-49860] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-39188] =3D "fixed-version: Fixed from version 5.19rc8"
+CVE_STATUS[CVE-2024-49861] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-39189] =3D "fixed-version: Fixed from version 5.19rc2"
+CVE_STATUS[CVE-2024-49862] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-39190] =3D "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-49863] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-3977] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49864] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-39842] =3D "fixed-version: Fixed from version 5.19rc4"
+CVE_STATUS[CVE-2024-49865] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-40133] =3D "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49866] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-40307] =3D "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2024-49867] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-40476] =3D "fixed-version: Fixed from version 5.19rc4"
+CVE_STATUS[CVE-2024-49868] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-40768] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49869] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4095] =3D "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-49870] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-40982] =3D "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-49871] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-41218] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49872] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-41222] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-49873] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4127] =3D "fixed-version: Fixed from version 5.19rc6"
+CVE_STATUS[CVE-2024-49874] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4128] =3D "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-49875] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4129] =3D "fixed-version: Fixed from version 6.1rc6"
+CVE_STATUS[CVE-2024-49876] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4139] =3D "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2024-49877] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-41674] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49878] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2022-41848 has no known resolution
+CVE_STATUS[CVE-2024-49879] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-41849] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49880] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-41850] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49881] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-41858] =3D "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2024-49882] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-42328] =3D "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-49883] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-42329] =3D "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-49884] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-42432] =3D "fixed-version: Fixed from version 6.0rc7"
+CVE_STATUS[CVE-2024-49885] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4269] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49886] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-42703] =3D "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-49887] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-42719] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49888] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-42720] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49889] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-42721] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49890] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-42722] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49891] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-42895] =3D "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-49892] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-42896] =3D "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-49893] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-43750] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49894] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4378] =3D "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-49895] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4379] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49896] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4382] =3D "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-49897] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-43945] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-49898] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-44032] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49899] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-44033] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49900] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-44034] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49901] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2022-4543 has no known resolution
+CVE_STATUS[CVE-2024-49902] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-45869] =3D "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-49903] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2022-45884 has no known resolution
+CVE_STATUS[CVE-2024-49904] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2022-45885 has no known resolution
+CVE_STATUS[CVE-2024-49905] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-45886] =3D "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-49906] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-45887] =3D "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-49907] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-45888] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49908] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-45919] =3D "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-49909] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-45934] =3D "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-49910] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4662] =3D "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-49911] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4696] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-49912] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4744] =3D "fixed-version: Fixed from version 5.16rc7"
+CVE_STATUS[CVE-2024-49913] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47518] =3D "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2024-49914] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47519] =3D "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2024-49915] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47520] =3D "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2024-49916] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47521] =3D "fixed-version: Fixed from version 6.1rc8"
+CVE_STATUS[CVE-2024-49917] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47929] =3D "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49918] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47938] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49919] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47939] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49920] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47940] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-49921] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47941] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49922] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47942] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49923] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47943] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49924] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-47946] =3D "fixed-version: Fixed from version 5.12rc2"
+CVE_STATUS[CVE-2024-49925] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-4842] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49926] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-48423] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49927] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-48424] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49928] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-48425] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49929] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-48502] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49930] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-48619] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-49931] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-48626] =3D "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-49932] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-48627] =3D "fixed-version: Fixed from version 5.19rc7"
+CVE_STATUS[CVE-2024-49933] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-48628] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-49934] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-48629] =3D "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2024-49935] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2022-48630] =3D "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-49936] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0030] =3D "fixed-version: Fixed from version 5.0rc1"
+CVE_STATUS[CVE-2024-49937] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0045] =3D "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2024-49938] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0047] =3D "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-49939] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0122] =3D "fixed-version: Fixed from version 6.0rc4"
+CVE_STATUS[CVE-2024-49940] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0160] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49941] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0179] =3D "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-49942] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0210] =3D "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49943] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0240] =3D "fixed-version: Fixed from version 5.10rc1"
+CVE_STATUS[CVE-2024-49944] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0266] =3D "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49945] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0386] =3D "fixed-version: Fixed from version 6.2rc6"
+CVE_STATUS[CVE-2024-49946] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0394] =3D "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-49947] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0458] =3D "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-49948] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0459] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49949] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0461] =3D "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2024-49950] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0468] =3D "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-49951] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0469] =3D "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-49952] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0590] =3D "fixed-version: Fixed from version 6.1rc2"
+CVE_STATUS[CVE-2024-49953] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0597] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-49954] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-0615] =3D "fixed-version: Fixed from version 6.1rc3"
+CVE_STATUS[CVE-2024-49955] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1032] =3D "fixed-version: Fixed from version 6.3rc2"
+CVE_STATUS[CVE-2024-49956] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1073] =3D "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-49957] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1074] =3D "fixed-version: Fixed from version 6.2rc6"
+CVE_STATUS[CVE-2024-49958] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1075] =3D "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-49959] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1076] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49960] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1077] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49961] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1078] =3D "fixed-version: Fixed from version 6.2rc8"
+CVE_STATUS[CVE-2024-49962] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1079] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49963] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1095] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49964] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1118] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49965] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1192] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49966] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1193] =3D "fixed-version: Fixed from version 6.3rc6"
+CVE_STATUS[CVE-2024-49968] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1194] =3D "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-49969] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1195] =3D "fixed-version: Fixed from version 6.1rc3"
+CVE_STATUS[CVE-2024-49970] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1206] =3D "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-49971] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1249] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-49972] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1252] =3D "fixed-version: Fixed from version 5.16rc1"
+CVE_STATUS[CVE-2024-49973] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1281] =3D "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2024-49974] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1295] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-49975] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1380] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49976] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1382] =3D "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-49977] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1390] =3D "fixed-version: Fixed from version 5.11rc4"
+CVE_STATUS[CVE-2024-49978] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-1476 has no known resolution
+CVE_STATUS[CVE-2024-49979] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1513] =3D "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2024-49980] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1582] =3D "fixed-version: Fixed from version 5.17rc4"
+CVE_STATUS[CVE-2024-49981] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1583] =3D "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-49982] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1611] =3D "fixed-version: Fixed from version 6.3rc5"
+CVE_STATUS[CVE-2024-49983] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1637] =3D "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2024-49984] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1652] =3D "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-49985] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1670] =3D "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-49986] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1829] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49987] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1838] =3D "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-49988] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1855] =3D "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2024-49989] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1859] =3D "fixed-version: Fixed from version 6.3rc7"
+CVE_STATUS[CVE-2024-49990] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1872] =3D "fixed-version: Fixed from version 5.18rc2"
+CVE_STATUS[CVE-2024-49991] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1989] =3D "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-49992] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1990] =3D "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2024-49994] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-1998] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-49995] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2002] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-49996] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2006] =3D "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-49997] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2007] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-49998] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2008] =3D "fixed-version: Fixed from version 5.19rc4"
+CVE_STATUS[CVE-2024-49999] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2019] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-50000] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-20569] =3D "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50001] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-20588] =3D "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50002] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-20593] =3D "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50003] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-20928] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-50004] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-20937 has no known resolution
+CVE_STATUS[CVE-2024-50005] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-20938] =3D "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-50006] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-20941 has no known resolution
+CVE_STATUS[CVE-2024-50007] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-21102] =3D "fixed-version: Fixed from version 6.2rc4"
+CVE_STATUS[CVE-2024-50008] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-21106] =3D "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-50009] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2124] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50010] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-21255] =3D "fixed-version: Fixed from version 6.4rc4"
+CVE_STATUS[CVE-2024-50011] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-21264] =3D "fixed-version: Fixed from version 6.4rc5"
+CVE_STATUS[CVE-2024-50012] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-21400 has no known resolution
+CVE_STATUS[CVE-2024-50013] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2156] =3D "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-50014] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2162] =3D "fixed-version: Fixed from version 6.2rc6"
+CVE_STATUS[CVE-2024-50015] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2163] =3D "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-50016] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2166] =3D "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-50017] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2176] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50019] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2177] =3D "fixed-version: Fixed from version 5.19"
+CVE_STATUS[CVE-2024-50020] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2194] =3D "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50021] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2235] =3D "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2024-50022] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2236] =3D "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-50023] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2248] =3D "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-50024] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2269] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50025] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-22995] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-50026] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-22996] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-50027] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-22997] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50028] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-22998] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-50029] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-22999] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-50030] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-23000] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-50031] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-23001] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-50032] =3D "fixed-version: Fixed from version 6.6.57"
=20
-CVE_STATUS[CVE-2023-23002] =3D "fixed-version: Fixed from version 5.17rc1"
+CVE_STATUS[CVE-2024-50033] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-23003] =3D "fixed-version: Fixed from version 5.16rc6"
+CVE_STATUS[CVE-2024-50034] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-23004] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-50035] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-23005] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50036] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-23006] =3D "fixed-version: Fixed from version 5.16rc8"
+CVE_STATUS[CVE-2024-50037] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-23039 has no known resolution
+CVE_STATUS[CVE-2024-50038] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-23454] =3D "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2024-50039] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-23455] =3D "fixed-version: Fixed from version 6.2rc3"
+CVE_STATUS[CVE-2024-50040] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-23559] =3D "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-50041] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-23586] =3D "fixed-version: Fixed from version 5.12rc1"
+CVE_STATUS[CVE-2024-50042] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2430] =3D "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-50043] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2483] =3D "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50044] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-25012] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50045] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2513] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-50046] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-25775] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50047] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2598] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50048] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-26242 has no known resolution
+CVE_STATUS[CVE-2024-50049] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-2640 has no known resolution
+CVE_STATUS[CVE-2024-50051] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-26544] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50055] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-26545] =3D "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2024-50056] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-26605] =3D "fixed-version: Fixed from version 6.1rc7"
+CVE_STATUS[CVE-2024-50057] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-26606] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50058] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-26607] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-50059] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-28327] =3D "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2024-50060] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-28328] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50061] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-28410] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-50062] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-28464] =3D "fixed-version: Fixed from version 6.3rc7"
+CVE_STATUS[CVE-2024-50063] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-28466] =3D "fixed-version: Fixed from version 6.3rc2"
+CVE_STATUS[CVE-2024-50064] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2860] =3D "fixed-version: Fixed from version 6.0rc5"
+CVE_STATUS[CVE-2024-50065] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-28746] =3D "cpe-stable-backport: Backported in 6.6.22"
+CVE_STATUS[CVE-2024-50066] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-28772] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-50067] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-28866] =3D "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50068] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2898] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50069] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-2985] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50070] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3006] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-50071] =3D "fixed-version: Fixed from version 6.12"
=20
-# Skipping CVE-2023-3022, no affected_versions
+CVE_STATUS[CVE-2024-50072] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-30456] =3D "fixed-version: Fixed from version 6.3rc3"
+CVE_STATUS[CVE-2024-50073] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-30772] =3D "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50074] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3090] =3D "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2024-50075] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3106] =3D "fixed-version: Fixed from version 4.8rc7"
+CVE_STATUS[CVE-2024-50076] =3D "fixed-version: Fixed from version 6.12"
=20
-# Skipping CVE-2023-3108, no affected_versions
+CVE_STATUS[CVE-2024-50077] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-31081 has no known resolution
+CVE_STATUS[CVE-2024-50078] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-31082 has no known resolution
+CVE_STATUS[CVE-2024-50079] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-31083] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50080] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-31084] =3D "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-50081] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-31085] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50082] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3111] =3D "fixed-version: Fixed from version 6.0rc2"
+CVE_STATUS[CVE-2024-50083] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3117] =3D "fixed-version: Fixed from version 6.4rc7"
+CVE_STATUS[CVE-2024-50084] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-31248] =3D "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-50085] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3141] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50086] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-31436] =3D "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-50087] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3159] =3D "fixed-version: Fixed from version 5.18rc6"
+CVE_STATUS[CVE-2024-50088] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3161] =3D "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-50090] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3212] =3D "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2024-50091] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3220] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50092] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-32233] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50093] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-32247] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50094] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-32248] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50095] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-32250] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50096] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-32252] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50097] =3D "fixed-version: Fixed from version 6.6.57"
=20
-CVE_STATUS[CVE-2023-32254] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50098] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-32257] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50099] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-32258] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50100] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-32269] =3D "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-50101] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-32629 has no known resolution
+CVE_STATUS[CVE-2024-50102] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3268] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50103] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3269] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50104] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3312] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50105] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3317] =3D "fixed-version: Fixed from version 6.3rc6"
+CVE_STATUS[CVE-2024-50106] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-33203] =3D "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50107] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-33250] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50108] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-33288] =3D "fixed-version: Fixed from version 6.3rc4"
+CVE_STATUS[CVE-2024-50109] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3338] =3D "fixed-version: Fixed from version 6.1rc1"
+CVE_STATUS[CVE-2024-50110] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3355] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50111] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3357] =3D "fixed-version: Fixed from version 6.2rc1"
+CVE_STATUS[CVE-2024-50112] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3358] =3D "fixed-version: Fixed from version 6.2rc5"
+CVE_STATUS[CVE-2024-50113] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3359] =3D "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-50114] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3389] =3D "fixed-version: Fixed from version 6.0rc1"
+CVE_STATUS[CVE-2024-50115] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3390] =3D "fixed-version: Fixed from version 6.4rc7"
+CVE_STATUS[CVE-2024-50116] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-33951] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50117] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-33952] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50118] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-3397 has no known resolution
+CVE_STATUS[CVE-2024-50119] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-34255] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50120] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-34256] =3D "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2024-50121] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-34319] =3D "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50122] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-34324] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50123] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3439] =3D "fixed-version: Fixed from version 5.18rc5"
+CVE_STATUS[CVE-2024-50124] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-35001] =3D "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-50125] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3567] =3D "fixed-version: Fixed from version 6.2rc7"
+CVE_STATUS[CVE-2024-50126] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-35693 has no known resolution
+CVE_STATUS[CVE-2024-50127] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-35788] =3D "fixed-version: Fixed from version 6.4rc5"
+CVE_STATUS[CVE-2024-50128] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-35823] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50129] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-35824] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50130] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-35826] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50131] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-35827] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50132] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-35828] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50133] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-35829] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50134] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3609] =3D "fixed-version: Fixed from version 6.4rc7"
+CVE_STATUS[CVE-2024-50135] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3610] =3D "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-50136] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3611] =3D "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-50137] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-3640 has no known resolution
+CVE_STATUS[CVE-2024-50138] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-37453] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50139] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-37454 has no known resolution
+CVE_STATUS[CVE-2024-50140] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3772] =3D "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50141] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3773] =3D "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50142] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3776] =3D "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-50143] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3777] =3D "fixed-version: Fixed from version 6.5rc3"
+CVE_STATUS[CVE-2024-50144] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3812] =3D "fixed-version: Fixed from version 6.1rc4"
+CVE_STATUS[CVE-2024-50145] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-38409] =3D "fixed-version: Fixed from version 6.3rc7"
+CVE_STATUS[CVE-2024-50146] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-38426] =3D "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-50147] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-38427] =3D "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-50148] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-38428] =3D "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-50149] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-38429] =3D "fixed-version: Fixed from version 6.4rc3"
+CVE_STATUS[CVE-2024-50150] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-38430] =3D "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-50151] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-38431] =3D "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-50152] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-38432] =3D "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-50153] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3863] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50154] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3865] =3D "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-50155] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3866] =3D "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-50156] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-3867] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50157] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-39189] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50158] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-39191] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50159] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-39192] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50160] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-39193] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50161] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-39194] =3D "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50162] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-39197] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50163] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-39198] =3D "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50164] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4004] =3D "fixed-version: Fixed from version 6.5rc3"
+CVE_STATUS[CVE-2024-50165] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-4010 has no known resolution
+CVE_STATUS[CVE-2024-50166] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4015] =3D "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50167] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-40283] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50168] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-40791] =3D "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50169] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4128] =3D "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50170] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4132] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50171] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4133] =3D "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2024-50172] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4134] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50173] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4147] =3D "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50174] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4155] =3D "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50175] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4194] =3D "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50176] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4206] =3D "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50177] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4207] =3D "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50178] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4208] =3D "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50179] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4244] =3D "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50180] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4273] =3D "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-50181] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-42752] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50182] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-42753] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50183] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-42754] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-50184] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-42755] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50185] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-42756] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-50186] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4385] =3D "fixed-version: Fixed from version 5.19rc1"
+CVE_STATUS[CVE-2024-50187] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4387] =3D "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-50188] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4389] =3D "fixed-version: Fixed from version 5.18rc3"
+CVE_STATUS[CVE-2024-50189] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4394] =3D "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-50190] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-44466] =3D "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-50191] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4459] =3D "fixed-version: Fixed from version 5.18"
+CVE_STATUS[CVE-2024-50192] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4563] =3D "fixed-version: Fixed from version 6.5rc6"
+CVE_STATUS[CVE-2024-50193] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4569] =3D "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-50194] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-45862] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50195] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-45863] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50196] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-45871] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50197] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-45898] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50198] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4610] =3D "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-50199] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4611] =3D "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50200] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4622] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50201] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4623] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50202] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-46343] =3D "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-50203] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-46813] =3D "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-50204] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-46838] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50205] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-46862] =3D "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2024-50206] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-47233] =3D "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-50207] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4732] =3D "fixed-version: Fixed from version 5.14rc1"
+CVE_STATUS[CVE-2024-50208] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4881] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50209] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-4921] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50210] =3D "fixed-version: Fixed from version 5.10.229=
"
=20
-CVE_STATUS[CVE-2023-50431] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50211] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-5090] =3D "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-50212] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-51042] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-50213] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-51043] =3D "fixed-version: Fixed from version 6.5rc3"
+CVE_STATUS[CVE-2024-50214] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-5158] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50215] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-51779] =3D "cpe-stable-backport: Backported in 6.6.9"
+CVE_STATUS[CVE-2024-50216] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-5178] =3D "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-50217] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-51780] =3D "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-50218] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-51781] =3D "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-50220] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-51782] =3D "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-50221] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-5197] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-50222] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52340] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-50223] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52429] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-50224] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52433] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50225] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52434] =3D "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-50226] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52435] =3D "cpe-stable-backport: Backported in 6.6.11"
+CVE_STATUS[CVE-2024-50227] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52436] =3D "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-50229] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52438] =3D "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-50230] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52439] =3D "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-50231] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52440] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50232] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52441] =3D "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50233] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52442] =3D "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-50234] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52443] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50235] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52444] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50236] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52445] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50237] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52446] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50238] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52447] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50239] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52448] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50240] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52449] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50241] =3D "fixed-version: Fixed from version 6.11.7"
=20
-CVE_STATUS[CVE-2023-52450] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50242] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52451] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50243] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52452] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50244] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52453] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50245] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52454] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50246] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52455] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50247] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52456] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50248] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52457] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50249] =3D "fixed-version: Fixed from version 5.15.171=
"
=20
-CVE_STATUS[CVE-2023-52458] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50250] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52459] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50251] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52460] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-50252] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52461] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-50253] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52462] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50254] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52463] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50255] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52464] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50256] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52465] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50257] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52467] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50258] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52468] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50259] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52469] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50260] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52470] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50261] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52471] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-50262] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52472] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50263] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52473] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-50264] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52474] =3D "fixed-version: Fixed from version 6.4rc1"
+CVE_STATUS[CVE-2024-50265] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52475] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50266] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52476] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50267] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52477] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50268] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52478] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50269] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52479] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50270] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52480] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50271] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52481] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50272] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52482] =3D "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-50273] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52483] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50274] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52484] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50275] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-52485 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-50276] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52486] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50277] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52487] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50278] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52488] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50279] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52489] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50280] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52490] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50281] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52491] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50282] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52492] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50283] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52493] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50284] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52494] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50285] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52495] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50286] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52497] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50287] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52498] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-50288] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52499] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50289] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52500] =3D "fixed-version: Fixed from version 6.6rc2"
+CVE_STATUS[CVE-2024-50290] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52501] =3D "fixed-version: Fixed from version 6.6rc2"
+CVE_STATUS[CVE-2024-50291] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52502] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50292] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52503] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50293] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52504] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50294] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52505] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50295] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52506] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-50296] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52507] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50297] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52508] =3D "fixed-version: Fixed from version 6.6rc2"
+CVE_STATUS[CVE-2024-50298] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52509] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50299] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52510] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50300] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52511] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-50301] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52512] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-50302] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52513] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50303] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52515] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-50304] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52516] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-51729] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2023-52517] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-52319] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2023-52518] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-52332] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52519] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53042] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52520] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53043] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52522] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53044] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52523] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53045] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52524] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53046] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52525] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53047] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52526] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53048] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52527] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53049] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52528] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53050] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52529] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53051] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52530] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53052] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52531] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53053] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52532] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53055] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52559] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-53056] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52560] =3D "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53057] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52561] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-53058] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52562] =3D "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53059] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52563] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53060] =3D "fixed-version: Fixed from version 4.19.324=
"
=20
-CVE_STATUS[CVE-2023-52564] =3D "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53061] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52565] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53062] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52566] =3D "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53063] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52567] =3D "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53064] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52568] =3D "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53065] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52569] =3D "fixed-version: Fixed from version 6.6rc2"
+CVE_STATUS[CVE-2024-53066] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52570] =3D "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53067] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52571] =3D "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-53068] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52572] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53069] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52573] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53070] =3D "fixed-version: Fixed from version 5.15.172=
"
=20
-CVE_STATUS[CVE-2023-52574] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53071] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52575] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53072] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52576] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53073] =3D "fixed-version: Fixed from version 6.11.7"
=20
-CVE_STATUS[CVE-2023-52577] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53074] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52578] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53075] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52580] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53076] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52581] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53077] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52582] =3D "fixed-version: Fixed from version 6.6rc3"
+CVE_STATUS[CVE-2024-53078] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52583] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53079] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52584] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53080] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-52585 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-53081] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-52586 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-53082] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52587] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53083] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52588] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53084] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52589] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53085] =3D "fixed-version: Fixed from version 6.12"
=20
-# CVE-2023-52590 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-53086] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52591] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53087] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52593] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53088] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52594] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53089] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52595] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53090] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52596] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53091] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52597] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53092] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52598] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53093] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52599] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53094] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52600] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53095] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52601] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53096] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52602] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53097] =3D "fixed-version: Fixed from version 5.10.230=
"
=20
-CVE_STATUS[CVE-2023-52603] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53098] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52604] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53099] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52606] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53100] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52607] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53101] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52608] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-53103] =3D "cpe-stable-backport: Backported in 6.12.1"
=20
-CVE_STATUS[CVE-2023-52609] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-53104] =3D "cpe-stable-backport: Backported in 6.12.1"
=20
-CVE_STATUS[CVE-2023-52610] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-53105] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52611] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-53106] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52612] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-53107] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52613] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-53108] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52614] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-53109] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52615] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-53110] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52616] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-53111] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52617] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53112] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52618] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53113] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52619] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-53114] =3D "fixed-version: Fixed from version 6.12"
=20
-CVE_STATUS[CVE-2023-52620] =3D "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2024-53115] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53116] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53117] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53118] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53119] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53120] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53121] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53122] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53123] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53124] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53125] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53126] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53127] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53128] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53129] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53130] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53131] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53132] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53133] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53134] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53135] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53136] =3D "fixed-version: Fixed from version 4.19.325=
"
+
+CVE_STATUS[CVE-2024-53137] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53138] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53139] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53140] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53141] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53142] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53143] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53144] =3D "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-53145] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53146] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53147] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53148] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53149] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53150] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53151] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53152] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53153] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53154] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53155] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53156] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53157] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53158] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53160] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53161] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53162] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53163] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53164] =3D "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-53165] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53166] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53167] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53168] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53169] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53170] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53171] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53172] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53173] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53174] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53175] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53176] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53177] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53178] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53179] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53180] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53181] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53182] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53183] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53184] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53185] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53186] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53187] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53188] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53189] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53190] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53191] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53192] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53193] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53194] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53195] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53196] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53197] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53198] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53199] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53200] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53201] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53202] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53203] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53204] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53205] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53206] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53207] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53208] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53209] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53210] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53211] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53212] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53213] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53214] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53215] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53216] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53217] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53218] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53219] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53220] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53221] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53222] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53223] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53224] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53225] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53226] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53227] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53228] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53229] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53230] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53231] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53232] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53233] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53234] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53235] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53236] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53237] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53238] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53239] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-53240] =3D "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-53241] =3D "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-53680] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-53681] =3D "cpe-stable-backport: Backported in 6.12.9"
+
+CVE_STATUS[CVE-2024-53682] =3D "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-53685] =3D "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-53687] =3D "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-53690] =3D "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-54031] =3D "fixed-version: Fixed from version 6.12.9"
+
+CVE_STATUS[CVE-2024-54191] =3D "fixed-version: Fixed from version 6.12.6"
+
+CVE_STATUS[CVE-2024-54193] =3D "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-54455] =3D "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-54460] =3D "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-54680] =3D "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-54683] =3D "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-55639] =3D "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-55641] =3D "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-55642] =3D "cpe-stable-backport: Backported in 6.12.6"
+
+CVE_STATUS[CVE-2024-55881] =3D "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-55916] =3D "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-56368] =3D "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-56369] =3D "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-56372] =3D "cpe-stable-backport: Backported in 6.12.7"
+
+CVE_STATUS[CVE-2024-56531] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56532] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56533] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56534] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56535] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56536] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56537] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56538] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56539] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56540] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56541] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56542] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56543] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56544] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56545] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56546] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56547] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56548] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56549] =3D "cpe-stable-backport: Backported in 6.12.2"
+
+CVE_STATUS[CVE-2024-56550] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56551] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56552] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56553] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56554] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56555] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56556] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56557] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56558] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56559] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56560] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56561] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56562] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56563] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56564] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56565] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56566] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56567] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56568] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56569] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56570] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56572] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56573] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56574] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56575] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56576] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56577] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56578] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56579] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56580] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56581] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56582] =3D "cpe-stable-backport: Backported in 6.12.4"
+
+CVE_STATUS[CVE-2024-56583] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56584] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56585] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56586] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56587] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56588] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56589] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56590] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56591] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56592] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56593] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56594] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56595] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56596] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56597] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56598] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56599] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56600] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56601] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56602] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56603] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56604] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56605] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56606] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56607] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56608] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56609] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56610] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56611] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56612] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56613] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56614] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56615] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56616] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56617] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56618] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56619] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56620] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56621] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56622] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56623] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56624] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56625] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56626] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56627] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56628] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56629] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56630] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56631] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56632] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56633] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56634] =3D "cpe-stable-backport: Backported in 6.12.5"
+
+CVE_STATUS[CVE-2024-56635] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52621] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56636] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52622] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56637] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52623] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56638] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-# CVE-2023-52624 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-56639] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-# CVE-2023-52625 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-56640] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52626] =3D "fixed-version: only affects 6.7rc2 onwards=
"
+CVE_STATUS[CVE-2024-56641] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52627] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56642] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52628] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-56643] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52629] =3D "fixed-version: Fixed from version 6.6rc1"
+CVE_STATUS[CVE-2024-56644] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52630] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56645] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52631] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56646] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52632] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56647] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52633] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56648] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-# CVE-2023-52634 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-56649] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52635] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56650] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52636] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56651] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2023-52637] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56652] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-52638] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56653] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-52639] =3D "cpe-stable-backport: Backported in 6.6.22"
+CVE_STATUS[CVE-2024-56654] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-52640] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-56655] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-52641] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-56656] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-5345] =3D "fixed-version: Fixed from version 6.6rc4"
+CVE_STATUS[CVE-2024-56657] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-5633] =3D "fixed-version: Fixed from version 6.6rc6"
+CVE_STATUS[CVE-2024-56658] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-5717] =3D "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-56659] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-5972] =3D "fixed-version: Fixed from version 6.6rc7"
+CVE_STATUS[CVE-2024-56660] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6039] =3D "fixed-version: Fixed from version 6.5rc5"
+CVE_STATUS[CVE-2024-56661] =3D "fixed-version: Fixed from version 6.12.6"
=20
-CVE_STATUS[CVE-2023-6040] =3D "fixed-version: Fixed from version 5.18rc1"
+CVE_STATUS[CVE-2024-56662] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6111] =3D "cpe-stable-backport: Backported in 6.6.3"
+CVE_STATUS[CVE-2024-56663] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6121] =3D "cpe-stable-backport: Backported in 6.6.4"
+CVE_STATUS[CVE-2024-56664] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6176] =3D "fixed-version: Fixed from version 6.6rc2"
+CVE_STATUS[CVE-2024-56665] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6200] =3D "cpe-stable-backport: Backported in 6.6.9"
+CVE_STATUS[CVE-2024-56666] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-# CVE-2023-6238 has no known resolution
+CVE_STATUS[CVE-2024-56667] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-# CVE-2023-6240 has no known resolution
+CVE_STATUS[CVE-2024-56668] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6270] =3D "cpe-stable-backport: Backported in 6.6.23"
+CVE_STATUS[CVE-2024-56669] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6356] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56670] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6531] =3D "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56671] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-# CVE-2023-6535 has no known resolution
+CVE_STATUS[CVE-2024-56672] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6536] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56673] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6546] =3D "fixed-version: Fixed from version 6.5rc7"
+CVE_STATUS[CVE-2024-56674] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6560] =3D "cpe-stable-backport: Backported in 6.6.5"
+CVE_STATUS[CVE-2024-56675] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2023-6606] =3D "cpe-stable-backport: Backported in 6.6.9"
+CVE_STATUS[CVE-2024-56676] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2023-6610] =3D "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-56677] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2023-6622] =3D "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56678] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2023-6679] =3D "fixed-version: only affects 6.7rc1 onwards"
+CVE_STATUS[CVE-2024-56679] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2023-6817] =3D "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56680] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2023-6915] =3D "cpe-stable-backport: Backported in 6.6.13"
+CVE_STATUS[CVE-2024-56681] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2023-6931] =3D "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56682] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2023-6932] =3D "cpe-stable-backport: Backported in 6.6.5"
+CVE_STATUS[CVE-2024-56683] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2023-7042] =3D "cpe-stable-backport: Backported in 6.6.23"
+CVE_STATUS[CVE-2024-56684] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2023-7192] =3D "fixed-version: Fixed from version 6.3rc1"
+CVE_STATUS[CVE-2024-56685] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0193] =3D "cpe-stable-backport: Backported in 6.6.10"
+CVE_STATUS[CVE-2024-56687] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0340] =3D "fixed-version: Fixed from version 6.4rc6"
+CVE_STATUS[CVE-2024-56688] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0443] =3D "fixed-version: Fixed from version 6.4rc7"
+CVE_STATUS[CVE-2024-56689] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0562] =3D "fixed-version: Fixed from version 6.0rc3"
+CVE_STATUS[CVE-2024-56690] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-# CVE-2024-0564 has no known resolution
+CVE_STATUS[CVE-2024-56691] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0565] =3D "cpe-stable-backport: Backported in 6.6.8"
+CVE_STATUS[CVE-2024-56692] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0582] =3D "cpe-stable-backport: Backported in 6.6.5"
+CVE_STATUS[CVE-2024-56693] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0584] =3D "cpe-stable-backport: Backported in 6.6.5"
+CVE_STATUS[CVE-2024-56694] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0607] =3D "cpe-stable-backport: Backported in 6.6.3"
+CVE_STATUS[CVE-2024-56695] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0639] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-56696] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0641] =3D "fixed-version: Fixed from version 6.6rc5"
+CVE_STATUS[CVE-2024-56697] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0646] =3D "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56698] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0775] =3D "fixed-version: Fixed from version 6.4rc2"
+CVE_STATUS[CVE-2024-56699] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-0841] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56700] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-1085] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56701] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-1086] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56702] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-1151] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56703] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-1312] =3D "fixed-version: Fixed from version 6.5rc4"
+CVE_STATUS[CVE-2024-56704] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-# CVE-2024-21803 has no known resolution
+CVE_STATUS[CVE-2024-56705] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-# CVE-2024-2193 has no known resolution
+CVE_STATUS[CVE-2024-56706] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-22099] =3D "cpe-stable-backport: Backported in 6.6.23"
+CVE_STATUS[CVE-2024-56707] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-# CVE-2024-22386 has no known resolution
+CVE_STATUS[CVE-2024-56708] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-22705] =3D "cpe-stable-backport: Backported in 6.6.10"
+CVE_STATUS[CVE-2024-56709] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2024-23196] =3D "fixed-version: Fixed from version 6.5rc1"
+CVE_STATUS[CVE-2024-56710] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2024-23307] =3D "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-56711] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-# CVE-2024-23848 has no known resolution
+CVE_STATUS[CVE-2024-56712] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2024-23849] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56713] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2024-23850] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56714] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2024-23851] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56715] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2024-24855] =3D "fixed-version: Fixed from version 6.5rc2"
+CVE_STATUS[CVE-2024-56716] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-# CVE-2024-24857 has no known resolution
+CVE_STATUS[CVE-2024-56717] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-# CVE-2024-24858 has no known resolution
+CVE_STATUS[CVE-2024-56718] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-# CVE-2024-24859 has no known resolution
+CVE_STATUS[CVE-2024-56719] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2024-24860] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56720] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-24861] =3D "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-56721] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-# CVE-2024-24864 has no known resolution
+CVE_STATUS[CVE-2024-56722] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-# CVE-2024-25739 has no known resolution
+CVE_STATUS[CVE-2024-56723] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-# CVE-2024-25740 has no known resolution
+CVE_STATUS[CVE-2024-56724] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-# CVE-2024-25741 has no known resolution
+CVE_STATUS[CVE-2024-56725] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-25744] =3D "cpe-stable-backport: Backported in 6.6.7"
+CVE_STATUS[CVE-2024-56726] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26581] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56727] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26582] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56728] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26583] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56729] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26584] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56730] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26585] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56739] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26586] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56740] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26587] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56741] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26588] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56742] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26589] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56743] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26590] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56744] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26591] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56745] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26592] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56746] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26593] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56747] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26594] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56748] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26595] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56749] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-# CVE-2024-26596 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-56750] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26597] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56751] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26598] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56752] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26599] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56753] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26600] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56754] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26601] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-56755] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26602] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56756] =3D "cpe-stable-backport: Backported in 6.12.2"
=20
-CVE_STATUS[CVE-2024-26603] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56757] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26604] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56758] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26605] =3D "fixed-version: only affects 6.7 onwards"
+CVE_STATUS[CVE-2024-56759] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26606] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-56760] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26607] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56761] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26608] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56763] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26610] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56764] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26611] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56765] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26612] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56766] =3D "fixed-version: Fixed from version 6.12.8"
=20
-CVE_STATUS[CVE-2024-26614] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56767] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26615] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56768] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26616] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56769] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26617] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-56770] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2024-26618] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56771] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26619] =3D "fixed-version: only affects 6.7rc5 onwards=
"
+CVE_STATUS[CVE-2024-56772] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26620] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56773] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26621] =3D "fixed-version: only affects 6.7 onwards"
+CVE_STATUS[CVE-2024-56774] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26622] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2024-56775] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26623] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56776] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26625] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56777] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26626] =3D "fixed-version: only affects 6.8rc1 onwards=
"
+CVE_STATUS[CVE-2024-56778] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26627] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-56779] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26629] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56780] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26630] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2024-56781] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26631] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56782] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26632] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56783] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26633] =3D "cpe-stable-backport: Backported in 6.6.14"
+CVE_STATUS[CVE-2024-56784] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26634] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56785] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26635] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56786] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26636] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-56787] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26637] =3D "fixed-version: only affects 6.7 onwards"
+CVE_STATUS[CVE-2024-56788] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2024-26638] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57791] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2024-26639] =3D "fixed-version: only affects 6.8rc1 onwards=
"
+CVE_STATUS[CVE-2024-57792] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26640] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-57793] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26641] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-57795] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26642] =3D "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-57798] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26643] =3D "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-57799] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26644] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57800] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26645] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57801] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26646] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57802] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26647] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57804] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26648] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57805] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26649] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57806] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26650] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57807] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26651] =3D "cpe-stable-backport: Backported in 6.6.23"
+CVE_STATUS[CVE-2024-57809] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26652] =3D "cpe-stable-backport: Backported in 6.6.22"
+CVE_STATUS[CVE-2024-57838] =3D "cpe-stable-backport: Backported in 6.12.4"
=20
-CVE_STATUS[CVE-2024-26653] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57839] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26654] =3D "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-57841] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-# CVE-2024-26655 needs backporting (fixed from 6.9rc2)
+CVE_STATUS[CVE-2024-57843] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26656] =3D "cpe-stable-backport: Backported in 6.6.24"
+CVE_STATUS[CVE-2024-57844] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26657] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57849] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-# CVE-2024-26658 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-57850] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26659] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57857] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26660] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57872] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26661] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57874] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26662] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57875] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26663] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57876] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26664] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57877] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26665] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57878] =3D "cpe-stable-backport: Backported in 6.12.5"
=20
-CVE_STATUS[CVE-2024-26666] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57879] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2024-26667] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57880] =3D "cpe-stable-backport: Backported in 6.12.6"
=20
-CVE_STATUS[CVE-2024-26668] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57881] =3D "cpe-stable-backport: Backported in 6.12.7"
=20
-CVE_STATUS[CVE-2024-26669] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57882] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26670] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2024-57883] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26671] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-57884] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-# CVE-2024-26672 needs backporting (fixed from 6.8rc1)
+CVE_STATUS[CVE-2024-57885] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26673] =3D "cpe-stable-backport: Backported in 6.6.16"
+CVE_STATUS[CVE-2024-57886] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26674] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57887] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26675] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57888] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26676] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57889] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26677] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57890] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26678] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57891] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26679] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57892] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26680] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57893] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26681] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57894] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26682] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57895] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26683] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57896] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26684] =3D "cpe-stable-backport: Backported in 6.6.17"
+CVE_STATUS[CVE-2024-57897] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26685] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57898] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-# CVE-2024-26686 needs backporting (fixed from 6.8rc4)
+CVE_STATUS[CVE-2024-57899] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26687] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57900] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26688] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57901] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26689] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57902] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26690] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57903] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26691] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57904] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26692] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57905] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26693] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57906] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26694] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57907] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26695] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57908] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26696] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57909] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26697] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57910] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26698] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57911] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-# CVE-2024-26699 needs backporting (fixed from 6.8rc5)
+CVE_STATUS[CVE-2024-57912] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26700] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57913] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26702] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57914] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26703] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57916] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26704] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57917] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26705] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57918] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26706] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57919] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26707] =3D "cpe-stable-backport: Backported in 6.6.18"
+# CVE-2024-57920 has no known resolution
=20
-CVE_STATUS[CVE-2024-26708] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57921] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26709] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57922] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26710] =3D "fixed-version: only affects 6.8rc1 onwards=
"
+CVE_STATUS[CVE-2024-57923] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26711] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57924] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26712] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57925] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26713] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57926] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26714] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57927] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26715] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57928] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26716] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57929] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26717] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57930] =3D "fixed-version: Fixed from version 6.12.9"
=20
-CVE_STATUS[CVE-2024-26718] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57931] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26719] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57932] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26720] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57933] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26721] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57934] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26722] =3D "fixed-version: only affects 6.7rc5 onwards=
"
+CVE_STATUS[CVE-2024-57935] =3D "fixed-version: Fixed from version 6.12.9"
=20
-CVE_STATUS[CVE-2024-26723] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57936] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26724] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57938] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26725] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57939] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26726] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57940] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26727] =3D "cpe-stable-backport: Backported in 6.6.18"
+CVE_STATUS[CVE-2024-57941] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26728] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57942] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26729] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57943] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26730] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57944] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26731] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57945] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26732] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2024-57946] =3D "cpe-stable-backport: Backported in 6.12.8"
=20
-CVE_STATUS[CVE-2024-26733] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57947] =3D "fixed-version: Fixed from version 6.11"
=20
-CVE_STATUS[CVE-2024-26734] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57948] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26735] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57949] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26736] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57950] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
-CVE_STATUS[CVE-2024-26737] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57951] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26738] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2024-57952] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
-CVE_STATUS[CVE-2024-26739] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21629] =3D "cpe-stable-backport: Backported in 6.12.9"
=20
-CVE_STATUS[CVE-2024-26740] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21631] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26741] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21632] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26742] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21633] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26743] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21634] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26744] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21635] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26745] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21636] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26746] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21637] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26747] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21638] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26748] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21639] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26749] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21640] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26750] =3D "fixed-version: only affects 6.8rc5 onwards=
"
+CVE_STATUS[CVE-2025-21641] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26751] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21642] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26752] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21643] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26753] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21644] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26754] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21645] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26755] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2025-21646] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-# CVE-2024-26756 needs backporting (fixed from 6.8rc6)
+CVE_STATUS[CVE-2025-21647] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-# CVE-2024-26757 needs backporting (fixed from 6.8rc6)
+CVE_STATUS[CVE-2025-21648] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-# CVE-2024-26758 needs backporting (fixed from 6.8rc6)
+CVE_STATUS[CVE-2025-21649] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26759] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21650] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26760] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21651] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26761] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21652] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26762] =3D "fixed-version: only affects 6.7rc1 onwards=
"
+CVE_STATUS[CVE-2025-21653] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26763] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21654] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26764] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21655] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26765] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21656] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26766] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21657] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26767] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21658] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26768] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21659] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26769] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21660] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26770] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21661] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26771] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21662] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26772] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21663] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26773] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21664] =3D "cpe-stable-backport: Backported in 6.12.10=
"
=20
-CVE_STATUS[CVE-2024-26774] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21665] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26775] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21666] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26776] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21667] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26777] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21668] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26778] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21669] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26779] =3D "cpe-stable-backport: Backported in 6.6.19"
+CVE_STATUS[CVE-2025-21670] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26780] =3D "fixed-version: only affects 6.8rc4 onwards=
"
+CVE_STATUS[CVE-2025-21671] =3D "fixed-version: Fixed from version 6.12.11"
=20
-CVE_STATUS[CVE-2024-26781] =3D "fixed-version: only affects 6.8rc6 onwards=
"
+CVE_STATUS[CVE-2025-21672] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26782] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21673] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26783] =3D "cpe-stable-backport: Backported in 6.6.22"
+CVE_STATUS[CVE-2025-21674] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-# CVE-2024-26784 needs backporting (fixed from 6.8rc7)
+CVE_STATUS[CVE-2025-21675] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-# CVE-2024-26785 needs backporting (fixed from 6.8rc7)
+CVE_STATUS[CVE-2025-21676] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26786] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21677] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26787] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21678] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26788] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21679] =3D "fixed-version: Fixed from version 6.12.11"
=20
-CVE_STATUS[CVE-2024-26789] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21680] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26790] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21681] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26791] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21682] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26792] =3D "fixed-version: only affects 6.8rc4 onwards=
"
+CVE_STATUS[CVE-2025-21683] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26793] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21684] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26794] =3D "fixed-version: only affects 6.8rc6 onwards=
"
+CVE_STATUS[CVE-2025-21685] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26795] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21686] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
-CVE_STATUS[CVE-2024-26796] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21687] =3D "cpe-stable-backport: Backported in 6.12.14=
"
=20
-# CVE-2024-26797 needs backporting (fixed from 6.8rc7)
+CVE_STATUS[CVE-2025-21688] =3D "fixed-version: only affects 6.13 onwards"
=20
-CVE_STATUS[CVE-2024-26798] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21689] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
-CVE_STATUS[CVE-2024-26799] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21690] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
-CVE_STATUS[CVE-2024-26800] =3D "fixed-version: only affects 6.8rc5 onwards=
"
+CVE_STATUS[CVE-2025-21691] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
-CVE_STATUS[CVE-2024-26801] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21692] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
-CVE_STATUS[CVE-2024-26802] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21693] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
-CVE_STATUS[CVE-2024-26803] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21694] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26804] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21695] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26805] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21696] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-# CVE-2024-26806 needs backporting (fixed from 6.8rc7)
+CVE_STATUS[CVE-2025-21697] =3D "cpe-stable-backport: Backported in 6.12.11=
"
=20
-CVE_STATUS[CVE-2024-26807] =3D "cpe-stable-backport: Backported in 6.6.21"
+CVE_STATUS[CVE-2025-21699] =3D "cpe-stable-backport: Backported in 6.12.12=
"
=20
-CVE_STATUS[CVE-2024-26808] =3D "cpe-stable-backport: Backported in 6.6.15"
+CVE_STATUS[CVE-2025-21700] =3D "cpe-stable-backport: Backported in 6.12.13=
"
=20
-CVE_STATUS[CVE-2024-26809] =3D "cpe-stable-backport: Backported in 6.6.23"
+CVE_STATUS[CVE-2025-21701] =3D "cpe-stable-backport: Backported in 6.12.13=
"
=20

