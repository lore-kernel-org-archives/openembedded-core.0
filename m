Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14707C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 15:44:26 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.87])
 by mx.groups.io with SMTP id smtpd.web11.44593.1738856660071905163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 07:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=hbJ1ASpI;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.100.87, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrCVXSbNrGl6Mi/ZXWUFvwreAYJDIuXOY+Fwl1MnxSbDplgWEfxdixMGCA5XUfqp+DcQ8dwgmNPLzyVnhn2cg6Z5k/lAi1KoHCApI1iDoaCVHImMo3hPI+pX4enor84AtNWQARRqseT7LaOpmz7InD6hGWu//rJQyy6litR9QdhW3wIFApXEzeInuf/SYo+fIfEV9MZm/pIaiRTzv0mcKgVf9iD/3vms3F0xw2ehzN99ts3papMXm+I816DHaSQeI/Z6JH1kdLd4TtUK/fNDMDQTQ82fufWplHmdG3JTZI/sAYtf3hWqno1qmQ/sNJ9Ny4gOU1RHlpMYBdbDb32zzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAjfI7VX+knBpl4LjuMSOGN9G2flRBRZzf7rqhWYN2c=;
 b=m/qc5tF1/DdlaQAom0W83BMWw272R/6wvyqtekTUS6MhWQpixNIqR0RzivYA20MHBySN3s3ml6D2xyYlQfIem3WFAnBzCXI46k3Qw9UD/ypoXWAOrhSQlmewif1R2abb2d8W7K28z4EhzdLMi9Aqvs8R+Tanp/88kmhKPjRio5+NwJ++d32o2q/U3hQn0LPqw8w/IhmToGkXC+X+RP9AreE8B7CnrN0PskUAxm4HZICtu4dKRcx2A1w1J18hM+o1ZgJFRTkLtapAsS1cp71QiP+s8w8e2B+56UGV6nafXQM7Ta5BKSnYVeffPK1DB09iQKW7vFTCrvcV9+CtVDhPfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAjfI7VX+knBpl4LjuMSOGN9G2flRBRZzf7rqhWYN2c=;
 b=hbJ1ASpIhbV+IPxOmQIBLyvABr7sCRIwzDDpzhNnkgMeJ2OtnSfeqKvfFvp/Z6Dp8OxaClACooaLXdVbNX0hLIhFNhmbRavW19n9iLg9anFpHmZX9jAd9Z7IeRCcfmSUs1u6aTHghdm8rXS4AqM+riF0WhxV6u2Nqmoqc7819EqFtjSufdV+OLfWDFs8kKXA9IdFEbxTzLX/Rslw1imLR3o/t9dhwxHbh8QMoXqgm15rbxRlSEWv2eLipPtIp5F/BzjqMFt2jsxpdrW4MAqK4S254pgyc50VxFaTGCOdVZKehjqDkz9iTVdsXnQ3c/wFI4qmZfo8ltxYWBihefkJjA==
