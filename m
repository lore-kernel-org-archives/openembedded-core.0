Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF12CCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 15:29:11 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.web11.19661.1760455748760366993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 08:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nHTZ4oAF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nHTZ4oAF;
 spf=pass (domain: arm.com, ip: 52.101.65.19, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aOmffrwsc6fAmKtA3bBBRI50AzmSHlRine9Qw+SDHAPlNDbuMP6z/t92nQ3ZoeMxCeDhVTtPMwAVTRAlGCLkIB0UKsuVHudF2zrciLFkYJhlv8KvOcLSYQKucIkU+cczZ0zlQVbxfz61Ib+T/14+O4RnlJI2/I+uoC2e9jMkGaVC+VNv9xvpEXB4PgrXF3+b5bc17o8fPYRADgMjHAWEVuIFWLXBdQ6BliS9kSZz7zQNXclOUBB16VZjkxGUGeBNAIq2vGLmTRT5IGU8nXtcCZmA8xfIb2ggyT2kL7PvaOWxqxDxbTSsNHZ2wk9KHaKOYd4vkK3csgZnpkHxBhkkQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ1Lc6ug6Ilj7yEuFJbtIKeYGwxhi9ifq0CaC1so1ns=;
 b=xAMZ2LEeT4V9hUABMTUi0Q3hjiNi2J+iy3E4S70v/q2YgqpaF8EYqfDlb5NTHUPpG5Wc/TmJXS3uwzNW3xuVfjky4bAmvGp1pRlv0E4VygJ1U1FabyI+XIJTykL8TZM8gIY8BtoZzkhvRdqaej3u5zxk8l6MRNDhtPfO4lddxi2fgtCakH3kwCK5I7v8cnNoQwxt2LyWe+yQIQ2dwse12LkDubvIzP+u/yyst1/J/BSiWlIvloUcOZCAAFpWE2zegP9wVUDhrsPafDjIW9TlsGbfgV/0cNhJPcR4oZdJj50Wwbp+TvOFlWdxWmFMzJ9BmBMHjKMeJ7Ludi5aSF72mw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ1Lc6ug6Ilj7yEuFJbtIKeYGwxhi9ifq0CaC1so1ns=;
 b=nHTZ4oAFe+XJh5KSNR6Rz59ZEBFHjz6jOqt5Y50/I4yY7Dl5+B4znKbwO+0t6rfUXuTQLrqJTjU/oXDmE2AlsC5NAReCWofVg1Qtu9HFOP1gn3OtDrXlknyqdpY5RXCeMheXMF4u/tkTBqjZvq7HJrDPf4XRVWfLIxI8Q4h7xFI=
Received: from DUZP191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::18)
 by PAXPR08MB7646.eurprd08.prod.outlook.com (2603:10a6:102:241::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 15:29:03 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::ff) by DUZP191CA0014.outlook.office365.com
 (2603:10a6:10:4f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Tue,
 14 Oct 2025 15:29:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Tue, 14 Oct 2025 15:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVy0XDOLZWZxzpxUiO7AC7jXxrMIUgAp2bjMQt3klyuW5TBsYtYgLGn4k1CzentqD5xezKbERp07OmpzpTr1McdAYVQjV5wtrKM18cnsr6PyOlydMUbfn/ed9zRGF780VfwACWuX8tuKOWHOhrReI4tNbT4ji5OkrWZOTbmgunHBiMQxnLq0monw9fQuogCLfsc93mhYYlICw/MBZVnWbpPHr4N9B33oC8vvD5BZdH32hzIqY80XS+4FQfFFGoy/t9WtUG3HE0uhAp9Wr7YZnfjb7n2ZSPowyh8S6Yn0vePa4IoaU66OF6y6gaKp6yZ3LGzhWihLxkpdbiO7v1aOWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ1Lc6ug6Ilj7yEuFJbtIKeYGwxhi9ifq0CaC1so1ns=;
 b=dFjjRdToBHutCUiR1njxOvoBZKXXH5FdUGFJSgYg0pZkXfxcwNkV4T8N6FD2u3i1DzrQcrhlF5AH6E/xZ2keggcesQgXxYf/OdHk+ojitMr1d+uijuDWyS6C5knatjMZzXQPi5EiLmHfUypzDyEUtGXVsdTMQsCdq66oRKvheAmsMb3H6oKv88QzNsrF/n67FHi8QuVpIAwJohBGPIK1kFBmlEEG34FezjhWWNLSb2NVhKnF4t/Q8eQ2BoCPs3YFzUtiO8+YVYUUyz9jroxzN6qEL4/d9hUBdNgyfc5sN4rU3xCiSAt/lmHxP49IpTM7AILcgE2x6JGd4jmCprr9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ1Lc6ug6Ilj7yEuFJbtIKeYGwxhi9ifq0CaC1so1ns=;
 b=nHTZ4oAFe+XJh5KSNR6Rz59ZEBFHjz6jOqt5Y50/I4yY7Dl5+B4znKbwO+0t6rfUXuTQLrqJTjU/oXDmE2AlsC5NAReCWofVg1Qtu9HFOP1gn3OtDrXlknyqdpY5RXCeMheXMF4u/tkTBqjZvq7HJrDPf4XRVWfLIxI8Q4h7xFI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9976.eurprd08.prod.outlook.com (2603:10a6:20b:646::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 14 Oct
 2025 15:28:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:28:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/5] mesa: drop useless freedreno-fdperf
 PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH 5/5] mesa: drop useless freedreno-fdperf
 PACKAGECONFIG
