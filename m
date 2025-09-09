Return-Path: <mleonhardt@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22337CAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 10:42:03 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.16])
 by mx.groups.io with SMTP id smtpd.web11.10059.1757414509533409898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 03:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=VQC8JCpw;
 spf=pass (domain: arri.de, ip: 52.101.83.16, mailfrom: mleonhardt@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPAfCrCy3aAT2WFDnfnzNp6jb33vOEsdulTokj28wgFqDt1tJQAxAFdbP/S/9ioJ5hc1jJkVOXcRkk0Et8mfnoxVtG1HnqY0YzJFoUvMdUsNsuh9pp82MSHTOzQFMpTMNiUusnrCqC+HsFA1i7CxRftUu69U4A9HQ9wO+fZvx8rLm+y5PE8V66xjqtGKmgOuk8sES2WVDJHXMeFfLLpQbdKm4qSiKU3U1MxWF60Zu3Y9ahslpDaIt4tzxfmiYxtjnqw1vJEyQxb3ivSaN+VoUqFijS54a0tHfPeySt4EhYTB7eeI2QXsY0BEBqB85P+SU1i8M19jp69Kw0SVjFCvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MO7yuEu0zvTztr1u6vn+uKOXJJTQqo5OYYbF40VZWh4=;
 b=c3rf9VRHHhQsIygfniGaRuNeSTW0k8fWWJG6l9gXxiFD7PyQoWoPq5deI6ff/pXypsRiL7UZ+zm6XT2pblNv9NSq/esi2mRRfUVFQllf3YVhzinDBTyNFQHGb9ns4xIqJFP/mpj/LvQsMOapUNQ2JPXdhSRUpzru7vpEA3O3kvqw+53KgyvysB5wwl8FVSoT55Jfdpsmjeja8JPPT09TJH6flJ4GBPWtPP6ejnuxre7vQmvSLWv6Y/Ki/51LfPl2quasZnRRUP1b91/h1gQksc4/YWBSj5+uNpwJFiJPI5mv0lAye53NZFOuykHakQuj19wlDSw9F+XcxmP/fwgo7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MO7yuEu0zvTztr1u6vn+uKOXJJTQqo5OYYbF40VZWh4=;
 b=VQC8JCpwOLzXxeZsKoiu8aGl/wUVjvT3At8n92u++CHffl7+x1wdTrmtQkUN3tJafBzbxg7m4xdn89inWCt5ZZGEbyw/yZFlze9QCBfPt/ZmtsUncb+gVbMa4z849g1jYyp/7bK/oNmmy98D9/y6CYsyPsXpYEP5ZZ0JHDHmIGc=
Received: from DUZPR01CA0201.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::12) by GV2PR03MB10973.eurprd03.prod.outlook.com
 (2603:10a6:150:278::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:41:38 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::25) by DUZPR01CA0201.outlook.office365.com
 (2603:10a6:10:4b6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Tue,
 9 Sep 2025 10:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 10:41:37 +0000
Received: from MN-CY2D6JH1QK.arri.de (10.10.225.72) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 9 Sep
 2025 12:41:37 +0200
From: Manuel Leonhardt <mleonhardt@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Manuel Leonhardt <mleonhardt@arri.de>
Subject: [PATCH 0/1] image.bbclass: preserve debugfs tarball with checksum fstype
Date: Tue, 9 Sep 2025 12:41:27 +0200
Message-ID: <20250909104128.72058-1-mleonhardt@arri.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.10.225.72]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|GV2PR03MB10973:EE_
X-MS-Office365-Filtering-Correlation-Id: 97583a33-9959-43e0-200a-08ddef8d7461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8HMluxZFO6oW+6L9KWfv2Kpyu7KTNmIUZYDIKXbWX/fZQWoEmTWvIxImHI10?=
 =?us-ascii?Q?ZPSjdgfwWjEizqElz705dJ71OBZ7wociJFZyMxrqoHqOmjhroRtMPOTUVxoh?=
 =?us-ascii?Q?cwj0n3iR/Gzfa0zsWoCguxdJrL+AiwHrBEIcmrjJTugPepHVhW8MbKZtabIs?=
 =?us-ascii?Q?wNUGGUoPIknuVxctwlD3NK5iShs52O93QB2LeJ3OUv30TDQamILBQCag6lPz?=
 =?us-ascii?Q?cVxmd1BjJRHBWEzNCLuC6H8kH59R36ulyevR0tlrJzvTfhO8kcGKL2BcxBja?=
 =?us-ascii?Q?/8vK2fjS2dy59J/q/d2yUhHxhN6juYk9FFLEVL2tciuBlOwtMEdeT7fbjJd/?=
 =?us-ascii?Q?KoFrSnbBhCY5GGSNzZpHxR8vKLx38lWMyUsba6HuHW36JighlxHbMUGvbH4Q?=
 =?us-ascii?Q?two/41N7C3IMe9Eet/A01ZUT8zBaMfXwEa8P36OU5NFXdZ8udzAdgVh1vdKk?=
 =?us-ascii?Q?2kN1IaxcFYH1I3o+bf35/u0CqCHtbtzdrLSHRzBAmNm/vUXdqcL1MO6aen6a?=
 =?us-ascii?Q?uo01Tp2P5jWUZ8V87oiRTqDI7ndSZn9i9MUb/+dHK8j+qnqroQ33UcXZoQNB?=
 =?us-ascii?Q?gBKEhk3UyMW8Dnk7zGgDFzjtuVdumZFWorKpvX62f4PRSH2HxHBkUYbnar/7?=
 =?us-ascii?Q?HMEOwDVO0swrn0QxAoeB/cbuVi/tIAdvlIlzmIb45IEaQ4kpVIuLclXT/mY8?=
 =?us-ascii?Q?JRBG65NGmsI7WxRN1aNz5gzqY2GE9q+yZqjPFa2359HBWvPc8cS6RuTsEMqt?=
 =?us-ascii?Q?s3OjEkgCx508HLQZ7MkC+rP4zOnscOIwqVzqjtobq6bmho/e3eNaSyTu+y+v?=
 =?us-ascii?Q?qc0XCF8HqvwVvGrP49Lwcxhz6c15Ud8+aKYwD3gBEcI/xyU71XMxoKHUyjSu?=
 =?us-ascii?Q?13VEKq6WLNhDMR1b2zJgalawa4J59BPXCFuFvM44/e6f/SeRh5jevQNFU9oK?=
 =?us-ascii?Q?fUwyxa5yVPmGrS14Ay/OBcOFHnAmHkp59XHPedIRFxSYdqjHBPwHe3wyruAI?=
 =?us-ascii?Q?uUJxVRpScnUqJrkwr0sJUJSLRPgCVrJNR7r9Bl02XHAakLtXpiDAmsLEtyUZ?=
 =?us-ascii?Q?agwndTKGn2GWfUhqn38x5hHdD5XeQvDgSg2F4sAJA/0uXHh9q8xVp75Dzuqn?=
 =?us-ascii?Q?vNGLDBE5NX8kR1vu5fKQekU+l04hehTnq8IPF9P8QrI6M4WAYSzy2zOcTH8Z?=
 =?us-ascii?Q?r6TnAcIIJGcZSfXz3KaDfclVhgDw3P8J1Axn2MHCh+qAeJhHvcRxgG/VaBhI?=
 =?us-ascii?Q?bZJTXqT2rP9VmPFAIkHP7ZbCqHqWX+vTOig0rUlyUtq6G0ATPRTUP1nPq9CD?=
 =?us-ascii?Q?4HkFORtR3t7eGItZ7CSwQMU9NGhTCwPKTUZZkvQ9NEhdg4gq4a47LnnDw/sH?=
 =?us-ascii?Q?U5z3UEBrWz/f+834VKp88lcwGGqEGz5Hn2axO/NGId1zAwKGioDrNbai8PHH?=
 =?us-ascii?Q?PVpavTAqVbgcQsJkDI2Bmjd7uwfEi7EKEg+Tkz30AAGVy6HyThjOSd/TiEr3?=
 =?us-ascii?Q?9BVMpUvzKRlhLl8cqTRYAVtbSgxmxO6dutJC?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 10:41:37.7712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97583a33-9959-43e0-200a-08ddef8d7461
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10973
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223100

I'm not sure if the comparison with alltypes in gen_conversion_cmds is even
necessary. It appears redundant since a very similar comparison occurs a fe=
w
lines below that function. In my tests, I was able to remove these lines
without noticing any difference:

```
if original_type not in alltypes:
    rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
```

However, I certainly have missed use cases.

Manuel Leonhardt (1):
  image.bbclass: preserve debugfs tarball with checksum fstype

 meta/classes-recipe/image.bbclass             |  3 ++-
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 13 ++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)


