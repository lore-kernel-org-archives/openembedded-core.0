Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A5DC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:30:26 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.60])
 by mx.groups.io with SMTP id smtpd.web11.8953.1720096219012225170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RMqhUhnL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RMqhUhnL;
 spf=pass (domain: arm.com, ip: 40.107.241.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DGCanhFCAFNd/qL+H4lu4BjiQgtCE7H6sLJ3eewnTaQ1eS5+ZzU8PWiZglqokuTjNgQfJoj+P5+yz/X4SJM7KZrhwTtvDQGGgoq9h9nEii6bKuzi+vt9F9drIzfwW6ZbdtiTTuiI/BgIlj9yECWb8wbXmAzQyZIR8HPkIomupDJyIddSDO7iB4yfNTuhtuFWMHfv9vUs+oCHBjW8LhiKWiuMF/S4ys1gej0XcfcfR5DlcxrstFTotbyQDxqROVwQavr4H4gybQfyFEsOn/xcEjKUSA5zSs622Lomr57LWTo3sXIXkVjVTEjuCm9733+CfD3JO+mX02BfwJIgArLcnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1EFStb8655oJzhAVIxcBuiNZSY2b27rP011aiw5wDI=;
 b=WgS3GWmpSvn3LQQcbC61wdafUepAfhzm2ecLvPS/wP5yLB7D8Xmm0WRUddhq0BSYdnmG+56gJ/H+WCymCwWk+mvt5R8P6PG6ossM1UPUxMLDKvg2jyAkMJf6cNfDxWxJJL9blkI31xuT1Dzr9i6Q5q28TTTz83ChIJb7R3DO1zX5IJMz/Vewhf3TG+Um6FX8SZEVaQeKgKhO1WoX+zh9oK0fdle7DF6wbNARLL4ZFGucPyLx4wugZmIJJmRup9/VSz2zwllROozwXJVFzWQvPyZA/nBPmfbs6lYpOH2QQ11b5h7YO/hVIKkUaPkFpSDNz326xuCFl2+zsxXtvHmPCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1EFStb8655oJzhAVIxcBuiNZSY2b27rP011aiw5wDI=;
 b=RMqhUhnLerBrDWxxfEBU0wbomR8tY2NcYtdaJ0pME4xtdWrh81wLyoB4JPb+ksQjO1r7uh9lK2vK10zl0f1AJfbNd7f2ISCrJI8gKgWyhCr2KOABD+y0Ni7/SHjF6ygTaVLMZt7aCJGMWNIfbJiaF+kSAZ2fE+35IGbCa+GyNic=
Received: from DUZPR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::8) by AS4PR08MB7855.eurprd08.prod.outlook.com
 (2603:10a6:20b:51e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 12:30:13 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::d1) by DUZPR01CA0002.outlook.office365.com
 (2603:10a6:10:3c3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29 via Frontend
 Transport; Thu, 4 Jul 2024 12:30:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7741.18
 via Frontend Transport; Thu, 4 Jul 2024 12:30:12 +0000
Received: ("Tessian outbound 04f7108c184f:v359"); Thu, 04 Jul 2024 12:30:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 856b206e163fe962
X-CR-MTA-TID: 64aa7808
Received: from 18656b4beaf3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D240F745-08DE-40E8-83F3-0881EBDC92C2.1;
	Thu, 04 Jul 2024 12:30:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18656b4beaf3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 04 Jul 2024 12:30:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6ABbQXA/c1/b1iadFPPsl2spjKZSgWAI1BJPgEtr/ADBCagpWHaY2hNMuLhPsJQdgv7kdx+FnEnhtsm8RVO8V4Vpcbcq2yPyimDYtO8wTecZ1iQrsE9ls+9pCNli6A7vQVOqxyEgd/CNAkrXqCH5l4k3DXS+ycAc+kIN0m/9f7nKszqAnR8zQFMTccPJh8wQ3+Lxa7rUNgKvx8fleoud0Ai3cBfe35a8Zk2xKUWdioRvI30yFWLLBDDihaLd3kOysEpufRPooNRLdP71xeZ6Zvmrv/9G6/WW1NVPLiwVsZI7W267tfGtT4qpAS0XuuwZM3dTl8baTBXhLdgvXPp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1EFStb8655oJzhAVIxcBuiNZSY2b27rP011aiw5wDI=;
 b=OtyN7LJQWuVR2Ay2wr/9alqEJG4fBFecR541yOjoTijwzm3F4wyjWneC9fyGFE7PNnt/GNrs7yOh6e2D43/hHgBwhq+uX/JgVTfN4QFEvrAjTj0iu3n1H48qnOieBl0fQhUo62uqCh/AANlcFIZ6I2svj5BLGsBq8WydQk81+02bvFtCiTuZ9Tj2bNkOz2d3g9awj9vbUMwrYtEDnepK9OT55SL0vR5BiauvL+6mnbMK6S+76pqoJBsGrGKZd66+ZxqJvcwM90S89QmntspdbwuzqLbXNabfZ2EM36sDm/ogtdUR67DEZBcQJP8X0odnypB80aP5GQummG1PUFcWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1EFStb8655oJzhAVIxcBuiNZSY2b27rP011aiw5wDI=;
 b=RMqhUhnLerBrDWxxfEBU0wbomR8tY2NcYtdaJ0pME4xtdWrh81wLyoB4JPb+ksQjO1r7uh9lK2vK10zl0f1AJfbNd7f2ISCrJI8gKgWyhCr2KOABD+y0Ni7/SHjF6ygTaVLMZt7aCJGMWNIfbJiaF+kSAZ2fE+35IGbCa+GyNic=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7473.eurprd08.prod.outlook.com (2603:10a6:20b:4df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 12:30:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 12:30:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wuxiaotian@loongson.cn" <wuxiaotian@loongson.cn>,
	",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: qemuloongarch64 fails to build binutils
Thread-Topic: qemuloongarch64 fails to build binutils
Thread-Index: AQHazg3lfFEdkZLTx0GRGJR7warc3A==
Date: Thu, 4 Jul 2024 12:30:04 +0000
Message-ID: <56913008-164D-40A7-A561-9CCDC39AEB02@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7473:EE_|DB1PEPF00050A01:EE_|AS4PR08MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 966e51c6-504a-4253-d092-08dc9c250d00
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?tUa8kFtEhZp4ETjJsqZXjcfs9w0CwS654ClfLQNWluD17uotimh2Ng8YVf+K?=
 =?us-ascii?Q?N+eNR/FrE+3Gj/ChTQqN/kvf9Kzrlb0VHTUphxmCuOEwLPYhMXLFI1/UV2HI?=
 =?us-ascii?Q?z4tcFbMeGLUFPVIQu8/2bupOXt4vhpjRJfYFQfNUYkGofveaKrddMfEnEpTR?=
 =?us-ascii?Q?6vyxazyKv5SmWiU+SpBsUdHZ92tB/cxRkqsFgHmP2JL5STQgIk7CkLWkB+JI?=
 =?us-ascii?Q?FuGOBqDkRaKz0EPMBM6iIbc/+rWRfVuc/z3r2qPhn7DmvR8s5Nyx5+AJg2iz?=
 =?us-ascii?Q?v9gmF5HreztenOT4BFpoaXB/DJIfxzMvZcN5u+gdlt+2gzd2A6RxiB8+yfTa?=
 =?us-ascii?Q?pMxEwqAXZG+Nyi8Ks3skrTxa60tTisrRDtPKKPd5y4SHHA0WvHNHG4UNzVtb?=
 =?us-ascii?Q?gSbt417qDLHRIxlEyGaCkR/ulol2OP7wXgHfHclNzrb5enq02NgrVNQYudXd?=
 =?us-ascii?Q?o18rwMQsp1Y+1BqBOrFmAduH6Lssey98PqqMbRgloSnrwxV4Qv0z7l+6HnmO?=
 =?us-ascii?Q?PU80HdN5uKgJCDxbg0UC7Gl+u7+vxFBsfqysfb9hsifYAMzOom/GHuK3+s2Q?=
 =?us-ascii?Q?JRGWv5dOzWi67haJZ+9o3Ue1IgXWuxS8CW/u18rGE2B+4Zg++PQl7gsMeT/C?=
 =?us-ascii?Q?OkT9PnzSUWENyg2fIQlAeXCIwkQ7FUyhzShe80TVc94uqQkydWa8teTs9S+4?=
 =?us-ascii?Q?kkIv0xndRCwkgoEZGlTq0/dFSqhZ77S+7M4PQLhg1RYq+G+Rc0gRQpe+HaLi?=
 =?us-ascii?Q?M/4rTPvRHzhvCxkvNU15lNkB6QGhfWHEJVfEfoLCBLHKeYwFB7f67OMVveqy?=
 =?us-ascii?Q?0/74o1HOJUQMH1epS1rsZhG0R68/g+J0LkEFrooc0+h23xpoD6pDFxV5tctT?=
 =?us-ascii?Q?ZsdRqygstVKEV6ImlxYdwQKAIDMfMvQcguhFMFmk5TFsuiXyY6t4yOo9IsIW?=
 =?us-ascii?Q?enxgvUB4J6aKKY7b/imiwIbLP22gC2+DPBSx3lN51NvOlQOJckCNzLGZagpZ?=
 =?us-ascii?Q?MC6l9EuIYBI4OxVBQXRDWZyE/8rsVYlkFGrPcsswlpEilpWDDnVKWkCExOYP?=
 =?us-ascii?Q?/KyfFcYJgEBIG+38oUX9RfjPGyUoCf11JbuErA8ce9kzA9QRVwBeKQyHka7B?=
 =?us-ascii?Q?/E3JHLaUbCeCMWAq6wSKtJc9pjj+G4KA996Sfeg7w7hlsm5eWCa3xOUZW+6W?=
 =?us-ascii?Q?ZI2YUgOPThVXyrg6n3Qq53MX8epsyVYfDst4291kSH3LqD8hRR3WF1vNAYnA?=
 =?us-ascii?Q?Iq+/Nr6Gqpy+1L9k+GuSYzQ04Hh1/u22r/VICbXPEJwQO0UzMlcO92hbbPpB?=
 =?us-ascii?Q?x2UQSSO9mJ89DsK4vtHjI/C3VtNkSbpyYxiT5w8AVM/Mf8cdmYeubGLN22RR?=
 =?us-ascii?Q?pvzNhdSKBQe2m8LOt6Bsr++10s3Gj9u4sDW7Y8eGaILnhSqmRg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2D9E3C1690D48C41BC4977BD555C12EC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7473
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1078ac6d-867f-46c3-4d4e-08dc9c250811
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q2xha7Lti+ozIUZs92iGmAd3wDh1AjPtz9y8rJoOHlZR9QC+tVDo/UtoqfME?=
 =?us-ascii?Q?Tn0dZf7FAA2I7Pvl+waxhB1PFtYIvM5EgcJosab74oMKEhyAXPzxsQqk6BbT?=
 =?us-ascii?Q?23UpAAQkecJ3EAvcXqYN1cWsT4EtynsYAd8aJYm9u/loqLSJNkpP47rTK3oW?=
 =?us-ascii?Q?APYu6jmBqfcChXJjv/Jl3wsNxIc/zsY15RNVhserogQUtBFD1faFJMvKp9he?=
 =?us-ascii?Q?DHw/PEFXMI9nxlwvQI8L8QdecoLzhOMTinIXJ4Kz7m4n6J7WQKd+Gz8n9F/v?=
 =?us-ascii?Q?jqTxmcq5XunXNfaJ8QkRZKYCyydUs8ccRHNRRUVmayrQ6You93Vmc6T7L6tT?=
 =?us-ascii?Q?ESxF0mtHVslKarhHjVOSly+tQ9xJFkJsgp+pXaJNU7VKm9jQOjbtQ1LOlijR?=
 =?us-ascii?Q?C8NNDa9aw7JoI4n6npqrbWGjZs23r+TrDunP346BJa3uMEIZyyXjYJJOM424?=
 =?us-ascii?Q?H6wkqn6pnnEFn8dfnfo+mt68YwI0EUCS0ofAVHzdf0NSogiw+5vh9kSfBpUi?=
 =?us-ascii?Q?5VQ0WUeUo3yGgElfRzGVIepARkoGUSkOrJUXtpe4C8h7N9kzSdjxeBnDCbDp?=
 =?us-ascii?Q?O1YUFC/iyk61fe+kDKQp/33Ufq68ipRFUhKk3+bMVD5pE/XtARWx6SsvtH0f?=
 =?us-ascii?Q?ESyRSAuJSuKfAsgWSulW6lslzZlu/rTObxWL8+kqT8ufqDaN3nkRLRn2rDha?=
 =?us-ascii?Q?6IQb6T6pBcWpbC0/2mRoHy92tsSL1Vb6O59ufhjDoWuMsRiyzvYGg/Vqdpcm?=
 =?us-ascii?Q?XWVbXNwYBczeoLoJmL6W2suN40SPMskOZTKCgm49quTxROjem6YLxPUP/gUe?=
 =?us-ascii?Q?agjPVajZFNE68OMf06K6FGS/Y70GaTBLGUCWAS4HhpnGAJUpRu0Amqb0Q8SM?=
 =?us-ascii?Q?ArGmhWDKS7FTAUx8sXxUAmjHxnih9sOsWYadvRcMIazGsMHlyQvbBbELgteT?=
 =?us-ascii?Q?lJXvI04TlfEf4oJ6muLvDcCs7PGqxIrqIBxrkpKMMsEQT+TMgCBiYYVOwunA?=
 =?us-ascii?Q?RvhtEs6b9E3VUfduRi070ynPZwyHuHhebrm8sWkJcPK0oXS2JQbcmZcgrXMd?=
 =?us-ascii?Q?L9Nf7xMC0qTLEd+yTzmmq+2uXlPHBvj8qxh2H+U52xKdxa249W74DW/tmS96?=
 =?us-ascii?Q?afjO3XsL3QpqY3LH8cTuCJE8bfg02KwBa0/I4i/JXHhjtUiDRKrQO3rFif8C?=
 =?us-ascii?Q?CSWioBfZ3Ss+zNZ8v/lNBR1zNmdmBtM1t2fBcXNFjUFmIFbSKf1HBHB7UVNo?=
 =?us-ascii?Q?eqBglkOR7woP+56M7boag9eyX2BA+PiWUZRaaBHM77G7Zso1IlJHOovj7jKa?=
 =?us-ascii?Q?REhb6Uhj/toJOysVF113V46PXyZv6zum6eYJgyNzQ1mIsP9hmlzCvk7W5BxY?=
 =?us-ascii?Q?zZoq5JCV718ygn5A3SS6FmuJgnnueCzcsx0GhDY0b2U+ofuo7uXX7SfK+z48?=
 =?us-ascii?Q?b4lC7adQWuSbPreBHY4IK4iP7sWW2g5u?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 12:30:12.5491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 966e51c6-504a-4253-d092-08dc9c250d00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7855
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201565

Hi Xiaotian Wu,

You previously added the qemuloongarch64 machine to Yocto, but right now it=
 fails to build binutils which is obviously quite a problem:

configure: error: "unsupported target loongarch64-poky-linux-gnu"

Would you or someone else be able to look at this, or should we consider re=
moving the qemuloongarch64 machine?

Ross=