Thread-Index: AQHcOd2uD/53+iRufE+7lxSpy/pFE7TBxh4AgAADKwCAAAFRgA==
Date: Tue, 14 Oct 2025 15:28:29 +0000
Message-ID: <A4610F93-C8AE-4B2D-822D-1FAFFF6D439A@arm.com>
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251010120125.2868011-5-dmitry.baryshkov@oss.qualcomm.com>
 <0E1D022C-354A-4064-9537-8835AB5B5332@arm.com>
 <CAO9ioeVxazVkNT9Wk5YcuHGAaLUbi9S+XPhPM3tZbZDDdK-3_g@mail.gmail.com>
In-Reply-To: 
 <CAO9ioeVxazVkNT9Wk5YcuHGAaLUbi9S+XPhPM3tZbZDDdK-3_g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9976:EE_|DB5PEPF00014B8A:EE_|PAXPR08MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1678ea-839d-42c8-5ddf-08de0b3667a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?V01vaHlsRnN2T3ZNTWV3U1ZUM3NFVnZWYy95ZjRZVG9pOVIzT3U1RytQVUUw?=
 =?utf-8?B?Y0hLN083R0luVG1JOXBWbTlSL09nbVhzbVlBV2Nmc3JsUWpqQlp2MnBqN0FO?=
 =?utf-8?B?NUZBNUIrYncvR0hMblpicUYybVlTL1EySzFFcVo0K0xoL2ROeW12TmYrNmVw?=
 =?utf-8?B?Y2FGQTJRdEcyWlp6cllJMkdFM2ZRUFdkcjZkNlRiU3ZxVmxYbmtWQ0locGUv?=
 =?utf-8?B?dHJEbFNjUnJUUmw2eHMzbTJURFhDNzg4MlVRdmI5L3V0WllvY0tjd21qb2xB?=
 =?utf-8?B?NFFoc0FVL2tKS3JOWEtwVlZFMUg3U2E1QXRlZm9ZNUt5NnYvNmVwOTJsN1J6?=
 =?utf-8?B?NkVqVWxoOUZhWmZOdjRScFNoV0xXdmJDRGsvK29iNXdYbDE4cjJFQ3R0NHZv?=
 =?utf-8?B?UjJya21IdnliazdKRDd6cU9ZQlNqVHJ5YzUzYXJMaVdHTTJyc1J5citxbzBn?=
 =?utf-8?B?ZkJkcXVscFlQRXhOUmdVbnZxTDcrdnJ5ajRPY3BCeGEzWGxkcEEzYVduK0Y1?=
 =?utf-8?B?WnFQclpDRjJ3RHF4TkpmZjZCeFFncHNwNWxxWUFMSy9sZ2RDUnYwNmduUjJn?=
 =?utf-8?B?VFhQbG9XZjRIS0c4cWpUSXFXVGlRTjN3dkVTb0xRdG5kOEQ2dFgzQ09QUldk?=
 =?utf-8?B?a3lrb0s3YnBCYmV1bkY1ZUdoa3FYeFgwTjhhMFRwL0EvNURDejREeTJkdHRv?=
 =?utf-8?B?ZWZaQzJ4aXRFZkplMS9VZVM4UlJ3MFJndUlaWVNUdmRzZHdaODZITldUNTVm?=
 =?utf-8?B?MDVrZ2x1K0Zrb2dZeFRQcmJmZGdNZnE2aDY4Sjk1bDZYUkdDbjNVQXRyQmdH?=
 =?utf-8?B?Sm51ampjOURxa3Y2NXpVa2Z0UW5jR240NGg4RWdRYmhPMSsxSkZDWEoyTGFz?=
 =?utf-8?B?RmtNZDM0Z3R5YmRxWGMyMVBDbWlWYk05TzFTTjExOCt0ZW5jOG1YSUtOeFNp?=
 =?utf-8?B?Qk9BK3d0am5zMjZJK3hwUmxob0lsTnRMWGlqQXFFR0ZIcnBva0MxMDhFY2tE?=
 =?utf-8?B?WjhuVXM2ZTBoSW5YT0dzTlZ0WWt1RUMwNGJBcTlVbHV6OS91MzNoa0dNRU9k?=
 =?utf-8?B?SFVtSzlnVkFZNVV0eUNNUStseEF4Z1EvM21IdGcydUxtSkthZFBEQnJUSE9k?=
 =?utf-8?B?Y1ZRQjhEMlMwdlRXOVovUmNSVEhIWnMxS0RwTTNHcVBMTmI5dkpTZW5ibi9Z?=
 =?utf-8?B?akQ1U1V4MWsxeUVZODRCUnpSL3hSbVNBOUtjc2taaUVzWGlvcU5LSzBUNFlX?=
 =?utf-8?B?L3hkS0k5blY5TGJtUFlrWlVpS3ZjRWJWYXAzUzZocHRWclVJbkxJV3JSZVZv?=
 =?utf-8?B?U2l3R3pqU1NaRTB3YnI5R2pHaUJja3Radkhjc3p2R0FOUnlVVWpJeUxkMWhV?=
 =?utf-8?B?bkVBY1czcUd6UDFCcndxMzZyb0hac3QyK3FvVUpxbTZzZitIUEtpSGlqWkRR?=
 =?utf-8?B?RDZPMG9qd0E3cHpDWWxLVWNNcnpKUm9NVTdodzR3TEdJMFRxWWJyNGloWS8y?=
 =?utf-8?B?ZG9USVo3d1NLYjkxSzRGS3UxTXlOZDZERmdTSk5HN1lLQkluNW0rTFVhRy9F?=
 =?utf-8?B?MEtzaWQ3bm9WZWkvbThBM0tmTU1KQ1BIK2EvbDRTejFteFBiYitZNEozTUZK?=
 =?utf-8?B?K0l0Y09PdlVyV0hPY0tlWDI3M0RQaTJSVmNTeXEybnhQMXQ1ekhBTDd0cjBW?=
 =?utf-8?B?SkVudGVwaGVNRWJETFBvLzRkcG9lZjdndWVqbXVqMW5qcnY5RGxNSE9nQmQw?=
 =?utf-8?B?RjJpWVppZ3hCVUpScVBSREEvc3dUekd1TWlxVTA4MW5EQ2ZJb1UwSTh4Uk5u?=
 =?utf-8?B?L21FR3krb1R5NXdqZk5BeUV1bnc1ZTFJUTJhOVliemhSeldnRXFFMFJ4T3ZE?=
 =?utf-8?B?eXRsWWNhZ3ZZd1NzSzBSU0hodjBXZ3RPdWUvLzkveXBhaHl4ckVidVNMSW91?=
 =?utf-8?B?ZkttRHBjZjU0OHNURFVwdzZNallTRUxnQUwraGRQZWQraE5uQ1JhZHVIRC81?=
 =?utf-8?B?R1NXVFQ0NnU0SzU0alRNSUVqQlhSVU8rcTVSa1NnTFB3eENEZG9lZ1dBTmpj?=
 =?utf-8?Q?GF5NRG?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C00874F7734384882C923023A4D9BDF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9976
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35928199-8329-4560-ecd6-08de0b365414
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|1800799024|82310400026|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TnJIRkxTK0lOaWdQM0NpT3M2NXhyb2RxU3ZKZEQvYU1YdHpuTGd5M0h4bloy?=
 =?utf-8?B?cExDTVRlN0NJTkxmc25JMVIxSEl2VGJmNWVwRFluRUtvV0MvRzJwUGRFVFM2?=
 =?utf-8?B?YlZicUxXKzljRStidFAxVW9wYlQwYjJjbHB5bHZUZ0czaWY1LzhWR28vUlRE?=
 =?utf-8?B?S3VIUGZKTStNeExHU0duQmNLK0ZEKzg0Z2p4a0NBMkduS2ZrREgrSmlEOUJi?=
 =?utf-8?B?R1h2TDdsWExHam9PelQ3T3VFSFpjQUw5NGJNOHlZSnNxVzVWd1NjVDdaVUlV?=
 =?utf-8?B?NFZwTDNQY20wVWR1b2FRVWhiSHR1azdCRWZwVDNsOE13Ly84S0dHVndldGx3?=
 =?utf-8?B?QUlJV1hXcS9wN2tzZ0ZtZU9TNmlzQjBwQjRnQXpFNGRZdkh0SzRlUUlFTUYv?=
 =?utf-8?B?THRxN0JmMDVtWFJDTjlGd0ROcXJCS0F0SG5UUnZtanJJQzVVdDhqL0g5NExN?=
 =?utf-8?B?cWhKNWRyWkxpNmdSS2FaSHdjZGVLS3UxWTRoMTZSTlJIbk5qaW1NUnRHWFhT?=
 =?utf-8?B?OVpDNS93dkltQ1FUUEltR2J6dEZ0ZjE2OFhvU1ZPdlV6Z0VieDNGb0dPSmNy?=
 =?utf-8?B?Sk1sVmZUTzdRNWFGd2hOVG9xOHcvTHJvSjVJNmsyWDJCR1NhK053YmNhR0ZY?=
 =?utf-8?B?ajNNTzlESXkwKzlnR2tNaGFGWG94RHZQbVViTklqZWpGanoxUGl4cU5jcUF1?=
 =?utf-8?B?TDhpLzRRNk9ZSVpERUFSb1NaVjZkdVMyQm1aMHNNd0dhV2NidHR6NmJnU1hG?=
 =?utf-8?B?Vzl1V1hlUzFTdWIwZDlEMmJrNFhUQnZjYXFkT3l6UVkza1o3L0tVUTgzbnBl?=
 =?utf-8?B?aEFXMGhLRzJBR3ROVldUQmpuKzNGRU81WS9NMnI4ZGtQNVFvQkxHUG5KRXpL?=
 =?utf-8?B?RWNsNVVFWlZRcHlKMWlSSEZjaHBGWCs5R1pXbTErcDVGcXlCL3Zrc0JRYisy?=
 =?utf-8?B?RFRZL2ozZnA0L3Q0Zkpha3plU2tmZUIvUHpieDhoUE5PWThoN2xSMUNGV1Ns?=
 =?utf-8?B?NUN3RlRaY0xjcHlra3VvUjdDSTJIRjh2MjU1NXZPSktKOW83VlZ5N0kzdFIw?=
 =?utf-8?B?TWZ6b3Azd1VSZFV0R0MvM1BtZFhyVUhMY25kNEFYMkxTWVpTTTZRWkljaTB1?=
 =?utf-8?B?anVwZ2hiNldQY3hlNnJDbUEyZkpVbUN5c0RrWmF2R29iVE9Oc0swZTF1bmE1?=
 =?utf-8?B?WUVFY2Q2SVRPRW5nSzNzWVYyZ1NRcnhCSUIycjhoU1N3N0s5bkVMVEZTRGk1?=
 =?utf-8?B?VmtJYjZVVFNLRU1vTjJ1QmViWldRZEdtYTNVemkzUm5qTnp1WkVNS2w5Z09L?=
 =?utf-8?B?SnVxaGRtS1ljUytONWlBUCtPcTh6M0UxemE4OHp1ZmtUeGxtRE1VUENMa3Ew?=
 =?utf-8?B?N05VdHFxd2xQKzlmQ2Z4blN1bGd5N0lKTWgxMDQvZXdEYmJEOW9RdkE5MnpP?=
 =?utf-8?B?S3JDYjRYM2ZVOVBCSTRsWE5IZzBObS9kTmpzRmxPcTYrNVJEVUpuN1FwVktJ?=
 =?utf-8?B?SFNPZFBpUVAyZm1XQWZCYTNSY2c2dllJTkRIdlRXdUJPTmI4WGtQRnF2dEMy?=
 =?utf-8?B?N0kzOFFBVUpLQTRQTDl0WnBkampweHVGc0lTelZ4b0RvVEdIT2VXZDdVcVZE?=
 =?utf-8?B?YTRwWHJsc2pSeVlYUVdTWlREVVJvS2M5cmtINkduWWdTb3llaitoWGx0eXJV?=
 =?utf-8?B?cFBSREpzb1BEQnBWNlp5Z0dORVJINUYvOWxoZGp0TGswMVRWOXpSbWJKNG1h?=
 =?utf-8?B?OTdGNGZwbGZoMVhVN2Y1aW8yYTZ1aFVSSXc2a2EyaHpyUTZ2ZUFadUZZWitp?=
 =?utf-8?B?Sm44NXZCVUNXMnNPSUNQOWJzTUNaRjJTM251U2pFcTN4dVJaZlY3QmhZUEI1?=
 =?utf-8?B?d2svY3JPWldMc2Jjc2crWGlPU3A5azZrb2ZTbmNzYXZQb0Q1cGZQeStxQkJy?=
 =?utf-8?B?YVNoNGQvbEZ3Y3ZmMnZHc3dpbFRURWRnUDNwU0s0Ykd6dFFVdnR6OVg2UFF6?=
 =?utf-8?B?dW9kQzAzcmZLdDMreHdndXBmZ1QyMS83QnFNTHh4SGxGQmNXb2RKeTR1VWhP?=
 =?utf-8?B?bGt2eHdrNS9jMVg3ZkIzdjNEUlQ5Qnd0Z2pLU0RJVkUrVVp4NnAyNWdtai9a?=
 =?utf-8?Q?SYwI=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(82310400026)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:29:02.7425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1678ea-839d-42c8-5ddf-08de0b3667a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7646
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224837

