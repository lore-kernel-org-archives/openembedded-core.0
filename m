Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332BEC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 06:47:29 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.74])
 by mx.groups.io with SMTP id smtpd.web10.9552.1721285246913314228
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 23:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=rr/Cf7HY;
 spf=pass (domain: de.bosch.com, ip: 40.107.105.74, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6Z/yHQMJ9/FzZN5T586GzrpF4BDZ0x7WUL+q5hhQ21xGw6NOHwrGmnShESL+SJl/bEoXdxJdp4SOSGz1nY+1A7r53dn18y0I5WOel0ax+kst2aNpRMF2/jZbSs+X/4ey/xlFqO8XcALf/cvQ7D38uNkEx7P3Al+Uc8saE3HAwsxVZDJ+X8+VJtoI7m78/75PNqTFOyr0PoVhS2Kf0OurK2jahpBPI39gRjs26+7uyFDBlMv8XEAbiWgPwpDFlN/ZMlDD9bFMySGLHPru/qrp+llThbEiPKK9Hj3Eo4yM7Dm8wlALUTCCX3V5PprHXzYYID5Drq+apvdwkOqkGTe0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgGJVYsfqj4FHC4kfj3lcHeqyxQ/tkqOjmihcMV8F/U=;
 b=bXp3h6Q8v+Wl0Unds3anAvZyndZBupvd3AO7Junn6WvNcreQHAOHxaJoj1YF0Sf8xkWbP31dTaDBnLLEZX2Mgz68BVmOvgh++uN6f/avSgIwJSSJwupPaFyopsxU7NM3Bj/qj0Kw5JW2eutcmDMRaieOq4nymY7nWnHtuyn7BKjt+pUhgIrFmj3L15GGfNHnUBfwoD78FVms7LYiabfg0LVdQ0yinI/0SsPufdeeXPcdMmWP9XM9+AhzFdZbIvzuKumq4c10LZvlV96Ez/TsbcXTuyi4Ft7agIEQcQyW3XMzaag0IlpNNz/0YNPXysVT2/qOuFnj5XfDIYg6YuYNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgGJVYsfqj4FHC4kfj3lcHeqyxQ/tkqOjmihcMV8F/U=;
 b=rr/Cf7HY8F9vGNrkzxIWXu0YMfWgygqNIKINVpwrMqmsfNAZzUC+jPdcvk3iIBfjdCUcoPTGQutF0VOCzwfEprIc/aPuqnWHiKvpmBFwDCwoqSUuKEazIBXDLQJ3jxN9lv/2XGdbCb8pI2IEHsdhl+a+1EGLM5P70k99t1VFO4I7lMIGDpTNQdT86axG1C0s+nTBg2eSKZ/J0iIprPX7rpaGgJeAq4qamzwTwl3gaDQnx15qt1ONePixEl+Fd88f70/eoFfL4pkwUDgDLkAuo8KN5gaDyTcAUKdKYb6Ln4bjRyyQXW1g6fvhC7sA0mblPAsVSDelJMHLSGXZoU3dNA==
Received: from DB8PR09CA0021.eurprd09.prod.outlook.com (2603:10a6:10:a0::34)
 by DU0PR10MB5606.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:318::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 06:47:24 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::74) by DB8PR09CA0021.outlook.office365.com
 (2603:10a6:10:a0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Thu, 18 Jul 2024 06:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 06:47:23 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Jul
 2024 08:47:06 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 08:47:06 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: <bluca@debian.org>, <luca.boccassi@microsoft.com>,
	<matt.hoosier@garmin.com>, <richard.purdie@linuxfoundation.org>,
	<mark.jonas@de.bosch.com>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Subject: [PATCH 0/2] volatile-binds: Mitigate workdir cleanup issues
Date: Thu, 18 Jul 2024 08:46:32 +0200
Message-ID: <20240718064634.7276-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|DU0PR10MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 72826937-7332-44d8-e890-08dca6f57af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dU5/GYLGkJ1UM5HfNi7w/Zfk6WVBs2cn65wK9OKqzkPt9+Fcz/wAE2F6AfPq?=
 =?us-ascii?Q?b9ESuA1pQYPKgOEgG9oLmY9b0UL7U8eMF4XpLQM1aWcFoz2XsHDT58bnQOfy?=
 =?us-ascii?Q?idkId3dJm2GwyGuaWDK2uCIWBu40XlyahppMerWHRzK2e4BAxjyzWlEO+ZuO?=
 =?us-ascii?Q?ndMDPVLxHULQKORdQZgbIRMLgEM6iW00Q/ClCki7to2YR+xYg2FZcRFI91HU?=
 =?us-ascii?Q?Z+j/EPpAnJIaZbQJtAtsoxnMzF3D1rbP2tyARffyVkIUDWA9x1Z6tdRDMd9S?=
 =?us-ascii?Q?XOapMshY8f3+eTRx0k/kkAZeof7UvW+/pNKYvAYfwqRoGisqaQnZeaaO430x?=
 =?us-ascii?Q?chbwGWafgdKNp58CduS5m5hcSTNY+3ttyFUNxn9vkG8BhTSxQnhd7UTsdhvN?=
 =?us-ascii?Q?op0FK/BqjVM7l26zyofIlPx3J4EkG78Y4gyrOqUM3dx62TsISDV0tAEoVOZ4?=
 =?us-ascii?Q?BWMs59C0+H7phBJAMYPdOKvufwe/vaDPwYb1AbN1eYUmos6uGgK0SKlG0tPs?=
 =?us-ascii?Q?dcPoBlefMkpC+zXZKaQTxh63fX1LQHHZXx84P/tJi0dSR2yzfGms7wbYOhiI?=
 =?us-ascii?Q?GTboqFVMCC3cgp7bt7zEjxxN/pxOVqY+J8EfWlxmY6MqsjuM2J5kUe+6rDZ5?=
 =?us-ascii?Q?VY3nfq0iY+znfMhXCTvSyha9FiAxWrsSYuKhZXP046EsLdqE81ap41gR/POa?=
 =?us-ascii?Q?FthOYrx5IHL9NK7+wJ4iEwXezNmw72JpAZYRGDpG/61M8l7nwmKWi2k/B0FJ?=
 =?us-ascii?Q?WIdcxsRZTOPzKuW7MVOMKNqGqaJTSf0UZ8gkdSonVUgk8ITcoE5KFDQXaOFY?=
 =?us-ascii?Q?uS6NeHeLqIMXL43wPBzntMqSMnfLdIYUbYNQ9gdWsr36KW5gCfZ8FaKMeIdC?=
 =?us-ascii?Q?bTihwrpjQSWK2cLn/2OIvF2cLkroBlVQpyKtqOozMCLcx5HWtIWjgi0UyIzD?=
 =?us-ascii?Q?hSwG5qLTU8xEEXzZJjgqyjW6PsJ3sWHWEGic4uEZqUnAJi6WJD+MM4snVyMm?=
 =?us-ascii?Q?aCNhPODdmlPj540RUMjvdh0qbPP4QEH0lp6HdzITHUZE54Csc3B1qJWo2Doo?=
 =?us-ascii?Q?n2QbLdAii6jFCknpS654V0EFFhnkASVqzIceBg2tHn98flioyOcI2opKN0Nt?=
 =?us-ascii?Q?ouQ4Pb18Zz+pSJlGVCJ7MzyvWrV6eFLg8ZlCP+hnQ+IQjmbm7tZQV1ozqiQW?=
 =?us-ascii?Q?2OrqEB2QFuEYAmzEd8cOYjjj7xGstBoW8Z8hdGpXCUTucjrHVWXDITNEURgw?=
 =?us-ascii?Q?1FzvBSl1z6liAuj2id49QkvglUi6n6iB/KlBE3TiDLCxaSehRTN+Q2gtlbUv?=
 =?us-ascii?Q?l3JmfQKA2mhbyoyAvWeXIdK/fWiuOV9tILqgQffcauWjREsUbD9WXAsHg2uB?=
 =?us-ascii?Q?O3SUQv4lheSkOIPOj2khRJvpXOEIwMV/uoH+FoPmXOekpyglbPozYSdmBqUZ?=
 =?us-ascii?Q?wsQS1ellf2Uke69CvkZLlPBKz4C9GIiV?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 06:47:23.8964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72826937-7332-44d8-e890-08dca6f57af5
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202187

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

The recipe `volatile-binds` relies on the `mount-copybind` script
to create volatile mount points. In commit [1], the script was modified
to use OverlayFS as the primary mount strategy. If OverlayFS fails, it
falls back to an old-school bind mount.

To meet the requirements of OverlayFS, the script now unconditionally
creates a workdir. However, the newly created directory is left in
place in case the bind mount strategy is used.

Commit [2] introduced support for avoiding the OverlayFS strategy by
setting the `MOUNT_COPYBIND_AVOID_OVERLAYFS` environment variable.
However, the workdir is unconditionally created.

This patch series addresses both problems. Firstly, it only creates
the workdir if the `MOUNT_COPYBIND_AVOID_OVERLAYFS` variable is not
asserted. Secondly, it unconditionally attempts to remove the workdir
in case a bind mount is done.

[1] b4976f3cf8cd028f165100b67867adb862da4d7f
	volatile-binds: use overlayfs if available

[2] a8e7dca69054798b1c9843a0de889cef3e261c4f
	mount-copybind: add MOUNT_COPYBIND_AVOID_OVERLAYFS env var to
	skip OverlayFS

Ricardo Simoes (2):
  volatile-binds: Do not create workdir if OverlayFS is disabled
  volatile-binds: Remove workdir if OverlayFS fails

 meta/recipes-core/volatile-binds/files/mount-copybind | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--=20
2.25.1


