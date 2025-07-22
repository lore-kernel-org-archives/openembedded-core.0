Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D68CC83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 12:25:23 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.21])
 by mx.groups.io with SMTP id smtpd.web11.11347.1753187114556068908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 05:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AR0LmBlf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AR0LmBlf;
 spf=pass (domain: arm.com, ip: 52.101.83.21, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NsnjWfgysqLIKC1Cb6Hgk8p/wGXAqKng7d53gl/oHJ681r6W9+hJy8NQe218jTRGCt4eFez7HmlqrQ6anjBwQ5p59aPQkSobzolfn3dt19v6dp7Z5JGrdD03ZqSxsHJeNsETlMg04cirGhRcVZvAoZQZfrzh+MH4qnXgMCtmsfH1a7Y5JnJwxXdFILH8xWXKAkch/HauVsAhnk/aWVz3UzXhjmnKMesvofuX+8JBCu2jgJ5n+hsTaN9eLyX5o5PvSLRN1EE8ROPWyl6IwMSM6wIrvLFf9eV3naeW6vYF/QTDWV1GQuawoiY9CqCyAs6Chk6XptAhPeLHy/bBxmisng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIf/vqMLzjiXMffQKwmlvb8SR81B979p/jL00apk214=;
 b=f0jrKB0roLSFAIBuJB3QjMJEyT06nZjUNBFcGv5eR4mJjvNQIPVbqqPuXKUYtmGd6E46WidEIN5rg3khOIa9Zh3uUyzSWabybQKAgULYubz5+USlCMA5llSXghCw7++T4FvN+UoMBjX+FP5/d5/kpIHgCM5P4fS6I12VfNi26UL+GVBdifgvCQbsXfAn0kziXFViCq2tlHTtZqInUsUiyPokwK848aPixHhhlvdK3YVkER2n4oKWaqlv5KCzt3yp08E/wTdAZx3XIhalhub9iRaKSW7CoXkaZEUSjXbcw/NhJjQUxE7Qk13Z0Pm4my8/a8vKp80neLfnzaqHuSXDFQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIf/vqMLzjiXMffQKwmlvb8SR81B979p/jL00apk214=;
 b=AR0LmBlf2S/WdvJQdoAEAMKEwqqNuL6a/zMM788v36EetahLo4Ei/7K0Qt/nswV/ojxJ/Z88w9yrkvjCSAnC4dTq91nkei3YZpCpVT1SJkZ+EJMMIPiKXQSWH+E3TBhzXbiRatl9yOfA8lT5PIBybhqrUjvURZqCBFvoqLdDFQQ=
Received: from DUZPR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::20) by DB4PR08MB7935.eurprd08.prod.outlook.com
 (2603:10a6:10:379::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:25:08 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::b1) by DUZPR01CA0026.outlook.office365.com
 (2603:10a6:10:46b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 12:25:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 12:25:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQHYExsyhVUFb0NVzGhAPUWCHYWd5Dvh3Y44H7cZrVNnB2fwzrCrMcyWG1sp3sSlzLg6Xagpjz7Cp6VvIBu7Ffh3iQMdr1VDAxtzCNz//zjepIvyJrkiuxnl3vIBnXeRwZUJ97vmFGUaXxReNNjFQrwPT9SSTkDBs5Fg1aIWKA3i1m5c5UEQif+QI/cpouhT/uoH1vDww1KcaDn+XFlIhTDLzV5qosEH8tBI7R1FsRW8TuQ8FFNegDtYwqULk0x58lhazHHFOxLWmPjAZ4tZPgcbwAsJCyxX/Mf1vVp80DB+d3kHboeRy2fbqHRdAUq2FnBJXc2AWC9Be7mESpSMGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIf/vqMLzjiXMffQKwmlvb8SR81B979p/jL00apk214=;
 b=xSGhfVUJhz06cgpK2B1XQIjx8xN2LMXPBgRNnvN8gOhU6scl7sEuP6JiFpHfCwuic5judwB3UypPDHke3xiAMveoqjhQCwNAnr578/8AcEFq2ASKzgj4izex0HO5XdXkjGecemJBGlJ6H19I4l6RXn1tM34CFJZ8m+9aXP7kGb0nzs+PFqk91toHbVfE3kdr0LwepcAccbEAZvl4GVh7dsKsir8bqQ5nXlHXEyLYrDC6a2O55BwaG18m4mNCI/CdU4JIxTzi5cns/bM+TlbuBmfBfHqn40pMcIctu6cJF59XLgAvQkhc/JofayMNosxaEz+xofx/11qh19DLjVTSjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIf/vqMLzjiXMffQKwmlvb8SR81B979p/jL00apk214=;
 b=AR0LmBlf2S/WdvJQdoAEAMKEwqqNuL6a/zMM788v36EetahLo4Ei/7K0Qt/nswV/ojxJ/Z88w9yrkvjCSAnC4dTq91nkei3YZpCpVT1SJkZ+EJMMIPiKXQSWH+E3TBhzXbiRatl9yOfA8lT5PIBybhqrUjvURZqCBFvoqLdDFQQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7329.eurprd08.prod.outlook.com (2603:10a6:150:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:24:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 12:24:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Quentin Schulz
	<foss+yocto@0leil.net>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Markus Volk <f_l_k@t-online.de>,
	Trevor Woerner <twoerner@gmail.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH RFC v2 1/6] mesa: move PACKAGECONFIG defaults to recipes
Thread-Topic: [PATCH RFC v2 1/6] mesa: move PACKAGECONFIG defaults to recipes
Thread-Index: AQHb+ir1ENF1oeXfakSMROC6sfl4p7Q9toWAgAAo9gCAADNJgA==
Date: Tue, 22 Jul 2025 12:24:31 +0000
Message-ID: <EDDCE519-9576-4E2E-B7D9-20EF571A000A@arm.com>
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
 <20250721-mesa-libclc-panfrost-v2-1-f713d0858949@cherry.de>
 <5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn>
 <91998d10-a656-4ccb-bcf8-2670936b0d09@cherry.de>
In-Reply-To: <91998d10-a656-4ccb-bcf8-2670936b0d09@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7329:EE_|DB1PEPF0003922F:EE_|DB4PR08MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 158f5500-00ca-4b2b-b220-08ddc91acbe6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aXVKbE92dXAvNVBSZ0hpUm9jRVcrUjNMYkxjMjdSZDBETm4wbFFlSHpkcktV?=
 =?utf-8?B?c090UHk0TXVZTjNEUEpJSU1FVm9sOVJJdmJld1pCN2ZoRGFaZ1JkQTZqdFFN?=
 =?utf-8?B?aHl1M2RnaFo2VXNaRFdRVDJ2UjVDTjNZRHQzTXBRZHJ6L0JKdzdjQ21XSkVW?=
 =?utf-8?B?ZVprWWxWMzF6S1BmRWxLamFtTk5sSDlBeld4Ym1JbEFMYzlTcmI4QmxyRCs4?=
 =?utf-8?B?dWozK2FnT0ZGanlDWUNkZmFydGpXK1hEZjgyWlFaZlNIWDdNQWorRlZwNi85?=
 =?utf-8?B?QUQvbXdZVWllR2RSNTZJbUhpYkdHQkswTWI3UDlhQ0FLLzdmQmR3cUhpQ3dJ?=
 =?utf-8?B?LzUrQ3NKbTBHM3dIQWtQSkpqVUdWYTdlWVZ2ZFE2MjhvWnBmRE5OUXRQcUph?=
 =?utf-8?B?NWRPNFJsN2NkbURWRE0vVEp6UnRLUlBLWTJkTjVLbGdtSHRJTEFZOUQzd1Vy?=
 =?utf-8?B?R3JPWUJzK1BucndBcStpdVY2Qkh4dU8rVEFIeFFGaE45Z3lOZW5mQ25XUmNE?=
 =?utf-8?B?SjQxTlE3b0pNbktjcVlGMm1OUURVYjZUdmRmcnorYnNwTnh3YUwreWFPMnA5?=
 =?utf-8?B?TCtVZXRDOG9LNldiY29wNDJzK3JuOGxXazRjdmZiSitPemZTQXFOWG5nMXV0?=
 =?utf-8?B?ektNMTJKakFJVEdxVkE5T2ZmK3BrQm9ZL0hGK1YrVkMrY29JWDRoOTJLcnFy?=
 =?utf-8?B?bDZuK2JaZkcxQ20vZjBvUDRNQjhQZDJnaU9mZ3c2ZWROakhjaXBFZ1o5RnU3?=
 =?utf-8?B?MTFoWERMbHBSMmpMcnJKMTV5VkcyZ1RZV05jdUp5SjRxVDM3Z1c1SndzdWpj?=
 =?utf-8?B?QXR4TThoQm9FaFFjSTJ1YUNZU0VJVGhuN1kzL1E2L0RUNFZjc3VOemhlcXZO?=
 =?utf-8?B?eUlKbXVtUTcwOHppYWQ1eW5xZmJGWVpPQTFwYkJkZGQ1bTRobVZxQWpaSzNW?=
 =?utf-8?B?WEx4WUhvTkZFR0QvUEVyZy9YRjhLK1MzSFd1dHR4ei96aXpvVDZFalNpdkdK?=
 =?utf-8?B?c0YwaENHeHNEME0yaDc3UkQvS2NFSVluYVlmS0ZkNURDSkxaNGZwakUvdmJC?=
 =?utf-8?B?SHNkd21zQ2xVeUFxeFBsSUlUT3I4eXNtNnZFM0RQeDJNQW0vSlM4QTlmUG5V?=
 =?utf-8?B?UHA4ODdrMncxU1BySkJFYzZueVo3NVJvYStoY2ZtRUI2UERyamFMV1ZvL2Mw?=
 =?utf-8?B?RTJzNUxBaE90VjEyZUcyNVh2a0xjdm5YWWFQaFNyWVd3Nlk5cVQveVMyeXEv?=
 =?utf-8?B?bHIwNXlPdkxtZmxvZldVOWtVVUowbGRqS2R0bmJFVHRSR010dDlPWU9QWjFK?=
 =?utf-8?B?Rk16dEZyK1FodllNTjdiNXJRSlpqckFlNGZlcEZEMzh6OXhNRUxQSDljdnJx?=
 =?utf-8?B?RjQ3M0VRVmRUV0d4cXlMeVJVSC9rUlpNalhHemUrMUlLVXdtWUgwb05VSVpT?=
 =?utf-8?B?ZHdqS2ZIQk1WWWFSektNOGlxUVBHNDVIR3FDVjRYa3R6dUtDTEJMUjFjWXIr?=
 =?utf-8?B?U2IvalBCSEJxK2IzM3lPbUxXS0JqS3M3Vlp4N2xTWktMamJ3MkxHUHBkbEN4?=
 =?utf-8?B?UFVjU1RXYit1Y09kSTRHUXZJN0ZmbmthNGhlTHA1SkhCaTZWdms5ZlVNaS81?=
 =?utf-8?B?MzFaQ3h6aGRQYzMzekNMa0t1Q1Y0M0hGTmtLbmxyZlczaEVYVVhTTXUxVytw?=
 =?utf-8?B?aWtYRWF1N0p1UlBPYWxDWW1BTm51SG1ZMjJUTTBrdndQdDlPQjFJTUxlQmky?=
 =?utf-8?B?Qm1XM2psai9mdUswcE9hSDZRRUl3YkVZTkRoMjJkT1NOZmpVNkExQ0dJdHFD?=
 =?utf-8?B?cmcwZnFFWklNTEpyRTFMYllTcGFjcXdhNGYyQjVKRzNLTXRXQ0R2RStYY1My?=
 =?utf-8?B?R1l3TXpSZElxVE5SMFBhR1dWZ1hDYi9vNFVVaVFhZ1RLWkduRmhYMlFtTEVX?=
 =?utf-8?B?bUZFT1VQdkQ1MFZCOXJVc1J4NlNJaExabzJwNFhVSkZTbUtsOTU5NnVaMHFt?=
 =?utf-8?B?QUJDdTMzdHFBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <611BAB52B98F8241966FED4A3B6CDCE6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7329
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7ee3dfd1-8a76-4f7f-6f30-08ddc91ab626
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|36860700013|376014|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YS9vNTJRY0Zwb0hZeHhDWHdzTkdkeklrd0RkWjRIYktKQTd0bExaaTV1b1Ir?=
 =?utf-8?B?d1E5NlJkMENjSVpjRllwOXA2U2xidFRMUERtMExrcGMvcUFIMjE2WDY3aWJH?=
 =?utf-8?B?SGxpRGNUMXoyQUMwZjBCdVVIdk9Rb0tRQVArSmoxdW1iazQ3NkNYOG1lMEFq?=
 =?utf-8?B?M214V0gxaHlPWlhXVzI4OFRlMUxrVjYrQ0Z0eTk2Y2xORURLc3lpRDZkMVht?=
 =?utf-8?B?MUJJcDNqZTNKcHZxZmhiUDc1MmFDd2RINnkzZWUwbTUzU0tGcnZ3cDRuL3lO?=
 =?utf-8?B?ME5zU3FCVzREQ1hZLzVBQXplUnlnZzRrbUlSaGFReVozaEt6N0FRQllOa3h1?=
 =?utf-8?B?cEdUbDd6dTNEQWRoVE1WYnUwZUsvaGc5Kzlpd2N6Nmxvc1pVVXJydHllYWsw?=
 =?utf-8?B?N3BpbWFFTUI5ODFhV2RSQ2ZGWHFHd2ttbjNGZ05ZV2xhZ0ZaY0Y0MVUyY0F1?=
 =?utf-8?B?ZUZUalR6OGszZzRyMVl3MkkvVG42T20zTjRpMGNPd29aMGttYkJueVZaYVht?=
 =?utf-8?B?NmJIYzdEWFdsT3JEbEtPOGNmZXNvSlpjeE4xNTVTTHlkVTY1MVdCTjFtMHZG?=
 =?utf-8?B?RjRiL3BTNG9HSGVMRjl4WkVja0M1OTEvdWIxeTQyTGFDQnlESDlGbGZlcXhq?=
 =?utf-8?B?SWc2N0hyTmFBQmsvTlFpK0RnMVZJQXMvNHoxc2JSRk95a1pEQmZZZS9pR29G?=
 =?utf-8?B?VVlVcXdmRkVDdS9SdFhObTBqZnlZMmZUcWc1R3FycnQ1RXE5YW5PRE1tR3JO?=
 =?utf-8?B?M3IyaUVwWjV2UFBvbWpvWW1MMEtNMDRjNEtzQjBCTUpsbXFIMkROTHI0d1FX?=
 =?utf-8?B?Nm1oOFFrWk9NUHk3YnBNbitraDREcVlhTmpDNVRXLysxZ2RhNXVSVUdraHNI?=
 =?utf-8?B?UU9vcjRreVpvOWsvaklLeHdyMXVJc1FEbk5ZN0laWkJxci84dENxRHpWNU8r?=
 =?utf-8?B?amZ1blA1cFhjNnl0Rm4zQkpHU0w5YnBoOWlSaC8wYVJvM0JhZ29RNUpDbGV2?=
 =?utf-8?B?enJJTCtFWTJHdGdBUDhTVkJ2WTZDSnptcTR0RXE1bmdIbUI3VWRRVzU3bFd3?=
 =?utf-8?B?L2JLSUN4RnlTWWcxaEVaUXRRQUlSRkxsZkR2QnlIcmdZYnNVazluZU9vSXl2?=
 =?utf-8?B?TDlJVmd5amxwR0hZQTNncDg1RWoxK3Noa3N2bytJZXlzVEt5cE01K1RLdGtX?=
 =?utf-8?B?U3htcWxFWC9VS0JtSWJDVTRvMjVnWXhDN0ovU2RVVWpPMmczdkJUNmlTeU94?=
 =?utf-8?B?VGdPMDZiMlhkQ2Y5TEgxM0JqRzFhNUNjbUk3YUtZZmV6WEhmc0FjMzZheVhL?=
 =?utf-8?B?TVFLaWg1MWJXam0rcmF2ZWRHbXEyNVR6ckRiL3VLd01xM0ExZHJjT1ErRlRp?=
 =?utf-8?B?MTlzL1dnZnc5TmtXalp5VURObkxmc09POXpYRmxDeHRWWS9lTlllamVhaDlD?=
 =?utf-8?B?TGEwRVp4cU5uRHRTeG0vTUFrcFlyVEtyYWVVaU1aSlpMZFFDUlJJSXU0Q0VV?=
 =?utf-8?B?b0x4UEF5SGZRUnNhZytwSE1UNzJZU0QzelFJY2lkb051K1Q4bzZWNDVGa1Y2?=
 =?utf-8?B?dFp6elhNKzd3SW9ockkxZDVvRU5FZ3pGRnMwVVpyYVVEY2p2UHRJYnpUV0E4?=
 =?utf-8?B?Q1VYRXVsaHlCd2I1V2FPNGNHUm45SzlSVGp3bW5kOS9yUm5BZzZKUGRBNmtw?=
 =?utf-8?B?N2dIeDZCN2xjQklWZEtvSjFYNEhoSXFvVFRMSmp1dm56SmF5NWk0Rjd5WVpU?=
 =?utf-8?B?M1lQRTlFUnlRYWZtbjZqaHdVQ0NBQStqNk5mSTYzZ2lnRzJlOWtVZDRSTFZU?=
 =?utf-8?B?aWpwbnZ0LzdSR0RlVjdEQ0lYNGI4Z0VjWWwvT29yQW5IamZlOUdZWVZDdkxo?=
 =?utf-8?B?MEtzbUxpZmpCYnFVNFBJTXdJSmxMVlRSaUVOKy9KQzkvb09VMzYwU2FOUVJ4?=
 =?utf-8?B?LzFjNWtuV1lQRzJDNWxETWFxUzZDK0VFMHByUWtNQTRDYURjUG9rOU90alVT?=
 =?utf-8?B?R1lGNXY1VnBLbzlOakxQZEdHelJXMitFNUtrSjU4VUhmM2hkMEZpN2t2YThN?=
 =?utf-8?Q?jPfydP?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(376014)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:25:08.2595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 158f5500-00ca-4b2b-b220-08ddc91acbe6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 12:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220737

T24gMjIgSnVsIDIwMjUsIGF0IDEwOjIwLCBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpA
Y2hlcnJ5LmRlPiB3cm90ZToNCj4+IFBsZWFzZSBvbWl0IEVHTCBhbmQgR0xFUyBoZXJlLiBJZiBJ
IHJlbWVtYmVyIGNvcnJlY3RseSwgdGhlIHdob2xlIHBvaW50DQo+PiBvZiB0aGUgbWVzYS1nbCB3
YXMgdG8gcHJvdmlkZSBHTCBsaWJyYXJ5IGluIGNhc2UgdGhlcmUgYXJlDQo+PiB2ZW5kb3ItcHJv
dmlkZWQgR0xFUyBsaWJyYXJpZXMuDQo+IA0KPiBUaGlzIHNlZW1zIHRvIGJlIGhpbnRlZCBhdCBi
eSBjb21taXQgMDE1Y2IxM2E2N2M2ICgibWVzYS1nbDogYWRkIEdMLW9ubHkgTWVzYSByZWNpcGUi
KSAocG9reSkuDQo+IA0KPiBAUm9zcyBkbyB5b3UgaGF2ZSBhbnl0aGluZyB0byBhZGQgaGVyZSBt
YXliZT8NCg0KWWVzLCB0aGF0IHdhcyB0aGUgaW50ZW50aW9uLiBBdCB0aGUgdGltZSBJIGJlbGll
dmUgaXQgd2FzIGFuIEltYWdpbmF0aW9uLWJhc2VkIEludGVsIEdQVSB0aGF0IGhhZCBoYXJkd2Fy
ZSBzdXBwb3J0IGZvciBHTEVTLCBzbyBtZXNhLWdsIHdhcyB1c2VkIHRvIHByb3ZpZGUgdGhlIGJp
Zy1HTCBBUElzLCBhbGJlaXQgaW4gc29mdHdhcmUtcmVuZGVyaW5nLW9ubHkgbW9kZS4NCg0KPj4g
QnV0IHRoZSBmYWN0IHRoYW4gbm9ib2R5IGNvbXBsYWluZWQgcmFpc2VzIGEgcXVlc3Rpb246IGRv
IHdlIGFjdHVhbGx5DQo+PiBuZWVkIHRoZSBtZXNhLWdsIHBhY2thZ2U/DQo+IA0KPiBJdCBhY3R1
YWxseSB3b3VsZCBiZSBqdXN0IGZpbmUgYXMgSSBpbWFnaW5lIG1vc3QgdXNlcnMgd291bGQgYmUg
dXNpbmcgdGFyZ2V0IG1lc2EtZ2wgd2hpY2ggb25seSBoYXMgb3BlbmdsIGFuZCBub3QgdGhlIG90
aGVyIG9uZXMgKHNlZSB0aGUgY2xhc3MtdGFyZ2V0IE9WRVJSSURFUyBiZWxvdykuIEknbSBub3Qg
c3VyZSB0aGVyZSB3b3VsZCBiZSBhIGxvdCBvZiBwZW9wbGUgdXNpbmcgbWVzYS1nbC1uYXRpdmUg
YW55d2F5Pw0KDQptZXNhLWdsLW5hdGl2ZSBtYWtlcyBsaXR0bGUgc2Vuc2UsIHRoaXMgc2hvdWxk
IGJlIHRhcmdldCBvbmx5IHJlYWxseS4NCg0KPiBAUm9zcyB3b3VsZCB5b3UgYmUgYXdhcmUgb2Yg
c3VjaCB1c2VycyB0b2RheT8gTWF5YmUgc29tZSBBUk0tYmFzZWQgU29DJ3MgdXNpbmcgc29tZSBh
bmNpZW50IChvciB5ZXQgdW5zdXBwb3J0ZWQpIE1hbGkgb25seSBzdXBwb3J0ZWQgd2l0aCBsaWJt
YWxpLCBvciBzb21lIEltYWdpbmF0aW9uIEdQVSBvciB3aGF0ZXZlciBlbHNlPyBObyBjbHVlIHdo
YXQgd291bGQgbWFrZSBvbmUgdXNlIG1lc2EtZ2wgdG8gYmUgaG9uZXN0Lg0KDQpJIHN1c3BlY3Qg
d2Ugc2hvdWxkIGtlZXAgbWVzYS1nbCBhbGl2ZSBhcy1pcywgYnV0IEnigJltIG5vdCBzdXJlIGlm
IGFueW9uZSBpcyBhY3R1YWxseSB1c2luZyBpdCB0aGVzZSBkYXlzIGNvbnNpZGVyaW5nIGhvdyB3
ZWxsIGFkb3B0ZWQgR0xFUyBldGMgYXJlLg0KDQpSb3Nz