T24gMTQgT2N0IDIwMjUsIGF0IDE2OjIzLCBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNo
a292QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOg0KPiANCj4gT24gVHVlLCAxNCBPY3QgMjAyNSBh
dCAxODoxMywgUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+
PiBPbiAxMCBPY3QgMjAyNSwgYXQgMTI6NTksIERtaXRyeSBCYXJ5c2hrb3YgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPGRtaXRyeS5iYXJ5c2hrb3Y9b3NzLnF1YWxjb21tLmNvbUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+PiAtUEFDS0FHRUNPTkZJR1tmcmVlZHJlbm8tZmRw
ZXJmXSA9ICIsLGxpYmNvbmZpZyINCj4+PiArVE9PTFNfREVQU19GUkVFRFJFTk8gPSAiIG5jdXJz
ZXMgbGlieG1sMiAke0BiYi51dGlscy5jb250YWlucygnQkJGSUxFX0NPTExFQ1RJT05TJywgJ29w
ZW5lbWJlZGRlZC1sYXllcicsICdsaWJjb25maWcnLCAnJywgZCl9Ig0KPj4+ICtUT09MU19ERVBT
OmFwcGVuZCA9ICIke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdmcmVlZHJl
bm8nLCAnICR7VE9PTFNfREVQU19GUkVFRFJFTk99JywgJycsIGQpfeKAnQ0KPj4gDQo+PiBUaGUg
cGFja2FnZWNvbmZpZyBpcyBzbGlnaHRseSB1bmNvbnZlbnRpb25hbCBhcyBpdOKAmXMganVzdCBh
IGRlcGVuZGVuY3ksIGJ1dCBpdCBpcyBkZXRlcm1pbmlzdGljLiAgV2UgbG9va2VkIGF0IHRoaXMg
b24gdGhlIHJldmlldyBjYWxsIHllc3RlcmRheSBhbmQgbm9ib2R5IGxpa2VkIHRoZSBmYWN0IHRo
YXQgc2ltcGx5IGFkZGluZyBtZXRhLW9lIGNhdXNlcyBtZXNhIHRvIHJlY29uZmlndXJlLg0KPiAN
Cj4gV2VsbC4uLiBJdCBhbHNvIHJlcXVpcmVzIGZyZWVkcmVubyB0byBiZSBlbmFibGVkIGluIHRo
ZSBQQUNLQUdFQ09ORklHDQo+ICh3aGljaCBpcyBkb25lIG9ubHkgYnkgbWV0YS1xY29tLCB3aGlj
aCBhbHJlYWR5IGhhcyBtZXRhLW9lIGFzDQo+IExBWUVSUkVDT01NRU5EUykuDQoNClN1cmUsIGJ1
dCBpdOKAmXMgc3RpbGwgbm9uLWRldGVybWluaXN0aWMgaWYgZnJlZWRyZW5vIGlzIGVuYWJsZWQs
IHdoaWNoIGlzIGNvdW50ZXIgdG8gZXZlcnl0aGluZyB3ZeKAmXZlIGJlZW4gbW92aW5nIHRvd2Fy
ZHMgb3ZlciB0aGUgeWVhcnMuDQoNClJvc3M=

