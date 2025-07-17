Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C784AC83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 12:15:04 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.42])
 by mx.groups.io with SMTP id smtpd.web10.47066.1752754495008935487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 05:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=owAu7bPJ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=owAu7bPJ;
 spf=pass (domain: arm.com, ip: 40.107.130.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KWfT8Kt0Q6hNSUJKUZEKYYF2FYWVBOSBR2bpT8bZcHqVbYgZJ/tmB6V56woyx3+PYFfj5z/TVYx0aLVbkBp8jwm6zEhI5lVi/4lixYhzs1q6oOZXRYVMX1KfHfTzc0LudiSgSuqXSbrK8G/nDjYQOv4x+8Lz1m2pGLG5hvU69Ziilc/eaJuQNWqgbR5ZOJ5vYEpoTF0Z1xwFtP7MbSb8NKi4J1gDTJhG3R8PGjTEZv2PeC42NJsTA38gUQnsUpSsfIF3CZoIdN39H1iuZUIj301zFi3J7L3M79o6yUiY5vYt0ZQpgPOydNM4bGXAYXTHrpHQ3q5DOIKfAc9n8fnGaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8s6fCi97vWk9GFt0s7npvahZN5unxmdSpqlG4o6cTk=;
 b=BRUEYMH5QHg3kWTzoBGVQ3yjKkPXVfcQT21mweWRibi9AcMk1OiEyZSlVcYYvcqX8bWRwINOoIrwFJPISGlHoxDYWije1+2Ybnu9uysQgGcGRWUmGQCCLEasDCdA5VcHweTHRfGhtfWmgQAU2biKQGcFghHWGBv4eIvaMUxTXiI/6YHOCTEMLH1GaJXgTBfeSj/2g3hB8v2WKhIB1UkGrUr4LfAxKkt1Afrtbd27nPaGROYph9EX8o4CEiLMcCKJeraLUm3dO7URIYpO5gnrKXnqpUFO41iMTI0xJVL824RuaoopfaCQ0KHG8nVlNuJmzur6QAG7/rZ4Y2z+JBT/Mg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8s6fCi97vWk9GFt0s7npvahZN5unxmdSpqlG4o6cTk=;
 b=owAu7bPJrCjLUzgN411aPav+zHMOw/YJCYg+ixDB+dAHa1eSfShpGWp6GHWANsYJHmmIyz02sKjVlV1zsabkV7rGgXgySgPHhe+cT8r56On6UW6AGKqJ64OcLwA2NpbrwelUnAw8qsrrO6nAQMib3xEsubUwDLd/UYtq2fLCI0s=
Received: from AM0PR02CA0225.eurprd02.prod.outlook.com (2603:10a6:20b:28f::32)
 by AM0PR08MB5490.eurprd08.prod.outlook.com (2603:10a6:208:184::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 12:14:51 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::ed) by AM0PR02CA0225.outlook.office365.com
 (2603:10a6:20b:28f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 12:14:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Thu, 17 Jul 2025 12:14:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAC4d20Hwd3maWcHtcyNx3bdUdpt1YG3+cU7Pp2LCim9D17EJ1cBgFpBIpwxhngAhB3TIqcDMhT6nTs2UGzvsPQKqQBqvLr/uSd7iWKe3QnHFWr/F/F8/MVPsElb3d0Vs0qOCG9DpTVC8w4GC4P8KXTVf5S7lQZzEd7eVy/+2uE2MsL7WTfUzysniQvM1rR59gc7NYkbVXl5eLWSExmjPSPn3YYByn70okK2g/3lputwt93Tl/EXtw/59xMJvX7A5uTNWb2IbzAEnUV/TzCS9T0fUQzsJH4eRq4H1in+VEWyIV+F2D5OLhMWsm9i5DX2OpXwqLHGhtLo/rlGkzH+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8s6fCi97vWk9GFt0s7npvahZN5unxmdSpqlG4o6cTk=;
 b=QnHB+oqvvc7/r/04sXDjuVjHVxoKZlqwdAvn1jRyknJGtHQ8YX2XlgWMvqHE001kWGYZV9i3r7atjqQ5yI1QKrwvnUSRI5JEmqxTffUXQ0zvJBA+T/sqWQLmub4aA36Wau74Vx40pIMlqhw/LuqgRJlO2m71ZFQDNu3/ZSfO3EKZZJKGnJ8I9rnuuniK55d3IEIerhCkrtkIOojzXOix51uxnVsPtUEwJ5hEIL2c2LWzd5MZm1WHPfprFR373wNKoFbFPaRzAyxqupb8qzsqS98o6NSVJX3EpE02KLFh7decwjWNCJ1RLsfcy1LrBLaKFGVcLrikZnTNIL4bmJYxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8s6fCi97vWk9GFt0s7npvahZN5unxmdSpqlG4o6cTk=;
 b=owAu7bPJrCjLUzgN411aPav+zHMOw/YJCYg+ixDB+dAHa1eSfShpGWp6GHWANsYJHmmIyz02sKjVlV1zsabkV7rGgXgySgPHhe+cT8r56On6UW6AGKqJ64OcLwA2NpbrwelUnAw8qsrrO6nAQMib3xEsubUwDLd/UYtq2fLCI0s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7583.eurprd08.prod.outlook.com (2603:10a6:10:307::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 12:14:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 12:14:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ccache: move environment variables to the
 configuration file
Thread-Topic: [OE-core] [PATCH] ccache: move environment variables to the
 configuration file
Thread-Index: AQHb9jcYec1UVOCnYkqu+RD6XBMj6rQ1hlWAgAC104A=
Date: Thu, 17 Jul 2025 12:14:17 +0000
Message-ID: <7DAC38FF-5F62-4926-8B62-A852E62FDB02@arm.com>
References: <20250716094954.866783-1-ross.burton@arm.com>
 <CAMKF1srh8VDLOo_029px5CMMsWdoxo73t5-4PuVbNRVk6dFm0Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srh8VDLOo_029px5CMMsWdoxo73t5-4PuVbNRVk6dFm0Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7583:EE_|AMS0EPF000001A8:EE_|AM0PR08MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: 45af8224-729d-424f-88aa-08ddc52b881d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eGQ1eGVFVkpZU3VHSElISVNyWGUvQ0tYWkNVbkZFeHQ0bUY2N2NhMnNvRGlE?=
 =?utf-8?B?Zm9BcnFZdk51UGY4WlliMUIwNFJoVkcyazhIRTYwRzAyMlBNMm1ubUZNKzFn?=
 =?utf-8?B?Wkl4bGtJblJSTFJrM1NEdFlCTGYyM1ppa09DenNsVVl2SmF5M1ZXeFJLbExG?=
 =?utf-8?B?QU1Qbzc0Q1hkVTBjM28rOE03cTlSeDZMdjFrVWRLUzBPbEUvc085NTBGY3JL?=
 =?utf-8?B?NWpMczVKUVZVZHR5WTZla0FlbWpmTHJzNW9xK0F5T3JCak1hYllTY0tpU0Zz?=
 =?utf-8?B?TDk5UnQzVG1hLzNUSUtjemE4N1NYRno2eXErdlRDQVFjNnlhdzAwOWZLVzJa?=
 =?utf-8?B?T0xSWDkxRDFOSG96VWRwK1RBUVo4ejV6czZSK1doajlkbktrcUsrRmlkSXRD?=
 =?utf-8?B?bmxVckRDckZSUlNla0JQbGI3VnI1dWI2TXEwdk5VWmh3ZVpaQUdYSm9GcHRT?=
 =?utf-8?B?OGFUYXhxbjlibkRQSXhyWHZ3RnpLY3cyR0hGc3c4eDhrYWUwc0NTM1I3V0t2?=
 =?utf-8?B?RUk5N0M1NXV0RytpR05rZ0wxSkdtMEhnVFVXQWN0b3Q3WlllL2g1ckNlcTZ3?=
 =?utf-8?B?TjBCeW55SUlBSWNEamxFMEQ4Tk5HWmd4VTUranJaQ1lpWGhMWHhOTTNNV2Nm?=
 =?utf-8?B?bWRudWJmZVhBMUJBcDlLQ3RERlRlU0xOMElwUTRJVk1IM2QrV01FcGtocWdn?=
 =?utf-8?B?NVZwWVBWK1ZYbEpIc2Z0U3lLWUpNT2RGRUhQTjhBQWlCeDFOT1htQXEreDQr?=
 =?utf-8?B?ajNTeEx6NVlXUFcvSzE2R0tKUnovcDY5Q0duUFB1VkFJWVl1R1B0VEdzL2N4?=
 =?utf-8?B?NWppY1VYV2tWSFp5RXltVEJ1RkFSMy9lSXMxOWhvMFVRWUpRR2JMbFArS05u?=
 =?utf-8?B?SFhvUEdVVnRza0pML3pEQXZkdTJhRFRHeVo3VGVwYWtSbmlWdTBCSXNpNzlR?=
 =?utf-8?B?clRzcDRjUndsbE1KcVBFZElkNEptVldwK045ZFpxR2NTS3FMVmwvVXJnYUFY?=
 =?utf-8?B?Z3ZNQ2ZFVjgrbnQwazRGTXBDVmE0SXVadTdDSlIyY29VbFJZa2RkS0JiTXZh?=
 =?utf-8?B?UzlOcDB3dXJjZlo5Y3BJMHJ1eitHaXZ4YUpKMlpBU3hBSW9ML1pYS05GVkdw?=
 =?utf-8?B?OWlJVFpEZUc4eDdEZUJKdkVQdFJOT09QNTQ4YnFVcVJvVjBKVjdlNStscHA4?=
 =?utf-8?B?ZTlMQWhoeFFrNE5TUmtuYmZSWXJCRUlhNTd0L3lwejR3UXJqbStzd3V2Y1NF?=
 =?utf-8?B?Qm93NlhhMkxBSE4ybmdOeTU5OG1sVCtvSnRqRjJ6ZG1NV2MxRk1pTlRoU3g3?=
 =?utf-8?B?enBMcGVzZUNXaFRPYTJ0a1ZmTE1DTTZtbWdsQUMyRHFMQmE2UjhpQTY1Z3hH?=
 =?utf-8?B?VzcrTGU0VTc2THZJTWpZS1ZXK1U4T05kaUFwZUdQc2VCT3lFQW4wLzBYU0tZ?=
 =?utf-8?B?NnZRRGhhelJvRkwvNWM3QU9Ock02bmpDSTNsVzdXdWhNeE5ZVFhtS1N5cUxI?=
 =?utf-8?B?ck4zRTVpbXZ0MzAvVURTc0NUZmN5WmpKelVuN3VRQlVJcDlZdnU0V3QvcWlF?=
 =?utf-8?B?bmZJa0VhMWE0UWlSQVVrV04xTGtobmpURjRGemQxRU5oZENHRUErZFl5cjRD?=
 =?utf-8?B?YmEwTVpSa0RUdG1Bbm1XNHJoaklXU1oyc1A3KzBLaGM5YWhoaitHVzZVdEVT?=
 =?utf-8?B?MVg2aWhFNGE2N3p5aEplWVFUQ0REYWdOeGhGdWZwMHVJK2ZtUGY1aHVnTFR2?=
 =?utf-8?B?VW5YbjBEMVN0NHlYbjNJQzFpaUxPZlVRNVkrZGtGeXJSY3FEVDE4Q1o0Wmxy?=
 =?utf-8?B?dDJYeTlYbUVLR01WK29iRDFHVkxwYUcxQkpaMjl1MFRudGlZZ1gyQXpPQTFF?=
 =?utf-8?B?bW53Z3hzVTF4ak5MN0kwVFVBQTFpUDFtaWFQZTA3MVpvSEtVakRRZVpmejVB?=
 =?utf-8?B?dlo5STQ2UzdqbTkwMCt6YUU2S1ZYaUdreG1heXFLMTJkTDZTS1J5NkIvYm9E?=
 =?utf-8?B?NlNnMnNObk93PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2685863141DC954A93F781FF05E32F1E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7583
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1b347d97-eebf-4b2c-b486-08ddc52b7409
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|36860700013|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?anVuQ0l4ZmR5US90QTBqcHdMWmJjOGliR3lqTFh5b1V2NGpDMEF2RlhOUUd0?=
 =?utf-8?B?emVyMlZTN0lKRGR5djZJa1VDUUVIS0JFV2NCV0U5b1Z5WEZIb1BUN2hLZXlw?=
 =?utf-8?B?QWMxSzljNnordjY0amlpQWdUbk9pWWZTSzdYUWU2dEJQclZ6L3lLU2RSdGtr?=
 =?utf-8?B?WXNOaXc0S0g0YTg2Y3BUL001amEyUnE1OUIvYnRzNTlvL0tPSGRDZ3ErTXJ2?=
 =?utf-8?B?NnExaUwrUWs5K01pdlhHTzRQSENGVEc2UDV0citzUDNFdENzU0o4Q25VckJF?=
 =?utf-8?B?RFdJNVU5SHlibTBBMmo2dlZQRnJaaFRSVDR0SFpVWkV6UkY5OW1mc0Vsdndl?=
 =?utf-8?B?VGMwc1k5NTNBRi9waklBN1hCek5BYkdOb1RwWVVMQ1BFTHA4YWVGSUF1RlZO?=
 =?utf-8?B?MHFaY0hVYkRtaXpJMlpOREY0SDlBaEEvcE53VjZnUzdKTC9KYW5FNmtjQlJw?=
 =?utf-8?B?akRDZXpGT2s5MlBXUGxuVXZjWS9DQ3JNTXVkMTlKN3Q2ZVgrUExSY3h5RG1y?=
 =?utf-8?B?NlY3Z0EwcmRLSGJRUTVlTzBvSmJtWDdNVnVxVGVXOG4xaDFENDBDMlpFbFFC?=
 =?utf-8?B?dGhpVlorckFhcm9UTGdLZFNxRTczbkUyMURVYm96dFZhVG5KQzlIQTZVeXhi?=
 =?utf-8?B?cUJmc1BHYUdsNzNiTDR1bWQ5ZDh0dXZmVmM2V2dIV29semgvV2dZR0IvZ3dl?=
 =?utf-8?B?WjI3UFI5WWpSN0pKNDl6WXpMdnRoRWZLVi8yM0tRRGZDM1NaRkthTmF2aGJU?=
 =?utf-8?B?T3hibzB1N0lUL0NUYVB2MkJKZVhQZDd3ejVwQlE1bjFkcXY0cXFteXpPQVIy?=
 =?utf-8?B?azVSNTlMb202VnhTNTN6RVJiRHcva0prcURSak42dnA4WWh4YytpWm9CaTBm?=
 =?utf-8?B?bWJOU0pvMmYrdDBNSEJUZkpRa2FkWmVTU241RnBDbTlLbUFlUHV1TDZXazlj?=
 =?utf-8?B?c1l5TTgxQ1llSDBjdE5RSS9yU2hHa2JNT3lNY2g5dFhndjdCb3hDUWVIQkpJ?=
 =?utf-8?B?K09RcXpybzlVUVB6R0JHOGdMek1ZUmptU2J5elJMNUdPekZTendLcWxNZHl0?=
 =?utf-8?B?bmlwYjBNTCtzS0RLVXRzd2wrWXgwMXZ4TGRuZWFldGNad2JJenl3M0phQUU3?=
 =?utf-8?B?KzRLN3FPdllxSEpWTVRoMWVZREtIT1c5aXZYRUl1Wi9sLzAvY2hwYSswODJ4?=
 =?utf-8?B?UEtWcUYwR29OTnl3VGZ0eno0NEE5bGVnbHRZcnZZU1NhNW4vcjZNYzdyd2hx?=
 =?utf-8?B?MUdOWm5HeFpmNVJiK3lvSEcxNjBHSVdraDh2Z05kMmtCbjNBTVZ5cHE5Qnlu?=
 =?utf-8?B?eTJLcDlkenozYWhDUWZ6cEdhOGh1b2NndXJESjJ4Mm5NRnpOM1lJRWZtZitM?=
 =?utf-8?B?aEd5djRzNzVyOERpcjJGOERSVHQ5LytlSTVpSjllRGdNNitZN2JHdWhsQmlN?=
 =?utf-8?B?dkpjcXV3b2xoVUs0Y3VUaXFLOXB5Rmp5TFpaQmVhRk1WelN2Y21xemp2Vzhl?=
 =?utf-8?B?dk82VkJaMEVQUUp6c1hDMDRlVlp4bG1hSU91Z2lES0Q1V3NRQzFUSHE4eDBB?=
 =?utf-8?B?bFJDcGxmYnBBTUQ0WjJRY2NKZmhKYW95QmdIMGVxa0pocjFoaVh4Tk1Eejgz?=
 =?utf-8?B?WVBvZzJsT2FkTHAzb2RZTmcvWExIcVJVbGllTlZOMkFpNXJ0TnV0VVlNTmll?=
 =?utf-8?B?VTlKZkxmUE9GUEFGbU1lcFFiY1BxZ3lXK0E3OVN4NnhrRDQ2cTdPS011eUln?=
 =?utf-8?B?a3VQUHRUUEZiSGE3N0REQkRnd2k5aE1IUmNZbFJKT25WMjdjcmZkRExCWklK?=
 =?utf-8?B?RWhnREMya0FwOWE3UEhreHJ4SEtJc0w0VXVka2lIRDZCRGRuUVgwUWV3dU8y?=
 =?utf-8?B?dzBNdnhYc3ZiaU4yUUVrK3JybTRsdDNrUFFxSWUvUlBjRlNzd3Z3K3luekpj?=
 =?utf-8?B?a3J0RWVuLy9PcjBLQlpTWUxGaE5qNXFQb0svRmREak8wU2ZqdkZMWTd2V0ZW?=
 =?utf-8?B?TWFKY3RMS2Fsa0xyMnZKcXd4cWhjL1NCUnZOU0svaVVtYkhlZ3pPcElEekVE?=
 =?utf-8?Q?ayfULg?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(36860700013)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:14:51.3966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45af8224-729d-424f-88aa-08ddc52b881d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5490
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220538

T24gMTcgSnVsIDIwMjUsIGF0IDAyOjIzLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4+ICsjIE9ubHkgcmVidWlsZCBpZiB0aGUgY29tcGlsZXIgdmVyc2lvbiBvciBzcGVj
cyBoYXZlIGNoYW5nZWQsIGFzIHdlIHJlYnVpbGQNCj4+ICsjIGNvbXBpbGVycyBtb3JlIHRoYW4g
aXMgdXN1YWwuDQo+PiArY29tcGlsZXJfY2hlY2sgPSAlY29tcGlsZXIlIC1kdW1wdmVyc2lvbjsg
JWNvbXBpbGVyJSAtZHVtcHNwZWNzDQo+IA0KPiAtZHVtcHNwZWNzIGlzIHZlcnkgZ2NjIGNlbnRy
aWMgb3B0aW9uIGFuZCBjbGFuZyBkb2VzIG5vdCBzdXBwb3J0IGl0LA0KPiBwcmV2aW91c2x5IHdl
IG92ZXJ3cm90ZSBDQ0FDSEVfQ09NUElMRVJDSEVDSw0KPiBpbiBjbGFuZyBiYmNsYXNzIHRvIHNv
bWV0aGluZyBsaWtlICVjb21waWxlciUgLXYsIGhvdyBkbyB3ZSBnZXQNCj4gdGhhdCBwYXJpdHkg
d2l0aCB0aGlzIGFwcHJvYWNoID8NCg0KQWguICBJ4oCZbGwgZHJvcCB0aGF0IGNoYW5nZSBmb3Ig
bm93Lg0KDQpNYXliZSB3ZSBzaG91bGQganVzdCBjaGVjayB0aGUgdmVyc2lvbiBhbmQgbGVhdmUg
aXQgYXQgdGhhdD8NCg0KUm9zcw==

