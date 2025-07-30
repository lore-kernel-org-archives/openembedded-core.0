Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CEAC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 04:14:36 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.29])
 by mx.groups.io with SMTP id smtpd.web10.27446.1753848871146118507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 21:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=koNHkCaX;
 spf=pass (domain: kpit.com, ip: 52.101.225.29, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwZvXnhZHeJlCx9gLQmE38DRAWfda1WXNHDnLg7Xl+p15eqnOcVYQwyAw3/q2xcUlbaT6yiSuSMIv41vyfMvZMK1SDgMrZvtG4lvSXJHvkqend753GAS1VyeMlfGObCilOEPYuiXBUlZiE3xSSU2Yj72KIzMsI6DyKRgdMEPqbtyvBzNcl2dRraL8bLH3Y5Jv1dFHinoGmiz66Ht8bvI6u9V5UwDaT/7BqzGzqvNIT7aG17xEb9zVVNTAnDKMuUSYvgCgRPndl9uVtx80HurPaL4Pp0veDSBYcfisb1t8gG8zjxN3Ds9Ojh/QBRe/T5qj9Sb3N14Kq6PYtU1/dWGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Swec8lBH5qq7pSfJSMPph5tKHARMmP5TT+DHlUQAsCY=;
 b=zVYChIPx2YuPnSz/j8HWUkac3PRkFd99tQL1ULf+gc1T6xlxYAGvi/1mu5JAyJ+EQ0oR38od7Fl6RSSCTYr9MMU9sg2Vnh6Vza8CQz8JgQTE/Y9J5O27M+WfXXsnvQu+xbbi6Id/GUFpn9IvW9DeLU3XIM7+4mdaezgGW6hfY4I6ZeYi6M7iaWa3LhyHVl+0p7gZ0WvPVNntuAnes733bIrxMMKY30veKPT63JMr61PzHYfyd+vd2qHtTMFZpG5kOEK1V+UQATEh5t2NSA2kD3oBEtlTe+CyeqWUqvHj+BrAc3suxJhzzLm7pKe/SwBri7hW+c2DccshWJsc3w0rJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 103.243.225.90) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=pass (p=reject sp=quarantine pct=100)
 action=none header.from=kpit.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Swec8lBH5qq7pSfJSMPph5tKHARMmP5TT+DHlUQAsCY=;
 b=koNHkCaXLncbyZ0eGQYmVzi7lb0DY1X8q+dn2oIC8FCMDXXqr7Y948EivWB69xN8k3fZJ5wT3s8InUCq06VAdGwhJa2du6i5p47UEwJbq523MJUXIEwrualvfEtT1DSUnU86huq+64KZuafukcW9ZsjP4Sz8IviYtFNwjYda7/U=
Received: from TY2PR02CA0070.apcprd02.prod.outlook.com (2603:1096:404:e2::34)
 by PN2PPFD40D47C8F.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::1d3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Wed, 30 Jul
 2025 04:14:21 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:404:e2:cafe::fe) by TY2PR02CA0070.outlook.office365.com
 (2603:1096:404:e2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Wed,
 30 Jul 2025 04:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 103.243.225.90)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=kpit.com;
Received-SPF: Pass (protection.outlook.com: domain of kpit.com designates
 103.243.225.90 as permitted sender) receiver=protection.outlook.com;
 client-ip=103.243.225.90; helo=mail.kpit.com; pr=C
Received: from mail.kpit.com (103.243.225.90) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 04:14:19 +0000
Received: from L-16657L.kpit.com (10.52.121.12) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 30 Jul
 2025 09:44:11 +0530
