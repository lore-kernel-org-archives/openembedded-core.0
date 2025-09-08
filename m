Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAECCA1013
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 10:18:23 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.47])
 by mx.groups.io with SMTP id smtpd.web11.9698.1757326694329063246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 03:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XzcCn53N;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XzcCn53N;
 spf=pass (domain: arm.com, ip: 52.101.72.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VPZNYi3WSLrUM7hzcCBQBNM44lPoPJ/V/dzFQhdQp4ywnzSTyxdhXbGKrJgrHAg8WDfFESmWUFQ9m8v+JdN/bbycToRe4kb3ISMp3WolRs1cmgHLWzMbwKxfVFmXFE4tjtz0vLpWL9M6nOwkiReZ5e/F87SFR7H+l3R2/SX/0UGmWeY3Z/RBYeIpiSPr09e6LPcBhyuckyoCTpsuAY5DyzikBJw2liSxa1a5d5pIk/FRz3vKX1gCsgUyWSse8DnTJxKKDanBQZG8JzUZ7dkj4R531kSjrx3LLQtylOQ1YV5vu+cnz8AxgoGEg07IrPpvTH86/pTgwMY9+Rf8yO5YWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3wDOJBlIRtmNSUmOA+XXexVussMsWdH2QJUNswI4so=;
 b=u6oCbcpU0AKx74Oxz7r4pxX2/O9panX6/ZNPrlUTEcBSGfWNGT+bDCIwWwgSjyUUEcaYCzJp21NOHXLNR/ajqqr2WCP4m8o6KGpOvhpKPvsJDfRSIFjtE4CItt4px7HfvvOWtkV6r1MYF/TFtdiExzvK1KtGoj3dqX0orc/L2GSaH61UbgzlgSV+PLbesxeD2CttT01zMuCt50q/R7sDRdtjOHIN/cdXQb9ACenLkeL2F4A9ncwIGCwX8Q12aaPv5crzDWI4gGeRIW7INEVr/AegIvFMP7WtX941O82LEHSJNGmODC/RVq/hDMnRdaH2KQVUdQTc2+Qfy/wNb3Lqpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3wDOJBlIRtmNSUmOA+XXexVussMsWdH2QJUNswI4so=;
 b=XzcCn53NvPd/B0ynjEdY6Xe6FPtU4xgeGLN/NnKpxiIa+mZE3Q7qFi8ge8iE6KG10TviIgGxnWhFyj5wjWSKx5dkCbqBDnxJqErNJQfQaqqZLs1/Fxz2tNA68uII33M4VyRepZUFAXcv0CsG5YR5g3k2cR5VN3mt+TVnTn8ErFg=
Received: from AM9P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::25)
 by DB4PR08MB9261.eurprd08.prod.outlook.com (2603:10a6:10:3fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 10:18:09 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::3a) by AM9P195CA0020.outlook.office365.com
 (2603:10a6:20b:21f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 10:18:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 8 Sep 2025 10:18:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmliV7e6bgBemBybwabkv3Q4/JvRqxAsiB7e2j6Zf3XBkI6xjDqwYQQRv0oeWDFJkca+xkvFOJ5c2GCh78ljoWG2OQJ3fsozyNmegIEoOz2r1YOdw/tk7PcajaxN6IXKTbh57OZqxK0pBHOOtILkH5jSqqQBenmrb3I1VAYZgsgBXwsNFlEBFv8DRaUnd+zqTC81L52jiVbGiyLVuyPJ+DNsKsR6hy6Dgv99iWEMvf6q/E+68FEi/JrFXYfC3luTT6W5LPD9bOo4lMEzrcUyn1S8NLTeeqchnyRKmeO7j+rxYwYDygq095g0ISwxn5OE1SuhfsKCbzTdOAEIvv39nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3wDOJBlIRtmNSUmOA+XXexVussMsWdH2QJUNswI4so=;
 b=Z7xvvpojAUNpXZPFwFAYlslcPOjSC6qpLooV3u2wCPa9z6+FBLfOBgrZnBILsXc+1/UbjhP4ZUkV65VC69e6JEMMPKhxiD6/vnZqZKdMYzo2st8KhDYNQRC/r5/RqVot/V4q9qaWZrdMHo1JgaUMkepvZbzRq06WJoNgqsfz5gTBuxNcI3pIymqPH/ftmGh7RTEzb1buSosDwOz8wbEXN/qQa8EAtNcgkVuEHkubulXWnOdoX3ldNNZoqCJ62UEFZo8nzqG1n+KMsUOythoBwHtl7jK3s8tDaUMvNhmoEBQYaN0awvwiHdH4UsGQh0tel9iAjYKanWdSNNgxltX6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3wDOJBlIRtmNSUmOA+XXexVussMsWdH2QJUNswI4so=;
 b=XzcCn53NvPd/B0ynjEdY6Xe6FPtU4xgeGLN/NnKpxiIa+mZE3Q7qFi8ge8iE6KG10TviIgGxnWhFyj5wjWSKx5dkCbqBDnxJqErNJQfQaqqZLs1/Fxz2tNA68uII33M4VyRepZUFAXcv0CsG5YR5g3k2cR5VN3mt+TVnTn8ErFg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB10276.eurprd08.prod.outlook.com (2603:10a6:800:1bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 10:17:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 10:17:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.tatrai.ext@siemens.com" <peter.tatrai.ext@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] connman: avoid hiding implementation-reserved
 symbols in version scripts
Thread-Topic: [OE-core] [PATCH] connman: avoid hiding implementation-reserved
 symbols in version scripts
Thread-Index: AQHcH+SttqA9OfZDtkiK3DbmayQLQrSJE8AA
Date: Mon, 8 Sep 2025 10:17:34 +0000
Message-ID: <86F37DAC-11A2-4BFF-844A-883946CA2D65@arm.com>
References: <20250907104528.2828-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <20250907104528.2828-1-peter.tatrai.ext@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB10276:EE_|AM3PEPF0000A796:EE_|DB4PR08MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af9a513-2aeb-4fb1-2be9-08ddeec1021b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|13003099007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YTI0a0RRRHRjd2lzZVJYVUhiQkZsNCtOZnJGSzZNL0tBTnR6L01UVlZ0MVpB?=
 =?utf-8?B?dUN4UmN2U3hnRUtKazVHenQ4M0V2NGQyVkxQaC80WDdUMzk4L3BXblM0ZFRE?=
 =?utf-8?B?VnllTnZnWUNaL2RudDE4TVgxZnNBQWJrNHJmUHIxS1F1V3ZwMXJPelVJMDVS?=
 =?utf-8?B?ZTZ0ZkpNS0RXbC9TRHNEMGt3alppeDV1dG1PVlFxVnltc0E0b21sL3ZUMy9o?=
 =?utf-8?B?enMvVE4rUEhjWUZ6T1JpcG9xRnVrSkN4dEYxakRNcU1FSkw5WVdNTFZuYjVp?=
 =?utf-8?B?UE55ZnkvazNkZ0YyRS9NTmtqYlFkeWo4TlBwTE14TFBoa2thREU1MVNCS0tk?=
 =?utf-8?B?L3ZSVFJCc0VNSDNvcTYvYU4yQnY1KzhKbVlYK0ZWRUUvM0NSeHZRVExqYTJ5?=
 =?utf-8?B?dHdwVk1yU0xSWXREOFdmdmlMOUlHTytWQkJMY0wvWDZrd1Y3Sm1xd2VTcHlS?=
 =?utf-8?B?YUFkTU40TlZTalZ5VWZPdkVKcXdaV0lZMnZjMnpqNm1ya0EyazRuVkJQeno1?=
 =?utf-8?B?L3dOWTFyQ0FwSHpVL0xFbWZjd05SRlNMNGYzZWJhaU96Ni9oMDVhVXNnbzVY?=
 =?utf-8?B?ZHA0UlpSTXhWRVYxYStxOTV6WHNPd0U3YWJpRU9jancwZEhrSGVCNnN4ak5h?=
 =?utf-8?B?WFZuMTAwUklzSW9DM0lGTlQyNzR5R2tQOXVXK2RQZ2RMdzRMUFdad0JPL3lx?=
 =?utf-8?B?L0tDVktaTHdacGdYZmh6RjRRLzBnaXliaFlNaXltREhscEZPVmRrcXh6Y3ls?=
 =?utf-8?B?dHY5MTRPb1JuZEZuTjBzSTM3WUw3bHdGSEpkcURVcGlBOEltSDcrdmVjTGw2?=
 =?utf-8?B?anBTbEFMT0JhNU1KSG5EOXBFSHgyclJoTU9nTXFKQkFnQUdJMzBFZVBzeDdq?=
 =?utf-8?B?T0ZlYVB4YlBPSk9JMU5IRTZXMXF2NTlsWThHYkk2OUNYNnVpZmljdkZUSkNP?=
 =?utf-8?B?TmhOUkROUEVMbUVQRU5jOWw0QXNTM2ZjSHZwZmpQcHBJSllJWllMa0haWGky?=
 =?utf-8?B?dVhpRU1ncjNmcC9QRGZoM3l4bFR0ck50cnBpWStmRmMyYTNBVGdWQ0piL3lh?=
 =?utf-8?B?a05WOE1BU2t0bTBGSThINGNzZXF4K2huRUNEM0Z1RjQzNGJsREphaDIvbHFv?=
 =?utf-8?B?T0p1eitYR1FTK2ZFQ09RL3JJbVhLakI4YWI5UXRUYWZRaDNPbHBwN2lqMDYy?=
 =?utf-8?B?WFR4dklhNkEzRjRkWGtGZ1FLcE1uMGJyVzg2ZFRvcU9XdXpFZEsveFYra2U5?=
 =?utf-8?B?KzRFV2RFM1JZemdXWWNkLzRaZXNpUG1hRDdRQTg3dEdjOEc3TkFHM3J0czRl?=
 =?utf-8?B?MWZyYkthYmVLcEpoenZwV1l5Y0dwU3BLcFRHSEp6bWZMSTRCQkZ0clBmaHdy?=
 =?utf-8?B?cDloQ2NTN1VoY1NDNlREMDZKaDN3RFFHV0l3WUpPclJRU2svVDBmYnl1eFZT?=
 =?utf-8?B?T0JidDJMcmNyU1l3TkNvK1hjZHU5dW5xWldLSi9wQ1liNWthQ3EydVJJR2Q2?=
 =?utf-8?B?OCtHaFhrRGtjR1RzWi9qSVAxNWV5U3NucEdLU1ZKOE95YjRVdUlJRnRsMTZ2?=
 =?utf-8?B?UHFSOE5MOFlnM0NJT1FoeWlwMUs1eU1DdlQxQWZOV20vRWYxMVROVjdPZ3Bh?=
 =?utf-8?B?ZW10NkpacFhLZGViaW9FdGZORGQwUDQvTmR4eVZFNmY2SFVtamNUMmZNaUs5?=
 =?utf-8?B?YWJCOUw2Vk5uYWl6WEh3VzZzOVF0Uk5qRjVFN05kQk00a2pER0pUSDRMSUVk?=
 =?utf-8?B?VGhoRDNSYjFkSWxUZ0dtKzRIdjN1clU0ZzNjRGNrc29EY1dMeVdKQlF4alRy?=
 =?utf-8?B?U2lZZlJheHc0dlBkeW1qeGRHWXVuQmtIUzYvTEdtV25KQTFBakhuM0ZyZnVJ?=
 =?utf-8?B?Zm8xVDFxQ2pJejVtelY2WW1weXI5VXRuVWQ1ZEFIZ2x3UWY4WW5YaHE2RVhZ?=
 =?utf-8?Q?OAhdaNQChR3qfJuSMGijEpkZCpw3tMse?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <34259208DBB1DE48A48512C06894425F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10276
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9dfdb8eb-907e-4cbd-8c2c-08ddeec0edf4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|376014|35042699022|4022899009|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UE9Ea3I5K2llckpjZDlSWlI5dXNjWmNYb2M3M3Q4NDJkMFh2aFpzdFh0cDZn?=
 =?utf-8?B?OU0xKzlMNGxUaGwxQXpieDBvZ0t0OXM4dVhJRWxCTXFkR3dOSjhyZ2dUSmhE?=
 =?utf-8?B?VS9XNTZQeEJ4T1VNaGhmRm5JeDBVZWNBbHFvbG9MTkN2WVpzWFFQeHdrb2NL?=
 =?utf-8?B?a3V6STNSRVY3NmxpdGxyVXJSOUl2eWFMSnBXR2puUSt2RTBWRkFHNkV4WCtx?=
 =?utf-8?B?ZXl2M2lubWVEaFBjTXN6RkhBc2x5aEQ3NTVqN09pVWYyK1B3SUtZM2ZhVXh6?=
 =?utf-8?B?bUUzdlhENU9kaXFqZ3o0N0pQTEhrRk9EQjM2TDZybW9oSGViZUVCT2YvZXBH?=
 =?utf-8?B?bXlmdElFQk9MaGdBZ1ZnWXA4SHlLM2pXbDV1NkdscDZlci9zMGxsUjFITGts?=
 =?utf-8?B?enduVFJyM004NU5hU2dCbkN1bXJ4MFBpU1piQTJHbTBuazd6R2dUcDFEU0Q2?=
 =?utf-8?B?YlhWYkpIRlo5SVRPenc1TE01NnQ5Tk11TjVPTWpiZ25GMC9mT2pRbTZqNlR4?=
 =?utf-8?B?TEdZWHJ0Y2luRVExL2RiZ1NycFpXWEZJYWYvZlJheCtscmtwUmhKWmFQczBx?=
 =?utf-8?B?UHd3d2lmVDNKNlV6QUFEcllHVkNmc2o1dFhEcjBlaWZuY0VqOFZkMDdwMUVR?=
 =?utf-8?B?UlVZQkVjYU02ZVVMZDBKWHJvcXNZWnQweHZhOGhCamNyNWIxZkZrVEdGUFNa?=
 =?utf-8?B?VGZBdXB2dDJ6MVRnV1gxM21FeU1UeFNCcHR2c1JMQ1VvWmlldlNxbGdLaVg3?=
 =?utf-8?B?YW5GV0JaY1FVUE5LS1hVQ253SzM3UHU2aTZ3RDFhVTlvQklMR0hhWlpSRVhM?=
 =?utf-8?B?amxDRDR6a0xMa0pyanQ3djVrT25oQmtUSVNoYXBjU1EvM1dXSytjTld1dkxz?=
 =?utf-8?B?TzBmaU1uZWpEMFYraXoySVg2OGVkUHdYdG9BM2xrUTE5TTk4UUdyQ3VoSFhJ?=
 =?utf-8?B?bEEwcytjMDh2NGZuL3FMUjdBZkpiZkRSSjNhOXZFOEpvVmttQUpLSWt1YmZY?=
 =?utf-8?B?THFjTGFRZnRFbGdxVUVEUkwzYU8wcmVlUjVnNWszQVNmK2RkcnpDY3VlYUxh?=
 =?utf-8?B?UXAwZGNmMEd2cDdYc0hiWTNDRXpweG5NTHBUUDNiZmV5VGNib25PRWlQNXB5?=
 =?utf-8?B?bzJCTHIxOWtnQVJmYlV4YVBMRS9KRFJHa09oT2VxbnNnZzVqVW83M1YzUkN6?=
 =?utf-8?B?ci9SZzFHRGlkbmRjLzREbGcwZ1RSa2M2ZThONE12R2lZWUUraXVkY3VlTm9W?=
 =?utf-8?B?aGM2clRuUGVVYWsxVWU0K3BvZGpWa2U4YXk3QzhEMlYwN0pHUU0xNDVHN0c0?=
 =?utf-8?B?Szh5NHFIUnhRd3orSzFEM0p5RFBaR25aaUtlaWk0UFREYm1WRVdRcHgwTzdX?=
 =?utf-8?B?VzlVYjV6bGRXcUlJMjM4M0I0OWZyYTNzZUtpQ3JMaWZUbklScTRaWlNxWW9l?=
 =?utf-8?B?M014bzV6TWZCeUpFdUFzbm1LNVNNWjAvdmMzaFQzbmUydS9uZU1rdG1pY2N2?=
 =?utf-8?B?S1BYa0ZrdTRYcjNQdzlkMDV5MERIZWpyd3RydGx0MkZVd3BLcEVuN0pROUNs?=
 =?utf-8?B?d2NVak1RVEJWd1lSTlJYOUp4VmJCL3c2UlROdXlNNzExZ2R6TU14SE43d2oz?=
 =?utf-8?B?ejg3ZEpJU2Z1OVl6WWZMTUw0K2hVMGpBeXg0U0VYS1ZwZjhIQnR5YWNCcS90?=
 =?utf-8?B?bzE2Q2I3akowcHZxc2c0SlZIVDFUdG5QakxWN0ZacHV2YnNrcE5MVzhlaTRS?=
 =?utf-8?B?L0F3Z0xhOFc1eE50bWlSTDNvdzdRS25MMDYwdHVwQTY0TW1HM0tIRnhMcmdp?=
 =?utf-8?B?TTZ0RlFiWTZIa1g4V04xWHltRU1UcGZjcHNDN0tzb09VWkMzUGxZZUJUZEs4?=
 =?utf-8?B?Y3pvNU5JeERPK0MvYzA2RHlrWENxbXh6VHhmTjVwczAzWjRzQk9OcnlPYzZr?=
 =?utf-8?B?NElZVzRrWWVyTWdsRUVSUTljSy9OVFF2K2U3TzBHRTMxUiswbUV5aDZiRDRW?=
 =?utf-8?B?RnUxZ3dJMDVBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(35042699022)(4022899009)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 10:18:08.7463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af9a513-2aeb-4fb1-2be9-08ddeec1021b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9261
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 10:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223063

VGhhbmtzIFBldGVyLCB0aGF04oCZcyBtdWNoIGFwcHJlY2lhdGVkLiBIb3BlZnVsbHkgaXQgd29u
4oCZdCBoYW5nIGFyb3VuZCBmb3IgYW5vdGhlciBuaW5lIHllYXJzLi4uDQoNCj4gT24gNyBTZXAg
MjAyNSwgYXQgMTE6NDUsIFRhdHJhaSwgUGV0ZXIgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
PHBldGVyLnRhdHJhaS5leHQ9c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiBGcm9tOiBQZXRlciBUYXRyYWkgPHBldGVyLnRhdHJhaS5leHRAc2llbWVucy5j
b20+DQo+IA0KPiBUaGlzIGNvbW1pdCBhZGRzIGEgcGF0Y2ggdG8gQ29ubk1hbiB0aGF0IG1vZGlm
aWVzIHRoZSB2ZXJzaW9uIHNjcmlwdHMNCj4gKHNyYy9jb25ubWFuLnZlciBhbmQgdnBuL3Zwbi52
ZXIpIHRvIGF2b2lkIGhpZGluZyBpbXBsZW1lbnRhdGlvbi1yZXNlcnZlZA0KPiBzeW1ib2xzIChz
dWNoIGFzIF9JT19zdGRpbl91c2VkKS4gUHJldmlvdXNseSwgdXNpbmcgJ2xvY2FsOiAqOycgaW4g
dGhlDQo+IHZlcnNpb24gc2NyaXB0IGNhdXNlZCBnbGliYydzIGxpYmlvIHRvIG1pc2RldGVjdCB0
aGUgbGliYyB2ZXJzaW9uLA0KPiByZXN1bHRpbmcgaW4gYSBjcmFzaCB3aGVuIHByaW50aW5nIHRv
IHN0ZG91dCAoZS5nLiwgcnVubmluZyAnY29ubm1hbmQNCj4gLS1oZWxwJykgb24gUG93ZXJQQy4N
Cj4gDQo+IFRoZSBuZXcgcGF0Y2ggY2hhbmdlcyAnbG9jYWw6ICo7JyB0byAnbG9jYWw6IFshX10q
OycsIGZvbGxvd2luZyB0aGUNCj4gcmVjb21tZW5kYXRpb24gaW4gZ2xpYmMgYnVnIDE3OTA4DQo+
IChodHRwczovL3NvdXJjZXdhcmUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xNzkwOCku
IFRoaXMgZW5zdXJlcw0KPiB0aGF0IHN5bWJvbHMgc3RhcnRpbmcgd2l0aCBhbiB1bmRlcnNjb3Jl
IGFyZSBub3QgaGlkZGVuLCBhbGxvd2luZyBsaWJpbw0KPiB0byBjb3JyZWN0bHkgZGV0ZWN0IHRo
ZSBsaWJjIHZlcnNpb24gYW5kIHByZXZlbnRpbmcgdGhlIGNyYXNoLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgVGF0cmFpIDxwZXRlci50YXRyYWkuZXh0QHNpZW1lbnMuY29tPg0KPiAtLS0N
Cj4gLi4uZC1oaWRpbmctaW1wbGVtZW50YXRpb24tcmVzZXJ2ZWQtc3ltLnBhdGNoIHwgNTAgKysr
KysrKysrKysrKysrKysrKw0KPiAuLi4vY29ubm1hbi9jb25ubWFuXzEuNDUuYmIgICAgICAgICAg
ICAgICAgICAgfCAgMSArDQo+IDIgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQ0KPiBj
cmVhdGUgbW9kZSAxMDA3NTUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5t
YW4vMDAwMS1jb25ubWFuLXZwbi1hdm9pZC1oaWRpbmctaW1wbGVtZW50YXRpb24tcmVzZXJ2ZWQt
c3ltLnBhdGNoDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9j
b25ubWFuL2Nvbm5tYW4vMDAwMS1jb25ubWFuLXZwbi1hdm9pZC1oaWRpbmctaW1wbGVtZW50YXRp
b24tcmVzZXJ2ZWQtc3ltLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFu
L2Nvbm5tYW4vMDAwMS1jb25ubWFuLXZwbi1hdm9pZC1oaWRpbmctaW1wbGVtZW50YXRpb24tcmVz
ZXJ2ZWQtc3ltLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNzU1DQo+IGluZGV4IDAwMDAwMDAw
MDAuLjVhNGQ5YjcyYTUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbi8wMDAxLWNvbm5tYW4tdnBuLWF2b2lkLWhpZGluZy1p
bXBsZW1lbnRhdGlvbi1yZXNlcnZlZC1zeW0ucGF0Y2gNCj4gQEAgLTAsMCArMSw1MCBAQA0KPiAr
RnJvbSBlYWM0ODljODcyYzc3NWM4OGJiZDg1YjRjZWM2YzFkNDdhZDllNmE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KPiArRnJvbTogUGV0ZXIgVGF0cmFpIDxwZXRlci50YXRyYWkuZXh0QHNp
ZW1lbnMuY29tPg0KPiArRGF0ZTogU3VuLCA3IFNlcCAyMDI1IDA5OjI1OjIwICswMjAwDQo+ICtT
dWJqZWN0OiBbUEFUQ0hdIGNvbm5tYW4sIHZwbjogYXZvaWQgaGlkaW5nIGltcGxlbWVudGF0aW9u
LXJlc2VydmVkIHN5bWJvbHMNCj4gKw0KPiArV2hlbiB1c2luZyAnbG9jYWw6ICo7JyBpbiB0aGUg
dmVyc2lvbiBzY3JpcHQsIGFsbCBzeW1ib2xzLCBpbmNsdWRpbmcgdGhvc2UNCj4gK3Jlc2VydmVk
IGZvciB0aGUgaW1wbGVtZW50YXRpb24gKHN1Y2ggYXMgX0lPX3N0ZGluX3VzZWQpLCBhcmUgaGlk
ZGVuLiBUaGlzDQo+ICtjYXVzZXMgZ2xpYmMncyBsaWJpbyB0byBtaXNkZXRlY3QgdGhlIGxpYmMg
dmVyc2lvbiwgbGVhZGluZyB0byBhIGNyYXNoIHdoZW4NCj4gK2dsaWJjIHByaW50cyB0byBzdGRv
dXQgKGUuZy4sIHdpdGggY29ubm1hbmQgLS1oZWxwKSBvbiBQb3dlclBDLg0KPiArDQo+ICtDaGFu
Z2UgJ2xvY2FsOiAqOycgdG8gJ2xvY2FsOiBbIV9dKjsnIHRvIGF2b2lkIGhpZGluZyBzeW1ib2xz
IHN0YXJ0aW5nIHdpdGggYW4NCj4gK3VuZGVyc2NvcmUsIGFzIHJlY29tbWVuZGVkIGluIGdsaWJj
IGJ1ZyAxNzkwOA0KPiArKGh0dHBzOi8vc291cmNld2FyZS5vcmcvYnVnemlsbGEvc2hvd19idWcu
Y2dpP2lkPTE3OTA4KS4gVGhpcyBlbnN1cmVzIGxpYmlvIGNhbg0KPiArY29ycmVjdGx5IGRldGVj
dCB0aGUgbGliYyB2ZXJzaW9uIGFuZCBwcmV2ZW50cyB0aGUgY3Jhc2guDQo+ICsNCj4gK1JlZmVy
ZW5jZTogaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTc5
MDgNCj4gKw0KPiArVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2Nvbm5tYW5AbGlzdHMubGlu
dXguZGV2XQ0KPiArDQo+ICtTaWduZWQtb2ZmLWJ5OiBQZXRlciBUYXRyYWkgPHBldGVyLnRhdHJh
aS5leHRAc2llbWVucy5jb20+DQo+ICstLS0NCj4gKyBzcmMvY29ubm1hbi52ZXIgfCAyICstDQo+
ICsgdnBuL3Zwbi52ZXIgICAgIHwgMiArLQ0KPiArIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiArDQo+ICtkaWZmIC0tZ2l0IGEvc3JjL2Nvbm5tYW4u
dmVyIGIvc3JjL2Nvbm5tYW4udmVyDQo+ICtpbmRleCAwM2EwZWVjLi5iNzVlOTBkIDEwMDY0NA0K
PiArLS0tIGEvc3JjL2Nvbm5tYW4udmVyDQo+ICsrKysgYi9zcmMvY29ubm1hbi52ZXINCj4gK0BA
IC0zLDUgKzMsNSBAQA0KPiArIGNvbm5tYW5fKjsNCj4gKyBnX2RidXNfKjsNCj4gKyBsb2NhbDoN
Cj4gKy0gKjsNCj4gKysgWyFfXSo7DQo+ICsgfTsNCj4gK2RpZmYgLS1naXQgYS92cG4vdnBuLnZl
ciBiL3Zwbi92cG4udmVyDQo+ICtpbmRleCBiODg3NzA2Li41Y2FkMzQ0IDEwMDY0NA0KPiArLS0t
IGEvdnBuL3Zwbi52ZXINCj4gKysrKyBiL3Zwbi92cG4udmVyDQo+ICtAQCAtNCw1ICs0LDUgQEAN
Cj4gKyB2cG5fKjsNCj4gKyBnX2RidXNfKjsNCj4gKyBsb2NhbDoNCj4gKy0gKjsNCj4gKysgWyFf
XSo7DQo+ICsgfTsNCj4gKy0tIA0KPiArMi40Ny4yDQo+ICsNCj4gZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFuXzEuNDUuYmIgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbl8xLjQ1LmJiDQo+IGluZGV4IGNmYzYxMTQ3
MTIuLjJiZGQ1NDdiYTYgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
Y29ubm1hbi9jb25ubWFuXzEuNDUuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9jb25ubWFuL2Nvbm5tYW5fMS40NS5iYg0KPiBAQCAtMjAsNiArMjAsNyBAQCBERVBFTkRTICA9
ICJkYnVzIGdsaWItMi4wIg0KPiANCj4gU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xp
bnV4L25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiBcDQo+ICAgICAgICAgICAgZmlsZTovL2Nv
bm5tYW4gXA0KPiArICAgICAgICAgICBmaWxlOi8vMDAwMS1jb25ubWFuLXZwbi1hdm9pZC1oaWRp
bmctaW1wbGVtZW50YXRpb24tcmVzZXJ2ZWQtc3ltLnBhdGNoIFwNCj4gICAgICAgICAgICBmaWxl
Oi8vMDAwMi1yZXNvbHZlLW11c2wtZG9lcy1ub3QtaW1wbGVtZW50LXJlc19uaW5pdC5wYXRjaCBc
DQo+ICAgICAgICAgICAgIg0KPiANCj4gLS0gDQo+IDIuNDcuMg0KPiANCj4gDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0
byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIyMzA0Nyk6IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjIzMDQ3DQo+
IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExNTEx
MTUyOC82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0N
Cj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

