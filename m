Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F368FC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 10:06:18 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.6])
 by mx.groups.io with SMTP id smtpd.web10.3681.1749117974006502673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 03:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cc980CEb;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cc980CEb;
 spf=pass (domain: arm.com, ip: 40.107.162.6, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WMRF+5EzEFGWINlUMUevrRBwTQzNAMTVdpD3GCoyO5DYRUHIuDUDwpUMhmaGjd0uYeLQuXyBg2dn8gM7gfEbTuaZen5zZ282Yr2esAV3uK/4D927dNlTp8M098rNx17QM6JgrAZNQ6/Mx1tbZ+xnVtfOluxV3XprmIpIyF0QDczov8iTcUI5wOu0d92/A1RKnrpb2NqitePt0I/pxJWyMZ9yW8Fxxfp1yWWk/Mrhuvd2JOUHg8DLUBHlWoG9UEQKFZbpfpyybPJ4lW6I45F1rSMl3f0EgvzzS/OgsszLB3PzVgEIYSkdk2fgfqO7rHnbJWS3y3L951mxMSOTwBAx6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yc+54lib6YF68FUyiLHsGLxHygtLyCGBKHSiC+SWA7I=;
 b=rbRV4Cv+vgDnhOiXYJOXmM2KTIZNvWbvVEeM1c6xK+BLah3C2HO6J+zZa1rOBoYXFUHAJnp419WPJKmfJ29LMQPWmy9q5leRxs08/6Rf2LqnkoEYJ3Ayn+lqhmv8cQqV9s5NCODw4gcBn2d2it4EPGNO9D+smLDNDsLhABpHAmY9LDToXRxW4uLHQSbYK910SVvQgAf2MHGpN8laPdzSFd9NkjX39pDaURqVOcEWvSjT6fFKx5vE+xE4SJlMjWjMmskiVf8I80SgpCDRm3O2vQySW6vvM69PN6lo+BCE2UIIMxgnbeRLREKaiNDH1aHFV7/GOsqGUq6goeM1YujKCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yc+54lib6YF68FUyiLHsGLxHygtLyCGBKHSiC+SWA7I=;
 b=cc980CEbX5GNoZDCkd/BOrOqe0/0EvL2UTVP72gi4d+YytdQuPJcKJbU3sOUCealwqAVOX0zh8xtza8MPdGv7AbbE4pczQcRp9NVXM6BFzGs4aStTT30DE8wwKzjoozV+zE4ns9qjH63okEBAeny7WmKdLs9hLXnQqnbff87Q3s=
Received: from PAZP264CA0062.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fd::8)
 by PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 10:06:10 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:102:1fd:cafe::b0) by PAZP264CA0062.outlook.office365.com
 (2603:10a6:102:1fd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.21 via Frontend Transport; Thu,
 5 Jun 2025 10:06:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.2
 via Frontend Transport; Thu, 5 Jun 2025 10:06:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9fSr+lRB72I6LGfXbOfIQBmURvA0vKZuuKJGFF9odc9bsQC4iqJsAk91ExpW7uNj9OxyXvjJYKpq9NKicIHeoh3W+hJVdOxLo9ng457wSo8ORprOLxbAnxvYuwQ8aV0yz8MjaFk3Mi+EnL3T6YClpAa695xbjbHb/xavhp+BsXK2mH47mbBhzTV431CiyTeG5iwPwB02WUWDTaahMpT7ZVMNJswUlwg0igDm3v3YnMyNbw+MS44rc/aDedXUAE+FklznLooHDjWH65fkC3tIxYRwmBiosB2ccNuQJEOzamD2X/PWKBqInHMXALYXMPTvi7WjARX56olA3xRo6P7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yc+54lib6YF68FUyiLHsGLxHygtLyCGBKHSiC+SWA7I=;
 b=EGry7K7c3zf6PuENAVXupnQXZy2phWU3IxmFeDnqPFgQi/xV48D0Ligje2+bjc/c3p/Uee8k32rSec2sQyvR6V8Yysk+JtYH4N3e2CpgtRMETTvmJDzuW68fMKZiFfzfIMwZ7LBhf9d/zvlkL+6DnLMd0p5oyTUSkekgjkS0FRmd6daGrDzRnC89oWP6o1KJY388+oTjjzUK0gJ1BSTmnNMcrQKXnKPMpiPciZY6d7rVnYAXtUyRIPoQDk4MaLvtZT3NQgNpqV06ngIgg/L14qWJEyncU9tLq9KzGXVEhv8mmwM8I8AKotb59QI+AYoLGwZOr3r48R6tXs54kFo/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yc+54lib6YF68FUyiLHsGLxHygtLyCGBKHSiC+SWA7I=;
 b=cc980CEbX5GNoZDCkd/BOrOqe0/0EvL2UTVP72gi4d+YytdQuPJcKJbU3sOUCealwqAVOX0zh8xtza8MPdGv7AbbE4pczQcRp9NVXM6BFzGs4aStTT30DE8wwKzjoozV+zE4ns9qjH63okEBAeny7WmKdLs9hLXnQqnbff87Q3s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8037.eurprd08.prod.outlook.com (2603:10a6:20b:573::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 10:05:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 10:05:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 28/28] perf: Do not treat maybe-uninitialized
 warnings as errors
Thread-Topic: [OE-core] [PATCH v2 28/28] perf: Do not treat
 maybe-uninitialized warnings as errors
Thread-Index: AQHbyhkiBYmyE5mGLkKRte2it+GNGbP0boaA
Date: Thu, 5 Jun 2025 10:05:37 +0000
Message-ID: <EDD30BDA-3E47-4171-8FA4-594564A7DB38@arm.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-28-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-28-db97c2eb3756@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8037:EE_|AM4PEPF00025F9C:EE_|PR3PR08MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: feb6ba33-9590-4fd8-0b46-08dda41898aa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?KTjOEwJU9QV/fHzXXeESvOCtuqc7wfSckjwi5Er3eQwhi/qy/kVD3zMl1xra?=
 =?us-ascii?Q?Cfww32a7SwEZxEy06+7jbhuGRm/TkAeETe0YVHt4h0nfS5CFZjbVlyTVm5j/?=
 =?us-ascii?Q?ZwObJSLol6n2fO3T4nK/ZUIR4tM8d0mcqQloBCTNeklR1K/2Tpm0HA1yIIbo?=
 =?us-ascii?Q?plbL8blfD98fdWtiwKboA6sRwlqj7tFkWcYRtVFwsG94iaCegYiwtdtG/CMe?=
 =?us-ascii?Q?KbULduPxz1/AuUNGaSCZcPHw69IYFdzeNsR0I6FrQzssEJkS+gcSAvE3ct1y?=
 =?us-ascii?Q?Ov+dxPcztSawIoqXdKCJOd+HgEyPA67dapNzIMPu8HCy7Of8kfV/TJ2a8xZt?=
 =?us-ascii?Q?vmFGsQQB3iCauGZVTdu9zScLpJzBUAtdf2N+iv86gK59R6fwtV05XLE6sXm1?=
 =?us-ascii?Q?7ZifjHCcdX43YQ7xFx0oKWXeJqfRKzkipva/VVM5JguOPYaL0pCvBHBSyZgY?=
 =?us-ascii?Q?wHv6hMzYggqGU1upPGnTQX2LUg60sEwTzsdxJSEyAAlMahVSQMj+5eoKAM28?=
 =?us-ascii?Q?XZY1Qi7oabmPryhMe+TwxFhC4HazNzgtcHc4qeQ2YFP3zWla+PPotf/sNjwe?=
 =?us-ascii?Q?jkmo7sLuV5ZbegFd0IGMqC7/lUQGXJFE/+Iadt3lCeV7fBPtOaSUH0oVacCw?=
 =?us-ascii?Q?vou91j65tNhJDhA3+6pozUWyavyIm8noSDKTy6cOqUUXnc/7kOaU0Go4e6K1?=
 =?us-ascii?Q?egodtNBi+oUV32Ji+NfWjJnc4tsiWliANIdrJLi0RSdKM3nABSBHyKCxrmGx?=
 =?us-ascii?Q?W2/V1W2lb0xOQZeQnLjfJB3a+YpSLHRHKgEaL/UmmMqxQyZAPimutxwxljZx?=
 =?us-ascii?Q?HQrBOihmpv7iUOWBCFeAfO0HVAhM/IKvQn2IjkTIOL8DzxMRIKXkPL0WltER?=
 =?us-ascii?Q?PrdrEAQyYtcFNMm9meZDMyNQrEXk2Ay+bgQlj9BrZQiMiEm+nuD/EnJfo3RX?=
 =?us-ascii?Q?KaKYECb1Uql1C6kfLLwlozmuGxNsh9EJFGXfpjs+OIgVmUCCB/ss1uxQPREl?=
 =?us-ascii?Q?klKq3BaavS85urV6tU/fK4cpBSMdeSDHnywDqjtxxj1D5YcfistyIBgrY5Pg?=
 =?us-ascii?Q?ymtltGOrE6fF6bbHu0zjJTmw0pPy/qefu7b7bLAmU8e5gmBJesZF+mh8li00?=
 =?us-ascii?Q?bqRdOhBUBCq6zd9Q3KZkw9Cr67f9sRY5CBeAYsK1rCTPZj7etqNY0eeEyDLL?=
 =?us-ascii?Q?wKmHqqZlgwWan3OXQjaX87CQAfIStImbOdxR4qxErgycpjnERcPTYDea89J3?=
 =?us-ascii?Q?P0nYkTvf1jaJNPqOuI6kWxbY1PjltjD3f+yK5ZPrZoVfARuYB2WANWoUFxco?=
 =?us-ascii?Q?0Qy4X8iMfm102vRFblzVmmkc04JGo+OjPcC97CPG5LsS+IAtUrApfu00ILLG?=
 =?us-ascii?Q?nNUK+fdRogKDSe96POJ+2Oko6uui3HQ4QmCAZWNfG6am+flu/OwHpXLblmnH?=
 =?us-ascii?Q?88dUEWCEq1MoUFnppP2DtANKOkNDTjyM?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <718D36683CEC0B4B8AB7FAF78B1B4356@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8037
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e5b41bb8-e640-4c5b-45fa-08dda418855e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|14060799003|1800799024|4022899009|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NaRRz+uheguvYJHUxwh/ga33pd4tMOYSACe3jq1QIPihzCU6Xih/tEvXyuAF?=
 =?us-ascii?Q?rt4WjjcgqDOj7Ku9O2D97Et5N6h0WGlTQbue6qARFaMy2kK+AovUlxshncA4?=
 =?us-ascii?Q?Xd5w0FcHnpwxvFD5e0Lqdj4Hudcs7gFZtPGiMgfdfGsTIKvWsiZfLvmm5Eiz?=
 =?us-ascii?Q?AbLMON8suWC/McKZiULOpCgTUUHmLcnXRPk7tY4ctv0b24d1C2fWD008KyhI?=
 =?us-ascii?Q?//7dqpOeZBon2yZwY+XmskknldqlPRlKHEvbeJOsQQcXHCZXIC6f26e7oG7L?=
 =?us-ascii?Q?MkuNKlsngAPVySTsa0NP9sx8IqmWwFvQWfL7/6qe/XMBG/DVSAR9D9mM38SL?=
 =?us-ascii?Q?zZLalUE52JGXfVNB+7L/lbT6XdGT2gIVOT5YhlRnW6+J0fuNvsM8FP8US7b0?=
 =?us-ascii?Q?wemwqLyzxFhB9q+d6lIHfwkbjEdSXq8IQ3SW6Z0SqwDZhnRjrQzTES4a6B/H?=
 =?us-ascii?Q?Nr4mOU+DBDwD/8TMUC25ZVGfisB8qORXkE8/Tw9BOXhbFPVgWltNELpZ6ueA?=
 =?us-ascii?Q?6rA10xxr2ZnJbyhZWuLI4TmaFgUK+VnaN/ntF4IxQGcNCTt5oz/dtDPzjmcg?=
 =?us-ascii?Q?amIJ9xn5EUU0GjBtpaF+Hy7GJ3w9Tt45tQWWnCmiTVifOLkwS6VzRUaxNeJd?=
 =?us-ascii?Q?R6iEfgDng2l8lOeko5yTmHtzA6yhywev4ORn4otD+ddQNrxkmgGoPbSQHfc0?=
 =?us-ascii?Q?qJtgYzngTo9v2DNf7YOOX2tfcTeW/5lkfufkLRQtQ/g6wNBVMIXjc/8mErzn?=
 =?us-ascii?Q?GqLpK8ru3kss7273YCiBT7SzIrTyLk7S2xRS/XbxSrtqMcd+j6DikvAkwybg?=
 =?us-ascii?Q?3GC3CPGn4j4TiLrHIDhjU2sVjhdeM4a5xl1E1oWUV0JbFzg/XTFAVPwXxIyO?=
 =?us-ascii?Q?JBJblb/V2geBrrZ4ONr/DBBe3lRkjz8Kmnty0Cxnr441rJQVQIVhcSmJ+nWv?=
 =?us-ascii?Q?8xKReTC4HdpT7eGQMpsjsJ/O52WOCy9/xnWRO5qj4w9ndT9SB+B/h4RHZbEq?=
 =?us-ascii?Q?jq4RItaqtQXX4Nrb4zOJqaiwmj/O+KcD6c6niPa5Vz20TfGTK9xfOF9KahGY?=
 =?us-ascii?Q?8dFEWH+L6mV9NGBz70HcTyrD5IKWCS0UW8d1mta5S+MP7rC6QYLsm6E17fB7?=
 =?us-ascii?Q?vPaMb0bMxcGvAPQ8DPi+Ppu5PzWLllNjg32wjMrUZa2Tpx8YK4IfQyXpjDL8?=
 =?us-ascii?Q?vaKD/p9lJK3qEB0SnchsdSE0zYNjbSRlNZww4YpaDX1E2kg0R9ShReRLF8Vn?=
 =?us-ascii?Q?6ovOePTPmgZWomNd0y3gKqBXMCnfHlgSmQ06SstwPeeqhLSYJ1G+GJ4WPVe6?=
 =?us-ascii?Q?LO9cPhiIbPjauoPPlDpqgpHR5VMeTut2+meE+An/Sjhbt0fJj7dd1GCrc01T?=
 =?us-ascii?Q?FbkW4Bk7gaTutlaXsEGFGxfgMtXJvrYNdbZArlMvLML4m3H96UTP0anLoYFX?=
 =?us-ascii?Q?UbHAcw82xCnDSfevAsQteA1IT31s6cUBHLoODBLK0ddehS2EDG214A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(14060799003)(1800799024)(4022899009)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 10:06:10.3529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feb6ba33-9590-4fd8-0b46-08dda41898aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5593
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 10:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217999

I just sent a patch to linux-yocto to silence this at root.

Ross

> On 21 May 2025, at 07:20, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> Clang finds more warnings in kernel code, make clang happy to not treat
> these extra warnings as errors
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-kernel/perf/perf.bb | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index d06dd2fa5a2bb9b2982572081ef57e2dbafbd5da..0d19e1bdc222da26a5ad0a1d4=
964acca437a6692 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -81,6 +81,16 @@ LDFLAGS =3D "-ldl -lutil"
> # avoiding the 'buildpaths' QA warning.
> TARGET_CC_ARCH +=3D "${SELECTED_OPTIMIZATION} ${DEBUG_PREFIX_MAP}"
>=20
> +#| libbpf.c: In function 'find_kernel_btf_id.constprop':
> +#| libbpf.c:10009:33: error: 'mod_len' may be used uninitialized [-Werro=
r=3Dmaybe-uninitialized]
> +#| 10009 |                 if (mod_name && strncmp(mod->name, mod_name, =
mod_len) !=3D 0)
> +#|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
> +#| libbpf.c:9979:21: note: 'mod_len' was declared here
> +#|  9979 |         int ret, i, mod_len;
> +#|       |                     ^~~~~~~
> +#| cc1: all warnings being treated as errors
> +TARGET_CC_ARCH:append:toolchain-clang:arm =3D " -fno-error=3Dmaybe-unini=
tialized"
> +
> EXTRA_OEMAKE =3D '\
>     V=3D1 \
>     VF=3D1 \
>=20
> --=20
> 2.49.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216996): https://lists.openembedded.org/g/openembedde=
d-core/message/216996
> Mute This Topic: https://lists.openembedded.org/mt/113225040/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


