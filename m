Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C18C25B74
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 15:53:31 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.57])
 by mx.groups.io with SMTP id smtpd.web10.64228.1715615610335575934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 08:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NQEySqBE;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NQEySqBE;
 spf=pass (domain: arm.com, ip: 40.107.105.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hF/HTN9cdopD7P7oIoSZVB5tnMk1IGltj9dt0mgTId/XcuBQtyKLaeO1ESjsznk82eXYqlqwk35v6SrSudgBb0DxBVsXqmG1f/iKM/NAYM6aPpHYONSJuvVbmz/cUJ/Emzy57nSxZA9/Z2dE16cJBLEbR+T2FyI2SVZ4U2MClM0wmtHe4QBoqfZlLga7pjFZgTi2Jl6z+2U4hCzfnOCtxuxt2+WpGdlHiURe+zUANT5zLSRQZFNvq0vWc85SLd1XRTI8ff/R9Gr+o7OElG3BZeDoFeeVSsZ/bjL50cQacKwiIpB3kETB5J6v/LUDzeL+3kxZ0fR9ijAtGXzD1Ogu8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTTlxynEvQAFMPUj7Tz1w5CUODXCcNEepp9/BUfESx8=;
 b=EteCHJs1SbSjh4yCewhrAP4pgiN+PKYHmGu3ILbmh9taJbis94ujRLl/ohTH+IsHYfm9W9pELWu+yn78DoL28zdTswLn9YS3Utn2QecVTpNlezXnocOV+t7F04+04fxj1Tx3ZTd/2eT4YNU9D1G7L26qCVl1PJJwvUHwSRZnwqnD6yqe71egNxFOclS5hjigZ4wm53KXC5QHJsXl78XyR6j30xZTw/yYyu4tV26dN5yNCmgi2Sw5VEhblnU93aSLsNERxCdxc/ICFOxhXexMSDhsnz3AMOf0Zm0mzy8m0c/TXTZwxQl/30pfid75qBmQYzRHCQVtXX6Nmpu57dF5aA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTTlxynEvQAFMPUj7Tz1w5CUODXCcNEepp9/BUfESx8=;
 b=NQEySqBER8YsUa4OdALgZZ19okVCXTnUqTgRJFl1vmXNvFyduPWnnlHA5ph864TbcbpD1DfC9U9FGsliKVHr8ZZ38hSkOKJfLHzRvsBopZVe2gooFz8kw/oqxA5vfNy4sm8bDOn4WFqAEr3VNAR0qERNHsNB8PNtSMWNBVaIHnw=
Received: from DUZPR01CA0281.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::9) by AS8PR08MB9954.eurprd08.prod.outlook.com
 (2603:10a6:20b:638::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:53:26 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::42) by DUZPR01CA0281.outlook.office365.com
 (2603:10a6:10:4b9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Mon, 13 May 2024 15:53:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7587.21 via
 Frontend Transport; Mon, 13 May 2024 15:53:26 +0000
Received: ("Tessian outbound e46bb127ed3d:v315"); Mon, 13 May 2024 15:53:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e26b99c5392aaf6a
X-CR-MTA-TID: 64aa7808
Received: from 5ab08915a7b2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6651FFC2-3A4C-451B-B7CE-A54023AAC343.1;
	Mon, 13 May 2024 15:53:19 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5ab08915a7b2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 May 2024 15:53:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kf8+9srou9rKGNVp+V8nkruCqgKh52aeDUK+5xsSV0s3gV1aOrNjjKT3vxe/9e9QMhrof5uKIuTb2uFeZ4KYFl2o2e16x/vyjdRpnklVjMfgRrAzH0mw9V0HBPkjBg/2mtKqxxe7iquafAIhV1Jm6DZB8L6/BlbciDKIra1rUtM4xDp0SMAxYU8JXSMpjuYtEpPF3HxsZwojJ6iBkDgSskI4D5yMFGYDpaYAcmvDL7Rr3NS/IzoNauM2F8hmNoDADvWaiDwV77oTAzb1hGDQ0Wc2sSHXaBb/VfF6NaJU3h4wo74wKexUHNZogqsJWAPANzSX7AfYsa3noY0v9DYv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTTlxynEvQAFMPUj7Tz1w5CUODXCcNEepp9/BUfESx8=;
 b=MLAUXTjaRcDh9s5Q7oiHgURqwNs324s8MMslY6qZwlHPouek3yYkEb/6gwnADSLDzLuLE7BrLvSo0MjY6u4dd93bSljlz5TsUfbUqUGC/ziQo+pxFcjU0ij/aLgNLnsM4Ck1RKc7471xIT8d9jYFzJWJ927KGsW+AIdAXDVoNq5pTVUe1fKtUBNFKojP7D9itFznS+gEO5Alj4Sp1XaskyG0WZnuoTlMyRHtjirdtTU7xKWAkjgkvECi35LJGt6WSiHR25R0LU1A75CTvTvLpq+IYJY4bD2yldm7CYoISHl9gPRXzy1EcxKVxIDlOFQIOQELRzpL561oPMnx5uNc6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTTlxynEvQAFMPUj7Tz1w5CUODXCcNEepp9/BUfESx8=;
 b=NQEySqBER8YsUa4OdALgZZ19okVCXTnUqTgRJFl1vmXNvFyduPWnnlHA5ph864TbcbpD1DfC9U9FGsliKVHr8ZZ38hSkOKJfLHzRvsBopZVe2gooFz8kw/oqxA5vfNy4sm8bDOn4WFqAEr3VNAR0qERNHsNB8PNtSMWNBVaIHnw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9127.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:53:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 15:53:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>, Alexander
 Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4 ->
 2.80.0, 1.78.1 -> 1.80.0
Thread-Topic: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4
 -> 2.80.0, 1.78.1 -> 1.80.0
Thread-Index: AQHanHwq3o9YIJa6xkieUqjnpyfnG7GVSomAgAAD6wCAABPegA==
Date: Mon, 13 May 2024 15:53:17 +0000
Message-ID: <AD01E4CD-6C57-4D17-8C7B-E4AFB0C01C12@arm.com>
References: <20240502103252.1102710-1-alex.kanavin@gmail.com>
 <1d0d45e7-b12b-4f9f-be5f-89b85b9d0b41@gmail.com>
 <CANNYZj_M1e+wAbvyvn5dAfxmKrzcrC3tX2TcWNum5CqmJ0Hruw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_M1e+wAbvyvn5dAfxmKrzcrC3tX2TcWNum5CqmJ0Hruw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9127:EE_|DU2PEPF0001E9C4:EE_|AS8PR08MB9954:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f6e8d7-39a9-4f48-c37b-08dc7364d383
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Qjc4ekRYVGhocStKanAwbWp0S3M0ZGdFTXpKZGQ5eE80ZUk0TFVYc2pkajN3?=
 =?utf-8?B?ZmxWaDgxcXVJazBTblFwb3pGS0NpTjl5Z29XM1VHSmRVTGt5TzJMNWdEZGZU?=
 =?utf-8?B?TjBla3QrRmZEQW52U1NkaURHVHF3VnN2ME92KzhWa2xDajYwOG1EenJUaEhj?=
 =?utf-8?B?Y0N2cTRsc3NIRHVQSGtOTmpianRLaklvZVRFSjBvZG1hTldZdnBzV0dNMERI?=
 =?utf-8?B?My84M0wwdTlIMytRLzY3bGd2REcvUFZqdi85VGthOHJVcmFEVlBHOWN4QlNT?=
 =?utf-8?B?dVlxWVIzQ0s0TzhqNVd5Vm91eGFzNE5NWlIrY3JJSW9nNnhvMXZrN0JsbXc2?=
 =?utf-8?B?bytsaWlack9iRy9ZQ29RdERLbTljeVpUMUtxTElxUTE5QnhJcmhvZ1FxOWc2?=
 =?utf-8?B?MFRxaENnSWtxUEdLazI4aU00WlRqMGpscFlSLzNscjVtczM1dDR5akZzY0I1?=
 =?utf-8?B?bWVKQnpBZHZqd0FDMTE2Z054cEFZL01SK3RGMW1tUmhPT1VnTFBuVHdTaWtK?=
 =?utf-8?B?bmpMU2t4M3dhTUJwVGpuTnJxMC9UZW5FYmNjUUR5UmtNeDF3S1BSOUlUUmN0?=
 =?utf-8?B?K1ZCemtkdUViYmVUMWpuRHRuVHdFVUZOUlByTWdYNFhLcnpQRXFodEJQMVYy?=
 =?utf-8?B?K09raUV3aWF4SU1sdlAzUmxKK2Vmd2hpQVZYYXhjaXlwSnlzRW9uTmVCYUR5?=
 =?utf-8?B?ZWFmTEVVL2JDc2hNY3JwT0xQcWRvWW1aa2N0WmZEanRuK3NSS0Y5b3p0VFNu?=
 =?utf-8?B?bi91Z3dGTzhRWCtCbElaWDRzTHY3anExMVZpb3dNVmJnRVZiNE5NZFVvbmlD?=
 =?utf-8?B?eEc4QWZFVURWaCtBRUp3ZHF1dnlXS09kSUdJbzRzck91V1dCc1k5Z3hHMWtz?=
 =?utf-8?B?ZFg3WmJoNjlxWWdaY25tRDNYR3RzcWZBQlpweDlncGcrY3VUSVBpNnhLRDNa?=
 =?utf-8?B?NDBwKytVcFhlODczOEdJK1VrOXQxbTkzdWtTVE5TSURjTzhOMUVTU1dxSXU4?=
 =?utf-8?B?YlhkaEpJanFyNGQ2YnlOSUdENDFDRzhucHRLMFJNbWtaNzNnYmJsVWFxYmF6?=
 =?utf-8?B?N01CcmlmekdFUVFmMk5UbmE3bFZOOXlvTWlBaGpqMnM2U0tjeEJqSWtTT241?=
 =?utf-8?B?elBHdkFNMlFubkZlcEJ6V3A1czVLTWc3WXFTTEFQL3A3MDA0aGFTM3pqTjJD?=
 =?utf-8?B?d2w2Mmorb3B5TEl5U0F2MDE4cS90TWxSRit3YkdGV1J2ZEZwN1ZsMVZobG14?=
 =?utf-8?B?eXpmcVFjU1l1MHh1RXVYa2cyL2EzakdqbkI1WmRHc2liYXNWUTVRZ25qaTVw?=
 =?utf-8?B?Q3NpZUJ4SkVFVndlMW81SnlnWWJ2K1pJOStzTGpsZ3FWaDdPbVBRYTBOSXA2?=
 =?utf-8?B?SHBVYnN4ekd2RFkrNEhFR1FjRVNPSWMvdnY4T2NMcFVOZjhsdHhtNWc2VDJP?=
 =?utf-8?B?SzJzYmIwNmhyZW1nbVJxRFhNb2QvUUpZTUl6N3hldmtGLzVzeFNOYWt6bzBJ?=
 =?utf-8?B?Ky9jNzlxcUpkazd0VHU3VFc0VkZaZUQ4T2F4VWVkci9PbEJ3SmxTaVB5NXEz?=
 =?utf-8?B?QnJnY0IxaUFhRjUrSHBEalpMSHg2OWo0Y2Q2NHhiM2tETTBkSGZpa1gvbEJX?=
 =?utf-8?B?UFVuSks2T05NK25YWGRKMVFhMFNydGJVVWdNckJBMG5GWHNUYlVPNzlpelJP?=
 =?utf-8?B?ckR2WHNNQmNpVkM3em1LRDNxYXllcjViTXJDZE41ekhBRnpWVi9iUjFwendj?=
 =?utf-8?B?aC96RUxjOVdzMEZsbEZUY0UxckplMXIyMStyam5vWWM1Q1RCTU9BNHJYR1V5?=
 =?utf-8?B?Mmw4VjRGL2p0WHFmNFl2Zz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7509733A23C4B742B962FA18FA536A0E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9127
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1680249d-a4a1-4f22-3179-08dc7364ce55
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUxwaldHeHZlb2d1MzEwRWNSSDJzWEdaaHRpSTVlbEkvZmM0K1pjYk5lNjc2?=
 =?utf-8?B?YUhMaG0rdWpaTGE4eU9VdEl1QlV2Q0t4S0R1T0QyVDJqb0lKTkZYKzN1ckJr?=
 =?utf-8?B?OU8yZWtrdUVHRFJBc0J6cW9nazd1a1NlblBRT0tndHpuMkQrbmUyRGIyUzRK?=
 =?utf-8?B?aGxhT2ZSNSswbHlZdkUzS2k5eUxNWDFEeUFnaUJNZ29xelJIWG4wS2ZjalBG?=
 =?utf-8?B?aU8vZDBGRElKZ09xRkJkb0Mya3ArUVVYUFFtU0VoTmIrVHBtcnBJdTBjL1hM?=
 =?utf-8?B?MVdDaG5BKzBhSUNEcWZZdXVxd0xEK2grVVZiNGRmKzRiK2FqbjdhdktmMVgv?=
 =?utf-8?B?VEFhU2lIN29NNUFPcU83dUh4WndyME5zSXhSQ3oxR1pkdytudWRuekM4dlVK?=
 =?utf-8?B?aHpLYnpISXoxZGNoTXBqRnVPcFBMMEp0MlRGVEtHOTZnZk5Sb2hzMW91Uzcw?=
 =?utf-8?B?UVFTdTkzSXB5dG1GbDdoZlZhNHhOQ2FQbVBpN2NEOVNqQTZhQVloQUJNdE1J?=
 =?utf-8?B?RXlWQ2cwa3RIYUhqdUFhb213T2xYbWNVN1ZqNER0Z2ZGdUNPTGxKQ2FuejF5?=
 =?utf-8?B?YzVzTlNGaW1odmxabEs4WUxJMC9TMTBodlBmZzhwNU5HalI5TEluVzY0QWpa?=
 =?utf-8?B?TlYvbHZ3NExGN2pYMnZSb0l6Smh0NXE1MTZRaHlQYm00UGttRTBraHRURS81?=
 =?utf-8?B?WFhxTHM3LzVhYmMzSDQvNU93UnVtd0tMKzQzaWtqNTNPelM5QkhJZ0gxMXBs?=
 =?utf-8?B?eFM0RzlvMVB4YW5pVWZDK3FMZEV3ODBsTndiMUJNcmFlTlcrRHowWGI0OWVV?=
 =?utf-8?B?T29UZEJOL0xzYVFtaHl6bGZ4c1JDUWJKZzZMQ2JwYmRoK2dGVUtoanhvN2U5?=
 =?utf-8?B?VS9MVFVsSVQySGlaYU90WUcrQW9Bc1VsY3F2MnRESU42TTIvK2JuZERQSkk0?=
 =?utf-8?B?NDNOSVJEV3ZaTnA3ME5yWnhLMTF5bmNha3dKZi9NbEtnWWVseGFwQXpSWUVN?=
 =?utf-8?B?U3hWbE45UC9CSkpNYTM2RDNmdC9Rb01TM2xNSzdwenNmT0JCclMvaklsU0lq?=
 =?utf-8?B?N3NNOXdoTU5oUW5URGt5ZGFTNVd3Rmx4cXRxNmVidzJzMUFqemg0blNZZVh4?=
 =?utf-8?B?SHUxOTl4Rkw2TnU0Ukxac3hqZXFnTkNJU1hIREJLMElCZ010Lzd6bXpTQ3ZM?=
 =?utf-8?B?WWR4YmpYWEY4NGhuOU9qVWZNc3NjMW5KS0VxS1M2QkZFTEMwUFMzNCtyWTAv?=
 =?utf-8?B?aXpLZkNoZUJ3NzRBcHcxZWpXazVWMkxDcm10UEYwVHJ4T3huS1M0Tm5iSWg3?=
 =?utf-8?B?N01IRFN5d0FaVGdPS3F0S0JyQk5wYWNyNXFnQ2lpaW56M2hDWUpVTGFROS8w?=
 =?utf-8?B?elNrRWpmcmg0blpBVmhLN0I2OEJvVUNNTHMwK0txM2EvQ2lCb3F2L0FoeWlx?=
 =?utf-8?B?TWRXTzAyUlZFT1plSnkrUEhOU2FzUE9VVjVHZHNHeFdJNmJObURrYnlDYXFa?=
 =?utf-8?B?UlRWeHorTlN4bncxQ2IxaFJLd0QyRmxBMXBGclpId1NKNWlRdmJ3ZHIxZExN?=
 =?utf-8?B?cGNYTGRxZWNGQVhPZjliYStPZXRXMkFodlNHVnpLL1Q0dlRQN1lYRnF4VlZk?=
 =?utf-8?B?RXJqdFhZREdidEV5QzRzNGVOV05RaXhqSjgyaUZOcU11S0JZL0tmeVY2bFFK?=
 =?utf-8?B?U3hDaGpjUnkxSUNPYzRZUjhzcm5xcGNnQTB5UzBBOG1GOEROUUhieVZGcUU5?=
 =?utf-8?B?UzJzTkRHU1BDa2RYNHVENXBVdTJ6THdhRko4TzRxakJRTmlteHFJWXJTb3pW?=
 =?utf-8?B?QThITXIxUHc0OHREUDU4aEo0SnNONVlxYy9MQUt1TENqbW4rMWM3aUYzdllo?=
 =?utf-8?Q?FQ+3VaaTh+ISU?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:53:26.2319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f6e8d7-39a9-4f48-c37b-08dc7364d383
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9954
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 15:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199244

T24gMTMgTWF5IDIwMjQsIGF0IDE1OjQyLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgMTMgTWF5IDIwMjQgYXQgMTY6MjgsIELDtnN6w7Zy
bcOpbnlpIFpvbHTDoW4gPHpib3N6b3JAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+Pj4gIEJCQ0xB
U1NFWFRFTkQgPSAibmF0aXZlIg0KPj4gDQo+PiBUaGlzIG5lZWRzIHRvIGJlIEJCQ0xBU1NFWFRF
TkQgPSAibmF0aXZlIG5hdGl2ZXNkayIgdG8gbWF0Y2ggZ2xpYi5pbmMuIEFuIGltYWdlIGJ1aWxk
IG1heQ0KPj4gY29udGFpbiB0aGlzIGRlcGVuZGVuY3kgY2hhaW4gbm93OiBuYXRpdmVzZGstZ2xp
Yi0yLjAgLT4gbmF0aXZlc2RrLWdvYmplY3QtaW50cm9zcGVjdGlvbg0KPj4gLT4gbmF0aXZlc2Rr
LWdsaWItMi4wLWluaXRpYWwNCj4gDQo+IFRoYXQgY2hhaW4gaGFwcGVucyBvbmx5IHdoZW4gZ29i
amVjdC1pbnRyb3NwZWN0aW9uLWRhdGEgaXMgaW4gZGlzdHJvDQo+IGZlYXR1cmVzLCBhbmQgdGhh
dCBpcyBvbmx5IHByZXNlbnQgZm9yIHRhcmdldCBidWlsZHMsIG5vdCBuYXRpdmUgb3INCj4gbmF0
aXZlc2RrLg0KDQpUaGVyZSBpcyBhIGxvbmctc3RhbmRpbmcgZ29hbCBmb3IgRy1JIHRvIHdvcmsg
aW4gYm90aCBuYXRpdmUgYW5kIG5hdGl2ZXNkaywgc28gSeKAmW0gY3VyaW91cyBpZiB0aGlzIGlz
IHRoZSBzb2xlIGJsb2NrZXIgZm9yIG5hdGl2ZXNkayB0byB3b3JrLg0KDQpSb3Nz

