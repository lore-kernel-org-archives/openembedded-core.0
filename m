Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D8ECCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 11:23:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.39])
 by mx.groups.io with SMTP id smtpd.web11.15841.1760959435052380952
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 04:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CKl2fCfc;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CKl2fCfc;
 spf=pass (domain: arm.com, ip: 40.107.159.39, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FUsL2EylLqRJBBKue7t+SCT6wMdJmJIo/NMFWkbjXmZd5hU4WkWF4IfqhIJolRYiIk8VZbYkIiQGqcXgWtqW8QoLII0A3riSjwF7qN9xW91nLwqlJqkQF3uA6tC5jWRy2HX9NSfbE5IqH0cacJejdGs7ObCcqsHiQphq0bFloNtNMRTB65G00PpCy3sK7kBw2hgP08tkISOFtLuw2SH/UeeShUZBgXG3o1Cm09hbdnYBQt8hN06HnFC9HQAXCDRBFs8hFwW3mwMom9LOPWBuJrWdnuxQEBNnPPvhoFO31+d49CatOUXZm9CH8lTffX2QPtKKm7nTxkjFtkqdds3iMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZPF9JPRWUeAxhPawIHWxR8Zo8MBtjjRRo9HyjTdZBw=;
 b=WAWV7ibB24KK6ntldzHnkXFiA2lSpk1dApR/+l0fpxz88/koznuILN2dsi9bAILAO3JHIJZM85hxFAid6z1BAlwNoHN0qsDXRVHfNwIz3O7t/17sSlQwhL5OpY3+lKY0vJ8FpRHfVN/chS4ERRnk6+imD2fDx/tTQmvhvt414GmumCmPTN+e8jeglYgnMVDGOVA4dx1SkRagYgsKHZOJmk46knqf+c7eKnMcSBoSyRtE3TZfyGkP7Tf1jKlFQUPSNewLQWoaT/eaFoH6NqaDejBHFQfBbUIkdqmMT7v/2mm4V2sjQv/Ij+r4TVVHGJOeftZwbEqtwwj4C5SBPmT6Mw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZPF9JPRWUeAxhPawIHWxR8Zo8MBtjjRRo9HyjTdZBw=;
 b=CKl2fCfcg4pUjvlbhSrO/xagO1IYqq82UZ72VDK7ZjbH2ZkG4hmPljSlKh5yTcsourf5I2aCnMDXBMwc0MVY78dmiFUObs2mCIggwX1B/Fzg7FAyaVLBzDfy+5Vhcu07S297gcCftaQOZ6Fzjce2j9X3P9qBcJ+2b4k6N3WSRzc=
Received: from DUZPR01CA0284.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::22) by PR3PR08MB5691.eurprd08.prod.outlook.com
 (2603:10a6:102:82::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 20 Oct
 2025 11:23:50 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::5c) by DUZPR01CA0284.outlook.office365.com
 (2603:10a6:10:4b7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 11:24:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 11:23:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDrakTLwzouPZ35enD1UtfbgkZgWkjT64Bpu3xt2TZv8wUebTJuNFp4NoONIYs0kh1pcFgQ75aSgEzF1WKmvXsGdUvsN4r2lbCd5ZwfrwOghuXWt8UZis7xJVH8I1REf0SBK/t9O+po7dGsL3WFrbK2lz8YIK7MBbEg3AkmBEtAhScv+hJuYWmM6JXTBSJckrQvZtrO5m8wfnUOQdJ5k5OvW2pVHJmNFoywYgWE3LoblcpjtCerwHYnXeOserLws6ppkn6hmanK0l8T2gq6PMj/l2MYenF+tLH09W9mkUtXO/WCwTSzMIRXCnO3BPzAZ0YSEcewhyBBYQ4egcIp6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZPF9JPRWUeAxhPawIHWxR8Zo8MBtjjRRo9HyjTdZBw=;
 b=rMJWdl3UTl3145M6Z2deK+OVFthz3dTRFLkk4ph3QClggukb/hhUbNGK8V8CGDlvaD9UASXHh860tKxzN/NMC9d7wZQJUzcw5uRivMw6TrJ89wbQDv9qs6cGuy9cr1m9QysCZTxAzV/r4SnOFKhKfsx5XH3pY5zJcF4Wu96pkoIoeOP8j1nWaO0jtKweS442D0rcpf269qYQBjK06Tc0OwG6/MBgnNLmNuhTCWZQvaoDDQFeEAjX7YzbdmV9XovURYATYT65j7igYS5eCqfEAhzMt2V3moXjYxpATnY6pmn4tcDDNWWMBDs+z5ju6u2ZhynuX/dVV+QPekFlboSuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZPF9JPRWUeAxhPawIHWxR8Zo8MBtjjRRo9HyjTdZBw=;
 b=CKl2fCfcg4pUjvlbhSrO/xagO1IYqq82UZ72VDK7ZjbH2ZkG4hmPljSlKh5yTcsourf5I2aCnMDXBMwc0MVY78dmiFUObs2mCIggwX1B/Fzg7FAyaVLBzDfy+5Vhcu07S297gcCftaQOZ6Fzjce2j9X3P9qBcJ+2b4k6N3WSRzc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8671.eurprd08.prod.outlook.com (2603:10a6:20b:55e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Mon, 20 Oct
 2025 11:23:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9228.012; Mon, 20 Oct 2025
 11:23:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>,
	"deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>
Subject: Re: [OE-core] [PATCH V5 2/3] rust: Use llvm instead of rust-llvm
Thread-Topic: [OE-core] [PATCH V5 2/3] rust: Use llvm instead of rust-llvm
Thread-Index: AQHcPbp4drTr3kWEvEidTbg0RiBd+bTK7FeA
Date: Mon, 20 Oct 2025 11:23:13 +0000
Message-ID: <4F641BFF-8B16-46C4-836C-51705A5659D0@arm.com>
References: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
 <20251015095914.2120664-2-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251015095914.2120664-2-Deepesh.Varatharajan@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8671:EE_|DU6PEPF0000B620:EE_|PR3PR08MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f9a027-d903-456c-8c9f-08de0fcb2398
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bElJUlVidEdveVgwOWtMeUpNZkJzcmlWVStOdVNSSzdiUXRvcFcybm9nV1lS?=
 =?utf-8?B?L2tETjZOVVJWLy9XSUV6MlhmK0ljTjdsT0FCWlZOVVMweVl4dDlFUWN1OW5q?=
 =?utf-8?B?MnEwRW1SdHZjOEV2ZHdRTEFlS1lWTDZIbnRWUDZYQVdBSzFUN1oreE5xbzBW?=
 =?utf-8?B?SjFsbDQzYXYxdFA3RmNTYlhvUEhsVjRIRTloZTZtMHZGRWNCai8vbm1MVU1p?=
 =?utf-8?B?bWNabkFRVytMZWwzaHNJcU40MC8wZjNMQlV6dDQwT2NoMVpvUlVyak9jbzlY?=
 =?utf-8?B?K2RpSk1aYm0vUXZLcVpza0RKSnpPT2VoelBZallVd1FmUkJMOXRUZ05sTzQw?=
 =?utf-8?B?aWU2SXMxSzBlYXNLWEJtdDhNc3NENjJTREVEMjE5NUpYQVZLK1NvWTVGV1VV?=
 =?utf-8?B?N1BWbWEwNUFhS0VvK2xKcTJBR2VKUE52TlZjV3VFY0JOWUkrVlMxMnZLNWpC?=
 =?utf-8?B?YTVNSXZlMlpyRGV3OHAxNU1yNnJUZlhzOVI3SHRpU2Q4d1Q0T3dBanRBbW1h?=
 =?utf-8?B?SlVOQitNeXVKRWVKTXpUekxCUS9FU1YwNWVXSEo3cDFhNmExTlpNQXdUZnN1?=
 =?utf-8?B?TURPUTNzeXUwZ0NjOXY2SFJHNnFEY1J0dGsvZ29WWk04T2RFMjM4VncweVdQ?=
 =?utf-8?B?c2cxbDEwNWpjTDN4cE5GRDNqVXpiUjJKcER6di85Y2IxaHcxL0l2SlBZUFFB?=
 =?utf-8?B?L1hYQ0JjSEZTcm5BK05EU2swSDdEZDYwQ0VYcjhsYkNUTHhMSm9QaGpHTkFC?=
 =?utf-8?B?Z3l0eVd1dlY4V2VNcmR2WjkwTXU0eitEMG9FblV0dDhvVDYvY1hRWkRWTXN0?=
 =?utf-8?B?R2JGNGYrSjlIK2lKNEN5aUVQRHVCUW9CYUtsN3lrYVMxQURGRFJTOGl5WEk5?=
 =?utf-8?B?WXpCNWRRQTBBRlZmazlCZ0dBVlc2bEMrZE9rSm5venZ1VE5YZEsvNmRtTzJ6?=
 =?utf-8?B?Z2RrZnBScGovNUptRFN3QTdtSUZJMkpzT1FLbUxKYUFndEZyYXF4T2cxY2Fn?=
 =?utf-8?B?VEtiWDhveTVmTVAveWxqdGZBRWU1a2RDV2xvMmd5L1FVMjA1NHFoWmh4ejNF?=
 =?utf-8?B?N3dqMlhFQzJUcEprRDdHaWNNWFVpRkFPQXhNOFlCVUxiMEhNY2xLQW1LRUZu?=
 =?utf-8?B?SzlsNFlzTll3SHFQMlhZd2w0WHE3MmFBb2ZScG5UK2VtTm4vK0o4MTZtQjV0?=
 =?utf-8?B?QzVXVzRFclJUeFVLUGZOT1ltL0xLKzF0ZlVmMkZtNjJMZ1NrMlh6WHVrak91?=
 =?utf-8?B?bHdSby9rSmp3WVd1bi9NTHJyS3c5bGNSZXo5UGZJbGhjaEpQR0svU1JYWHF0?=
 =?utf-8?B?TmZlVm5YVm5laW1WekxzWEsvcXBXamhJT2VsWXZiYkMrZmIxNGJkZnhaNlhN?=
 =?utf-8?B?MThuOUFhNllHOWRvVVdIREk1S3R3MFdHbTJMZU5pK0pTQkxlMXBHQ3g1b1or?=
 =?utf-8?B?YXd2UVhtdTdPeU90dituME1XTmNyY0lHcXpSWjNPR0NJbGd5SGdzcy9DZXR4?=
 =?utf-8?B?dG9pTmxHSmwwU2FqaDFYTVAzb1EwRk5wMHRMNHRRMVhOdGFmWW4rZS94NkxX?=
 =?utf-8?B?eEhWZ1FhUzNPdXZhdW1QZ3p3S0tjOVNUa25LWXRTK3p6ZTFnMmZRSlRiNTNF?=
 =?utf-8?B?RWpnQmoveTFRdWc2cjJZYklvSUYyR0hEUUFac1FUS1EvTDFnYnNEcG9iSlM4?=
 =?utf-8?B?Ni90TEFpR09ldjFTdTFuU08ySFRHRTFNYTRpbEJ4VDJWRlNZSmlQa0RmMmdr?=
 =?utf-8?B?ODhaeXhsMkVkYUkzeHNpS2t2OW8weDJXS1J1dDVyMk52aTZpWXJNMEg0MDdr?=
 =?utf-8?B?TGJnZDBpUTdHMWtKQVNHRXI3N0tJa3ljajN0b1d5ZFhPc01TNkEvQW13b3kr?=
 =?utf-8?B?RFNhczF0QnNhdnlTK0Jack9RdWpTdkszVnFyNUZHbFVnRVIrbGRvb244aGVr?=
 =?utf-8?B?YlNFMGVEdDlZeHVnZTZ0eitsRUVOSXdFMnl4ZGZLa2dYUStaVVVScEN6dE5l?=
 =?utf-8?B?Zm1PZmxTRjBoQjV6V3BhM3ArbHRRK0U2cGZ4WS9iVHl5UU0yYjFMUHVORWpB?=
 =?utf-8?Q?Js6N41?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D1DD4500DF09F4DB0CE6D41C4D4BAD5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8671
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5aaccecc-b774-4336-b6f7-08de0fcb0eea
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|35042699022|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TlVzamxjRkJrODNTb1ZlVkg2c1VZbTZMTzdROXhUTTM1TzIzQUg5UkIyUWt6?=
 =?utf-8?B?aUhIdGhrUFZNVkNRVGtaZEZiMmMzb09LeGwvMm56NkR6Z2lVbnAzYjBTbFdN?=
 =?utf-8?B?cU5vTWhqWFJOYXkxV3pBV3NQME1PZFRqanE2cjNYYVFHQkNZNFJ2bU83dFFn?=
 =?utf-8?B?QWVuTWRuMjF0bkFGaXVrN051R2dCSTdOUTBMUjJXbDNJc0JvbFd2L08vWncy?=
 =?utf-8?B?SVczdWdjMHpWdHJwRTBCTE9HMm9nb0k4OFV3T0ZUaXBXVDRpQ3VLL280dUFZ?=
 =?utf-8?B?amFXeDFNWE0ybng2N3RNekhRWk4wR01NRnRrbG9TdFpYM3RUbnVuUStUNHh6?=
 =?utf-8?B?YmV3S0NzSFI4VU96U1VpclBqY01ZdHd0UHJpdEEyTEVXdDAzTWhRWkVsQXBW?=
 =?utf-8?B?N1JZNjJzaXRheUVxOStaQTZJak94K0hRcGJEUTNnVlgzVU9BMlZ4WHh3S2Zh?=
 =?utf-8?B?Zjd3cEJDQ0ZpSGJOQTRSTVFuTllkNU15Mk9rcTQ0UFUwbUpHWFo2SjFTMno2?=
 =?utf-8?B?NEpsUE5EcnA0aXJTSkVqajE2TVFYY1R4VkRkamU3ajNkK3NmUFc3OWJsVXlN?=
 =?utf-8?B?bEFLZHl1R3FGbXQyODJ6a1JmWkE3SXFMdy94YzYyV05HWURqSmdNOHEwcDFZ?=
 =?utf-8?B?ZEtTM2J4Q3NuTjVQQ3RZVlo0SmNFY0hlNnFEY3J3Wm1oZktrWS82b3QyZW1k?=
 =?utf-8?B?cFNVMVNZUkdkOGtMemd0TlEzcmRJM0k5NU44L29heVlFT0xEUEVxb0JvQmtQ?=
 =?utf-8?B?QU9LSjlhN3lHekZYdktQWFpuT2Z3SzJzWGRpdTRyOW1uQk5EeDlLd0h3a2Rn?=
 =?utf-8?B?c0phU2I0anJoVENHRVpGTUJsWG5HQ05FT3hFM3VMNmRoc1g0ZGhsQTh3Q2RX?=
 =?utf-8?B?enl4ekswYjA5SjVZeTNwVVlkTkxJVUZwaVVUenhIL08rMC90dUJXVzR2WDBC?=
 =?utf-8?B?RGVDaCtxWkZGUnl6cW5hUDRNbE9Wbzd3bTRIeTZrcGZ0SWNwclNuVVVSOGlY?=
 =?utf-8?B?elU1aElWTmFQdXpxRlc0OVpqMW9JcEVWVXRnVGwvUDF5K2FSU0llK241RllD?=
 =?utf-8?B?Y3VRVHJzU2xvSmprT0tFaTBGOFpNVlRkdGM1NS9GZThpSXNRVGFXbm9ERlY2?=
 =?utf-8?B?Wm1IK2I2dnl2a01mcUtXR2h4RHIrV09udktOeitaLzM2MGFqS3FEMVppUDJJ?=
 =?utf-8?B?VElkNnN3WWtkT2tMcjRKaXA4alpSWndwYXVCV256eGlUTElVS2NURjNEOVZy?=
 =?utf-8?B?eng1VmZoSWJRUWtHbTJEbzY3SnpXSkpBQ1lVTDNZb0lhRjZicHVEU1dBZFl5?=
 =?utf-8?B?SHBMSXU2T1o5NTlMWnppdEV4alZyZ0t5djNPaFYwdURKZTRPNzZhcDFNOWJD?=
 =?utf-8?B?TXFiWDV4Vm13U1NxS2krcmVVcmtCSHoydEM1WHlqL2xhaDF0ZXYwT2pVRTFv?=
 =?utf-8?B?ZGZiTmZxMVZNM2liN3ZqaVhoUHlpaWVNZ2ZYa0FzVGRrZ0I2QmI3czRmSkpy?=
 =?utf-8?B?YmpFNmYrZjBqejFmS3lLaGN5dXdGNTFZcUM3d0NXOHNxc0U0UTh2dlJTaS9V?=
 =?utf-8?B?U0UxOW0yTmQ3dTdIcUFlbVpPZHlvekRndm84MXF3ZUZ6eHlBa2c3Y0lLQWpC?=
 =?utf-8?B?Um83UEc5anlqcDVmQWZ2em5MeDd6Z0h4b0JEeXpDVTE4b21Xc0JhWE5iQW9s?=
 =?utf-8?B?TnZpNEljMlpRM3lkbHJ3V0RrYlMvRElCeGVjUmwwaEZyYUw5enVrY1p6YUJl?=
 =?utf-8?B?T2s2cUZ6cCtOOW9VL3lqbVNZM1hQZWJGU1ZVOWlzL0JiTmJucG9IdWdYTHRQ?=
 =?utf-8?B?b2t4TXJWVTRCUmt3TVNDWTFiakhwcW93MUZkTDdwWS96MHlHMkJ3ODNGV1ow?=
 =?utf-8?B?ZVg2Q0VyYzdjWTdTS0NnaS91MmdBOUxIT2dxZmg3NllQODZjWm43RlZmdlI5?=
 =?utf-8?B?K04rT2MxV29GMXlSeDRPcnNBQmtDRzNjTThCbXpRbmhxanhyUDhhc0hoRzNn?=
 =?utf-8?B?SUVVWmVObHFBMXRyd3N1SXZNWXpaNllWTllzRkFHY05TMW5Ub29lWjBjQ0dN?=
 =?utf-8?B?OENCMmI1RTlDN01OV1VJaExVby9HRXFmQXp4STFKbDU3YzNFMnJ1VWgwbGE4?=
 =?utf-8?Q?x3Oo=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(35042699022)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 11:23:48.2075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f9a027-d903-456c-8c9f-08de0fcb2398
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5691
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 11:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225113

SGksDQoNCj4gT24gMTUgT2N0IDIwMjUsIGF0IDEwOjU5LCBWYXJhdGhhcmFqYW4sIERlZXBlc2gg
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGRlZXBlc2gudmFyYXRoYXJhamFuPXdpbmRyaXZl
ci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IFVwZGF0ZWQgdGhlIFJ1c3Qg
YnVpbGQgdG8gZGVwZW5kIG9uIGxsdm0gaW5zdGVhZC4NCg0KQmVjYXVzZSBJIHdhcyBjdXJpb3Vz
LCBJIGxvb2tlZCBhdCB0aGUgYnVpbGQgc3RhdHMgYmVmb3JlIGFuZCBhZnRlciB0aGlzIHNlcmll
cyBiZWluZyBtZXJnZWQuIEhlcmUgYXJlIHRoZSBkaWZmcyBmb3IgY3B1dGltZSBhbmQgd2FsbHRp
bWUgd2hlbiBJIGJ1aWx0IGxsdm0tbmF0aXZlL3J1c3QtbGx2bS1uYXRpdmUgYW5kIHJ1c3QtbmF0
aXZlOg0KDQogIFBLRyAgICAgICAgICAgICAgICAgICAgICAgICAgIFRBU0sgICAgICAgICAgICAg
ICAgICAgQUJTRElGRiAgUkVMRElGRiAgQ1BVVElNRTEgLT4gQ1BVVElNRTINCi0gcnVzdC1sbHZt
LW5hdGl2ZSAgICAgICAgICAgICAgZG9fY29tcGlsZSAgICAgICAgICAgLTEyMjQxLjhzICAtMTAw
LjAlICAxMjI0MS44cyAtPiAwLjBzDQotIHJ1c3QtbGx2bS1uYXRpdmUgICAgICAgICAgICAgIGRv
X3VucGFjayAgICAgICAgICAgICAgIC0zMS40cyAgLTEwMC4wJSAgICAgMzEuNHMgLT4gMC4wcw0K
LSBydXN0LWxsdm0tbmF0aXZlICAgICAgICAgICAgICBkb19jb25maWd1cmUgICAgICAgICAgICAg
LTkuNHMgIC0xMDAuMCUgICAgICA5LjRzIC0+IDAuMHMNCi0gcnVzdC1sbHZtLW5hdGl2ZSAgICAg
ICAgICAgICAgZG9fcG9wdWxhdGVfc3lzcm9vdCAgICAgIC02LjJzICAtMTAwLjAlICAgICAgNi4y
cyAtPiAwLjBzDQorIGxsdm0tcHJvamVjdC1zb3VyY2UtMjEuMS4zICAgIGRvX3BhdGNoICAgICAg
ICAgICAgICAgICAgNS44cyAgICAraW5mJSAgICAgIDAuMHMgLT4gNS44cw0KICBydXN0LW5hdGl2
ZSAgICAgICAgICAgICAgICAgICBkb19wb3B1bGF0ZV9zeXNyb290ICAgICAgIDkuNXMgICszMjMu
MCUgICAgICAyLjlzIC0+IDEyLjVzDQorIGxsdm0tbmF0aXZlICAgICAgICAgICAgICAgICAgIGRv
X2NvbmZpZ3VyZSAgICAgICAgICAgICAxMi45cyAgICAraW5mJSAgICAgIDAuMHMgLT4gMTIuOXMN
CisgbGx2bS1uYXRpdmUgICAgICAgICAgICAgICAgICAgZG9fcG9wdWxhdGVfc3lzcm9vdCAgICAg
IDE4LjZzICAgICtpbmYlICAgICAgMC4wcyAtPiAxOC42cw0KKyBsbHZtLXByb2plY3Qtc291cmNl
LTIxLjEuMyAgICBkb191bnBhY2sgICAgICAgICAgICAgICAgMjAuMHMgICAgK2luZiUgICAgICAw
LjBzIC0+IDIwLjBzDQorIGxsdm0tdGJsZ2VuLW5hdGl2ZSAgICAgICAgICAgIGRvX2NvbmZpZ3Vy
ZSAgICAgICAgICAgICAyOS4wcyAgICAraW5mJSAgICAgIDAuMHMgLT4gMjkuMHMNCisgbGx2bS10
YmxnZW4tbmF0aXZlICAgICAgICAgICAgZG9fY29tcGlsZSAgICAgICAgICAgICAgNTkzLjFzICAg
ICtpbmYlICAgICAgMC4wcyAtPiA1OTMuMXMNCiAgcnVzdC1uYXRpdmUgICAgICAgICAgICAgICAg
ICAgZG9faW5zdGFsbCAgICAgICAgICAgICAxNzI0LjJzICAgKzI2LjElICAgNjYxMS4zcyAtPiA4
MzM1LjVzDQorIGxsdm0tbmF0aXZlICAgICAgICAgICAgICAgICAgIGRvX2NvbXBpbGUgICAgICAg
ICAgICAxMjA1MS42cyAgICAraW5mJSAgICAgIDAuMHMgLT4gMTIwNTEuNnMNCg0KICBQS0cgICAg
ICAgICAgICAgICAgICAgICAgICAgICBUQVNLICAgICAgICAgIEFCU0RJRkYgIFJFTERJRkYgIFdB
TExUSU1FMSAtPiBXQUxMVElNRTINCi0gcnVzdC1sbHZtLW5hdGl2ZSAgICAgICAgICAgICAgZG9f
Y29tcGlsZSAgICAtNDAxLjFzICAtMTAwLjAlICAgICA0MDEuMXMgLT4gMC4wcw0KLSBydXN0LWxs
dm0tbmF0aXZlICAgICAgICAgICAgICBkb191bnBhY2sgICAgICAtMjMuMHMgIC0xMDAuMCUgICAg
ICAyMy4wcyAtPiAwLjBzDQogIHJ1c3QtbmF0aXZlICAgICAgICAgICAgICAgICAgIGRvX3VucGFj
ayAgICAgIC0yMS4zcyAgIC00Mi41JSAgICAgIDUwLjNzIC0+IDI4LjlzDQotIHJ1c3QtbGx2bS1u
YXRpdmUgICAgICAgICAgICAgIGRvX2NvbmZpZ3VyZSAgICAtOS4wcyAgLTEwMC4wJSAgICAgICA5
LjBzIC0+IDAuMHMNCisgbGx2bS1wcm9qZWN0LXNvdXJjZS0yMS4xLjMgICAgZG9fdW5wYWNrICAg
ICAgICA3LjBzICAgICtpbmYlICAgICAgIDAuMHMgLT4gNy4wcw0KKyBsbHZtLW5hdGl2ZSAgICAg
ICAgICAgICAgICAgICBkb19jb25maWd1cmUgICAgMTIuM3MgICAgK2luZiUgICAgICAgMC4wcyAt
PiAxMi4zcw0KKyBsbHZtLXRibGdlbi1uYXRpdmUgICAgICAgICAgICBkb19jb25maWd1cmUgICAg
MjguNXMgICAgK2luZiUgICAgICAgMC4wcyAtPiAyOC41cw0KKyBsbHZtLXRibGdlbi1uYXRpdmUg
ICAgICAgICAgICBkb19jb21waWxlICAgICAgMzAuMXMgICAgK2luZiUgICAgICAgMC4wcyAtPiAz
MC4xcw0KICBydXN0LW5hdGl2ZSAgICAgICAgICAgICAgICAgICBkb19pbnN0YWxsICAgICAgMzMu
NHMgICAgKzYuMCUgICAgIDU1My40cyAtPiA1ODYuOHMNCisgbGx2bS1uYXRpdmUgICAgICAgICAg
ICAgICAgICAgZG9fY29tcGlsZSAgICAgMzc4LjBzICAgICtpbmYlICAgICAgIDAuMHMgLT4gMzc4
LjBzDQoNCkZvciBsbHZtIHZzIHJ1c3QtbGx2bSwgSeKAmXZlIGEgbG9jYWwgdHdlYWsgdG8gbm90
IGJ1aWxkIHNvbWUgb2YgdGhlIEdQVSBiYWNrZW5kcyAoYXMgdGhleSB0YWtlIGEgbG9uZyB0aW1l
KSBzbyBpdOKAmXMgYWN0dWFsbHkgY29tcGFyaW5nIGxpa2UtZm9yLWxpa2UsIGFuZCBpdOKAmXMg
Z29vZCB0byBzZWUgdGhhdCB0aGUgY29tcGlsZSB0aW1lIGlzIGNsb3NlLiAgSXTigJlzIHNsaWdo
dGx5IGZhc3RlciBpbiBsbHZtIGV2ZW4gdGhvdWdoIGl04oCZcyBidWlsZGluZyBtb3JlIGJhY2tl
bmRzLCBzbyBJ4oCZbSBnbGFkIG15IGJ1aWxkIHR3ZWFraW5nIHdhcyB1c2VmdWwuDQoNCkhvd2V2
ZXIsIHJ1c3QtbmF0aXZlIHRha2VzIDI2JSBtb3JlIGNwdSB0aW1lIChqdXN0IDYlIG1vcmUgd2Fs
bCB0aW1lLCBkdWUgdG8gcGFyYWxsZWxpc2F0aW9uKS4gIEnigJltIHdvbmRlcmluZyBpZiB0aGlz
IGlzIGZhbGxvdXQgZnJvbSB1c2luZyAtT3MgaW5zdGVhZCBvZiAtTzIsIG9yIHNvbWV0aGluZyBl
bHNlIGFib3V0IGhvdyB3ZeKAmXJlIGJ1aWxkaW5nIHJ1c3QtbGx2bSB2cyBsbHZtLiAgSW5zaWdo
dHMgd2VsY29tZSwgYnV0IEnigJlsbCBsaWtlbHkgZmlyZSBhIHRlc3QgYnVpbGQgd2l0aG91dCAt
T3MgdG8gc2VlIGhvdyB0aGF0IGltcGFjdHMgdGhlIG51bWJlcnMgbGF0ZXIuDQoNCkNoZWVycywN
ClJvc3M=

