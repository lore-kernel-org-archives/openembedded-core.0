Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BDEC02193
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 20:20:38 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.81])
 by mx.groups.io with SMTP id smtpd.web10.22844.1738182033784957411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 12:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=2G0s7JcO;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.81, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLTvSGJxEyO/4c1hCvvObHH2cgHvS8upMYAYTFmT3XUjX7DmIik4jS2NE5YQUARtToOZH0ARS9/XCns+31BZsxKUhyyDKKvDysDTddNhwbPO9tv7KrnMZLdXg/BZK6B2m9dxBqd1TjBMS+CHzw1ki1IqhFpDfRCKglL8H1QgvPPybcbhjXPan+VQkysdG+nb3AllBLoXnQMhjyVK27UETYpjK35unkvQpOWBcGYWrN9D/Phhf5zJQGlrDjGvVn6/qDxUcIR2+J0Zm2tC7Qi5F6+GWeZfjOURhm1G92GT386YLZgLXlbLBuPkWJAAkfNX/7vdNss7ua/GK15I741xow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt+cDQ+K7Asn23BhXSs5KjDm90KohdLpP1+kIoA23uI=;
 b=N8Wfy6ha1DBoqxW38sI+MIJaFwRBWjIlw1H1EWG2ZCROuxpO9bhEWfEUL+GlnHOnmBHEGcIa7vELFkZgUHgez3rcMgMnLQV+m3F3nrcoslGGnJ0kFH0infRqhvRHWx/h0B68VDd4YLfBglKD+U9sjwWXrwOrm10e2OvhMt6jEDZc1t4GuUooZZWSUp/xfvyrD6T3dlbZ3ZfcisUnkpXwTgHMIGI6n6H7jjn2LmKw9qV1bBhj1wbYH8WPo2NUnVcAjXDfygaHs50vDpSeSISgTL33FG8et0CTluADt7WD6HISpH+bkOnH9EvxtGPmFwu8fWJYvOZXJpmitDLHq9knMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt+cDQ+K7Asn23BhXSs5KjDm90KohdLpP1+kIoA23uI=;
 b=2G0s7JcOiLAJvUqfUHc0plLg9COyFLFjUOwljgkpYZjxyY24DRDH/KkGDWhFb1zsCxiumodQdEFfMcntops8Nk7eCqysDjJQQhzBFSAiVWgN7w5awvW0YT8BfEJ+cen6g1WvY/S+lB5FRwONQR60TVo+9ain6rwnXc6BgdTnuG2Lx8EGYLpIDzQ2Lf4nLj9eE4T8a1pr/HoqL3y0DGWIxanj8kr/Ib2DbPfobRvK9kEYcS+AA/hbFU3pQRLKtxyB/ap94/AdIsN8t441vHgYEIzH0oFeXWZI1lJH8gPbbMP1c9wOz6xTLzqc9SWMkc0E+9izHnE+rSWWMQ7oKkNIhg==
Received: from PH8PR07CA0031.namprd07.prod.outlook.com (2603:10b6:510:2cf::11)
 by MW6PR12MB8835.namprd12.prod.outlook.com (2603:10b6:303:240::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 20:20:30 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::e9) by PH8PR07CA0031.outlook.office365.com
 (2603:10b6:510:2cf::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Wed,
 29 Jan 2025 20:20:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 20:20:29 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 13:20:25 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2 0/5] devtool fixes/tweaks