Received: from PH7PR02CA0021.namprd02.prod.outlook.com (2603:10b6:510:33d::26)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 15:44:17 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:510:33d:cafe::e8) by PH7PR02CA0021.outlook.office365.com
 (2603:10b6:510:33d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.29 via Frontend Transport; Thu,
 6 Feb 2025 15:44:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 15:44:16 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Feb 2025 08:44:14 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [scarthgap][PATCH 0/1] Port change required by librsvg-native
Date: Thu, 6 Feb 2025 10:44:01 -0500
Message-ID: <20250206154402.694264-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: d65e7a05-2450-4a75-499b-08dd46c51d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CdrMaf8uWmgSRQEzAqzg0i2WYTxu1mje5iT8cJJUSw0xMm05OJFr0qqJ5rbj?=
 =?us-ascii?Q?QBUcdQr1HpcSzlWgxHsrC+BO0XK/ms1HlNZL2dJTD5aJNY++IvdfRK3bPAyw?=
 =?us-ascii?Q?5hICtVHL9lL1/RNO0lprC5NuLLWXCSOb72Raie1piSGZ+S8bRvBp3o6/G7ej?=
 =?us-ascii?Q?8TlxSNPu3xSM1cLSt84Z7TxzLBcYyBYdHjcEypIgHRjdh3Q3uemTmn/E/MTe?=
 =?us-ascii?Q?s3LUQSgYHOTFGePCQ4JnTORi54t0g/0Ph1yX+czIYGCGuH2mu8wDCy3fWqKl?=
 =?us-ascii?Q?1CvB1McdvURcqpjrBcrqF9xLBfsy+NZ9NoSf1Wd1AaVRj/eYyany6MM158p+?=
 =?us-ascii?Q?VpTYvXtahY/psJCuPi73BeWRcvLL9z1uUE4tcIEZMYi9orZcKUEIwhacTxDg?=
 =?us-ascii?Q?UinPwrveAC5JXkhEfld7VnefO3Xcjo/5PR7Bshubo6/UUr+Mxzc57tVf9NfY?=
 =?us-ascii?Q?frHmAspSKZpXTu1MfJVSpoUiWzjH5hpZJigDCKCm/HqHhP1o/FhGk6CWBhin?=
 =?us-ascii?Q?91A97alMZhC0tmdozEQzqQA1gnLJ2VQP01cJH5P6YhdlJUAlF1MjiiuMvbA5?=
 =?us-ascii?Q?BTzoqTZFUy8t85lID1ZOnQ8saqgBM/BaBbnhgr/KWN+XrpD2vLP3QAkJaBuw?=
 =?us-ascii?Q?hSUzYMJcrTY4WNLtwbD9ClwqTppfrPoRy5PbCs97oVe0V3yx8sb27/1W64B2?=
 =?us-ascii?Q?abIyReR1QXqIy9QdbZKQ5avg5TeCSvyHJEbhldGOS/AJVXkY5Qg9LI1gnr5A?=
 =?us-ascii?Q?ZoyVFnbGCaHfa5aFSk6bzMQVCwzr0jiZlDQSKAx6J8Xe0UJNH7P7dsL6Sgu6?=
 =?us-ascii?Q?sbT9cyuY2Lb0+tjYE6jZVvN1qnuksibYhNTDT61ffEezjL6k0Fs+1pfiBs/E?=
 =?us-ascii?Q?LlwPVD0kQBhlTVUI5YX3YzImvZkEWo2qh/bryPCYoN8kGDLgPNl9F9qgf6GU?=
 =?us-ascii?Q?JFY2bsD+B/2UhgaHyEpCtfTJSKFZrirl1WJ69d29lJE9Cm8bq+2a7LGpy+px?=
 =?us-ascii?Q?F7MKgTUxD2HIdGhEvAa99yqq8yPrLl+EOD8E5935eQYEn/JL0wOt83zoSReK?=
 =?us-ascii?Q?FvHVRaqY8SHWhJLn7JHFEiqv6tz9ssW9Ogn5E8NgWwnnferb7aceWtJ88V7k?=
 =?us-ascii?Q?RtbgsxavF3SMoKiB9VypEcaNmekP/iZK5ef93JaLsxE/QFtmoAQmAL8vijKM?=
 =?us-ascii?Q?3G7fPYp+JXmJK85hf0vZMAL1TNtGtbD3uP9dg/yQ5JxmKGSHD9OemCgx7agM?=
 =?us-ascii?Q?HK6ovedybKAi4F8cv8Ms1NsfSU0hn6Z+3/NK8H1E78YMxHolO8qYTb0lnkF0?=
 =?us-ascii?Q?r3pxH/ZflIkKACdXGPs/HYl2bqAr1VVzD4vEvnjFRhP/nQDAeK3/VCkpozDE?=
 =?us-ascii?Q?0T1KX7ar3/pWKzz1ezNLeNsZ9EVHJswMEfjUC+ebNkmLoVQeWGNwBODhx7Sf?=
 =?us-ascii?Q?5XaKtP38CoI=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:44:16.7004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d65e7a05-2450-4a75-499b-08dd46c51d33
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 15:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210946

From: Chris Laplante <chris.laplante@agilent.com>

When building librsvg-native from meta-lts-mixins, we need to be able to
pass extra pkgconfig paths.

See https://lists.yoctoproject.org/g/yocto-patches/topic/meta_lts_mixins_sc=
arthgap_rust/110997188

Alexander Kanavin (1):
  pkg-config-native: pick additional search paths from
    $EXTRA_NATIVE_PKGCONFIG_PATH

 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in     | 2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.43.0


