Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED44DCF34C1
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 19:46:58 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.76])
 by mx.groups.io with SMTP id smtpd.web10.6056.1727984808069558561
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 12:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HZ4d56Uk;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HZ4d56Uk;
 spf=pass (domain: arm.com, ip: 40.107.241.76, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IiZ8Jtu316S2jI0EoUPY2BxEMBKLMrTDIqc0dxGs+8k7HG+TtwQIEHPGGpClLcYNv+8ygTw86V0y9kCTgv5cX3g5T3iHWw7E1y3hK6NadUpDdUePnsOgABYUFqnDQOle/iiHkN/wOAayTHbHfd6J+SWTU1Jl1QB4ydw1scg4rMh95qUIGAMww5ydhQD89bAiQ4dSiwXpQKj+yM60wjzsEBZkxY8lK7tCXuWldA4eTPZajF1w4DRMY6cE4pE4YV330yfHLBy5uoIGG7/gvRKO7Os3mpUmGY3thKJUVKDEiINGGxaaVpFSuRfsogSrBeoWcuWk8Zanxesh4EKO4sAaEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwDtMhLiW8qTNJ35F4BqFWxCcds2BgmmLNFndVLP7pY=;
 b=V4PS9PLqSrFUdBlwvB/SgKI20RF9nkbeuN2fPBuu+fuCBx/33ZvABHVn/PfcULDvmI6cPuA1e2Cmk+vMZUoIaDPvXNuy4L5aDZaA9fPC+o/h2/fYjqVtPeZXaqZP1ukVyacZhSGHSNERD4QVx65cTvJRWYOMrxrUJgkJxifpeqle8lvn1GCWYsk26GmzavyuTxoGBicJcU82YfCMDyyuktCj/E5RscAgU67TJoX2f7DWShUV6B4pA90/Lwx89s4vS07TbkM6r460I4F5IPZ2NlOMsxsgYWoRNlBx4bN/HHYXI1D/SoXRv67ItOWaZ4s6u1w2GMnBJdKdmvUKFOkPhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwDtMhLiW8qTNJ35F4BqFWxCcds2BgmmLNFndVLP7pY=;
 b=HZ4d56UkmpyvAg9qFPi8xx6z6xvaUG64BZGwNdc6Bqo+CQNLRRerpRuP2nldbud6KoYm/Ql/pzhlHKODzlkRzE9h8d2z3M9Nc6w0YEL6FzVzoMJh4on9zc4RK4U47YH/oQgSV0Zn0Nz+/7HRrtaNkuKkKWMIrdn6E0SkQWqJsU4=
Received: from DUZPR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::10) by PA6PR08MB10547.eurprd08.prod.outlook.com
 (2603:10a6:102:3d8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 19:46:42 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::d) by DUZPR01CA0019.outlook.office365.com
 (2603:10a6:10:46b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16 via Frontend
 Transport; Thu, 3 Oct 2024 19:46:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8026.11
 via Frontend Transport; Thu, 3 Oct 2024 19:46:40 +0000
Received: ("Tessian outbound 0362136859cb:v473"); Thu, 03 Oct 2024 19:46:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ddb4e9608b40927
X-TessianGatewayMetadata: 6Zs78m5qlxUEwn4Wb3n+p6OLdmlmWqgjZLioUL4ek6jFy6n+sraf195zN1Unm/KYko1Y3LtFnlA6sb29d6rlMcz6o1rlUtThPWm78785M1B5Gy1ONiQEv9zcqgliYVJ6HSPC1uX03ibUjkQO2Kt5v1Pw5rV/+1M/6yzpHCpl+R8=
X-CR-MTA-TID: 64aa7808
Received: from L01ac0d119d14.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EE03E97B-7C04-48C4-B9EC-9FFC9A65E984.1;
	Thu, 03 Oct 2024 19:46:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L01ac0d119d14.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Oct 2024 19:46:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klJqTWNReUG8n27RGAEt/AUm6wDNSLtxcoMRSexNzn8bKr/7l1fOZVCU7QARBkdJaHZ7ZGfzuQJ5+Ki2SE9jveDSKV/oGG4b2ufaFfNoZ7bW4OWjsv8V3vyj6CteP30hwfO+YSVp+OeWxJwg1ol99YCW04K/P7DUkMI+FM5JkWq5FQU2qTGesA9EC4OBsznYqhNQbGDLhvGyjlL4NI82xD5uWHpu+ohBP6b/vK0ws7T9mwvJv7J1oZZEwO+lm1Pt7nc9xLeLSioueo3bdBpb5Nl9QD/QIePrIwihE6VaNEaI3fBk4LsR2RQ7sRYTsNLhxbppy2e/iUaSa0YUrssChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwDtMhLiW8qTNJ35F4BqFWxCcds2BgmmLNFndVLP7pY=;
 b=cTM+p6bMH2GlzFiSC3Lva446+PDiOA0yss+VXrnwScSWVpE7AmLNohzIFzAHX5reCGfWcKZfYRUlBGJO+JjTZjdn93Wcc7w8SPrzYnxxyiS1qogkr8gW4TYzJC2S9AJhDSs9ryrDrzwJHsqykQoMt3t/BE1YhE+cg1C7OMpa7O4yoJQYIStw3wfIw+RNNzOCkQPl1fnlPqfUqW3co7TaGrSsAngoF8RXxzHJIls88x35YyFWzzgAeBvnywT1Lw82eEBorebnNIfPxkrKTSLCNklO1FOL/22yevCuTAep9pIzeZZdVCTLXTv/wsyrrOksJlYGXAsXR+TvtLjidlQywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwDtMhLiW8qTNJ35F4BqFWxCcds2BgmmLNFndVLP7pY=;
 b=HZ4d56UkmpyvAg9qFPi8xx6z6xvaUG64BZGwNdc6Bqo+CQNLRRerpRuP2nldbud6KoYm/Ql/pzhlHKODzlkRzE9h8d2z3M9Nc6w0YEL6FzVzoMJh4on9zc4RK4U47YH/oQgSV0Zn0Nz+/7HRrtaNkuKkKWMIrdn6E0SkQWqJsU4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10680.eurprd08.prod.outlook.com (2603:10a6:10:525::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 19:46:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 19:46:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] strace: download release tarballs from GitHub
Thread-Topic: [OE-core] [PATCH] strace: download release tarballs from GitHub
Thread-Index: AQHbFamvVDZTS/cPsUqb+G2KojTyJ7J1VrGAgAAX0QA=
Date: Thu, 3 Oct 2024 19:46:31 +0000
Message-ID: <62F78FE3-256F-4978-B41A-0CE2AD441E7D@arm.com>
References: <20241003153344.3089615-1-ross.burton@arm.com>
 <DB5PR02MB10213D52FEAD6AF7EEBDC46E8EF712@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB10213D52FEAD6AF7EEBDC46E8EF712@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10680:EE_|DU6PEPF0000B61B:EE_|PA6PR08MB10547:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a19bf9e-f385-4af4-72cc-08dce3e419f3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RXlENCs3T3hDbllmMkcwdytlWjVQUDFvOG1rK1hubVFQQzJZRVlBNXh4aStM?=
 =?utf-8?B?SkdmVUpvMVIvYnpaUGFiUk9tdTMxdTg3RmVOQWVYUW41THVBbEl5bWJKbXlH?=
 =?utf-8?B?aEpqZ25TWm9ET2U5V0lQQit6QlpCNUhnQmdSOHpUYzd2WWt6cnlwL1V1bVhu?=
 =?utf-8?B?OEl3QjhJM1NOc1Rjbm9tck54MHpLU1dYbktxUS82amlwU2Z4K0taRGw1THpa?=
 =?utf-8?B?amcvcm91dzAzb3RLRHhYbnkrakxWNjlMSElxTEliRXp6VmRNWjVWcXJkOGU5?=
 =?utf-8?B?QlFXN2VySGVqcURGVEVzRWI5dDJIVHZWTm5nOEt2dDJWWERhcWh2akpTM09V?=
 =?utf-8?B?RTBhSzYrdkJNenBhajQ1ek5nRWgvTHFBTGYrbVFVbmljZ2tNeDNCZEF1aWhN?=
 =?utf-8?B?ZWdtNnRDNWhJdzNCZlhrSlNCdERocEQ5MXVCZExETFF6TkRJcEdReW9ZU2o4?=
 =?utf-8?B?bjlUeEg0RlphYzA1Zkh5c1psSUhVSG5ZNElwOWg3Ky9zczVNR1BEaWl5aUNp?=
 =?utf-8?B?cmJsUFYyQys4eWtNMmNZZlBsSnpwakxLYmw0SnZ3YjRRV1ZlcTIwdnl5UmFj?=
 =?utf-8?B?Nlk3Z2FadHZZcEZPb2IyZm9CanZoYjVZVytDcVZJVjBWVVNuci81WDJwUmgy?=
 =?utf-8?B?ekFtdmtkcVl4WmpWWGpLUm1RYlB6ZUtRajQyTzVyRDc1UXdvdDdCWFZCVjlj?=
 =?utf-8?B?d284VGpKNWZuMlZweVcwSGhQaUEvbDZqUXVsd2JOOW9lYmJBODRIdlNCRDFl?=
 =?utf-8?B?cS9XQmZxVVVoVnorZTFxMFM4QU04aktZSXBCTFdnOWFuRGVCUm5BVUhha213?=
 =?utf-8?B?WFRpZ2dKNDIyUzBacUlydkNJckhSR3ZBQ1MybStsdGZKVUhrT0tSOGZLODhx?=
 =?utf-8?B?dnFJNHVEbVZ5WFd0RVJ5ZGFrWUJKc25maFJIL2VCWWt3VGF3UE9QcVdkdTFK?=
 =?utf-8?B?S2ZINEZnekpFNnRUU3AxWW9RME96UE84ZzR2OHZzUGtZOTd6L2cya1g5Q01F?=
 =?utf-8?B?bWJwdlRvblFISU9CbzlJZGJOTHNOdkYwbjFqbzhoSUUvZ3hrNllFL3pNN01D?=
 =?utf-8?B?Z2VMMkNZRVljVVYxb3hzZUxVVnFwVTE0Nlk0UXMzY01CdmFLQml2QTJtazRh?=
 =?utf-8?B?UWdJcENoeXgwVTB6UHZaZWlYOC9ZNjE0SjY5Q1dwY0RXd2ZZQmFNbXV4S0VD?=
 =?utf-8?B?SW94QkdmM1g4QituWFh5d0Z6MW5qaFBaU3hwWXMrQU16UDEvNHlVUjBjZkVC?=
 =?utf-8?B?bjhwMjl6WWIrKzdVcllCZlhQYVBzQnVqTEwvVnREd2tpZUhPczBab3dzOG9w?=
 =?utf-8?B?OG1hT2haWkptdE9PUmhHRDIwd2JxUzNLQ3BDNTJQb1g4R2dWd01yRDNuZjUw?=
 =?utf-8?B?MlRJR1JZOWdWam5JTGxqdVFhMHdleWVWS1FKWFJpUDh0aitBZVB2WDB3bFRr?=
 =?utf-8?B?VlJNc0srY1RYSzVrZjBQaENJcEx5MWZPeUxSRnNoOUZuR0tqNVNDT0NRZTNY?=
 =?utf-8?B?c2l6Y3NMNUFHT0lhUjNHWjM5aU5hTFJ3dHJlK0V6alRzaGY4U1MwUnpidm53?=
 =?utf-8?B?SzJsby9reE0rTGhhaTYvRVZ3UmdYdTZteHNRY0Y5ckxXRGlMSG9OSHBwaXdD?=
 =?utf-8?B?TlNGNTRyT0JXcjhZcmIxaE9uTTBwWE14ZEVxMDVnR2RNc3dKMmZqcDdIYzIz?=
 =?utf-8?B?NWc5UmtheW1xYVBSYmJhV09CSVlhZzJLWG9MajdnM2p1c1dPdmt2TEhnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <78CA317F59E59942ADCCCF7971004EFC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10680
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	36643234-a791-4c01-f94d-08dce3e4144f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eVVjMHBnRmNiUkRaK2hxNWVFZDFBVjArY3dPWi9DT0NuN3JwaWpQWitHRmdw?=
 =?utf-8?B?Q3NORkw0d0pkeW4zSEtDNWhtYnAxNFJFWGxkRVZVeVRHV2Y4MkhVaXlXcjU2?=
 =?utf-8?B?eTF6NkpOeTBhRjN5eW5nMFhKQmsxMlNMUHo2dVlUNGVyWGJQV2liNDlucWJ5?=
 =?utf-8?B?TGh1MTJNWjFnVE5iTzBGY0M3UlJpanlYZFNmRytRb1c5M1FtQkpVOEg3a2V1?=
 =?utf-8?B?bWswU0xDc1VScTVpNk5JWUxGOTNpNG9lMWdTREs4d0R0eEhycStVZWtSWUVm?=
 =?utf-8?B?a1V2WUw5b2M1a1JyMXZWZlZYempjTkRKQmN4SVlkUFlRbDg1YndjdUtmUElW?=
 =?utf-8?B?Q095ZzBCT2kwekV6WFA0TUtPWnZlN1NYL245Vmxxb0VUV21HblF4WGRERnFG?=
 =?utf-8?B?cHhoRXFmVUtIUzBvcVpxU2c1NHRPTStnTkJFak16ZjFQbkhoRjQxeHBCcHpI?=
 =?utf-8?B?YTJ4T3FoZmpOTnVqRTNZZllNRWpMWjBCWFhLNlFlQzlNY0xRWXUzcVRydUhF?=
 =?utf-8?B?T1o4dXNTU0lrNVlFeHg1UFYvZ1A5RXA4dldnaGYxZkNVNjJtRUJ0KzZ1Y3dn?=
 =?utf-8?B?aWVjbHJJemFtQ1lqazBTZVNLUWkxelNzRXlibHdNUjJxem9DMVVwZXRmRC9x?=
 =?utf-8?B?eUFCUTFKT2prQ3I4OFlXdjZrK1Bpa2JVUisyTTNDSlBXemNvMTFYQlcwS0Jo?=
 =?utf-8?B?MlpIVjMxY21DZ2hlczNBYTY3MVM0dFF5VkxGZW1kK2RpNCtTNVQ1eEw5NEIr?=
 =?utf-8?B?WFpscjNCT1hjd3haelVrZkJSdjBhRTgwQTducFh3UHp5N01FZlpjRVJSR2xY?=
 =?utf-8?B?OHFuY2RWaDZwMEJ3dno0d29nMWFJSVR0eVlZSXA3eHJVeWdlZzM5V3VrbUJs?=
 =?utf-8?B?amJ1TGpSNmo5WG5NbFZ2YUVBWXZ5NUdNRVhWd0NKK3lCM3FiWXg2bHBCUDN2?=
 =?utf-8?B?MjJMbTdJdHJ0b0xBT0RGUisySU1iRVBUWFFRd1lQRVRVTjE5Y0lXNzBwUzR0?=
 =?utf-8?B?c3NEYzJCRFh0VW9XSkdCQW5RbndLZnRIZmNyaXNlZjJ4dnc5U0hSNmUwVmlu?=
 =?utf-8?B?dUdyak8vL2RiWG40YU5yQVA1UWkvcllNRkY2bFNGSW9uNWlNQkZ2bGZRVDdi?=
 =?utf-8?B?MWFnT1ZpaDJ0V0xSczZ0bmU5ZWFEY3lwNEQ0aHE1TEtJQlRWdHZpNWlsMkMz?=
 =?utf-8?B?N1pKNE9icTNIK3daTzN3ckNCaGVvZi9IN3JRMU5mR3hOY1BxcVMvT1JnNXZX?=
 =?utf-8?B?eGhMaFh4T0JXbk9BS2VwSE50d3JDd0RCa0EwN25BRThlbFVDeTZjWExuSEN5?=
 =?utf-8?B?UHZ3MzlBbFg3cnlkNkVxOTFjMGFnL1hvYUt2eUdtMjBobmtzVGROOEJTdGFv?=
 =?utf-8?B?SEovVnNSWmdmNUNWOTR1VlhEanZsejNJVzVwWXJDSlBkV3dzMXBuOFdlcGcr?=
 =?utf-8?B?cWNyNUdEemRTYVRxaXVIcEY5QVlYWGJVRmRUdXQvRElJWVdMemZKQStublhv?=
 =?utf-8?B?R2VNNU5heWNNOXN3TVJ1cW1obHNZK05SaUhnRThjWEFIMUVla09TaFVqcWd1?=
 =?utf-8?B?Mm9sWGE5NkhZamJjSmdXM3pDNGU5RDZjVWsrdnBwQmt2SzhpRHhRSU50NHRR?=
 =?utf-8?B?SFZNNzR3d0xVbGg1dlVJTm1FM1BNcFNGWGFXOEJ5ZU1scTdpcjJNN3JteGQ2?=
 =?utf-8?B?MXJyeWN1UERGeTM2WkMzelBkeXFDZHAyaVVWUG4zRWd3SWVvS0NabTF5U2ZZ?=
 =?utf-8?Q?QFzLxuvUcYLJVpQFp5n46K5zlhvrfx+rwwsXlKC?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 19:46:40.7045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a19bf9e-f385-4af4-72cc-08dce3e419f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10547
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 19:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205213

Tm93IHRoYXTigJlzIGludGVyZXN0aW5n4oCmIEnigJlsbCB0cnkgYWdhaW4uDQoNClJvc3MNCg0K
PiBPbiAzIE9jdCAyMDI0LCBhdCAxOToyMSwgUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVs
bGVyc3RlZHRAYXhpcy5jb20+IHdyb3RlOg0KPiANCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+PiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgUm9z
cyBCdXJ0b24NCj4+IFNlbnQ6IGRlbiAzIG9rdG9iZXIgMjAyNCAxNzozNA0KPj4gVG86IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4+IFN1YmplY3Q6IFtPRS1jb3Jl
XSBbUEFUQ0hdIHN0cmFjZTogZG93bmxvYWQgcmVsZWFzZSB0YXJiYWxscyBmcm9tIEdpdEh1Yg0K
Pj4gDQo+PiBTd2l0Y2ggdG8gZG93bmxvYWRpbmcgdGhlIHJlbGVhc2UgdGFyYmFsbHMgZnJvbSBH
aXRIdWIuICBUaGVpciBDRE4gaXMNCj4+IHJvY2sgc29saWQsIGFuZCBzdHJhY2UuaW8gaXMgaG9z
dGVkIGluc2lkZSBSdXNzaWEgd2hpY2ggc29tZSBuZXR3b3Jrcw0KPj4gYXJlIGJsb2NraW5nLg0K
Pj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4N
Cj4+IA0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNl
XzYuMTEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZV82LjExLmJiDQo+
PiBpbmRleCBkOThiNWZkZWM5YS4uYThmMTFlYTgwOTMgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZV82LjExLmJiDQo+PiArKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZV82LjExLmJiDQo+PiBAQCAtNSw3ICs1LDcgQEAgU0VD
VElPTiA9ICJjb25zb2xlL3V0aWxzIg0KPj4gTElDRU5TRSA9ICJMR1BMLTIuMS1vci1sYXRlciAm
IEdQTC0yLjAtb3ItbGF0ZXIiDQo+PiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT0yNDMzZDgyZTE0MzJhNzZkYzNlYWRkOTAwMmJmZTMwNCINCj4+IA0KPj4gLVNSQ19VUkkg
PSAiaHR0cHM6Ly9zdHJhY2UuaW8vZmlsZXMvJHtQVn0vc3RyYWNlLSR7UFZ9LnRhci54eiBcDQo+
PiArU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L3N0cmFjZS0k
e1BWfS50YXIueHogXA0KPj4gICAgICAgICAgICBmaWxlOi8vdXBkYXRlLWdhd2stcGF0aHMucGF0
Y2ggXA0KPj4gICAgICAgICAgICBmaWxlOi8vTWFrZWZpbGUtcHRlc3QucGF0Y2ggXA0KPj4gICAg
ICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwNCj4+IEBAIC0xNyw3ICsxNyw3IEBAIFNSQ19VUkkg
PSAiaHR0cHM6Ly9zdHJhY2UuaW8vZmlsZXMvJHtQVn0vc3RyYWNlLSR7UFZ9LnRhci54eiBcDQo+
PiAgICAgICAgICAgICINCj4+IFNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MzI2MjU4M2EzNTI5ZjAy
YzM1MDFhYThiOGFjNzcyYjRjYmMwM2RjOTM0ZTk4YmFiNmU0ODgzNjI2ZTI4M2E1Ig0KPj4gDQo+
PiAtaW5oZXJpdCBhdXRvdG9vbHMgcHRlc3QNCj4+ICtpbmhlcml0IGF1dG90b29scyBnaXRodWIt
cmVsZWFzZXMgcHRlc3QNCj4+IA0KPj4gIyBOb3QgeWV0IHBvcnRlZCB0byBydjMyDQo+PiBDT01Q
QVRJQkxFX0hPU1Q6cmlzY3YzMiA9ICJudWxsIg0KPj4gLS0tDQo+IA0KPiBOb3Qgc3VyZSBob3cg
eW91IGRpZCBpdCwgYnV0IEkgYXNzdW1lIHlvdSBkaWQgbm90IGludGVudCB0byBpbmNsdWRlIA0K
PiB0aGUgcGF0Y2ggaW4gdGhlIGNvbW1pdCBtZXNzYWdlIChhYm92ZSkuLi4NCj4gDQo+PiBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZV82LjExLmJiIHwgNCArKy0tDQo+PiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2VfNi4xMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuMTEuYmINCj4+IGluZGV4IGQ5OGI1
ZmRlYzlhLi5hOGYxMWVhODA5MyAxMDA2NDQNCj4+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9zdHJhY2Uvc3RyYWNlXzYuMTEuYmINCj4+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9z
dHJhY2Uvc3RyYWNlXzYuMTEuYmINCj4+IEBAIC01LDcgKzUsNyBAQCBTRUNUSU9OID0gImNvbnNv
bGUvdXRpbHMiDQo+PiBMSUNFTlNFID0gIkxHUEwtMi4xLW9yLWxhdGVyICYgR1BMLTIuMC1vci1s
YXRlciINCj4+IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTI0MzNkODJl
MTQzMmE3NmRjM2VhZGQ5MDAyYmZlMzA0Ig0KPj4gDQo+PiAtU1JDX1VSSSA9ICJodHRwczovL3N0
cmFjZS5pby9maWxlcy8ke1BWfS9zdHJhY2UtJHtQVn0udGFyLnh6IFwNCj4+ICtTUkNfVVJJID0g
IiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vc3RyYWNlLSR7UFZ9LnRhci54eiBc
DQo+PiAgICAgICAgICAgIGZpbGU6Ly91cGRhdGUtZ2F3ay1wYXRocy5wYXRjaCBcDQo+PiAgICAg
ICAgICAgIGZpbGU6Ly9NYWtlZmlsZS1wdGVzdC5wYXRjaCBcDQo+PiAgICAgICAgICAgIGZpbGU6
Ly9ydW4tcHRlc3QgXA0KPj4gQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL3N0
cmFjZS5pby9maWxlcy8ke1BWfS9zdHJhY2UtJHtQVn0udGFyLnh6IFwNCj4+ICAgICAgICAgICAg
Ig0KPj4gU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgzMjYyNTgzYTM1MjlmMDJjMzUwMWFhOGI4YWM3
NzJiNGNiYzAzZGM5MzRlOThiYWI2ZTQ4ODM2MjZlMjgzYTUiDQo+PiANCj4+IC1pbmhlcml0IGF1
dG90b29scyBwdGVzdA0KPj4gK2luaGVyaXQgYXV0b3Rvb2xzIGdpdGh1Yi1yZWxlYXNlcyBwdGVz
dA0KPj4gDQo+PiAjIE5vdCB5ZXQgcG9ydGVkIHRvIHJ2MzINCj4+IENPTVBBVElCTEVfSE9TVDpy
aXNjdjMyID0gIm51bGwiDQo+PiAtLQ0KPj4gMi4zNC4xDQo+IA0KPiAvL1BldGVyDQoNCg0K

