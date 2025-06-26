Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB205C7EE33
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 10:20:01 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.66])
 by mx.groups.io with SMTP id smtpd.web10.4946.1750933192644115060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 03:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WvZfEDVC;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WvZfEDVC;
 spf=pass (domain: arm.com, ip: 52.101.69.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PXUJg7xPFjZHeKWf/k2w2oE7sXcMWEVjj6RouKuEuo5l0qAmzeuuAtlFJg28WEOaZUhirBdlvw/ntRAtJNNJw50lrgqAK8D9s6yixEUmBwX688KiD5+ziezJMtjHZiLpJ7MxiZ94WL9AvgpaynYttMkXogYo7ZLYVPGfBA/J121lUCUsDB4PHnd1Ym1y4SndLFJK9Km0kX3TO1kO3FVAg6SEQ1HKGGka/tocin4TlOHWhERNwb4RGMs97mYSHxgVhaaEpeRjlpGqUOGSnbu9X8RbXcDszmweyOk/9ATNsrGZ03wSgk+aKZLyUvxHG1UE+67HUNXC37WMKEfqb50zNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbdwJbwJXWYQT+rJuNc9ffKBx4a3nsRyRoCN2kpk/Nk=;
 b=wzZMyfoRE2mjjlzAvFj/GmeXw6vdKDZPFeKvI0MpFmg5TEwFFwl4uAh6f+tycYq2L74dWcsYrQ5snU3zdJxsvM+IPlKsWtqyEFfjGYpVxVNP8EmwHHD1zjTmmD6JQERPnsth3Q1EIZBcZZe6aDulMFYbUZEAuo1Nq5bvKoX7hEsaeS8igsMi7K5uQtMl+/JJi6R0RyPiDKsc6ia3NMIPy1Rj1PaE2xAnh7W5eU6Qc+UcSI8V+1vNk7udUJBUnlX60av+BMSHc+Z85mOaEIKfOf7AwtqpgE1LhFcoY8gWiG9hzalAstWNMAPgsLSnhtZcp9/tAzu9w5cCUne0BpuQLQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=navimatix.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbdwJbwJXWYQT+rJuNc9ffKBx4a3nsRyRoCN2kpk/Nk=;
 b=WvZfEDVCyM/GhMxDZDIBVesSvOcJjCmjbrWCHj9C6eDeWWrD/gvdV+xNeqcZ2asCQqsv8i2y74OW6adzfQ92lxDv+QXARQcHqluE6QtDOqGR/Xfdtl5yE2uTIVVKpkzdvgObuXN+N0VsmcUfrMQBDL9TTKwV3PFF4jFv9iJxBs8=
Received: from AM5PR1001CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::32)
 by DB8PR08MB5435.eurprd08.prod.outlook.com (2603:10a6:10:113::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 10:19:49 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:206:2:cafe::bd) by AM5PR1001CA0019.outlook.office365.com
 (2603:10a6:206:2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.31 via Frontend Transport; Thu,
 26 Jun 2025 10:19:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Thu, 26 Jun 2025 10:19:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koMbMHkYHRASw7o5u8dGtn6SZsRrOxA3DZ00VpZE+f5SrfMMAnmYEviE1ShlHTX2QvyJEsSmHEtDX5FkqwHF9tvnYHGIZvN+4G/WV+tywZq8DRE5DhvYfA5jXhIw7LpoenUeR7O5DfpSxb8bjjpAF2Ope+/l5iRMlH2vyqwJhr+8Sokwko8+3VOhyLqgFpAs0IbXUBFuL+/MnrxTvMz9koV0bD7zTCkBOslHyxkE0jHERF2ZYPg60q7Z8REoZpOvQlf9VPKDxt+gx8P7k+7VoaqNSE0/3E+uTaxyMJ6/1usfF4qt1aj6yIr42+8S9J5v0Zv+7vV/MnbdxZRZPLU9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbdwJbwJXWYQT+rJuNc9ffKBx4a3nsRyRoCN2kpk/Nk=;
 b=irXOrY4lc2JpKPHwNyjLJS1oTQErVB2eG2OY9bmGq11ucsWDCX2mwmlgJhkWKG/mw3bMu1nC2X3BgdMD63ErCWExM6AG5bbblBEqGczL6rL9jQ2Z/oevAGU7luHmdIsZDaohGYnl8/Et5z1C4anLOfgN1gvgiUENMAjhbFGTOqQaCp0bXH1adHYKU9oYomkJE2GlXHKnjQeli5ODMRgCajhn7uIbqhW1LWjEXNoF4KQR6nSzTz2uwZjRW339Q5YT8eSOhS8EaM4XxrmdqZ2kyeZahcjLd9VQ9MlW66fYJV1y5eNLJtfyT11gSG6LfTipTns9McVXUjOEYH9yvF693g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbdwJbwJXWYQT+rJuNc9ffKBx4a3nsRyRoCN2kpk/Nk=;
 b=WvZfEDVCyM/GhMxDZDIBVesSvOcJjCmjbrWCHj9C6eDeWWrD/gvdV+xNeqcZ2asCQqsv8i2y74OW6adzfQ92lxDv+QXARQcHqluE6QtDOqGR/Xfdtl5yE2uTIVVKpkzdvgObuXN+N0VsmcUfrMQBDL9TTKwV3PFF4jFv9iJxBs8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10733.eurprd08.prod.outlook.com (2603:10a6:10:526::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 10:19:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%7]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 10:19:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pg-core-weston: Downgrade weston-examples,
 wayland-utils to RECOMMENDS
Thread-Topic: [OE-core] [PATCH] pg-core-weston: Downgrade weston-examples,
 wayland-utils to RECOMMENDS
Thread-Index: AQHb5QAAK0jquLzQ9UOZcVpWxVvtWbQVPXkA
Date: Thu, 26 Jun 2025 10:19:13 +0000
Message-ID: <BA364652-4074-469E-90CB-619EB371BD7B@arm.com>
References: 
 <bc74d25252859b33cf6d31e427766e8b55ee3ea1.1750766586.git.joerg.sommer@navimatix.de>
In-Reply-To: 
 <bc74d25252859b33cf6d31e427766e8b55ee3ea1.1750766586.git.joerg.sommer@navimatix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10733:EE_|AMS1EPF0000004D:EE_|DB8PR08MB5435:EE_
X-MS-Office365-Filtering-Correlation-Id: d4920cac-0fbc-445b-da87-08ddb49afb0e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RHpMdWF2VFNtMi95YWlNWm00d1JmSUpYUGV5Vjhpbk1NRk5mNHIvbFZuS0Rz?=
 =?utf-8?B?NW51N0hvK2lTOEwyNCtzQjJvVXFpOU5CbHZva1JWY0d0VjVHb3ZjMzFYMFE1?=
 =?utf-8?B?ZGxKQ28rSytpZi85NTkycDBCRkNKQ2k0RkVzNk9kZDJpUnUvTTF5SjNVVGlN?=
 =?utf-8?B?UkxaVEoxN2lZd280cHppZlM0OTFWcEVrbkZFcmtzd3BDTkdFS0pxOVRqSmhN?=
 =?utf-8?B?UFlkQklNa3QvT0MwSXZXSDBPTDlNdzZRaWlmNE9idG0zUXRocUhEcEl0eTFG?=
 =?utf-8?B?TW9JdjVoeFF1NThXNGF2d0dpU2phQzRyM0tmelJZalVLYmV1ckdxaXFWaWYy?=
 =?utf-8?B?VmptbHN4dE5SQ0dLaXF5eldpNW9abkh6MWdWZFpkZ3hRamcxeHVUT2FvT0Ra?=
 =?utf-8?B?dlNEWDExa0pCQkpDUlpqM1Z5QzgvcVBJVVN1K0VQU1FMU0hDdDlBaUxpbUR5?=
 =?utf-8?B?NHVUWVNhcGhkUitrd1phSTVXYk55WW5NcGNrWmJ3Smd4aGZlY3VyV2V5cHVG?=
 =?utf-8?B?RlU0b3hnQ05XNCtkdnNnR0VnL2hZbDNHb1YxSVBlK2tleGcrRjVSYzFPM0xy?=
 =?utf-8?B?clZMWnZrWTU4L1d4eE01NlRNTmNGZmlKMDRjMFN3Uit3U0tzOGVDNTcwRi9V?=
 =?utf-8?B?UHNWZk9nTE5uZE0vc2QvbmFpZGs0K1h6YVVpaTc4VXBDZTNjbm8xaGViU0gw?=
 =?utf-8?B?VnpoTUFqNGZWd0pjdUZQamQwUFBxMHFwZVpxWFBYSXBscXJIWWRMOWlHTDhE?=
 =?utf-8?B?SDF5THlSMG5ubmUzMmNPbE1nRk93NXlpMFNSWnZ2VjEzcTZScGVOb1lBWllO?=
 =?utf-8?B?dlhEaUZwVkg5dEhXV0ZXRkszTmhrSHZCaXg2OExVSjBQcmNtNXM4RWRVeVZ4?=
 =?utf-8?B?Z1NQOHA3eXBocXNVYWZBR1VicXV4N1JyNWhwenR1cVdXbmx6S1h6YlppTXlk?=
 =?utf-8?B?Tk5JeVZnSzFIU05JVXVXVjBQRmMwTW53WXBTNFRXNU54UVJtNkg1Mlh6MlJa?=
 =?utf-8?B?NkJqdHFXMksrbUdUWkFsalNuTFliV2dMN2Zsd01Mc3lxRVVJVkdKb1JoOTVv?=
 =?utf-8?B?Y3FsNll1T0hWVmZrRUpYbG9VMW0vcUUyY1JXYm9vUGFManR1Z2ZWdUNQd3ZX?=
 =?utf-8?B?dFpsNzdyVUpXTVhackFTdGJSYXJyMFZLalEwVmcrNzNaaG9TblVTZEthaFVy?=
 =?utf-8?B?TlJpa1RSQzltMENrb2k1RFg0TFNUNFQzMVdYVmVHRXE4N1dhdFJyZlBiNFFh?=
 =?utf-8?B?c2NKS2dCWGdYU25UN2RqZWVXY1dGUHJ0SkU1YzhrNHlXSE9XVXdaL0JqSUtB?=
 =?utf-8?B?all1TC9MWm82RmVuY3ZVb3k3MHVWN25YYms1VGlXU3o1Zzg3b0RwTWgyZ0xq?=
 =?utf-8?B?bnJqT2QrWGFaN2JIb3VhaHBEL2VjK2VVTkNjM1J2dkNLU3pRcDRoajJwNnhy?=
 =?utf-8?B?YnBSYWJiQlRIVndhQjJ5MExPQm9seEdsSm1TZ1htYlVwdHpIdG50bGRodThL?=
 =?utf-8?B?MDBTQ21ISnlCdVRhNXRuVnNzVS9ndFFlUEVIOVRQY213aFZPajExc2R2azJJ?=
 =?utf-8?B?YzFiYkpwTWd0MUlMQVQxNXJRd3dULzRydUpSc1Y5VExGUmNWRGFKclE2YWpy?=
 =?utf-8?B?K3JrZ1d0MUNEREY1Yk1ScVExQ0p6ZStIR0xoVWJPK3FCdzBRWFYvY3VqTTBH?=
 =?utf-8?B?SVZxZ0lacFJHVGRNUGkzQXRGOEQ1Y25qb09Xa1FiTEVzLzBxNjN0L2o0V3NI?=
 =?utf-8?B?azF6SU8rVEtxOXlwVGJWN3kya3hnRmNjRlZLc0s5ZmVRTy94STVhd0hOTDhD?=
 =?utf-8?B?Zi8zeTl0ajkvaHZxQjN3cjIrQnVqSjlUcU1CcCtqeCtjSkdCdk1uREdHRERY?=
 =?utf-8?B?SlRkRjB5dUdEcm5xZisxM0tXUm05bDVDK2FvSThzNFIwdkFqcVlhVVhGRVQx?=
 =?utf-8?B?NlNiNlZFcFRlTytsSW96a2tsTVZ0QzhlcG9xL2tvT0lhL0IzT0lOZHdybWFY?=
 =?utf-8?B?KzV4WmN1MTR3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <630DD48D06C57748B1A230A0E17C0F42@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10733
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	19c63b2f-95dd-4858-3159-08ddb49ae5e0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|376014|14060799003|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YmdabnZCZ0oxaGdpV3VmckEzaDhKUHdDR0x3ZzNiNzA1bkNrWGRvWG8rZDZB?=
 =?utf-8?B?bDhoS0F6aHZVc1Q3YTM4Q2pTc01IUTVkd0VYK1ZMWVA0NDNDMUdNSThMUTJw?=
 =?utf-8?B?SEJqV0NoWUVqVU5LK2lwMHlFWEVneEFHWHVaTHA5alE4Yk5Ha0tsQ2tGaEMz?=
 =?utf-8?B?VHluLzJJZGlaWmxMKzkyUGV2Z0F6QnhyNW95anhLZWRSZXNlMEIweWIrWWZK?=
 =?utf-8?B?ZHpMUVpZME5ncWNOTS9tbkRRS2VoY2NKWEx0REdBWVlacFhXYXpWL3pqam5M?=
 =?utf-8?B?djVaMUhYZXpPdThBZ2ZkYWUxRDc2aWJZQ3RkOFNnSGpJaE5mMVpkYXA4Qzh2?=
 =?utf-8?B?aDRtWlMvRVppR2huRldxSzdsSEJRWGNHMkV2YUIzSVhLcWRERlV1a3hPemll?=
 =?utf-8?B?dllRVVBYamE3ZktrT3A0UUZCMHpQNm1nbUVhamlWR1VzclhtTjNoVFo5VHBi?=
 =?utf-8?B?b3FTWS9OMUkzMHRWV09pZlhUN3dTZWdTb3AvT1JjSWJEcE5jMksrYkpDMEpW?=
 =?utf-8?B?NitGRFBablRJd0d2NG1paE1SN0g4QWhjRnJubkNmRG9RZ2JWOGx0U3BoZkZw?=
 =?utf-8?B?TWU2VndTbkQxKyttM2FhelZSUXhna0NFZGh2cUN5N3ZYZzkwSFJCR0FPWVVH?=
 =?utf-8?B?dit4VFgvd2lQOEF5c2c2eG4wYVBFNEZtZ3pYWktESVpZakRRemFiN3Bmcmwx?=
 =?utf-8?B?UzYvQmlWSytFb3lRd2EwYVRTZDV4VXRhaVI4RGdqdkFkNXpkWkgzcWl1aWVW?=
 =?utf-8?B?WWJqb2xZZ2ZkVWhYWitBUStualU0c3VVZkswSm9MWWxtdzkzaDcyQU4xZlBr?=
 =?utf-8?B?Yjg2Nng4eTQyNlA2UENpVVlGRnhkZzlGalUxU3VsWnJoK3lLRk5MVkduVTYy?=
 =?utf-8?B?UG5TUU5XMlduTENZNWNYRSs4WExQQU10TkI3Z2NCVGpWdUgwdCtuOHl4QjRU?=
 =?utf-8?B?amRSQThiV2Q4MlBFcUV4dUQ3Q291ckw2ZDhEb0o1VzdTNHRxenZwL3krSDc2?=
 =?utf-8?B?RnpZc0FnQllqQW1pdFF2NGU0OUxKbTJ4N0NyYlFtdUthUmR1aTgzZTZHcFVX?=
 =?utf-8?B?UzhDOXFzTUhnTnB5S2YvVUpjMklkbUp4N1ZQS3dkbFJKRzlXQ0phSGZMSnla?=
 =?utf-8?B?QWRmMm1BY3JaUmhSVkxUeHJ6ZStYTHFYYk0zNFZxT0c0YWxyQ0NOY0NLZ0pu?=
 =?utf-8?B?ZXQyNGNmRlJXWG1sZG1xZUtWWHJsMzNqKzV5SEdiRmxLRGlMaEcyazd0bHZx?=
 =?utf-8?B?VitCL3gwaGwvQ3krUEh6VUlEVngzYUEyanNtL2NPQWY1UVdFdURGamFieFM2?=
 =?utf-8?B?eFcxL1psQ0YxU1lGbFd6OWkzb3VqeVloc3NKbGpGRTFaREpQeVFmeE5ocUh3?=
 =?utf-8?B?VFJxQTJzNnNnTmp2QWMrcFJjcllralVyQnNSL01EeHVQa2JmakJYS21DYXMz?=
 =?utf-8?B?TTRrTXM5eWNrd2NKM1YyRUVEUllyZ1I5NFU1UmFsRktpNFR0TEF0WTFZeFpF?=
 =?utf-8?B?ZFp5SGxTU1hyTVJCek92QU50aCtONEMyVnlqUVdoY3lMc3NYUUx4U2RhaWhL?=
 =?utf-8?B?TWlnV0xTUjArVUpMSHVSZ0gzY1FHdHUxQnczSVUvdFU3bXlMbFd0NkRtREtq?=
 =?utf-8?B?SlBoY0dic1F6NkZuTzZvYTZyNFFsMll6bjNjWUdOVnFCc3dlMVA5TXdPWmxh?=
 =?utf-8?B?TmtSS3FMNUJQaWY5UklDaXhrQWgzVnBxMmlHOC81ZWQwZTB5cDFkL1NFb3RW?=
 =?utf-8?B?T25wQ1FPMW1ySU5lMjN5QlJVck9lL0JSc0o2M2ZZaWQyQTZ5ZkEwc2lXelNZ?=
 =?utf-8?B?NnhDcGlJbXZCSDFmVjJmLzFkcWFiTW1YYis1SzJyWFhYdWhPZFY1QjNsNWNj?=
 =?utf-8?B?U3F4dk53VnpWenlRMngyNFJzbytwbUwxbzA2ajRkWFBRbE4wN3VoVEhYbElw?=
 =?utf-8?B?clRkcGZZYWs4K2hGVnNaRnR3Y1JEa1RxOUhyTTVRSmRtMUo0enZteDBZUjJx?=
 =?utf-8?B?azZJSEpDYnEzU3lTOHFwcUJ1UVlYWFpWbjVrbHNaUkJCVDh1bmNiQVl5Rzc0?=
 =?utf-8?Q?Dy6OHk?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(14060799003)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 10:19:48.6086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4920cac-0fbc-445b-da87-08ddb49afb0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5435
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219342

T24gMjQgSnVuIDIwMjUsIGF0IDEzOjAzLCBKw7ZyZyBTb21tZXIgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGpvZXJnLnNvbW1lcj1uYXZpbWF0aXguZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBKw7ZyZyBTb21tZXIgPGpvZXJnLnNvbW1lckBuYXZpbWF0
aXguZGU+DQo+IA0KPiBUaGVzZSB0b29scyBhcmVuJ3QgcmVhbGx5IG5lY2Vzc2FyeSB0byBydW4g
YSB3ZXN0b24gc2Vzc2lvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IErDtnJnIFNvbW1lciA8am9l
cmcuc29tbWVyQG5hdmltYXRpeC5kZT4NCj4gLS0tDQo+IC4uLi9yZWNpcGVzLWdyYXBoaWNzL3Bh
Y2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLWNvcmUtd2VzdG9uLmJiIHwgMyArKysNCj4gMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1jb3JlLXdlc3Rvbi5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1jb3JlLXdlc3Rv
bi5iYg0KPiBpbmRleCBkZDMwMmM4OWU3Li44OTBlNDQyZWRiIDEwMDY0NA0KPiAtLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtY29yZS13ZXN0b24u
YmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhY2thZ2Vncm91cHMvcGFja2FnZWdy
b3VwLWNvcmUtd2VzdG9uLmJiDQo+IEBAIC05LDYgKzksOSBAQCBSRVFVSVJFRF9ESVNUUk9fRkVB
VFVSRVMgPSAid2F5bGFuZCAke0BvZS51dGlscy5jb25kaXRpb25hbCgnVklSVFVBTC1SVU5USU1F
X2luaQ0KPiBSREVQRU5EUzoke1BOfSA9ICJcDQo+ICAgICB3ZXN0b24gXA0KPiAgICAgd2VzdG9u
LWluaXQgXA0KPiArICAgICINCj4gKw0KPiArUlJFQ09NTUVORFM6JHtQTn0gPSAiXA0KPiAgICAg
d2VzdG9uLWV4YW1wbGVzIFwNCj4gICAgIHdheWxhbmQtdXRpbHMgXA0KPiAgICAgIg0KDQpUaGlz
IGRvZXNu4oCZdCBmZWVsIGxpa2UgaXQgZ29lcyBmYXIgZW5vdWdoIHRvIG1ha2UgdGhlIHdlc3Rv
biBwYWNrYWdlZ3JvdXAgYWN0dWFsbHkgdXNlZnVsLCBiZWNhdXNlIHlvdeKAmWQgc3RpbGwgbmVl
ZCB0byB1c2UgTk9fUkVDT01NRU5EUyB0byBzdG9wIHdlc3Rvbi1leGFtcGxlcyBiZWluZyBwdWxs
IGluLg0KDQpIb3cgYWJvdXQgc3BsaXR0aW5nIHRoZSBwYWNrYWdlZ3JvdXAgcmVjaXBlIGludG8g
c3ViLXBhY2thZ2VzIChhcyBzZXZlcmFsIG90aGVycyBkbyksIHNvIHRoZXJl4oCZcyB0aGUgY29y
ZSBwYWNrYWdlIGFuZCB0aGVuIGFuIC1leGFtcGxlcyBvciAtZGVtb3MgcGFja2FnZSB0aGF0IHB1
bGxzIGluIHdlc3Rvbi1leGFtcGxlcyBhbmQgd2F5bGFuZC11dGlscz8NCg0KVGhpcyB3YXkgdGhl
IGNvcmUtaW1hZ2Utd2VzdG9uIGNhbiBzdGlsbCBwdWxsIGluIGJvdGgsIGJ1dCB5b3VyIGN1c3Rv
bSBpbWFnZSBjYW4ganVzdCB1c2UgdGhlIGNvcmUgcGFja2FnZWdyb3VwLg0KDQpSb3Nz

