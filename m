Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EE4C27C5E
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 11:07:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web10.16858.1718017656689906382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 04:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZsiMAHQo;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZsiMAHQo;
 spf=pass (domain: arm.com, ip: 40.107.21.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kUEnpBFhksaPWhJR1y0qWubjn13uT2mhGjHW0VmwVXA4frbelGZf8Arml59UyZ+rc7DYM2bv/9NvlzTkxz9Fa7Jt5oVa6hpp+NfTteY34LNraZHvmigvxD3BCqRqaSkcrJ5pa98yecePLZUGdoS7gcry7hRVwe2A/f9UUJScyPlg/nwIBVnGHsn+xWoMogmCr5XRJF/2hkGKpeZAyp8DHxd2YndixS0ZnWAa4f+wHeIRDT3U0nUHyAe3TiIOvZatTxKIES9T+WL3RKQR3QDuY0DSMYr1KDl4m0gYqD18ug9y2w2qPsDy1bGZowgVwvy8Vgd6dmH6wvVfacoMXH1LYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3zKZhqs1otlTqe645vWJJ/xOzlBpUfjfven4MGowBg=;
 b=YxM1FwbMmxWfNIKpsnp6QmKmOrRTyBNjOJy5xnQ3E9i+XS/UQeiAEu5+NvSljo7Ux+B4ckdCxB/W0LxS9JneFMFZXu9giOFKOPjzfXhe3QkdxrLLGkyuzNmA03Fu6zBaJftPO/soT11Q6slWyuM+zawo8urBaCk7itqbxr4lEVM7osuLHZlCmO/VMMP1RmlZ6Q5/3codNBuOFjdKb0rao78rq8psUFDE0W9xVBVi5xfi4N9SLm+Xk3lPBTb8bcS74JAq5OIAT0b8Zi4S55KmHQVHkx4nzSowsEy3NASnv22c/6m9Xw2fs3Vf+eXYtNESe60ts6XNgy6VXGJXkll3bQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3zKZhqs1otlTqe645vWJJ/xOzlBpUfjfven4MGowBg=;
 b=ZsiMAHQoh+WLcNKU5kQv9WKN4C8D9sr6Ef9sTHvv5tdeOjIQt/YU9VxAgl+NBPlruKaSAZD55wN1lsWvwscnKlzY1Maovu/BVLf54AxBEQ/ngFtiu+WUNrguK7SRmy1W/Aw31jybJROXrmZGLEt496jXs8MJN0WMXnP3ESzZpoE=
Received: from DB8P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::31)
 by AS2PR08MB9738.eurprd08.prod.outlook.com (2603:10a6:20b:606::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 11:07:32 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::b6) by DB8P191CA0021.outlook.office365.com
 (2603:10a6:10:130::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.24 via Frontend
 Transport; Mon, 10 Jun 2024 11:07:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Mon, 10 Jun 2024 11:07:32 +0000
Received: ("Tessian outbound 22b47b37b644:v330"); Mon, 10 Jun 2024 11:07:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b7e46c97929cea54
X-CR-MTA-TID: 64aa7808
Received: from b3224b98de4d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 878CE9B9-1F09-4B91-A0E2-15791AE24BA8.1;
	Mon, 10 Jun 2024 11:07:26 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3224b98de4d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Jun 2024 11:07:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btyDc7/ENawVN7UB8hc8utL2nszhWZdk2/2awNdUfF8VAiQ3BpNgYUNcu8ZS6WkirswYK0WZLx4e0IxehWi988EtAMe5dFTv9OM882vy5RgWGpvd073obk7JRWtdb4FKnYhmcO003Q+JYkwiTfX0EJVoI8zO650+V/6LwEjq+Slu0xb0ukEtOEOXpIx2LfOiA6NkWGNprszytaLM1TPIkfkPO8EIn8ZzajEpiQogA93LWH5Y6m4bCqpvcvKe+qcJOLv428oC6N5eVP9VRjYgXDIzaBlCw005YGks4QB95XKdVSJLCg/+N8ddvAlCoOGq3FqZInasoYL8HS2FWwbpNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3zKZhqs1otlTqe645vWJJ/xOzlBpUfjfven4MGowBg=;
 b=G7iuqh9/uc6nfE4W2ZMP1uO7kCSnX1wCp4DOyuyTEtopKS+u2e7YwO6vJ9cLOwwsNwqrJy9MqWpn2zuTBsNfNJe9FnUFrT2T022Zcpk7zgeOYcHB+84q2u+DxKogBDjoohS/54s0naI8p0t6CosSoVOPiWQ6UsDr7QCejnKaq1lxg091K2DeT7CmB0EEmQIlzj3CNXpubUsCR8WzIig/YMz4vm37TEHcwNsLseqVO+FWuXJ4mNPboWxm05gyua+b39oJqMnQRJKulvwr79G1t8n3XxEpYd/0ndAdrt3eosyycwc8koNgH1mhtJuM8B7DDGlwJKaJkNSAEwTNxfuBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3zKZhqs1otlTqe645vWJJ/xOzlBpUfjfven4MGowBg=;
 b=ZsiMAHQoh+WLcNKU5kQv9WKN4C8D9sr6Ef9sTHvv5tdeOjIQt/YU9VxAgl+NBPlruKaSAZD55wN1lsWvwscnKlzY1Maovu/BVLf54AxBEQ/ngFtiu+WUNrguK7SRmy1W/Aw31jybJROXrmZGLEt496jXs8MJN0WMXnP3ESzZpoE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by FRZPR08MB10925.eurprd08.prod.outlook.com (2603:10a6:d10:13a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 11:07:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 11:07:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv2] xcb-util-errors: add recipe
Thread-Topic: [oe-core][PATCHv2] xcb-util-errors: add recipe
Thread-Index: AQHatXyBUb86fZourEe99cIZfpLgPbHA4bWA
Date: Mon, 10 Jun 2024 11:07:24 +0000
Message-ID: <43A0E60A-6316-495D-9F90-27685D03E168@arm.com>
References: <20240603060913.4178-1-f_l_k@t-online.de>
In-Reply-To: <20240603060913.4178-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|FRZPR08MB10925:EE_|DB3PEPF00008859:EE_|AS2PR08MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fca5fd-4999-44d8-5aad-08dc893d86e0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?K3V4bXM2T28zejBMVDV0QXR4azErRDhTSkhEdEFvRUNVbVUvaldsSGU4SzBH?=
 =?utf-8?B?TFhuR051NVhEd21Fd0tCdDFjS3RNQmNoREVqSnlubUZSeVEwWkdwaS9qVVFY?=
 =?utf-8?B?bzF6S2VtcFZzY2MxZ3VEQ05sVzNBbHF6Z1NLcDgrVWM5dG93WFl3dFJXWURl?=
 =?utf-8?B?cndzVW1zWUlsTTFvV2x3ZEQ5OWRjWDcrdHprRitkbUpITEw5VEdFUWpxbXQw?=
 =?utf-8?B?QkJ5WWRUZ0VKTlZ1eVJKTmtaeWhDRHBJU3lMOWt5ZWI3Vys0OTJJemdjaExB?=
 =?utf-8?B?MDlSaDlyM3hVOWRubmxXZUUzeHk1cFh4blNudzlzaitzK3dJRmcrUWJnUEd3?=
 =?utf-8?B?NDgxSnY3MDZRYXNIWFVudUdUTmdGUjJXbWJWZXMzR3B3RlNYNVBZakhTcWE2?=
 =?utf-8?B?dXY5RUQyTEtkcVB1WWozUms4bVFRa01KR2VFWVhYTlRLbWJyUWF5aE1Xbm9X?=
 =?utf-8?B?K2dNcmJ2UEZqSHBmVE15blNDODRTdVVmcVA0U2VyL3NWNzlTM0s2TUFmUGxM?=
 =?utf-8?B?bTNQaG40dm1lNGd0aWtiTGo1VnZhWTNrWnhYRWZ0bjV5bno5RkR5ZndYd3Zo?=
 =?utf-8?B?eCtSSjNBdERaVnNKWVFENk0xVEs3eU1NYzBCTXRhWDgwZ2w5TGVPY2ovMGs1?=
 =?utf-8?B?UGhjbjI5Rjc2QTViN3R4ZUxoaVZ5N05tOHVxWSs5TWZzb3hSR0dEczZ0T2hE?=
 =?utf-8?B?NTBiZFNqelYvUW01bDg3eityOUtGSXpIT3dZUWVCM1UzZUJuOHJ5Q25KK2Qr?=
 =?utf-8?B?WU1YcEpFeCs3YnZkdHArNUJMbXJGd016WmM1Q2dOSlRsM3ZjUWFvRmVWUFRn?=
 =?utf-8?B?UTBQWi92YjEwbCtNeno0cW9SRXJETmk1NjFNOW5VcDJZUFJmV2tJOVVkcVcw?=
 =?utf-8?B?bjl3QnpFaHN6dDZvdiszUGVGUVN4THJ4cGxGOGpEQTVFa2NLNzE4OFBsRnha?=
 =?utf-8?B?TmJuZGhwR1l1SGdpZitYZW1JVDZ2cUVrMGtmQXFwSThJSDUzVENuaDhPeGl6?=
 =?utf-8?B?ZVU3R3psRTVteldCTXFlUjF2Zi9WcVRMVmorWVN3ZUMrelIzSGFPMFFvQzNY?=
 =?utf-8?B?THBOaUVoSGZCZS9ESkNJajMvN1RsbGRteWU4OWlZMWZBTjJDaTJxUzJHbENF?=
 =?utf-8?B?cis1UEFPYUE1RHIvdnNDdnV6cjRjUUlmU3R5ZDFiTUkvSXhjK05DMVBFSEVH?=
 =?utf-8?B?aUM2R2lQbzkzSlFPWWY5a3VxakcyR0lhc2d5Z2kyQ09Ia2dKTkhZWW9kYjBm?=
 =?utf-8?B?TDd0N2FMVWNQZzcwSE8xSDJxSEE1NkdhSDZnd0FyWWFIT2E0cE9XeFBmWFpN?=
 =?utf-8?B?MURXMHFhNkMxWHMxekhMOHZDYWlhZnpHUHA1K1kyYVc5dVF2RGtxUHYwcHh6?=
 =?utf-8?B?WTRDOTcrL3ZNMHRxV2R5eTZNNW51d3FFVUkrZ3FZcytWNlluRnJrYmI4R2w3?=
 =?utf-8?B?RnZ4UmphRUFaS21PanRvYjhqdnJzL2FLay9qcytnY3dZcGtSY0xnWmRCSW1E?=
 =?utf-8?B?UjRrclU3blBIbTd5TFRORWlXWFBFZjJBek01VisvRGNteTg4YU5CeTJremIr?=
 =?utf-8?B?M0tjaGtzd0dyeGJlWHB0T2xNNkRVbUlybmwzUEptekhtY0VLSTljMzNvaU1y?=
 =?utf-8?B?aTk5TERPOXl2SXRxQVZHdUU2enhXQXAxczhGZmh1dDc5VDhFRkFwM0JVdEpn?=
 =?utf-8?B?RWd1NmxsaUJSM0EzbFRGNnlWa3FVbWRRNnRXVVFtYzlWVVlqb0pLUjBvN2ZY?=
 =?utf-8?B?V2JLekJoWmR2YUJKQ2Z5dDVTeGU1VytMT1JwbGRQYU5iWFlIMU5xdWtyblN6?=
 =?utf-8?Q?ytdOk65SVuyan8xEvKLbXz7zsvtWZ61Avooyg=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AFF62A34181534EBEB29CA32A353331@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10925
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ed94e0c3-0ebc-4346-4c93-08dc893d81ca
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|82310400017|35042699013|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MnhGeGg5MTVucVBLd2c3ZnEvTTNSUEROVU04VlppbE1SNnRtN2pJQzJQRW5L?=
 =?utf-8?B?Q2lrczlSNGx5Mk1uRTQwbThncEVWYzlFVFVBaTdPQjJrL1phYStRN1RzQmg2?=
 =?utf-8?B?bjhWZzhOQmpmVURJVnNxcnNEa2RvZTdIdGtBekh1cndNVVJyb2owcWJIN3VC?=
 =?utf-8?B?TEVqbzEzYzExTDVWTXV1WklOOHhiN2tWM2hhMFFQZ2NQcVNvVzJxc2NRRGV6?=
 =?utf-8?B?WkJaT1FxMm0xR2txQWVmTUFGV3VHTHcrWmJtS1NIaTBEM3hlQU1kNXNZNG5W?=
 =?utf-8?B?T1RCdlEzVi8yWnl3akQxbVpOYlhMOS9Va0gzMzM4cEdrTWZXR3p0QVk1Qzdw?=
 =?utf-8?B?L3c1L3J2ZElBdlJiTWxEVWtaK2grejVuZi8yMGVhMnJHRkRSK2hXUkFYdW5y?=
 =?utf-8?B?L0hRd01wR05qRnc4a1hzUDlDb3dJV1hDUWdjelNDd0lGejd0ZklmUS9VUXgw?=
 =?utf-8?B?bi9pS2tNRlFYWnhUYVdwd1F6SURZT2ZYbDVkU2FLYnc5ZVQ2RmFZVU1RSWFt?=
 =?utf-8?B?VEVtNXorS2Nad2dVNGxvZmtnREUzM01hMHJxdUR2R2hLNk1tSmd5UXk3aU5n?=
 =?utf-8?B?TkdnZ3VFdEtybCtzTGM4c2pFaUo0em9jSDJJc2FaaXJWclJDWTcrdFk4QW9k?=
 =?utf-8?B?dUsrTFoxcjE2TjBHZXd4d2NOR2d6a2tSTUp4VFdrUHN4ZXZJdVFCZlFMZFF3?=
 =?utf-8?B?ZzlHQmJpbGgyaTRPYjVEdUcveWNmRGhNQjFoci9CUlFjNlpGYnI2MHg1SHIx?=
 =?utf-8?B?MFBrMHdORm95MmJ6TjdFYVdsM3BPd0pPYkNCYTNjWlk0alc5U2M0Zm5pS3dn?=
 =?utf-8?B?TURSTGhJYzQzbVY4WVJjVGRWYjNtTTJpak4zVzlSMktSeDZVTFB0emZ0WGRu?=
 =?utf-8?B?dU9CSG5TRW1GTDB3ZjY0L29tTWVwUDB6WVRjTVkrcEdCUkZVSUR4dlVXL2E0?=
 =?utf-8?B?ODYzc2xaQW9Sbnk5QkJuUEFSZkRkc3pGRUF2Z2pNOWNxOHEzREFSSDc5bkw1?=
 =?utf-8?B?bXYrMFBnb1BYa0pvYTdVTGNXM1pVV0RyV042TnIrcDJ0cXFTUGNKT1pXR0l0?=
 =?utf-8?B?R01QU21mQU9kV0lYWnZuUnRZU3gzTEs4NTdlQm80ZmZWQmFQRlgxWFFQWjc2?=
 =?utf-8?B?RjdycXVXaGJxQkVibGtLVXdteHJ6WnMzZFRFMUhFOE9sVWlZK1ZidllrTThY?=
 =?utf-8?B?b2NDd1pBSXdob3FVWUNIbmVSNU9ZZE9ZT3lrNmtuaWp4MlZFUEFjc1lFWkJX?=
 =?utf-8?B?Zkg2dVB5Nld0L0dmZzg5eEM3M0lJbHQxOEEyTU1GSzhJeHNydGUvWHRnSFJm?=
 =?utf-8?B?eXN6Vkttb3pURHBBMkNwVWRlOEV0T0UvY01oYXhwUWd4Nk9Hb0kwOWNXcUxw?=
 =?utf-8?B?MWVhbWJyYUhOT3YremdURlFIVDRHTThVcXVCRjF1aTI2MVhDdTM5TlNRRzZx?=
 =?utf-8?B?WUkybVIra3o2VGlQaGJYVHF2bnMzdloyZ0tubEI1blloK0tDNlVsNmZQUCtH?=
 =?utf-8?B?emJiVDNxelliUHczZ01jWjhncE1lQ1ZwRWt1QkYwd2luY0plTGQ4UlNpVVlM?=
 =?utf-8?B?Smd4ZEMzNWVVTDFmS3J3RmlMZnBrNmc1d3Npc0FxZzVjcVBMTHEvemhGSm8v?=
 =?utf-8?B?L2xleHVCSlVjMFZUU0o4Z1JCQ3podllwVS9RbVZsdXNWbkFoQTVpa0N4bkwv?=
 =?utf-8?B?ZUZmN1A5cTR6R2lXM0t2WHVxYW1kNitSRWJ2MXd0MVpQRjJhVnZzNXVOOU40?=
 =?utf-8?B?YktHT2ZTMlIwaUIzR0ZOZDFTVlpvOFdHUkpieUZIbEpvcDZPL1ptdFpXZTcv?=
 =?utf-8?B?cEJqMm0wdmhzYkc4cjVmSUVLK29jczFXMVNVYStDc2JiNTVrWCttcmpLTS9N?=
 =?utf-8?B?Z0dDL2pRMnViSExjY3ZlSnRObmg2Y3FnbVBaT2ZaZW1QTVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(35042699013)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 11:07:32.8472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fca5fd-4999-44d8-5aad-08dc893d86e0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9738
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 11:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200470

DQoNCj4gT24gMyBKdW4gMjAyNCwgYXQgMDc6MDksIE1hcmt1cyBWb2xrIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxmX2xfaz10LW9ubGluZS5kZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gK0RFUEVORFMgKz0gInhjYi11dGlsIHB5dGhvbjMgeG9yZ3Byb3Rv4oCdDQoNClRh
cmdldCBweXRob24gZm9yIHRoaXMgcmVjaXBlIGlzIG1hc3NpdmUgb3ZlcmtpbGwsIGFsdGhvdWdo
IGluIHlvdXIgZGVmZW5jZSB0aGUgY29uZmlndXJlLmFjIGlzIHVzaW5nIEFNX1BBVEhfUFlUSE9O
IHdoaWNoIGlzIHRoZSB3cm9uZyB0b29sIGZvciB0aGlzIGpvYi4NCg0KQ2FuIHlvdSB0cnkgcmVt
b3ZpbmcgcHl0aG9uMyBmcm9tIERFUEVORFMgYW5kIGV4cG9ydCBQWVRIT0494oCccHl0aG9uM+KA
nSBpbnN0ZWFkPw0KDQpSb3NzDQoNCg==

