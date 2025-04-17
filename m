Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5C8C369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:43:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.21])
 by mx.groups.io with SMTP id smtpd.web10.6585.1744890225724757803
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 04:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Z8nVxWAR;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Z8nVxWAR;
 spf=pass (domain: arm.com, ip: 52.101.72.21, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vAho+5DYAO9rPj/7X+gKR9L5ZoL+4Lv1qNXJ6OJnT9mf0lJiESUu68Lv3lLvVvxEa8wj7c0MzxwgI/JlvzWgzz4ZJtFslCBL+rZG5jRmEBjN51Fj7lTV3Bkj99Rw1Y7q8wFPznVS0xVTVyfmlMEffHB6j0D8m/OQHyMvluauMNV0LWuaQLKXNQfD755mpqfi1dfPIJJxM+fXqCqg+D5gAwe3efywsjsURLnBCvSYyvGYz88EYyJQiF9RdEfllFQpDuDGzkqDeWVRS88IlQp4HoKY5Hlc1hc1NDn6J8xt1jr4ZDdSUS9nsHu+C3lMaPjL6qsBgo0zIFr79uAjpQ+QVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6CuCuq7Nctn8b8l80Aaw5u3/XQ/oUhTotI5RuVJS98=;
 b=NA5zZ762jBa0QlbZsLbH9hPjjnDUdJLQjD3cb57mi81gHIXigmtZeukB+yVUwt9cX+PY70/iTirM0KlpOhO6VT+EBWywM2w62qxQ4dC4bIjZd8Ui5Ae08IJKJaCcLwB17OnsIvBYuaF/n5JhN+00APGyH6SKjYEdjcMqJL8G91eas5qVGwGtoCB7OnST50U9e/DoP47Ljj2ntYWhJuBu7tSZu4bG9J997D8wCrGZIwuLpMqjGoVbDkNzWRlozUgJwfCRemI+NRQhCHAA8yhTiUJO0s7dVOdWX5aYSILpo4nTkkRWNSU6DVUQe/HYYyVMP+Au5wUbSzFs01wtq385dA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6CuCuq7Nctn8b8l80Aaw5u3/XQ/oUhTotI5RuVJS98=;
 b=Z8nVxWAR4Xa5x7qNv1xK+E+WlEe2JiB1dYtRQHtNwTBzwVSk5WkXyzGWtzCz9Tlq3AfM7Al6iNC9k++vv88J6/IrkT9us2l5/b1WiiMCRUYA8uqkJ6X6SmoMt6TUhhpaQkQJjNVhY9ibR+7Ruk6P05JwgPE3TCcilrsGD+GZfQY=
Received: from AS9PR06CA0635.eurprd06.prod.outlook.com (2603:10a6:20b:46f::7)
 by PAVPR08MB9859.eurprd08.prod.outlook.com (2603:10a6:102:30f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Thu, 17 Apr
 2025 11:43:38 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:46f:cafe::12) by AS9PR06CA0635.outlook.office365.com
 (2603:10a6:20b:46f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 11:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 11:43:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVdgkL8BCYU2/xNWFH0abXfr3CjXP525ugymy7MC8QmCcpt7g7S69s7fPjMommsQnSADKXx/gapOTholZM+HJMh2G0JQEt+byz4U2Mp5g3ZX5DdSE+RwMqXFspccfpdGiGtTdQlQchT3c2/OnRJaRbWDcHsUmI6DPNKXxLyNhSP03oqUPVFoh7McbvmJXKWpt9YaOOi1+Vawsg1L31gCngTLBOKSL0Z6TvtZLCSi4kgRx3mdDbtubBqhl3AeNlWB14lRZ/+Ucipl3iDyAbyYmgqT7hn4vFpqgaq4f5lRv9qiPx4aGcLt8onCBWEbiGKqJzH0SBz4s6RpRIwkWft+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6CuCuq7Nctn8b8l80Aaw5u3/XQ/oUhTotI5RuVJS98=;
 b=FOgsJLrQeWem9V2Sa8Hg3RnpD6CZQjai4+JwrhW2yCQWR78x4biUJZDZos6+M/+9T+HLIOFM1FflLIiBp8VyzoLoUDb4GXis+3IU9louWTocqkmk/HYfKDXDnLbkdCa77Skm9zE2OO3EtQhQZrW/2zG75iydWb1TLqknMPWAQu41dyhxDa3VXYroD2zmLjMA/YVsHRydexnLLUXzPP0S+ODPBKpBOERcnJSllGsgqc53UA1E4GbGCGP5wdt8JMNa4PyHJxWCr1luQ0xD2hzyT4ZZe1TeRJy8ykNLp+jEvTYu+65cOENBhJWBfr/eXfYjzbOhELImr5Nfe7u0NE+SqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6CuCuq7Nctn8b8l80Aaw5u3/XQ/oUhTotI5RuVJS98=;
 b=Z8nVxWAR4Xa5x7qNv1xK+E+WlEe2JiB1dYtRQHtNwTBzwVSk5WkXyzGWtzCz9Tlq3AfM7Al6iNC9k++vv88J6/IrkT9us2l5/b1WiiMCRUYA8uqkJ6X6SmoMt6TUhhpaQkQJjNVhY9ibR+7Ruk6P05JwgPE3TCcilrsGD+GZfQY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8147.eurprd08.prod.outlook.com (2603:10a6:150:7b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 11:42:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 11:42:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH V3 2/5] cpio: fix ptest-runner dependency
Thread-Topic: [OE-core][PATCH V3 2/5] cpio: fix ptest-runner dependency
Thread-Index: AQHbrP8N9D6gFy22sEW0IChtqbUtF7Onwa4A
Date: Thu, 17 Apr 2025 11:42:57 +0000
Message-ID: <342154B5-DC17-4145-B2FC-985D7685B1E6@arm.com>
References: <20250414053503.1180029-1-Qi.Chen@windriver.com>
 <20250414053503.1180029-2-Qi.Chen@windriver.com>
In-Reply-To: <20250414053503.1180029-2-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8147:EE_|AM4PEPF00027A5D:EE_|PAVPR08MB9859:EE_
X-MS-Office365-Filtering-Correlation-Id: 075783e3-c8d1-496f-d11d-08dd7da51757
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MEloTjc1bVplOWtvVmloaW1naVZDVnJPVEhBRjZUQUt3Y2dXMDU4c3dVM2ZK?=
 =?utf-8?B?RjJFVThEbFVuSWdDbW1zaUE1eDViUmgzSE5tb052OU43NDdqSnczbk5wS1Jt?=
 =?utf-8?B?ckpyQWNWdTRpWmNMN0ZObXFHWEJUdnVwODZhQ2V4S2NSdFVvK2pIYkZTY084?=
 =?utf-8?B?ZzViSWdpRGhvTWhrWUkwZlQ4dXZVN2MraWI4RHAwamxmNVFhTDlVUFkvc2hE?=
 =?utf-8?B?cDdFOXJmYUkvaytWYm1zM2hOWld0cnB6MUV4KzE4WlJOY01JKzZQU0JlTVcr?=
 =?utf-8?B?TGhaOEtWcXFLR1hmUkFrblZmT0R5SzR4SHlKVGEwYWkyTFJUZkdGOGV3WlJJ?=
 =?utf-8?B?aGd3N2kweEE0S1d3U1Nkb1dlUnk1bzhuM0pEQllRS3N0SVVCTE5tM3BDaUhF?=
 =?utf-8?B?Vyt6OHplbHdTaDM0WElCRlJuajFsYTRpQmxzL0VjaDQvdXFaNU8rSkt1OVg4?=
 =?utf-8?B?R0tSbzY1OTBMTWEyWVlsMjZRVlhUa1NKLzUzQnQrYko0SDRQa2hCUG5naUZl?=
 =?utf-8?B?cTR2SEFTUmFaa3dTNDRSSVpZRWR2VjJBQ2R2K0hkek9RZXpaZ2gyU3JoZXNE?=
 =?utf-8?B?QkRoZFEwSXZpNGpwM2xJZHRpTDRrb2VmQk1ZVnVhZWZOd2NQZDVHWk9OaTRw?=
 =?utf-8?B?QUpFM0JqT3BSc0FnUG4vRzU0bFpQam1OWGEwcFdBTWhWVFhrWmVXMlI4Tkc3?=
 =?utf-8?B?dm1OMlhSNFJBRW1YZUtKamRpNXB1VFBLdlJRSkhhWVdHVmtBMHdEWW1jZHNJ?=
 =?utf-8?B?TW1BdUxjckd0a0o4V3VlU3p1eXg3K3JzQ3lRWXhlOFg4b0E2OHlFSURVbXl6?=
 =?utf-8?B?OVEvYmtBMDFJazRNejNyRlFHS282WEtPeUVhdnhrNnJkUGo4MHQvekpwY2tr?=
 =?utf-8?B?QXdLRU1UU1NndHcwclo0TmdCVXU1WDZrazlLWldWRDZ0WTlNOW1FOG9rZnpr?=
 =?utf-8?B?VS82TDZPbVgrSDUxZzI1WnNJU1VxLytmMUZjYk5IZzhjY1I1WHNNdUlRaFMw?=
 =?utf-8?B?U0oyTWpNaWF0SjZHelZ1QWJ1OHFiaDhTRU5tdzQ0VnFKRis2V3I4Q0l1NHha?=
 =?utf-8?B?R3pkeEgzMGNUTU4xMXZ6R0VZOUloK1htOEl1di9oQnNHU2QveHljRzVOZ2xo?=
 =?utf-8?B?dTIxbDdXSVVSVXpNYkJ3MXdHRkZIYmIrRnVYQWwzYUpjTmVqcWFHTG5EQ1Ry?=
 =?utf-8?B?UXE4SHJvL3J1NDRoa09vMVlQa1RMcXJ2MTFhSENDbVZweHRpMWdzTHhJYXpS?=
 =?utf-8?B?VnpYbGlsZXNmdk84dlVZYkc4N3lQMW5Hc092M0VIRTVEWWZZRUZMVm5wUEZt?=
 =?utf-8?B?bk5BZVdEWXRYVEw3NjROUEZmVmo1NndVZGtEcTR0VDFHOGExclY5VDdEVi9K?=
 =?utf-8?B?akVwM2YrZFYxazdRcGd3MGVNZzlSZDJlZlJhQi9yUG9Wc052dGlTZUV2eEpN?=
 =?utf-8?B?MXNGb0ZQZGFSNXdXZHcza3d3OWRDbkI3d3dZUkRybE5DK24zdkN5blRpL0cv?=
 =?utf-8?B?MnI4L25mdXpXc3dyb09kRUdYWEZybE1iMnB0Y0k4YXR4dllsVENpUXVhL1Fv?=
 =?utf-8?B?ak03NG9CUWRtMTNTblpwemF5Q201Tk1mNXVrdlMvSGwzR2VXZ1R2Umw4cE5U?=
 =?utf-8?B?ZzVGZ1ZIcWF3WHpvNWtQN29xTFladXNWenB0Slg0Y0h5dUc4R3l0aWpiUWpr?=
 =?utf-8?B?eVcrN1U5OUw4eis3UzgraGlrZmg4eW9RS2VkLytQR2xnWHZrVnRqbmd4bFlR?=
 =?utf-8?B?aVJSOVhWZ2x6RE4xS3pmemtnMWJLd0Z6c0hnMDFsZHJubTd4NWtzaHN3a2Q4?=
 =?utf-8?B?enErNUhxeWk2cDRKQjBCeHpEajEvdFlYRll6Sy9DZHZQaE9EOFIxNGVzTThp?=
 =?utf-8?B?V003dzRxMkRrTU00Z0ltQkg5S1Y3U0dlYnRGMkEvTWFKTTViTVVsWVlUdnNO?=
 =?utf-8?B?MGxEcmpwWUtNQXU0a1VpUzQyNGhsWktrbzFxcE1XdDZLdGhFUzViMk0zMXQv?=
 =?utf-8?B?NFdpa0lxQXlRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <03101AB668D24141B2B0E153944636D8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8147
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f69bc0a7-2f1f-4152-81a2-08dd7da4ff94
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|35042699022|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WW1DUHVnNjRjQWgvUGZtQ3lyL1c1cnZsakRjbTVCWXhCWGtDSm01am9rMElY?=
 =?utf-8?B?UXJRQ1c0OHB2UjhDYVIwajdmTnlsTWVURlNwdFYvb25CWXphR1AyZWFZMk5m?=
 =?utf-8?B?aTc4ZStDMHdEa3BMQ0Z6U1hoMTBjcnQrdXhiYUcwaWhLVktLemdIYS9BeXpF?=
 =?utf-8?B?aFQ2SXZXT1dCK3JaWTN6TVo2WUFEQjYwYzlPcXRMV3p0RjNyWW1LYU1QS3lr?=
 =?utf-8?B?RmNvQUppZnIyMlFMWEVHUzUzWERQMC9wZk1RYmFHbU5Va3RVaFJjK1pTNHVD?=
 =?utf-8?B?YmEvYjIxQm10ZUdCTTZQY3cwdnFVN1l6UnM1Q3ZGbnZxWFluZmNwSUZpN2Q2?=
 =?utf-8?B?TXI5TU5FQ1UxUS96cjdJQ0UvVmpaaDZ1akYwYWRWN2YzaFBLanZuUUFtandy?=
 =?utf-8?B?bnNOQ2ZDcEd6T2IvWGZRTG9wRXRSMlIyalNBTzJzZkN0Ung2NXVRODZIKzRh?=
 =?utf-8?B?UGJiSWNRaHUydlB0bnhkZFVjMlAxZWVmQnlQZ1RMNzJXSDQ1d0tWQ2JhVDg1?=
 =?utf-8?B?aXBSZTJTeWZ3eEdHUFd2UmN0YmtSOGJkemJUck1OaTNKWEJ0cFhUTitCcnph?=
 =?utf-8?B?ZkhFQWp0RVZxTlg2d1VFcjFOTDBkZlRmaUFvQXMxUHdFZHh4akduUWdJbjJP?=
 =?utf-8?B?U1hKU08rMEJtQmxGNXJFS2NPTDZtS1JTM2xvYU52Y1NTU1ljZlY0TlVkWTBn?=
 =?utf-8?B?cC9iZWllQmZJTGNRUDJDTXRtUHh5MjR2bnk1ME1iKzFaMXk0cXVtdmhDd1d1?=
 =?utf-8?B?Q1REREoweWYwMW5LMUljY3FlRjRleFF6bTMva0lVVkRZVEY5cmJHaHlVTzhB?=
 =?utf-8?B?L3g4a1o5THhJZXFBQU8zQUpKeTBIRFNoYlpFTzJDbW5iS2MyQVZZV0t0Y2M5?=
 =?utf-8?B?TXBOT0dPUkI5Q2dzVTdXOXNQbCtaeGV1YUx1VGE3SWFuSGhLaXhzY1VYYTJu?=
 =?utf-8?B?OG1xS0NkRUNITmRPdnZ0emJib3dNbURvMFpDSVJWQVUyY1RmTUM5bUVndVhI?=
 =?utf-8?B?Z2N0UkVGK1Bhbjgxa0RWR2VFSUFNaC85M1pldHpwRTlGdWIvZDh2dW1leXJ3?=
 =?utf-8?B?V1liWnowR0gxRlEwSDg2UHZjV3R1WUlWdi9iMVdsekxJVUtuVVdnaUk3S2l0?=
 =?utf-8?B?Z2EzaW0rZzBFeGpVWDhyNVQvSGZOb1NBQ3VuZEFXeC9lL2JPQUxSd253Y1Yr?=
 =?utf-8?B?ZVlKUGs3cUQ4WXYrNTd5YXNtdU9rcXk3VFBsQU4reUUrcnhTazRUY1BMNUVt?=
 =?utf-8?B?b05rSVE4cit6aGljM212NlNpRzVDZW9WWVlyRXppZmZTSkJMS3hQcVNkeEZa?=
 =?utf-8?B?aWVHcExKOTVqblhIN2sxZnBPc0JNTlA3UUdYMGV6d3JJaGlKQmQvZ2UvZEhB?=
 =?utf-8?B?dmNyWWZDSHZtM09ubjRSTVJOMjJGTGdCSU5FV1A4WFMzOTk4WXRWQVcwOHF6?=
 =?utf-8?B?aHhKNThwZHZXNWdjanlNQ2VsYTRCc051MmNMY3hYLzB3SnJvMWtVUGdFSlFn?=
 =?utf-8?B?MFBubmw3L0srWm9rRXc0UVVGSDhsREVJUDBjeG1jRllTcHRtMkU4Sm1jTUVU?=
 =?utf-8?B?YnZXQ3dIN1pwZHMyVFlNOXJlczhwK1RnS0dNQmFESysrTmw0b0locjNUQUJz?=
 =?utf-8?B?bkc2QkYxVG42VXdqWkdYbXNRRjJZV2hKWHFmMzVzM2J6eHRxbnhIQTlMdVF3?=
 =?utf-8?B?WmFPTlF3a0N2Zm5IQloxN3BkM2pWVFduSXNMZzhyYnBxUnAzVUlTeEVZc2Nz?=
 =?utf-8?B?eERYMHB5QjBnRmw5c0JudTJseVFoSjlRMlBmei8wdC9uTUlHNzRXeHlHSktu?=
 =?utf-8?B?d0xxOEZ6dkNFTlMySVZLREFZa213WlpVN0NWOW5oRDVwU1hQWHVhcVhGVkxj?=
 =?utf-8?B?R1d4d09DWTM5SzlzVUlvdWZEN2ZWSm9FL2xnL2ZZbXJNMlFjQ0wzcXh1clRr?=
 =?utf-8?B?eVVEdEhHK2l1Ym11U0xlZWdhVUV0eTJra1NMTHpPN0o5UllGdHBGQy8wMXNy?=
 =?utf-8?B?VVhOdkd0VnNWWnRRSlo2SVRLZ3FnVTFVZG5rWHNVNGtNejV2MStjV2dYU1R3?=
 =?utf-8?Q?E6wws6?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(35042699022)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:43:37.0560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 075783e3-c8d1-496f-d11d-08dd7da51757
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9859
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 11:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215073

T24gMTQgQXByIDIwMjUsIGF0IDA2OjM1LCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IEFsc28sIHRoZSBhYm92ZSBERVBFTkRTOmFwcGVuZDpjbGFzcy10YXJnZXRzIGxhY2tzIGEg
bGVhZGluZyB3aGl0ZXNwYWNlLA0KPiBhZGQgaXQuDQoNCk5vdCBzdHJpY3RseSB0cnVlOg0KDQo+
IC1ERVBFTkRTOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1BU
RVNUX0VOQUJMRUQnLCAnMScsICcgcHRlc3QtcnVubmVyJywgJycsIGQpfSINCj4gK0RFUEVORFM6
YXBwZW5kOmNsYXNzLXRhcmdldCA9ICIgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BURVNUX0VOQUJM
RUQnLCAnMScsICcgcHRlc3QtcnVubmVyJywgJycsIGQpfSINCg0KVGhlcmXigJlzIHdoaXRlc3Bh
Y2UgaW4gdGhlIHZhbHVlIGJlaW5nIGFkZGVkLCBzbyBpZiBQVEVTVF9FTkFCTEVEIGlzIGZhbHNl
IHlvdSBkb27igJl0IGdldCB3aGl0ZXNwYWNlIGFwcGVuZGVkIGZvciBubyByZWFzb24uDQoNClJv
c3MNCg0K

