Return-Path: <mark.hatle@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7674AC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 20:12:31 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.82])
 by mx.groups.io with SMTP id smtpd.web11.4711.1716581541010427960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 13:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=FtYl582k;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.82, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmnDsgY6ZvFDAUngvCMTIxcC1JpMKk+Dd5JPntX/+eqNJbN8swR8YZNOA2S0fDtmKLDdyI7Tve8/BsDJaFWmpnqIiETrVl4SgXdRh+vSH62Y37mnB4O1EBQPNPeerOAUSauY9v0W+FcAqgI4UH6s/FLfzDKMmZye385itDiqayM2Hb6sCx9cXJ7EPA2rbhLirhN8cKHNpGQk8RfCZp5BJb3RAHeVJUWHU35hvdxc2R1Tmv0WwZI4gEaxC7xYjA1R0gcB0ywMT6txIDs6TMgOd1nGXI425gTQIP0k3dF2rjG6u8LsalvN5frZ4lV7c9ceShqv1zLbge07ZD41EKcEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNOw0M9JR3memIhBCpoDBam6PF+fqXoxAPpEw38yAec=;
 b=VTYdWcda7cgIDmS54FWZIluXBUbSy98e927Rl205w6/Ifz8+BoEXQHyJWL5sHIoDZBACgiAoggtPrW+PKbkLC8GpCRi5Vt5mqlL+MUw3akv8fKPuUA3sVlxixtc37HtF3o7QYrbg7S5oPk1+BOb0m56Hg6qibeIUqPeapMUc4XxxS6EhpxMiEDb2d/4msizdW+nlxW75s/FyOj3e4HK2DTJUIRHM/QaH20JDL50ERq3XQLABjqrNxaQylpFKscUO5cDz8fgPZpw4ciP/7DXmuLhgF8ljl/sOP8QXSiWwWdzux4u1qSOxQTKW/7eARxF2Dg3w+Q7ri5eegfCfUaTB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNOw0M9JR3memIhBCpoDBam6PF+fqXoxAPpEw38yAec=;
 b=FtYl582kOyg/ZrnEBke6eCeb/qLjSnlFCCUe8K07jGgUxMJj+eQ95UBrBlDb6+yiu1CrQfLF9MAObaro0lXwjcDiDLgC5O8UvH32NEItSTTX1CYYao/Weh+YMEAp5CD56JuNRj3T8wQaQOLZtdUfmHodKmEklZwbiwjTTu2lsKs=
