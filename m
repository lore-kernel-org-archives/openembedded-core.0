Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC966D358FD
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:06:56 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12648.1769684808792695739
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=G91l2Y/8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=G91l2Y/8;
 spf=pass (domain: arm.com, ip: 52.101.66.27, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=thK1j19+I05+9pBUGx3YEhshfF/t+0OqXEmz5GQKhWx1Zjn75UjnCQGTUY9VXwqBAmQDYYWNzxLeKAjbEET2UuHRIIGjRqrg6U1zGieD8XQYJPnqCEiTD6nF39XGO5utNwvccFDVxIIsigjNYX6Cx8pngIZs3wCy3ZeAGFgjqwqPpCzrTBdkzX1eXzIEz94ckwddtUA3Toz5elBEbf7aIS19MKIK6zf8ao2PrXQf/SK67B5s5EhtQ+2hysG74f/svL0Zcpsr4FaDPG/3bHRrWeXbn/VbjcyiOymsx1y/fDYyB9yxZYbkPENfFDrysQZ5TVFt87RUqAdKAKryBN9VXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYPdSvd2npkPauGtyUSwHludlhqMTvyLvSN+As8y60I=;
 b=pV86pQoLlnBZCAkUbJUuJ9yu5HIfDt9gYij03rVGB9c8WvhFEcm7ioXFKnJJFgbfB9CsNynfp19QkL9aBnE/G9t+DuylkQ/B2dBz6DVjXiBb7VYhGKNHWKBM1jo/4r8eUEuPLPgpDXT76Y1Dfcfgqqx8Q4tazt0piEOOI1Jx6/a+rbnjDuatO96yTUABkjNUMl0az9ngqAwOQl0hEdI2N6k4oeVbeaLn7/BCAmmF9ndAyBK9FDEHwEhj9dBRJkvzonBwcFRyDDq2qy6YBEFLG9cc9XL7Qngwz/SCpvlB88nxWn0NlYBbLN1zjl3ZAzsWv7KWcw9KsWW3x01x/pv7EA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYPdSvd2npkPauGtyUSwHludlhqMTvyLvSN+As8y60I=;
 b=G91l2Y/8/9BRtCHzl982a6AW73uhEuZB2Mgw9UzKi5wXWce2nbyJzECsZePzWvdepPOAWJEWVhUjfEnjizKZCzIxiqGJWxT80lSUOqzj3e+3kF5RJy4gKxgP4Sw/sW1/osGPqm5MZ4QswScbeQaEw6Z2W6cpJYsZFAbklQzeDRc=
Received: from DUZPR01CA0331.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::24) by GVXPR08MB10985.eurprd08.prod.outlook.com
 (2603:10a6:150:1f6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 11:06:40 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::87) by DUZPR01CA0331.outlook.office365.com
 (2603:10a6:10:4b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 11:07:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Thu, 29 Jan 2026 11:06:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2LuPyimgn0Ea0d5+zT99JbzdHEEHWo+A14UpH673vxD83JeB7Mn7H6QERaRW4P+IdEkAOCr/M4afMfQ50quj++y9JQsmmOUpoHLnb65jSXZQmSndzeqm2YOod8RkTYcoxQ1yaM5bFMHfkCrGDwp2Qvnv4CUv/TM71oMUMG9XW4tIOJZa185QrhAJHTUrnqjozQOxSghOksXckBkpkppoSumLfSI06ovZWqxONbbsJth7SWiIvTkIh2UxTSe7p8TNL/Z+Qd5hvAHtzi8ci5Czt4CMPpFtUTFpby/HHsqzPfM44xutuchl+0E2pPUdWUMpXWngaaBk0rAWl4LykKhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYPdSvd2npkPauGtyUSwHludlhqMTvyLvSN+As8y60I=;
 b=vKFAM4u2o6kqyVCZ4K5v10Kjp+mSuRft/l7k1pIDSsBypgXdMTHoEbiZzQTaW/SA0an/DTdmGNMfw7Fcmz5OQethUGiVgBvIehQ4fXH10gaLZ9QIx3fGv0U6mHj8zawj1AHt4SjdUQJw9/V5NV2B0q+70BRMPc6kxGTvPU4Gqk11JRPUrf6GlCry/rRuSBpMxUCJYWXQXVN1yfK5JC1djuCyVcst3y2uHWI+czzKZ90kZEh2gkEaLlP/X2MEI0nqrA6xCYr6ohG/VWVicMJNkmYM00+QcJodEoYDG+61+rxvYlodsg44oDkPmgbdHfFxi6/sE9WpzY6MugYGGZiGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYPdSvd2npkPauGtyUSwHludlhqMTvyLvSN+As8y60I=;
 b=G91l2Y/8/9BRtCHzl982a6AW73uhEuZB2Mgw9UzKi5wXWce2nbyJzECsZePzWvdepPOAWJEWVhUjfEnjizKZCzIxiqGJWxT80lSUOqzj3e+3kF5RJy4gKxgP4Sw/sW1/osGPqm5MZ4QswScbeQaEw6Z2W6cpJYsZFAbklQzeDRc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB11243.eurprd08.prod.outlook.com (2603:10a6:10:5e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 11:05:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 11:05:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/5] jquery: upgrade 3.7.1 -> 4.0.0
Thread-Topic: [OE-core] [PATCH 4/5] jquery: upgrade 3.7.1 -> 4.0.0
Thread-Index: AQHci35b6DCyC3s0I0ie4dPeAsBFw7VpB1mA
Date: Thu, 29 Jan 2026 11:05:35 +0000
Message-ID: <E70ED240-2198-4C57-8E98-479A464F138D@arm.com>
References: <20260122090513.888-1-wangmy@fujitsu.com>
 <20260122090513.888-4-wangmy@fujitsu.com>
In-Reply-To: <20260122090513.888-4-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB11243:EE_|DB5PEPF00014B8A:EE_|GVXPR08MB10985:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d578c8-dcbc-41ba-da0d-08de5f267a69
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SDNUTzRSRmR4NCtBb3VsQ2dIRUhFeVo1a1Z0SGFxZnRPSW9za1JtLzE2VExP?=
 =?utf-8?B?aUNPNVVxTCtGSnJMY1RYSU90UjNMdTVVRWtLZkdxem5ZUzd4VmRvSlNlNXRF?=
 =?utf-8?B?TWxEM0VZWDBWOHRvT2lkc0VwWG0yazZ0V1ZSQnVtc29JeWtkK1NzbDhyUFhV?=
 =?utf-8?B?YlA0VWlFSTlGTXhCK0dqMWJxT2lIdUJpTkdJR1lqdGNOeDhSd0dDRHp0Zmtn?=
 =?utf-8?B?WDhiV3VPTG14c1FGdlVwd08yUEFqbE1tMDhIMGZoMEJuNXJLNEUwdWR5TFdj?=
 =?utf-8?B?UVlpK29iMzdBaXBmbmZYNkNCQWlIRVNKVjZxUllTSysvWHFpb3hHU01mcmEw?=
 =?utf-8?B?NUExZnpFUU9DM1dNdHZxS3J2K3pzY3l1U3dFQUU2UHJvaDhoNWhtYlNKT1dC?=
 =?utf-8?B?Tjd5YklrNVlmU1RwRmhrSmFlOENuRTZGSzBCQ1F0OTRqVTVwVDZIVzZEOTJ2?=
 =?utf-8?B?QmdjdWY0TkUvcEEyQVRGMWtTc3lHK0VPZzd3bWFJbVU3L3NmbXhlMzdvd2dI?=
 =?utf-8?B?TVpYZUIwTHF0YWdJcjBVRUNVNGFsMGNOSnltSWhIYzNDV2tEYk9Wb1RlUWVn?=
 =?utf-8?B?WTdOcWhJNGkvWGR0TlkwbFd2anJCbE1QRU5Ca1AxZGY1T2ZtVFo5eHFuVE8x?=
 =?utf-8?B?cmRpYnNqMFFCWUtUTkdVZFNTWm1OQ3NsbGxlaDZweE1lMWxmdFdHRmt0bTB6?=
 =?utf-8?B?OGVHUWtxUS9ISTlNdGVBZVpnY2R4VU43dXc4Rm0rRXBRQ0JxV0Rrak0wUG42?=
 =?utf-8?B?WGNtK1VxY2sweTNhQUdNTjcxcXI0ZjdNOHhTL1FSbjdhL3BkK1RKSE9KQldT?=
 =?utf-8?B?QS9oTERWeFQ0eXJXa2lLVitQY2diZW5SQU1pNzdCL3I5bGc3R2duUWM3TkhI?=
 =?utf-8?B?cWdreTAyOWt0WFlaYVhSR0o0MU5uVVpseS9zcitoUVJtN0U4Vk92Vm5SZ3hI?=
 =?utf-8?B?Z3BlQTBDbkhya0JoYUFSRndEak9FdWlmY092Vnp3RElFcml3OHhsemNZcTQ3?=
 =?utf-8?B?RHhMMUw3WWxKS2RPeVpIN0FFK1JydTVSOC9QcC9aWUh1WGQ0UGYxK2d6T25p?=
 =?utf-8?B?MFMwY1pZUzM3Q0poQXRmU0pGWVdrUGh4bmptQzl1b3daWmdYQ0dkL3Jhc2VV?=
 =?utf-8?B?d2wyT2dQYzdtd0VnSUlVQmp5MTZHRFdmaC85OFRkdUx0U0tOTEJqYXcwMWp1?=
 =?utf-8?B?QmR6eG10cTZ3ODRmRGVaMWNiOHRuc2ZYZ2VpRjhvVnlrTkRxdjJhRG1XcTk1?=
 =?utf-8?B?V25sMm9QKzYycE1zaURGY2c2TXFleWZIVUVqMjdYTDlkU2lnbFlYSFgybkwx?=
 =?utf-8?B?bFNXRXdveXI2MWpTT0J5Z1NFcWdhWi9LYzFDTEpudEhpaThUVzJuL0JqbWds?=
 =?utf-8?B?Rjd3MTBIT3JlU2xPTnplQkdkQUVkMWhrQlhRdnF2amYyNVVIanczbG1xa3dw?=
 =?utf-8?B?WFZNaWlzV2F3cUxhMVgza0VwZVkzTGg4bXVXTHIzUUVkcDBzU0Rnak9uMGU4?=
 =?utf-8?B?SVFiUHNJTDhaZ1RUNTBocDNIUGtmZ3Baelg2WHZwS1AyL081TURJL2RPQmpO?=
 =?utf-8?B?SmtCKzh4YWJhNGdXWVNVcjlaZm5oSUZPbWYwVkY1a3VLa3JSM0lSUFI3ekZy?=
 =?utf-8?B?ZjZDQmZ0R09GTXlLTTBXdVhXc0JjeXRKaWU1NDdqR2xkRUFxSXlwZEs2S1c4?=
 =?utf-8?B?RU9oQ2JaeXFQenB0c3Z6aVJVWE1vNDhxS1ZINTEreHdqYnEzZm1KWE1HQUtB?=
 =?utf-8?B?clhEb2ZRTXUrMGpQUFZ3MExaQ2xnSld0Q0JEYnFFdHZSM243aEtzMndBQ20y?=
 =?utf-8?B?VzNlSHpUbEF6OGFoTXdGSTVvU21NYnB3bGxyb2dJSzBOYjROcFBRcm9MQ2Z2?=
 =?utf-8?B?WnZpMTFWUlh4ZlRqN09neHR6eStqSnMrU3NSUUJsYTAyQ2d5NzNqbjBuM2gx?=
 =?utf-8?B?RE9TNFhmY3ZjcUV1YXBxbkxaUmZOVjExVGx0elRlU1gwUk5pajhEMHN4ZW9z?=
 =?utf-8?B?V2x2Vm9TdzhQcnZ4TmJydEduSHY5a2tqN0cwenJmRE9PWklBQnlwVFY5S1Jy?=
 =?utf-8?B?cUt6T0FzbG0relJXaWc3Mzg5ZWJWTnRUbHlrdEdpMi9zWXBtSUtVa0ZSYWts?=
 =?utf-8?Q?91BQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00548AA39817C34CA36402998B296269@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11243
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e08a559e-9c87-43f5-5476-08de5f265430
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|14060799003|82310400026|4022899009|35042699022|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UUdndzVpYXQrM2VZUnNjeDRvcTQ1KzB4bk52TDY2c3I1ZGVpYlhDMVpONUwy?=
 =?utf-8?B?QitkdU5rRnVXWjBiK0F6d1JKSkUwT1JNaWZhNy8vN2YyMlBlTVlSV2pZaUxQ?=
 =?utf-8?B?c0xBRDc2OG9GclYwZjBCdjQ4UkorYlQ0VVZFcHdyRmtVakNNMzd5cXNlUTdk?=
 =?utf-8?B?dTA2MWU4MlJ3L3A0UjZoSDZxRVY2KzFNU210eW1iSFZzSEZYTzQrMjJ4MDVF?=
 =?utf-8?B?VUUvK0xlOXVxTkVNeEd2ME1kdmtMWVdSdnI4SW9tcmhOZTV1SlFEVmZLUjlS?=
 =?utf-8?B?TmdpV25QYWlMdEI2SW9qNEdISVZ4cVhHS3ZrMVI1OEhMUjRlTVpxUHF5NU43?=
 =?utf-8?B?dTBySEVieFJCMldhejZGOEcvcDlibnIrL0R6Ym1MYmYvODZnQ214L0lyZGhS?=
 =?utf-8?B?Nk9zRnJWU0VzWXFVaEJKRW4vLzd1MVdlSm9tOW5GWlR6OGtCaVhqK3N0enk3?=
 =?utf-8?B?RXlhZ0taRmlRN21WOWY0bWlEazQ3UE01K3lwZXZTZXYrZnlkTndJSzgrbWpv?=
 =?utf-8?B?cVFtRE5KUVRQQkpRWlFCWWdkaWo4Rm9ZZUk2clp0ZHpwbDF5a1Uvd25FY1p1?=
 =?utf-8?B?Nm40b1ZiYldRM3BzUGlhS0xkRmJ1TFBjT3FuL01lMGx5U1BiUkJwbkY5SVo2?=
 =?utf-8?B?N0ZpTFp0TG51UmsxKzY4RVMvSTloNDhZb0VHbFRJc0s4QmNORWY2dmEzTktq?=
 =?utf-8?B?Y0w1cTlnZnB4aXBBbXNMb3VucTlzRzUzTjFGcXhPekRXRzQzMzdiLzNwNnVt?=
 =?utf-8?B?aE1RbTNLNTl2Y1VhbEp2QjVYajF4S0h5aStUY2ZiRy83bUp5bXB6eWg1THVF?=
 =?utf-8?B?c0pGcnVmN1A2UjZISjZBdjFDbHNibk9KMzRhVUJSSFdKZnliVjBCMkJMcGkz?=
 =?utf-8?B?MUpBMENYamtYWlY4SXd0S2NoblNoZ3k5d3hPWDI2b3QxcnBQak9GeHVjYmY0?=
 =?utf-8?B?RER2OUlrYlpsR1phaUVoQjVoT0tyTUE1c2s0TnFjK0YvZDJ5MUZaQytSRldU?=
 =?utf-8?B?RmxtZmUveHIwYTdjNkdvcmlIQmszdUlwUk9SM1docVA5MTZWdmVucCtKMkdK?=
 =?utf-8?B?d01LZXhnQUdRckthZGUwbE8rcFNRak9TVFpKY3VIMjNEOElaK2NxVXJEeWtq?=
 =?utf-8?B?dHF6QXpMQnB6QTR5NkQ5QnQ3eTBJYk8rcmlhV0dMRlZETFIvN0gvb3h5aWhZ?=
 =?utf-8?B?Ylh6SWE1cndhUjJMbUVIcFE0R0hCUHdsWHFuQmJWQWM1SEQyZ1B1NnhrVDh4?=
 =?utf-8?B?QzFYYWtJZ3Nad2g0NXV6Qm1sWUVxMVNWTGZwV0Q0elJaR2kvSGZ0SnU3Nzhi?=
 =?utf-8?B?bk1iNTgrd3Q3aW8xWFJTa0ovSzR3bW5ka1JtNlpnY0EyWVJyTWVvaHExSFlQ?=
 =?utf-8?B?UWk0d1k5WE8rUEkvRGxiaHc2WTZJam9WV0ZYZW9pWHRXRkljMUVWWVZ3OUFU?=
 =?utf-8?B?eDEvOENGeTA0NTBlazdIWGFOem4wMmc2amxJQU8ySTMwZzV5emdUN2VVdWVG?=
 =?utf-8?B?VGJqRzhqbno0Qyt5MDhPUlhNb1NwbURKWExmam9vT2RZd1k2ak1CclNtWVVh?=
 =?utf-8?B?RnVlRVhjSkFmVkxWQWt3NEVWWlp1NkFpOHZtLzhqRlZEZFhJZmJSbVJTaVhC?=
 =?utf-8?B?RlFaODNPeVpzSjdXSllXclhDU2lwMm1zcm1WcWZqRUlrSUhVSVIyTFZCM0Uv?=
 =?utf-8?B?Tjh3Z05yNDYvTE00MFZWd3NTKzBaQmRaZUlGbk83RUNnTzIvUWJLWlJsNGk2?=
 =?utf-8?B?TTQ4aSt4aTh2dndjdmY1cHRzQ2d1T1NNZUNxUkZva1BPQWd2eEpXbm9Ic0hV?=
 =?utf-8?B?YUVmTmo2MFA4UklncEJmV1I5UGxWdnBIem0wSGh3eVkydTN2UWRqV2E4RUZK?=
 =?utf-8?B?ZlRFa2dELzlwTXdOa003MjhTWmt2NkxFUHFPdjZybEh3TXdUN0VtakdiQnM3?=
 =?utf-8?B?U3R5SWtPdFd2YzB4YjVuSkpib2RrTDF0UGJHZ21DNFNMVm9mL29ibTQ4cXE3?=
 =?utf-8?B?T3RzbDV5OUE0QkRRUk9EbzUydFUxa242NGZSRlIralpCU1pEVWhqcXFTYzRO?=
 =?utf-8?B?VVlLM3o2dEh5MWZ6SU1OcytYUTNkeklMeE9BUmtiK0lYSjlERGp3NDhTY2x6?=
 =?utf-8?B?U3Q3SEtXVGNheE95cDExZGk5azlpOElnaGhHSGVWc01jMmUxcVRKMW5NbzBL?=
 =?utf-8?B?clE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(14060799003)(82310400026)(4022899009)(35042699022)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 11:06:39.9570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d578c8-dcbc-41ba-da0d-08de5f267a69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10985
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 11:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230129

anF1ZXJ5IGlzIG9ubHkgdXNlZCBieSB0aGUgZGlmZm9zY29wZSBzZWxmdGVzdHMgYW5kIDQuMCBp
bmNsdWRlZCBzb21lIEFQSSBjaGFuZ2VzLCBzbyBJ4oCZbSBjb25jZXJuZWQgdGhhdCB0aGlzIHdv
dWxkIG5lZWQgdG8gYmUgdmFsaWRhdGVkIHdpdGggZGlmZm9zY29wZS4gIEkgaGF2ZSBhIHBhdGNo
IHRoYXQgSeKAmW0gdGVzdGluZyBub3cgdG8gcmVtb3ZlIHRoaXMgcmVjaXBlIGVudGlyZWx5LCBz
byB3ZSBjYW4gZHJvcCB0aGlzLg0KDQpSb3NzDQoNCj4gT24gMjIgSmFuIDIwMjYsIGF0IDA5OjA1
LCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHdhbmdteT1mdWppdHN1LmNvbUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEZyb206IFdhbmcgTWluZ3l1IDx3
YW5nbXlAZnVqaXRzdS5jb20+DQo+IA0KPiBMaWNlbnNlLVVwZGF0ZTogVXNlIG5hbWVkIGV4cG9y
dHMgaW4gc3JjLw0KPiANCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWpp
dHN1LmNvbT4NCj4gLS0tDQo+IC4uLi9qcXVlcnkve2pxdWVyeV8zLjcuMS5iYiA9PiBqcXVlcnlf
NC4wLjAuYmJ9ICAgICAgICAgICB8IDggKysrKy0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9qcXVlcnkve2pxdWVyeV8zLjcuMS5iYiA9PiBqcXVlcnlfNC4wLjAuYmJ9ICg4MCUpDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVyeS9qcXVlcnlfMy43LjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV80LjAuMC5iYg0KPiBzaW1p
bGFyaXR5IGluZGV4IDgwJQ0KPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1
ZXJ5L2pxdWVyeV8zLjcuMS5iYg0KPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2px
dWVyeS9qcXVlcnlfNC4wLjAuYmINCj4gaW5kZXggMGRlOTJlMDQxZS4uMTI0ODBmZWYwNSAxMDA2
NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVyeS9qcXVlcnlfMy43LjEuYmIN
Cj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVyeS9qcXVlcnlfNC4wLjAuYmINCj4g
QEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vanF1ZXJ5LmNvbS8iDQo+IERFU0NS
SVBUSU9OID0gIiR7U1VNTUFSWX0iDQo+IExJQ0VOU0UgPSAiTUlUIg0KPiBTRUNUSU9OID0gImRl
dmVsIg0KPiAtTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vJHtTfS8ke0JQfS5qcztiZWdpbmxp
bmU9NTtlbmRsaW5lPTc7bWQ1PTljN2M2ZTlhYjI3NWZjMWUwZDk5Y2I3MTgwZWNkMTRjIg0KPiAr
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vJHtTfS8ke0JQfS5qcztiZWdpbmxpbmU9NTtlbmRs
aW5lPTc7bWQ1PWNjNGNkMmVjMDFiMTY4YWE4NTNmYjI4MWM5NzkwMmJiIg0KPiANCj4gIyB1bnBh
Y2sgaXRlbXMgdG8gJHtTfSBzbyB0aGUgYXJjaGl2ZXIgY2FuIHNlZSB0aGVtDQo+ICMNCj4gQEAg
LTE2LDkgKzE2LDkgQEAgU1JDX1VSSSA9ICJcDQo+ICMgRXhwbGljaXRseSBzZXQgdG8gMTk5MS0x
MC0xOCAyMDowMDowMC4wMDAwMDAwMDANCj4gU09VUkNFX0RBVEVfRVBPQ0ggPSAiNjg3Nzg3MjAw
Ig0KPiANCj4gLVNSQ19VUklbanMuc2hhMjU2c3VtXSA9ICI3OGE4NWFjYTJmMGIxMTBjMjllMGQy
YjEzN2UwOWYwYTFmYjdhOGU1NTRiNDk5Zjc0MGQ2NzQ0ZGM4OTYyY2ZlIg0KPiAtU1JDX1VSSVtt
aW4uc2hhMjU2c3VtXSA9ICJmYzlhOTNkZDI0MWY2YjA0NWNiZmYwNDgxY2Y0ZTE5MDFiZWNkMGUx
MmZiNDUxNjZhOGYxN2Y5NTgyM2YwYjFhIg0KPiAtU1JDX1VSSVttYXAuc2hhMjU2c3VtXSA9ICI1
ZTdkNmQ5YzI4YjdmMjEwMDY1MzVlODg3NWViNDdlOTY2Nzg1MmExNGM0NjI0ZWVkMzAxYzZjZWEx
OWFlNjJiIg0KPiArU1JDX1VSSVtqcy5zaGEyNTZzdW1dID0gImY1ZmIwNzc5NTljYTA2ZmFhMWRj
NTA3NjFkOGJiYjgzNmM2Yzc4MDY3OTMyNTM3YTJiM2ZlYTllNDAxMjU3YzUiDQo+ICtTUkNfVVJJ
W21pbi5zaGEyNTZzdW1dID0gIjM5YTU0NmVhOWFkOTdmOGJmYWY1ZDNlMGU4Zjg1NTZhZGI0MTVl
NDcwZTU5MDA3YWRhOTc1OWRjZTQ3MmFkYWEiDQo+ICtTUkNfVVJJW21hcC5zaGEyNTZzdW1dID0g
IjdkNGEwODgyZmUzZjhlZDA3MDllYzdlYmVmMzYxZDY3OTM5NDg4ZGUyZTBhNmNlNDFiM2JiYTgy
ODU3ODk1ZWYiDQo+IA0KPiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJqcXVlcnktKD9QPHB2ZXI+
XGQrKFwuXGQrKSspXC5qcyINCj4gDQo+IC0tIA0KPiAyLjQzLjANCj4gDQo+IA0KPiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQg
dG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyMjk4MzcpOiBodHRwczovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIyOTgzNw0K
PiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTcz
OTcxNjUvNjg3NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21d
DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

