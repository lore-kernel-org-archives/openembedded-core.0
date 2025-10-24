Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A53CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 10:47:00 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.41])
 by mx.groups.io with SMTP id smtpd.web11.7377.1761302809556188964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 03:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iiBrua0o;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iiBrua0o;
 spf=pass (domain: arm.com, ip: 52.101.84.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dqaxMrG0BiiJvFzrOYYX/P530Tatltl3VTAeYQu2kjzY2RajXGAs658CWYHfVOkYQLx2LQ3wNEZa0DafKhJcu/V6ffqxBaAy5nN79UT4QX+vF8j6mzGPNLLjyIGQeWa+itu3JWqQlNcPUDBCelPEtVOSWm7c1edXKK5h+p0xlste6E21yQ2Q0dAxOxH8/2ePJLmwhd6SonyjME4PuyidP50m4I1AbiVmcqnLEZHiO/nBGkplEB3UaqbAf+Fco2uc41i0MGL89eWWMMxkD7Rh4fRQFnHWifGsCD97Ur7s8xgC5bUnLyxgOtPZQb1chiRpqqyeqnQCC+BnOzBkfZLQaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKr70HYsV/qKhIKIr+zoie+1iKjyCsb8a/CrvhtZnpg=;
 b=YqaF1DzLko/Cww5S9Qcd76Xnmd/jFJyqoU1uXncqqMrllzMr5pHXX+gvZ81r50LE00hOjUafgxxprBR9GIIsjGGKqvqNeJ7IlyZZtImxGLfLjU/+XgfXyT97Te+E8KgHd4SZubLWOvyxSJfVFUcZ7eZbH+nPvgAS1iQe3PUkSg6DJKFk4+engKKLxjExT0CFAO5+O2ssYEaL216pQAuJpD28BR2t5VioAETBAvVDvKS8vP36iN6Gt/ZFGx9TJi5pzfjo1zOfCT11GWLfcIK5pjnebzIZl9I+BoLgxDaR9BAsQsIif7Ca//FVW+SuMtrGA/f7HTE4Lttvk00isKl8TQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=navimatix.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKr70HYsV/qKhIKIr+zoie+1iKjyCsb8a/CrvhtZnpg=;
 b=iiBrua0o5xDWxnsKlfTI90WY5geACMy+8oyFIvlIKOX5FcuGnhymZwid6p4L5V4HKy05Q9+EVYIzao7pyHcyO6FAOw/ZoJhGanvCC1WYGXHlEgZ78NpSIf7gYV6ZstIEWORRIdMVC5rJKIRNtY4B0PCudySw/GGLn1GAZJWwpog=
Received: from DUZPR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::13) by AS8PR08MB9340.eurprd08.prod.outlook.com
 (2603:10a6:20b:5a8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:46:45 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::e5) by DUZPR01CA0006.outlook.office365.com
 (2603:10a6:10:3c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 10:46:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7 via
 Frontend Transport; Fri, 24 Oct 2025 10:46:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iv6C+Bu4YuAJQ193g9WF9VaasNB8DK7PGZPMp4voPQOWDHBP/991gHpQOV9CrWbq982Oi+tzxYb1NPqUu+aMtR4zIgszbLYIPVrd5QamrO6RSYeds9ATFDeWlAvlCqKtU77q0rSPQUxN5zuL9VFoBy0S9z7qGjBLeBn9NP3y5yLRnCbpzdBDTuqCYn2ie2FvZP3Fhl32qgWLMSBpUlNaGTwPGBbG2PBeI6/+B0dUoCIo3zkkdttZVJpY5EDq1X9UDYmXpC8l58IR5Iz7VlTHVEwEO70P7TTOOxHXRSXxiHmKpPX+rkeHJeNs1FBGiQmepVuQtdlOCh44g+G2lr475g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKr70HYsV/qKhIKIr+zoie+1iKjyCsb8a/CrvhtZnpg=;
 b=CJYsFVBmXLztrHS7+IicnjugFoCH2wHUARYNYO1k9PtNQZIn0bPzALZ+rrSiKJNq38wZB3+GPhcn1AhY9iiLK77Nhf6X/bcrOnFN1wVjp8nPDFShnWd1xDLMjy6H/++rVFdA2jlRCX9ukPvn2WIC7jBx1OQksi00IG6x+zdX7nKTN2DtNtdM6oPul2h38cbk/Pwo50FZHTYnSyMLFkLqc8ZXkxKkn0hl3DVchPowrG9j5awx9cXXwIDoELIMm4piqTbKzgA0BW3D2EB5fDYgHMZNr2K/S4K/8xyZ3gMy18JwapM38vuF3T8ezNGQvEMkVP+A+1buRlPLJPysyZmX6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKr70HYsV/qKhIKIr+zoie+1iKjyCsb8a/CrvhtZnpg=;
 b=iiBrua0o5xDWxnsKlfTI90WY5geACMy+8oyFIvlIKOX5FcuGnhymZwid6p4L5V4HKy05Q9+EVYIzao7pyHcyO6FAOw/ZoJhGanvCC1WYGXHlEgZ78NpSIf7gYV6ZstIEWORRIdMVC5rJKIRNtY4B0PCudySw/GGLn1GAZJWwpog=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB9970.eurprd08.prod.outlook.com (2603:10a6:10:489::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:46:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:46:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "f_l_k@t-online.de"
	<f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v3] gtk4: update 4.18.6 -> 4.20.2
Thread-Topic: [OE-core] [PATCH v3] gtk4: update 4.18.6 -> 4.20.2
Thread-Index: AQHcQrgY8NrZsHEn+06EUHSnGohcBrTRIVUA
Date: Fri, 24 Oct 2025 10:46:11 +0000
Message-ID: <4BABCC19-4826-4A8D-A8CD-460DBDC78E20@arm.com>
References: 
 <b5488743ef4865982b2453f617d303efa5763d54.1761070849.git.joerg.sommer@navimatix.de>
In-Reply-To: 
 <b5488743ef4865982b2453f617d303efa5763d54.1761070849.git.joerg.sommer@navimatix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB9970:EE_|DU6PEPF00009526:EE_|AS8PR08MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 612e7810-203a-4513-ab02-08de12ea9fb6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NExvbiszbmswY2NFYkNRaTNYdEJXREZXQ2x1VnZRNGhZZ0Q5K29vUVNyNzFk?=
 =?utf-8?B?cWdWUnZJbjlkamNVRnd1RWpJc2VURC9HL1RTVXY4Wm54WG1WTjZIeldWTlhr?=
 =?utf-8?B?K2FCazVYUW5YRGp2RFFoQ1BGdG95dXZlWFRkV0hvVy82TG0vTHNvY3BVa1lV?=
 =?utf-8?B?WE9NTERwc0gxaHArZVYxV3JtTTBQQnIyRFFQSmNsWndFZytNdUhaYnZRVlJZ?=
 =?utf-8?B?SWFHc002OVgzdnN2WjJEUStxYjFWb29iSzliRFphbGtsTGlWcUZsVFFRaFJI?=
 =?utf-8?B?aXR2NlEvM1lXcVZ6OUtVZVJpMi9GZFpoYklxRnY0ajZod2tmemtuTEJ0U2FR?=
 =?utf-8?B?bkl2MnZ1Tm13d1VqYkE3dkpqUXFPb1JBZldRNUgvM21LejJVZ3NpRWMzMTBp?=
 =?utf-8?B?VUE5MiszNnN6cWFjSFpTeUlnYVVVMHlFdERKaEg3NVJCbnpqVGhzWjV4WnpQ?=
 =?utf-8?B?b1haZ2F1b1ZCRFVMQUJMYzFuTFZvRzZzbUcvR1docnV3OUNrbHNuUFgwNWp0?=
 =?utf-8?B?bHp5WFR5MFhVVk5TQzdvNlBCbTluWFlmNUxaTk1wMnRYUEFUVHppcVc5cWR1?=
 =?utf-8?B?ckkrK1VQRVhKY0tIZWsxMkJ5Y09DZjVZam9WMUcxM0V6WEMwS05KdFJhaGZs?=
 =?utf-8?B?bEpqZVV0MFJkWGxYbHRsRHl3RGFiQWlZOGhuZEdtTTNMSlFabUdJMThPVVMx?=
 =?utf-8?B?VlNsbEx3cGpsMXE5OVZXUmtkNFZJSXdwa0hJd3dIUTFjWURCbnJRa21pNjM0?=
 =?utf-8?B?M2pWZENLVk1KQ0dRcTNBZVk4bXdqQ3FMRzdWc1V3MmxMWkE1b1lZRUxIbmp4?=
 =?utf-8?B?RGd5cmhEZHJjM3AxK3E4NnJ4UWgwWnFvNllFYk9SdnAwOU9PY3dtcnZXLyt1?=
 =?utf-8?B?TlZSckxrNmpaWVhNKzJRYWRXbFpWRi9kTkRRZmRGRVFNNmNRWklUTHVxL1ha?=
 =?utf-8?B?SVJkN2xWYlhlWlJTc2xyQ09uRFNhS01OQlFjTkFVYzZKVlU1Y2VFWEZtbXhO?=
 =?utf-8?B?Z2p6ekdSVkx0UXhRcnJiN05QZi9jc09RVlRMWE85c0RsUklRVWo5WWp0QVZx?=
 =?utf-8?B?VFZhTlJPd1Npa0VCOFRUTFFqeU12WUdvTldKNVpDMXlwM0Fuc1VETTJwQVVv?=
 =?utf-8?B?QUlQWVQ0Zm1PaWxJbWRlQkJtaGsyUWJMYm1OVEpmc05tWnhDTWRIMnA3Zk5x?=
 =?utf-8?B?dy8ycEx1VlNjQjd2d0dYN3NGNUJaT0VNL3QrQ041U1EvNVZDRXk4M1dOaWJu?=
 =?utf-8?B?Uno0NXhSRU5VcENoWFNRUEpmZDR4cWQzRFV5SEROYWxLNk44Z0NmZDljckpY?=
 =?utf-8?B?UGkxRnJ0cWZzdzg4Q0xyaUIwS3Q3K0R5K3I0RVdobTM4UjJSV1hEcW5zb21Z?=
 =?utf-8?B?bHhzV0ZTbzhRMTJzWksyOVhTS2hVbEJtcTZmTkVCcGJodEZjZW5iNzhsNncw?=
 =?utf-8?B?dXNHNzdyQm9vTzhSenlkamlhWWZRc3VRdHZLcXk3aC9wWDVXOWNZR2NVNk8r?=
 =?utf-8?B?cDFpUzhtcUpVN3JuNWxXeEM0Ry8zQzRvampTeHprUFRGV084NE1jV0dER3Fn?=
 =?utf-8?B?WVRQU2dKQ0tXcWNjcCtVL05WenliMHBLSXZ2R2FkcXk5enpKekxuKzVTQjlY?=
 =?utf-8?B?MUJhRmtEekFvREt4TVl6cXhYVWllMnEvc0NJOWZoREY4WmFvZG56bG43R1kr?=
 =?utf-8?B?ZUcyQmpaYk9CeTJTM0RCRkM0dEVNdk1UbjVpaUw3YVJCaDExWFdqb0VCOEc2?=
 =?utf-8?B?RGRUQWlkT2RYZXQzZC9MVUhGeE4wWVA3ejVOM2YrYkxvdzdya3pSZUlhSlRG?=
 =?utf-8?B?ZmRZS0N1S3JPNkxtRVhBbFROR2VLSGRnLy9xamVNNzhaSWxudXE3b0ZBeW1G?=
 =?utf-8?B?S0Q4Y3FBdmg2MjhPMVliWFNjRWJCM1M4T2hOZ0NFRysydkErZUYrekFLZkFw?=
 =?utf-8?B?YjNCSng3Uk4wMFZIR2U0OEtxWERKRDJtaW94VU5tREdpZDJHVzNNTTFpQzBC?=
 =?utf-8?B?b2dQWXJ0ZHBLRlRkQW02VXB2TGRqVHFROGhzNFh1V3ZldExiejYxcGVocjZG?=
 =?utf-8?Q?/aMO25?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DAFC2B865003E438F63856D08788DE6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB9970
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	afa08380-ef86-4c9e-e2a4-08de12ea8bf3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|82310400026|14060799003|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TXY5c2JQUDlvTXViUXZGbUZSeEFybmlNVW9sL0tzS2NZSjdGZXBEdUwvYkR2?=
 =?utf-8?B?cGg1TjZnMlV1aGxRdTRaT0JzVm5jSjBxWm95U0lhOTNMNmFxR2h6QVBsSzVM?=
 =?utf-8?B?MTdLU2VGTWJZVmRHQ2lLTTlmTGhpSE5TR05mVW5FR25sUTFYYjZ1Ykpxendz?=
 =?utf-8?B?S1R0N1Fla3o1ZjVwWEJ5NEZ5d1IwZFVVZXk2dFR4bkhSRnczQ1k0R0NDazFG?=
 =?utf-8?B?VWJQdG1aajFnVmVVZXltbll4OGtuMit3WmRxTlYwSllOWW10RHVUSHNoOXdw?=
 =?utf-8?B?d1VVOHEvak1DY2h3c2tvaVVINEdWSVRqYTRMUi8rNERYdnp3RUE0UDUzeDl1?=
 =?utf-8?B?aGVUcDRicHJ1N0hDdGFRNFZ4Y2hkakhLKy9GZnZGUHJIYWxlYSswZmpnTTNO?=
 =?utf-8?B?ZUQ0Ujg4MHNrUkpaSGNxZXphUjcrRVJGWkRkREpVY01CZWR5c1Q3Z2l4TW1z?=
 =?utf-8?B?eHRodnBhMVVRQnRRL2xiYXpYdnZoSSs0aXNDbjUyOGkzUytnMVZsTzZlUVI3?=
 =?utf-8?B?cVdQY2JYSlhuOG1jWFQrTlBKcm1lditRRThyMXBqSlc5VitLR00xQVdCSFNo?=
 =?utf-8?B?dHpTSHYrSUlONnEyWTc0WWF6S2VTYnBBbUkwUlIvb0RRcWl4YnBsUkFtRjdp?=
 =?utf-8?B?Yk9ETmZxN1M1eG5XSFFLMzExcEQxVm1SSEJhNkNuZFdVSUMyRlB2dHhzVUhS?=
 =?utf-8?B?KzhRUHpueThMQXN2TEdMYmdwNFVFU1FrS1F0VDh6YUJvdDNUUjYxbVJiWmpq?=
 =?utf-8?B?VE0yOEhCQ3A2amE2VU4xKzlTZlo3cGo2QTRuTmxINC9BRVNmZ1JRbDZsS1dJ?=
 =?utf-8?B?M0hXbllUYWJpWW1UQ1RsOERaM1JCSDFrelVheHhjbWV4Q09tdEhNN3Z2cW1i?=
 =?utf-8?B?YmVVVWt4Z24zbXlUdXZma2hlalRVaGwwWlVKUlVOaWNHdzhEVkFtRVhVN21h?=
 =?utf-8?B?bkJkRmxoUEJYSnRHNGRIMjlTREVwNHN6K29Kd29xOGtDZ0sreVVFb3NKWGtn?=
 =?utf-8?B?dEFPeGJDUVcxdmVsejhQU3lRMWR3Y09wd0g4UEdsWEkzaldnVUVFWnRweWRK?=
 =?utf-8?B?aCtXalRJZFcvZ0dNRjRwcG5rZ3dOeGZVa20zU0NnQ2dyVVppNmFmbzJVVzQw?=
 =?utf-8?B?Y0g5WDVSdDJwQys5dU4yd1M1MEJUclprenpoQVVQTG5Xa0o5dmkwcVhtRFZX?=
 =?utf-8?B?cnFDT2ZqdEh4SUN0WmJ4SG8xeDVUcjRUL3NMWGlFWTE2bnl5QklHdSs4aFFx?=
 =?utf-8?B?TTdQNGlqMm9SblYzK1NCdkJnZjA1bXNaNkR6em03NitxRUl4emM5YmxZa1pz?=
 =?utf-8?B?YkxUdE9jSkF0RElGTDRtalIvcnNBN3hwL2tKQy9iOGJ6cWdhanNTM3hmTWVq?=
 =?utf-8?B?Rzl1WUt2TjNJV1p6d241YU5vTzh5ZG1FdjJKTUc1akJpMEtYdDN0K05YQzR6?=
 =?utf-8?B?TmVXUDlMWThpZWE3TkdXL2lxZ0Nad0RWNElKQWw4OHdpNklvTjM1emNmVnUv?=
 =?utf-8?B?a2ZBcUxQOEd3UzdTek82OSttQUpzUjVyNFJxcHZJQzNBVGRPdnd0VmNHWEVp?=
 =?utf-8?B?eDQvWCtVeWFsR0g0K1NLWjlhczJkR0hOVTRtWGV6YXhDck9XQkJZbGNaTVhs?=
 =?utf-8?B?NGdlN0tTSnZBMUdMSVg0QWdKb1FCQ0h3U3BSNDRQNjlnT05tY3cyRVBwdW54?=
 =?utf-8?B?ZE52OVN1S2V6WlFLQjhCYk5yQVhMdlpyMFZXcE5wRnp2bnVtUzRWTENtVHE5?=
 =?utf-8?B?dXYwVVhCVElxbmF5ci95OHA4TlM1MThhRTBnNlBiMEtkQ3BOVzc0ZFloTTJG?=
 =?utf-8?B?aXB1ajhKZ1BBQnVoTzR3bUx1WU90Z1pLYnNpNWhPeWxjd1lEVWpwSmVtRzFM?=
 =?utf-8?B?eXNvdXB6bnVrY1pHT05zR2djd05DYTQ3L0oyZTlhSlFHV2lPbHZjdXAvS1Vh?=
 =?utf-8?B?Z2RGWFhGYVN2QjF5SDRnZTYvRUhFU3p5U2xYaXQyWkt1cGl1VU16bzc4aXdy?=
 =?utf-8?B?MlZpMmFQOUE4MDRMTGVOaHJIZFI0ZXoyM3lzS2VVVmVwWE02RktweUhIdXBz?=
 =?utf-8?B?Q2dxK2dFalJwRUdYcE9RbEFCdzByVzVLcjQzSmFoUFhPbWFuSk5DRXVYeGl3?=
 =?utf-8?Q?ChiE=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 10:46:44.3406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 612e7810-203a-4513-ab02-08de12ea9fb6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9340
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 10:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225288

T24gMjEgT2N0IDIwMjUsIGF0IDE5OjIxLCBKw7ZyZyBTb21tZXIgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGpvZXJnLnNvbW1lcj1uYXZpbWF0aXguZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IC0gcmVtb3ZlIGd0azQtcHJpbnRiYWNrZW5kLWN1cHMgcGFja2FnZQ0KDQpJ
IGp1c3Qgc3BlbnQgdGVuIG1pbnV0ZXMgZGlnZ2luZyBpbnRvIHRoZSBHVEsgY29tbWl0cyB0byBp
ZGVudGlmeSB0aGF0IHRoaXMgd2FzIGFuIGludGVudGlvbmFsIGNoYW5nZSB1cHN0cmVhbSBhbmQg
bm90IGEgcGFja2FnaW5nIGJ1ZyBvciBzb21ldGhpbmcgd2Ugc2hvdWxkIGV4cG9zZSBhcyBhbiBv
cHRpb24uICBJZiBhbm90aGVyIHJldmlzaW9uIGlzIHNlbnQsIHBsZWFzZSBleHBhbmQgdGhlIGNv
bW1pdCBtZXNzYWdlLg0KDQpSb3Nz

