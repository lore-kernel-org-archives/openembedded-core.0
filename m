Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4221CCCFA19
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 11:38:46 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.84])
 by mx.groups.io with SMTP id smtpd.web11.40559.1727350720633414049
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 04:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qw7ytbLE;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qw7ytbLE;
 spf=pass (domain: arm.com, ip: 40.107.241.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N1BGy3b82ripnLOLkJhMHHbKL9HP1Lw6kXJm4ThYFEcQHMvH/y6iTtmABVgPf1WRMNTgLI6JYjejf+YhdHHIOGWk2Cjrtzx8GweKHpKkRWfNttZH3KeUeu26wAq/F9Oy2K4ZOX23yxiMIOshDpM8zAhT4n7gZSM7nokqF1rUDU4WKk4xEnzsXe3AuwN8mIYea9uYeybhl2CFoLKcQ80YaZb9lMkUIy8Ux4s+bjKdwcJ/TSV4Lu/SIqWpVFrFsqxrncUp57fxt2znb1/J5i6dOReDfIsWU6AHJ32NC0tglfrhmyq635q9CZOQbye2HC6lABa3fBSzzZ8pbW5NpG6S2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fyFVJVBk4xHudVa9p0p6SCmEhhfucwc5aAafyJgHjQ=;
 b=UBaz1Guv9xCfsveHdoDg7ci8msWo8k6igN+ovrowen1AANV1N4dhsKRIzYJ6zZw6M432wpeZEhezavLcQCJrNsqNOptXlagek7RlfQAvPlumNabFC9RBabCxfQds0i66ghp4H0aIWrodBmUG9yqTuLwi2sGo97pljVK4pfKKthIgu9O2URP17I+F6Kizd01Cl9kypilMxDJMoE3hF3dgl0qm7ka8C4dSKLgsCDlo5ycfjwlCxlu3n+WsljP7WdskDFhqQBDx+VIcY6FcFpmc5aDTsJjKA5vg9sroBWIf4m2xMTSjqhvNZD8WtCvStlI0f5Nlub+Fu9sdCj225MT7/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fyFVJVBk4xHudVa9p0p6SCmEhhfucwc5aAafyJgHjQ=;
 b=Qw7ytbLE40ZvL0jAVpuisPZDQmXb4iG9w8hIw6P1ruKnVK0lQvM6hNvK1AGe9/DwQFJ+CVmUQKB5X5Nl928O8rO4tsgf6HM4ceepz2rFI0mZWfNZfegH/+Thjzc8r9T48saYW/A1246LTkc98xwhW9s0cDqIpxqevP4d/zb0MGc=
Received: from AM0PR02CA0148.eurprd02.prod.outlook.com (2603:10a6:20b:28d::15)
 by AS8PR08MB9978.eurprd08.prod.outlook.com (2603:10a6:20b:631::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Thu, 26 Sep
 2024 11:38:32 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:28d:cafe::27) by AM0PR02CA0148.outlook.office365.com
 (2603:10a6:20b:28d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Thu, 26 Sep 2024 11:38:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Thu, 26 Sep 2024 11:38:30 +0000
Received: ("Tessian outbound ff7cc14e3a8a:v465"); Thu, 26 Sep 2024 11:38:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 223e5c11924db30d
X-TessianGatewayMetadata: RoTikEIEO/+3HL42ohfPas1su5Qw9uSay3+EHMuEbe+IYnwqPMCZ+gTQSocTtY5ZvOnBKUg5AQO7zP/L1+Y7kOJmb3yzdrU3KnXF5U8922xkudbvyldLuOW/+clZUh7jLUKuP4t05jRCwSN64SRIbsfa+LfzR2SbXmyLWFlubKg=
X-CR-MTA-TID: 64aa7808
Received: from L882ece1c589d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E0FFB69D-813B-4690-BDFC-115A1689D0D9.1;
	Thu, 26 Sep 2024 11:38:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L882ece1c589d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Sep 2024 11:38:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdsRS7Vs6d9If9NyqRs7dFmKxoSJVNgjfWljtU4RK3nIVED4XOH2lXFjTOIsrE3s9GlE2BXPi83ck+JrXnLrg7h0aUIe+X1+ygI8cFe7hFy81d3Ov2Z+0rQfU0rTwY8iIGVOCWp8aEb9qM2Bl/JisdGGfmckcMTStVLuXzwNO1vohLXcAEnxN6BKGA2qU+wmGCuGk/rHSYF+Ys9+YuH5i+JMrbL2ZoWICsoA5uJQubsy5DNsJbfEdDSv5SCw5kxd7h3V0NHxQe63ZlQWSYnOlCCNmwTS1WMBE18+yyn4jR6DI+ZWfUzIHmc7+rz1A9Fte10SGhatnXeS0sRtr3hMQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fyFVJVBk4xHudVa9p0p6SCmEhhfucwc5aAafyJgHjQ=;
 b=MInocNwHooFQaLtT7lm+hWVAhdfQ2dQLi/ztiNr8kfEbm8dtmpspCnCh27a11AQksKFVsyzaRk1SIxphWb0BfsWAmXlV3t3vc7EvcYD53k19ceUm/xS4L6i7N5jIb0KVGfesS6mgjZU5Vd8DYtw4DNoiWKVDRwg9h4i9k2iUwzw1r0JtxnTn+I9EByxfPQzlZ8NDALm1UBJwrIky5D/2ZV1qtiCofngbpRwttez3Szf0/nkvuDis1AQZybtz/AywXGgyhqrYw6BE5GayMYfALGmotKojqF7Egb3csHvJeG3PmoYkldz7POoPd3sc+3F/JvtqryUVECLe3/JN7HIGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fyFVJVBk4xHudVa9p0p6SCmEhhfucwc5aAafyJgHjQ=;
 b=Qw7ytbLE40ZvL0jAVpuisPZDQmXb4iG9w8hIw6P1ruKnVK0lQvM6hNvK1AGe9/DwQFJ+CVmUQKB5X5Nl928O8rO4tsgf6HM4ceepz2rFI0mZWfNZfegH/+Thjzc8r9T48saYW/A1246LTkc98xwhW9s0cDqIpxqevP4d/zb0MGc=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DB9PR08MB9705.eurprd08.prod.outlook.com (2603:10a6:10:45c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.12; Thu, 26 Sep
 2024 11:38:16 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%2]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 11:38:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 05/47] gawk: upgrade 5.3.0 -> 5.3.1
Thread-Topic: [OE-core] [PATCH 05/47] gawk: upgrade 5.3.0 -> 5.3.1
Thread-Index: AQHbDxciqGpn3NopVEmIAfKdiGHPcbJp8uuA
Date: Thu, 26 Sep 2024 11:38:15 +0000
Message-ID: <A71EA3BB-BA63-4D38-9B45-D1B59D593F60@arm.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
 <1727246960-20665-5-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1727246960-20665-5-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DB9PR08MB9705:EE_|AM1PEPF000252E0:EE_|AS8PR08MB9978:EE_
X-MS-Office365-Filtering-Correlation-Id: f92de7f5-51de-42e7-d399-08dcde1fbed8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?ErBX4T6ZFUbeZVoCwtt8lP7TkpxKnNIwGehQAABDT+DXeHnu3MVk1LQgiq/M?=
 =?us-ascii?Q?5jG6qylT120ObBq3S9LseZu+oWSP+ntVB5oFPxJvbD7fx3bLcU7gT+YQjmJL?=
 =?us-ascii?Q?z9oL1bI1PMq3g9RgeLsD+0PoPVbOSrjhcKe6no+aNRSZ3QycnvSZoUFHFFlH?=
 =?us-ascii?Q?Xuzz4xojoJ005kFSj30njSsgyDPUHk6RYKEvxjbE3YDjQMmuY8pV9ruPIXHW?=
 =?us-ascii?Q?IRAzCbqn3Ljs6nOxfRcB70uhYUT4pdewK4P/2SWrgOm38hnPr8hTeujj9FMO?=
 =?us-ascii?Q?8stqUeUe5cM6YjR/sHbXPuv2J7TC3+7ruggBQdbRpJ8L6MYJ8gr//uYAonln?=
 =?us-ascii?Q?ySjTbpBphuSKxExT2RH4cs5pP3gabOOyhYs44BEOrk3N+axEMOnVJ7cVDfGp?=
 =?us-ascii?Q?fYNH0fZbDhpTqI5bBAgfRAEWDN/ZOzXcBP9pDNI6oQoufx08jLLmESnezIQv?=
 =?us-ascii?Q?yXwwbCnxLTEThA2Frit7KdOyz95GLRGb/VkwFZSTlvPrrjEULFsUeE7pVhhS?=
 =?us-ascii?Q?Ebcx2d4Cud0YfIsjc+6Qs1EN1v4jxWKfPDiSzGmAa2r4m6pyLTPjRtkl889j?=
 =?us-ascii?Q?MaE1cag/Qi00loNiirji12T9Ip05hYnEOANuZAkAnGTXX6K6DmHDCCOEpRsW?=
 =?us-ascii?Q?y0VS/Gb6SyRxRGxJQMNTV5LeitwSYzwJhvRleUo/cITtt6gvOFN0MqvO1E3j?=
 =?us-ascii?Q?Dw9Bkg4538iBEDr4jRETqmNPmhWF8PGJqpl+GVpxaZWxElw8j9aBJZ9YgoOt?=
 =?us-ascii?Q?u0pHe85zC08FtTXskDxkNrXsvak7JjdahSbIQZBUCwCsa82/HMGv/roqyStK?=
 =?us-ascii?Q?o1K3GtmBoxYPCI33qv/NR2LwApHvU1o7SpqpqrbuUj4pUXNpbpCR8TpbVAd/?=
 =?us-ascii?Q?a6yy+jZWjDLCjCrRwCTCuNOShEfHlLMTzlciLVfS47YKCMpXFDw1yuXi8PdV?=
 =?us-ascii?Q?V/0KmyRHsepVZTamFQCs/jcNiI/Xj4lsKQLZ4epmm/6foqyfW2ejiEcCO0NS?=
 =?us-ascii?Q?JdtFFXJbxt+8u0OO13NvIJ66lwxGFT9tCl44DIzTuZ7UsaDF4D8/+76qEd0I?=
 =?us-ascii?Q?9B8UOhuctDlfxccD2oNr3GVSvJDmVIMF/kI3KryjwT8a29aaMI6RhPqq2RGV?=
 =?us-ascii?Q?vYqj6SseSH04r3BzfpdZwYAaWGvrnUwhoLAu7N3EHVcho98H7I5AJZXNYo7U?=
 =?us-ascii?Q?XAjtJxYjbdwcvXxtyLChcWTW+GesChKVaGbGBXkIxvjWwnqbkmFwGqx3CEfh?=
 =?us-ascii?Q?uVlCa38Rwiif/nTwPVfaqreZ8tM/oV4Q58brfSPkPXuqMwYdS57gjJalBnI0?=
 =?us-ascii?Q?6lAjNFN88L8mCeZYK12bZ8fB5a5D1hWHxctK1I3CImxk4A=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6F47AD3B6138274EBA26A49CDA99262C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9705
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	19a80e2f-66c2-4517-18fa-08dcde1fb604
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Xr2tcQKpshtl+wGYO9NKquXJfJZUGtgBy03YXBQ1jIA4RAPNJM9jVWQUXQX0?=
 =?us-ascii?Q?yFzIK3ZqQIh0957YtISdpGgIyi50SiXSCyact0AYBrewheLScXiSxsOCusrJ?=
 =?us-ascii?Q?bH4K/k7Bf+MqGeAXxMBJraDA72sDuTuZFkAenrZHb+TmjQC/P75S5ET8OKXL?=
 =?us-ascii?Q?XZXJsvfLAEGekGOUhvdmdT5niAOdj2unPZ0qedWEKtRWeOIPadauqQCoCbm0?=
 =?us-ascii?Q?g3xFmavnOxGA+oNWVwsYetaMSxjsoVLMiGs5vgt0Vf1R7Wyeu77PomGIjZ3S?=
 =?us-ascii?Q?SFaHckYt7Tf28PH6uOqAj2C5JSHJFFgaLvydanJer98C8qoMzBzb0Jz7wJe3?=
 =?us-ascii?Q?IbOqMxc1Kzj2p3mSkeIs4uMZPFlG+FUiuMpbAA9VEx6ijDianwpPBQAADb16?=
 =?us-ascii?Q?4BbzKJVbMeICxbcp76M3KQFjRi1RxpzQnvQgLHFkdQJMB5QspDvw6LOEPwf8?=
 =?us-ascii?Q?9KLJi6EG5JeA2MzGlzWpRrCxFegXzB9MY/CRmYBP3Wf7EC48X6M0ypo5kkQC?=
 =?us-ascii?Q?/oeci1WnE2S2HykhTsJmgza06Y3K+OQXeb+CGqX8oc5kdtOe66JPe9RBpzNG?=
 =?us-ascii?Q?qOP1fe8dkWVwuIjHbQHwrP35xLYELAokQtn/Ugo32jJ90r1jEFEZKXvSl2y7?=
 =?us-ascii?Q?T5HYQYxRl6c4GwfSPSop7D4oc/aSV3UNhCYUBV8bGhAZNlocrnl/baeg0Q14?=
 =?us-ascii?Q?Gcdk/7pEhACSpTQZvq53cCTjTKm4p3h1DC6xmIyl05CXEtorfLxwpK7zek86?=
 =?us-ascii?Q?H3AA6cQQQGLPPsvfcZPgZweMjROxM1+TGfEm9nK2cgd6NVr2FdebfqF+T4qn?=
 =?us-ascii?Q?LxaO9R48Oyofjpr1zTJpoyRBs9aQl8djk6emfoq+2f+DpBvc6hM/5D2hoNFB?=
 =?us-ascii?Q?V6aRrZ0j9eaKB89r42krk0IR+CgUJ1I9PEAI9jSa3LGM77pQ4TBrKPCV1Rfj?=
 =?us-ascii?Q?fS0U8qOb3l5c35U0u39uNjc36FLNzoTlZVBazwYAKhpcY+sYs6go6hldzKRx?=
 =?us-ascii?Q?axdaSmopbWUD2CKAWd3KhW0XZqrzMie+TaXCv1xZsy+WQCN8WjvTsPlLDuSs?=
 =?us-ascii?Q?CRR/mhpGRbwhLJi86W/pBVkyNcMHdTCQZZWgS+l2HEFkGp5lVl27Y6VN4hBK?=
 =?us-ascii?Q?D33pz7Fhl4u+omAaG1cnnWPLrqxBqhlBs8kka5OXp5Jx1gMNiKLIVrYy1mi8?=
 =?us-ascii?Q?NLaaHFy0CRuC6IUvWOW59HMDMlu63xzjkYjtxXPnWu2eHlZf13AHxwYLS5GV?=
 =?us-ascii?Q?fUHRRKfYLBwkckqX4JhB7p6fDAtNWm/+XR4lCmbFUMeJTncoLD+Rnrxo796u?=
 =?us-ascii?Q?ZwRY4QLkoA0s4VScFwLrre78ToHOnNjOkSK53cEJp/4uyqxjoijVR4jknrDD?=
 =?us-ascii?Q?zJDLqoA=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 11:38:30.6532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f92de7f5-51de-42e7-d399-08dcde1fbed8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9978
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 11:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204974

On 25 Sep 2024, at 07:48, wangmy via lists.openembedded.org <wangmy=3Dfujit=
su.com@lists.openembedded.org> wrote:
>=20
> 0001-m4-readline-add-missing-includes.patch
> removed since it's included in 5.3.1
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - More subtle issues related to uninitialized array elements have
>  been fixed.
> - A number of bugs in the debugger related to handling of arrays
>  have been fixed.
> - Some subtle bugs in the API have been fixed.
> - Use of MPFR is now possible again on 32-bit Power PC Mac systems.
> - Race conditions around broken pipes for system() and read and write
>  pipes should now be closed off.
> - Support for OSF/1 has been removed.
> - The never-documented --nostalgia option has been removed. It was
>  causing bug reports.
> - The implementation of printf/sprintf has been thoroughly reworked
>  in order to make the code more maintainable and to fix a goodly
>  number of corner cases.
> - As usual, there have been several minor code cleanups and bug fixes.

ptest fails:

{'gawk': ['printf-corners']}

Ross=

