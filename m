Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B23C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 10:37:36 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web10.6303.1718102245830293118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 03:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oNCTjTWx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oNCTjTWx;
 spf=pass (domain: arm.com, ip: 40.107.7.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Pz8H9MP/YQKij/BGoFEg8YIgxwxCsnp+z//aLcOTJsgLHw/6fiOWPfABIkOmcJiAxfS4rjQyyfD+d7B6yWjZI+5WytgwzKC6T08KdFvzqrGsP70tOA3ZxkmHEWysGxNOjRrn8WbWMSur4H92slC49rIfkmVTazHN6o4qzoTs7I0L4V6SQgrSmZwSsr5CTRvYddRfrap8p+PmrbYk4LHF4D8Pv9OAbIWw+7oWDa3v+/5w65M9ABRRzishYhdX/k1S4Gc4/qXeqnBjaGB3m2loAUyN45PP53PScVOQvTQTDxrGz1uwxCJcTevYyoL0CoXulTq7YmURPDjxJP1ODjR71g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kABakov2jImohQADZXkF5n/vRjQU/mkZzpW6e2/ijus=;
 b=MSUkk4/Or8Jins94sYtSzzW0PLzYuBLOdaUzGRkEjqcIO/Xu9+zZFrPDWSEtzM9gciHrfW0LldNofnkdd2T6B0IDj4Wf3CUKctzB6k/ePp4Tn/d5gl/nSXqjKkHThFWDRqkuANxIPnZWkAwLceuOpRtSu0wAl6oYwE6jtjJp8XEf3CEZg1wRbZz0XzSmmGByWIPNnuS61rfcbpaGq3LxpVHxn26aJ9P/D3vGjPArJSggWJ4319c6iaZ4zLgXFaM0ERkFs3CkZo1GSGJFZa50V8p+vQxIAhOZq36x5JW7pmoeXstk0mqYCIMXxcHKaAhHtOItyiXeGWzyDIFysy0TLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kABakov2jImohQADZXkF5n/vRjQU/mkZzpW6e2/ijus=;
 b=oNCTjTWxQCIh9o7gD/Ya7x6YhG68keIA7hP4PiXz1/Am9FDuJjhQHmDn/urX0Z/oA3H7daJJnIaWGWoSpRDfDxIoMeMIemkXfd+Dkem2+B4SC3jTyg6R2zD8lNGJZRvodI1lwZj2rrHWGnoEr6B/PaypNPr//NB9Em0kETuLaxM=
Received: from AM0PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:208:3e::41)
 by DB9PR08MB6553.eurprd08.prod.outlook.com (2603:10a6:10:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:37:17 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::8) by AM0PR02CA0028.outlook.office365.com
 (2603:10a6:208:3e::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.25 via Frontend
 Transport; Tue, 11 Jun 2024 10:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Tue, 11 Jun 2024 10:37:21 +0000
Received: ("Tessian outbound 5a0abdb578b5:v332"); Tue, 11 Jun 2024 10:37:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f47052578712515a
X-CR-MTA-TID: 64aa7808
Received: from e29d3d2b0096.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 11852E62-F0BF-4C75-AE4D-E0C7621CD228.1;
	Tue, 11 Jun 2024 10:37:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e29d3d2b0096.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Jun 2024 10:37:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+ZD5a3qEECKQsTAVCmZpFWb09Aiyn5mOkHL1lTv+ppUbYV/axcRnj826eIwzyEu8fF40ZKQ0LBO7LafWjPsyFaWD277stR78dNTlsS/LRbDOeKQZ5OUfPUpQNL0R36nsOPwzDgJI3Y1ft04TRteKS3JSVhjSlVIh2KgjeAwe8vy7pWIrwGRISC92t6JfazbQ10K+5LFp9VXyNZVYSxB28g0G3oinod1RUtlkzd8nSxGihNbV8hvzWo83lV60SGV2IJNZnEb80U/fgLY+l0hNN1OEOAf63QRKGxkMRKW2Kv/pNTfdX8zSFxf77YYre2JPuyyQsE7lMT7rdtfPFG/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kABakov2jImohQADZXkF5n/vRjQU/mkZzpW6e2/ijus=;
 b=nNtIyLuZ+Tf9zqeDe4lb8m0beDYVxCUMWMYREI53/8cMc63ci7GsXKoQnQGBOA8nU4I8sPnNdkNlV7/0iMRU1Q+KRuBslFR2LIquJm8h0WWeag7eu9nHyMf9CvNQbfcvyhVj/jCBEAZcMSoxbwKBq79rq/KG8/saE6urWrEH6PKAsTrEH3aqOHYyotrISUgsGcu7XL7PMIftC5wPhazAGTC6d2yO1ZL6maOD4YtgPxKNvaTL+X5+iUOP15MF63NZDkevvTqkeMnjeoOkq0azf0lACXUh1E89rjq5XSwUZEECStruCZQ+6WJJcPXrDapzRWUQVoIPsks1DbGul7gTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kABakov2jImohQADZXkF5n/vRjQU/mkZzpW6e2/ijus=;
 b=oNCTjTWxQCIh9o7gD/Ya7x6YhG68keIA7hP4PiXz1/Am9FDuJjhQHmDn/urX0Z/oA3H7daJJnIaWGWoSpRDfDxIoMeMIemkXfd+Dkem2+B4SC3jTyg6R2zD8lNGJZRvodI1lwZj2rrHWGnoEr6B/PaypNPr//NB9Em0kETuLaxM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6421.eurprd08.prod.outlook.com (2603:10a6:20b:31c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:37:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 10:37:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "marcus.folkesson@gmail.com" <marcus.folkesson@gmail.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 0/2] image-bootfiles: new class
Thread-Topic: [OE-core] [PATCH v4 0/2] image-bootfiles: new class
Thread-Index: AQHasnZiGPZ/sgkfz0mWOdiPzUYBgbHCcaaA
Date: Tue, 11 Jun 2024 10:37:06 +0000
Message-ID: <F9A4DF94-3431-46E0-A0BC-9804279DC91C@arm.com>
References: <20240530095314.407638-1-marcus.folkesson@gmail.com>
In-Reply-To: <20240530095314.407638-1-marcus.folkesson@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6421:EE_|AM4PEPF00027A5F:EE_|DB9PR08MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f19c69e-056d-4deb-a887-08dc8a0279ae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cVNFY2VvMWZxUFBVZTBuVUEzK05NbUV1eGNQa1hFYVYxWUxCcVc0aVhraGdX?=
 =?utf-8?B?ampGTHRZSE40TGt4bjdNdkFrbWFmcWtHK2ZzemdlM2JLOGJSd2ZpVVcrTzJD?=
 =?utf-8?B?RG1HQ2VtNXAxWS92emNkVTFJVFZnUXUyVVZFeXB0T3FkK2RYVHI1cVNpZ00z?=
 =?utf-8?B?VytOL0UvMHdoaG9KdE9ZNTU3a2c0NFE4ZlYvMmJ2Q0tyTDFKczkrdDA4V3U1?=
 =?utf-8?B?eDN0aDExQUVZR0Q5SmtwQmxpeEp3anBYbS95Z1VwblhSOXhBeTBUczMrU3I1?=
 =?utf-8?B?cjNvdFF1dncrRHJMbnN1WGdvY2QvelkzQWVSNmVNVHY0QTlEeXREQkhKU254?=
 =?utf-8?B?MHhkZjJKNGdVWCt6Q3JsUThSOTk2TGloYjk0WmFERHJFOHR2M003eUI4dWpJ?=
 =?utf-8?B?ZVJhWDBObmNLNVdBNVIyZ3J5YjZ6Q0cxcVk3ZVZRUUp3L2xaRFVZOFZjakRR?=
 =?utf-8?B?NUFLMWR4OXJaVXNaSlJ5Zm1lR3NjMHFEek83NDBJTXBIc29FblZVY2FPZTY0?=
 =?utf-8?B?eDVDTyt1TTUrTFhRbnNrY3RucUNCdU03ejJ6aXB0ZUxCZWp5VEJDb0NmV1RI?=
 =?utf-8?B?YmNZZmpYTmZ0UUlRZHdqWldvRUs3WS9NKzk2QllhUlEyNE1XbWVFRGRwNzBy?=
 =?utf-8?B?WHlNcHF0ekN1ZGd5dTZNUnhaejE4T1I1SkZFdWZ6Q2RWNHNnbFdvR1h1ZHN1?=
 =?utf-8?B?M0U1NkxPc2I1S0E5SThLa3FxSzVXREg5bVpuMldGT3IzNXJ2aDRRVmpoRTZk?=
 =?utf-8?B?ajE3M2F4dnBBNWt4bmpCVlZyaUxFWjRIcGNqWVQ1blJjRjR6L285amZZSDRF?=
 =?utf-8?B?alA2SXFIbUJEZTl2MmxzT3BSYVY2TmtOWmc4N24vZVM4NWxjMEwzM2VFZVNV?=
 =?utf-8?B?TityOTBuV1VTbHNMVFVXQkVzZ0dKOG4ybU9zWjErckdvN3oyYnFjdmppNFdZ?=
 =?utf-8?B?Mi9qSnhqQmJQREF6YnQ5N2dRL29na0kvK2kyWG4yckd5RjRIWUhPODk1L2ZH?=
 =?utf-8?B?THBVbHhTcmEybHk1RFlLdGoxUkFQMEhMUThONy9oL3FuQWltcnE0TmRwanJt?=
 =?utf-8?B?bnFnZ2dsSURiVlVKK1BhaGp4aXZTaVUzU0grK0NsV1FmeHBmOXNzdysrUGd0?=
 =?utf-8?B?K05oS0kvUzdRY1JBckJPRmU5R3JualIrOUprSlIyL1RTRmI3ZTJxQXp2TGNF?=
 =?utf-8?B?VU8yZzMwY256VVNEekpmbE81ZG5ZRkNqWlQ1ZjVKTWg5MnhYZkFhMjA4a25G?=
 =?utf-8?B?UkN0eFNwSTI1OG1NY2Y1QXVmWkFXZm42M3NqUDNjU0NDTWJ2SElBRWdlTVRX?=
 =?utf-8?B?Wm5aY1dhWU9DeDJnZXYwYm90T1ZndnZXanowcE9oRUVmRDBlME9wWmZZcGNI?=
 =?utf-8?B?d084TURPcjJtYmVFVGl0NytneENyUkgwUjJEZ2FlM2dEWnB6SDN4Tkp4N1Ns?=
 =?utf-8?B?QWE5STdKN3hicmNMZmJkMldYTGZZaXg2ZWtEV2tPWjNqdFpINDFQemsvd3M1?=
 =?utf-8?B?aFNqY1cvSTVHR3RvVjRxU1FtakZrc1VUYmhRb1NQVVk5Qk9BZFRJcWJVMEtn?=
 =?utf-8?B?L3JKU1ZhaTFXdzZxWU5GSURueXp1TW9rYWgzTG9MemxxMmdlUWtxclRQL2cz?=
 =?utf-8?B?TklYL1k3RjM3dEpKc2Nwa2pzeHhXdWcxNUVRS2VKNkx4Ump0TWs5emprNmRB?=
 =?utf-8?B?SzBJRVpwT3FqYnNIZG4wNmZPdFZGeFkyendSS0svaG9TSFFyOHdHeUs0SHp0?=
 =?utf-8?B?VlpIUkM2NEFMZlVhRlcwTnNMYUt0ZzA0cjdtbDVTVERFdzE1SnQwSU9FTTdt?=
 =?utf-8?Q?xd3mGC+xS8iTFkIjWt0clVNWfyXALHjGZoMvo=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6EF32A0B716E64B827F21CB1595BA7F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6421
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8a06d271-6118-4c75-fa9e-08dc8a0270a6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WVYwNTJYaGc4d3BpRHY0SnFJbHBtMjAvcm9HNktrZ1hoRTVwVTZyN3B5c1l6?=
 =?utf-8?B?Vkp1ODl2NHNqcUw0Q1ZWemhnZU5QNkNiMjlVQmE5OG9hWE5FTE9DM2E5Sjhj?=
 =?utf-8?B?ZlFyVVBkL3p6cERlNUtSR1hyQ3BYU0pDVkJXcmpUN1liNFg0cmxqZ3Zrdkps?=
 =?utf-8?B?dDU3SExhektuY2RmT1I0QjM4Q2JVbitCbXowMGRSYU51OXlTdnhKck5hcWFC?=
 =?utf-8?B?eWhmcHAvVzZiVURiQWV2b2hnY1hJeFMyblUxQlJzV1RoU2ZHQ0FKK3NySjRy?=
 =?utf-8?B?M3pSeWovbjFncWcwdjI2WEJjMDRXSXhjSUNiRVVJeGJOaEcyWHIvMkk4bEZQ?=
 =?utf-8?B?TFpuMGZIc21VUWtHRW9hTFplZU9RRDV5ZXZ5azZwOHNadWlkODE3aTlVUU5u?=
 =?utf-8?B?SVJCSVhEK2x1WU9YTzVxOUlCSXpnY1dDczZndy9HaHVseGNvWU9ERVNUVlZk?=
 =?utf-8?B?V1RzY3IvWTFKQS9mZXFtZmN2OFNKaWdSTjFSNFFhNGZvZlhaNTlxajhYeVRI?=
 =?utf-8?B?S2pzRHM5WE9iMkE5V2E2MFBMUFFnaHdSaUE2eHB0YlVSbXJEVU1ZVkVUbzZL?=
 =?utf-8?B?cEFFdXFROFdCckdxUmxTeUpUcWd5aUplSUhzU2l3VWkrQnlzK3FQRnZZd0ti?=
 =?utf-8?B?dmE4T2ViRGhYd2N1N3BrMkgza09Ockp4cGFPU01zQzE5YWxKT25wc2xib3lm?=
 =?utf-8?B?RVEvN2tMMGRPVUtaMExSNEVnVnBtK1RkK1NiV1NiNkRTdUR5RTlqblZwcmgv?=
 =?utf-8?B?c2ZqUkt4NzRGbTdnNnZPL3V5cGphYVpRRE52VEZpdTRxYzZJRmJHUFBncFFN?=
 =?utf-8?B?bnFkcndsTHdxVHpVSk93WEZxY1o0Y253T2cxRmRlSE85ZVZucGtZM0NtclJK?=
 =?utf-8?B?UVdSVTZIUjJwSEJlYm1Qc0tzTGw3TjhGSmU2eCtGZk9DUjVSdDRDUWltM04w?=
 =?utf-8?B?VXFMNHN1YWx2bkRublFuTVh2eHBCNHF3cnFSVmRWWW5NVGNHWGp0MWwvOHJI?=
 =?utf-8?B?ajFDWCtKY1hhdzdWSm9nRXNzcU9pMnFiTTBjbnhmcGtqNDBTSmFzbjJXaGQ2?=
 =?utf-8?B?RlEyc0pneDBDQkZsTlhSZTI0QWl0Q0tVYmtodDlyU29NOHUvekNVRjVybVNN?=
 =?utf-8?B?YjRpV2wyNmZ2d2d2dEIzNGd1MEg2L2U4dE9XVEN2SjRiY0NDYVYxbEJhT2dY?=
 =?utf-8?B?UXQ3NExWdWhQSG5uU09tblFYMlg0YkhCd2lmY2RqZVU2NE9Dbi8zVjBGSjY1?=
 =?utf-8?B?NThaSElJelFiM2pzREpBRmdhdVpuRnlaK1A5b241bXZOYTVyNjVxWE5ROEs0?=
 =?utf-8?B?OHRFaGJqTjcvZmNQbnBpRnZKbHZCM1MzNm1Vdk92VUtyTlQrcWtpSkprTjds?=
 =?utf-8?B?ZWlpRnRBb3EvV1hhUFYxMWlibXpSaVkyd3VVNThabkxMK21ud1NwUnlYbUZv?=
 =?utf-8?B?Y2NoV0VMNytpWVVWRDlYTjNDTzVZN2FiZ3AvRXZYY0J2Ky83blExaEl1cnJo?=
 =?utf-8?B?ZS9IZ0cxRnBqdkVSOXVYUCtaQ09VeEszWGpqMXhlWjlRRlNiVks2ZjZhS09T?=
 =?utf-8?B?M2UrL3k0T3JnNDVtSmJSamhBQVBib3B0NG82R3hZL1RUK1BNTzRnajJSSVU1?=
 =?utf-8?B?dCtoZkJQcm15ZnFTSWNCV3pWV1lhUzJBbFJtLzJXbVJuTUhsQ1dkdlNWZTRU?=
 =?utf-8?B?YlF0M3ZvSThFOFVwS3MxZ3A0UEZuRzdOalI2aThxYnRzRjRqa1pyMkExZnlL?=
 =?utf-8?B?a2tpNVkvcWNzNWtMSEZYcndLQWZmUXg2RE5OOGdYWkxiNURIa2JGc2dRQ2JJ?=
 =?utf-8?B?bTJNNHY0dTNzMnVHN2oraGdaaDEvQ0xRellPL1ZOb3ROdFB6RVg3cU9xczM2?=
 =?utf-8?B?QTBma2JtS1g2a2RaMFI5Y05BQlN0V0lxRk9jVmhsU2pLNUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 10:37:21.5356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f19c69e-056d-4deb-a887-08dc8a0279ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6553
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 10:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200501

T24gMzAgTWF5IDIwMjQsIGF0IDEwOjUzLCBNYXJjdXMgRm9sa2Vzc29uIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxtYXJjdXMuZm9sa2Vzc29uPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gVGhlIGltYWdlLWJvb3RmaWxlcyBjbGFzcyBpcyB1c2VkIHRvIHB1
dCBhbGwgZmlsZXMgbGlzdGVkIGluDQo+IElNQUdFX0JPT1RfRklMRVMgaW50byB0aGUgcm9vdCBm
aWxlc3lzdGVtLg0KPiANCj4gSU1BR0VfQk9PVF9GSUxFUyBpcyB1c2VkIGJ5IHRoZSBib290aW1n
LXBhcnRpdGlvbiB3aWMgcGx1Z2luIHRvIHB1dCB0aGUNCj4gZmlsZXMgaW50byBhIGJvb3QgcGFy
dGl0aW9uLiANCj4gQmUgYWJsZSB0byBsaXN0IGZpbGVzIGFzICJib290IGZpbGVzIiBpbiBlLmcu
IHlvdXIgLmNvbmYgb3IgaW1hZ2UgZmlsZXMNCj4gaW5zdGVhZCBvZiBpbnN0YWxsIHRob3NlIGlu
IGV2ZXJ5IHJlY2lwZSBpcyBhIGdvb2QgdGhpbmcuDQo+IA0KPiBJdCBpcyBub3QgYWx3YXlzIGRl
c2lyZWQgdG8gaGF2ZSBhIHNlcGFyYXRlIGJvb3QgcGFydGl0aW9uIGZvciBib290DQo+IGZpbGVz
LiBTb21ldGltZXMgaXQgY291bGQgYmUgZ29vZCB0byBoYXZlIHRoZW0gYXMgYSBwYXJ0IG9mIHRo
ZSByb290DQo+IGZpbGVzeXN0ZW0uDQo+IA0KPiBGb3IgZXhhbXBsZSwgaWYgYSBkb3VibGUgY29w
eSBzdHJhdGVneSBpcyB1c2VkIGZvciB1cGRhdGUgdGhlIHN5c3RlbSwNCj4gdGhlbiB5b3UgcHJv
YmFibHkgd2FudCB0byB1cGRhdGUgYm90aCB0aGUgYm9vdCBmaWxlcyBhbmQgcm9vdCBmaWxlc3lz
dGVtDQo+IGF0IHRoZSBzYW1lIHRpbWUgYXMgdGhlcmUgbWF5IGJlIGRlcGVuZGVuY2llcy4NCg0K
SW4gbXkgbWluZCwgSU1BR0VfQk9PVF9GSUxFUyBpcyBhIHdvcmthcm91bmQgZm9yIHRoZSBmYWN0
IHRoYXQgc29tZSAvYm9vdCBwYXJ0aXRpb25zIChzdWNoIGFzIG9uZXMgZ2VuZXJhdGVkIGJ5IHdp
YykgYXJlIG5vdCBtYW5hZ2VkIGJ5IGJpdGJha2UgZGlyZWN0bHkuICBJZiB5b3UgaGF2ZSBhIHNl
dHVwIHdoZXJlIHlvdSBqdXN0IGhhdmUgYSAvIHRoYXQgY29udGFpbnMgL2Jvb3QgaXNu4oCZdCBh
ZGRpbmcgZWcgZ3J1YiB0byBJTUFHRV9JTlNUQUxMIHN1ZmZpY2llbnQgdG8gZ2V0IGl0IGluIHRo
ZSByaWdodCBwbGFjZSBpbiB0aGUgcm9vdGZzPw0KDQpSb3NzDQoNCg0K

