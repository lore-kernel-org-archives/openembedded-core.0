Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7997C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 18:09:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web10.1861.1741025393120206740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 10:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mKnnRyuW;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mKnnRyuW;
 spf=pass (domain: arm.com, ip: 40.107.22.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Mlw88IhMCGzDl3NKVpS6DquE9PMcGWD/KNzm8tESddZinzkk8KGqaJuCCpnxKJGA7S1TmgA7USUDBvg+MErNTXmOWglrhbXjg1uIHTVWM9MwQmL7OokaSqB46eh+mCWj2fSb0vi+ke0+auhMUjGrB2luFQOjtVx3QQNDu7wlANMlZqePX5qQfcQAv1dubv1c0VdPoDIQiTe9FUbQgBLPTaIU4vCLPRGKJclv6fn0JPoIp6llLYCzBPsRhAy9KbruXRSrz99/4ntGa/Jj3JSk69gE3oCg6A4LAbLn3uJTPX9LTQgKu1uVVa/8lnZnAt8UWbkKVZnW8Uxk+7mE9dp3Kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzbLBQpA5hdL0WKf40UpQZXh4sh1JEtnmKm1xlA+t58=;
 b=eKssH/GJH9kPKAbkpxtMnK0HQlwW1wwQLW6ExjSYHeA2HT75jhr39/qzVAHpd6Yjv31Q9OVsTZc/jdkNv/nc1eBfXgspmQOaiDJ/Z/Kf1MZMgnt/nglplYQ+4nCOBX6xTuYXtgkx9LGdwXb5+hIVfcceWXN6EZwLewCW9sTpXw/gBZgHIoBF3FyJrXWC1YrSbeGc9lQwunyPYxadAEr+gTbG9zZuIdij1Cd6ZI3WWmNdAxYbUyOhguw2qCi8h8o2r4BQzKIw4llE/Pra6HQ3YweuFXvWTBW3Wti/HQblhFbxs5VixWNYE9LZBPcFu7SDA5akFGwn+D/sEX3fIeuGhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzbLBQpA5hdL0WKf40UpQZXh4sh1JEtnmKm1xlA+t58=;
 b=mKnnRyuWqnbUEZlZzcnhkhMvZCDJt4tJWBTF9IHaz+47Wv/AEz12eNDDQyX4Exnr06pteT8upBkvaThZ11n9hANdTRMbQjbgWzK6Ft7jVhPHPeSAaggeBABtcOUo4qtlK/b0AHeZZrjhDz7Wyey+I9QmXIyNSeGFWGCWFavkTPs=
Received: from DB7PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:10:52::41)
 by PAWPR08MB8838.eurprd08.prod.outlook.com (2603:10a6:102:337::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 18:09:49 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::88) by DB7PR02CA0028.outlook.office365.com
 (2603:10a6:10:52::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.27 via Frontend Transport; Mon,
 3 Mar 2025 18:09:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Mon, 3 Mar 2025 18:09:48 +0000
Received: ("Tessian outbound c3a902884497:v585"); Mon, 03 Mar 2025 18:09:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c377ad0fdc25390c
X-TessianGatewayMetadata: +8lhH2NFR+8zMi3vveTceXct5j9fmJH+NNi0pCpuZB49ddA/T0qxn4+MUJUuiJBbbz/xnKzTBzrijodM65huyU/0yJcWJcsrLfNWhYGCgTcz3MRLFYgegnc07pMHnDMb/DKr/T8Olh10uCD/Kp3fJePw8mEgvpvN86ug0WSe/Xo=
X-CR-MTA-TID: 64aa7808
Received: from L9a49d08703e7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 10C0E935-5988-422C-A63D-96B4306F8A14.1;
	Mon, 03 Mar 2025 18:09:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L9a49d08703e7.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 03 Mar 2025 18:09:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hp5DuHVY8psUTRho1hyInHs3R0sXgPezwAAFyCWPTktmei8YbxaHo2UT7/5t7I+X8TihhoHGSEZxxUmGx57Ck8ls14O116IfJQs7ZSpuxnYYl+WfBIlebCOomW4thAJkXxktbt0522ABcJNwAxgcKLy2K3GIaMU5+bDMHwQn7Y5LM/mQBBXG/pP43Z3cliwk25/WByOvyCfb8+kRIWV9KTF8SmbeWlZ32m7XK6NJbl1GsW/MA5ZAo/QxaCl2Y8RC94+JmQ20ZkmLoxnjfPnmRRyB0GrYt+3kdI17r3l6xtZJZyDgCW1O5ptOQUT70oz3FvzPojkrcinxsPzyeK9hFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzbLBQpA5hdL0WKf40UpQZXh4sh1JEtnmKm1xlA+t58=;
 b=O8CKcRjcczVPl8J/kKuWePrkNHxYcDmyA6vTVTPleR57XLZnmtvZHLwHljux5Toc+2mCI7gsm4eyKaZkxjnA9rcvGxFjTs2SB3NfwrZShVimTAjxSwXUpAbfAlvjXpCHoPWgbINnN9xliG8Nz5VIOJKR0FJMt3N8+pckx2BDXWZVbX8qnRFDx4HZ7JomnSg7LWS1vwCjL/tS6TmIUpl8x8bLtbs2zWjzMaIg0Ti5LYyeeKS8jxb02GUuE5r/qcMO7jz4Usykf9SSJveR2elRSQxf4owIQOX8trqH57n7gLpwS/0s0M9m5X2KuB1O7BKqYwDnSd4PfGMBnZ8uXOLlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzbLBQpA5hdL0WKf40UpQZXh4sh1JEtnmKm1xlA+t58=;
 b=mKnnRyuWqnbUEZlZzcnhkhMvZCDJt4tJWBTF9IHaz+47Wv/AEz12eNDDQyX4Exnr06pteT8upBkvaThZ11n9hANdTRMbQjbgWzK6Ft7jVhPHPeSAaggeBABtcOUo4qtlK/b0AHeZZrjhDz7Wyey+I9QmXIyNSeGFWGCWFavkTPs=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AM8PR08MB5731.eurprd08.prod.outlook.com (2603:10a6:20b:1c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 18:09:39 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 18:09:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "michael.opdenacker@rootcommit.com" <michael.opdenacker@rootcommit.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Peter Marko
	<peter.marko@siemens.com>
Subject: Re: [OE-core] [PATCH] flac: upgrade 1.4.3 -> 1.5.0
Thread-Topic: [OE-core] [PATCH] flac: upgrade 1.4.3 -> 1.5.0
Thread-Index: AQHbiQMw1vwKWaqpWkql5c9wMMD4IrNhvMmA
Date: Mon, 3 Mar 2025 18:09:39 +0000
Message-ID: <11B25FEA-816E-4B3D-A7F4-EA47A5359446@arm.com>
References: <20250227103351.1990659-1-michael.opdenacker@rootcommit.com>
In-Reply-To: <20250227103351.1990659-1-michael.opdenacker@rootcommit.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AM8PR08MB5731:EE_|DU2PEPF00028CFC:EE_|PAWPR08MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e5f39b-9464-4623-49ee-08dd5a7e95da
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VHRCUDZJM2tvbmVPQXZsaXFvVWtWMDJ3TUg3TDRpZ2wyZzBobFlaWXd2czhX?=
 =?utf-8?B?S2Rmdkw1OTl5eSt3cmdnMDBDY0pFUXJZM3U0VUtydVliL3NMNVBacUg4SEVn?=
 =?utf-8?B?dW02ZkRWNFlkM3JKVzZqc1Z5Qmx3bHdGR0EyeVpGUk1Mc3RUWS96RHFXTzNL?=
 =?utf-8?B?dUlnT3VIeG9kcnI3cU9lWnA2MXhJQU5yem1ieHlSN1VXa1BrTzZsS280U1Br?=
 =?utf-8?B?N0RQa0YxR3NqbHN6NG5nNnRiR3JsbEZZaVNmNEcyOVZFaHJiVWZnR0xYK2th?=
 =?utf-8?B?SUR3Q2FqY09sbDhmNE5wUXE0KytSeVZGSkRlOHNqTFdWTVZaYTczVFZ2YkQw?=
 =?utf-8?B?N28vaVdBcHl1TWdhMzFpR3h3RWJHVytOeGJ6ZExwQ2ovTlN2cGsxdVZ0UTJD?=
 =?utf-8?B?VFdZN1FFOEQvckszek9JZG9KbEJFRlZTbmExSEcxL0F0WGx3Q2Ixem1BMjZr?=
 =?utf-8?B?ODNSTHZ5Nkp3SWlCNmZSZHhmRGRkSkp1bkQyYmx5cGl6SEdrMTdSWmZDajdu?=
 =?utf-8?B?RE01MGdDK0xlVlcyUlpQK0Fwd29xNzB0ajZpeEd5dElxSDNHNzIwOURIcEZq?=
 =?utf-8?B?bVp5S1ZLRTNIM1dyTWdOL3E0Z3VjbTlhWkhDanVrSko5N3pha0loNDU5aXVv?=
 =?utf-8?B?cGROUFJNYzFlRGc5QksyZW9YYm9LOFhPYkFqc09SMnI1OFZXMndBaEpweVJX?=
 =?utf-8?B?R1dYTDhOK3A5V3ROdW9qRnVnclk3UjRWak50elJZM0s2ZWpENkJBQXlDUHR3?=
 =?utf-8?B?Wk5pSjMrTFZUa1FzZWVDc1RRVnVsRURjbzgrMW9idFh2OUV4NzBLNFFleUU3?=
 =?utf-8?B?a3VWdmszNDd5WU1uYWw5VzNGVGxRYkhZQVNRa3Jrb0F6UUxaZ2xaYU9UU05W?=
 =?utf-8?B?ZUc1MURGOEFEZ2lnenQ1cTJzdFIzeWMwM3FjcHZyazJVZm02bmk4QzQ5V0N0?=
 =?utf-8?B?MGE0blZyaXNhTFFOcm1rL0tCNGVaSjU3TnVsZG1ERStwYkxFU0hqcW04bFB6?=
 =?utf-8?B?a0xJbmFmUVpkYWY1UmNOOGQ3UmFCWVIyR0JtckJWQkVaRTJJemhtc3R0ZlBu?=
 =?utf-8?B?ZEd0alV2SDB4ZUY2MCsrK3RxRGU1S2NwamFqWUpqZDlMV2dCNWp0VlV2T2pH?=
 =?utf-8?B?RSttTEpWbG01c0dCR2FsenNodXJzSUlZNVY3QTY5VUMwMHVmLzV0SkRoaUJv?=
 =?utf-8?B?aFdnMXZwVUxvT0hHSjhVM0VCRG93aGI1TGxLTFV4UXV1eExYZFdFZTQwMS9E?=
 =?utf-8?B?SThrVXFkL2JJdlYxcTBTTmFkSHkrQnk3STR2ME5IRzFIRjgwYkRnYzlxc0Z3?=
 =?utf-8?B?NFgxL2FoOVBoZ0VRMFVpbVdPNUlZNEY5eVhVcVdFMVE2ZVhIK2FHamtZVEVy?=
 =?utf-8?B?WUM1Rnd5ckovVnowQTZGa051RXkzalo1STBjdmRDT2VZcVcvbis3R2JtWENU?=
 =?utf-8?B?cSs1Q3VZaXdCbHMyRkhMd3l2VjN2Y1EycTkyTHE1MXh3T0Zyam5zT1Jpcmkr?=
 =?utf-8?B?alpyMjdwUjNiTkM2WkloNTBoM2VLdzZDR1k1QS84SVV1Wmdkd3pBYlNjTkNS?=
 =?utf-8?B?Qm91LzRQMnJidTd5TWhuOHdIWGFJTllxemFlMkFEMk14TitRdDBXSk5UU2xr?=
 =?utf-8?B?Z1BVd0ZPdW5HY2pkaEM1Zmorc1JQQkZHZnNTbGZzMFZMU3pIek43SjB5SVg2?=
 =?utf-8?B?SkxCN3ZUaEx2ZjdYUHY3UGVHSjhPN1lRV1hSNm1MTDVBZmdmM1NJU2ZPeGhE?=
 =?utf-8?B?LzM0ejFCU3hORlRiSWJ2NmNuUzNXbTA3eGROVnM3OWx6aUNvQURsNm5ORi9k?=
 =?utf-8?B?OXA3ZGJYb0Q4aGFvMHdnRC94UG9VY1NOUXFyWWdFZnNUOVd1ck9nMnRtLy9P?=
 =?utf-8?B?TVlIT1Y1ejZaWnJEeEVRbk1SRm5MMUZJY1VFdmp2TDFHVmc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F7A5D6200586640874E634BC2AF5B7C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5731
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d09bbf6e-838e-4ce4-825a-08dd5a7e90c9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|1800799024|35042699022|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WlprblVadnNsQitpS1RNMVB1WVdHVmwzNjVCai91YjhoSGdIbjBUQ21XaFdH?=
 =?utf-8?B?UzgrK3hyTmNvRjlKejUzekU3R0E1VTMvNkRHY0xteFl6V2FlUVF3U0R4ZDRR?=
 =?utf-8?B?TVNzc3l0bUlLVTJ3SkJQY2tMQ0RuWkloNlBaZlVSbEhzQTI1VXBHd3JiRUlp?=
 =?utf-8?B?WUZtVW1qZ0dyUDgvZWVKdmk5Tlg4TzBpaW9LbG05cnFXUGFWaEdpYTl6NW1O?=
 =?utf-8?B?L2ZOSG9hK2ZTN09QR2JSS1hvRm5XZjI0ekhzZVljSlgzVnR4SzkwejREdWtG?=
 =?utf-8?B?ZkJjM2s2aHpaNEcxcFlQVk91cHF3QXdVQ2tzcW1yaTNTTjVOaW93Z2lpQXFW?=
 =?utf-8?B?ek9sMHlMdU5TWHdBa0FKTTczcmo4ZjRNVzBaZzVpalovamhERjNEY0M0bFFa?=
 =?utf-8?B?SXRXREJSdEEwMlZDdVRCZmN4MUJ2TlIyN09tS1VzcmJCNUNlMUtMSllwSXY0?=
 =?utf-8?B?RWJKYWw4Y2NQSDdBbDNTWEhIUVp4L00wdFhZZ0FGZjVXbjB0aTlCWk9WVlVx?=
 =?utf-8?B?RW4vZmh0VmtreUJPTW9oY2NDU3JsOG1wOXZqK2RpZCt6SVBQS2VsTnM0ZCtN?=
 =?utf-8?B?K0IxOEZGVUtRQ3FUcWRUanY5bGN3K1lSUUxhck5ETS85cHVyelZIVnV4ME5H?=
 =?utf-8?B?SFpRbVk0SGl4Um9hMWZzeVduZm1LUlNpM3Z5bzhCZ0E5aWh6R3ZNYmpUTGto?=
 =?utf-8?B?SkEyRDRlYW9wTUhyUDZMWUs2ZFBUUDlpSU83NFluSXFLRkE1ZDlnMk1rcFN1?=
 =?utf-8?B?TGUvOCtDSTlwSlcvYTJZUERuNWZ1S2RMeThVWEtZbVBwN3pLMG50Z3RNRm5u?=
 =?utf-8?B?ZGxGWnZ2RXRwOExCODJSRDV0dVJVQUtWbHhjR3plY2huY2R4T2pGbENGTy9M?=
 =?utf-8?B?VXh6K2VLOXBxTDE5NXJGZUp0bFVaUG5nYk5KV3JmdjFSYXY2VzN1UFhDRTkz?=
 =?utf-8?B?dVIxaEJMU0N5S1REdDFnbVkzMHVILzdBMU1zY2NsYjV2WUJwZFpCRzRudHZz?=
 =?utf-8?B?SjhINkZzWHpCWUtKbTF0WFJ2L3JIVUEweXYxS0tiR0RqeGRxckZka1ZxWVNp?=
 =?utf-8?B?RC9BZ09YL1BDU0VhdStKck92R25UN3ZMaWRrMlMwQWFDRFNGMFlWL0h1L0FF?=
 =?utf-8?B?S0Z6VkliTzRRNjJIMGxqaCtjMnVQMXJ6MFgzTFlQdjBoT1VFZjBrekxHNy9I?=
 =?utf-8?B?UmFUVlRqNkxlSGtaNnNMUU9kQTVUeTdudkdLQmZka0ZwR3VXT3NuVStjRFpO?=
 =?utf-8?B?dExya2h4YjdtNysrMVc4M1FtY0V4dmJOeThJVjR3WDNXNmorL29YWDFMb1p6?=
 =?utf-8?B?d3dVNlZtd3hHMFFMcGlIa2VaRXM3bVl3aHF0ZTJqcGo2STdMMGtVV0RwU3E1?=
 =?utf-8?B?ZnJudHBwYXpVbzMwaUFPMThFQnVlSzY2ZXNuMkZNWjBtbWJ2VkN5N1htV0k0?=
 =?utf-8?B?am43ZVZUdmZGUHNkQTJ6K05zbllLZHBROTJaZFMwL2hhMnNSQXpoaWRvTS9Q?=
 =?utf-8?B?UFJ2Tmtha2JXdnQ0U1AyT3EyWmIxOUMyR21ncTlQMDhwSjFZb05BUkRNMFkr?=
 =?utf-8?B?cGJWenZNRzNQZ3VmWmNJekJDR2padG1uQUw0UXRmMmlSRDNiSW5qeHVtTUxx?=
 =?utf-8?B?ZjJBZ2RHSXB4MXlEQ1pPdXdLSlFuQXduZ1JUTklkMHNDanNnUGpTZ0pIR2V0?=
 =?utf-8?B?YjEzaHhacU1xSUdyZHpET1NYaGcrbUlnRW5DaEY2ZzJUN3NFdEhsL3cyd1Jt?=
 =?utf-8?B?Nnp3NGh2WUh2VmN3N2NKZU8xV0EyZlV6N3pOa0VUR1FWR3JpSElYWXVBTnVG?=
 =?utf-8?B?MVRObWRHYmExRDAwZHljOFJyY0VlQUpFMDdTRnprRlNvZnhnYXowODM0UU9l?=
 =?utf-8?B?NXBqR2hEYUYxQXNzM3dPQzg4azlZT05OakNRNTRZQk4veXRBaFRUYXhrK3lS?=
 =?utf-8?Q?71lDe6H7Li0=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(1800799024)(35042699022)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 18:09:48.2968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e5f39b-9464-4623-49ee-08dd5a7e95da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 18:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212224

T24gMjcgRmViIDIwMjUsIGF0IDEwOjM0LCBNaWNoYWVsIE9wZGVuYWNrZXIgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPG1pY2hhZWwub3BkZW5hY2tlcj1yb290Y29tbWl0LmNvbUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEZyb206IE1pY2hhZWwgT3BkZW5hY2tlciA8
bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29tPg0KPiANCj4gTGljZW5zZS1VcGRhdGU6
IEdGREwgMS4yIC0+IDEuMywgY29weXJpZ2h0IHllYXJzIHVwZGF0ZQ0KPiANCj4gUmVtb3ZlIHRo
ZSBkb19pbnN0YWxsIGFkZGl0aW9uYWwgY29kZSBmaXhpbmcgYWJzb2x1dGUgcGF0aHMNCj4gaW4g
ZG9jIGZpbGVzLiBTdWNoIGZpbGVzIGFyZSBubyBsb25nZXIgY3JlYXRlZCBvbiAxLjUuMC4NCg0K
SSBhc2tlZCBteXNlbGYgd2h5IHRoZXNlIGZpbGVzIGFyZSBubyBsb25nZXIgY3JlYXRlZCwgYW5k
IGx1Y2tpbHkgdGhlIGF1dG9idWlsZGVyIGhhZCBhbHJlYWR5IGRvbmUgdGhlIGJ1aWxkIGFuZCBj
b21wYXJpc29uIGZvciBtZToNCg0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wb2t5LWJ1
aWxkaGlzdG9yeS9kaWZmL3BhY2thZ2VzL2NvcnRleGExNXQyaGYtbmVvbi1wb2t5LWxpbnV4LWdu
dWVhYmkvZmxhYy9mbGFjLWRvYy9sYXRlc3Q/aD1wb2t5L21hc3Rlci1uZXh0L3FlbXVhcm0tYWx0
JmlkPTZjODkwNGJjZWFhMTk4N2VkZmZjMTY4MjNjMTJiNDNlODYzODRkZWENCg0KLVBLR1NJWkUg
PSA1MzYyNDE1DQorUEtHU0laRSA9IDg3NTM4DQoNClRoZSBmaWxlcyBhcmUgbm8gbG9uZ2VyIGNy
ZWF0ZWQgYmVjYXVzZSBub25lIG9mIHRoZSBkb2N1bWVudGF0aW9uIGlzIGluc3RhbGxlZCBhbnlt
b3JlLg0KDQpUaGlzIHR1cm5zIG91dCB0byBiZSBhIGJ1ZyBpbiB0aGUgY29uZmlndXJlLmFjIHNj
cmlwdDoNCg0KaHR0cHM6Ly9saXN0cy54aXBoLm9yZy9waXBlcm1haWwvZmxhYy1kZXYvMjAyNS1G
ZWJydWFyeS8wMDY2OTguaHRtbA0KDQpTbyBJIHN1Z2dlc3Qgd2UgYXBwbHkgdGhhdCBmaXggYW5k
IGNvbnRpbnVlIGluc3RhbGxpbmcgdGhlIGRvY3VtZW50YXRpb24uDQoNCkFsc28sIHdoaWxzdCB3
ZeKAmXJlIGhlcmXigKYNCg0KPiAgICAgICAgICAgICAgICBhY19jdl9wcm9nX05BU009IuKAnSBc
DQoNClRoZSBuYXNtIGNvZGUgd2FzIHJlbW92ZWQgaW4gMS40LjIsIHNvIHlvdSBjYW4gZGVsZXRl
IHRoaXMgbGluZS4NCg0KUm9zcw0KDQo=

