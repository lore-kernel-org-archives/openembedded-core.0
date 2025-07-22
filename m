Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9992CC83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 13:06:13 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.14])
 by mx.groups.io with SMTP id smtpd.web10.12050.1753189565870185805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 06:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=b8XhEGGn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=b8XhEGGn;
 spf=pass (domain: arm.com, ip: 52.101.71.14, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cJrhIZCA0vhX7P6F24Dm55GXgndbc4mftE8Rs/p1RrOJwtM0iRGv8djiwanHq9twNr0kPY/gChvbPdxQ7bwvOKjYY7aOlwv0IwYjYRcaj9mPZyJiqV69WGjWl7jOwpkOL3getw1qxGibsLt2AxKyK03mC1Fe73BaIafhwEgTp3YUKgcgIPc5qa4FBEDeaaw5YgwRJ+TQ14HVgx0v6ZHC2k2kENKvxWuGIdRYK04Le/pJG6O2Oovd6r9Lvw6jotQ+BZQAHKJMxsNU4djG0JvUdQrbBICU+LOJxuDwzf6L05AbC5/y/SJj9pou6RQK3/flEhysFpOnqu3u0kxKQaOQrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqviBxaEz5loA7CXubrCpo333RawNrHYIToC2sXV4Gk=;
 b=N3U4RziU15Af3ms6NRFvjwTrnm2s40JKKYsP7HSIa5EGllpFFjZ3004UKtTh1Jk5R0MuigaMNL8q563RuXpMHTjgD46B47vlTszhA/0vQcL43ZZFypYmpQworJ4nhEFJO+H2WCQzbVKgOZM6gjsG1fSmxhVKJte9vyHm4ZRVjwEWk1AUDJJkRz8N828+jwACTCuU3XZkEFPGoEbkv1SuqHKs/JNkBD9uYPMjLkpD5rOkrGgXWpCCJ2eWbEKd0toIWOZPUnTMNDz8xM0wOgrvi6E4JWIWkFMEImYVL1SDMKAch2gXAkGX0MG6Sc259Y5PoYiZkpkzyAviLsjiriXCsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqviBxaEz5loA7CXubrCpo333RawNrHYIToC2sXV4Gk=;
 b=b8XhEGGnhxN6y9xjMdXkOk9/uR5qxUHBZnx1KqJml+r9Pblz/8k8mVRYUkINhk4pq++FQy7/O3+U64k3XctZuL53jocwKIMcfoSGf4HaDUI6JokMYKuoZLmSb6+ogFFnhbe9LEsy8P8nDYgEP/xV4wKldn45+gzqteSCAMV5CeQ=
Received: from DU2P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::25)
 by DB4PR08MB8006.eurprd08.prod.outlook.com (2603:10a6:10:38e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Tue, 22 Jul
 2025 13:05:59 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::bc) by DU2P250CA0020.outlook.office365.com
 (2603:10a6:10:231::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 13:05:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 13:05:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkKh31ny8OsPVoTlMQQBaJ/VsCuNBg3n59FMfTvUt91eFoTrJKPRMvewhZCkc2Acc8uZthF/QZo5b3dUciM8XfnEf2Mu+BAGN6vacmp+kL73qRjy7IvaWRT4A2NPyi+JllECMG2c2P3JNzIaxqvdnXLwFGGVyRaxrO+xI/qwyKlulgbhhZjIJvHP25bAVuNXcHEu0PLDjQKc3H5QL4VGQJIAc0IyEI+cnzQAgDcAell/Saw+UeEgbaYQuy9qCRQCqq16V2hC3QrGhA2SfZbZ5/nuZCh1qf3oRjnMJArQEisSVTupW9Sj8q6EtpBpFDJooOwtHbVKP5ySYkaIjhTpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqviBxaEz5loA7CXubrCpo333RawNrHYIToC2sXV4Gk=;
 b=CoiKzFMufAmWKvpzhURKYtvk6Q/Zi7WBQzLLn7dGIzIkO9YiynCS3JL3f4CiCvZ/fTxxiQpky53faAmNAnc5PLJcXZlMekjaiPNFRugHFMbBbe5xJaYqov2e5HErEmT/1twr7qk+bIwI+M/+C2wsPZO4CTW3XylBrpKdOQbH9vmcPW+Lj84f7puZVwLcBXWRn2qtIRKDsD6UUmXgvHwZ0exDDXtWlgXKLXSDH3NIuAXJJBxh3iA5XB8mizY/8Ji1cUhu7AJmyze1ie21h0dd3sAXe++qZR/IkXeOOHqr1hPVFX94pdx5VHnL8fIoH9LE6A4yMpUMDNtpSMJhXiK1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqviBxaEz5loA7CXubrCpo333RawNrHYIToC2sXV4Gk=;
 b=b8XhEGGnhxN6y9xjMdXkOk9/uR5qxUHBZnx1KqJml+r9Pblz/8k8mVRYUkINhk4pq++FQy7/O3+U64k3XctZuL53jocwKIMcfoSGf4HaDUI6JokMYKuoZLmSb6+ogFFnhbe9LEsy8P8nDYgEP/xV4wKldn45+gzqteSCAMV5CeQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9532.eurprd08.prod.outlook.com (2603:10a6:102:312::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 13:05:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 13:05:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hiagofranco@gmail.com" <hiagofranco@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>, Hiago De Franco
	<hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH v2 2/2] systemd: add libblkid and libfdisk
 PACKAGECONFIG options
Thread-Topic: [OE-core] [PATCH v2 2/2] systemd: add libblkid and libfdisk
 PACKAGECONFIG options
Thread-Index: AQHb92Arse0rWHXdvkSlJc342k831LQ+I8YA
Date: Tue, 22 Jul 2025 13:05:25 +0000
Message-ID: <0EF31473-A2CE-4FE1-B920-777048FFE49F@arm.com>
References: <20250717211621.7122-1-hiagofranco@gmail.com>
 <20250717211621.7122-3-hiagofranco@gmail.com>
In-Reply-To: <20250717211621.7122-3-hiagofranco@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9532:EE_|DU2PEPF00028D02:EE_|DB4PR08MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 06fca18d-9e4b-4ea3-47aa-08ddc92080b3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NXdSNEcvNGZaVC96WDFHU2tXWEJUSnlJazF4UVlrRDBIM1BsMDRydmVndG5X?=
 =?utf-8?B?NzRmOHZqN3ZEWlIxMFJRczNkaTNJN0tkbTVSZEY1WTlUL2NJNDJqREJsVzBG?=
 =?utf-8?B?dWVtVjJINkl1UkFiNTNQMDl3RUwxdk9NdURyMkdDL0hPdGtMZ21SbTFPUG5M?=
 =?utf-8?B?UDMyQ2Y1aGg2amI0RXpjM3c3ZUZnZ09uYmVRRmR5b2Z5N3Z3aGZvcExleWw0?=
 =?utf-8?B?ZDJVSnpNUzd4MzA5UFg3UTN5Yk5Ga3JQSHlnWDVkT29XTko1N3Z2SlIwczZz?=
 =?utf-8?B?eW91OXByQzAxQWN2MWpXTXdpcVBWRGRWeEcvdXNRMzg0SzVoVnlHeCtoVWU5?=
 =?utf-8?B?UDhCSzI1U3VjUHVXcDU5Tk5HZXFabnc4UDBJaUR3RTljeXQwQU9ZanFOdnJU?=
 =?utf-8?B?blFjMFE3N0doNytCQTFBOUdPTjB2U1pBbzRabkFoa3BtaVpaekRPOHpUUkEw?=
 =?utf-8?B?WEZrdW9WdzJXWC9hTTNHQjYrMXJlYUpaUmFXbEVOZVJFdWRZUGo2UGJTcEll?=
 =?utf-8?B?WmlXSDdPU2docERrVnFjakpGOUdvSDhBNW1QcFRWWjBLZ3hxODYvelRKKzNP?=
 =?utf-8?B?OUZqenVkcmJBZy82QnNuZ2I2eWtiMXlVL1dxbmRaTGVnTjg4R2ozcTBoVUdy?=
 =?utf-8?B?RzJjZVc2M1Y4aTI1K0ZDQnZQbERrRmphN3A0cTczK3BqVWVEOVNVSzB2NUhP?=
 =?utf-8?B?QW5jNmMwb0dVdytxL0dJM09VakJuRmNsNnBOT2RBL1BGZktwOE1BTWh5UFVI?=
 =?utf-8?B?VnVhTnpUdEpmcUVWSU5YYU5aam41Uks5VHgyMGxxZHVmNDdJVGhKMzZacENO?=
 =?utf-8?B?bEh1RC9GdlArMXFPVVNyTDc4NVpBNUJzWEZuTStFUEozbUtxcStsc2hLVjZo?=
 =?utf-8?B?MjU0RTdZV3ltOEZvclBkTW41V0dmc0JzL1RMWTY1d3dpb3Z2aXhvbnE5YXJH?=
 =?utf-8?B?SmM0OVhhYXFVZ2lYdC93MUdSZXVTZ3lUa3dFY2dyT1djSUx6UnNQdTJHdWtT?=
 =?utf-8?B?K2pnQXdXV0ozb3hrUVF6TU5NOUtBM1FURy9PM25QSDVUU2JLbWZPdGFqQUt6?=
 =?utf-8?B?WHhnZEd1OFpFRHQwN2dMS1F1eTE1Sk9hYjgrMXpUWHBGVXg4VzljWmlqNkdR?=
 =?utf-8?B?SW9wNzd2ZzlUZlJVcUdGZkhGd0h5d0dwbG1iWklJWExZVHNtZ0MwQUwyS0FP?=
 =?utf-8?B?clZMa3pwMDhGTFJEMjJYZzFHckdtWUlaeEg2UFZoN0xpZDFUTTI5N2ViR1d4?=
 =?utf-8?B?WWg1UEtqVFVHZEp0VFNsc1ovV2d1VUdhTjhoZVNOVU1KRlBOTmJLQUQxMkRu?=
 =?utf-8?B?VzgvbmFacEhGUmlXK2tTbHA1T1RMS2EvSktPSXFuaVhIYzNFOXZFVmx4UnNE?=
 =?utf-8?B?bCtqN0JUb0h1Vzhid1lxK1hwc1IzSXF5bVJtZmFIdUpXV29vWjd6ci9MVFJn?=
 =?utf-8?B?dVVwRHpQOFA4ZWpNMnJWeXdDTGcvamd6R25XbWg3c09oUFBwWVdRbENZM1ZT?=
 =?utf-8?B?eFdtdHJNa0NyNFlBcUJDSnhGTENCSHZPQURjaGFHK3FVRkZudHlINkxyaWVv?=
 =?utf-8?B?OWc0Y3pjcVIxNWVYQUFVSmVDUkc3L1VJcWpVOXdnSUhSa2lhZytZVkQwTWxh?=
 =?utf-8?B?ekM5a0VkSE9WMjVlNnZ5ekl5cDJTZmkwTmR4NW44dlBVMnZtT2VzM1YraVpR?=
 =?utf-8?B?Yjk4Skc3TUpJWDFsNXMvZnFFenh4VnB5Yk1uTUNoUHdqQnFIOTQ3MVRqcEUv?=
 =?utf-8?B?cUEvcmdobXFZS3JWNm0yNHNKQmFXQVhmUXhJbFdyWE1DRTFJVmJIY1AyaTFz?=
 =?utf-8?B?SHFiaW4vZTR3YUZSU1hXei9tOFQweFFoUnhZVGs3ZVl4OWVQVnlzalI0Zy9V?=
 =?utf-8?B?VkdaNnFib1JvTGhGTHpqdmVZbUpZdHVyL0ZtcWg4WlhVMmNkcE16bWxadFd2?=
 =?utf-8?B?MjIxRXN3d1VQN1BRaSttblZ6aXZsYjR6T1k3WE13TUMza0lIblBRaTkxeVZT?=
 =?utf-8?B?Q29OelNETEV3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E68B11D8612AA84A9C70A2A4A2DC1E35@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9532
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d3f54c5-8278-4589-31ce-08ddc9206c65
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|35042699022|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d1krVzVJdjI4SlV5NUQveHBuYzRHQU1kRk9CZnFGR1RxWTZuYUgxanBHdVFq?=
 =?utf-8?B?S2JncUxHZ1pWNXVkdTRDTmtQNU1uL3RYc09SM3YrMEJTZ2dEcnZnS3dDYmVl?=
 =?utf-8?B?NnhINGNkdWtXdEhlZWZrd1dGZnBPdUZhQXBUQkovWG5GenZ2TklnTnJic0Ry?=
 =?utf-8?B?NDU2RXc5SnJUQ0MvbG5WVDBNbmU2K3NBaWc4ZmxRRWFMVEJIWm5WRUNHL29F?=
 =?utf-8?B?YTVWRWwvTWI0Qm43WnlOSDNKaGRTVitjb09LUkNXd0NDanA5eWVtRVJDY0xP?=
 =?utf-8?B?UDBPS08vQUE1TnNKN0NuVnZRM1dLVS92SXhhb2laM2RUNFBmclMreHcwNXN3?=
 =?utf-8?B?cEdMWkpSbVZPK2EzM3VQcHloMVRCRm5xbkZvNlpLOUF0TTRzSmRGZHdYTURL?=
 =?utf-8?B?MzBORk40YnowV3hUWTRQSzFmb1RhRkZ3MjBEbGs4VnBTbE95WWRxWGpqS1dS?=
 =?utf-8?B?TVZuRXlod2kra1hpdFRodllxY1piaVhQc04zOGtJWEE1NlBsWXVpeGQzTWJw?=
 =?utf-8?B?M3BnS09ad3lWZFJHeXlTMGhvWUIxS3dDMm5FcmE0Q3RKS2k0cUhGWmJyWktN?=
 =?utf-8?B?OVorQUVFbWlmcTlYMmxOcjBidHZRYW9TZERQdUhqNVB5eWZjb3NjSlVGYm44?=
 =?utf-8?B?YXVPb2E0OUpJQ3BId1NnMHhmVDZjd2lPWE5QOGxMZ1N0WkgvVFZldzBwVGdL?=
 =?utf-8?B?UjVDbXRudGZFQmF5eUFFUTQvc0s1S0xveUU5ZndvMWVSdEFobFlRdHFtekRm?=
 =?utf-8?B?TDJrcnRsMnUrSHYwQVVUSTlBb3NBbDhrOG1MdkJ5Y1dEYTFHamE5b1NHWWpO?=
 =?utf-8?B?YnVHMmRnZUJta1ppd2NXemR3aEJhYWYzMktXbDhIcS8xamhxb09xVDZGeHRx?=
 =?utf-8?B?VVh1ZkhCb2N2WmN3NFlERUR5U1hYbUlDajBEdDd6bnNxU1d2WUtzSmZoaDRP?=
 =?utf-8?B?NWlueFdYb3VZQkNCbUIrRTJxbkdhRXMwSHhUMWlvQ1lVYlg0RUhLVkhSRkhv?=
 =?utf-8?B?YjFmZUxaTUpGSE5wNDJwcSszcENhRmdBR3UyeWdmQWtqd0VEenB0MmpVM1dz?=
 =?utf-8?B?UlFPSHRkWW5ONjV3bnNUZzQ0YldJTnp4bXc1MnZtM244cVNOWmVTbG14V0ph?=
 =?utf-8?B?aHhyZm9pV1hRUDlWeXBOYmxlS3RHRU0xVXlPTnhqZGtIdUpKQ2ZRS0E5S2xy?=
 =?utf-8?B?OSs4Q1RFYUdvRGdqd2RMRmtkbGx0aENvMlozZDhQZmlxUGYrOEl5VXdDNFJ0?=
 =?utf-8?B?Si9rTGpaUmlzdjNBU21ZbHl4OUlMbWVOMkhjQW9ubk95U2tBOGk3VzJBRWV0?=
 =?utf-8?B?TnlFSHJhMHA0QTNVSkpvR2FzK0FlTm1vTlVXUmxVUm5HV0RjenZzdkZHbmVh?=
 =?utf-8?B?VFdEbnJqdDR4elRMcmo1cE5aWTR2aWZ6eXRKdzBjTy9TTU5KMGVleEQxYVVt?=
 =?utf-8?B?eVJPRFBmSjUyKzhNK3ZXNERwVFFQRU9Cc25vQ0VuakdXQ3ZlTlp4bHB3Q3l2?=
 =?utf-8?B?TlBzNjNMeEU1cllQRUJaNzVHeXNMYW1mTktmNzFYVGxZT3FwMWZVUVhldjVp?=
 =?utf-8?B?MzhYUU1YajJGMFdpQkZqWHRidVhPVzRzcWU0TitaN2c3cXZFNDRSZ2tURXh3?=
 =?utf-8?B?eXVPTmZtN29xM1BYNFl6dzM4VW5pbUlHSmdGU2NHK09jTTJhdFp0dmgvMHI0?=
 =?utf-8?B?WEgyMGd0aUZjeTRIcmhDUzdVd0FsQ1hOS3RxRnFhOWQxcHllYTF4SnZCbE5U?=
 =?utf-8?B?RUxsN0grYkNYRG83TytqRWRMUTRkSWU2NDRaeVJTanZmRXgyV1R5NE1heWU2?=
 =?utf-8?B?M2QrenVITnl4TG1LL1lIK1RZbWlFR2ovUWx5bFNrL05LMUprekxBQVRsZzg4?=
 =?utf-8?B?MFlwYS9iQ2RQejhWMGwyS1Brc0tzcno3VzVraW83N3ZiN2xFSUZTRUFpSFJw?=
 =?utf-8?B?TjF6d3cwNXNtVHJ0WlFmTUcyR1FWaU1xd3l3K2JWMWJDck1ndXROT0ZCZlNh?=
 =?utf-8?B?b0Evc1hqb21hSlZtb2FybVJyUWc4dWNBU01Xd3ZFdW9EZ1dTOVlIYUFWalhy?=
 =?utf-8?Q?6uMJgu?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(35042699022)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:05:59.0848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fca18d-9e4b-4ea3-47aa-08ddc92080b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 13:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220745

T24gMTcgSnVsIDIwMjUsIGF0IDIyOjE2LCBIaWFnbyBEZSBGcmFuY28gdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGhpYWdvZnJhbmNvPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gSW50cm9kdWNlIG5ldyBQQUNLQUdFQ09ORklHIG9wdGlvbnMgaW4gc3lzdGVt
ZCBmb3IgYm90aCBsaWJibGtpZCBhbmQNCj4gbGliZmRpc2sgWzFdWzJdLg0KPiANCj4gU2V0IGJs
a2lkIGFzIGVuYWJsZWQgYnkgZGVmYXVsdCBiZWNhdXNlIHRoZSBib290Y3RsIGNvbW1hbmQgZGVw
ZW5kcw0KPiBvbiBpdCB0byBiZSBidWlsdC4gRm9yIGV4YW1wbGUsIGltYWdlcyBsaWtlIGNvcmUt
aW1hZ2Utc2F0by1zZGsgcmVseSBvbg0KPiBib290Y3RsIGFuZCBoYXZlIHNwZWNpZmljIHRlc3Rz
IGZvciBpdC4NCj4gDQo+IFByZXZpb3VzbHkgdGhpcyB3b3JrZWQgaW1wbGljaXRseSBiZWNhdXNl
IHRoZSB1cHN0cmVhbSBNZXNvbiBvcHRpb24NCj4gZGVmYXVsdGVkIHRvIGF1dG8sIHdoaWNoIGVu
YWJsZWQgdGhlIGRlcGVuZGVuY3kgaWYgbGliYmxraWQgd2FzIHByZXNlbnQuDQo+IE5vdywgd2l0
aG91dCBleHBsaWNpdGx5IGVuYWJsaW5nIGl0IHZpYSBQQUNLQUdFQ09ORklHLCB0aGUgZmVhdHVy
ZSB3b3VsZA0KPiBiZSBkaXNhYmxlZCwgd2hpY2ggdHJpZ2dlcnMgdGVzdGltYWdlIGVycm9ycy4N
Cg0KQmVmb3JlIHRoaXMgY29tbWl0Og0KDQpSdW4tdGltZSBkZXBlbmRlbmN5IGZkaXNrIGZvdW5k
OiBZRVMgMi40MS4wDQpSdW4tdGltZSBkZXBlbmRlbmN5IGJsa2lkIGZvdW5kOiBZRVMgMi40MS4w
DQoNClNvIGZkaXNrIHNob3VsZCBiZSBlbmFibGVkIHRvby4NCg0KRnVydGhlciBkaWdnaW5nIHJl
dmVhbHMgdGhhdCBzeXN0ZW1kIGl0c2VsZiB3aWxsIG5vIGxvbmdlciBjYWxsIHRoZSBibGtpZCBh
bmQgZmRpc2sgYmluYXJpZXMgYW5kIHNpbXBseSB1c2VzIHRoZSBsaWJyYXJpZXMsIHNvIHRoZSB1
dGlsLWxpbnV4LWJsa2lkIGFuZCB1dGlsLWxpbnV4LWZkaXNrIFJERVBFTkRTIGFyZSByZWR1bmRh
bnQuDQoNCkFsc28sIHN5c3RlbWQgbGlua3MgYWdhaW5zdCBsaWJibGtpZCBhbmQgbGliZmRpc2sg
ZGlyZWN0bHkgc28gdGhlcmXigJlzIG5vIG5lZWQgdG8gYWRkIFJERVBFTkRTIGZvciB0aG9zZSwg
ZXNwZWNpYWxseSBub3QgdG8ganVzdCB0aGUgc3lzdGVtZCBwYWNrYWdlIHdoZW4gdGhlIGFjdHVh
bCBsaW5rYWdlIGlzIGluIG90aGVyIHBsYWNlcyBzdWNoIGFzIGxpYnN5c3RlbWQuDQoNCknigJl2
ZSBzZW50IGEgcmV2ZXJ0IHBlbmRpbmcgYW4gaXRlcmF0aW9uIG9uIHRoZXNlIHBhdGNoZXMuDQoN
ClJvc3M=

