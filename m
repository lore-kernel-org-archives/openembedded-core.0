Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA6ECA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 13:17:47 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.33])
 by mx.groups.io with SMTP id smtpd.web10.21622.1757078261596852316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 06:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PZK7jr7b;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PZK7jr7b;
 spf=pass (domain: arm.com, ip: 52.101.66.33, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qbZJLseb5ZetkPivUfKEF6I4dAh/P11nJOSPR634GraUiDI4sMuIb5fCKraUrS7otf5n74nrCy0ET1E2kit7Hp/QzDiNI+QyaSusd5e0Q2OUlJYDfgc4chEcElemKpDmxRjosjC0R/s92Iv9LNYy3K+aOXnjzweX5DUXD8gT6NFJIN0iCayMH5wG1jyBtjZWAA/JCdAfeug+SIwcgMazyRHEicxmXzPw8zoix6yvSp24pOy6XQL6T8cX76GiI/hlJl2ON19XbJ/SRF+LMNxg8wI8kcJA2foMe/V6CA6vi6xw2XP7rBJYSBMpyoI4RtYL8FzkK0dN+22JO1SxHt7xDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmIaweNr7Ac4NNuGVonlr6O8k/6+XAfHeNYDv5dskiE=;
 b=BLr420496hbkR08JEL9Xz4ElbFYfbDj2fvKvtczB8eMT5/xhDWNXJs8rLR2x1WY5BlGj9xxVDSnFfJzV9taLmofwuhqu3+1Rr17RCn2gi6Wu4wX4CMBIYXVKiWoOKvfScGrvFDJ12MhT93fvha5u9UNve3jewSOzTs3oZS8G/qo1eOHM1yeCIAoyFZhOVppnnUM0MfykUSDBIgltzNtlY7tLYSGhRJrfqWjNKoXSt609Db4E85nFKXaFUlfkyweP0NRlUDalNT4T4Vjxl/Li0lte1fUQ+5XFrFoGf8w4QzTo7oOUynWFJ+nLpcc/XsKUsHI2CKW2jg6qQ/2KkmyLPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmIaweNr7Ac4NNuGVonlr6O8k/6+XAfHeNYDv5dskiE=;
 b=PZK7jr7bhsHQH4+4+lvSvk4KI4sG506r6waKWO4Mvs8HKbQtDMyK3yhHSgw5ofb/NpU66iYmh2qt4EzH+BcQRWL3CGZ9QEIb34kuplt/couGzo+kb7keg0hsO+ZkjIkK7Mta6XENemRpdsAXHEIfzoDJwLQRXFc4Vyefba8ZfBE=
Received: from AM7PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:20b:110::36)
 by AS8PR08MB9907.eurprd08.prod.outlook.com (2603:10a6:20b:563::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 13:17:37 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:110:cafe::4f) by AM7PR04CA0026.outlook.office365.com
 (2603:10a6:20b:110::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Fri,
 5 Sep 2025 13:17:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 13:17:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dToub4lX4nxMrjk0ervekpjqOsJSe66Ac7klJwxDER4Wv+3cZdWcSJacQ0eVWRwAAON6cMgXfhTbeOfagLRf+Wn0E7irstMFr4R/D4/+yM7j8a1IGFen85T0Qd0e4Ze+kL2QScZj3zC8uK4PYkgp7NopeSURZPejXpDvhPsH4JXVbK9QPC8q4ffma/96pjvYDNPNn3mQYVX1UGaiOEq6qAz/YO/mAmGIr2GfNHMMvF/+ULXuo/4X7VZDx91JMBETMhyoJdVIRhhyWO0cAwizSSlyrwo50K2VBUZ8kPa5hT6bDk13a8L214vilWzqzpARdJNUr7mgDbwXCafwNh0XTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmIaweNr7Ac4NNuGVonlr6O8k/6+XAfHeNYDv5dskiE=;
 b=BIc1ERJhLgaNkvlRQNJSY8ouEkKyAcIHoRWmg0oppeRuMxBI8R26mtugk0cNUAIH7WV+CuKjwvVJgEoBMUZDViuiPs1VbRjleyQMbvnDqxFHStM3fiFr8M1m7ScUenIHdjre6rb4yPqFzeihV/tonaa6TE+CMcbLMdhEkudOuti/JcVd9sY1FiuIBfu3zKPcGsMBGd8975p76XKn5aaTp49SqILE/kqrOaQI76ORmEBcaC4o48KasXaLr5kNNz90nKnhxI9ecxwfj8DdJgBVul42ohxDuxtaPCp/Vo4nTkNfW0vbzYGdOWXyfH7UjkZohAsHIZ54vujLK7ssDaU8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmIaweNr7Ac4NNuGVonlr6O8k/6+XAfHeNYDv5dskiE=;
 b=PZK7jr7bhsHQH4+4+lvSvk4KI4sG506r6waKWO4Mvs8HKbQtDMyK3yhHSgw5ofb/NpU66iYmh2qt4EzH+BcQRWL3CGZ9QEIb34kuplt/couGzo+kb7keg0hsO+ZkjIkK7Mta6XENemRpdsAXHEIfzoDJwLQRXFc4Vyefba8ZfBE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5820.eurprd08.prod.outlook.com (2603:10a6:102:90::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 13:17:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 13:17:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Antonin Godard <antonin.godard@bootlin.com>
CC: "koen.kooi@oss.qualcomm.com" <koen.kooi@oss.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: stop enabling non-standard MAC policy
 when using the 'pni-names' DISTRO_FEATURE
Thread-Topic: [OE-core] [PATCH] systemd: stop enabling non-standard MAC policy
 when using the 'pni-names' DISTRO_FEATURE
Thread-Index: AQHcG+lTCiL79TKLdkC1JimrZTHYLLSER5yAgAAKKACAAEMAC4AAAbuAgAAAX4A=
Date: Fri, 5 Sep 2025 13:17:03 +0000
Message-ID: <378DE173-9194-430E-8ED8-A179B7BAE844@arm.com>
References: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
 <DCKQ7KX5D934.3FS2DI6M1I2L1@bootlin.com>
 <ABE717E9-255C-446F-A5CC-C33C7D20ABBB@arm.com>
 <18626142A7130E51.28137@lists.openembedded.org>
 <D98DABEC-9D8B-4D6A-ADB8-EABFAADAA502@oss.qualcomm.com>
 <DCKW7R98LZAP.19SKBT6URU40X@bootlin.com>
In-Reply-To: <DCKW7R98LZAP.19SKBT6URU40X@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5820:EE_|AMS1EPF00000040:EE_|AS8PR08MB9907:EE_
X-MS-Office365-Filtering-Correlation-Id: de99fadc-9765-45c3-8022-08ddec7e9574
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TGhzK3B0cVFVTFFDWUNmeFhiWkhrSS9IOGR1RzA5Y3h1MEdjMHZWME5hSXZ5?=
 =?utf-8?B?UGRvcjJ1bTJ0NVhMNVVSUmZmWUpwN1pjSWtRRVpxelcrd01lV21PL0NJQ2Jk?=
 =?utf-8?B?MWlXY2h6R1BLZjNidU4vRFdBLy9Na1RiN1g4bSt1dFYvSTdjVHViMWs3V3NN?=
 =?utf-8?B?eDk4ek9aUjh6NEZvZW42T2krTGgrZ2FmTXBvNlJSZy9lU0dkRVdTcFRMWUZZ?=
 =?utf-8?B?aVBmRWdGYjNLaFk2dEZGUUxNNlRHQ1hUQ2wyckw5SDVkTjNja2c3SzZtb0hP?=
 =?utf-8?B?a3I4ZVRwd3JjTU9yTEFGQU5icXIwcW1FYjU0WFI3dHJnOFdzSWdvSEs0c3lH?=
 =?utf-8?B?c1VpQnhvYnErREI4U0I5YWd3dm9mdVJYL3JxaGZKY3JzQzlteVBqaFVxaFpp?=
 =?utf-8?B?ME1NdGh1MElRVFpSb1RMT3JMUzBSM1c4WUVmdmozdUlITG5qWVNEaFNXc2E1?=
 =?utf-8?B?SUcwdk5xSHJNaDJQM2hmV3NUT3hxUXgrakZ1bnMxNlpUSWhNK2FrTjYxTW50?=
 =?utf-8?B?aDY4V2l5Q3M4K0FTTm50NXBXVTFjVkhuZ0Y1cmhpSmt0UEpaQzFSMnNud25k?=
 =?utf-8?B?YmhSOEtTMVNRMGhTNzRSQkhjTHFya2NKUUZ3alo1eDlod2o2UVU4NVFEUFVq?=
 =?utf-8?B?OFJTY3FaRFg5V3BBYkFpMVhpd3hsVmNLZ0VYbHVOc2NVSHplOWxvcmZ5cWxZ?=
 =?utf-8?B?bWtYeXJKVlRDZlAyaS9jc3pkQ1lQVEUweTE1UUZqSjZmNTdZV25FeTFJaGpM?=
 =?utf-8?B?cVVpaDZNM2RMUTBGbFVrNThqYTJqNTJVQUVrVGdxZ2c5L29ZZHQxVXRlVGhB?=
 =?utf-8?B?OWNmVnlKYXRlSlNNTmpFU21pemJ3cFhDT05nTi9tL2xiVCtudTJRZ1R1UkpB?=
 =?utf-8?B?akxTdHhjQ052Y2RzTUdlUXlOSEJzcnJWT2dTdVJ1RTFlZzROMllyZ2tpaXVK?=
 =?utf-8?B?OFJyQ2tobUN5cW5hUjNhTE1INHc3d3Y4UUJ0dHhRTWdjTmxLa2NBUWFHbVZX?=
 =?utf-8?B?L2dDelBJNWE5OENhNnVGQ0JFVG9mbUduK3FvcE5kclBHN2ZpTXYxVERsN1k0?=
 =?utf-8?B?Ykp0TThheEF3WTZEelp0Qng5Y21qc2Rrc2ZpRUVuNSt5eFdFNGJackowaUEz?=
 =?utf-8?B?Y0hmWTNwaEt0bXZYSjFtamxldlBlRGNzUzdRL1ZYSWFlODFnUTBHUXpNU2Jt?=
 =?utf-8?B?dzdpUThqdm5pMXNYckNub3g5RlFia3dwajRUWXhNdlczTmJxUGZUUldhRkR0?=
 =?utf-8?B?VnAwekYxN1RLclZtVWJER2gyVERZVUlPcHBMckpDZEZVNlJKQkxmTTBjcHkx?=
 =?utf-8?B?QWNNU1J4c3EwSVJ6aU9LTEhmbTA3U3pWWEV1dkpoK2oxV24yTkMzcmtCWDkv?=
 =?utf-8?B?aWt2V2w2eENCenpHVmpicGxLTXNjeTBTbHdGRmsrQTFUTFBnTWJ1aUlBRTMw?=
 =?utf-8?B?K0FuUFI3dXF6dGZ3NStWeTM0NXY4S1MxOTNiMVVWZmZ6VDI1bnJ6K0cxaFJr?=
 =?utf-8?B?TVFrMXVOdjNoVFFCTUUvYTBKUC9NZ2FObE5PaWdoWXZ6a0pJQ1U4YmJOamwr?=
 =?utf-8?B?OVdHeWJqbUhGbXZFS01VRkwzRGJZbHhqNlVVNlVtTzZxSUJwS003Wjc0TTFO?=
 =?utf-8?B?bTFkSWdTNnRlZlB4T09SQ2hhajBBWno0K0JTN3hhUHNLOWV5b1F0YVV4b1Nm?=
 =?utf-8?B?M05BMTY4cU5relZ0ZFFPZ0Z2eHMySExDaytYTDJEeEpCMml6ZzVSVXF2K1Vl?=
 =?utf-8?B?YzA0NVpEWmNNSEdscG01a08zRXAwb09hem15ekJWQnZWSmx2WlFWM1hRdkd2?=
 =?utf-8?B?dUdQT0daaFp2RW1TL0w0b1ZzejIvZjRHdFh6SkJVaVRydXUrYU9ldEpKSllz?=
 =?utf-8?B?a0hnOXVnRzBrMTg3Zlh2aVl2b3FDUDJzRVlZTjBlT0hCcWVrVUJicmNXaTFh?=
 =?utf-8?B?U1ZzTU5DeC90WnpXU2FzRTNScklhRk9IU0lYaTd0T013SW9RSmlZaHNlcmNo?=
 =?utf-8?B?dkJ3aFpPQ2d3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F6E6873C0FE4144A9212E73624EEFC2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5820
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	086384cd-c1b0-4d31-cd1a-08ddec7e8185
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|35042699022|82310400026|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UWs2QnNYTzQweWhsUjBHSGw5MGU2V2xCYmhWWC9FK2Y5QlZRUDFHZnZKMS83?=
 =?utf-8?B?UkExMjVyUXVtVXNrNnpreTV1SklqajI2R21NWEd4a09RdTgrQ1JNUHRKaUxR?=
 =?utf-8?B?S01YMHJES3JZbWhCaVZDQ1lidnpkYXZJYlhsMi8yTGlZa0VvQ3M3RGZzVTVM?=
 =?utf-8?B?Z2QyY0dTb3NJck1ML0ZnZ200TkJwby9rd3RLdFhPSFhBWjg1bDQ2b3FLa2Zq?=
 =?utf-8?B?ZnJSK0RxaDZPc1dKWEhlTG9UbWxSSjNuM2Z2Z1R5RmpQWmZWa21CK2FDZGYv?=
 =?utf-8?B?TmptUVRqbW9FT05hTUdtRENZdmJNT09nSXcxVzVsOHhmREN6UXB0OVR5b0Z4?=
 =?utf-8?B?UHkzVmFVa0hWZncrMTNVSkRNZmZwaWxaRi9icjF2SXh3TjkwTjl0bW5pdHZO?=
 =?utf-8?B?NEp1L242RlNpTjgzcWoyZHNpbXE2V0hUUFUrVGxwZk5NaVNQb0dtd1pNOTN5?=
 =?utf-8?B?WTdsdjhGbXc1d2ZIN0FUL3pMWFQ4NG1UK0FnZlVZWGlDa2tSTmpTN0s5eFUy?=
 =?utf-8?B?NndpOUcwam9XVDhleGVEeDRScWY1RUkrZ2pCTktPUTNTbWdiQzN6ak44bjUr?=
 =?utf-8?B?WlQwZXlsWWxyelJ5em1TWCt6dmMwQmVOTVRGYmo1RGxXTXRFa3YyVEdDek5L?=
 =?utf-8?B?VWR0Zi9MbktWQTU4UTRmQ2UrOFo5djJCK2lwMUNnTUZoNmMyamRacjNNREhr?=
 =?utf-8?B?cmJMR2ZhUU15MFd1aUxVanpMYXM0bjV3NWhMcThhNUJkYmRmZkVHOWpXOE1j?=
 =?utf-8?B?aldvb3B6NXp3MitTNy9vL1R6dUkzNExpVEs2djlXVllNSWtKbnZPM3VkVzFq?=
 =?utf-8?B?R21FdU9oODNPQWZOc3l5WndZSUhlajNPdXdHV2p2QlFoZ1E0T0dNQmhvWW5K?=
 =?utf-8?B?VU1xNzFiZjJodDd6M2dEb3RZcHd2TVdDL3dVZkxEUGdsYStoQ2I3UHRneUJD?=
 =?utf-8?B?Vk9vY05oaTJtM3R1T1IzQWhwYWVXY09HQVpjamxuZml3TWZpbWgvTC9ObzU0?=
 =?utf-8?B?L1ZXTzBlNGhxcXFLQm8zY3VlOFNXTExSVlVhVGJGRDR6U3FVNzlsSll4eFl6?=
 =?utf-8?B?b2JpWVlIaStPQ2F4SjFrRU9SZENVL3poaklWUzdJSjdXWFNjdDNIWlltTkk4?=
 =?utf-8?B?NTdJRHM2enBrSVR0bGQzMjRUS3dzT242c2xLMFhXb2l1RHFlUWFLWEZBT0Mr?=
 =?utf-8?B?ZHl2VjVhQkpCdVNucTFHaHk2b1hCWVpJVXUxOXBUMTUwOE9LWnVrakFSVmVW?=
 =?utf-8?B?QUFUbTN0Z0pMdkRyMmpoUFZhNVErZFp2V3ZYRGZmMmFPQzQ2eHc0cE9mQ1dN?=
 =?utf-8?B?V20zM2x2NHgrdTF5K0tLUzZPZ2M1UXArYXdyY3liVlppdzNtU3NkRlR4VFcy?=
 =?utf-8?B?WXM5allnelk0eWlUd0VoUGlMS3NxWHNxR3l3K0U3azE0VnEwNTdheWowMDRP?=
 =?utf-8?B?WGRuelplbFg1SnhGNjBLVDhNYnVNRlNSbDl2RGVZV2pPYzBINGVxa0NaVHR6?=
 =?utf-8?B?NjdmbHNPYzZEZU9uazg3U0ZaaSswMHZTUGRHWlRVYXRXM093MXc3Rjd6TWMv?=
 =?utf-8?B?L1FRM3ZSTFd1RnJhRzhtYWs4NU8vNTVaT1ZPRmV2a01Lc3JBcWkvSFhWclAx?=
 =?utf-8?B?OEpIMkQyWG1jUWpydWowZExHOUREcDF0ZFRpN3ZzMFlYeTV1Z0ZIUnMvRjJ0?=
 =?utf-8?B?a2hFc0oxOUcrcGdvOVJKYXZjMGtFT29VRWdLTC9FZm5vVHREaURaWTk2Z3Nw?=
 =?utf-8?B?dVljWW00MHJIZTQ0dUhjMXphZVFhMWJDM0RoVWdEMDF2ZmJlazhvNnZFaExE?=
 =?utf-8?B?aFE2T3F4bDlxMFVSQlg2ZmpFVmR5WEgyd3ZtRWo5MjRTSi9CMmJWamtOamQz?=
 =?utf-8?B?K0U5NVRIYm5LOEhhcWRpR3cwaDFkZGduTHFGYjFjOUpSSGVJRGptZlZ0eGli?=
 =?utf-8?B?QXFpTGRoRUtHZW1WS20zUDFqTEl0d0xUVGtIdHFCaFJPMzJyQVNLcE1paG5P?=
 =?utf-8?B?cHFGd0t0dVAxWEhVQXhYR1psNXVIbU9lb3FRK0R4SGRYY0sybHgzQmNLMVU2?=
 =?utf-8?Q?A120o9?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(82310400026)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:17:37.2933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de99fadc-9765-45c3-8022-08ddec7e9574
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9907
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 13:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223004

T24gNSBTZXAgMjAyNSwgYXQgMTQ6MTUsIEFudG9uaW4gR29kYXJkIDxhbnRvbmluLmdvZGFyZEBi
b290bGluLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmkgU2VwIDUsIDIwMjUgYXQgMzowOSBQTSBD
RVNULCBLb2VuIEtvb2kgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+PiANCj4+
IA0KPj4+IE9wIDUgc2VwIDIwMjUsIG9tIDE0OjAyIGhlZWZ0IEtvZW4gS29vaSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8a29lbi5rb29pPW9zcy5xdWFsY29tbS5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gaGV0IHZvbGdlbmRlIGdlc2NocmV2ZW46DQo+Pj4gDQo+Pj4gDQo+Pj4gDQo+
Pj4+IE9wIDUgc2VwIDIwMjUsIG9tIDExOjA5IGhlZWZ0IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBhcm0uY29tPiBoZXQgdm9sZ2VuZGUgZ2VzY2hyZXZlbjoNCj4+Pj4gDQo+Pj4+IE9uIDUgU2Vw
IDIwMjUsIGF0IDA5OjMzLCBBbnRvbmluIEdvZGFyZCA8YW50b25pbi5nb2RhcmRAYm9vdGxpbi5j
b20+IHdyb3RlOg0KPj4+Pj4+ICsgaWYgJHtAICd0cnVlJyBpZiBub3QgYmIudXRpbHMuY29udGFp
bnMoJ1BBQ0tBR0VDT05GSUcnLCAncG5pLW5hbWVzJywgJ3RydWUnLCAnZmFsc2UnLCBkKSBlbHNl
ICdmYWxzZSd9OyB0aGVuDQo+Pj4+PiANCj4+Pj4+IFRoaXMgY291bGQgYmUgc2ltcGxpZmllZCB0
byANCj4+Pj4+IA0KPj4+Pj4gaWYgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcn
LCAncG5pLW5hbWVzJywgJ2ZhbHNlJywgJ3RydWUnLCBkKX07IHRoZW4NCj4+Pj4+IA0KPj4+Pj4g
bm8/DQo+Pj4+IA0KPj4+PiBJIGRpc2xpa2UgY29udGFpbnMoKSBjYWxscyB0aGF0IHJldHVybiBm
YWxzZSx0cnVlIGJlY2F1c2UgdGhhdCBzdWJ2ZXJ0cyBleHBlY3RhdGlvbnMsDQo+Pj4gDQo+Pj4g
U2FtZSBoZXJlLCB3aGljaCBpcyB3aHkgSSBsaWZ0ZWQgdGhpcyB2YXJpYW50IGZyb20gYW4gZXhp
c3RpbmcgT0UtY29yZSBiYmNsYXNzIDopIA0KPj4+IA0KPj4+PiBidXQgdGhpcyBzZWVtcyBsaWtl
IGEgY29tcHJvbWlzZSB0byBtZToNCj4+Pj4gDQo+Pj4+IGlmIG5vdCAke0BiYi51dGlscy5jb250
YWlucygnUEFDS0FHRUNPTkZJRycsICdwbmktbmFtZXMnLCDigJl0cnVlJywg4oCYZmFsc2UnLCBk
KX07IHRoZW4NCj4+PiANCj4+PiBJIGNhbiByZXdvcmsgaXQgdG8gdGhhdC4gSWYgdGhhdCB3b3Jr
cywgYSB2MiB3aWxsIGJlc3Qgc2VudCENCj4+IA0KPj4gU28gdGhhdCAqdGVjaG5pY2FsbHkqIHdv
cmtzIGJlY2F1c2UgJ25vdCcgaXMgYm90aCBub3QgYSBiYXNoIGJ1aWx0aW4gbm9yIGEgY29tbWFu
ZCBpbnN0YWxsZWQgaW4gdGhlIHN5c3Jvb3QuIFRoaXMgZW5kcyB1cCBnaXZpbmcgdXMgYSANCj4+
IA0KPj4gbm90OiBub3QgZm91bmQgDQo+PiANCj4+IGluIGxvZy5kb19pbnN0YWxsLiBJIGRvbid0
IHRoaW5rIHRoaXMgaXMgYW4gaW1wcm92ZW1lbnQgb3ZlciB0aGUgb3JpZ2luYWwgcGF0Y2guIFRo
b3VnaHRzPw0KPiANCj4gSXQgc2hvdWxkIGJlIA0KPiANCj4gaWYgISAke0BiYi51dGlscy5jb250
YWlucygnUEFDS0FHRUNPTkZJRycsICdwbmktbmFtZXMnLCDigJl0cnVlJywg4oCYZmFsc2UnLCBk
KX07IHRoZW4NCj4gDQo+IFdlIG1peGVkIHVwIHB5dGhvbiBhbmQgc2hlbGwgc3ludGF4IGhlcmUg
OikNCg0KWWVhaCwgc29ycnkgYWJvdXQgdGhhdC4gSSBibGFtZSBteSBjb2RlaW5lIEnigJltIGN1
cnJlbnRseSBvbiENCg0KUm9zcw==

