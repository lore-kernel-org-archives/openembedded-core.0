Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B54BCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:03:10 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.35])
 by mx.groups.io with SMTP id smtpd.web11.52957.1758549788591368158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 07:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jG6qQ66N;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jG6qQ66N;
 spf=pass (domain: arm.com, ip: 52.101.72.35, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=C2Cadfs+J1zRowXWy4rRM1xni+X6+URUKkE6avwNdaZcAkpPiuIGl28n9cguqSmkQqd/LGUINFAUbp7MOf6FPaPKrZJXvqbEE44EFbRfHQMMqbOb9eislXDvoRYqFqKLroH7fjDEU0O+sf5KdPmxgMYICXJ261f0oxkizdVk4AA/VeMLolIOy5LirZTlM43hc4pZXxylfc7Tb7UvPz2uGdPZl7Kq9J9kUtDhX4Sci7mTxkKlTSnjGPVLaLB53y1MZtS9FN1l/fXKpi3gadN1L2HQHiay4vJMy+elRGmFz1Pj7Y9srEzV7BmSbVVqWg0UcFSVfBfcs04YaOHPmFyF3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JW+vwZ2mP3SmtsA7n8r5nUfYZZgo2V+YawGkdK0tiYE=;
 b=og6xlmKy8v95x5/sazkEV4wEID2RbcLHdkP8af1Xr7LIznoY7mB2azH5HzPw8kH8YRIdDNwT+j+6n3eegiM/2r4EzN8goOhROnTRiLdEBW6otn5LJFF0Ke0KuVWrWuETD4IAVuLUx6/ClrId5YgueuIeyBjKPqtUsV51ks7G5ZS+1YJls4V6nlD0VEu3qtUrb+kXr8TvaOW7cjZHEIc2EFhcwfOZ04Gc67eNoYqZkx++AZVjV4ZHWYppVzOHGXCtLc+tfhKUBtCwISIxj6bIYc1TgNI4g4EJZ0W5Qy+cWTfimwRFXVv7PPQxBYruALc3TuIbIvwl4AFao4c9dUOUsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JW+vwZ2mP3SmtsA7n8r5nUfYZZgo2V+YawGkdK0tiYE=;
 b=jG6qQ66NpmTCG68kenS0e+Z+ffWu3nSdZHEC/sCScjo4wDdw/R5fYmQvGr+aQFOxZe388hcHL/VKASu0zXHSTXhSQnHq0tLXogBamOAhJvmZjbtM5N9+fJd6gO845JcNMDGp41PAYahXZ1ZguzTAR7nufQOo2/ZBDvlYeK8FQLs=
Received: from DB6PR0301CA0093.eurprd03.prod.outlook.com (2603:10a6:6:30::40)
 by PAWPR08MB11067.eurprd08.prod.outlook.com (2603:10a6:102:469::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 22 Sep
 2025 14:03:04 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::b6) by DB6PR0301CA0093.outlook.office365.com
 (2603:10a6:6:30::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.16 via Frontend Transport; Mon,
 22 Sep 2025 14:03:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12 via
 Frontend Transport; Mon, 22 Sep 2025 14:03:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHsO4iT2TiO/DeUvCYc0Ts5WIsP99xXNRFl6UVTA/JQa+GqOJN4MAeS9VpxyTlbfyTE9+lDP+as6UgWD/faFrRJz8hvzEk0GOGqXnpKlsFqPJJY0s0N2t5WHfZkQkdY+SNCdwItYHr+quIeoQEXhE4qVIlvRdeJ7UfGLeSKLgnY58S/lHw9khsa3b/VRh4RwnJxmfXxB8a+d/9QSHnZhlUdKH9bcmkvDrzg4YuRIXCZthMkNzQx5ERhKoMzSG/R+ZFLp0rlcvO4t3sW1c/zilPiwqSS8N0kfR7aCWTd2s+IO/aiNAL8A8plrua0YhNP9ctSGtBkyKlgm8FNLr7fC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JW+vwZ2mP3SmtsA7n8r5nUfYZZgo2V+YawGkdK0tiYE=;
 b=frtKi6XAlPa/8OPmSp41yheqssp9FkTmF8ETYHj9bqK4SSj5RJSO9McL/FMU07v38DECRvxjRp+pL5YkRUYhRfWEE1iwhupiX5S8ADeod1OCL9YrAOGy2YQGW0NLW9yibkM/HkHKVmaVFnUBl3NBksZhPscDs4pQ/62SXPRyCsX8r+B2LRs44HoPjNLfxUl7jgXghRuHohX6Mr6hq28h9JsZ/KFaX7X/YQtDLvOWH2L1JeoMW6flNUn2dPY3X83KsL35drbxuspLCRnYdDikR46dHLVWjUa5bt+JYscgyQ7CMReMDyMXjSsTOsl/8kwy76pYPOkx1EN3HyXhPUidGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JW+vwZ2mP3SmtsA7n8r5nUfYZZgo2V+YawGkdK0tiYE=;
 b=jG6qQ66NpmTCG68kenS0e+Z+ffWu3nSdZHEC/sCScjo4wDdw/R5fYmQvGr+aQFOxZe388hcHL/VKASu0zXHSTXhSQnHq0tLXogBamOAhJvmZjbtM5N9+fJd6gO845JcNMDGp41PAYahXZ1ZguzTAR7nufQOo2/ZBDvlYeK8FQLs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6082.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 14:02:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 14:02:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Why nativesdk-pkgconfig isn't installed into sdk?
Thread-Topic: [OE-core] Why nativesdk-pkgconfig isn't installed into sdk?
Thread-Index: AQHcK2E1CjJUNHz/B0y+ZeKdZ92XebSfPESA
Date: Mon, 22 Sep 2025 14:02:31 +0000
Message-ID: <23153FF5-4E2B-4868-AE5F-C83822DCB14C@arm.com>
References: 
 <TYCPR01MB11055F8440AAD67D3CFEC64F3A012A@TYCPR01MB11055.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TYCPR01MB11055F8440AAD67D3CFEC64F3A012A@TYCPR01MB11055.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6082:EE_|DU6PEPF0000A7DF:EE_|PAWPR08MB11067:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f71159a-a69c-454c-5a3b-08ddf9e0bf83
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dEFWRzBRNDN5QkJiSHBqMjArVkpJc1RCODdxZnhleEliR3ZTM1VMMkdKRjho?=
 =?utf-8?B?RVZQMDRUNE5qQ1R0RXB5S00xUWxLTFlHdHBoRTkxSHZyRUxoT0hyYThaZmxS?=
 =?utf-8?B?L1MrOXpCK1lRN09CdDVXUWxycXEvMlNFK0p4U0hpUkMzVW9SY2FvK2F3d3BO?=
 =?utf-8?B?R1hNQ24wYU9hMUJ2RkpISXQ4L0h1ZXg4aU5uQnhnUm9EYmZYZHBwRkErTFor?=
 =?utf-8?B?bFFrVG10VndEbTFQN3h0R0lDVWVNWU94WWxnSHRxaTFaYVdMcGVOb1hXdTE0?=
 =?utf-8?B?WEpCYnVXbzgwb0pKMi9XK2JmUC8ycENjNXRjRWxmVjJuaDYrYnhLRVdKZ3Ru?=
 =?utf-8?B?MDVybDd2UHYwYWdSbTVmSU5xV0JpYXl6RmJRSm95REhreVNuTVVNRVROUDIy?=
 =?utf-8?B?VGZDUno0aHlxUWIxcFljL0l2K0pxQnJLWEg0L1BvQnpGdytsalYydmlnbk1m?=
 =?utf-8?B?aDZOL1RZbnNQSENLcWthVzhiOGQ2R0g0MzBjV0o3UlFXSEFtVXNTcUtaRDhV?=
 =?utf-8?B?VlBETGkxckhUMnpNWm1VcmRaN0FUTTZ4QWE3bUE1ZEwxeGVCQndlMmF5enRs?=
 =?utf-8?B?NXFxMDBSTG54TzVEWU5IRkt2Q2NWTUw1WkhqT2VGeU5OWkxwRmhXL3kzMWFy?=
 =?utf-8?B?Yk1iWWUxVlp3MFNTRzEzR2lvMXQ1bHB1NmtCY3NGc0t2bS9sTHdwVHVXVkpp?=
 =?utf-8?B?S3Z5YXlWNk5MRXA5cFppd3B6QVZ1akMrdjh1TTA4eVpMaDNyUHlzSXFZRzhL?=
 =?utf-8?B?S01oekV0LzhVOXFpSkZzazB2dmJQNko1VktPaFNMaVU2TDVPRDc3N09oTTB2?=
 =?utf-8?B?aFNDRm0vL3BaT3Uza1kydWhzRmNtcTRja0dRMTBJdDRvTDB2RkdEa0UwRXg2?=
 =?utf-8?B?MzZIS1d2VDJhc2o2eHZhVlhWMWZWMjl5NWJROHVkSzFqUmRlaUdSMFFZVy9H?=
 =?utf-8?B?bkRzWlBPOEpHTUZyOFN3MlM0WG1yRlJoOVNOaE82V0dvUnJ4dFdqK1JvVkhO?=
 =?utf-8?B?dm1HaVZTYU0zeTdCWEhpZDkyanRHSHRmN0x6RUErZ1dGUGVFSHRtb0VJTHFy?=
 =?utf-8?B?OEFRdTBPZDZTSVJjanhnT3Y3K1pTOVdCeGcyZ2N0VmRMN2dzU3NhUmNBblpG?=
 =?utf-8?B?WGZjcURPNVdReHhMTTBoZjRVSml2UUJhYUE3amYxdmF3SC9PaDZscVVOckRO?=
 =?utf-8?B?Y1JXcjh3dDZ0NXdac3J6MytRbXFCNzBkRGhKcENBbkFqbmk5QUVqNkxKbXdu?=
 =?utf-8?B?dkpKbzdSRTdQVmFFcXVkVktUMHFEMlpEOEF3Mkd2T2FlZS9lb1ZIRFJPamYr?=
 =?utf-8?B?QkFGV2JUUUZnYTZZaWN1bXhwZlpTa2ZxNXIxL0UxMFhGNFdwUlRBSjdwK0lk?=
 =?utf-8?B?MHo5cHdQeEtnejVVVzdPYkM5bGsvcFg5ZnBXMmlrbHJ3VXhzbnFYQzdvNmxl?=
 =?utf-8?B?WVJ6TCtpNFNCSVdML2FSaUt0RHJRd2x0bnl1djBJTmFQdnh3YzdETGpBQWJJ?=
 =?utf-8?B?QkoySW9SbEttK3JlaWQ2RGg0SlBuNXBQdnZld0U3YlFicTBmUkVEcXAwcVNa?=
 =?utf-8?B?Tk0rNnhqMmdFWWExbnJhLzMvTGtMaFlvdlVHZzJqL21HdGM4SjFPOWJaeDMr?=
 =?utf-8?B?SEFjTzhCT0p3TmtIS3p1OWdHZUVrZ0VIcHJNUWMwL2RMMURKc2g3RmxCWDlS?=
 =?utf-8?B?clB5QUpIS2V3MFFQWWszeE9zUSs4MUg0ZERTWDFUNHJaek8zNG44VE1lNHN2?=
 =?utf-8?B?SlNja01UT3hDSGpwbXRWQW9BekRzOTZ0Y1kwMm1ubFpMb3Mrb05nVkNKYjRE?=
 =?utf-8?B?WDZLY0d1TDdQRGVjWHJwKzBqZHZyQ2l3NU4zUmx0SEZJYk9sZGZNN2VBRFNX?=
 =?utf-8?B?VGpwRjkwVEdhTVJLaFlvbmZlM1ptWkxMMFhqTFI5WDNKK0owOWZYajdHengx?=
 =?utf-8?B?cU1BUzZOa05Nbm9PcHFtblRqVmFJVHJTQjJtK3h6YVkvTzV0YmZpcHNhcFdq?=
 =?utf-8?Q?ja7U7PlWQ16zHR9x1GkX8GEZDR/5HE=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <93B83F58B8C1E14DBB23D30B22C1C880@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6082
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8ec343e6-038c-40a9-7952-08ddf9e0ac87
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|376014|36860700013|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RSsrNDNBZ1ErcmNTNDZIamxVSkQ2ZGNoSVp3OHRIaW1GRFB2RERTWGN0ZVFH?=
 =?utf-8?B?MWtQWDdhSXVXN2kwMEkzeDNLSFpzSjYvcExrRURqcFZpWUNMYnkrRFozdXpv?=
 =?utf-8?B?OFpXT3JSbTJCbjF0T2ZpTWxLWUhDQkgwa1dqUUVlanZtYUlndklrMFdoVkdj?=
 =?utf-8?B?T1BUVWlTQVYvdUZubW1QVFZHTFJQV2x4b0JkcEM1OTlwZmRxdWV6a2YvTy95?=
 =?utf-8?B?MXZKbjgyNXRLQ0l1RXRiU1owQml2aHlRdExKVEkvTGtZYUE3dEsrQURydTVj?=
 =?utf-8?B?Y3FtSU9aVUdZSVBTbXdrZDdkL2s4UWZHMDRVZ3FZd0dXNlVsWDZieXJxcmh3?=
 =?utf-8?B?bElZOVhaTGZ6cDNSMURIY3RzT1Z1MkpuRDZYTFczcTYveXR6Qnd0SkQveEw0?=
 =?utf-8?B?cFE5MldnaUpZS096TlZnZEI2dmlpWDFhMDRnMlVtQlJKVWRQVU01NGFlbjdS?=
 =?utf-8?B?ZlFpTEJZRy9tNDdvcW4rdTdqQjdDem84Wnd5cUp5ZFF2Rm5ULzk5eHR0MzIz?=
 =?utf-8?B?dkF6Wkk0ZnNYWWVSQ2x6M1hRWWRNditoMHNscDhBK1VHbjZNL3RBVzBLZlpG?=
 =?utf-8?B?NUt5QTBObXV6MEg1Rmp3MEN1OVBNL1NyM3ZTU0RuVEcvaG9zUWcrWVE1cDVz?=
 =?utf-8?B?bjlWeGdnZXdCckI1ZHlzL3NMa3IydERXWVJ2Vk10d2pLY3VNaTA2UWdtUkRn?=
 =?utf-8?B?Slp5VnpyU21OYlRXQW43UmlwdnBGWTlTWkFsdVJwa1Uwb1BoY0EzblVxLzly?=
 =?utf-8?B?ZUhBc3NtaFFzbThNSXcyRnpGc0pjdWl3dlB6M3B4ZE5WOGk0ZG0wUjI1R29j?=
 =?utf-8?B?Yi9RNUc1eCs3UTRhdDRHZzF3TG9uUlV0cWlGRUlGbDVwNktjb3VRWnNkZlpE?=
 =?utf-8?B?TXJlTDM4c2c0cUFlcS80dk9LbG03ZEFJQUx0dWQ1emFteDU0U3dPa1pmaFo0?=
 =?utf-8?B?VkpEY3NhZjNoenZtM1VUL0tEWEtzdTVqakRxYjRpUnorVnBUSENRaWI1aTc5?=
 =?utf-8?B?MlhKZDVmdmVLRmcxbkVkcDJHbnhML204REhzcUNMdlFHUksrdWtoRjE2Ylcr?=
 =?utf-8?B?ZUcyTXU5RUd4Vm8zOUZadGUrN3ZBNFBaWHpFOGJUbDhVYXk2ZXIvWHgxcktm?=
 =?utf-8?B?aUR6enB6dFVZOVdVMmJJVzU1SDNtMUdleXNLdmZ2RHBVdHV6MzRWeFNSbGNY?=
 =?utf-8?B?bWFQT3V1UysxNzI2TjdMZC9IWi9jNGF5ck9ELzA1WGcyYjFOUHFZeG5PeFhs?=
 =?utf-8?B?Ri9XRUdIbGxpMHI5QU81dXFTRjFlN2F3bi9zclE1TmlqZ1ZEcmdUQndwOEVR?=
 =?utf-8?B?T2daWmFFeWFoVENoeFNNcWJjVUFmQjA4WXNyY2RPQXA5MXg4ZEVDc09zSkF4?=
 =?utf-8?B?RVhwcnJ0RGVKOXFoaC9kT1lodWxRVFROaFo3S1E1aHB2T2dPWG51VXpzNnpP?=
 =?utf-8?B?Yjd6QUZSWE5sUUxXZHFUMjJXL2JqTENITDNLWGVIZEJyOVdNSkk2ZmJqT21y?=
 =?utf-8?B?TnBJYW85eGpsYVJ2N3U2bHpMVnlkZFY2UE0vMUcvWHFnWFoxa1lWS1Y4KzNI?=
 =?utf-8?B?UEpTNHV2dTJHQ3AyM2pIazFRWGlZUU5ydFZjTENSaHBiK1BkZjk2YWdqMEUz?=
 =?utf-8?B?dGpBaFplNlBKMnpkQm9aSXh6V2pYVnhnV01mdzdSNmlZRmFSM25JSEQrUWVr?=
 =?utf-8?B?UHg0ZUQveW1XT2xkNG9JWWlvbFJGdkhYSEtwZHhKd29iemtFYVJsUnRHWGRo?=
 =?utf-8?B?ci80Tmd2R1hWTkI0R1NVMWd0MWNSbTJOcHZVcjZVL3ZsK09nZVBGeUxjRktX?=
 =?utf-8?B?YVoxdVkvU21vN1VPNU9Jd09lRGJFeEhJZWJnSTE4QVUxK0R0L2lXa1FVQTZ5?=
 =?utf-8?B?Tkx5Q3laLzZnYWMrMVRubEQ3TkM2dUVaNW10WWUyL0s3NGxQeDBlZjhQa1c2?=
 =?utf-8?B?bWlOYytGOVEvMWRvZmRUQjUxV0J5RUJzeG9adWgwN0czSTBkNnd6K1BsRFZz?=
 =?utf-8?B?ckMvQUE5c3NMbUI1UlM2ZURvVWRVY2F6eVY0ZHgvaHl2SWxzUitscE5BcHJr?=
 =?utf-8?Q?h2bOmb?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(36860700013)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:03:03.7068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f71159a-a69c-454c-5a3b-08ddf9e0bf83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 14:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223825

T24gMjIgU2VwIDIwMjUsIGF0IDA4OjMyLCBsZWltYW9odWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPGxlaW1hb2h1aT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gUmVjZW50bHksIHdoZW4gSSBjcmVhdGVkIGFuIFNESyB1c2luZyB0aGUgbGF0ZXN0IFBv
a3kgYnkgImJpdGJha2UgbWV0YS10b29sY2hhaW4iLiBJIG5vdGljZWQgdGhhdCBuYXRpdmVzZGst
cGtnY29uZmlnIHdhcyBub3QgaW5zdGFsbGVkIGludG8gdGhlIFNESyBhbnkgbW9yZS4gSG93ZXZl
ciwgSSBjaGVja2VkIHRoZSBSREVQRU5EUyBvZiBuYXRpdmVzZGstcGFja2FnZWdyb3VwLXNkay1o
b3N0LmJiIGFuZCBpdCBkaWQgaW5jbHVkZXMgbmF0aXZlc2RrLXBrZ2NvbmZpZywgc28gSSB1bmRl
cnN0b29kIHRoYXQgaXQgc2hvdWxkIGJlIGluc3RhbGxlZCBpbnRvIHRoZSBTREsuIElzIHRoaXMg
YSBidWc/DQoNClllcywgYW5kIEkgc3RhcnRlZCB0byBmaXggdGhpczoNCg0KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvMjAyNTA5MDMxNjQ0NTkuMjc1ODEyOC0xLXJv
c3MuYnVydG9uQGFybS5jb20vDQoNCkJ1dCB0aGVyZSB3ZXJlIGNvbmNlcm5zIHRoaXMgd291bGQg
YnJlYWsgc29tZXRoaW5nIGVsc2Ugc28gd2XigJl2ZSBub3QgeWV0IG1lcmdlZCBpdC4NCg0KUm9z
cw==