From: Nikhil R <nikhilr5@kpit.com>
To: <openembedded-core@lists.openembedded.org>, <nikhil.r@kpit.com>
Subject: [OE-core][scarthgap][PATCH] cmake: Enable debugger support in CMake
Date: Wed, 30 Jul 2025 09:43:54 +0530
Message-ID: <20250730041354.58332-1-nikhilr5@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.52.121.12]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|PN2PPFD40D47C8F:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c712ab0-54af-4374-c48e-08ddcf1f8e82
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rcE1GOJezj4JYYmI1BG5cqBnnoN6y5AlrNBYSzAfw+VsGCzHDsdYJ1XRhNlh?=
 =?us-ascii?Q?elHdbUjYGED7YedSezHINSXkQHzTu+RHk4WDszlOqUhYHWgn25PjOPXlOili?=
 =?us-ascii?Q?1KTu/0EYjhqQkiQkMBK3dUd5ze9OVPpo6iAubdOLnbtQAK2kVfYwtj+607d/?=
 =?us-ascii?Q?BeNCtOX75ojUD12T6/jCc02xsAUh73mZKrC/YP9W6okK5XunJWyFEKNjldCH?=
 =?us-ascii?Q?+M6NE2diP+cQ7HPNOPCvbV2mS42p0QOI5T9bqGdQ4ibM0wL3RNRG2U8dCVdP?=
 =?us-ascii?Q?wY2TXJHlJu+E5TlbldptZELbZHJM6496oyclb8Q4iZQCKXORgf4q6Q0K9a+7?=
 =?us-ascii?Q?qiZ+93xMi7i63ZKV0XReZtF3g603jb8ho6+51lcPs1svRVRTCLRIbjweao8m?=
 =?us-ascii?Q?EvB4Tt/QuD8lIB/xfwzUjjUZDxmbOgrZ1ZqEqT25k1mW/eKne0xZ4Jim0bR3?=
 =?us-ascii?Q?RiiDv2Oo4yoyOlj+0zx79CL6vvlVg2tkyWXjUyy7Bk41K4qVEQFzGZCDx3J9?=
 =?us-ascii?Q?fJCqZK+o39Y6+B0q6Q5C7bLznEDddMnlUm3BkblGmK08qT2zg9athBUqI4Gt?=
 =?us-ascii?Q?aQhfCJS4mIljhu1FrJ+/avNb/wfM9GmB4FrmtkEdqFXDYpZMHcYhe7pDyKV8?=
 =?us-ascii?Q?tvMOdKuNN5ibN9vrETWO4eZWHrt4WdhEYV15Npg7gOwbVLW6aDXMA0srTsNk?=
 =?us-ascii?Q?7o/iZtCDYk+qW4SikoNwJQcX0DYMGvxdw5UZNB1iavWpDiWIUjm9yk5FUpVf?=
 =?us-ascii?Q?iMPUvTRMZbZXmLVtoDLSYl7aSWbajQfxHELyH+WuJUQLtlZ6KgsUC4ImLGAm?=
 =?us-ascii?Q?w7SN908wjIfT1ghpp0O1Eud1YaE2ukPIx7ajkDSoYw0i//tWZGzszuWQ3/pu?=
 =?us-ascii?Q?IAtj4vTA1fAcK2eywrJzyoQPz71y52cvreCa2kqmPAHIWZXQ0bUZfLYsjuO+?=
 =?us-ascii?Q?o0sXDUK5Ny/Z6vwgBzmqff1nymGMujVsl9Jg4XlyI37CDjHlirmboOjxGJiB?=
 =?us-ascii?Q?GaiHfwf/u1tBYyCvRp50QcPlQVYz7y+TI9OmBv7JFF2vL/65zqhkc/SQyW4F?=
 =?us-ascii?Q?PlD72gWC0r7BODKcjPYBCQQonu1NofnjEpNy285Y/pnT7G4fYVWegtjcN8h0?=
 =?us-ascii?Q?fsB7QY7zc8cc9KQBBi9xFwcF3MxDmgzRprB6ONr+Wp4Qu2tCcT2JD5KEKrjn?=
 =?us-ascii?Q?yscU9WVAAU1D++XSDsqyQiuDFmUvWIzIAu2RDnpTJbJc96RCg1uW3q5hQdpQ?=
 =?us-ascii?Q?I+0gEN5PtuL8FYUcpTlFLKK8WOW4PpsUjDryxGTTqskqBkvY1RUCBXpNSL0w?=
 =?us-ascii?Q?zzEQvOTvdx1empMeyMR/zFEAno6TgRYnvWkqCyY/CXYBCbhM370p1RCZAyVa?=
 =?us-ascii?Q?s4BfjrGLa/9AoUXTNE1ppqGUdaA17Zo4ZV2j04DBvhiEgmypUsolQaErBszD?=
 =?us-ascii?Q?2ZB4nq00dJg+kFCKsgOfP86k3P4lfbUeLapQCV/OHGeoYFXRdld7mIfB2hh1?=
 =?us-ascii?Q?8j8IdHkfw1LVGehflqcw29u7/tL2NYtwz5oK?=
X-Forefront-Antispam-Report: 
	CIP:103.243.225.90;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 04:14:19.5828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c712ab0-54af-4374-c48e-08ddcf1f8e82
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.225.90];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFD40D47C8F
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 04:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221097

Starting from CMake version 3.27 support for interactive debugging of CMake
scripts and configurations was added. However, by default the `nativesdk-cm=
ake`
is compiled with debugger support turned off. This change enables it.

Signed-off-by: Nikhil R <nikhilr5@kpit.com>
---
 meta/recipes-devtools/cmake/cmake_3.28.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-dev=
tools/cmake/cmake_3.28.3.bb
index 63d483801a..5c3b6247fc 100644
--- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
@@ -44,7 +44,7 @@ EXTRA_OECMAKE=3D" \
     -DKWSYS_CHAR_IS_SIGNED=3D1 \
     -DBUILD_CursesDialog=3D0 \
     -DKWSYS_LFS_WORKS=3D1 \
-    -DCMake_ENABLE_DEBUGGER=3D0 \
+    -DCMake_ENABLE_DEBUGGER=3D1 \
 "

 do_install:append:class-nativesdk() {
--
2.34.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