Received: from BY5PR17CA0056.namprd17.prod.outlook.com (2603:10b6:a03:167::33)
 by LV8PR12MB9082.namprd12.prod.outlook.com (2603:10b6:408:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 20:12:17 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:167:cafe::74) by BY5PR17CA0056.outlook.office365.com
 (2603:10b6:a03:167::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Fri, 24 May 2024 20:12:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 20:12:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 15:12:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 15:12:15 -0500
Received: from xcolc230100.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 15:12:15 -0500
From: Mark Hatle <mark.hatle@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap 0/2] Toolchain fixes for Scarthgap
Date: Fri, 24 May 2024 14:12:12 -0600
Message-ID: <20240524201214.3858538-1-mark.hatle@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: mark.hatle@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|LV8PR12MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: ffbcd9c8-1180-48cc-2889-08dc7c2dcec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|82310400017|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bxl7KnGdmBUzCDtEvuBn8rndsmPu7qmYy49ZNNXfSHCMSRMx9Ib2PDY5jmGC?=
 =?us-ascii?Q?oIuY4+1yc+4j40gWLzuLlrtMH8pyp85zaa2+XXxuqSVLd88ziMMlgrbbJs4g?=
 =?us-ascii?Q?w1TYzlgLYeg12VG5zx+0k022Prm03VEuYqzpI9O7fHmIyc4gf2uBIgp6ulbd?=
 =?us-ascii?Q?Mxs8BMngJOfL9Md83w+lpz0VXtIkeEymx9/utpMZch3MvB2FgHo5e5uALsHn?=
 =?us-ascii?Q?CLJRCFvDSwijkF7HM/b3JrOoM7upiIqoiNmU34FnXYF7MwmXEpU5XKbmpF2Z?=
 =?us-ascii?Q?D2EmzrmRP0YeGzdWrqLXE1lZoQYJ60LHJ7vqg0a0oTHy6LYcqurNit63LrZC?=
 =?us-ascii?Q?ap+RuUXR8vCUDnmcDny0rzUvlaAdZeclIQf64QRyeW/HNDagyH8avVVzCUD6?=
 =?us-ascii?Q?sS+zi1IcUz3l8CiAP6T6olU+WTHjxl9aXXoSkLi/kqwG1ymRpYOxuoYakqfK?=
 =?us-ascii?Q?WIrbiy4nKdcpaqNbyMkUCp1BRx0zunIPmKLlwTAxftsInlec/FFk9TS8Jr67?=
 =?us-ascii?Q?UmoZKnzxc0RmJGoJuyqdMwJbG69K17ioimJtoj0JzWZ+dD2dcrsAagFY+faW?=
 =?us-ascii?Q?biQggovGD71DhVoVkcADPrg1uQh1TBWodVzq1cnbM2IA98EBnNNQiVy+A6Xl?=
 =?us-ascii?Q?oiMewVmhFQdXuBmD7fDl2HqAB6BIdFe+x2uzLbhqUqAAmRt/+jGTfap4OxhZ?=
 =?us-ascii?Q?j2CMNIHXHX9QEb5ghy05gZJ3Jpp/jl7kmVWMsCzRrXpcXwOdD6JW5ru2u/9l?=
 =?us-ascii?Q?u4nZ/kzr+39yD4sh2s4iepyXIsE6lmvhRNegZCDEWV4Zjyv3W2COnxVfv4E/?=
 =?us-ascii?Q?YQu+MjpLahovQsNe+Q3KRsaXrGeu8bIfQzpwDS/M4j++8JPCNEuijxz8nsAc?=
 =?us-ascii?Q?kYDv7qlVgw2/kAbwL4It5fIsFXpPUQeWzrSwAYeWgaUaswLBT2LyoWujAobk?=
 =?us-ascii?Q?yCx0tpmGZJHQS6Dh1bVViZCKIqtGQZM4aJrNwp88RSqWMRCTzC9ST8N/CseI?=
 =?us-ascii?Q?Dhgs7Fwd1GW3w86k0MptoD5eSyAPZhynIE3NYmQUDnocdK2FtBRPv19EdMOX?=
 =?us-ascii?Q?CjrsWfeRNfDb7u40BmpDgC6IEG7Jujm94KZ07i/BW2yTI1Tpepi7jl+dbWI7?=
 =?us-ascii?Q?UL6iF+VORnEcD7MvQu/q0isU5LtlMMZvijGvjSt8fbob7goCU1zhLUdayLAu?=
 =?us-ascii?Q?YXfGk1MM5XUV5HRGLckr15HGUPtmJ7ttgw6Uzj/WqmKqiAWFMxqbDTU7YmKg?=
 =?us-ascii?Q?zwojS8pHghBj+uzf5p+7VIjSszkOIJcdZBQfDqTsvWk7Gollo3O3X54h0dQc?=
 =?us-ascii?Q?e7WDB0EbDyDB4yVJUo9tpK7m1NJktkNu2FHUNuolAT7H4ypCxQmD7ayDh22T?=
 =?us-ascii?Q?JvAi6jA=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 20:12:16.2514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbcd9c8-1180-48cc-2889-08dc7c2dcec6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 20:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199860

Two different toolchain fixes for Scarthgap.

The binutils change was found in a AMD/Xilinx specific build script that
attempts to disassemble some code as part of a firmware setup.  This
cortex-a53 baremetal firmware triggered a fault fixed by the issue.

The newer versions of binutils have already accepted this change, but
I'm not exactly sure which version(s) have it other then then the
current development tree.


The GCC change only affects cortex-M.  This is simply a port of the GCC
accepted change into Yocto Project for baremetal usage.  Unfortunately
I don't have any sort of test cases to show it works or doesn't.  It does
not break any of my existing test cases related to Linux for cortex-r
baremetal.

Again this change has already been accepted to newer versions of GCC.

Mark Hatle (2):
  binutils: Fix aarch64 disassembly abort
  gcc: Fix for CVE-2024-0151

 .../binutils/binutils-2.42.inc                |   1 +
 ...sserts-from-operand-qualifier-decode.patch | 382 ++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-13.2.inc        |   1 +
 .../gcc/gcc/CVE-2024-0151.patch               | 315 +++++++++++++++
 4 files changed, 699 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-aarch64-Re=
move-asserts-from-operand-qualifier-decode.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch

--=20
2.34.1


