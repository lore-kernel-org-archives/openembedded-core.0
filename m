Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E4BCED639
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 12:11:30 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11054.1763467878314651635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 04:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=n6Nnsl53;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=n6Nnsl53;
 spf=temperror, err=temporary DNS error (domain: arm.com, ip: 40.107.130.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=owqzaGco29b0O9tzkUyTRx0YbSuZ5mhNnVJC5x1picwI5dR6QXhDSBv83RbgFo0L0btbhWaFNy+DUF9Uj+JnFy5WJqV9OYy7muGzccFqGemQddWAQJlhuv/2QKZxKV10dPd5WTGZZe/jCXNxLs96xiTELzUCw8wlnec0PnSH9RvFl9IAjKdd1Otm5sAVwQ/2Auz0LvmmInIBrdh5cZ6STGTbl4oCQ5rnnlCpUwPpxN1BxQil7pjYR8qXCODFrUgbPkn+wlmemN33F8iBiIdVGoMCKsOXwtkhEzC0T9q4aI0w5iUr8iAW8exTZOrC8Q9fK3zpuDFaa0+Z12wU0hBOcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGw8vGE69J+0zOS0tI78qGrfOPWGz6u45/S4GCA7Y8U=;
 b=tFXYGOfOhfhTo5mbnURiyMWufC+gGaThhawOZEA2D765qMzcar3ABsFw5H/tkYP1MunKphomPp4AM0Qhr/g1LXPfZjGmEjYohhTZpvdfAYXRCwz7C1DI2/ASsytSWdALUn9rUf3Yg8jmQ1KDJg7stB3WO0AY9YDfc4hfNlVDmKCpGfM21w5MYGJlIfPNWPEEcK5rdCY9CKDsjzqputEO1T2eJSqz9G5qGMH7/uzu6pbWJ0Ve/vQz04CzvLMffIF12Z58ecy148LotyxZn7I5UBgD14t+BUv8FJRoaCG8gP1swk5kRMShDEcTitK10UgBGBgVyYHrEs+7AP0wG0pXQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGw8vGE69J+0zOS0tI78qGrfOPWGz6u45/S4GCA7Y8U=;
 b=n6Nnsl537DKaIxsAeoxicT8Y9d/0o80ig713bVh9/NpF7En3wowrJLPgKKZH+XJ2Qb9G5QNAq5PEzL+eM3Dg5MTD0Xnm2iMr50elFz9JdiB1Da7TsVyTGrDlZomFxLZbQQsGSai+iALFdCoOPXKjzM1m3E0FqUbhXx8TaMbcYwQ=
Received: from DU2PR04CA0345.eurprd04.prod.outlook.com (2603:10a6:10:2b4::16)
 by AS4PR08MB8219.eurprd08.prod.outlook.com (2603:10a6:20b:51e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 12:11:12 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::20) by DU2PR04CA0345.outlook.office365.com
 (2603:10a6:10:2b4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 12:11:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Tue, 18 Nov 2025 12:11:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/o5XjhmaKnK8oeVpXH0Xqf24sOzXdgxQttEKVC+Rli0NQ6B74qbptcWt2JhwuywxITb20CT9sX5r3dFL9BLxUIge8iweIkU53suCAFujvdrPmdiJEhyrtmkO4vFrbLUg3rVseU1mmRRLW4fXZ85Lz+L258DXsFMK58jGDhJKpCf8Tdd8hyshBV5WdFuNb2dDmCZE96it1eHD2p+d/EZut5tNAQjhLHDiiZrpISKmkK38PAk//TDCQMOwM+V3atFZI0RcLja9hfjRAmYgVa1YJMlXjL3ZuLEQoPk/0UaY+Jh3aJKNrO8acpV6YgrcI52wFGVX47B9Hxnpv4rqPnSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGw8vGE69J+0zOS0tI78qGrfOPWGz6u45/S4GCA7Y8U=;
 b=hITJ/wQMtFDNIl+5Grd2m+0Pdk74YA53j1Heo7g8MjJumTQY62Mwh7pbVlKR7A7PPH5n1nuBxaaeI41O6yZ3qsA1D4Q5UE3NCcEFfrI9V4KJ+6fUD3btRnByJtsgRBPC/K0NtP515BDBiqeElVyoqcEPS6AXRLDThIBT9W1G+sMx77e3/kiTSu6H3I53x58vty+IXSemskFsrr2NHrhFOfpaYwPuFvvjV6WXB8Uy+s5jJjnymz9IQccuYWbyTiDROAcvLk1rwbhPNxqm2avudZX3bUVgD9vHJf0Oz4ESRUFZDoirfKbrsvubCNx2GirPJUQTGVh9qNRFxcfK2thF6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGw8vGE69J+0zOS0tI78qGrfOPWGz6u45/S4GCA7Y8U=;
 b=n6Nnsl537DKaIxsAeoxicT8Y9d/0o80ig713bVh9/NpF7En3wowrJLPgKKZH+XJ2Qb9G5QNAq5PEzL+eM3Dg5MTD0Xnm2iMr50elFz9JdiB1Da7TsVyTGrDlZomFxLZbQQsGSai+iALFdCoOPXKjzM1m3E0FqUbhXx8TaMbcYwQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10889.eurprd08.prod.outlook.com (2603:10a6:150:1fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 12:10:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 12:10:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core] [PATCH] libcheck: add ptest support
Thread-Topic: [OE-core] [PATCH] libcheck: add ptest support
Thread-Index: AQHcVQflO7MOuL2EiUmJCh9RHx9JL7T4XpmA
Date: Tue, 18 Nov 2025 12:10:39 +0000
Message-ID: <3B3B7E23-74C0-4DA5-8320-65451871C09E@arm.com>
References: <20251114014145.23826-1-pratik.farkase@est.tech>
In-Reply-To: <20251114014145.23826-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10889:EE_|DU2PEPF00028D03:EE_|AS4PR08MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d9e1b8-90eb-4329-5828-08de269b9084
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?b0VlNng2MkxnK1dpc1YyV3pDS0s1RmFnbXV4enBwd2xtZmNZRkhVWmhFajZ2?=
 =?utf-8?B?T2pZeHRESFlPS0EzdDBIdk5YcDZqMFVnNVYwbVl2b2xmOEtlMDZUM2lqZ2Nm?=
 =?utf-8?B?cng3bUY4U0hWMHUzVG1Ed1V2eC9VOTBXSVR5Mk5yQkhwb3g3LzJIbHg4NHh5?=
 =?utf-8?B?NURCSmNmeS9DRUllUlhXRk44b0RCT1p1QkhBRzRHNjdTby9DUVdlajNXWUdJ?=
 =?utf-8?B?K0hTSWljK0xxT3hoZ1l1NEQ5OHZmNmdtTVBaYkg1VEcvK0RHRHhCdGNvWFFh?=
 =?utf-8?B?YkFZbnpGUFNVSHlmS3p3WlhrbW5hZlB3dDJuOFpReHFIT3dVZXFJVWcwTUlw?=
 =?utf-8?B?V0NuNlZGR2hMenlXQ0xQUnkyeFZ6UVRUTm0weTRLVWp2UWVIU2ZMUnVrcTV0?=
 =?utf-8?B?WlJCMERyYXVyRkF0QWxSZXVoYktWQlp4ZmxBWHVKUWxvRDNHejJzdWZoZjA0?=
 =?utf-8?B?S2xYeDQzT2RJMkZMU3V6cXF4L1U1TTRQQWpwRGMxUGhGLzU0ejdKTGtxWlJC?=
 =?utf-8?B?Z2NQUjd1Qk9SR1ZZWjQzTytzbjlyL3NyYzEvVDgyKzJZWmkrYStlbzk1Z2dj?=
 =?utf-8?B?eFQ2K3UyMDNDb2hFRS9PQTZLcmtEdUhKcDBKYzVhWXRkNk91N3Rsekl0SEZr?=
 =?utf-8?B?aWpLMXJEdUFFZzFGa3pTRy95cFNsVURFU2t0YVdIRjN6azIyV09aOUkxbDFk?=
 =?utf-8?B?UGI4aG5HbGdYRVNvYmFzb1hvSStCVEgvK3diRHl0UGZSdW1qNzNnbGFkQ1di?=
 =?utf-8?B?S0NTa0xIK0dncldiTExjZlRUWGZaLzNtVmZRQ3lSZVVZSEl3M2s1anY4b2ln?=
 =?utf-8?B?MGpRSzI0MDUyS1NBbHBxeFF3M0dDaGsra2lFR0lUZWNSc05RcXJVdEZMdFlx?=
 =?utf-8?B?dFFLZDQyYkRseit2MFR4aDFibXk2VkNjSkJ5TDh6aG5rTHhLN0RyaG1FRHpM?=
 =?utf-8?B?eWh4TTBHdlpKejR1Wnc4N0l4Z0RvdkFvTTlLaGJUV0ZvcU1XVC9iK0lQY3dV?=
 =?utf-8?B?UCtQamg5bnRvMjV4czFmRXhpeGFTWER1WnkwVUdTMFhRY3dsd05xMkFWSXM3?=
 =?utf-8?B?clpQY2w4THptQUdzcnN4Zmkvdy9OL1Y5UEdaTC9qdGZzMXJvUTFrdG1XQ2Nq?=
 =?utf-8?B?aTk3MEpsT1NBQjN0QVVBZGdBS2daakt2MkJORFlZRUpYc2REUGZaM3dobDRs?=
 =?utf-8?B?RHV1NTUxdUUvWmFVWE9RS25LQytUd0tueFYwMXYvdjBWUk10OUF1TWRsZTUw?=
 =?utf-8?B?NnhXMG5zVGRONExDcE1WMUM2K2NwWUc3NWxEajg0Y2ZuSXRpRHZUaU4xcnA5?=
 =?utf-8?B?dmxoMkFWNCswUDZHOFJiQ1JhRjhjeElxSFFaSXQ1d3g0UDRIRjhoaXFqdjFw?=
 =?utf-8?B?SGpYbmJ4YWJ1clFQSnBhekpUOWM0d2RwR3dPaEZRaE12ajZNZkxvdGVpOFZv?=
 =?utf-8?B?Tm5rT1I1Ny9FanJjZHhMakpaYkVHTm4xTklzWDZ4WGNkS280ZlQ3bHR0WUtD?=
 =?utf-8?B?alZqaHNiMFN6aVg1L3dYNkdMdmdmbzBxNmovQUVtRDBJMEZmYUQxZU9kL2tE?=
 =?utf-8?B?V3hXUm51eUwxR1hCTGZuRjFNT0RSZnZIdWdwekJtQWdvWkdoRCt5NC9qMVh4?=
 =?utf-8?B?MG9lSWM1SWV2UDdQY3czUmhkNm9iak9ZQzNkL1V5WisxQlgrMGJ5cURUWDJS?=
 =?utf-8?B?SitjVXhoY1cvTkZXNUFnaUZ1c25Wd09ZNCt2OTdIdVZHMzNSdEROL1lsdHpG?=
 =?utf-8?B?KzdFL2F2T2E0NlFpeVVCWjd0bHM5bE5YdU5wT3ZTTXhhRDE5Z3IzYVFyNk5j?=
 =?utf-8?B?cHpLRnp5d1cycjRhYytBSmdvaWVvRlVCRjJRcGtVRERzN1BxeGwxV2tvRTAv?=
 =?utf-8?B?K3lhWUtvZDF2bmtvQkJxRnNHQVA2KzljRUxrWHFqaEJqTDNvRWN2NDB2NmZM?=
 =?utf-8?B?Si9LR1lac2wwL2RFSVRvdmpCbHN1alp6VlJiSWdhYVhRUlpDUUR6SVpTSC9T?=
 =?utf-8?B?SW96UTRZZ2tzeFpEcGU1RXhOdjVSMEVhbmZibGRxNUV0MGRHSWdpeTUyQTdZ?=
 =?utf-8?Q?81I+Sq?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7266A747B07A6A498B3083B36E3475AB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10889
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	95df4f0d-b6b7-4ad8-4c20-08de269b7d33
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|14060799003|35042699022|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RGtnbHNHelV1NlVZdzFDRWVmRmJhK1lEMWxaMnEvWW5vZ3IyYjJ6Y3NabjIy?=
 =?utf-8?B?U0ZRK241bm5TQlpZMzZGbDJHTUJ2M21KeFFFVEdTNUw3cU1ZeVZEYVhxUmE4?=
 =?utf-8?B?dTlXeEo0WDRxL05OdkMxVWdPYUJQdUhrL3FNZWo5a0lpdmh5Ly9NWkpJTzE2?=
 =?utf-8?B?NUlkR3JzWVk5VElTaXdmdGE2NjJ3cXRnNHh1azBOL2doOVYzVG5WTzY1QXpj?=
 =?utf-8?B?bDJsODVoUURwc3pSNzhFMHJBOWlMMnppUW42eTUrOVU3dndqbEtEYlNMeER0?=
 =?utf-8?B?cG5jaTBXRGc2UUZJMEEwYTIxYU5HTkFqNm03eENHSWZQb01PWFNsMVhoZ1M2?=
 =?utf-8?B?R0NiRHZnaWFHeVZGOURnejJhcW14MUhicTk2K1p4aDYzbjRQd1gzdHVYQWgw?=
 =?utf-8?B?NG9Ba1U0ZExFbncvTFIrRkNvZHVwamdZOUVkSy9xZjRvRDhaYndKTUdmc2J6?=
 =?utf-8?B?bFp4MzlwNVhjbjk3ZmUxazRsaGpkNGxVZWlIVEVJd094VWdGMDBHNXJkdk94?=
 =?utf-8?B?Z3F3S0V4Y0I3QzNHc1JHdkhJblNnTDNZNHR2dGw4cXQvUngxVXBqQzdZMmJa?=
 =?utf-8?B?TjNDaXFyTUNnN1BrVTY3N0xjelE3NXBPZEljdHBrc0lqTWpDS2gwcGk3dXI0?=
 =?utf-8?B?N0gyalpjaTI1MCtYaEJUYUlqSFVzYUg1TERodXV3dXk2MGtCU1NqVzZtTHh0?=
 =?utf-8?B?MVQ0ZjY2MFhFTWhEaGlxK0Z6OGpaMXFwWFIxNUhHK0Q2RGZFK1lLNHJqMlNR?=
 =?utf-8?B?N3VOTHdydVRCVW55NFlHWGZvKy9HWDMrcE9RdDJpQWFjUTNTd21LVGc1cy9p?=
 =?utf-8?B?UTJqbW9naVRndnhQVWZZaVpGWkFpN09FR29XaFpuMDlQdHVMajJJUFhaM3Vr?=
 =?utf-8?B?cDM3SjZVMlo3NlhZUi94MUdwdG1oUndBQks0U0x2cjJPS0s5R2pPdWF0T2ZZ?=
 =?utf-8?B?OHUyZlBlN3JuRklERzNHWmk3b29LOUpGbk1IVU9TVm9YeG1rMTJsREhrUDAr?=
 =?utf-8?B?S3dzVW9UWEhTVDBXRHA3UlJ0cERlcjN2bkU0MGhMYXhOM1BEblI5WVBQc29C?=
 =?utf-8?B?eUxNejZ6VHFMejN0cFFzaGE0eVEvN3FQSjhQVDJqRW9HcjhpUnRna0UrNlgz?=
 =?utf-8?B?eUtENFRnOHN1YnZQSk9uWVhmc0kyVWs5OWlCdHJsVmZ0UVhYZmltNFJYQ0Vj?=
 =?utf-8?B?STVIQXNkRGlPTHpVWVZyVlRFZjFuTDlTMUtFSExYckFtNGpBSHY5ZW84Ym00?=
 =?utf-8?B?a1NnOXY4b0xadzYveEZzM3ZDaHdicGtkN3BIRnUzczJxdGtrQ3NQVUo3YWlP?=
 =?utf-8?B?akxUTG5scFRxanMwVmNoTUhzcWxaK2lmcS82S3oyR05tbmNlVCtIYUo3dEtX?=
 =?utf-8?B?d2tuUVdKNEdnVnROa1JMRzBJb3JBenlldHh0Ujk2cGJZNDN4OG0yVEdpWURI?=
 =?utf-8?B?WmR2WTN1N2l5RDBDM1Q3Z1FJVEpMdGIyZnFUVUhOWm9vcG5FY3FId3ZkdW9p?=
 =?utf-8?B?NWI2RVNZZ1NEYkI2L0JkblhENmR2c3dTZDVabzhFS1hPd1NzMWNaaHNxYm5Q?=
 =?utf-8?B?b2tKZlFKWk1zV3Q1QjAybXZSTXk3ZmVRSTBaR01Vejlkc3Q0NFNRV09sM0Rw?=
 =?utf-8?B?UFRjQ0oxNnhVYU1hQ3BSZlNwMi9YT2lTcklHV2Q0eTg2ZUpTMzc5aDdCSnFL?=
 =?utf-8?B?TFlGeDYwOGZIcUI2bVcxV0RqOHAzWFdNU1MxWHErUVpQOFV4ZFJlQ2x2bThX?=
 =?utf-8?B?aWR6eGZFaFpjU212OXZ3ODU0b0ROL1NXUS9DVlltNnJHSGkzclBFbWFIMDNH?=
 =?utf-8?B?VytoQVdESXVtcC9ueTh5QUlUOFBoZFBqTWF2Nkw3amN3OE50R2JEcnd1elJw?=
 =?utf-8?B?N2x6K1RvWUhKdWxIRno0RFF4UGVBZUF6V25XU2dHaUhjTUxMYVVnb3lxQkpm?=
 =?utf-8?B?dWZMUHkwcEtKaDJWY0hBQXJCQmt5N1grN0pZUFAxZ25wWmRlMGwzak1kKzFa?=
 =?utf-8?B?RmRVSnRQT014V0o2VTFHajhxcHZMSnNZdXZWSUtxV1BHZ1piWC9RSTk4Rml3?=
 =?utf-8?B?Ryt4MUVabnFLYlhjMmxuaExlN3hYenhPWEZUUUlGK2d5cnh5aDF6V0tYVW5X?=
 =?utf-8?Q?ZVaM=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(14060799003)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 12:11:11.8494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d9e1b8-90eb-4329-5828-08de269b9084
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8219
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226522

SGkgUHJhdGlrLA0KDQpUaGFua3MgZm9yIGFkZGluZyBhIG5ldyB0ZXN0IGNhc2UuICBTb21lIGNv
bW1lbnRzOg0KDQo+IE9uIDE0IE5vdiAyMDI1LCBhdCAwMTo0MSwgUHJhdGlrIEZhcmthc2Ugdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHByYXRpay5mYXJrYXNlPWVzdC50ZWNoQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiArZm9yIHRlc3QgaW4gY2hlY2tfY2hlY2tfZXhwb3J0
IGNoZWNrX2NoZWNrOyBkbw0KPiArICAgIGlmIFsgLXggLi8kdGVzdCBdOyB0aGVuDQo+ICsgICAg
ICAgIC4vJHRlc3QgPiAvZGV2L251bGwgMj4mMQ0KPiArICAgICAgICBpZiBbICQ/IC1lcSAwIF07
IHRoZW4NCj4gKyAgICAgICAgICAgIGVjaG8gIlBBU1M6ICR0ZXN0Ig0KPiArICAgICAgICBlbHNl
DQo+ICsgICAgICAgICAgICBlY2hvICJGQUlMOiAkdGVzdCINCj4gKyAgICAgICAgZmkNCj4gKyAg
ICBlbHNlDQo+ICsgICAgICAgIGVjaG8gIlNLSVA6ICR0ZXN0Ig0KPiArICAgIGZpDQo+ICtkb25l
DQo+ICsNCj4gK2ZvciB0ZXN0IGluIHRlc3Rfb3V0cHV0LnNoIHRlc3RfY2hlY2tfbm9mb3JrLnNo
IHRlc3RfY2hlY2tfbm9mb3JrX3RlYXJkb3duLnNoIFwNCj4gKyAgICAgICAgICAgIHRlc3RfeG1s
X291dHB1dC5zaCB0ZXN0X2xvZ19vdXRwdXQuc2ggdGVzdF9zZXRfbWF4X21zZ19zaXplLnNoIFwN
Cj4gKyAgICAgICAgICAgIHRlc3RfdGFwX291dHB1dC5zaDsgZG8NCj4gKyAgICBpZiBbIC14IC4v
JHRlc3QgXTsgdGhlbg0KPiArICAgICAgICAuLyR0ZXN0ID4gL2Rldi9udWxsIDI+JjENCj4gKyAg
ICAgICAgaWYgWyAkPyAtZXEgMCBdOyB0aGVuDQo+ICsgICAgICAgICAgICBlY2hvICJQQVNTOiAk
dGVzdCINCj4gKyAgICAgICAgZWxzZQ0KPiArICAgICAgICAgICAgZWNobyAiRkFJTDogJHRlc3Qi
DQo+ICsgICAgICAgIGZpDQo+ICsgICAgZWxzZQ0KPiArICAgICAgICBlY2hvICJTS0lQOiAkdGVz
dCINCj4gKyAgICBmaQ0KPiArZG9uZQ0KDQpUaGlzIGxvb2tzIGxpa2UgdGhlIHNhbWUgbG9vcCwg
dHdpY2UuIFdoeSBub3QgbWVyZ2UgdGhlbT8NCg0KPiArICAgIGZvciBiaW5hcnkgaW4gJHtCfS90
ZXN0cy8qOyBkbw0KPiArICAgICAgICBpZiBbIC1mICIkYmluYXJ5IiBdICYmIFsgLXggIiRiaW5h
cnkiIF07IHRoZW4NCj4gKyAgICAgICAgICAgIGNhc2UgIiRiaW5hcnkiIGluDQo+ICsgICAgICAg
ICAgICAgICAgKi5zaCkgOzsNCj4gKyAgICAgICAgICAgICAgICAqKSBpbnN0YWxsIC1tIDA3NTUg
IiRiaW5hcnkiICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLyB8fCB0cnVlIDs7DQoNCkRvbuKAmXQg
fHx0cnVlLCBpZiBpdCBmYWlscyB3ZSB3YW50IHRoaXMgdG8gZmFpbC4NCg0KQWxzbyBjb25zaWRl
cmluZyB0aGUgbGlzdHMgb2YgdGVzdHMgaXMgaGFyZGNvZGVkIGluIHJ1bi1wdGVzdCBfYW5kXyB1
cHN0cmVhbSBoYXNu4oCZdCBiZWVuIGNoYW5nZWQgaW4gZm91ciB5ZWFycywgaXQgbWlnaHQgYmUg
ZWFzaWVyIHRvIGp1c3QgaGFyZGNvZGUgdGhlIGxpc3Qgb2YgYmluYXJpZXMgdGhhdCB3ZSBpbnN0
YWxsIGluc3RlYWQgb2YgcGxheWluZyBnYW1lcyB0cnlpbmcgdG8gaWRlbnRpZnkgdGhlIHJpZ2h0
IG91dHB1dC4NCg0KPiArICAgICAgICAgICAgZXNhYw0KPiArICAgICAgICBmaQ0KPiArICAgIGRv
bmUNCj4gKw0KPiArICAgIGZvciBzY3JpcHQgaW4gdGVzdF9vdXRwdXQuc2ggdGVzdF9jaGVja19u
b2Zvcmsuc2ggdGVzdF9jaGVja19ub2ZvcmtfdGVhcmRvd24uc2ggXA0KPiArICAgICAgICAgICAg
ICAgICAgdGVzdF94bWxfb3V0cHV0LnNoIHRlc3RfbG9nX291dHB1dC5zaCB0ZXN0X3NldF9tYXhf
bXNnX3NpemUuc2ggXA0KPiArICAgICAgICAgICAgICAgICAgdGVzdF90YXBfb3V0cHV0LnNoOyBk
bw0KPiArICAgICAgICBpbnN0YWxsIC1tIDA3NTUgJHtTfS90ZXN0cy8kc2NyaXB0ICR7RH0ke1BU
RVNUX1BBVEh9L3Rlc3RzLw0KPiArICAgIGRvbmUNCg0KVGhpcyBpcyBqdXN0IHRlc3QvKi5zaCwg
cmlnaHQ/DQoNCj4gKyAgICBpbnN0YWxsIC1tIDA3NTUgJHtTfS90ZXN0cy90ZXN0X291dHB1dF9z
dHJpbmdzICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLw0KPiArDQo+ICsgICAgaWYgWyAtZiAke0J9
L3Rlc3RzL3Rlc3RfdmFycyBdOyB0aGVuDQo+ICsgICAgICAgIGluc3RhbGwgLW0gMDY0NCAke0J9
L3Rlc3RzL3Rlc3RfdmFycyAke0R9JHtQVEVTVF9QQVRIfS90ZXN0cy8NCj4gKyAgICAgICAgc2Vk
IC1pIFwNCj4gKyAgICAgICAgICAgIC1lICdzfGlmIFxbIHgiW14iXSoiICE9IHgiXC4iIFxdO3xp
ZiBcWyB4Ii91c3Ivc3JjL2RlYnVnL2xpYmNoZWNrLzAuMTUuMi90ZXN0cyIgIT0geCIuIiBcXTt8
ZycgXA0KPiArICAgICAgICAgICAgLWUgJ3N8U1JDRElSPSJbXiJdKiJ8U1JDRElSPSIvdXNyL3Ny
Yy9kZWJ1Zy9saWJjaGVjay8wLjE1LjIvdGVzdHMvInxnJyBcDQo+ICsgICAgICAgICAgICAke0R9
JHtQVEVTVF9QQVRIfS90ZXN0cy90ZXN0X3ZhcnMNCg0KSGFyZC1jb2RlZCBwYXRocyB0aGF0IHdp
bGwgYnJlYWsgb24gdXBncmFkZS4gICR7VEFSR0VUX0RCR1NSQ19ESVJ9IGlzIHRoZSB2YXJpYWJs
ZSB5b3Ugd2FudC4NCg0KPiArUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gImJhc2ggbGliY2hlY2si
DQoNCllvdSBjYW4gcmVtb3ZlIHRoaXM6IEkgZG9u4oCZdCBzZWUgYW55IHNjcmlwdHMgdGhhdCB1
c2UgYmFzaCwgYW5kIHRoZSBkZXBlbmRlbmN5IG9uIGxpYmNoZWNrIHdpbGwgYmUgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkuDQoNClRoYW5rcywNClJvc3M=

