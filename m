Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CC8C28B28
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 11:18:39 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.45])
 by mx.groups.io with SMTP id smtpd.web10.49892.1742210317109598977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 04:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oT/Z5e1M;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oT/Z5e1M;
 spf=pass (domain: arm.com, ip: 40.107.241.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VuSKL7XYdPWzyKRLam/ntAcSC22FtXbaSj4Qv6yWQIAeTkuGH53voJQySkdgMoOQaCreugZDGx00iyyZe5iZCxivhKTTuiX8bHDJRm7Mq1cysv/FNBOBrq0j+KhDv//g0L74kpJHNI/WvAFITN7EWdhP4Zs8K34RYp0KYxYARO6MyBsKL3PgOrLjmXDZ8RBkKYMrWiMhoYk7YfnXyq2i0QM8gyrLzJUnOmhZQTftCJOgH4sQfywA5N6WYnD4OEUWQIbJg+VP8VP67gpYCU/GPMVni98iktC8BmlY8OyUio96F1usW9KxmHkWiAMMe8rLP3L8Z0E979Ji8e1r0QhbOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbmQw5+r7zG0TDFGHNeL/8HJmwludYg3WHmXj7Xo9EY=;
 b=H04OjVxwJi4O7YUSvSfdTubky4lNi9RHOySpj2btNlvGIOhT94TzRMn9Gz38z8R8sHtlhKfnKgwugcOiZu0EEF+fJTgn6M0nkd289qqAiyjKBVmaWfbIYx5uE2cKfUzncL14ZD2JyuBgq0ldVnO4B7ZFqM0IjI4nPwtkoP5UQ6J9V14TS7daW3Nq2BsU67Etgv7cyj6Xl1h6j1YAfwKuGIf1FVOCh0dCdpmwlYvf9bAbshKiiFc1DA8ZgPG5061RW8d90SMBVrZiZJL7N9nMuFRNSAaej3TOHWzvy4OlH/ETbJf4S99Nn8QeIzFAqtV2HB5OmhRdBoXuu3nn56GjDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbmQw5+r7zG0TDFGHNeL/8HJmwludYg3WHmXj7Xo9EY=;
 b=oT/Z5e1MhgcQgOq8yle68BreMlAlP5Wp6JIJBof0QPT514MwWf5nTZu1REXBLJNpqhDNt9LdbyG+rif4YqGNTNZEU/cm0vxhM2dMe+ZB/XhFVXqcYViaT65fFTDGrJApS6hzx1LL9Pp+V9AITfB19pk6xStuyXLS89owXLXfjRc=
Received: from AM0PR04CA0096.eurprd04.prod.outlook.com (2603:10a6:208:be::37)
 by DB9PR08MB7674.eurprd08.prod.outlook.com (2603:10a6:10:37d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:18:30 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:208:be:cafe::f2) by AM0PR04CA0096.outlook.office365.com
 (2603:10a6:208:be::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 11:18:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 17 Mar 2025 11:18:30 +0000
Received: ("Tessian outbound f89894bb7c0d:v594"); Mon, 17 Mar 2025 11:18:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05593eee1dd4d0b5
X-TessianGatewayMetadata: hU0TVnR1FsGfum6DSXr84++y+AWDY0SUm8oXAFa8fcga/FPZYWe6G6M3vAgGgGjMYk/htE2vBBFj6NbYR8Nf/gO+sZyQBK4c67V53jUcM+g0zv5DY1gPdSlcrgp/LGRXIsvX7oDZ6JFl4UyrE4Lt6nJJ6lSxtxX1LE+ZX3EwLm4=
X-CR-MTA-TID: 64aa7808
Received: from L072dd63cf56a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 38AE1368-8AAE-4D92-8A9C-9AA908F04289.1;
	Mon, 17 Mar 2025 11:18:23 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L072dd63cf56a.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 17 Mar 2025 11:18:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WC5BJELHzlIZJKi+6LuL2ROILilLLPg5eUN2T3MQLLviXqdzd4ivGrCgZ29v/WHTRPQ64jNSTHuOPPC3D+VESE65VAOFzSSgPElkAtX19wvIZTFQHeUYVJJxsJWhFhO9fhCTqQfzdhREhnNqFnCZyr7CxvilR2njTlePntVNP02jYyI77SMIZQVx/A4p89F9Y+zTjhSpwnStbUVy+aif/KbEHkQIqJ3gSo+RSx3jtJPDEgnLwy1lG7WRFIpVjIu/TZz1FzDj3qGmkq6+iws9EASJHRvbW/L8X3B7diSqJdLVqUg1rGmtLu3EhJilw46XtCYU2mFXRqGL95XcHD71nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbmQw5+r7zG0TDFGHNeL/8HJmwludYg3WHmXj7Xo9EY=;
 b=atVWUrxThuPCvqJ2PvD8Qdr+K03aIHu4ef78U9BCJIKwWCbeIFQGede+ZrqRWnpCf0LXSs6IuRN9X/e84VqnCjIwoxZHzUGgjr154yuTiOf3N/UOOoiT7tSRpfXH1AlI7J88e+TMENj8BBXC8DmR+CyL+vsvtw3wBYQeuPuPBd+8amcGUYUsB4hHRq7tUzXFtrBgd7+sMhP1f6jxFIMQfat0SqsV3eSRTISxGTlhzFhxhqCWVjGP5Qe0AkMHJAovbOf9YBBwXGsD8tnmU3eunUMX2tev8DRayaQSQKRx1qyRFUQEn87PkmmsdjMDKMM+tlDEwyLkfNjM9JThHA3KSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbmQw5+r7zG0TDFGHNeL/8HJmwludYg3WHmXj7Xo9EY=;
 b=oT/Z5e1MhgcQgOq8yle68BreMlAlP5Wp6JIJBof0QPT514MwWf5nTZu1REXBLJNpqhDNt9LdbyG+rif4YqGNTNZEU/cm0vxhM2dMe+ZB/XhFVXqcYViaT65fFTDGrJApS6hzx1LL9Pp+V9AITfB19pk6xStuyXLS89owXLXfjRc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5866.eurprd08.prod.outlook.com (2603:10a6:102:85::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:18:21 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:18:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] xwayland: mark CVEs fixed in 24.1.6 as fixed
Thread-Topic: [OE-core][PATCH] xwayland: mark CVEs fixed in 24.1.6 as fixed
Thread-Index: AQHbkbscSfaTB1r5wEO4MBdIX15fzLNsUw2AgAABbgCACcczAIABHWMA
Date: Mon, 17 Mar 2025 11:18:20 +0000
Message-ID: <730307A2-7B3E-4019-86CC-76AB1128D826@arm.com>
References: <20250310124949.2414614-1-peter.marko@siemens.com>
 <387AAA58-90B2-4F98-9CA7-7287198371CD@arm.com>
 <AS1PR10MB56973C195061C8E5FBE5D8E6FDD62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697C8041F4E3E9FEB36D4FFFDDC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697C8041F4E3E9FEB36D4FFFDDC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5866:EE_|AMS0EPF000001A4:EE_|DB9PR08MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7cad69-49a9-44e3-dd18-08dd65457253
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RzNyMytkUE9QdXpyTVlPUFdyQWRWMWlPU3pTWTNCcFEzOFpRRnI2VDVEMVlY?=
 =?utf-8?B?YXRJRjB5aVJaWS9vNXlrdmQxbXowL3IvRjJCR3lSek93NjBobXRDVzlMNTRu?=
 =?utf-8?B?T0VlUTFvamJRVHRrOUFYRnRvaWQrSzBsekk1RFdCUzUyUlRHV2xIa2MvMHFY?=
 =?utf-8?B?NElVNTRzcC9uV1FrOFNtVEtjRzJIUnJsdWFDYzlYaVpadENtSHJtSldJa2Ez?=
 =?utf-8?B?ampoRHdWNy8wRDVXZFpidWdUOVhKVHRDbmdtL2tvZ04wVllqMnVyM3VSTStD?=
 =?utf-8?B?M09UcndBR0J0Z3lLZDAyNUkxWk5EWE9ZTytuUzV4SzJUTjByRzEzZWt5U2NN?=
 =?utf-8?B?Qjg4bjdFY0lkTzlXaFk2WVhtUFcrTGlmZFZEejRDT0ZCRytaeTRWMVRlUXhn?=
 =?utf-8?B?c3pXTTJZaTNiaDVXTzA3Qml3OGg2WFBIeUlJODFBTmh1WHE5emFONjk3aURj?=
 =?utf-8?B?dURRbkZQcjV5OUZuSHVWck5mdTh4Yko0NDhFc1hpY1JtV0ZmQnNrVDdIRDl0?=
 =?utf-8?B?aERNL3BIMzhJczVpMHozYmhyOE9KMUdrQUZqUGhINjNYMUs4MmpxNFR0dDN4?=
 =?utf-8?B?dDdFOGY4RExUcEV5a09QMGRGd3NaOFo2djVmT01IS0ZkdWp6L2s1S2k3TEtL?=
 =?utf-8?B?V0ZVTHNxdElkQWhjTUFvdWJXTi9jT3hUNlB5WjFEbDYvYlFCTWZRTitQUWw3?=
 =?utf-8?B?cC9majkwdkZGSWJYdFJlOTYwWllBd1NtZ2dzOVFCLzRMaG9UYXo5d2tHM1c0?=
 =?utf-8?B?UnBVNzVBNmw4LzZBZXNQa0ZUZXNPeEFyM2FJTDhWR1YyUjA0TDhrSTBnSkk4?=
 =?utf-8?B?VGlBK0J3MDFpUk9WejhkWDE5emJmNTVZbXU3dkRXVU4yYkFNVkNTaytLYUwr?=
 =?utf-8?B?ZTZIMVgzOG5YclQ2T0ZiQ29oc2JhZCtjVTdOckU5Zlh4akF2UVZqUlh6clpl?=
 =?utf-8?B?WFE2YmYrZ3hLS3JqTzZZZkN2ZnpMenlmZjQ2Sk54RVZ4Y0F3YjhIOFRvc01E?=
 =?utf-8?B?V2tDaW5lenNHRkQwUjk2OXZ2YTNUbndHOW5mNC9kNzk5c1JPc2pCc3JCeFY2?=
 =?utf-8?B?ZXdTT1B1V0VHZndpUUREeG5iaTNxMTdQaXdlVHBtWXFSZFVDL0dZWHpWeHdl?=
 =?utf-8?B?Si9xcTBXUWt4MmxZcTNnNmJ6ZGErY1lTTEkwZEFxMGtaRWM5R0wzSysxK3Va?=
 =?utf-8?B?cnhVU3M3ZllPbW9Bdk5mQklYMG5La0pPZ1ZpWWx0T1l3bDRVMUNXVGNycTRK?=
 =?utf-8?B?dXhXNWVEazMyUHNKTHlaNysrOTlIYzJBQWhwSDdBVm1lSHBtamtvSm8wR0ZW?=
 =?utf-8?B?Wk1nRlI5WFpEVmFOTlVRVUVLck53OVRlODBadkh3NkUyZEJJNnp1NU8yUFlw?=
 =?utf-8?B?OTRRbXp6eFk1WXYzcjkrVkovcFRVT0paWENKMXAxaE5RdDFKVjdOZTUvQWRi?=
 =?utf-8?B?clB1V29iYVQrMkg4RERNNmpRRWFnVGpQZ0E4bjh6cEx0SzdUSkRMTTFWVStM?=
 =?utf-8?B?dEhYdnQ0anhOVXV4MnlTQ3JCb2phU3J2MDRhQlN6K25ubENIVHZCRDFMZUNG?=
 =?utf-8?B?ZnJiZ3FLMnBYMTQ0Y1pGZmFSRm5LWmdwMi9neFBtdFhERXZJTnNRVVY0MDhI?=
 =?utf-8?B?emVZN0gwQkZNdGxnSkpkMXFzbkdyaHRqUXVKM0pibHNxVFNLcVBlQkFGcS9N?=
 =?utf-8?B?dWVWc0xZR3Z4cDhlcEdlcWdVUzR0SVZIL2F2V0VERUo0WjkwNCtCQzR5UDBI?=
 =?utf-8?B?MUgzc2VRbm42VEhtS3pyRFFVam9EOFlSb0w4elBRcnBDM2EwOFRObndwYlNV?=
 =?utf-8?B?SnlzRS9UYkc4K1Z2TnpORDdCVUxXNzFqNnZvczBwREpQQ21BY1BrUGJuSjJx?=
 =?utf-8?B?bDVUN1VjSXIzQXhLSnhnR0NpSVJrYWFPRDlSdWNYK1pEUHpaT1FYdENmTkwy?=
 =?utf-8?Q?ZV6cSl/bZJEWaj909uSkIe2q10zNYlnB?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EA62D6B3D13FA418B7DBBC19D1EFBCC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5866
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f82c4d66-cc48-4770-b769-08dd65456cd3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|82310400026|14060799003|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUVOZGJFWEZzS3cwVExjSDJ5dnhXUE5SQnBPK28xZlJZSGpwKzcxbmJkQXhz?=
 =?utf-8?B?Z3lVZVFhMlVpaFRMVS8wMG1YcE5mbG1WUFNSZkh6bC9pMXQwWWkrZEdkMVpB?=
 =?utf-8?B?OWUxZUYyN0VnMDJVdXZmTFlKQ3hTczB3Sm5odENMdXprMkVjckVtT0lxQTZQ?=
 =?utf-8?B?bUdwTUFsME1FaElCTUNiUEU4dXAwNFdTbWVjcHFLVUYyNzZWeHBVQVByb1hy?=
 =?utf-8?B?MTBVN1Vuc3IrNjRhSC9laVVlRE1ybXNiQ09naVNXa2RqNFJnYTgyM3N3aTY0?=
 =?utf-8?B?NzhucVQrd0FVeVJ3NkZFTWcvazZTZzhnTnBGQ0tIdG5nV0R5aksyZlFiZXp4?=
 =?utf-8?B?eWI5WEI1U2N3c0MrL2FwYmR1RC9FbjdKWC9sTnBnSFhRK0l3VmtvS3BqMU13?=
 =?utf-8?B?WXpxbjNDaFZycTM0UDBPL0pFYk1CZS9yY0RBUzZrUm5VeTlCdjR0Z3o1M2Zh?=
 =?utf-8?B?aXAzdXZ2T2hFQTdENUo5T01zLzNERVN3UGdSNEQ1UlRvNmhOZG5nWndSU0VV?=
 =?utf-8?B?Vkg4RzNOZWpWNGJaMnVrcSs3OXhsT2lhTytqbmNMM2V1Z2xiV2RiMk81dlRW?=
 =?utf-8?B?TEZWd2tFOVNXcHAvRlRLOTZ0cTQzWUwyODl1emUyaHVTWnV3L2R6SnNqS1RI?=
 =?utf-8?B?U3lpRVJaK25VbnFqc1NPKzNZQmQ3VVBnWUd6MTN5Rjd0b24zVGlFTXdsQXl4?=
 =?utf-8?B?YVIzL3dpZXB1WlJJckliK2J0bXYwd25xLytURVh1R3JjWTh5MzI2aEZqM21x?=
 =?utf-8?B?a3Rmem1uMWk1SUlYMFV1UVRRQkdzOHY3MkNRbloxMU9xdG4rTkFaQWJZRGVj?=
 =?utf-8?B?Z3BNbGRDRjc4RDVqbHdvbGw1T3ZkdUZYRzQrczRUb3VTb3lqeWZOajI5MTdw?=
 =?utf-8?B?aU8zMzBnZXVYWUZVRVI4Vks1RTZkRUJGOXViL3prVW5wWmxUbyt4a3Q3b1R2?=
 =?utf-8?B?bExDWmx1OHVOYUtzenlFTjU0SHIvVjBKelQ1cU1hQTB1aUI4N0FkMC8wdFJs?=
 =?utf-8?B?dXRpMWJXbjlXaHNKZHJqMlZma3pMVTZmbjRVZmQrSW9tMEh5bS9MWmdWQWNI?=
 =?utf-8?B?S3Q2MURpZHh3WUZzNnNSUU9wT01nZVM3d1h4U0gyajZ1cDh0OE5Gc0tRYU1O?=
 =?utf-8?B?VklTZ1pLNU5PTnpkWThPVDVvanNZTGtKdXNIcVhtWldwM2FIakhQVHJpR0cw?=
 =?utf-8?B?ZGxueG5sMzdtR1EySDBVdnJidytraTRaM0VCYmw1QVJSNWRVYzlPWmtrRkNM?=
 =?utf-8?B?cVMyUEtJV3NDZEcycGVOVGRnT2paaGdoS3pHMVE1d3AvVTdYZXJYejcwQ3JZ?=
 =?utf-8?B?M3pPNnZoTytPU3JNU0lHYlFvQjJBZnVrRm94ZnAyeTZlUVRFOGE3V2JMVkdz?=
 =?utf-8?B?VGxXOHpJakFxTW1QUGtJTVFYK1BNa2VUK3VJUXdORXJCTGdhamE1V1dVSjRI?=
 =?utf-8?B?ZEs4VVpuZmF6Z3hUZ2Q3YVFMb2R6dUJCWTFQUk9SWXpGUy9uRzNFMmh1NGVW?=
 =?utf-8?B?ZU5Qdm5FMnp5NkVFR3U5T2xLY0F5VHpzQW84T1NUTWFESDU2dExNS0I1UWt4?=
 =?utf-8?B?N2ErZ2RxYWdJZ2ZCV2p4dWVBcE9ieWFDcU01VzJaOUFpZ25CRmxyQmRIZ0ta?=
 =?utf-8?B?RXZJb3kxWEFWNVJEdmwxdnJIc1o1UGh0bS9mcURNMkFGS21xMG40ZXJMZXgz?=
 =?utf-8?B?Y2tudVc0TzJ1cTBjVDlGRmxCQWlqNUhGcVA0cklTUUpVVUpxME8zSDRocDhM?=
 =?utf-8?B?N0dYazZSMXRCUkQrSytaNW5zMDZxS3JEbm9RcDdhbkRjRGZlNWpFQUlJWmlo?=
 =?utf-8?B?STRaaXkwOXdPNGNNMzVRNWtFZll5T0xvbE03dWMwWkNlM0Y2QmNaN2xTdHpO?=
 =?utf-8?B?ZVFNUGw1VkNpUzFBN1F2Qkt6RWRpYTV2QWRYUjJkeCs3azk0WmhzODdaNjZp?=
 =?utf-8?B?cmpCK215eVptWDA2bmxRZEUrV3BPcHg4VTlkR1RFd1V5eGhVNVlNQTZqQU9h?=
 =?utf-8?Q?aJpqD4MZTE88xA4mGvcc2rf3tfE2pQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(82310400026)(14060799003)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 11:18:30.0788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7cad69-49a9-44e3-dd18-08dd65457253
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7674
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 11:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213075

T24gMTYgTWFyIDIwMjUsIGF0IDE4OjE2LCBNYXJrbywgUGV0ZXIgPFBldGVyLk1hcmtvQHNpZW1l
bnMuY29tPiB3cm90ZToNCj4gDQo+IE9uZSB3ZWVrIGxhdGVyIHRoZXNlIENWRXMgd2VyZSBleHRl
bmRlZCB0byB4c2VydmVyLXhvcmcuDQo+IEkgaGF2ZSBhbHNvIHNlbnQgdGhlc2UgdWdseSBwYXRj
aGVzIGZvciB0aGF0Lg0KPiANCj4gVGhlIENWRXMgYWxzbyBub3cgaGF2ZSBhIGJhbm5lciBzYXlp
bmc6DQo+IFRoaXMgQ1ZFIHJlY29yZCBoYXMgYmVlbiB1cGRhdGVkIGFmdGVyIE5WRCBlbnJpY2ht
ZW50IGVmZm9ydHMgd2VyZSBjb21wbGV0ZWQuIEVucmljaG1lbnQgZGF0YSBzdXBwbGllZCBieSB0
aGUgTlZEIG1heSByZXF1aXJlIGFtZW5kbWVudCBkdWUgdG8gdGhlc2UgY2hhbmdlcy4NCj4gSSBn
dWVzcyBhdCBsZWFzdCB3ZSdsbCBmaW5hbGx5IGhhdmUgbW9yZSBDVkVzIGluIG91ciBsaXN0cy4N
Cj4gT24gdGhlIG90aGVyIGhhbmQsIG1heWJlIG1vcmUgd29yayB0byBtYXJrIHRoZW0/DQo+IA0K
PiBDTkEgaGVyZSBpcyBSZWQgaGF0LCBJbmMuDQo+IEkgZ3Vlc3MgeW91J2QgaGF2ZSB0byBlbWFp
bCB0aGVtIHRvIGhhdmUgdGhlIGZpeCByZWxlYXNlIGNvcnJlY3RlZC4NCj4gTm90IHN1cmUgaG93
IHRoYXQgd29ya3MuDQoNCk5WRCBnYXZlIG1lIGEgY29udGFjdCBhdCBSZWQgSGF0IHRoYXQgSeKA
mW0gbWFpbGluZyBub3csIGJ1dDoNCg0KaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwv
Q1ZFLTIwMjUtMjY1OTQgbGlzdHMgdGhyZWUgYWZmZWN0ZWQgY29uZmlndXJhdGlvbjogYWxsIHRp
Z2Vydm5jLCBhbGwgeHNlcnZlci94d2F5bGFuZCwgYW5kIFJIRUwgNy84LzkuDQoNCmh0dHBzOi8v
d3d3LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNWRS0yMDI1LTI2NTk0IGhhcyBhbiBlbnRpcmVseSBk
aWZmZXJlbnQgc2V0IG9mIGFmZmVjdGVkIHByb2R1Y3RzIHRoYXQgaXMgYWxsIFJIRUwuDQoNCkni
gJltIG5vdyBjb25mdXNlZC9jb25jZXJuZWQgd2h5IHRoZXNlIGFyZSBzaG93aW5nIGRpZmZlcmVu
dCBzZXRzIG9mIGRhdGHigKYNCg0KUm9zcw==

