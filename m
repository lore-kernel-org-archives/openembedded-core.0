Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7E2D1625A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 12:34:36 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.84])
 by mx.groups.io with SMTP id smtpd.web10.53900.1728909268588499963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 05:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=V1Orz7Ap;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=V1Orz7Ap;
 spf=pass (domain: arm.com, ip: 40.107.103.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DVRG84rOLUMsqK0cUM8C3aDyrkUyHat/AesL5kFkAVrFNQ4ZbSaKxKG4QSpZJ0m8MPzIsX/YlH7eMHqiyeV+hk4JFK3/2xGd4MGO0GvS6M/BJUj7fKtU4y0uQnzjhGekEH7+oV5wMfPxYKDmfnkldZ1rvOl/eg61tcx75vsvqF7rC2sm00MuYQ39pqOrtQMMA+6KNaLnrIEP2q63Qw3ZqVRraJZrg570Suqr2JTGo7cURnko/TooQ/dE0KrJKvopsaGG3offZ7OFbe55GvXpysUVNNKIZoC/g7MwtFrUzQdKKa1EfHX9/06gaQ6ZF4bMRU+1DUQnnVg7MQ1F8qn4BQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwqZPyCVXtE0krqUTj0za2Q//mYf9Tkxxvnr6ABePMY=;
 b=wKFp656s96hIkDbx3EnhiipU+xCgXKu9FF76W+IKs5cZ2ls5EcBcoA1ROwXJ2SyBFZP3O97dm1CWKfqiscLUCaEthcERHQjbtNVgzv59JD5pJT1OdJSEoQFS3yd0Ecz5c1t/VJolDUfd+oYhEz6gbYnRuVttlKSJ1OgmyR41kST4SitU66Gfvjwjn/IXF0x7zBSe3t+DgE+MPpirPcgnS8y6T5J+zwLa06g0nzyzLEpmQDTKsoZfZAMPpiLSLfsDjwcm2eFXEsgm54cYuu7f+FFN4dKpG3skNdoNciH4UqNA5/rLOBHVtEFFNqF30Lz0oM+p8503QIMAnkf0jVVB9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwqZPyCVXtE0krqUTj0za2Q//mYf9Tkxxvnr6ABePMY=;
 b=V1Orz7Ap7x7jQo+fI+BEx1mvAsrbmVsC9iSBYoTl5aXcj2BraLRVXxSzj3/xBKEB52nUEC0NPQJI3TxgfL0lg/GfupajSf4FcwFJUK9uEf3A8V2/LaXyYDrtTkaVbuB90Xdto8GWqhc0wwn+2fYew6iUv0uOXfjTpb/v4z05vrI=
Received: from DUZPR01CA0211.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::24) by AS2PR08MB10084.eurprd08.prod.outlook.com
 (2603:10a6:20b:648::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 12:34:24 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::84) by DUZPR01CA0211.outlook.office365.com
 (2603:10a6:10:4b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26 via Frontend
 Transport; Mon, 14 Oct 2024 12:34:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8069.17
 via Frontend Transport; Mon, 14 Oct 2024 12:34:24 +0000
Received: ("Tessian outbound 5e8afd4f8faf:v473"); Mon, 14 Oct 2024 12:34:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5426a391313a9b63
X-TessianGatewayMetadata: EMtyXiBzyWIvkfyFTKcwVA5XYeePn+1+PPDuDbZgvsl3IiETGmFhPb1KrvWCuaf3Xe0AoTxcjjh38c5D3s96zr5eKYaKZYpUSHe8o1rFsdT6whgpR+NT+CWkU9yNhlhbasFlcLy3zKyAAKDVf97vqEptc40xeqD6KIHf8CJXvkw=
X-CR-MTA-TID: 64aa7808
Received: from Lf017c3c53561.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 002CECC9-D548-42E9-B205-9D12370E94F6.1;
	Mon, 14 Oct 2024 12:34:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf017c3c53561.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 14 Oct 2024 12:34:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOL3vvVrQP5yBjBPn5Qw5/AMVmvKYAAJeHKWVWaqZwLnD5LOVEJWylVNCjTFeuUuyDhgFgJ9U+SIG4qHKCpaqX3xPBQjKxZD1N7JHBoUU3sMkkjwbN1LHmqolsJ8uLSfvTVLkI2+qhPffaA5BhoHah7BD7LfvY1KZ2/YSwuFsJtqkZDbHqIrD2YnLIWaLeVXS4VkEwUDa/YFByb5CE/1q6QOk92DFb1TDFWWbTs3/2D+L6ER15FeRwn/ZKiTZgqMUiyke40e3L/7Z64508vgAFHe5bsZ0p7+2BwaEup/jTFencpy26Pw2BPjjc9py5zyBewiynfsi3wrGHCq0+IOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwqZPyCVXtE0krqUTj0za2Q//mYf9Tkxxvnr6ABePMY=;
 b=CvCnMwtgczuju5bnf/yH0S/uGSEmldjd6hQwVc30H7Z/+CsXUnuniqBYrTNn+nlx9dnKsnII/gDM6H1s3E1sjGZP1glu+7jycKqe8/9a04rdtHaSNf0gYZ00nFR02XrwBg0mKAlu1w2vPoFxhKFOryf9Sl1R3mZ3C+Ob7RoaLwpfShaA73UdhG7eoo+e+0sIGzNa3SCyrFX9QiUM5BMTrsQsq/anoaEtN4iRjdg8eommYDPYvAapXow6A3ymQa6er/vki8ajlIf6itTzUWknSu1IlIW91SNpzHSjjeSMVlYn0LvuC4JywOlvfQdN1KeoE+gq/MXtnWa66MsrjrbuoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwqZPyCVXtE0krqUTj0za2Q//mYf9Tkxxvnr6ABePMY=;
 b=V1Orz7Ap7x7jQo+fI+BEx1mvAsrbmVsC9iSBYoTl5aXcj2BraLRVXxSzj3/xBKEB52nUEC0NPQJI3TxgfL0lg/GfupajSf4FcwFJUK9uEf3A8V2/LaXyYDrtTkaVbuB90Xdto8GWqhc0wwn+2fYew6iUv0uOXfjTpb/v4z05vrI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9214.eurprd08.prod.outlook.com (2603:10a6:10:3fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 12:34:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 12:34:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, Mikko Rapeli
	<mikko.rapeli@linaro.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ovmf-native: remove .pyc files from install
Thread-Topic: [OE-core] [PATCH] ovmf-native: remove .pyc files from install
Thread-Index: AQHbHiPg3SsxkYeoXEOjBDyYIpTm+rKGFceAgAAPqQCAAAj7AA==
Date: Mon, 14 Oct 2024 12:34:12 +0000
Message-ID: <5F96FA44-761F-4C3A-9892-266B9FDD0366@arm.com>
References: <20241014102817.40298-1-mikko.rapeli@linaro.org>
 <CANNYZj84yW7dBNYga4Aq748a_9_RuPi9y-H6kd+yG5Dun4dRKw@mail.gmail.com>
 <047b9ddb6f1aa89eab94c5d36262a8dfb081525e.camel@linuxfoundation.org>
In-Reply-To: 
 <047b9ddb6f1aa89eab94c5d36262a8dfb081525e.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9214:EE_|DB1PEPF000509F1:EE_|AS2PR08MB10084:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e127c2e-5357-4bf4-a412-08dcec4c894f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Yy8vT2t2SEx4elNzNjRBNkMrTDdlakc3V2w3bFlXWmNIeUMwTEE5L0JPSzNY?=
 =?utf-8?B?K3plNktXUlBiTGdZNTNjUUExV3Y0azJMUHlLTkY5a3g1UUVLUThpQVBTT3ZF?=
 =?utf-8?B?WE9jamZZUkJxY1dleEoxTm42QklYdWR3QTl1S2s5NUt3YUdCbnJPVUZNT2Fo?=
 =?utf-8?B?ejFJNWNSUFJnb2dSYkg1MTBTWW5ueGxkVzBKb214WjJnNEZVTnBsZFpCVCtv?=
 =?utf-8?B?QXFxWUp5bHMrYzByeU9yaVNjUTJWc05YNUJWMTVMeDJaNG1iQUtOS2RmUXJj?=
 =?utf-8?B?RFc5M1l4TU9CQUN4SnJid3IweUpQZEw3TnMwelM4RWVmTlQyMVRTVks2eS9y?=
 =?utf-8?B?d2lKVDlrSXZaOUdkRnZrTzFsa3pLbFBnV1B4dlREMDVUT0RXVkhoVFVabUJQ?=
 =?utf-8?B?dWQrQnFkQ3prUjJlY2Z2dXl5LzIxd2RaRVFReWZwM2ptMDJtM3poSW1Hd0M0?=
 =?utf-8?B?TCtoSjFLM0psUnV5RGR4em1KNnZkaUlUN3l0cTM0Mk1COFhlYzJYWHZFS0N6?=
 =?utf-8?B?cVNidEZRUDdYWU55TDFjQnZhWmxwcTNUdEVVdk1oUVZhNEJuWFF3UXhSUUlL?=
 =?utf-8?B?RGtlUnloSVoxNDZPaEhZNW9mcitmMFpkNldocklzWlMzcG9QQ1V5N0VvMHB1?=
 =?utf-8?B?cEtzNVcydHJIZm5kRUovOVFCSFZ0eUc5LzBWZG0rOE9PV284bU1qZnlmZ1Ba?=
 =?utf-8?B?VUJBNzV0WnhuVzExZkk5bUU0Um5MTVI2WkVNd3A2MmJmUDdzZjJ3YkdhSjVN?=
 =?utf-8?B?WXJwZ3ZqWnlQUnQyYzNOVTlWK3J2bVI2ekhhZVRRK0NJSC9CUG43ajFucWh3?=
 =?utf-8?B?cjNhVDhRbXVTcDcycFRjcm5nZFllMGI5SkZsa3VTaDlabElNZTVoNysvNDd6?=
 =?utf-8?B?MHVBdXhNSS8rUUt6Q09IR0w2bkhNODJUUjNmQVQ0bmlZZFlEZ0pLU0V5MU01?=
 =?utf-8?B?NHovQmhLY1dhRkVCZEl5d2tBUWxXV1F6dlBIdktxakVDNHlOSTRBN0dZWmpS?=
 =?utf-8?B?Q1hqQ2J0dDVDZHZrWHhpaG9Jd2VTanVObjFTaGJYUnNodmNUY0trSit3d2hH?=
 =?utf-8?B?Q2xsMGtJOVRDcjRRY1BjRkxGZm4zeVM1M2g2K25sb2M1WFBHN1pqdzNVdXBP?=
 =?utf-8?B?MXRuTC9hS2lqV1JGQ09UK1VSbnVRL05KQlE0NER3bCtNRFpibEFUcDZ5OXlH?=
 =?utf-8?B?ZVFIMW0xQ2VHeGhwaE9FNjIralp4N24zc3UxdmVRK2tBUGg4QThhSzN4WmRv?=
 =?utf-8?B?NG00cnVVcjlMMmFOWnp3R0tudWQzdVhnM3hlZ0RoOWcvd0pxOXZVVW96UXhJ?=
 =?utf-8?B?OGtIQVBQa2NvbXozWG00Z0UwWW5DQXFGTDRQZWdLSFdBSCtBbXIxejVqT0h0?=
 =?utf-8?B?eFJlZ1FTMGpVNlFNNktQR20wQXdyTGJFSzh4NUlGU0xqcU4rSWpNUlhwTVBl?=
 =?utf-8?B?SEdIVEhDeG5kc20xNlRjN1hWdm9tYTJoMTFFcG5vK2tUSG9QbmIyVER6UnpZ?=
 =?utf-8?B?REQ4b0JtR1c4cGR6eCttR0lCTEI4Vlc2ZThrSWMrdjgvSmZXSXdqbjBBaGhO?=
 =?utf-8?B?N1FPTlNBVkZBSmNHem9wYkVJQlYva3BhZG1vWFlHNXZDQTgvNVNyZXNzN1BJ?=
 =?utf-8?B?U2lpdTU1am5RSlJmdEZsUERFbWh2d04zak1nSHpGc1VpYmpxZmNVSldnL1FP?=
 =?utf-8?B?WGNDd0dLVTAyajhNaGl3WHZSaEdRR2l3VC94TFREUlRxek9zQ0RSL0hVRkhh?=
 =?utf-8?B?ZTNhSzhvRDhjM09MeGprb1pqQ2E1b3JTNnptOTFMZ3lrZi8xa00zSDdZTlp5?=
 =?utf-8?B?eFVja3VydWlCbHRwcmthQT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5851157BBAB1024F8440131EA0995505@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9214
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	02ea176b-20f5-44b2-0776-08dcec4c8228
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?REpmRVFCVzJhZVZ0djE1Rk93QS9JUUJFbkY0NnJjeUJiaC81bTQ5RmJ0b3A2?=
 =?utf-8?B?SS9BK21HRFlEdzNVMkQvdDRuS0FaQVQwUnQ4UHZERlhpZCt2UjhwRVdZUW4w?=
 =?utf-8?B?T204TzhHc3IrTlZUMkc2bFoxdUZwT3p0NGF5RzdpV3l2VElyUUt0NW1Ka0la?=
 =?utf-8?B?UC9RRnJFS0YrN1Y3K1lxMWQ3WFVrY2NUZG04c2JJYWYxZ2NhVkZFN1paU2ti?=
 =?utf-8?B?ZHN6M2orZjNMcnV6K1IxOXFTclYrcFpDWWRmVlloem1VSEVvWUpraU1HVDBk?=
 =?utf-8?B?bXF3N3JZeGJveSthTXdtTnJGRmRJNjlGK3JmVkw1SGc4dWZZU01aOG1XM3Jh?=
 =?utf-8?B?Tk9ha3k4Q3Q5VCtxSkVrcGphYlZkOFhPK25tdWMrVXo3L3RrQVZlbFFGTHBs?=
 =?utf-8?B?QjdLdWEwYXg3ZC81YXRqbGNjOHRob2NVY0JvVUVad0dPMC9ZMFVYWlMxZGtv?=
 =?utf-8?B?akpuTlJkbmU3K3RLZGlHeVg1TVVHR0ozSE9lRzIwMjJtVFU0STY4QytGOEQy?=
 =?utf-8?B?WjgrMFp2QllldFI0aTlZQ1A5cVpVNE5pd0JtRnUyZ3JLUXpLeTVaY0VhQWlE?=
 =?utf-8?B?bGVvdXhMRk1VRERvZFBWL0hNL2ZQdUk0Y2RieHdXbjJUWFNkMkdCWWNtZ2xD?=
 =?utf-8?B?R1VaZ0h1dklaclBuS2kzaWtRTVE1RlNuYWpMeEFpQnNtUTNzdmFsb3AxakNk?=
 =?utf-8?B?MFlqbWxUbFpNZ00zR0NGdUdwakpHeUZmclZGZ0x6UW5PeVQ3UzYwcFVOYWpl?=
 =?utf-8?B?OHMxeXFxR0dVRitrNWRCWXgzMVNMMlFNaU5rbWxNdm9FbzI5c2gxd3pRRndQ?=
 =?utf-8?B?WUJtUTJlWnRjS3hRQ1Nta01EamtvK3oxandhWk82MXI1UU1JdkpGem0reUlX?=
 =?utf-8?B?ZjlYelltbncwRDA3NVhvVWJJQ1NJODVIZWJrVkdNWklHaEpDd1dEK09yRFh2?=
 =?utf-8?B?cmI3R3NVRHJzaWxWamp5YXRKWVdSNFBPRnFzTWpnWTVXNjVIMk1RbHoxdzlH?=
 =?utf-8?B?SjBIRHgzMTg0WDROTVJLNU82WktrOHNFV1hHT3dMUEl1NEEwVWNZOHJsN3hX?=
 =?utf-8?B?b01hYlNaQTNBeW5aQng4V3c0cVhhb2dkcWROSWt0NmN2N1hSYzhqaUFaNlZj?=
 =?utf-8?B?Y2JTUWpCOWxFSnQrNWxoWUtMRDdZamhmU2tZM0tsOGsxcXlJUGFhWkZadUpQ?=
 =?utf-8?B?b1gyUXlxM0orVnd4MXdaZGhaMkJRV1ZLdkJ2eUZwTng1M0laTTlzcUFOcTRn?=
 =?utf-8?B?RXRGK0kvMFlrekF6WFlDbUVLYjZDb0tIUFNvaHVqMldLNFJHUzV0ajdFbThs?=
 =?utf-8?B?NmxHNG5MUFpXdXVIZUo4WlNIMmR3VkoxK0tpUk1RbjNrTWttVytEM2ZiUjJu?=
 =?utf-8?B?RlhqTjVkM1dsbm1Zdmo5ektmN0tlUFc0NWpoYnM5OWNoSzNoVGpLdXlRdlhD?=
 =?utf-8?B?dGRMWTRzWGhuZzAwMEkwMEd4Z0NKUmp4WkR6a1hJRlJSY1B1dy9nN3BDM0FK?=
 =?utf-8?B?UlZjOWhwYTBLb2VTVHdZRkU3NitTdnJ0MGdvYTlDSUh5WkZuNzRDU0FoaVlw?=
 =?utf-8?B?Q29MWFp3YnFjbHBVVkZITE1nUjNQUDJSeFVkUEhNTkcrOWRxRmlXV1A4N1RI?=
 =?utf-8?B?Vnk4OWdBQ2NHM0ZMYjl6aXc2eU1JZkFoVHU5OXE1ZjIrYWJTcFo0ZUpvQ0h0?=
 =?utf-8?B?ZXNnYU4yU1JmTVlUQzlwR3RPUGlZajRjdkF3dEpBYUlkVFhKQ0VrK2pocTBN?=
 =?utf-8?B?dURGRVBRR3NQd0l0MHZKbStraGkvRVloN3E3elBDYjJkbU1ObnRndTF6RDU4?=
 =?utf-8?B?V1V6bWtEaG1TY2FnNytOYlFHclVvWDA1TGlabTFIKzFwd2hvODljekdNelNY?=
 =?utf-8?Q?haJeTmsLcVxA/?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 12:34:24.5135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e127c2e-5357-4bf4-a412-08dcec4c894f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 12:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205766

T24gMTQgT2N0IDIwMjQsIGF0IDEzOjAxLCBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmljaGFyZC5wdXJkaWU9bGludXhmb3VuZGF0aW9uLm9yZ0BsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgMjAyNC0xMC0xNCBhdCAxMzowNSAr
MDIwMCwgQWxleGFuZGVyIEthbmF2aW4gdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3Jv
dGU6DQo+PiBUaGlzIGRvZXNuJ3QgcXVpdGUgbWFrZSBzZW5zZS4gV2h5IGlzIHRoZSBwcm9ibGVt
IHNwZWNpZmljIHRvIC5weWMNCj4+IGZpbGVzIGFuZCBub3Qgb3RoZXIgZmlsZXMgb3ZtZiBpbnN0
YWxscz8NCj4gDQo+IElmIGl0IGhlbHBzLCBJIGRvIHJvdWdobHkgdW5kZXJzdGFuZCB3aGF0IGlz
IGhhcHBlbmluZyBoZXJlIGFuZCBJDQo+IGJlbGlldmUgdGhpcyBpcyB0aGUgcmlnaHQgZml4Lg0K
DQpTbyBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhpcyBpcyBhIGdlbmVyYWwgcHJvYmxlbTog
aWYgYSBuYXRpdmUgcmVjaXBlIHNoaXBzIGEgLnB5IGJ1dCBub3QgLnB5YyB0aGVuIHdoZW4gdGhh
dCBzY3JpcHQgaXMgdXNlZCBweXRob24gd2lsbCB3cml0ZSBhIC5weWMgX2ludG8gdGhlIHN5c3Jv
b3RfLiBJZiB3ZSB0aGVuIHVwZ3JhZGUgdGhhdCByZWNpcGUgYW5kIGl0IG5vdyBzaGlwcyBhIC5w
eWMgdGhlbiB5b3UgZ2V0IHRoaXMgZXJyb3IsIGFzIHRoZSBzeXNyb290IGNvbnN0cnVjdGlvbiBj
YWxsIHdhbnRzIHRvIGNyZWF0ZSBhIGZpbGUgdGhhdCBhbHJlYWR5IGV4aXN0cy4NCg0KSSB0aGlu
ayBmb3Igc2NyaXB0cyB0aGF0IGFyZSByYW4gd2l0aCBweXRob24zLW5hdGl2ZSB0aGVuIHdlIHNo
b3VsZCBiZSBzaGlwcGluZyB0aGUgLnB5YyBmaWxlcywgZXZlbiBpbiBuYXRpdmUgcmVjaXBlcywg
YmVjYXVzZSB0aGVuIHRoZXnigJlyZSBwcmVnZW5lcmF0ZWQgYW5kIHdpbGwgYmUgdXNlZCBieSBw
eXRob24uICBUaGUgZnVuIGlzIHdoZW4gdGhlIHNjcmlwdCBpcyByYW4gYnkgdGhlIGhvc3QgcHl0
aG9uLCB3aGljaCBpcyBvZiBpbmRldGVybWluYXRlIHZlcnNpb24uDQoNCkkgd29uZGVyIGlmIHB5
dGhvbiBoYXMgYSB3YXkgdG8gY29udHJvbCB3aGVyZSB0aGUgZmlsZXMgZ2V0IHdyaXR0ZW4sIHNv
IHdlIGNvdWxkIHB1dCBmcmVzaGx5IGdlbmVyYXRlZCBmaWxlcyBpbnRvIGEgc2VwYXJhdGUgZGly
ZWN0b3J5IHRoYXQgaXNu4oCZdCBwYXJ0IG9mIHRoZSBzeXNyb290PyAgV2UgY291bGQgYWxzbyBt
YWtlIHRoZSBzeXNyb290IHJlYWQtb25seSBvdXRzaWRlIG9mIHRoZSBzeXNyb290IG1hbmlwdWxh
dGlvbiwgd2hpY2ggd291bGQgZm9yY2UgcHl0aG9uIHRvIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQg
dG9vICh0aG91Z2ggSSBiZWxpZXZlIHRoaXMgaXMganVzdCDigJxkb27igJl0IHdyaXRlIHB5Yz8p
Lg0KDQpOb3RlIHRoYXQgdGhpcyBwcm9ibGVtIGltcGFjdHMgcGxlbnR5IG9mIG90aGVyIHJlY2lw
ZXMgdGhhdCBmb3IgaGlzdG9yaWNhbCByZWFzb25zIGNhbid0IHNoaXAgYnl0ZWNvZGUgaW50byB0
aGUgc3lzcm9vdCAoc2VlIGVnIHB5dGhvbjMtc2V0dXB0b29scyksIHNvIEkgZG8gdGhpbmsgd2Ug
bmVlZCBhIGdlbmVyYWwgc29sdXRpb24gYW5kIG5vdCBqdXN0IGEgY3JlZXBpbmcgYW5kIGlycmV2
ZXJzaWJsZSB0cmVuZCBvZiBkZWxldGluZyAucHljIGZyb20gdGhlIHN5c3Jvb3QuDQoNClJvc3M=

