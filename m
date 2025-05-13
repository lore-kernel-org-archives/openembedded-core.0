Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E36C3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 16:57:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.55])
 by mx.groups.io with SMTP id smtpd.web11.81846.1747155452704687041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 09:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gIMMqLLx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gIMMqLLx;
 spf=pass (domain: arm.com, ip: 40.107.21.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bFZS8Qnn6MbxcKbsbDi1PR2FsmVFJGUYX2XUuuKlR6wYEX+jOd6cXvSD+0dVl48JXzPNw/5bLlJ5roBiN7CzR9hEF12mj7Tra4P/VhaTW4l0CvTbB2i1JxszQU0REgWg8c7B6ynMdAA0xA8Kef3pND98t5zqJ3MIABwDWxfGEQ2Jis6sO24CeJov5w3nf++nC40tmcPCHOxKz8PIKudSpTzKuw+dBvhA7Soky8BP/T4xygtggV6jOO4GhkgkLmtzTBtJ75eLbXTMwgUlMHO62RIPboqp1GgPqrdXupP8z+Uqybm2EjM0et25mxEVpRRb733fqmCDVKkEeCVZX1JXMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39H/+Rbw4me7q0Rn6NtyeiiYe3yinmp98mqrE19C1s0=;
 b=APyMzjy9PYY2QEUjI+sIMWcFKoexNizKN8JTrX5QXrFC+DCl9Nmr9j8TJ/kIvlspnDG5kjMQ4FTAMm7PvPxP/rwfgNpPbibHJM3uOkGjyTGiSGKb7n1/oQUTvOVmgzFw8b60JDSuQ6f89uq4tY30k1q8GtNHlybeIHESslb4gd+1QT/BFGd1FncjWTMshD3LtWdLMVm4+dD5sdB/u9sjeX4s1aUrFjozEyB3oU1/HhJkw7LIqmbUqwWqF4ROV4mweh7plfSkh1fXRq4pJbLH6103q4wGwVsIQhsIj7+Gc84OETwcQXXosiysQ0A1EUDYHszReqVPw2SI0z4kG3AlwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39H/+Rbw4me7q0Rn6NtyeiiYe3yinmp98mqrE19C1s0=;
 b=gIMMqLLxoz5wyHFs1BDkzwDE4KtMDphK67w6+klihZC4azBxZthYQyFzblrauyA1AkHltyFIQsqmcLDpXLk/kUsXa7uJy8mPH5P7yZMc8S5vUX9whvMKI3c7JkkaIj25eUSKeKuV+RaujqEV35+9XgCa0tfQmIATAecdoCPoR2Y=
Received: from PAZP264CA0233.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:238::22)
 by GV1PR08MB9940.eurprd08.prod.outlook.com (2603:10a6:150:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 16:57:27 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:102:238:cafe::85) by PAZP264CA0233.outlook.office365.com
 (2603:10a6:102:238::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.24 via Frontend Transport; Tue,
 13 May 2025 16:57:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 13 May 2025 16:57:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5Aic0gKDnQ38wBMV5SOBxGjHVr0DFvrCThrR/YfQ+eqTOXBhhDthUCMJ+czivxHouQyWw5xDZYwcbE7sU6bq1Jw5Z/vtg2q6m7YL7ceho2cRLVAMUN6N+ktjEeDRhIN9zzZzRg7ygUgwWR6JoISVAe51vNC/lXgJZJqnWiLXmuESgqpN116PHgKAwlYaNncKxfq9TfA9+8iUPbu3wbcqgxuCghD/5CHw1suWq1LBfE8baw9Fd4xXtIM76qIZvh69R1yi9ZHzxJdzE+/2fxkXehVaSY1R47VcU+BjGumBVvtE+kHvrmYwxx9/2sILQAvSciqEQ9f0CVne+OmsUrvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39H/+Rbw4me7q0Rn6NtyeiiYe3yinmp98mqrE19C1s0=;
 b=J7Mym0gQuKdqmMuy6ekhbUxXKXVihIw92AmvJk5e6QnOP2CP8tKFUXNfRgOA4IykmBUTcGejcbcDa0B+v8AMvCetXbrq4iMq4haxasF+Ox62gmABZiVt/1Fi+2wqLoVE9hBTqjx5EI1TzYeL1Iryx0oC78ZuJajQ1nGQb8tQbbiIa9CnqnSNsy3dgf8nLP+21IBG/rYNfODRn1GaNiICDZ2iiHMgPfPT0sQl0kRD7Xi6lrA5BdGV60fe6cWjWtZPWV4VAxbIE9UfVuchfHC+TiTmOt4yE5W+H1vz6rsBRZINq+wqwEvMNHh0CStpxGd5ONAHtnZcBz85MHa9bfXPcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39H/+Rbw4me7q0Rn6NtyeiiYe3yinmp98mqrE19C1s0=;
 b=gIMMqLLxoz5wyHFs1BDkzwDE4KtMDphK67w6+klihZC4azBxZthYQyFzblrauyA1AkHltyFIQsqmcLDpXLk/kUsXa7uJy8mPH5P7yZMc8S5vUX9whvMKI3c7JkkaIj25eUSKeKuV+RaujqEV35+9XgCa0tfQmIATAecdoCPoR2Y=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6234.eurprd08.prod.outlook.com (2603:10a6:10:202::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:56:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 16:56:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-python][PATCH] python3-rich: Add native and
 nativesdk target to the build
Thread-Topic: [OE-core] [meta-python][PATCH] python3-rich: Add native and
 nativesdk target to the build
Thread-Index: AQHbxAT52Iibi/0pFkehthW/USLlkbPQx/YA
Date: Tue, 13 May 2025 16:56:52 +0000
Message-ID: <C906811C-D515-47A4-8DFF-1CBBE7AF753A@arm.com>
References: <20250513124526.4072552-1-luca.fancellu@arm.com>
In-Reply-To: <20250513124526.4072552-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6234:EE_|AMS0EPF00000195:EE_|GV1PR08MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de12dad-2556-430c-5c14-08dd923f3cb4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?qD/tKpsHRwUaOO8TNQ5flB7UAwaF4TntD+wlJF/nceMh1ZUU5IW1Ilceufng?=
 =?us-ascii?Q?4OQEaCvNLWCA2o4BRrxrhVLXaEYVnAjeZVWYRqmTuy5i673a7RnX+2rtawTZ?=
 =?us-ascii?Q?EfH6zpQ45vHPwLzyTM2XPmUqWEvgi5oKfa8gFLpUyEFGhe8FlOExRVYSu/cx?=
 =?us-ascii?Q?uHheIarf/xt2lYWe/SjfK47um8YO+KwJ+fK9XeKKiAJbnzsUi1ri6NlSiHuQ?=
 =?us-ascii?Q?k2GmdDL81IpA+sxudCfRPywLX72u+HG6ymVSpoCJx4hJZHxH1yaFBUTQkl+z?=
 =?us-ascii?Q?7MtLRB2wuCZpu+wcPR6fOi6DEYlC7yWz8X2XSBrf9aF3nSDmQaTzQ9TrqmCb?=
 =?us-ascii?Q?M1kmxdNGRJY5POX64fZYZdGY+YxrUrvaW5nOLfLpPCq3fNiqhqW6/WLrmdPH?=
 =?us-ascii?Q?LwiXf9R/EfhCwGUoKuFvXY6h0737raRrN9/ZreNpXidZHNVOPhJzMPdEVw/K?=
 =?us-ascii?Q?tUEP+0O/74Hxo7nszCRCNFRUHuqCNc8Bdpwg5mktJP0pO5+6RYzEE2RfTdyH?=
 =?us-ascii?Q?LiKocGbYtLjO8yP1UZ0ski8iT0dSHLYeXQYgQYtTRzoTS9wGmzLLFhYGZKy4?=
 =?us-ascii?Q?L8J7ipOtkVspX4tae+ANZWkdP4MsWN5qal+c9tR3rw3YBTX+o4/dVxomgLZ0?=
 =?us-ascii?Q?wGgcZvWSzhGfW7X+fdBcG0uGgGwtLLy5gU08v8oe9munB6XwPydkCCrwRjVy?=
 =?us-ascii?Q?O43To0g5+WsUudPyLU3GY6kFA/iqf9CCfP0u+8taNg8EnFx8WJ6oVOrMWVRw?=
 =?us-ascii?Q?6h914kDgq4v1lRfszS14ZIU/R/+1dhFMtD1I1h8+IlE45sIskuvw25wPuu4S?=
 =?us-ascii?Q?2HX9bZhWjtVDxWiYdN3iMoQSgmALjd6VCuLOV1hjamB/ujdRw65n6tnUApOB?=
 =?us-ascii?Q?+9zOJcrnIudRaImqJ41fvBFUeW5x/8ConnobT571BRt9gxpJ9pPC1mcROW8K?=
 =?us-ascii?Q?mUEGczg4I/E9l19eWExxxUNXgwu7BH+3HUW/bbY+dAdNu7g8iYCtaeySuVUO?=
 =?us-ascii?Q?pYmw1PfUr6npwlFTNOYmKKbxn5xrAFoYdJQFKQaZ5KjpOzvEQztLnvWio6Qa?=
 =?us-ascii?Q?g9Z5rM7LZYyoMqE7vYqE6sgl3Ft+bfh13EEK4hHmuwyh1iH9E7Ftld/1xFbv?=
 =?us-ascii?Q?8kqxo1YiVfOG0F33sXSZKRhkU4VB9fF8/cv2DGHuKUBoKdH+Grdas7t5DOyh?=
 =?us-ascii?Q?4jYUjLjc+kohN9CE88BJqh0uSBRnZvbb+iX0aqAX1AdSQNzkcBD+AReqQviT?=
 =?us-ascii?Q?wDwMl+Ne/zb0KSUhIrgMm93DiUrxRGknyD3oTuhYGIGkRGetfPdhSET60wPF?=
 =?us-ascii?Q?4UDXyHkT+008Y2hqYyT6jD192rKONHGSKvG+Tg9jbC7GSXq3wd4Bo0go/g4A?=
 =?us-ascii?Q?Rdq33CQGuP5J1Q6Qm6BlIjhhyR8jIDIWS43x12NX84DpdNQpZ5FFQ3QfZicX?=
 =?us-ascii?Q?6xS17KP04UQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <79F89928F5A58F49AAD071DC4340C272@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6234
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	66a7c1b5-19b5-4d86-e056-08dd923f2913
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|4022899009|14060799003|82310400026|35042699022|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PexglCdxMevk5CH7FPBQQUhgwLytsu7DSY48vrU5lwcTBEWocejT2LKaBNaN?=
 =?us-ascii?Q?cuz3jNid7floebyS34m4U50lIgbho6QCdLhfDSa+SgRj4eQNjtAxQoLIsCYA?=
 =?us-ascii?Q?7Acn6nlES+VScOuCDm35kVYA6Pt+rNrlktP1UQnnccq/rByMq/IUj8/weNzi?=
 =?us-ascii?Q?7WmjgckLBF4Rfk09N8NPq6f8495cGJxJuIOZOUk35VQJcWIl1v7hTqNS06Qz?=
 =?us-ascii?Q?XGMNEWR5u9tadWPFE2QqQJvh33EQjKOmhB1kv/oCtnjZTCdrqpHeGGUN3wIs?=
 =?us-ascii?Q?VCJ3eCOvnRXOhV9rP/qNCAZ5S3X9CJjYrzaf1FkmyMaKnRk3ixtjp4Ovm2ad?=
 =?us-ascii?Q?mYKTTH3SPfjjSJ0MpCEIKM/gxUdOfM1QfGXjZKsr2vIR30VkogYgmv4W+6vV?=
 =?us-ascii?Q?wuucN6jCBK1za9jh4hVlXj2PPLsiPufOIaSZjwa/ybkLbSQFmJHlmB3eoCWR?=
 =?us-ascii?Q?WzgLGCiRRiQcp/2rvGODnPYWAjj2gCJ8ZGrYtC8T6Eb0xNmQTQcIv2x2YQ+j?=
 =?us-ascii?Q?dXFaWhQk0P3Wi992JEHVmp/DId1wVtPnxy738Q1f2Q+ttfYx0+zTqsFKUODe?=
 =?us-ascii?Q?0r8ZFynpa8VX9ox+hVNnB5oH+A1B8j62GDsET6IBzeQ0Srp6Z9G5a/xBltfT?=
 =?us-ascii?Q?MK1gpBOxkKW4gsgq7CkX46iZTcQkC+7tlEfdGPR/BOO9+nJ9kUPnrO4p1sfQ?=
 =?us-ascii?Q?tvXwxPHaf3fsEJ04iM8SgYcO7J+R2ksrW72Z8iJ8+jO+BT2kfW1XnOWFR+io?=
 =?us-ascii?Q?GZDkbiPlZBExgkJwJekr2EJDbdgjXGc65kvUmMbgcAL/6NHc9eYyRyukZJPa?=
 =?us-ascii?Q?rdSRKWU4wcfsYJ8abMcbuX4y+c/Ot5EGAZpJiC5y92lcleLjh2FBc9J9P0+C?=
 =?us-ascii?Q?qH02YTMznM1LXlB0xTdjBKl6isoYQ83cb1MbOvIGcP3d7ozUfFwrzQYlnRf0?=
 =?us-ascii?Q?HIDVjEbECAAYTDO2rWNuiQKo2yHUcRmPeasEVMlCvRuCSI1cBEKCv2Ue3QZ7?=
 =?us-ascii?Q?zbXJHnTM5MnIOq5PqAYiL0fgsCvDXDi9Dts65RV1Vw9NzWIQ5zDXyhJx48ta?=
 =?us-ascii?Q?QRX1+J/2vFQvvRXn7LLEJdvJbF0h483w2rvsIglxbhfYhlb28nlqJC0M6tSj?=
 =?us-ascii?Q?w0MRhrl2v1Ig1RccYKGKecKRPCgKQYerB9OjjCkLp1k1SeTjJ95Ratxg780Z?=
 =?us-ascii?Q?mFaQrXqqWPNeCKVcqniZjE4Vynrtz77h/n/sESkQ7ARGKYHvv5Aiv7ZPXheI?=
 =?us-ascii?Q?WD/dcMkE9n8citn/eQ6CN8HwpBnYKE7c2THAU0ka+Ms0aolrCqO0ypSskRAl?=
 =?us-ascii?Q?GyJyy3mUthRRFxsxpC6M2jRJoOr1P4bJ7Nu40lLvCL1E/pkuyyXlEw+AWElv?=
 =?us-ascii?Q?FdFh2MG7lhhXRmJJn7jQ2FpH7bwsMcthy+We3mtdfo0VyvBBpt7pEouTTT5h?=
 =?us-ascii?Q?xiM2C7skgQV3/6iEIgP2a99RMcqTu5MLIyR3vXnb0MNSeLaREpeq8g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(4022899009)(14060799003)(82310400026)(35042699022)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:57:25.5257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de12dad-2556-430c-5c14-08dd923f3cb4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9940
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 16:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216432

Hi Luca,

Wrong list: please send meta-openembedded patches to openembedded-devel@lis=
ts.openembedded.org <mailto:openembedded-devel@lists.openembedded.org>.

Thanks,
Ross

> On 13 May 2025, at 13:45, luca fancellu via lists.openembedded.org <luca.=
fancellu=3Darm.com@lists.openembedded.org> wrote:
>=20
> Add the native and nativesdk target to the recipe.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-python/recipes-extended/python-rich/python3-rich_14.0.0=
.bb b/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
> index 95c0fd8a7546..8a4d6b843e7a 100644
> --- a/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
> +++ b/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
> @@ -17,3 +17,5 @@ RDEPENDS:${PN} =3D "python3-html \
>                   python3-pygments \
>                   python3-unixadmin \
>                   "
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216419): https://lists.openembedded.org/g/openembedde=
d-core/message/216419
> Mute This Topic: https://lists.openembedded.org/mt/113088799/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


