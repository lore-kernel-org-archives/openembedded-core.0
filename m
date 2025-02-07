Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E371C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 15:20:43 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.48])
 by mx.groups.io with SMTP id smtpd.web11.71927.1738941635157744495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 07:20:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JAxgQkv1;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JAxgQkv1;
 spf=pass (domain: arm.com, ip: 40.107.105.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eA08ZOFwqTWK+mcwm/B3XpkHK7purrQbBFlLe8x1uWzX/8gFd1pSim6ACyzyCuzlk7KF3ijI65rzT9jKMWiqIbMH4muDJtZm3meeiBh6PdL5DbTQlK7D0wwpmbOelzG4BLUcxBlBVBK8DCUkhHyWTCKhEm7J05ZIA8kSze7JOXSKXm+g4GRWaGdO9vlQVsAGyT09BzVkbZ3BIXx5GNxxE8CdMtExqCg0ydcqUgzD1Vk24IN9rwbpWgV/AArshkJzHx/Rzo0JrmBAfgxWnsdjDfgb3+/n5Nnz7dlnGnRWrcLuusRB5n7gv9zvI0zHKRdbOq9r5UMQ+7oVURFxGeu1+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8kP6fY9e0a7p7knfDB7aitHDWmX0MBvb068KoX6aIY=;
 b=M3NiWisV3IGCxWK6HpoOkmGyNI0QCBpAtg2YM6995laWMzl3ba3ywC6G6I49a0HDDwQ0Gm5H2V79xovIo5cjRJG8vah7DUuDpifPdKVP1NnH7egv0iFCtlFC1XkGjpJ/u2XoX54UaFJ9h+N+ObFGDdI3y3dwyYeZCzZa7GrHSGBo4L1NXSJe8a9/0Fuwo02Zq1CWh9abQgDTsDnFBczt12iP1siOP5AdaY8PgVCSAoLPbmABl3XEYmTpeGlT0yIePSZ3QoWIVY/nf5wDoPudVlvtlsyUsoSlrgqcbH92lGoNOqGX/1MogTNd8d22KwmyFlnoBbSzEqVHpVdN44n2Rg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8kP6fY9e0a7p7knfDB7aitHDWmX0MBvb068KoX6aIY=;
 b=JAxgQkv1Kq5SDqFCUx3FmLNsGZQcBHA9s8eWqNFC6CuZzUgRN6C6u9Q9uNjM6ZDnVNauG3xFYpRNN43IhNENHXDwOG/riHmpwMG7iOhA0w19gerR7W5MZMrP00ztvkvFgWScYXDYt2fkhm8nunW1l71Y9LIa3cu39qNlkD1+15A=
Received: from DB7PR02CA0033.eurprd02.prod.outlook.com (2603:10a6:10:52::46)
 by AS8PR08MB9647.eurprd08.prod.outlook.com (2603:10a6:20b:618::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 15:20:31 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::91) by DB7PR02CA0033.outlook.office365.com
 (2603:10a6:10:52::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 15:20:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Fri, 7 Feb 2025 15:20:31 +0000
Received: ("Tessian outbound c79bb2535b53:v567"); Fri, 07 Feb 2025 15:20:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ff97814f0cbac12
X-TessianGatewayMetadata: yQQZpgesjVAbSDLDq/MHUm4yiwvx4+IrnMFSmvim8+LJ04R1nYJzNvFOGSE8/DnFj81Cqo0KAoMCFdQgkCe7xKjIrpEla2cq4OgtINo3+z4cABXj6Zft798ZaQRQUZLJEynXIKy2y6+zPdMHeGqvriXpzLKvDef6MtspxGlmbmE=
X-CR-MTA-TID: 64aa7808
Received: from Lcc50e3cfac03.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 68687C12-DA7D-41CE-9A8C-6D473B9E6E6C.1;
	Fri, 07 Feb 2025 15:20:23 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lcc50e3cfac03.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 07 Feb 2025 15:20:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiwBgu9fQzOK8AO9Ip9ozYHuy573Ck1Cpg/hlKmO4oNa5xN88lYqR7VrQmTBCv0V5r9zQbp8SqHJL4GZi+L9Y3OMiAPokLm9TeiD9lqNry9LTyzLSXubHyOjjr65a7QCPPr9lF/db+tSghEgZ6wR/slOQsGa28Md0pD6e0wTIcu+/Vz2wMIGrAUfqY2LyEoONmIviPLAQv9dlbeha+EulxBed6VHGXbzNdwFgfuAgzRq1j4EaT/jcSScXa4mZw4rRtzjcSfD0w1X0YJjVhshAaEzTIMy+zDClBltKkFQ5GA4XG/qbjBSBbgXIQ4M7TIiE3xBUtir6asrz6ehqTGXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8kP6fY9e0a7p7knfDB7aitHDWmX0MBvb068KoX6aIY=;
 b=SKE2QrPbdPYNEVSvA5W4trbOYx6iun5lKXMg72nZpkjLn2XD+TwTLBot+vdTdcKok2vEPkoYrMfXgM8JNxQYfCnyLatXLdTC6JXIlGqoQknMLfBcwvT2Mi77RB2NJVtAmhyESayGQPsTVRTAMm2civpWCdIvpU/4uxoRJ4brUKE5EtvxLar+rCIoejF4eKs/eYuLRcGaEiIod6SZh9/g8oQ9jjy/AJJT+57jTuIoNfNE+BKv6G2GOcaQtCvy1uSDAqjVgIXNvPCdrrG01Uka2E3ssFYENZU+aczB4DLXrgJ+0IS+Cl5wRbeEPwtSm61Mg4lLZduxKF1GkhH1g1XZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8kP6fY9e0a7p7knfDB7aitHDWmX0MBvb068KoX6aIY=;
 b=JAxgQkv1Kq5SDqFCUx3FmLNsGZQcBHA9s8eWqNFC6CuZzUgRN6C6u9Q9uNjM6ZDnVNauG3xFYpRNN43IhNENHXDwOG/riHmpwMG7iOhA0w19gerR7W5MZMrP00ztvkvFgWScYXDYt2fkhm8nunW1l71Y9LIa3cu39qNlkD1+15A=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8927.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 15:20:21 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 15:20:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Chen Qi <Qi.Chen@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>, Rasmus Villemoes
	<ravi@prevas.dk>
Subject: Re: [OE-core] [PATCH] systemd-netlogd: new recipe
Thread-Topic: [OE-core] [PATCH] systemd-netlogd: new recipe
Thread-Index: AQHbeVjFOFiqeySGxUev7rqIfgSh87M79NsA
Date: Fri, 7 Feb 2025 15:20:21 +0000
Message-ID: <0F5128F1-104A-46F1-9228-A136F9BCF501@arm.com>
References: <20250207120628.909410-1-ravi@prevas.dk>
In-Reply-To: <20250207120628.909410-1-ravi@prevas.dk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8927:EE_|DB5PEPF00014B91:EE_|AS8PR08MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: 51706f96-6ddd-410e-6fb0-08dd478af5be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?amx2SXdCYTNFV29GTWF4R0hVWlgxOUJLVzJFbU1zNTFJK1dGdi9NYTd5Lzdk?=
 =?utf-8?B?NUhCbWhhR1QwRldzcEozS252Z2g4K29HTW90amw1b3c0K21JS0ZtNjM2Wmlt?=
 =?utf-8?B?V2FoN3hQb29KNUlyeEhsdzE1eDVGNUhDU0RmaGdOVllSTjFUaUZ6MW5RaVFI?=
 =?utf-8?B?Tys2NlhkbWpXUk1DSGVjUTlaM3pvTTVUNXRYdHJnNDk4aDNPVFpEbVc3NVZP?=
 =?utf-8?B?aERBMUVNL1lIVDI0QmVvSUhJZXdlZ3JoRlpIVHVaMGlUMWNGVm4xVU0vWngv?=
 =?utf-8?B?aWN3SS9aQ3NVaFQzaHBpY2RzbFBTZlFHcndTQ2Z3L2F2M2Q5MnB5ZWJTcXd3?=
 =?utf-8?B?VDJSdHplZFp0Z2daakQ5UWpwTkI5VDNsMlZvaCszWGVkZ1R2SXprTXNHRWlR?=
 =?utf-8?B?dG5hOUxOMlB3YW1zenEyU2k2TUJMYkRsVE43R1NVYndBenZUYVJvNTRZTGJi?=
 =?utf-8?B?YURVYnY0RFRlQkd1YmJYS3hqUXVTOTljazlZU2I0V2paeVhMTnJuSXdJS1dP?=
 =?utf-8?B?ZlUzdEcvMk1vVWhna2k1WmpGeitYWmJMRXdHQzhQRlE1MlpiRlNIQzFwemQx?=
 =?utf-8?B?Y2lpVGZuMUFlbFM4eXVzeXBRSDQrb1UvakFoZjYvMHBNMEtjMXZkWDJIbmp6?=
 =?utf-8?B?cWtPRnNqK1hNRnVGM2UrSy91U0xEVmRXRTg1WjQ2bFk3RmliMjRIc1VGdlFG?=
 =?utf-8?B?MkUwWkx4M25CTEE4b0UyTjFCMFFUZXRtOXVNaDkveXBkYU1Yby8wSCtDUGp0?=
 =?utf-8?B?N1ZwZVZxYXZoTjRJa25tb2NmMmZrWlVFUmcvS2YzVlZzclovVElHMGVIbGF6?=
 =?utf-8?B?eHpBSE4weTJSWjBnNVhxSmFEWFR5bTRJTUM4RlNiR2hRMmNZczVqUHdnUWtz?=
 =?utf-8?B?MHRNcXBVNXNpd2k1L3R4eFRqS2ZGdTVKY09hWnlzTWtHSjRCZ3JZVFo3ZUZ1?=
 =?utf-8?B?R0JTdUpJd0xQZ3ZSNnRuOHA3a3IyR05FQWpuTlRJYk52MTN3QVBzVWZCZUZR?=
 =?utf-8?B?ZDhVQk9jTEFPZFBKbmVzT1VlcHhhNTFHMGFML2lKOTJyTGdlcm5zQTZGWDZJ?=
 =?utf-8?B?OHA2UUlpaEgxODFmYUt0RHhESFF0a1NwM2ROcDFqVHp4QWFaQVpQVGp3Y0dq?=
 =?utf-8?B?c2QzOVBEdUVxaXNjMjVJTGJuYlRIUUhYSFJiMjcvRkhiOTJnRHpYTFNGTkgr?=
 =?utf-8?B?NG1mY3JGYjhNMXMwajdMWDdMQzNvZ1kvb2g1QUViSHlhcWxUUTNUWlJvMnJq?=
 =?utf-8?B?UG0yRC9Td1JlY1BBWEZMUXRxR1l1empCdHBENFFEd0dxTlRqR1dzeXMydThj?=
 =?utf-8?B?c0R5SFNrZVhnK2Y4ajQwTXRpdFo0cWU4WTVYRzNTNFJIUHgwMGNlSUhhdVY5?=
 =?utf-8?B?c0EybTl3UnlNZzJ0Z2puaEhjcVpvTERQQ3hVSjYrL0J3WlNNNTJUWHY0V2Rh?=
 =?utf-8?B?amlCaWlEVFZiYUZiRzdOUG5Yd29rVHp5QzR1TWk1OE91ZDgvTUtsWTR2dTFP?=
 =?utf-8?B?QWFtN1VQZzJBN1Z4QzJ6Vi95RXpBSldRUG1MMTNTZEFRdnZvdDBVYnJiUjBR?=
 =?utf-8?B?V1M0Q2pDdHNVbS9tS3h4Y2pYOXlLQlpvVTIrMGZzNEN2U2ZEVWZJQzhGUXlV?=
 =?utf-8?B?cW9zRk5HbDZpcWxuWHB5MVZXWEdqd1R6dDVEWmZsY2pqUmVLbzA1M3hGWFZu?=
 =?utf-8?B?ckpaSkRZZG1VMWtERG91Y1NZaEsyNHdQNjY2a3VwNXVqRGxqNlV3azdtVGR1?=
 =?utf-8?B?aUkvZVBpM1JYNFZ0YlYxVnI2UE5PRzVjSkxuTWVIWUFxZTNzVGFKa0FmNmtY?=
 =?utf-8?B?eUNXd3VabVkwU0RJNW10eC84Zkw3Y0lFdHlrSVQyaittNTZ4TEVreG92UnNm?=
 =?utf-8?B?QTc0Tkx1RXdTUnpyOTcyN1BOVEFyMmo2SkpTVG00anRCSVhydTV6dFM0VDVE?=
 =?utf-8?Q?dFE7++dX/Se9TuQQub/rYHy2hr9y9ayf?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEE8E4D5CE35CE4D9A38BC6D3EE8DD4E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8927
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5b4658ed-879e-440a-4cc6-08dd478aefe4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|14060799003|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUZ1WGRuazA2QjA5V0QxdDQ1RVR2aFhPMjl2ek5CaDYwSE5zUEFwd1duK200?=
 =?utf-8?B?ZUEzc2NNRUV6TUpKTkY5TzJwT3h1c2JubEVDdEpGaEE4bzBueVg1T21nZGx1?=
 =?utf-8?B?MGkxTE5PakRId1VlVURxUXdQWDF3enFjNW5sSWNVYW4xTUt6Rnh0a0lJQkhT?=
 =?utf-8?B?Z0cwNUZBNEd2cThHM1lFY3ZQSzJWdi9GNnZXM0FaYlZ6S3hrak9ybkJ3MVpY?=
 =?utf-8?B?dHZXckZ5MEtQQXJBNnFKZ1ZkSHh4MzZBRVpwS1didWdjSU9IUTc2WlFhZEdB?=
 =?utf-8?B?UVpUWWp0N0ZEaWEzZ0ZhbW90Sk9yQ2RnQVV0TTE5NElwMldZQlNaOFlka1JH?=
 =?utf-8?B?Vkh4a3l6Zzk3a0FBRFNTQXpLVU1aRDVHZFFMZ0hIek4vREtxd3hlOWg0VElK?=
 =?utf-8?B?WTBNTFMvME5ObFptMGNvaDUybFNKUG0rdVBkcUxFMVo1TXdmK0xTdEp5NTk2?=
 =?utf-8?B?R3d0TC9ZNWJGdUY4eFhYMUFnRS9SSEpZTmtjWXFRUTcwQ0FUbmJzK2FtVFZD?=
 =?utf-8?B?cEZxVVBUVmlnL2t1RHNhaDNTUnQxcFBpSzByUU9wRHFDZE15dnN3Q3BOQnZ5?=
 =?utf-8?B?V0hudnUzMm51ditBS29pb1lYTi9UUSsrYTJmbVRGNEFBWEp2bXc3WExNRG1F?=
 =?utf-8?B?Q2R5aWdOQUczS3gxZFhRZmowL3RpVkh0UHZGZXZMeE01Sm1FVmlCNDBhbC9i?=
 =?utf-8?B?WXlhU2ZGbDFpVXpHaGJHUWFZY1M2Qndwbysvdnc0VVM2R3dHS1RVOWorZUJL?=
 =?utf-8?B?d1JvT3lSOW1mRkkvR2xrdTNXWVZQRnBwTm13b3QvNEFWbTF6NDRUVVBjanVw?=
 =?utf-8?B?ajZIcmwxeXdBc0E1TmwrQ0lQN0srVjExQ0tOTjFheEZyaVRrR205c1E0bGpk?=
 =?utf-8?B?RStGK0lwZWExeEo3NmFlLzc4dWZiVS9UMEhIV3F5WVFGeHRtN3RGNXJkYW1s?=
 =?utf-8?B?NDh5MmxkaEx0aE8zTUIrWUE4b0U1NXp0Y3MxdlExYkZRTVloaUJ5djRPVG8r?=
 =?utf-8?B?S2libkN3bW5URzhEU2ZwaWhPZEF5S1dNdmFac3hQN1d1NW90eGFFaStPVVdz?=
 =?utf-8?B?V2tmRFFzV1hiTkZzK1dCbGVmU05JeEdLTUFqamNpenZlUmRaOHU5eXdnOXNH?=
 =?utf-8?B?bFNUNnJqYVpyRTZ1a3ZNZFhhZ2h5YUh4MVBqR1BGekpsVWtSMlN3YjBIaUVj?=
 =?utf-8?B?UUY5RGhlOG9mOVFzOHB0VGJqZTdicnNaZGFScUIxWXBVZDB0eEdpVVZnbi9U?=
 =?utf-8?B?YkpFZXZnZTZtOUpiZDJXMFNhOHcxWmt5eVBwSkZMVXBJS2pqTkNTN0pHejJR?=
 =?utf-8?B?eERGTXorZThPYmNIV2tucjkxdWFvSEVxSG9pMElHSXFINklJMVJ2YXhaejR1?=
 =?utf-8?B?QVdVM3FmTHkvWVNSNkh4TGlIRDVaRlF1RllpaC9RbXA0cjR3REdzMTNWSklW?=
 =?utf-8?B?QTdvZUt1YXdnU0FEdGVHK3hIL2lDMlZsU1poOHdyUjRMVkdUME9mL3dPVnRH?=
 =?utf-8?B?L0R4QzFJQTRQdjllVzRJRURmT2xSZFR6WWNhRm5xRGwwaHZ3Rk5rL0ZSUG1E?=
 =?utf-8?B?SnUrcVdZRDBXaTFHRktqSndadG9wVjZNOE5FU09kYkpDYkl6cDdxenFYNmYx?=
 =?utf-8?B?RDJYR3BERlJpbWl5ZkU5aDBZVGo5K0x2VDlSeWxvRGtLa2pRTVNzbCtQVDlN?=
 =?utf-8?B?K0NianQzWE1tQXZqR0xsRDVWZDFrMW56cFJrSDdrd0thZ3lQcVRaWXlJYlRa?=
 =?utf-8?B?cDVWYWlHVkVKZzFna2FZMU1ZdEgxcktROVdTM1NHcDcwYTNhMmN6N2dZQm9O?=
 =?utf-8?B?NTdHT2N3YXd1Y2NRK2ZGcmE2RGNqdHZQUW1IcnV3Rm9SdWJLaHFCeWU4eE9m?=
 =?utf-8?B?SkxTSzNGenFkUDJSRVlWN1dWUG9sc0dSQ0ZBazRXUlpTZ0JTUXQ1WTVxK0Jy?=
 =?utf-8?B?M2RKZEJGK2pIelNmNmNUKzdVRmY2Mk1VeXJYclFEMEdhMWVjOVlRL0VXeVV5?=
 =?utf-8?Q?q2l2ILjq/KObMJzcg0M8f2a1a0T7wM=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 15:20:31.0435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51706f96-6ddd-410e-6fb0-08dd478af5be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9647
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 15:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210982

T24gNyBGZWIgMjAyNSwgYXQgMTI6MDYsIFJhc211cyBWaWxsZW1vZXMgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPHJhc211cy52aWxsZW1vZXM9cHJldmFzLmRrQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogUmFzbXVzIFZpbGxlbW9lcyA8cmF2aUBwcmV2YXMu
ZGs+DQo+IA0KPiBJbiBzb21lIGRlcGxveW1lbnRzLCB0aGUgbG9nIGFnZ3JlZ2F0b3IgY29sbGVj
dHMgbG9nIG1lc3NhZ2VzIGluIHRoZQ0KPiBzeXNsb2cgZm9ybWF0LCBzbyBzeXN0ZW1kLWpvdXJu
YWwtdXBsb2FkIGFuZCBmcmllbmRzIGNhbiBub3QgYmUNCj4gdXNlZC4NCj4gDQo+IHN5c3RlbWQt
bmV0bG9nZCBpcyBhIGRhZW1vbiBmb3IgZmlsbGluZyB0aGF0IGdhcC4NCg0KSeKAmWQgc3VnZ2Vz
dCB0aGF0IG1ldGEtb2UgaXMgYSBiZXR0ZXIgcGxhY2UgZm9yIHRoaXMuDQoNClJvc3M=