Date: Wed, 29 Jan 2025 15:20:11 -0500
Message-ID: <20250129202016.1833520-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|MW6PR12MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: 539359d9-7af4-4f25-02c8-08dd40a26005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xbUwi9WXSqKu7O6GIsyP+TXs5Xd8kWJ/YKuMNc4GfnGvUE6uJqF0Yz+hvPeN?=
 =?us-ascii?Q?c520TG6cJO0RBpHwqYpYde0C+mJOOeDiVWtwOqc2AEX032SoE4Z9igXyuoiE?=
 =?us-ascii?Q?7DIV9hBsAOEhq1AXVJjSFO22WFriq6ZJNAcZ7bDvTtQ0xFd9DN52y4raYtVr?=
 =?us-ascii?Q?fSJBuaq0bgfTeO8GooMh1zAJ8tSixkwuXwgi5foX2thQ9N1yJ3ekDbkt82e4?=
 =?us-ascii?Q?RNwNk6qkDBQ30oO8Hlf6e2/nLR4//KNANEEMrKjFAczY0ljDmqCw+ubs3ztc?=
 =?us-ascii?Q?YN18y1eN+vsZQFBQsbvOj7QGx4bod+WtDQy0oX8wZiaeKrgVNJAPXKiNoyW8?=
 =?us-ascii?Q?0RPdlkIY4cxH1o3z/BHSYBJlMSSdsbxqznHO9JDQ7KGIeGEc7go+9gWhQfQQ?=
 =?us-ascii?Q?LHyG9wqml40xNv75JjItiE+KFgC24u5INfNfF/hbPa6zpgYtkXZX6OJwtTl2?=
 =?us-ascii?Q?DzxlzxBIzdDXJM55j0KXs6lmNy5OePumn0jp7LzPm+aB7ev8rgLC/0FpqfgD?=
 =?us-ascii?Q?JiaToyYjZEeLhT6dAphJ1trMn5kg36nLsNPXOWvb+/EKn1+xBN4OxahsYli0?=
 =?us-ascii?Q?i8VzLezFupNxpU5RPlaYF3tGO3eG+2VBLjMW2b6fxF8w4LT9M3Wp4BczYzfk?=
 =?us-ascii?Q?bgp7t+qoDp4GTiXwpdICkpmtFUWqs/8Y0RWOm7YhftoPVHnPOLbdbK69++SD?=
 =?us-ascii?Q?TOTJinI9z5pG44hM0d1RMItJOzOtsfQbX2wX4qKxDQbfuwiXMf4c293DnQEU?=
 =?us-ascii?Q?B98l9BMj6+vE1p7HzG/PGjSST6lsp1jaHabuyFRRp0c36T/lB98Sh1/PSNgD?=
 =?us-ascii?Q?jbiQ+FrG7uhSmvqkxNvBrLFFU44NMbH4Z3ww2OBsURS8IsjD5dAgb/48gQzY?=
 =?us-ascii?Q?b6Y3Y6F1CYaG8jefUOvcEklq2WGKoLirSlDREwk913F6rEVupwmTRGqID+tz?=
 =?us-ascii?Q?DE46P9uQyn1N7tQuvnWOkZJNXnoAzVuwnzPCbaB09Or3kT7Au+ld9J62v9FZ?=
 =?us-ascii?Q?hPaqQGUBl4tGFp9qx7h+RmBWovSkG0zMc+t9OU6yvSxXGCoK2+jVdls4MfQr?=
 =?us-ascii?Q?ecoxWgDI8wwsgBz8D7hgOSJf1FFzY8Tfqnpab4OMzRgodi9xKck0Am/VzLOg?=
 =?us-ascii?Q?LAFNbzrwzwQ5lNoSIdFpldA1rk/DGCAJ8CqnmaIk9Gl720gYw2K97gpf+Wh+?=
 =?us-ascii?Q?oURbCOoqWO7csvmuG/6vOK7Xz8O4PEVRErx08eyWTozh/1WjAKQBUFx/jiFZ?=
 =?us-ascii?Q?teAoQYd/0Yuk2wsOltXy+Y6Kep169aXGpJZEb8uFnSa6eGTWF43JM6LZmS2a?=
 =?us-ascii?Q?xZQr9ILBHjRWdynwXfkqpKrBQsc4jQHnRDNEq18M8q/eAetgHJQYSU6kVThg?=
 =?us-ascii?Q?gIuAt7iB8Idb2TrNKspGtix61FIeqPPMBvYWQmele2c40Y65J8/CRRV8ArY2?=
 =?us-ascii?Q?XULZeoUb+YIwMYySXlBErtfQaOwRyawVfXJO+90YzrYj5ObDFixARNj3lOV8?=
 =?us-ascii?Q?0hH6vJ+KKXzpR/0=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:20:29.4580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 539359d9-7af4-4f25-02c8-08dd40a26005
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8835
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 20:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210412

From: Chris Laplante <chris.laplante@agilent.com>

v1: initial
v2: shorten commit message to appease patchtest

Chris Laplante (5):
  devtool: standard: cleanup imports; stop relying on transitive bb
    imports
  devtool: standard: fix typo in variable
  devtool: standard: fix unbound variable usage
  devtool: standard: simplify get_staging_kver
  oeqa/selftest: also copy local changes from the 'scripts/' dir

 meta/lib/oeqa/selftest/cases/devtool.py |  6 ++-
 scripts/lib/devtool/standard.py         | 66 ++++++++++++++-----------
 scripts/lib/devtool/upgrade.py          |  1 +
 3 files changed, 43 insertions(+), 30 deletions(-)

--
2.43.0


