Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F27CAC598
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 09:40:16 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.33])
 by mx.groups.io with SMTP id smtpd.web11.28700.1757929212774513227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 02:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gzdsgQA+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gzdsgQA+;
 spf=pass (domain: arm.com, ip: 52.101.69.33, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=q3v6eGDS9hZbekmTQgJEN8b6YV1KNlo0qlA04hojkvUQRwlIU46p08ELscQApczMAIUhUdVG+pS76yiel3VY7nyIIfvO3wwWqvRILLTZk8E86bG3d0Bc7heC5K0NelYYdwWPPOfQ+LDhJ6NJyPaJcsBdB4ci83qY4CZlPhTDC084b+uqpgBDK+KTJDkXaZyoaUBML0xYUlZE7+mk0kLddUMp5qKAFzYsUvhY040PnfNNE4iO07BXBfSx3NT13/vnJphnd0q3XVGvXc0+J1mHiDdXfBCYX48wUIayERmecNwzilN30PlpvqUER/UC5BCGHZQTG3804cZrBlTjhexrlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6x+DMn4A8OssghXKuXoBke2rfoiht0SKiKqyERaXX4Y=;
 b=AFDT+iTRRY50u88ScB6+DZ7pvPjikoMZzHi/zRx8/GGdNVK7eh2h7eu8DbiXg03eXpYcGLK3CQg6XNrbo5ZDdpHVDiKOq+rMb4C9LoAdYuiUIW0adHjoJHp2Eh5zNVKNgXjC+peYhbzlJ0yv9SFkBobLsbgISBH7QtXKISGqO/8ukfVjSZLhsPRE2RH/UjwMBuYU637IvHeWIVCpknc/pvRxYYiM6GVWsRCmE/pVBEnwBqAhiftKIFn9vpE0IPzzjUCpOl9HkIl0GUhvX66U/TESCgnpbtekbLzaKpFR74NK17x9qa0DmufMj1BYKjhALbYQuYKptkqWJKJTGlYo1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6x+DMn4A8OssghXKuXoBke2rfoiht0SKiKqyERaXX4Y=;
 b=gzdsgQA+JpgXLjowlTvMYSJncovf30eUF07m9/iq9OdyEbMROsvnU480suM0qj8JGuDvfOJTUDljJQmyPv6dk5XOpVDzezEvbSiejlO4nOhoe7wWzcA8g/CL+fqLBo2s+IcLwjly+ZiVGet4LLoSB8+HNtI+jEynL3X754Mk01M=
Received: from DU2PR04CA0320.eurprd04.prod.outlook.com (2603:10a6:10:2b5::25)
 by AMDPR08MB11306.eurprd08.prod.outlook.com (2603:10a6:20b:71d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 09:40:08 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::ed) by DU2PR04CA0320.outlook.office365.com
 (2603:10a6:10:2b5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.20 via Frontend Transport; Mon,
 15 Sep 2025 09:40:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 15 Sep 2025 09:40:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWsWWvy2I/7O7+ZXypQ/7lLT6C7fr1yV4bEo8qW/DrA2H9UMv0qw/SHEU6aOcBcD/FKK+aZdi9Z8YqETPNfAcTIh26yQxxXbDhzSYYOxdaDfZf9A1nZq9GOLG5ns8HL/jjejnU9po9ciDo8dE9NCw6GiuqKdDwp/Ar6l2Oc+17pOMOKp0W3nZewe0geIGIVmWWj9cvUuDaBvYa0kr8BVdjRAGNzNGB7LOFJfHjgwIx0M2wVgoMH9BgTy6OwarLY2MfCZy+xv9zcb33T7Ol9961hDatrXHsZQwKbmOB6LMbsYJwyYOxj9hKOsGWMaQ15+AiB9SaK94oyPsznzQ6WWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6x+DMn4A8OssghXKuXoBke2rfoiht0SKiKqyERaXX4Y=;
 b=OjCzbObmQ8SO8pZ7mv4hjucEId90f78ANWv7Sdsyx0H1gv5xm9wWegrgbSQOXB6SWWOBuLCr+66zpOMyIbJLiSG3VnMP2kFgii8AOSmmZ3R2jQy5UpJzwR6f/NXhrEzv7eEBC/rOkYH0HkGu76/ND5shp/RMpPnOwk170AZ73B10RGqLy1dfBnhdKTB2SmXtpGKiZMdB98IK/iwpD+RG4zV0Ob6lMkzW0Ns0Sg5+3G4cQ3slrCdIhtUkiqRuw3OInQMaLH/ATzgfUfxZmJEjtECcbYxc78LJl5FS6mjJeMWwzu/fqMskYUme7BEG439aOTJfOstvRrHys2kRN7GLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6x+DMn4A8OssghXKuXoBke2rfoiht0SKiKqyERaXX4Y=;
 b=gzdsgQA+JpgXLjowlTvMYSJncovf30eUF07m9/iq9OdyEbMROsvnU480suM0qj8JGuDvfOJTUDljJQmyPv6dk5XOpVDzezEvbSiejlO4nOhoe7wWzcA8g/CL+fqLBo2s+IcLwjly+ZiVGet4LLoSB8+HNtI+jEynL3X754Mk01M=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB8022.eurprd08.prod.outlook.com (2603:10a6:20b:585::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 09:39:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 09:39:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/6] clang: disable all test targets
Thread-Topic: [OE-core] [PATCH 2/6] clang: disable all test targets
Thread-Index: AQHcI/HhfVTOABC/R0iAIW1NnOyN2bSTt3eAgABJ4AA=
Date: Mon, 15 Sep 2025 09:39:32 +0000
Message-ID: <08092405-8AE5-492A-8407-3364B9E79A85@arm.com>
References: <20250912143038.3345369-1-ross.burton@arm.com>
 <20250912143038.3345369-2-ross.burton@arm.com>
 <CAMKF1soLyDVzZ6ridzFtqTBzNX7qwOiJcxh0u0q=7JgVsZuNbQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soLyDVzZ6ridzFtqTBzNX7qwOiJcxh0u0q=7JgVsZuNbQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB8022:EE_|DB1PEPF000509F9:EE_|AMDPR08MB11306:EE_
X-MS-Office365-Filtering-Correlation-Id: db09cdcb-7805-466f-d8d0-08ddf43bdba0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Qk80UEdjbVlJUUc5dkFuSFpyZWRGTXhsV3BsSTFQVGdPZHc0WDlHRU9RaFo5?=
 =?utf-8?B?Q0NwVnpmR1R5UmxqYVJRQTYyeEU0V0oyQXQ5OStOc1BOdDBxd0NOZnN2UXN2?=
 =?utf-8?B?Ky9LS3dGWUYwNGo2K0JSWUF6NzRCdFk1MW9MUnpYYS9jMzJOZ1VwWGlOVkNT?=
 =?utf-8?B?dVhTVkFyblNpcE9naHd1bDM4bXlCVjIyQ0dFKzVNaklSR1BRcDBpN2dKc2pP?=
 =?utf-8?B?U1drMnJZVVlVWkljeGhtK01KUlNTWGFiOWNSVUxTQnE0Sm9IRjJMYkZiUzBy?=
 =?utf-8?B?MUN3R01SSlFZQ1cvUFV4djBRZC9ZVzAxSkNYY280TnVobjU4WUVaK2hUa3dQ?=
 =?utf-8?B?dnc5T3hQSlh1U21NMVZSVnJVY2NsaEZjZE1zYTE3NWQ2Nk4yMkRLWnF3UGxH?=
 =?utf-8?B?VzRTQjUxSDlEbTVKbkdSWG01OXZINTlvdXMzbWVBZTNHNmNqQmhGSkQrZlp6?=
 =?utf-8?B?WDByVmZyU3h2M05XeGc4ZVBtaHNXWXVNUGFqUjQ0WVo0RStOVWN5Uzd3Q05V?=
 =?utf-8?B?SytjQjZ4VHY1ZlB4R0pkRENidW9LSlVTN256WGNkQlU3MlpkWWFuZWJ5WnRt?=
 =?utf-8?B?UWVSam1KWmdCSTk0M3pzZkE2bFJqN0ZiRXJKbERHU0dpSkh5VWt2N2xyaXRl?=
 =?utf-8?B?UG5OazJTMjBYWUR5dURlN0wxRE1iSzIrazEyUVVaN3c2QTVFczZnZHBUU0p2?=
 =?utf-8?B?QXJVSVpoaUZTWHYvZXlnYTZwMHRIZkZWZ2pYa1YzcW0rOS9YdDBLOXFYVXdJ?=
 =?utf-8?B?MnlvSmpTTDFnOE1NNlpTeVA5Qk9OV2NoRGVTbU9PVXRONHRwZDY5Q0dKNlFX?=
 =?utf-8?B?TUNTWHpXNS85aVNGc3I2Zk1HcUZSbFRmTlR0Wjg1TFVYTEEvVFpRemhGUmtL?=
 =?utf-8?B?UTVOWDlZV0lzcjFWazdFYVdSN3VMc1FMUnhENFFJZkRkRytaMm9uZkp0Y2Fh?=
 =?utf-8?B?elVUTVNBa3RCdXdYVHNTbGxQR09OM1kycnVETHlwOW9xVElTb3ZwaTcwNFVj?=
 =?utf-8?B?YnhDS1ZXMkxINEduNjhNMnRoelN3VEk0eXlBZ1VNcnBkbnZkY0JWZnZIMXFQ?=
 =?utf-8?B?ZUlScCtLZE9JbzkzbEZocW0yNTZkdFoyNDg5S3J6VGhhc3kwUGp6MkgrRXdI?=
 =?utf-8?B?Qm9zTTRxQ25RMU44TVRlUElBUWN6OEN5aUdMOGljY0MwbTlBb1NkdlQ5ZWsy?=
 =?utf-8?B?RE9Wdjg2RSs1bWhpaTNxUTJjTGtxVjRRU045aDhMWW5LZmtodlJURUZkRUI0?=
 =?utf-8?B?Y1lrRktMMVN4ZVhhamd2K3pxN0RINUxxb3d4MjVBaGJkTkJJVzdPUElkc01K?=
 =?utf-8?B?UUNJQ01DOU95MWVTWjIrdm9YaXZqNXAvendwN0lBKzhMQ2dyQkJMSWJrVXZL?=
 =?utf-8?B?bDhMbE4wZlpFWno2bTdOU0hRZ3YrUXZFZGdPeHBCNmd3d0Zwald4WlpObFFQ?=
 =?utf-8?B?RGswb29WNzc5Sm5pV3pRaVVNalBiT1dCc3dhdHF1UDF5WitYQWU2MEh6eHcr?=
 =?utf-8?B?SHZVejR6Q0pqVXR3VzAyQVVRczZjbEQzdzlFK3BXR2RsWDBXMVV5TDhURitW?=
 =?utf-8?B?VnVuOXRxK003ZzhSSXdIMHNjaHpCOS9tZzhNQld1RWFYRkwvL08zK0JlODJI?=
 =?utf-8?B?RnpuSnJ1MmMwSzZQZHNrU3BoaGRETFZaaCs3eHlkak04bVFBQXZOUHg5RHh3?=
 =?utf-8?B?SGhsUFpaVHNielpkQnlCaCttNlZmOUZadXBxazVaS3BSL1crcTVqZkR4aWYz?=
 =?utf-8?B?cnFFck5kTVV0Mi9IZUFzZUw5VEUzSFFjdHVZMVdjUEZwUzNzcGtQL3M2UkhC?=
 =?utf-8?B?dmVqWkJjOUZKSWluaVo3eFFGbXpObUhRazk3OHUxeVZISTFMa3ZodHZVZ3dx?=
 =?utf-8?B?Z25uazkxRGtPelBxa1VJb2hHMUpGUFR2akpya0VwVjU4a0lkVzVoMFJtYmlF?=
 =?utf-8?B?RzJpRDFRcnlKbjM2dGRSN244OVVSRU43ZjNxbzhrMUJXcE90NDdPTG12Q2xB?=
 =?utf-8?B?eG12dDJkU1Z3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD2E62238995A549B27E7CEBFEB95965@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8022
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	de218198-7052-42e0-a3be-08ddf43bc691
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|35042699022|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZjlGWFJNZEN2b1VoanY4aWUwV3VGY1pYZFBMWEd1dVozN1VsSFFkUzZxYzZu?=
 =?utf-8?B?M0RUVmlxek1zQ2lUU3RzZ2hwd3A2UTA2aXlpZlRKR3duU0h1MUNpKysxTWJL?=
 =?utf-8?B?Z2JVUStvWmdJR2lZbXRuaXNSY1pTVTRVTjlFandGbkxNa1pVb3ZJU0pRRkhj?=
 =?utf-8?B?TEhRRDRkdE9uYkV1bW8zbTNVUTBPQ3ZFOUdJaHhLOEkyRWFzaFdEVC85UFFQ?=
 =?utf-8?B?UFBJK0J4aG9GYXZWYjBTMEdFSGtxam53SEo3NDNNQjBacnBPSGNxTnNKbU5h?=
 =?utf-8?B?Y2NXVFo5TEt2WDNndnBlbnRkL3QyRlNDeUVwcjl1dkJFYTNleEQvYk0zekow?=
 =?utf-8?B?dzgxNEZHbm5HMmo5ZzUrcSsrdWtxd0JHSm1rYXRyVWxmZzdlUW0zNVBMbnp5?=
 =?utf-8?B?M1hPU2pocjM3VFFZQXMwYnA3Y3BoR1lFeTVVajk2WmJVZ3RIS3IrUFpLTC8z?=
 =?utf-8?B?d0ZxMlpXaXZDL20reWdZNUFxK1Uyc3FHYTdaZThCeEIxRnlDblhVVlM3NDdv?=
 =?utf-8?B?Q2MwQ2NsUHJEU2oyazRiNVpyelBQSUlRTjB5Q3B5TDhvVTVNZ2pJQm1RMHhZ?=
 =?utf-8?B?alN6Z0lMVFpGK0JWRmlzRnEwa3NERHNIVEFwUFROOWlyczkxRGhzeU1DdTdQ?=
 =?utf-8?B?RTAveVNVRXM1L1JqTmxqS280LzBKWmlWWkZwTWhKcnlhMVhYaWExQ2Mrc0NH?=
 =?utf-8?B?V1JkN2d6ZnB3NzRyaXVHNWRYS3k3eTE3c1IrTUV3NG5FR2hEVnh0ZVBIRTZC?=
 =?utf-8?B?ZFFxVWlvbUJ3QU5xTFBuTHhNQ3I2WDFqZk8rSEhYYmtvRDA1N05QV1BZZk1t?=
 =?utf-8?B?NVpJUDJKZDZaN1BTRVRYcDE4S2ZzNkx5ZEJJU040VzhlLzE1SVNUL3RWNlND?=
 =?utf-8?B?eWtQOGRNSGJxK1cybVNjK2ExTjZzVnYyamhTUFJlZjVNZGgydjRVNjhUaCtU?=
 =?utf-8?B?WGhqM21tNjh6UEIvZlpZaERrQVVmd0QvbHZmTTZHOUdqakEya1Nqa3VGamNQ?=
 =?utf-8?B?QUdVTVQrUFk0U2RhQXkvNW82YlFFRnRQOVNkeHU2OHNSSDluT095TjNIVWZm?=
 =?utf-8?B?Y05NY3B5S2lPMzlBZ3JhKzZjdWJ3cHVVK1F5QnlmRno0eW5yaVYzakVyUzVX?=
 =?utf-8?B?VmQ4cmVaMi85aVRjS3pKU1doczcvVWh3Y2M1djhGOEJDT2xVbCtCY2o1RVhz?=
 =?utf-8?B?OXQ2cEpQRVByMVlobnB2MCt2emVEWjczTnlMZ3BqL2cyM29yeDh1L0Q2aVp6?=
 =?utf-8?B?MVRGdyt3V09hbzBYVWJ0eWo1bWRSQ1JCVWZYdHZZMnVoV3NuVjFWS0xPZVBY?=
 =?utf-8?B?OHRkNW1CaTFJY3kvMmY1d003ZHAvNlBDN2FLRWxpcnJkWmY1RkV4cVM5dnlR?=
 =?utf-8?B?ZmlrUUVUamlHcTc3L2RLTWdvQ2ZkSFZZMkdtbWRxY1Qrck5wcWpaRUd6M3R4?=
 =?utf-8?B?bHVuUWpqQWxHd1NrbFpjazg2SlZTZmh4Y25DK0ZiZW02YlBkdFRmbmZBdDdS?=
 =?utf-8?B?M2pLVWFrWmF4MkdKQ0lFM0ZLMTcvcTQrdDdKeEFsazdWaG0vMWY0cmROL2li?=
 =?utf-8?B?ak1jWWU4RTRLcUtNbkxlbVZ5YWhHSVBrZk15QXhGb0xRVmZ1ZGZEbWtmc1Fz?=
 =?utf-8?B?a2h1UnVnb0VwRTBaVUF2WUthNVhEWGQvYmo1VS8wWVF4eVdLWXVBVGJUNytI?=
 =?utf-8?B?THAwQ2F6TzhRbVpzeXRoclE4OE9wWTNxWW5IaC9YUVhaZXhMVG1jQ085Q3dD?=
 =?utf-8?B?bnhkTmlyQ3hiYjdqVTh1N2U0UzdpaDd4a1VrK1ZlSGEwNndXSkVnakNOV3dS?=
 =?utf-8?B?OUw0ZTZTc3JDemZvK2c0VC9tMGtZQzA2UEp6NTJ6MUdqaUlkMU42LzhjcmNE?=
 =?utf-8?B?aytXbVV5dlRlQ1Y1Tm9aSDVxVTcxZ0ZaSUx1dVo2OGJaZkRFSVVkcmNSTVFy?=
 =?utf-8?B?U1hGbFcvaUZPTUYyeHBwODQwZTRPUGhaS05lblk3SGhHU0JzU1RqMFNWYmhY?=
 =?utf-8?B?c20vMUcrdjF2WXBkTm9IbG9FZjlPV25HRmFIR2hUTnZIcDd0M0tOdFZGdTFu?=
 =?utf-8?Q?sDUyxI?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(35042699022)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 09:40:08.0942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db09cdcb-7805-466f-d8d0-08ddf43bdba0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11306
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 09:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223395

T24gMTUgU2VwIDIwMjUsIGF0IDA2OjE0LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IE9uIEZyaSwgU2VwIDEyLCAyMDI1IGF0IDc6MzDigK9BTSBSb3NzIEJ1cnRv
biB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IA0KPj4gV2UgZG9uJ3QgaW5zdGFsbCB0aGUg
dGVzdHMsIG9yIHJ1biB0aGVtIGluIHRoZSBidWlsZCB0cmVlLCBzbyB0ZWxsIGNtYWtlDQo+PiBu
b3QgdG8gZ2VuZXJhdGUgdGhlIHRhcmdldHMgYXQgYWxsLiBUaGlzIHJlbW92ZXMgaW50ZXJuYWwg
ZGVwZW5kZW5jaWVzDQo+PiB3aGljaCBtZWFucyB3ZSBjYW4gdHVybiBvZmYgbW9yZSBjb21wb25l
bnRzIHRoYXQgd2UgZG9uJ3Qgd2FudC4NCj4+IA0KPiANCj4gSG1tLCB0aGVyZSBpcyBhIHBsYW4g
dG8gZW5hYmxlIHJ1bm5pbmcgcHRlc3Qgc3VwcG9ydCB0byBjbGFuZywgaXQgd2lsbCBiZSBnb29k
DQo+IHRvIGtlZXAgdGhhdCBpbiBtaW5kIHdoaWxlIHdlIGFkZCB0aGlzLCBzbyB3ZSBkbyBub3Qg
aGF2ZSB0byByZWRvIHRoaW5ncyBhZ2Fpbi4NCg0KSWYgdGhhdCBoYXBwZW5zLCBhbGwgdGhhdCBu
ZWVkcyB0byBoYXBwZW4gaXMgdHVybmluZyB0aGUgLURMTFZNX0lOQ0xVREVfVEVTVFM9T0ZGIGlu
dG8gYSBQQUNLQUdFQ09ORklHLg0KDQpSb3Nz

