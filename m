Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BE8C7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 13:30:54 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.56])
 by mx.groups.io with SMTP id smtpd.web11.14905.1750339845580037386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 06:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qqqN/u5l;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qqqN/u5l;
 spf=pass (domain: arm.com, ip: 40.107.130.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WVG9VoXLh9106ZVRoDaw8i8jLEnAkDJu6sWlIahdxBIhY7ELS4hWhVWdyJuu6jsC2WITU5xJibkZKBk4kHSW/+hciYdCuSDUvVu4fYPQaXRv34QBqWjKKL1nbyJt8AUAHyD7DjpehCSwK+xNuRuZ9T7VLJFOA3Og8XxDTgqtnHP/vJjkwXi4aNY5RD7UhiOWBg1o8uwDVomKAAjohWCua6v7v2YwY6vDfDYxOpNWLhGieMeAHO8jwnE/bS/cTj4K9Ws57suOQN3Z+rlo4Ekag1cZnlo75LnZQHEmH/MoDt1fmuEZwdOkhhSFinnCK+oaZsQAbAb5+Rn5w2BJCmAWHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9FfqjOC4BXzOw23hkgXB/c2sUDeP5MGkuJoZMa1P0A=;
 b=facoHX01tqhvpF5vkbAhWUmP/SCUUnz7agUsgM7EyqMgVhywiwOtl7cpSUSFzVsVzL0GOseM1F80YT9MHIbxAz5PfXCbNWPC4S0+mhB6aIschWtvU7oV0jRaCEdYuL0lffiRMhAvB09AOuo9wPYfE+bc1RbwPTb5yfv5PI9W/EWZ9peK7qXZihCiyQCahnDfQqc7KeYd3oVZn6n8XwPEX0WwFN7lXzjoVh0cpyUnu4sYoFmhVFYINBSc1bG7e7Y1ypaXalxvO5FC4wuMStTvdejDZxgoegYdsMAOD4XH7Oxl+/67djfNXnWAfDnbNmNni3J+UVJfvcGVDWkMgnTAzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9FfqjOC4BXzOw23hkgXB/c2sUDeP5MGkuJoZMa1P0A=;
 b=qqqN/u5lk30uK9DCz9yKHOV8QvEUEFyWi+Vwj82E9EnEWsAs1/GaZg5Hqi1ap6jzaqEns7OFjNoaa/+Kev39l+yTeIF0giZFQYLaw7l+8x42tZEUpJS7aArcfhXKz/xdItdpX0nEw8HuFClEZaliHXGVA4lotVTTlWIFUbwwfvk=
Received: from AM0PR01CA0145.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::14) by DB9PR08MB6346.eurprd08.prod.outlook.com
 (2603:10a6:10:25b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:30:42 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:208:aa:cafe::f6) by AM0PR01CA0145.outlook.office365.com
 (2603:10a6:208:aa::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.35 via Frontend Transport; Thu,
 19 Jun 2025 13:30:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Thu, 19 Jun 2025 13:30:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMSPOaIwf/0xa38lpLtJziT0HN0WhpFLmh5Bfzvflzyzx6Ta0ckZS8Xpk9yzh7qQ+MuxM+obvzFUlile7IxGz+0QPM0FgyEi+ij1LWeAROuxbwJA4DdlZ8ix3BSSqYfFiixT5yuPx387yUdzUleUk88p/ye7AFt7sS96eHXR+b2u08XFEnNHVeN1vvfCmejCRQeQOGmSIKSgyamasKNe61xkUbx8gil9uBibyQghx/fYV7nuDXpjd3Q0q7ip8rqfUjCxNRwhj8FYQndzuPxzzeZqAIHMf7IdUJI5N5jX4oqWGvNWclPGKJpBaCtJLVpIbh33V4p2amwlWJ0a8raoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9FfqjOC4BXzOw23hkgXB/c2sUDeP5MGkuJoZMa1P0A=;
 b=R2kxCDta/zmDFlaCHVs6bG6toEUW8GzOpgFLCLQsK4A7gvrJO920ra7gD/YMwD/L7XSOaMXeslnovDJnH2U9/DTjpKazu+G72hHJdFDeld9ACZN53spitOcR0Cs+ePPsdPL64ts5KWuCdTR1oiDibwJzTFcaoKXuHwqdDRDoHckeABrhWZLJREB8f1dmMMyTNDlRsOFFa82rjLAAt1xhiVPZXqdRd9j4RyPmItxhGDVfOW3JZ4PZkEk+70ttMP8VvO73uMnXYaHhrYngM+NnJmoXqNa/jrUrOxC8EKkmUylpLDYVH8UFaBUM+siMx/uPHfeh+CTDIiIj1SAQ+5OVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9FfqjOC4BXzOw23hkgXB/c2sUDeP5MGkuJoZMa1P0A=;
 b=qqqN/u5lk30uK9DCz9yKHOV8QvEUEFyWi+Vwj82E9EnEWsAs1/GaZg5Hqi1ap6jzaqEns7OFjNoaa/+Kev39l+yTeIF0giZFQYLaw7l+8x42tZEUpJS7aArcfhXKz/xdItdpX0nEw8HuFClEZaliHXGVA4lotVTTlWIFUbwwfvk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9055.eurprd08.prod.outlook.com (2603:10a6:102:343::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 13:30:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 13:30:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] scripts/wic: fix calling wic ls|cp|rm|write
 hung in bitbake task
Thread-Topic: [OE-core] [PATCH] scripts/wic: fix calling wic ls|cp|rm|write
 hung in bitbake task
Thread-Index: AQHb3pZ2IluIGRHVS0+twOiEgLnAGbQKf1EA
Date: Thu, 19 Jun 2025 13:30:07 +0000
Message-ID: <A2AB1D35-6090-4E27-A00F-5A69851CCE72@arm.com>
References: <20250616081245.1565935-1-hongxu.jia@windriver.com>
In-Reply-To: <20250616081245.1565935-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9055:EE_|AMS0EPF0000019D:EE_|DB9PR08MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 957b0d98-af9a-460e-be4d-08ddaf357be4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?S2x0a0xpMnRKWmtTZ1kvaXZXWDRNVlRldkJOclE3R3NZbVlZTFZMODFKL0I1?=
 =?utf-8?B?WVAwbThucE1paVVDTzRvMmxuTVpTMFRGTzdlV2dwbk9ybG1XcEo5c0dJT1V3?=
 =?utf-8?B?MEZ4SmNSa3VmNHJyMW9CMEpDQytIdVZWOEl6MmlTeEoyVDJ6R3J2dlkwLzBk?=
 =?utf-8?B?cGY1bHNGNjNJcE9rUzQ2bXpRdUEzdk1teFN0dTFtT1g4RzNlaXNrL2lCbnZM?=
 =?utf-8?B?Nld1d29hNTVpaDJwNytBUzR5NDA5cDhna0NXcU5nYXZoVlhHUlhVWm9YN255?=
 =?utf-8?B?RGJLTHlickZlL3V3V0grK3VEUit4eHdrcVNyUG5ZMExrK0QwMHhMZVppbkw3?=
 =?utf-8?B?WlBtVW1CSXdoM3ZRSmlTQmcyZ1RxcFpadFltaEZYbU80SnArbUR4R25WS1Zo?=
 =?utf-8?B?cEN5T1lKWjV0TXF1QVJuZEJadnRyaEFnRTdWWUg1b2N3anJGZ29pc2xtcU0r?=
 =?utf-8?B?UlU1TWE5M0h5UjFoSEszdEUralgvNm85YU1BekZtNExNVHR4cDRHWUU1L1pP?=
 =?utf-8?B?M2x5LzV6ZytVNlYrcklXZG96dXhxbWpxTUp6RFBoL2ttTy9yVkpTeElBM0hl?=
 =?utf-8?B?eVlmWkdnL1gvQmh6VUEzSy9LeE1NZ2hUazBUTFVhZkllVlh4d240RkRmdTNl?=
 =?utf-8?B?UWRnUStoQUttWHlMWjhpZmtwYU5rZXB4RWx4MUFJWXQ1WnBDN1BXMVhKQ3hO?=
 =?utf-8?B?OXpXRDNKWUZMcmRmeWY2R05uc2c0UkJnTkUxNHNzREtJTHVaMUwyMzljN3pl?=
 =?utf-8?B?VGVrUVgxdXA5SWpGYTFpMVh2akd3UDhOclIwYisyOGc1NkxMNkJ5VnAvNXVW?=
 =?utf-8?B?T2p6aWJDWC94ZUZaMVFlbVZVVjJLOSswVm5PY0Fub1BkY0xJVk8vNHV3Z0Ns?=
 =?utf-8?B?ZjNzQnZrUnZHajI2NFlEOWJJWUlaOERGa1pvUjVNUzJYL0FrdzF3Z0h2aWo1?=
 =?utf-8?B?QUZ1ZWxKWjN1c0h4UTFlYXU3UkFjZVlyQ3JSUFF3V0l1WjdtVDdQUllscmhQ?=
 =?utf-8?B?bVkwZkl3VEFCMWFRL0NpWUtSL2RNMm5Uc3FGRXdvV1NPOVFJaHNUWC92YkRP?=
 =?utf-8?B?UVMzVGJpYTRXbHZmZTNaazlUUEZETmErT05RK0FDdE1pd3dHTUMyN0hGOCtX?=
 =?utf-8?B?MWt1aTRPMlMzNnY4SVRiOEcwQWd5dk9BNGx5M1hGS1Q3QStlVTlReVFpMzNY?=
 =?utf-8?B?ajVRcExyR0d0WXFNWk9jR0lERFhNcUpUOU5qZUkyR0xXQ3lvejRrRUZydldC?=
 =?utf-8?B?UmI2T1VNTWpCalBvZERQTlpsN1V6ME1GdkhJeHJyWGJ1K3R3OWw1MlpoZkYz?=
 =?utf-8?B?b0VVYVdqT1BZbjBEdjQzK0Qrc3lEaGRVclhzOVBnUmhzTGtLdnZPMFhrRTlt?=
 =?utf-8?B?eUkxUnY3K2Vlc1dhTE9aTnZrRnQ3K1V1V1Vuek1XK1c5bUx6c2RHaFdjWTB6?=
 =?utf-8?B?UmNBZ3VvWHRvM2dDK1ZrcUp3akJiNDdNVzBFbG9zdkgvV2d1UzM1aytpU2NJ?=
 =?utf-8?B?S2FiQ1k1OWdGTG5KZUkrdHpYZm1sbml3dmNWRHBmRXFOa0xpZ2JiYklDRERJ?=
 =?utf-8?B?Um4zMzJ5UTJQc0xjOUJyOVhNdXhVQTdXdmt2c1FFTklPMTJNNTFXajV3UnY3?=
 =?utf-8?B?SXd3Kyt2b0xmSm5yNnJGSllPOEZ4aU01U1BpYW1MZkpDcnlhM012WUxmbmZU?=
 =?utf-8?B?YTdueUlySFJSZStzdzlrbzAzMDNrOXVCM0xtcXBzUGRpZHAxR0FiSmRKUi9j?=
 =?utf-8?B?ejJPeDNRWmFmSVkvUnREL2tnSkt2T2QwaldiWDhlWUppNVZxQi9pMTBkeEpM?=
 =?utf-8?B?aGR6T1dGMWdiMHg2ekpSdzVXMHZKZkFmNHN2QWdOMUErWnFBR1JrdldoRkRG?=
 =?utf-8?B?eEo5Q1A4Rjg1R0sxN0E4dmc4VUtlTnIzZkxhNG15Wi9rWGhyZ0JoM09rc0ox?=
 =?utf-8?B?Z3puZFYraXpPSThlNUZJNnI4R0lYZ3VDY296cE40cWh0ZDJjRFI4MVl4YU04?=
 =?utf-8?Q?jfGG6ZO6fmkWZr9Lrjnz+ZEm1lXfqU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5112EC491F52F94B96496745C1BD0CA9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9055
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	128a9af0-f906-4b41-cd4b-08ddaf356822
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WGNPa09ON3VQZVloa2hNVVJWRXBuWFdGU2VhT015cDNCbWZFUDhiYldmaWhJ?=
 =?utf-8?B?ZU82NHJIVERZekh4ZWNpeldJZVBKbGhjd0lWUXBjVGhHOXVTSlBNdW13eTR0?=
 =?utf-8?B?ZEU1KzRtalpxSkRPTkFrNE5NdFFmdmhsQldhYWlrRGhvRytYSmlLdWtmWjRL?=
 =?utf-8?B?UGRUZDVoZGhDQXF2aFozd3FYT3UwUUVhY04zSys4dTA2ejF4czhhaTJuTUpz?=
 =?utf-8?B?NzVNTTI5Rit4Nk9GQ251NkVPblQzSHhSN25pb25qZUxTSFo3VHRUUjNtaEVP?=
 =?utf-8?B?M2t4ZXdOU1pMazl0Q3B5cDRGaHhkdGRSN2pNUWZQRWF5QW9jVmRjRXFLYjJG?=
 =?utf-8?B?bDJybHh6aG5SWTFDV0V1eEVnZEpnY2E3UlNsbnVyUGRmZStmVlZlRlhicjVW?=
 =?utf-8?B?eUxDd3RHN21VR3hzUUp4OGF0Snk0UGIwbHFjWmtVSzV6V1dSczVyWWlBNW1D?=
 =?utf-8?B?NVBpTVMxYWdMYnBIUjBOdlZWeG1iMGExMTJvUng4Uks3OC9Vb1NrTTF3NUJk?=
 =?utf-8?B?aVlGSmNTR1lFdnRYQlZEMWFMeHBKY1MvUnNYRUtUNzI2WEpYQnA5UHJsNUUx?=
 =?utf-8?B?QmRXM2xCbnBhckxkWFV4c0xFV2RpSkxpNWFqZEMxcW55ZmNZTzAwZStqYTg0?=
 =?utf-8?B?OTBPTWdtV1hBVkZlMlNZU3l0OXJiWU9YT0dwSnJBZ0J5R1NzUVFvME1vVFRP?=
 =?utf-8?B?c2RNY2lCbEJNdURVQ3MwZUljenFDYU5CVXd2K0R2VllkS1RlTkNFdU5Da2hU?=
 =?utf-8?B?N0c0aS9odGNSWE9tZGpTek8yWUpOTUd3ZzhJUnBUTFRaVVpJaHhkZlIwSWRu?=
 =?utf-8?B?RjdldFU5eGpYa095OE56cDBrd1lzaUxneUZlZk52ZEQ5N2xDdndLbTFBTVor?=
 =?utf-8?B?Tks3RkNKcEZ1S013WENDYkJTZ2lBNFc1TFhqdCtqenlCb3kwRTVILzJYL1Bs?=
 =?utf-8?B?UHJBb1h3dTZoN2RrWEFuWlRTVTlCVW45T1NXeEJJRmhrYkdqeTJtZ3Jyalph?=
 =?utf-8?B?ZGNFUnZySjdKS04ybGNyUStpWmp2VnVwYVMrUjJJcnJKT0h1UTV1cjRtblZa?=
 =?utf-8?B?aHQyRllVZ1pJeThmV3MrcHlJT2E1SmFBdWF4Y1lBd2VtaUhHZ0ZoZXA4Wkdx?=
 =?utf-8?B?bHdPa1J0UGR3dWRZTjd1Ykx6YWh2bGxDdFlzRFBDZFFtZ2wyc00vUzdUQkZv?=
 =?utf-8?B?YzhxNjlRRlFSbnNIK1hmLzhpRTFNWWE4VERXVG9YZGl0RkdkRy9sekoycGxQ?=
 =?utf-8?B?TERwVkhTVWdxdWx0ZGVENkY5U3ZuQUpwTEpOd1YyUVAxQnZhQ2cwd053bk9v?=
 =?utf-8?B?OTR4Q3dteFBIOUF5M0J1ZDJjNDYwdTNLRTlSOUNld2J6NWx6bmNoMnJjSGEz?=
 =?utf-8?B?aXhMOUNpL3lONDNaNXR5cnJXZlR4eUlkREJrSENBRW5FOGFabjVZZ2syNVV6?=
 =?utf-8?B?cnhBcXcwVXl0RzhNL3RMQVArN3B5T2V0d21JSDhxQmR0RlFwWWx1MnJnbjdE?=
 =?utf-8?B?T2gzWmV3a2x6Vk96dER5ZW5jYlhOa2l1dFcrbVlCOUozZ2NwaHIySkZXaTVa?=
 =?utf-8?B?RGcvS2dWRnhDeDI5cVNmaHc2Q0hldGdiZ3JFeXlTeGt3S2l1TzhCcFJmbDJR?=
 =?utf-8?B?NVUwNHI1WWE0c0hCdkE5U2RGUkZkQ3pmODJ2MDJnU0MyOHhPcTBFMU5aYjJT?=
 =?utf-8?B?Z2tiWUtMSTAzU1lOVm5MT0c5UnhQbXFtQ3VOSUt3eFR1TGRJQjV0ZEVCVjBk?=
 =?utf-8?B?ck9NSUk5bitCQ1lydlRrSE5MaFBkOFh3UFd0UUlNOEtMWE9DRlhFM2txUFVF?=
 =?utf-8?B?Q2tCRCtvM21DdFRjL3dIU0FtRjJiZFJrbXpkc0VTK3RGTDV5QmZWblRhSnly?=
 =?utf-8?B?YVVKbjlZSU9nUER2c0oxWjNvYTN0dGRLVXlhejU2dTFNOVF4S2NmRzd2MWIr?=
 =?utf-8?B?WkQ0aTZrUFBRTE9aU01VbUlEWmV1WHRURjhRL2J3OThIN0FqNGkyTUk2UVVH?=
 =?utf-8?B?UVlmR1BUd2wrSmUra01MRzJOVkV2V0IyMTlpcUN2UFQ0Z0t3QVJGY29TTVpi?=
 =?utf-8?Q?GAQQun?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(14060799003)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:30:40.2744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 957b0d98-af9a-460e-be4d-08ddaf357be4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6346
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 13:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219081

T24gMTYgSnVuIDIwMjUsIGF0IDA5OjEyLCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGhvbmd4dS5qaWE9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBXaGlsZSBjYWxsaW5nIHdpYyBscy9jcC9ybS93cml0ZSBpbiBiaXRiYWtl
IHRhc2sgYWxvbmcgd2l0aCBkb19pbWFnZV93aWMsDQo+IGl0IGh1bmcgd2l0aG91dCByZXR1cm4u
DQo+IA0KPiBEdWUgdG8gY29tbWl0IFsyMjU1ZjI4YjU3IHdpYzogYWRkIFdJQ19TRUNUT1JfU0la
RSB2YXJpYWJsZV1bMV0gYXBwbGllZCwNCj4gSXQgY2FsbHMgZ2V0X2JpdGJha2VfdmFyIGluIGB3
aWMgbHN8Y3B8cm18d3JpdGUnIHRvIGRlZmluZSBzZWN0b3Igc2l6ZS4NCj4gQnkgZGVmYXVsdCwg
Z2V0X2JpdGJha2VfdmFyIHN0YXJ0cyBhIGBiaXRiYWtlIC1lJyB0byBnZXQgdmFyaWFibGVzIHdo
aWNoDQo+IHRyaWdnZXJzIG5lc3RlZCBiaXRiYWtlIGluIHRoaXMgc2l0dWF0aW9uDQo+IA0KPiBS
ZWZlciBgd2ljIGNyZWF0ZScsIGFkZHMgb3B0aW9uIC0tdmFycyBhbmQgLS1pbWFnZS1uYW1lIHRv
IHN1cHBvcnQgdG8NCj4gcmVhZCBiaXRiYWtlIHZhcmlhYmxlcyBmcm9tIDxpbWFnZT4uZW52IGZp
bGVzDQoNCkRvZXMgYW55dGhpbmcgaW4gY29yZSByZXBsaWNhdGUgdGhpcywgb3IgaXMgdGhpcyBv
bmx5IGEgcHJvYmxlbSBpbiB5b3VyIGN1c3RvbSB0YXNrcz8NCg0KVGhlIGNvbW1pdCBtZXNzYWdl
IGlzIGNvbmZ1c2luZyBhcyB0aGlzIGRvZXNu4oCZdCBmaXggd2ljIGhhbmdpbmcgaW4gYml0YmFr
ZSB0YXNrcywgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0IGdpdmVzIHlvdSBhIHdheSB0byBh
dm9pZCB0aGUgZGVhZGxvY2sgaW5zdGVhZC4NCg0KUm9zcw==

