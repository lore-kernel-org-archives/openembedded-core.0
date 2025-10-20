Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F371CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 10:37:56 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.20])
 by mx.groups.io with SMTP id smtpd.web11.15182.1760956668476041123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 03:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rbjRJylQ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rbjRJylQ;
 spf=pass (domain: arm.com, ip: 52.101.70.20, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UWaHIa8h2wP2B3wxxEgY9bwOkPyIUeprsNxiV7snZbH60bFUraT7uKpQSTsViv42aS9hDhfO2+OWSxXqXdK5FB52att1N7M9NfFa/cEMnPX7kH0PswjL5oXHLzpxkKFFgRVods3UQxDYimlRHhOba7UgOPbDjbtw6/PuG6RdWrXHchBO2oOk5MZRa6lbiYbC+RttEJEBD3rylrZdxyEpsyCx6tfY/cTrC7OiS7XkmTtKPOWY5ay4LMMIMGiSt9E8Ta09iRmvz0SovelF4wMB+yMZVmrtWU8ls+HDZwqRn90WE0jB3KHYwA3ObKz/T7a6UcQmzvXnokjBBE8oAaoseg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCtxnS4JI9BvwUSkjeTQk/PoAGBXcnDw9DmSuqHNaZ0=;
 b=H+193Qnm43JzoeOJ9Y4I1HlL//1ghnyC3vyua4T+U6Jte2b8SF0OqyS5wRZ0BGLIYRffrHaNNWWkau1Vv1eF+edEHO9PDlDPLXYo/258IwFViAzySXHZABLDmbfu4zXb/tPw7KRZsdubpTEePAL1BGG/g2CT+5f1kxbjgDk9k93KhdFlMeTg9x4fUvKkWk9J+SYRnarXBNz7JXSd9ytuvV8Cq+gkUG/2P30agM4Bs+5NOiypkmD0zpWE1QV0pSBbCOXyHMfrBAUfmzNrfLYb2Sysk9RJCa8D4lJvxT/BLj1/lsew4kbp/JvliJwfD4wmi8NmqxPipTmjV9LtbOJEcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCtxnS4JI9BvwUSkjeTQk/PoAGBXcnDw9DmSuqHNaZ0=;
 b=rbjRJylQwGhJ6HQfvMhhPgm0Vua4lA9AVR5HvuefAYkSvmIxe/yOGMBhCoKUi+86YBuaQy6Z8zqS5oaBr/tFA2k1fAQ/KHPLetGcbU0eb/ls/ReHWZtLm8KZK8p2KHnMEziyWWIVMH3090TAPvWDbOvSj24zd+GLxLdAUzuqPgE=
Received: from CWLP265CA0469.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::7)
 by DB9PR08MB6683.eurprd08.prod.outlook.com (2603:10a6:10:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 10:37:43 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:400:1d4:cafe::f) by CWLP265CA0469.outlook.office365.com
 (2603:10a6:400:1d4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 10:37:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 10:37:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLI/6972bltN38SOIn0wHJsC5Pb38CAcDMtx7WCyqoiJi6NR+Q1a1vCNF4C4mRbQsXpo9kEoFKVi5tcImYXfpoNvjovhlyNCoJDwDUoMuFpd/Fgurr049MSaDl276gKjn+kj2Mypax0nnbHShZe4tWMwfdBVGs8cOTbsNYxdW1w9aUeFneEVVNS8Vmbc+j5BJXbRxM7mGiW9Btk2+V+WjiE2jtny1F3W5cnUnS6VQVLALC0kfHPQ/rWXHZMzPN9i1O90zRIfMe/Ri41DvGp/gRR7G69qd34iNVj2yPwwPOQmzPfDJzpL9FrorjY402Gm5rrsYy5bZQ8gsu04V5WyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCtxnS4JI9BvwUSkjeTQk/PoAGBXcnDw9DmSuqHNaZ0=;
 b=FKtBdyMYZ15PxrDM3RBoMErDNq3m8huSYLv2jfFpmfysO1HNrAsIxybtEFJCay36WOiaG0nQCoHozSd1RjtR7LagyQxADmUP29tCbIoakABI6YrKQHYkhXl/rlPsq+gms8AZmj+QdXAXMyUyL2G5PlH8v5qK2c9Rey4L3NC0o8oGex2tTcIHGS7kVX/PATqNGuT8ZszF4JTfi2tIN5vDUz2UFczNPhGAcOgnfWrXXM/fQ3VHr+DKCxqe5go8B5fw+vBnWcBU2lEoZvG+YDzSx9APlIUbMzJXCAWYMOs0/AYYAg7z0T04VZnmwJsUUklfDhWxO75EZUruNgPwl87U0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCtxnS4JI9BvwUSkjeTQk/PoAGBXcnDw9DmSuqHNaZ0=;
 b=rbjRJylQwGhJ6HQfvMhhPgm0Vua4lA9AVR5HvuefAYkSvmIxe/yOGMBhCoKUi+86YBuaQy6Z8zqS5oaBr/tFA2k1fAQ/KHPLetGcbU0eb/ls/ReHWZtLm8KZK8p2KHnMEziyWWIVMH3090TAPvWDbOvSj24zd+GLxLdAUzuqPgE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8122.eurprd08.prod.outlook.com (2603:10a6:150:a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Mon, 20 Oct
 2025 10:37:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9228.012; Mon, 20 Oct 2025
 10:37:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, hongxu
	<hongxu.jia@eng.windriver.com>
Subject: Re: [OE-core] [PATCH 1/2] common-licenses: update to SPDX license
 list v3.27
Thread-Topic: [OE-core] [PATCH 1/2] common-licenses: update to SPDX license
 list v3.27
Thread-Index: AQHcP2iD8HhMGDOtb0S4gCzv89jAXbTKwU0AgAAaxYA=
Date: Mon, 20 Oct 2025 10:37:03 +0000
Message-ID: <F7044603-3503-4EB9-8EB3-E9FB4089794A@arm.com>
References: <20251017131627.3049096-1-ross.burton@arm.com>
 <DDN0ZE7GF8AL.1DP2ESROPJC0M@bootlin.com>
In-Reply-To: <DDN0ZE7GF8AL.1DP2ESROPJC0M@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8122:EE_|AMS1EPF00000045:EE_|DB9PR08MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a4c1f0-8a2f-4334-8db9-08de0fc4b30f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?S1Myd1cwNXJ1LzNacHRZR3Ruem8xVUtwVU95OVM4a2FqR0wwWWI1Mk1LbHRZ?=
 =?utf-8?B?aDNCMmRuNlZ6THVKbGZ5dWpYM3hEVUQxcDJJVk1xRzVHNGl1blpWU3FWUWxy?=
 =?utf-8?B?VXg1QXVTR3RaYzJ2eG15VCtPWWMwZ3MrM2NIVjlNSUVXYk91eisrQUtjSnJq?=
 =?utf-8?B?UUp5SUVGWkF6elc2dm5PWjRFVjViT1JUamRkR3VCTU0yRFRDOHVZWEdZNzJh?=
 =?utf-8?B?SUJsYmZucnRpU2lMT3pXMUxkUEJ5QUxDVEJzMG9jMkJITmZ4M1B5ZERIbTdS?=
 =?utf-8?B?dUxaMVBvYXI2K2x0aGJ1TDd4N2NTU0hHeG9aeFQydzJTWFJZVG55UkJiM2d3?=
 =?utf-8?B?WCtiZkFSZ0I2cXpDSlJ4K3ZmQnVGRUlyZmd6RGFmK0h1UjBDS0E5Nk9jZi90?=
 =?utf-8?B?d3gxM214UWFsKzVDa3l2ZlZrRHEvNUcyMzdsQm90SHBJdldVYWNNcFFSNlRj?=
 =?utf-8?B?SndORkI0aUtZU29rUmdtaEJRVUhMUXZFMmVKTlkxMSt2SVhPTEVzZHdhdjd6?=
 =?utf-8?B?S1IzN3k5SnM1UTBhYXVGYmhCMWJadTA0TytnVWRPRnRoeklaOE42c3Q5SjlF?=
 =?utf-8?B?TTlkMHVQNzQ1VUN4amFBclFYYmVsQ2pJWExoaThOVXhoNmVId3pKNXNoOTBw?=
 =?utf-8?B?R1YzME90L1NwbmhZR3cvYWM5UUFjR0hRSlhtMWJIRExoMy9jZVlFWjVCbWsr?=
 =?utf-8?B?ZXlYcDV2aTArY0lGSXk3YkZXTnBMZ25CamQxR1JnRHpUUjhDWm9Sem9Eakcr?=
 =?utf-8?B?OVBtWUxIRy9hUmtJSEJMMXFZbHFza2YrcHA1V1RGcm0yZTI4T2JXUmNlb3N4?=
 =?utf-8?B?Y0h3L2pnNUYzVHhzTVJtbnZvWW9SQm9YMEpBTGFkY3k5V2xQVU1XRndFbUZs?=
 =?utf-8?B?cHdsY3B4UmpydEZZSWM0UittYU8wUmtMbEFCaVJhYWllTTl5ZmhYWWgrUjBT?=
 =?utf-8?B?bGh2Y3VGZFNpemF6U1FqSnJQSFpjeG9jNHlkY1Jpci9rZnBvSW5WWWsrLzFM?=
 =?utf-8?B?aHllSjFwRUNORk9ncHMwWFlyK1RIN0dhYUUyUzRVcFUyQWNJVVdJNHlQNTZ2?=
 =?utf-8?B?SFpnYzViSTBqcjM5c294dmNXZmNsK3BLZkpXOFRWNXU4YVZtbEJrM2Y2L0pt?=
 =?utf-8?B?TjJCVDFMeDN0OStDSzN3Q1VldzByZGNMSlV2V0d6MDR4V0FwYkl3Tnk4eFZk?=
 =?utf-8?B?Q0RnaEprVWRuODBjYWFENUFmQVNtOThMeHdRbUVadmJlSExpWnk2SWJmVmd6?=
 =?utf-8?B?NG12Q0RaUGhheEFScUh6ZlZyQnZoTkFOMS90NHJEN0tydHBobGQzUlhFSHpC?=
 =?utf-8?B?YjQ1b0dZTXE3c1Z4VDZ1cWkrMi9wZk1yN2pRM3pwUDRSKy8rdVFtMU1JK2lH?=
 =?utf-8?B?MkFzbk5XdXNCNzIrMUkxcFdkZkxUbE9odDVMdnJjb1VXNTZRdnVrR2FDd0Nw?=
 =?utf-8?B?eEUwU2dwd0Z6bVYvRXZBcHgrQnZPVFVNa1p0SkJKYTV6elZVeEFzRGlSNzJB?=
 =?utf-8?B?Mm1yTmo4ZkUwdE80SjFhZjh2WkFaam9UY2J5WkZmMXg4ME5PYXJCN2R1SWxL?=
 =?utf-8?B?bCt5NlBBYldURnJLSk5pZzdKK0dzWDJQZXJCWmdHQnFBZnZaNVBCck1PNXZt?=
 =?utf-8?B?U0Y4K3RZL1JmM3ZIekVwT2Raem9mNXNHcS9RaEpmVDF4VW1NdytLTENEUG5j?=
 =?utf-8?B?M3U1c2lRTjFTbXFQOGhXclpxelJrUDI4VzF4eGcvSCs0dTRIcjY4eWVVYVRW?=
 =?utf-8?B?eGRRV0w4UzZycUN6M0RpTUY0Q2c2eDl5S1R6c3FXc3NLNUt3RWxLMmRCWHRl?=
 =?utf-8?B?ZmtTbUQ2VkQxaHV4ZExML3JnNE1FWndZS3I5K1NoMHdQZ2FDbXBuY2UwT1RE?=
 =?utf-8?B?V2lMNnp6Y3BYa0VheDdVNlM3eXJkWnNxWEF5K2VzNFU2dzBhd1cwWTAvQVhI?=
 =?utf-8?B?dCtzUEVQbGh5YjZ0SlNMZDlNZHhoNHNld1FPQVRLeHgwd0V6RFc0ZHQ1MUc1?=
 =?utf-8?B?VVlBendsenYwZDBNa0FtOWRkUE4vVzY5ajFBbHRHSUJieG53Yk5WZE9yWkh6?=
 =?utf-8?Q?ChaEUK?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <519D1C16E097AA448985854F56046E55@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8122
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	62d603cf-f7d5-483c-28e4-08de0fc49c1a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|376014|36860700013|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SFhyNWhlOENBMlB5bFkvLzRMS3hQdmFOM1RwdFdITyt4ZUorV3U0cnd5VjR0?=
 =?utf-8?B?Tm1qcVJZS3haNlBnejJUUzNKbmg4QlpHVWFnWGU4MTdPdktYalE3azAyZENh?=
 =?utf-8?B?N1QvMFhuSXBGUUthSGZGVG1uc2xScCtRdDV2MW5ScFBQTE9yNW1jdDBma2Er?=
 =?utf-8?B?SXYzeU1hZWFzYzlyZDVUSGJHNytTUWRwVzZEY1R1aEhOWEtBdDRIN1N0QXlM?=
 =?utf-8?B?VWNhVTI3Q2V5Y1pKaTl5YVV1elVZaVhZTUtoZlZkYmdjNXdnQjg0TnE1Q3o2?=
 =?utf-8?B?MXNLcUl6di8xY2U1cE1KaFd5UHM2UHB4MWVad3hveWNkRDBxM2pFVmhzanF4?=
 =?utf-8?B?YVVhdHdGNjlHMWVQZW1QZFR4Z2RRbDZYQ3dXTzdqUVgzNkc4ZlRSYXh2Sklo?=
 =?utf-8?B?ZlRTTFhXZ2xVMTQyODZ4WFNYbnJsRXFiMlRDQ2E2bWxIUlR6dERKbzFBb3Iz?=
 =?utf-8?B?dVdZZ293QmQ3WGY3MmNUeWtpQ2Q1L3dJUGNhb1Z4OG94RGw2UFVCSUdEKzRK?=
 =?utf-8?B?bjJqMTRqSzRURHR1RlNXY0oxV0VKR05NREpJcG83VnJlMjd5S1ZrVEQvNDNn?=
 =?utf-8?B?YU5sNWwwOVFjU1lkYlA0ZGJhSTBjUEtTVExQWnJyU0FtMkJKSTdaU1libDNU?=
 =?utf-8?B?aDJvdFc4NXdoV1BlY3BhUm5VZGsrYWhhd2M2ZmlZYis5QldrNWxsd3puV0VT?=
 =?utf-8?B?dEdEQjMzVWQ1bXhwTUxxSXBZS3VDeGh2aXZicU0vK1VwTW8zc0JLVFV3SDMw?=
 =?utf-8?B?VUhPbE5WZENpdVJ1N1FHejRWKzlDc0U2dEtKaFJHTExadXpoWmlNLzRYdWE3?=
 =?utf-8?B?cHFFbHM3WGVBZWZhU3NtNG9kY1lhd0lDSzgzLzNzS1NkQ2tjOGRDL0prMGQw?=
 =?utf-8?B?cytCZUovWDc5WGh0WFVCUlRLMGM0MkQ0bVpwUWxGL2hxN2lOeFVKRHlLSU4w?=
 =?utf-8?B?MW5SSVg4bFEzRENkT0VTTjVTWXJmZVdtcHN2WmIwZHphTHRBUi9nY2tQVzUr?=
 =?utf-8?B?T05vRkdQUEFMY1R5RUowM3NaVFl3M3FtU3NsenNYc3RBNkRGSzRVdjZmWUp2?=
 =?utf-8?B?cSt3VFQ2L0V3OHRvc3I5b1k4SkpCbFU2SjlTZ2liSzNtN01YWEhWQ3JHeEtQ?=
 =?utf-8?B?ck9nUUxMRk5yeURMcE1ZNHNON1hQQkY0aU9GSmg5NW1EUzJRbkYrSndLUDd6?=
 =?utf-8?B?dndIOGMrOHFvQmwrWmVaYlMyMlFqYVFGS1M1NWdLTzlGVnlsaVgwQzJpSnB6?=
 =?utf-8?B?RGVwTTJVTjc4SS96SUdLbXNnT3kyb3RvbFBjY01kcXMybFlNcXNOVEluNm1T?=
 =?utf-8?B?dDBlZ0J2VmMwM0JycWM4NUpSMlBDOXdjT3RxOEFXRm9BK0ZJQWZaNytXeE5w?=
 =?utf-8?B?cEJOMEE5YVJTRGQrWWVtN2s1MFZ4TDZrWWVVQktkd2FReXUzVDdIdEhPSkVJ?=
 =?utf-8?B?dy83NnFMbVpmNmN4U3BzVjBWQno4R2xaa2ZBUnZJOXdmSGh5elJqbGdoQ0Ja?=
 =?utf-8?B?QmJ5STZlMmg1TnFLVG1zWWxnQWZjTmI0eDZQaFZrejBCYkRJbGNMMGlOTGNs?=
 =?utf-8?B?YndmNmQzb2l4b2VrSXJXdVJmNHl3ZWFac2tpWUp5YTdvY0k0S29TaER3bi9p?=
 =?utf-8?B?cktUa1FHRFZuT2xQRjJzcjBvclkzUjk2dVMrbnYyTlU0YU1nYUFDS2NCVys2?=
 =?utf-8?B?Nm1yYzA1RGZlWjU2dWJoTlRiYnliVEs1Z1A0NCtJZDBsSWRVV0lqY3FaQzNo?=
 =?utf-8?B?Z1MxdVF4dy9GWXVkMVp0dWx0ZVIxTy9aeFl0bmk0S2NRNE9XRkxNWHIyam1V?=
 =?utf-8?B?RkR1SFJNU1hJdUNpU1dXYU56eXZGZ0t6aCtnU01sMDY3Q3ZTTWtWMUxmRXVx?=
 =?utf-8?B?eGE1bmN1TXVZaGlFZEZWL2lEbWIzQ3hQVVhzSEJXZVlQV1lRSlpoNW14bkVu?=
 =?utf-8?B?NERIeTRwdVBBNkV2VVU5djFrSUdNZGcvN2E2aGdqSFU3YTlUcVN1clhCRmJs?=
 =?utf-8?B?NVMzQURRVnZRWkNMdUVxbXlkcXdXQjZ0VWdDVFB2bmx5cVp5enlEbjhqMFJW?=
 =?utf-8?B?MnQybHMvWWh2OU1sQ0hFN1NmbmJycURDdUdZZmRYTFFTS0dDUkU4d2RmQW5Y?=
 =?utf-8?Q?Htp4=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(36860700013)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 10:37:42.4426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a4c1f0-8a2f-4334-8db9-08de0fc4b30f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6683
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 10:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225112

T24gMjAgT2N0IDIwMjUsIGF0IDEwOjAxLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPG1hdGhpZXUuZHVib2lzLWJyaWFuZD1ib290bGluLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIEZyaSBPY3QgMTcsIDIwMjUgYXQg
MzoxNiBQTSBDRVNULCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90
ZToNCj4+IFVzZSBzY3JpcHRzL3B1bGwtc2RweC1saWNlbnNlcy5weSB0byByZWZyZXNoIHRoZSBs
aWNlbnNlIGxpc3QgYW5kIGFkZA0KPj4gYW55IG5ldyBsaWNlbnNlcyB0aGF0IHdlIHByZXZpb3Vz
bHkgZGlkIG5vdCBoYXZlIGxpY2Vuc2UgdGV4dHMgZm9yLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4+IC0tLQ0KPiANCj4gSGkgUm9z
cywNCj4gDQo+IEkgZ2V0IGEgbG90IG9mIGNvbmZsaWN0cyBvbiB0aGUgc3BkeC1saWNlbnNlcy5q
c29uIGZpbGUsIGJlY2F1c2Ugb2YNCj4gSG9uZ3h1IHBhdGNoOg0KPiBzcGR4LWxpY2Vuc2VzLmpz
b246IFVwZGF0ZSB0byBTUERYIGxpY2Vuc2UgdmVyc2lvbiAzLjI3LjANCj4gTWVzc2FnZS1JRDog
PDIwMjUxMDE1MDUwNzQ3LjIxMTA2OS0xLWhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4NCj4gDQo+
IEknbSBub3QgcmVhbGx5IGZhbWlsaWFyIGFib3V0IHdoYXQgaXMgZG9uZSBoZXJlLCBhcmUgYm90
aCBwYXRjaGVzDQo+IG5lZWRlZD8gSW4gdGhhdCBjYXNlIFJvc3MsIGNhbiB5b3UgcmViYXNlIG9u
IEhvbmd4dSBwYXRjaCBwbGVhc2U/IE9yIGlzDQo+IHRoZXJlIGFueSB3YXkgSSBjYW4gZWFzaWx5
IGZpeCB0aGUgY29uZmxpY3RzPw0KDQpNeSBwYXRjaCBpcyBhIHN1cGVyc2V0LCBpdCB1cGRhdGVz
IHRoZSBKU09OIHVzaW5nIG91ciB0b29sLCBhbmQgYWxzbyBzeW5jaHJvbmlzZXMgdGhlIGxpY2Vu
c2UgdGV4dHMuIFNvIHBsZWFzZSBkcm9wIEhvbmd4deKAmXMgcGF0Y2guDQoNCkNoZWVycywNClJv
c3M=

