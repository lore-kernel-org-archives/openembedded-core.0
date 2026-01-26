Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DE4C88E52
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:46:17 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19194.1769431572423005103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WFAiPf0M;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WFAiPf0M;
 spf=pass (domain: arm.com, ip: 52.101.69.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jO/rXJo7GpwHWiJKjer3HkaX3AzDL2iRHPp7k+6EI08HXB3BA5oBJsDbGM8Ny8v+JOft1BQ0a/k9maKEMqnvUFrFF/1/b3+XOlV/iWMBgl3WpBDactjKDZ1FEeTEFAwSGlG4TYTC+ALiQIyv3dA3gwtg58es1+33JzUJfGf0wH5MYSx9Uilbb18p9ubeiVfGE0Z3cfwoi95xjalFGK3QMyAkg6NlcQQyDxKt6TNYCiysJoPJxOd6BefjxB/3aUj/sgUUwPC+dnTW8sp9a5ZEaZgwQ119iWyb3ybcpHyxn7xu04hFbPIbxQ481bwjLFhj+v7hta7Hrh2mm9EAuPOStg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPr7/gkTOkHpITR0oLIQtce9wto0qxcsIL04jnQJz0g=;
 b=A8AKtMHm7Q3Vm26Nf1eRybOA1GxXI0XriMqmAi+jlrDkXO2W/K25qpUsRanKlQZpimJkr5qEQl0bLAQ5T/DqEdXp4WGKfC8/ytHUvLRUXgnmgdb2UqEWWzgWgkIbQFTLVECDNj6Xksk7IohIvVRigvn9JWqVASuKIolcJYlcRDXoGrQdaCGwqEM3qYFB5/IgkrtNIOnWGmIUWcvPwsuZ7IVNW5bY+3/E95zAaNTEujY2VoRmw0L1jNj3RPDWBQcqI4BbHd+6BOkPHc5JS5bxdycOH5jyYyd7OzQhCXuC+sz4M5zPGptCBto5lMk02d3bmtd4nFzc2kzBtXeLOex67w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPr7/gkTOkHpITR0oLIQtce9wto0qxcsIL04jnQJz0g=;
 b=WFAiPf0M5Q6DbMyEp/X27BOay2vPHFCOqWw94TuOenfxGjGScQg8JRHwlQlQ2tBPKRS9j26KPKGPBiJo9Au9CI2xnZFuXyPPwn64mN9vSRxdNfRwZIBK66xF/cuHfxYJQ69bFAiJY3mpJgjCWx5lXLkgm8Wmb7BQmv931DcyK0Y=
Received: from AS4P190CA0009.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::16)
 by GV2PR08MB11765.eurprd08.prod.outlook.com (2603:10a6:150:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 12:46:08 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::96) by AS4P190CA0009.outlook.office365.com
 (2603:10a6:20b:5de::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.15 via Frontend Transport; Mon,
 26 Jan 2026 12:46:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Mon, 26 Jan 2026 12:46:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLCexqwiK4WbNupwKQmHlls5B4h4xfbHorZ1K+AtQ46czDiMPRMfn7Vbf+Y0cxzka8JvkpsR0S7aEJX+0Z3lsxRsFWnnXQpadqx++Qyseg45F2xefN2WoSShVywTce4hL0JwNjxrD7QoUEBv9JoT44+YZjFZxtBiRL/5QdQwGrZM68hoNLndjJD5HOMHDhximoIyO8Mol9juesRl/HUHWiZXVyK8bIsssIEOEcxLsNnlbX4ztalN8183BqABlIbsKmhz5s3zBnv65sbQS++ZHbjB7OC6sfm/4wg0l4KOhe2zSVmpikamqa7Caw8DFIvnc48Cd6NsXvEGaIBAraLXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPr7/gkTOkHpITR0oLIQtce9wto0qxcsIL04jnQJz0g=;
 b=LiMdOOKK4dwPTQCjXtwku+J0ByuNWTb3Rl74MXEUnTsmneS0AeyZ5QFbp/Q4R1ATLAn6hk1L0PexUUgR/4wNbzY/cx/QamaT5BDhg1Utnj7ggHctCovnawXXjRzjm/+mBTkEQ9qNgyeTV5BsueK7Z9x8fpwZjFcsPn4b8YQrN43qNofDr0c//FIuhf5UaZLjEV0Z8dyd2JkCbsuuDRNUr8YUSq2VV1AP1sdKhYwjONiBy0HEpjbCXAXdUGvP/ZP0VUs+ayeq8t/VwloIhPsueLAwRDL1hiF3KiGyJg7SW/emJZmpfyb2vdb7XVqty8b9OpetW7FQHeHFj+Xoc/CKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPr7/gkTOkHpITR0oLIQtce9wto0qxcsIL04jnQJz0g=;
 b=WFAiPf0M5Q6DbMyEp/X27BOay2vPHFCOqWw94TuOenfxGjGScQg8JRHwlQlQ2tBPKRS9j26KPKGPBiJo9Au9CI2xnZFuXyPPwn64mN9vSRxdNfRwZIBK66xF/cuHfxYJQ69bFAiJY3mpJgjCWx5lXLkgm8Wmb7BQmv931DcyK0Y=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10558.eurprd08.prod.outlook.com (2603:10a6:800:209::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 12:44:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 12:44:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "careers.myinfo@gmail.com" <careers.myinfo@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] libpcre2: Enabling Ptest support
Thread-Topic: [OE-core][master][PATCH] libpcre2: Enabling Ptest support
Thread-Index: AQHcieDaa9ZbUnY8kUOwPB1ig2Zn1rVkb1mA
Date: Mon, 26 Jan 2026 12:44:57 +0000
Message-ID: <C8CE113D-D026-4EB4-BCB8-CB32EE359E6E@arm.com>
References: <20260120073923.508721-1-moins@kpit.com>
In-Reply-To: <20260120073923.508721-1-moins@kpit.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10558:EE_|AM2PEPF0001C710:EE_|GV2PR08MB11765:EE_
X-MS-Office365-Filtering-Correlation-Id: 390712b6-2f68-418f-121c-08de5cd8e03b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7142099003;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a2xxK295TG54T2pTMG5DUlFLeGR5WFBKbUIrc3pveWpQVW16Y2xIODFDcXht?=
 =?utf-8?B?Q3o2WktDWkZKd1cxUGE4M3drNVpjbnZhNmVXcUR1bjhBdEp4SFJjbWRQVjJE?=
 =?utf-8?B?Sk1oSU1SNTQ2TFlKZVgvb0JIUVI3S0VNbXNza01ZdGVwdmRiTERwMXlkSkY1?=
 =?utf-8?B?VEhYWXJWQTRQSk1YU1JZbUxNVnpUZHFjMy9vcFd5QzlGV0Y5TGxIdHpLa3Ur?=
 =?utf-8?B?VTVjZS9oT2hCekM0bVNTek9pMlAySDByRGI5SjF5MG42ZWdyaHF1R3JpdmJZ?=
 =?utf-8?B?cHlmTGoyMHlPVjRUWFBZRVJ2eXByWittRHQrS3B5ajR2bzRhZDZUamFmbktW?=
 =?utf-8?B?ZDFsQUxiMUdoR2RUMDRPZCtIeWZqbVpFWDFaRTFESWhWVUdIQjl2R2pIL2tT?=
 =?utf-8?B?ekhFTkYwbTU5dzJGM1N2YS9mTndqWThOb0dVcW10aTNpT1gzaUtHNTVKdGx3?=
 =?utf-8?B?SEFOUS9sQWNUY2E4NVJGQ2VQMzBtbDBrQnl2N0hYYjFyOGsyeVdTTnNUWnQ2?=
 =?utf-8?B?K3NCVFJzOEQwa2hqWnkvQnpKVk01N2FhenFUMm5vdmw2WUk4azNiQStTbzQ1?=
 =?utf-8?B?cDhoMUNBSXRhU2tkWU4wZ0czVEUveGtSWEVhN2IzRmpKcDNiYytRRmlMTVha?=
 =?utf-8?B?WnNhOXFmYTU5bktrTVRiWVZJTExJdlBPVi9ad3M3aUxTMVhBQVBDUVVrZVlw?=
 =?utf-8?B?OUQyeDF1SmJSc00xeStjLzIvejJiN05pSTE2aFhNbC9BVFZwVVVVaTZWVm9u?=
 =?utf-8?B?czl1ZkhUQlVRVlI2c3FiLzhTQ2g3UXB4USthZzBEbjBaRU1WY2NSenR3YUgy?=
 =?utf-8?B?YTYzejFJRGdEY0FNQkdYa08ySDIwa1AvSEtYcThsTDM3MjRZKzdFNmYxWVVX?=
 =?utf-8?B?Mjh2UTNDbTNaUFA3ZkRvUGpaRkFTQ0ZPTjE4c3ZaNkJFWVBWTERlNE02ZWZL?=
 =?utf-8?B?SEpQNHRVbVpSRkQ5R0tCNjZCRXI4YVppWWpPVHNGSHpHUmpZV0tteXBwRk1q?=
 =?utf-8?B?RDhxemtJcE04OEI4WDBNSjF3bE16bHc2THJpSXdKaUxuMXlENlpUczY2MGpH?=
 =?utf-8?B?b1YxeVRSWTF2aFBCcEhaMGlob3RTZG5FZXpPb1JER05WV3hvaFZ3azZ0Yllq?=
 =?utf-8?B?QWx1TC9HS2FFWS9JMXJMMDduNzNoSTJ6d1Z1TitZZlVSY2RSNG02elBDamcx?=
 =?utf-8?B?c0NaSTdEcG5sSHVHSWFHUWhUYmQybjA4R2RNNlpiVStLd0RZRUdZTjdQMS82?=
 =?utf-8?B?MmoyVzFvdDQ5NHlYU1RXSHZ3c1c4cStNenVtODMvNTVHZkwvZjREdVZhUUM0?=
 =?utf-8?B?bXBSTzBKUG5DU2E3d0tjcURzL0NzWTRMZWxwVXpFcVhXbm54RmlYMWsrQzda?=
 =?utf-8?B?STFRdWRtWUZMZENLVlZRSmtoRlBaaWJiRWdlSUl0VGNCRmo1VS9iS0sxY21L?=
 =?utf-8?B?NmlGK25pdmwxM0ZrMHNVVFp3NUFvUTVOQ1RUb2U2WmZST256MU1YU0t3WElm?=
 =?utf-8?B?YzcrRlNYVUh5bnM0cVExZHdFZnJRQ2hJSXkraTB1bnJ3V2J0Mnl6M21tdzNt?=
 =?utf-8?B?aWI2ZXllM0NjSU9NUU1BSkJPUnpGYmR5d013ckVWKzBlaVBpWEdhWUlmL0RC?=
 =?utf-8?B?RTZtamtIMFpJQUNwYTRRVmZuVVVDV1ZSS2k3SkE1SDU2V2VKZWh4b2M4L1Zv?=
 =?utf-8?B?TWVudm1paXNRNWhybS9lQXZlRlUwMjMxTTF5Z0ZPU2pJRDRGKy9PbGdYL3NH?=
 =?utf-8?B?bGNnb2svZWh3TS9NdXROUHdWVVNxQVBhNXpTRFpuY2dBbml0ZFZQUVZSOEdz?=
 =?utf-8?B?ZnhPSS9taWhxMEsyYkY5cm9SQWg0NHF2MXkzSFBBL3J1RGM0a3Z2QnZUenFH?=
 =?utf-8?B?blEwcERMUjVTZkludTFDZUFaNXN3bnlsdmZvV3loK1c3OG5oM1hjSnZHK0Ns?=
 =?utf-8?B?dTNnRW4xWG01eE5nSVFndkRGT1dHL3NGQlorSXl2R25NVmpaUjdmaEF5dDNj?=
 =?utf-8?B?enZPb1VvYWlHcWVjdC8zU3lDZTJOYmVla0ZESHZKMGo0TlhGemJSYVFMQS8x?=
 =?utf-8?B?b1RpMUhab2wxWTk0Y3Y4bFhvMTE2ZWxxMEZnUzdDaE5TNDNpNXk1NzJKeDVY?=
 =?utf-8?B?S0RKL1JNUGpDY21QV3gyWlliRE1mYkZ2anVCZkhqVEZMOEV5YmhOckFWSncz?=
 =?utf-8?Q?vdrQgsL6OQz8g6su6ZXFYrQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7142099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFDC6BB35DB9504CA7F5CBE67CE67587@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10558
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	62f368fc-16e6-4c90-de04-08de5cd8b681
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|35042699022|36860700013|14060799003|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VG40cnNYYzhkRXVuRE1oNkU4TzJpMDVQcnhtdUZBTy9rcDFEWWpNSVZOK0Jh?=
 =?utf-8?B?cDZ3T0pnbFR3ZEZEZ2Nja0kzendvcGY2aTNadWRUTWJyMFJCdVllenp2TmVh?=
 =?utf-8?B?ZHZPYzRBb3VaQ3hQdWwycnpKQ2d4U2pyeFpTanpNVC9MUzkzaXY3c2xUY0pr?=
 =?utf-8?B?NW93Zk1VRkZMa2hrc0twWnRHWTJKbklCeGVsRkM4azdLelhjNHlObFQ5SURk?=
 =?utf-8?B?VVlUOEg1dEdNRkJzWW9aTlpuNW4zNGRQNUFSUFhmMmYrVnFKZzdnMW5QcUgx?=
 =?utf-8?B?MkVaQmpaTXNjaVdqb05lbXFaYklRZXV5OEllc0RZamhEUWdMZVJPR3o5azUz?=
 =?utf-8?B?disrWTU1d2RtekE3M3ZQVm9TMnZWL0FxVTdXcktFa0FjNGtVdmVNYUVGZWJv?=
 =?utf-8?B?NnBQVDNmZ2VSZ0tIRnROeWJiSFRhZ2Q4TU5jd2YyR0Z1NWpDZDNVQ0x5bE5y?=
 =?utf-8?B?YzZGOEZ5VEtpejlJQkN6Tkk2dkFLdlZocTJWTVZIQmpXT0pCUWpvVHJCeGxi?=
 =?utf-8?B?b1JrL0IzemxhSVNTVE8wUHByUDlhVGpyTmlaV1V5ZGRUeko5TjgxeEo1L1JW?=
 =?utf-8?B?TnlFd0FURlBhUTI4b2dvQlRYN1pzdWxwTGxrUEtwS3cxckJlVUxOVU1CTVJO?=
 =?utf-8?B?c0pTSGREdDZiSFRkMmxidW1HS2FzWDZ1bHk0UUVCZTJNSm8veEttU2F0M3pB?=
 =?utf-8?B?bGRNSE9NMXJMZVM1dEtLYWZvNTZWV0d6TUNiTkppSjBrcVFNNTZSWjUwcWU0?=
 =?utf-8?B?U09LQlUwd2dldDFUOTVxV3M5Tk12MmNHUXhkWmRSK3Q0S05uU0E3YjBTYUM1?=
 =?utf-8?B?bGZleWJmQ3lsNTYzR3R5Nkg5VytEVENtdVk3NU9VYTNnQmxzK0p3SXZpVUta?=
 =?utf-8?B?aTFpRU9ZQVhIWGN5MHZ2TjUxSDRoSFVGQnFRcmVBWERSWjlnZzRnUTBxWU1K?=
 =?utf-8?B?dElSNEJ1NU4xclZ6aTZtU2RBV2kyQ3p4c1AxaGZmS3ZJYWtYVDlIS05UcW5R?=
 =?utf-8?B?MnNzOXJ3VHRZd3VZMmRFSXBCREtYNElpNENUajZQQTJjanJPNHhGOWYvV09U?=
 =?utf-8?B?MjZHVlNOTjVCQkljMjFScHFYVjFMMEZUdTYxVXZyblpNakJBODZSV3BFc2VO?=
 =?utf-8?B?UXVRTkpRVk5ReWE4TWs1NFgzcS9Uc0lPbVJTeHM2YmlXK1ViczF4cE04UWtx?=
 =?utf-8?B?UUFvQzl0ejgyeXBUZzdMSTVRcWdGTXdRczZMbm0xOS9XbHE1RldrN0NGcXdr?=
 =?utf-8?B?ckFKUXYrTUlLeWxEZ3oxV3VmQ0JrSDRYdnZ2UUFzMTZvUUtkckpEWDdOcTFN?=
 =?utf-8?B?NXdsNWFNTEt2aVBVV1Y4aVd0ZE1EQVl6WkRTNGI5SHpBcmYxZGtiQWJZZ3h4?=
 =?utf-8?B?OW5VV2VvZTFWeTAyZEpQTkFQQ1RNZkthSm94TGN2NVNtdmhPVG0yVnBrcjl6?=
 =?utf-8?B?MnJVQkwyT2tLMnJITE13YnQ2NCs1R1hhL2s0a1hmcS9rWklQMEgvRFljZG1S?=
 =?utf-8?B?MERCUFJjTjJxMlNlSmFtWVkzUUNPc3Q3cjhOMTZPeUExeTdiU0JVaVZrdHhR?=
 =?utf-8?B?bHowUWhxOW1iZUx1aElxTENBeHlqeVlJR2F5U3lmeW9wRHU2eWlrd1MwTnd3?=
 =?utf-8?B?NDN2ZllnajRVVjQwclJCaURTbzZtV2JzMGF0dTdwQXlSMEMvU2U3MG9Nei9J?=
 =?utf-8?B?RTZJRHh1eklzZGJIUzV2aDlLV3gvaUwyUWVHUXF2NmQxQ2VjU1VEV3pEcWZs?=
 =?utf-8?B?Vy9hUkU1aUVVSGU5bHIySTdwWW9UMjRZS2FvWmtqT3d2QmpISDRabkZSc1RF?=
 =?utf-8?B?WHRzNU50RnNtMnYyWm94VHFvUVh1YWFmMEp5SXM0ejlCUmx1THQwZWYvZU9Q?=
 =?utf-8?B?MS9TUnBCMHF5SWozWWFCTGlDQnNadTBRbWFQTXpCdUVFMEpFVkIyR05UcWI2?=
 =?utf-8?B?VVJEWUlhTjJPV01qWjdWdmVJVXhBRC9aeWpmR08xczZQWURXMmlnT2JwVjRC?=
 =?utf-8?B?d1lpaGhTRHdmNDNreEM1OVpPZXc3Rm5NYkorQTNoUVpHanZhYWpuOGhkSVFB?=
 =?utf-8?B?R3dwK05YQU9QL0Z0Z3JSZXBESXlkODArZ2dKYm5GRDZ2VUtZa1FPSVl0aDYx?=
 =?utf-8?B?NzlrNEZJekJKdDhqUUdoVk5sWm5RSHlLRmoyODVhSy84Z2lmRmRzYVJEOFFK?=
 =?utf-8?B?bG5VNlRNbTVaSUJnNUVOci96Vzk0RDZhYnhVT3J5MzFEMDFFb3BvdGNDc2lE?=
 =?utf-8?B?MWFQc3ZMYS9pOXhpdXFGYXcvVEFRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(35042699022)(36860700013)(14060799003)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 12:46:07.7483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 390712b6-2f68-418f-121c-08de5cd8e03b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11765
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230002

T24gMjAgSmFuIDIwMjYsIGF0IDA3OjM5LCBTaGFpayBNb2luIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxjYXJlZXJzLm15aW5mbz1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ICtlY2hvICJTVEFSVDogcHRlc3QtcnVubmVyIg0KPiArZGF0ZSArIiVZLSVtLSVk
VCVIOiVNIg0KPiArZWNobyAiQkVHSU46ICQocHdkKSINCg0KDQpUaGlzIGlzbuKAmXQgcHRlc3Qt
cnVubmVyLCB0aGlzIGlzIGxpYnBjcmUuIFlvdSBjYW4gZHJvcCB0aGVzZSBsaW5lcy4NCg0KPiAr
aWYgWyAtbiAiJHJlc3VsdHMiIF07IHRoZW4NCj4gKyAgICBwcmludGYgIiViXG4iICIkcmVzdWx0
cyINCj4gK2ZpDQoNClRoaXMgaGFzIGFscmVhZHkgYmVlbiBwcmludGVkLCBub3Qgc3VyZSBJIHNl
ZSB0aGUgdmFsdWUgb2YgcHJpbnRpbmcgaXQgYWdhaW4uDQoNCj4gK2RvX2luc3RhbGxfcHRlc3Qo
KSB7DQo+ICsgICAgICAgIHQ9JHtEfSR7UFRFU1RfUEFUSH0NCj4gKyAgICAgICAgY3AgLXIgJHtT
fS90ZXN0ZGF0YSAkdA0KPiArICAgICAgICBmb3IgaSBpbiBwY3JlMnBvc2l4X3Rlc3QgcGNyZTJn
cmVwIHBjcmUydGVzdDsgXA0KPiArICAgICAgICAgIGRvIGNwICR7Qn0vLmxpYnMvJGkgJHQ7IFwN
Cg0KVGhpcyBhc3N1bWVzIHRoYXQgbGlidG9vbCBpcyBwdXR0aW5nIHRlbXBvcmFyeSBmaWxlcyBp
biBzcGVjaWZpYyBsb2NhdGlvbi4gSW5zdGVhZCwgdXNlIGxpYnRvb2wgdG8gaW5zdGFsbCBsaWJ0
b29sLWJ1aWx0IGJpbmFyaWVzOg0KDQoke0J9L2xpYnRvb2wg4oCUbW9kZT1pbnN0YWxsIGluc3Rh
bGwgJHtCfS8kaSAkdA0KDQo+ICsgICAgICAgICMgU2tpcCB0aGUgZnJfRlIgbG9jYWxlIHRlc3Qu
IElmIHRoZSBsb2NhbGUgZnJfRlIgaXMgZm91bmQsIGl0IGlzIHRlc3RlZC4NCj4gKyAgICAgICAg
IyBJZiBub3QgZm91bmQsIHRoZSB0ZXN0IGlzIHNraXBwZWQuIFRoZSB0ZXN0IHByb2dyYW0gYXNz
dW1lcyBmcl9GUiBpcyBub24tVVRGLTgNCj4gKyAgICAgICAgIyBsb2NhbGUgc28gdGhlIHRlc3Qg
ZmFpbHMgaWYgZnJfRlIgaXMgVVRGLTggbG9jYWxlLg0KPiArICAgICAgICBzZWQgLWkgLWUgJ3M6
ZG8zPXllczpkbzM9bm86ZycgJHtEfSR7UFRFU1RfUEFUSH0vUnVuVGVzdA0KDQpQcm9iYWJseSB3
b3J0aCBmaWxpbmcgYW4gdXBzdHJlYW0gYnVnIGFib3V0IHRoYXQgYXNzdW1wdGlvbi4NCg0KUm9z
cw0KDQo=

