Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3708EC87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 17:10:52 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.4])
 by mx.groups.io with SMTP id smtpd.web10.67736.1753981843906059142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 10:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JBx5HiZH;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JBx5HiZH;
 spf=pass (domain: arm.com, ip: 52.101.70.4, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ej1sVtCULVEw8cjSO51HD/m5krl8CZ10HxsobPPZtsJ6W21Y2n8UiL5DA8lbj0Uyo4QtPfPg2OoCWnRjdwcuph0Q8VPCz3XDET4uMKXhfHgdYYmRXCgY6sZhIsZqAtA9MNe6d9PSdmATdiXcFpOF3XVMmzYLrea+XSGB0d540TLdEzsy+Ftm5LXd0kySrsfVJKR6zgCLXZFuP3cc9AJeI9rgsaVm9F2ES0B9Z0rnXISdjAWqyFmOe+cApY6tDCuztbN7TAt8aTUPpjgv6M1GXIrr3fQuFW1DA8mJ30hiJ1QFsAuOpKxepGqEPTLRG+tb2HCU3isJlg92Ne2sdZ5fkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yn0zJL8DS7z5qeAloJXY9K+QcnksdgE8mslaNxEHgs=;
 b=W9S9CFvN11NdiZ9IXn2RlAhR/Vu41afVpoD9q3ZrocgBehWBDHIXgUnRyXDC/W/jrZpytgewQ7AZVgEUgn36JmQugdA4urhTIOx2noRd7WvxO8Dc3rhfVRSMteoPBqaf+WIIPXkd51t9dVH3V2CfYIojgVOGI8MSuspcTf/UtyHTEAU8oZvjaiCUiRot0sBvotCn76grvTJOcUDVKZxPuM2N572UIo8r7NwLyuuiJa1MRFaRR7GxBDuechvTxxHueJAXqd4uuY3Q1HRVewFtyowTQU3Xa3n7+K1n1F40IcuXfBdLJUVwX/FL3UmX2ZOtAL8TzA9EuObWC7iubpPCrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yn0zJL8DS7z5qeAloJXY9K+QcnksdgE8mslaNxEHgs=;
 b=JBx5HiZHbe6e4LVpbBqbunloiOXhE4S6dKAZ3WU7CPsXnTzikcllXPuyez/8nheE+jmB4f+SF1ThMavgkCGJ1EEqfZHMh8u7EkyvN8kp1Y2LT8DSJaRjr4ngGa939Iw4jkE7bx3hfJdxoM2SEkh0q36WEfrmXAUA7Ffb5JOKbOY=
Received: from DU6P191CA0071.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::28)
 by PAWPR08MB9662.eurprd08.prod.outlook.com (2603:10a6:102:2e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 17:10:38 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::c1) by DU6P191CA0071.outlook.office365.com
 (2603:10a6:10:53e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Thu,
 31 Jul 2025 17:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Thu, 31 Jul 2025 17:10:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbiH+i7ulO0d5/82CtXyFYe0noPbfTHtFvH9gLNSVEbTtI3Be8yJjK4bCM9UfbOY1vBJGtkT0wM2tnPp2tVPaDXeKGE0rCXyx+3YwSRLEDtboJV44s9+cTn2IOtdzOYtEayhPEPH2/evu2OGpY04rochG/pnJnHKy7ljQx6XCNjbpFSdlNLZ0xqoFVXSPGtD+xeyuvXP3GhJBHmpWxGTdT0eRqYMi4G1DcKF1EVgvMVw1fkDMUgTTvMEQoy4ux/p6EtI4BLlvf2+6+SUJyBsafUpdRa9LfdGTyns9E8h0DtwVB3EIPkx4ErfoB4mCTxoXI6b9lWNvEBy8AaemH5mxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yn0zJL8DS7z5qeAloJXY9K+QcnksdgE8mslaNxEHgs=;
 b=sCR6Udp/QOJ+Ak8dc/XnbsevHiIbVLQnog9+KN089fIXKzGE4JFAovPfiqOUwM6GqlMZK5HURuW4mVKd3hcXy0zqr8z588tMmdnVTb95qsIV+1q9WKpzAILkFCC/sRN7WYAqZQrwpVPHeNlQRLQjXGrmG8p0GVeW63LklCX+ELLfub215niHIJTtyvilUebfkIVvv6/4XzvO4awNCPkTK1uLuYI/FHxzx5awc5i/MxgEpIan1K8edwI4GWDu8+jkTkpdKN3hKGLAiWxtDTv+x7Jfmi5gPCHyct+bh3HejiurKmn6JDuzue78NrNxswwXXv9plIrln0XBb1aPUPH7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yn0zJL8DS7z5qeAloJXY9K+QcnksdgE8mslaNxEHgs=;
 b=JBx5HiZHbe6e4LVpbBqbunloiOXhE4S6dKAZ3WU7CPsXnTzikcllXPuyez/8nheE+jmB4f+SF1ThMavgkCGJ1EEqfZHMh8u7EkyvN8kp1Y2LT8DSJaRjr4ngGa939Iw4jkE7bx3hfJdxoM2SEkh0q36WEfrmXAUA7Ffb5JOKbOY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8503.eurprd08.prod.outlook.com (2603:10a6:20b:55e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 17:10:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 17:10:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/5] spirv-headers,spirv-tools: Upgrade to
 1.4.321.0 release
Thread-Topic: [OE-core] [PATCH 1/5] spirv-headers,spirv-tools: Upgrade to
 1.4.321.0 release
Thread-Index: AQHb/26m7zOFIm6jNkGsjorgYGEZJrRHPeGAgACJcwCABLWsAA==
Date: Thu, 31 Jul 2025 17:10:04 +0000
Message-ID: <415E301D-8F29-4B75-91E3-9A53896B500E@arm.com>
References: <20250728032045.2783514-1-raj.khem@gmail.com>
 <CANNYZj-KztVkyJc_3-cm5T=MtJasYoJkidku2J=7rA5BTysEqw@mail.gmail.com>
 <CAMKF1sqjDpXSBB5TZGF4-YGeS_XUJArGVjnoo2CFLEW+6VvLdQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqjDpXSBB5TZGF4-YGeS_XUJArGVjnoo2CFLEW+6VvLdQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8503:EE_|DU2PEPF00028D0C:EE_|PAWPR08MB9662:EE_
X-MS-Office365-Filtering-Correlation-Id: 870045bb-da27-4a5e-76af-08ddd0552b0b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Nk5xL2lVZ3NoREUzM1B4TlJmenQrZ21zd3Y1OXlIYkxnZkdzYnl2aklubmx5?=
 =?utf-8?B?eEdaQjFpelMzb0RDbXRKeWFDK242dEdna0ZUa2N5TzB6ZHplbUhieFRHdkZT?=
 =?utf-8?B?U3BUL1pHaXBZWnFXRVdqRDc3bE4xNHlGT2NrVHZldUdRdW8weStJWFhSRWIy?=
 =?utf-8?B?TllxeTIrcHJzL2twVU9hOHlJVzdmQWU0dUdOWWY1TThkSU5zVjJYMzFhQXFs?=
 =?utf-8?B?TnBrdGlvRmVwOGFMTDJqdFRkVnh0Q3docEtCQXY5N1RDSTlBazY4cGJDcmpo?=
 =?utf-8?B?eXRQVFJJakZjVXFJNG5maUdqWHAvUThvTmNDenVXRVhJYW5zcjdmUU5GSm5G?=
 =?utf-8?B?cmVXcElGSDducXk0YVprVzlZeWRrL1NZczE4YWFqenR2VS9PeUx5a2ZMUDly?=
 =?utf-8?B?cGFodFI2NzJuNUFFQzR5cmdCUDc1Wk5uaFFodDlUTDlpczZNQVZwOTUvdmcz?=
 =?utf-8?B?TE81M29HRk1kWU4ydmV5ZWV1enFIcjlZaFJabHJRRGJWdWovNHhyREFyYldu?=
 =?utf-8?B?Nm9ZbGwrZFp3K2lHbDRuVnd1ZXFtdWpvZzFGVGtyd0wxbDVrbXg1UjducXB3?=
 =?utf-8?B?Z2tDWGJ1YmFYY0x5RUZZWDcrRG1PU2pXdWpIeGNERFJnMDBKQkNwWjBGQ002?=
 =?utf-8?B?SWFkbjRyN25ST3ZCZUttVDBwam9MYVlySlBGcUlLMGJWT1ZtWS9KMC92dC82?=
 =?utf-8?B?VHhRSEJ6ZmRHOVdldGFWTWE3SHJVcnJzRTF5UmV3YXI3RUVybmgzZzNTZjhP?=
 =?utf-8?B?UW81MVRaY2psSUtDODBqWVBkbC9EaEFOcWlKN2xYbVYxcFpTYU5rOWgrOHBI?=
 =?utf-8?B?SGE3dmorTytDT3lQUXVmOXIyOExXR3A0eThRSjRnMDIydWpLbzFiaEJlK1h0?=
 =?utf-8?B?bktJUGlUckRZNmhlSm9LWGZjM3JTTGdMYTE3TmUzcEZmQnlJMkdLRHBxNmg0?=
 =?utf-8?B?MCtMTytYZ1RwVHBMUXFGemx2OEFBMGhFSnk0TVlVODYyQkdONXBrdlExZ3ZR?=
 =?utf-8?B?TFJsM1luMmdFZUVUVHJDd0dOdkNCTCsxRVZYRlphK1YwZm1CMGxwNjdwOGhn?=
 =?utf-8?B?UTRGOTc0bHRGOVVTNmVweEtIYWl3ZmVWdnVKdTJWZ0MyNTkwN1RKazBwN3Bv?=
 =?utf-8?B?SWNvRzlhVVFHaVZUYzlmSjR5a3J3TmRqbWVabDd4TXp5dUc0WlFvNFpha1JN?=
 =?utf-8?B?dHlzbWlCKzliMWxDTlFCbjl1TlJFWjNYYkxBTmZaVGVFZW1KUXU1ckdlcG5h?=
 =?utf-8?B?VTlVUTlJalpid3dVT3U2eW1FTnV0ZzJTN0ZxbkJ3Y3pLLzVGM055S3J6bWVq?=
 =?utf-8?B?a3RKNGk1azEvanZCWlNIM3g1cVFFcXJXMFc2YThnaG1VTTRMcmt1dWdYMitG?=
 =?utf-8?B?dkkyM3hTSVdXOGlhSVhGREVKMlFqVENjTlFUUkNzRVp1Sk8reDczMUZYVEYz?=
 =?utf-8?B?b01scVp3SDZIamdoSStCQlVYa0lLK0p4aUI4bE5lRUtTYnR0a0w1NVdHcWVr?=
 =?utf-8?B?MHp1NW94eXJaNDZKMEU3WUxZZjZnOVoyTy9sN1NLbGk1YkYvNFd1NSttMklF?=
 =?utf-8?B?d056WlBGdFdSUFNPdzl2MXJvOFF2clM4K2tLUHpSV2ZlYzd5VUtLMTRiajF2?=
 =?utf-8?B?emdiWG1lRWRGR09TVmUxVnJwdGdiT1ZkYkJkYU4zQytOeWpCMVF6S0ZXSXFv?=
 =?utf-8?B?ZEIvQXFndkxTajdVdjRCblRBbitBQ2RNSC9QdU5GVndOSXExdnNJd0VtUmlK?=
 =?utf-8?B?ZUo1KytjYXBMWHd5cld1aUFLWW1wR2NqTGgzZHZtQ1pNN1pDYVBGclljNEVp?=
 =?utf-8?B?ZGQzRlZHMTltWE1NaWJad1lwNTZzTWhkUmsxNnRKcGxMd08vQjcvaEJMSU1U?=
 =?utf-8?B?Wjk5dUhnMDRiRjdMZHJBZmF1dkVzWjRJZ0d5Yzlyei9tZkRqblFhUnpMT2lz?=
 =?utf-8?B?dzU1bit0ck1WQUVtZldPUEJPblg4ZExacmZHMjRzV2x0WVNQbXJXdUMyQ2wy?=
 =?utf-8?B?anRoOGNBMG1RPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <584BCC08D4B6D040BF0EEE83700D665E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	709467de-b1e9-4df9-6b36-08ddd05517de
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|14060799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VXdIOUdOM3lnNFVranBKelV5Q0JoeG9qZEZUQnM4cS9ZYk12ZmJURlNmM25o?=
 =?utf-8?B?NHpja1BFQVdRWWJLSlpsWHIzaS9kSWh5UFYxSEJvV0dPcjhWN2NRQUVXZWlP?=
 =?utf-8?B?cWNFMXZEL21QTVpoWFFqUm1JUDNQalVMdm5BSmp4cFQvT1hZYUk5ZkZlOENj?=
 =?utf-8?B?blBpNXFVYktUS0s2dFF2ZHlaWTFsdWdOUEs0MUZjNktSRDRXclZ1UFNncEUx?=
 =?utf-8?B?ckdYS05pMCtFbm55UWYrMWNoeXZqcklyOGM0UWNSejdZSUJreGx0ZzJtQThj?=
 =?utf-8?B?SGVXMTY1Tmo5QitVOE80NE9ua2hZSTNSV3h3MThBY1NVendNY3hBT0lnM05z?=
 =?utf-8?B?bzJoQlBzV2x2Y0N6eDVkcUJ0ZTRlc0hVNUFpUWNsTjJTSGR2QkNBS0RUYjVq?=
 =?utf-8?B?d0x3WGQzeUtVbVM0SjlTaUZESWdlbXMyMS9oc1hiN0ppcThmaGJsOEVYdyt5?=
 =?utf-8?B?SVY5QU9UYk5mUjUwT0ZEL2R6OFpxNHl0RVpTL1RuQnlLOXNUUlZBQlFmUldn?=
 =?utf-8?B?MDFRRis4Y2RKZjdQeWtsRjJETWhOMHNVWFJsaVlySUFsKzlFaFMybGtCUVVX?=
 =?utf-8?B?WEFMQVJRbWtoSTFmT3VHNTNhL2ZxY3pqMCtSdHhZRGwxLzRuQ1d0dWZSYzY0?=
 =?utf-8?B?U3cxeEMzOFJLZUNwTC9PL2JTODRmOUlRdCt5NVlEUnpNbzdBVnR4ZE93MjRp?=
 =?utf-8?B?VkVib1J3cHczcjNMcnpoVTRDMUNCMjFZWEIwNXB2YmtnaXpCZU5zZWVUbzJ1?=
 =?utf-8?B?ZnRNMnN5ak1Mam1tKzJURkd2MUhXVzkyaHhWWVdDUkY5aElCUis2dkZMVlh1?=
 =?utf-8?B?U29sekE2Z3R0MDlsblkvbER0eXpFaHU2SjZuMHNCTGNUeGtub3RjZDNBd0tS?=
 =?utf-8?B?dU1FWVRHaUN4VzB4K2tZek1KWm0rczVSMFk2cENwR2w3R1g2UGtoNmlqUDM4?=
 =?utf-8?B?eW5kTWZpUlNxQjN5MGlNWERlK3I0RzdHVU9JSmc0WVRNc1VreWlKSU8yREgw?=
 =?utf-8?B?Tk9WNUtnQXVNTDMwakRLTW82SE93bzdaSFdCak9HWkVGcUNSL3J4RVVwM0Jj?=
 =?utf-8?B?VkxpMGdjUjFUWkZiVFpkc3JXVm5xVmtubDZPYm13UklhRmVJNkFaZjM0UWRR?=
 =?utf-8?B?QjJoVFVManJvTWZyajlUVGtTZVV0REdjK2lPVytVZVVKcnZ0b1NHeG1HY1ly?=
 =?utf-8?B?UEFYZnlmU2QrMWM3bDl2VnZQb0dDRUxEY2ZzUWxTQjBWTmtvaTBjNlZ6UU14?=
 =?utf-8?B?d2N0TzdDanplUjJ6SUF5RGoxY0J2QWxGUEY5WTYvU2luSU5nTVBJOGhrYTBM?=
 =?utf-8?B?N1pGcS95UnVOUngzbXhDNWpRcWJ1bXNiNW0rOW50UTRCbEtlTHE5Ly91ckxD?=
 =?utf-8?B?MS9PalIrQ1VDdGxycG81VzljREJldE0wNVgzYWJvc2hNckNFMTEvYWpTTzZr?=
 =?utf-8?B?MTd6SzBkNnFlUVYzb3Y4dnk3dk96Y0VUcSt4dlZvRjE3NGJISnZGOGdWaVlh?=
 =?utf-8?B?Q0pHc3pPckJYTFduR29WRVlqb25jcVVWR0wxY0g2cStEYzVLV1ZicTNRSW9B?=
 =?utf-8?B?R3EyM09SaHBmNFoyL25Uem9TdzhISTJ5QWhqRDVyWDZWV3ByZXB5eFR2TjRW?=
 =?utf-8?B?aVF3dG02R0tzWlZsK25USTJ4cHZPNzA5eEJvZ01wQ2RCc1YzTElnSXhzNUpE?=
 =?utf-8?B?dE15cXE0Mkw5OXJ3S1FHY2VoUzBLWnljenQrMEgrSE9hNnM2bkZ6MUlra0l3?=
 =?utf-8?B?NHhIWW45c2o3a3hka0lKYThuYlBwZnNRS3V3L05DSGVkdnM1M25Memo3azlU?=
 =?utf-8?B?VFNDOVdpRnhxSWxZc0E3VTJ4M0ROYXRNd3NDZmRzYlRwVXFvMWhEaEprT1d4?=
 =?utf-8?B?dU5KazB2ckxHYVA1S2t0MUVuVzczNGFubFhCZnpaM2JQWDh0VFhMTDBrQXlr?=
 =?utf-8?B?cWhiSFNQUC96UHByUDFyYWRTazdNZ1lsRTJwMll5aHRNU0JHOXdwSSs1VUg5?=
 =?utf-8?B?Z2k5MjhsMlc4SkMyRW85aWkybEVVcFdHVU1uZVVtTy9OeHc4TkpPeE02dGZm?=
 =?utf-8?Q?7LQ2WF?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(14060799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 17:10:36.8392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 870045bb-da27-4a5e-76af-08ddd0552b0b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 17:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221202

T24gMjggSnVsIDIwMjUsIGF0IDE4OjE0LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiBZZXMgdGhhdHMgcmVhc29uYWJsZS4gQWx0aG91Z2ggd2hhdCB3b3JyaWVzIG1lIGlzIHRoZSBz
cHJlYWQgb2YgZGVwZW5kZW5jaWVzIGZvcg0KPiBhdG9taWMgdXBncmFkZXMgbm93LCBsaWJjbGMg
aXMgYnVpbHQgZnJvbSBjbGFuZyBzb3VyY2VzIGFuZCBsaWJjbGMgaGFzDQo+IGRlcGVuZGVuY2ll
cw0KPiBpbnRvIHRoZXNlIHZpYSBzcGlydi10b29scywgdGhpcyBpcyBhZGRpbmcgcXVpdGUgYSBi
aXQgb2Ygc3VuZHJ5DQo+IGRlcGVuZGVuY3kgdXBncmFkZXMNCj4gdGhhdCBjb21waWxlciB1cGdy
YWRlIHdpbGwgaGF2ZSB0byBkby4gVGhhdHMgbXkgd29ycnkgYWxsIGFsb25nIHdoZW4NCj4gd2Ug
c3B1biBwYWNrYWdlcw0KPiBvdXQgb2YgY2xhbmcsIEl0IHdvdWxkIG1ha2UgaXQgaGFyZCB0byBk
byB2ZXJzaW9uIHVwZ3JhZGVzIGluIGZ1dHVyZS4NCg0KVGhlcmXigJlzIG5vIGNoYW5nZSB0byB3
aGF0IGFjdHVhbCBjb2RlIGlzIGJlaW5nIGJ1aWx0LCB0aGUgbGliY2xjIHJlY2lwZSB1c2VzIHRo
ZSBsbHZtIHNoYXJlZCBzb3VyY2VzLg0KDQpSb3Nz

