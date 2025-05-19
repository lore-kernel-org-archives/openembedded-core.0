Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1309EC3DA6D
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 10:47:43 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.49])
 by mx.groups.io with SMTP id smtpd.web10.48365.1747651656395636686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 03:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TNFx4LCf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TNFx4LCf;
 spf=pass (domain: arm.com, ip: 40.107.247.49, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BKkdU0vpX7C509hFzaSdw2znplSMnAbgxh8I2FxygWXyIpKPF1+uMvcnYeQPaCtCYz8OiCCMOsblj/KINaWXA7VfMLQ/WES3nI5e9f0+WueB4PI/giV0h+fd7bGbMm4KEUj/56flREJECUnEDLZvIF0YLkitiHsXX/Pm645tkRROB/GpJhN4Q0zSfApYqxcybP9NsSWAoSv7tcmG37qA1Le/q5tJHrOLwgfvjVvhtejXauIL4hFm8PbqA6ZsMhkpOkCF8L74ky4RKIBPFs+REMdZ5/Zeplg1n7VlqJY1uIf6/Q9srFJCD9Ssm4T6MUiGB9ujebg4tWKRVRVxQ5U/ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YtXWKEbHd49ty69s6q03q/Puc28XsRJodux5xT0Z/w=;
 b=Pnn2uSaCjfWRq1hwzfUlLJ74bFYeW7AyxrCZgpn78sSjc/lLnCMzvlQVDtci9fwG1IkraMR4cBq+1GRnxiQxXP8IwYWu0X5c+vXT3kDgUgP4230AXtJfvCqDR+p2WAWALlYi2bz82SqjLoWVLo8jGcohzQCk6ILVkge2OIjhSV5+wi6Q2AUV+F9nzbaCxjqLHmRR8XLf5qsNfSGCn9+6eA80JWmbQAj38fAv0LiLKPKVI5IuUFW3REuAwL8xPEjYeWeAZM+OnDfX9JFOaPRA0k9FnYfpofGU71cFq/T5V6tewTTLsDG3zfLxPY4tOqkRKXb53sZ3wePez2hqPtbVig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YtXWKEbHd49ty69s6q03q/Puc28XsRJodux5xT0Z/w=;
 b=TNFx4LCfNDbHXrToM3XQKJbrQD6+uL+bUtB9QrgJavtOGjlWC9W9IoD6qMmE69NIL8kFTxR1Gs0DkY2HS0nU6Sces7RpEkqWorMugzIQa3BvDEyP48FaUOSiJ5mm3XEBiJ4UPt/UCM5YiQzko5m+/n0DZ50jbvy9uaqN9NnGUqo=
Received: from DB8PR03CA0001.eurprd03.prod.outlook.com (2603:10a6:10:be::14)
 by GV1PR08MB10719.eurprd08.prod.outlook.com (2603:10a6:150:16f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 10:47:33 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::76) by DB8PR03CA0001.outlook.office365.com
 (2603:10a6:10:be::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Mon,
 19 May 2025 10:47:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via
 Frontend Transport; Mon, 19 May 2025 10:47:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJCQCe2NAHdFLUNFNAFjpjtukePqIoZnq/gZCPLsI4iJ5xm1PIItb/pMLJjVuIhk3KnAErZ5F1sIO1+2COdKSknGfSc8za2t+ork+O55j97waN1hJxHqGMp80FlbiCm3SBROvz9Kj7kkuWUdEQQcVYdKDDoDR01hSOTHVqdHEd556dBHLKx0GQ4lNyWOMTvwtILR7ZkQ1tx0VXg4I6gmmKfxTgngmIUXuVNe9BlFOQJNFN/nb8ecCUDAlO1sY1EPVaO+nHvI//5d8zeEOTPk6F6wzpgUQFYzpwdhmnwYpbgjTZE/PWblOwW+ghF/b/evcxCiUCgTegjYoVW1Y+oplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YtXWKEbHd49ty69s6q03q/Puc28XsRJodux5xT0Z/w=;
 b=gXikx0JhdPrawje0zpvddITeZnKMFiesW6oM5tnUoURoyro31OVMzg7ALAryl3TsuuPui11FKVfTeBh0lcOAIVyFbLD17JSddEclPEX7WAEnMXfx+HgScHja6xb/HjyhWB+zxVQ/Bp8Jzjtw0j2ZDEXRsxBmc/OCELZFJ539CXV1dAKo2yt+05ozmgCBc1CGNcGbzOOuLGHFPCFg+ee9A62vJdNvNwoTB0xR5gbCodS3nBYnAyX/QKso8JUV+cHXv4xCM8iH1o2SNouAhnUeEpo8q54bGk14PsPumO0lvhlSZwa7pVqnzXdg6oHQWIQNn7CEl5CPB31bxKNOfc+rGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YtXWKEbHd49ty69s6q03q/Puc28XsRJodux5xT0Z/w=;
 b=TNFx4LCfNDbHXrToM3XQKJbrQD6+uL+bUtB9QrgJavtOGjlWC9W9IoD6qMmE69NIL8kFTxR1Gs0DkY2HS0nU6Sces7RpEkqWorMugzIQa3BvDEyP48FaUOSiJ5mm3XEBiJ4UPt/UCM5YiQzko5m+/n0DZ50jbvy9uaqN9NnGUqo=
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DBAPR08MB5830.eurprd08.prod.outlook.com (2603:10a6:10:1a7::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Mon, 19 May 2025 10:46:58 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 10:46:58 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] clang: Include the libclang python bindings
 in the build
Thread-Topic: [OE-core] [PATCH v2] clang: Include the libclang python bindings
 in the build
Thread-Index: AQHbyKrpLliTAI7pWUiUNbu/zueZerPZxTYA
Date: Mon, 19 May 2025 10:46:58 +0000
Message-ID: <6B5460E8-CF3E-44F0-B5B0-2532F7676BD3@arm.com>
References: <20250519083344.1646432-1-luca.fancellu@arm.com>
 <db0c30b2-7a27-4a62-b445-e13485a5585e@cherry.de>
In-Reply-To: <db0c30b2-7a27-4a62-b445-e13485a5585e@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DB7PR08MB2987:EE_|DBAPR08MB5830:EE_|DU6PEPF0000A7DD:EE_|GV1PR08MB10719:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2edf32-ae45-4bdb-8bba-08dd96c28f36
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aFdoOFhuMWpXNld6ek5YTFJiUWFlaGYyT3N2WGltMmo0aG9pVG1KZHFlamt3?=
 =?utf-8?B?bjRRQndZMlVySzB1REl2NFJvNHY0TityQXhUSzJ3ZHgwbHg5L3h1dklubERT?=
 =?utf-8?B?ZFRJZEpXMVArTncrSldoSkh1cW9XN1EyYUlPbUFCck4yNjcvZmcyT3hrR2Fq?=
 =?utf-8?B?NE9RWUpKc2RoUTdXWnVndmNERFJzeG5XR0lIbXQ2d3pQejVabjdhNkxhWVJL?=
 =?utf-8?B?eVY0cFB0dzlXWXBLc2hxNnFoNXpTdVhXOWJ2QUxlMk1SSk1WNmZBTUlKQldv?=
 =?utf-8?B?YXpyV2lRLzV4eFJuK3duNVhPSFd0U0djTTVObHM1NUFQcWVjQTM2VVU4S3Y3?=
 =?utf-8?B?YjY3eUhOVUR3SGhQVFRseUFYS2tmSUFUdi9MZzR6akVpbFVlOEV4VFY2OUVk?=
 =?utf-8?B?bjJ2UVdQQWRBUnpZQXh2TzF2cDM1TDNKL0pseVhqcE9UMXBGOVdFM01yTUc0?=
 =?utf-8?B?MUNXcWRHdkNaelJ5WDJsVDVBT0IxUXlTZ2puREZjbWRUYVFsWlRhZFFwTlFh?=
 =?utf-8?B?bHZCWkJucTFhbGtPVkNWelZyVzloWStvcFNUU1ZGSXlyMXJSUVdWVmU2dEc1?=
 =?utf-8?B?WHF6MG9VeWU1b2tVSXVhbmF2SXFvdmsyKzJ0V1NkNjM0Q1hTc1ArWDh4eHlo?=
 =?utf-8?B?alpGT3hVUzduRXFQRHVFU1d1Z0dSZWp0ZERKUW5xaW1sbTF6ZFJ4WkJUU05r?=
 =?utf-8?B?dHhJdFZZWFBEOStVaXppZGpYL3ovNEJubW9vR1dyaGhrQStpcWduN3BwMzh6?=
 =?utf-8?B?TG1EYy9zQmZnOW96VkpHVUFCc2ZhR0JOVlNlNnZpOFhXdWV0SGZTeHlpdVJz?=
 =?utf-8?B?RUpoMHFlRnpVY3REeW55NVljZFkzVzFWM09Fck1pZWxtL3pLdUFKdVIxRnpU?=
 =?utf-8?B?c0xnWllSUytWOWlROXRyelFoUmJOakVhb084YVR0ZCt2TkhRcENYNWo3SFZh?=
 =?utf-8?B?V2RCNWZzaHpxb3VmaTArLy9SeGpFRmxpMkRLNVQ2cEVqeXhQZE9VK01ZVnlx?=
 =?utf-8?B?T3lFRVB3U3dReDlZQ0xQVVJReG4vTVFMaXhDK001aG16Uk82R28yZHlIZmQv?=
 =?utf-8?B?T1BkVlRsTUdlbGdObzdKUk1PV2tiNHNITGNoTjJxZFpTSkxDQkdlclVvbjl1?=
 =?utf-8?B?Ui9tbnJ2NGdrSFVpVmtiVFpOaGhkd29UTnFxQnA1bUZOVHlIMEVta2FYNy82?=
 =?utf-8?B?S0c4ZXBjZVdtaitCd2YzMWZjdW8xOXdyV2ZzNnBFNFdmbVdyWTNHLytwRjl0?=
 =?utf-8?B?YnN3ZmwyRWRJb09LQ09jQk4yYThrbXpIOXBWbGJmcGNBd0NHdE1VTU1ST1pi?=
 =?utf-8?B?Zjl3Q0F5TGlKemo4aS9xY2pYSnMvVnRIc2hnZ01kcVA4akFwb1BXNFlpckJh?=
 =?utf-8?B?MjQ4RWZGei81dDNIcWhkM0hWN3IzVjNzL0x5cmg3R1l0TytvVm0zVDlnR2Ez?=
 =?utf-8?B?Y0lsaXMza1JDTmpKNWVac0s0UmZENThtWFF3cHdHa3BXNWZzMkNraWVHSit3?=
 =?utf-8?B?Q0hYdFV3MVNGV1gxd3BWQ05lRnFSK0l2VkFZZU1qamZ0OUwxcXlYMVFoWHJa?=
 =?utf-8?B?RGZCdWZGak1WSGhQVUVNeE82dmJ3TVRneXdnNnRUdWxhdEZnMElKbUFDdW44?=
 =?utf-8?B?N2w1RUszTDVGbWN4SnVCamdaUmt6NHcvLzNIekZ2bjZjYmxkQ2QvNDRoQkRZ?=
 =?utf-8?B?ak5peFJHd2tWTXJCMzFseEhWcmx1cjVNdUdSVzFMVnF4MjhXT3M0ZHU0S1hq?=
 =?utf-8?B?OHYzZTU4bVlOR2FmdFp2M0JLNHFkUEJyOVcxSGVpN3NEZzV4MHJZNWtTNW5J?=
 =?utf-8?B?WFlIWVlDbWVuSHdSNTllRDdUdkhUclM2RlZ2d29weWpHbFJ4d0kvYWtUU0xE?=
 =?utf-8?B?cEVNV0VUL2JHV3NCQVFMZDZNemQ5VTdYMzFpUEVnUnB4MDVQN1QrTThLRi9G?=
 =?utf-8?B?K3ZaaWlRZ1M1NXRIMzBOeHFlU0lvY3dlKzdJOW1BYno0c1JzVHkxQUZjMmtN?=
 =?utf-8?B?WCtpQTJmaW1BPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA68089A03FB0B409072798F46E6002B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5830
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	65f0da92-dd92-46da-cc78-08dd96c27aed
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|376014|1800799024|36860700013|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QmpRQnVRKzlWWXZBZDVtNWxlTG9ubkJNcEx2WXZ3eGtzSXd3Y1FDTkUrcXVY?=
 =?utf-8?B?Z2w1Mm8wdmtPMXA3MExHd2o3cnBSclZ1TEtuanh0T0s5OHlqV3I4cERwMHVE?=
 =?utf-8?B?YXBZWEtQQzIrK3paTjlEcnlZeTJ1MW1TOGZ3akpHeHZMd1hmSVRPcG9LRzg3?=
 =?utf-8?B?Y3o2Zy9mMWpkWlUzeDBWMlRCVFhEUnpLdzJFVlg0SytaWCtnU3JGNWNGS0ZY?=
 =?utf-8?B?djFtMzJmRjVGRjVnTXlTUk1SaWpQY1hIcEZ0TW9XaWhGUndFSlBDeE5aNFNs?=
 =?utf-8?B?KzNhOU9Ob3d2MVRzQ3lvZ1RSeTA5WTJpUXBOQ3dOUjZ4SUMvdTBGWjduVk5o?=
 =?utf-8?B?MGRMUE9icGZmVmRQK003UVFWODNzWFo4dHlHMjdkOXFSVHIrUjlIbTB1QWhv?=
 =?utf-8?B?RUMxTXVoZWdZenkvVWJwY1FhejFLaTZoOWVwYnRsenZ6aWRUM2VBTWtLTmY1?=
 =?utf-8?B?NHltU3RSZjZPM2ljd21jUzdpbzdnaFJGa1dmMFdpWmh5OCt6RWsvbzNGQjNw?=
 =?utf-8?B?L0ZpSys1VVBEc1MyVHdReXg5dTcxRzVZbUxXelM2d2dSWlRhTkorNHJCQ2Ns?=
 =?utf-8?B?VUdZcE1QekRZaStlYk1ob0tSV0J6emViVVhWTUE1akU3dlBqMGk2QWpVNWh0?=
 =?utf-8?B?elU2QTlvOWptTllZWXBMTlREZWgzaUVqTThZczN0WGUzWXI4UTRVKy9FdlhP?=
 =?utf-8?B?ZElHaEo0R2drS3NKcnMyd0M4b1dTK1pBK0hHbmJ6UkFJVm1CUVJtL21qUi9H?=
 =?utf-8?B?dEpwL3hKZFlSNWVGNGVLZUFxZEdWQkpvV21DTDgxb2N5Sm14UXlxL3NzSU8x?=
 =?utf-8?B?MmxlSys3elAzWmhIbnpzT1o0UXk0N1pia1ROeHM2QVJxc3dDKzVpaGhOVG5w?=
 =?utf-8?B?Rmh5OCtYRElUb3BCY3p4ZlBmbTdxT3B4c2E1VW42MktVL3RPZUNaa0t4VW02?=
 =?utf-8?B?K1RrNTlJamJLb3pNUXhZYmUrdTVDZUV0eDR1L2RBNjVUMmZEYVo1YlBBTSs4?=
 =?utf-8?B?QmRiS05BRWo3ZmJWYmI1OEpjSDdlZmtNdS9SMk5ndENKNUwyS3dya2RKdERW?=
 =?utf-8?B?L3V2K20ybFNwazM4M1BCTjByV0VpMGpOR09XdVBNWllHbExDRWU4enljd3lV?=
 =?utf-8?B?SHg4Zkl3SExBOUwyQzJWY3Jlb1AxVnhwTFA3TDZQZEVpa1M1Y2VTUG5LZVMw?=
 =?utf-8?B?YTIvNmdxZEQzcFdzZWFqV1p2TTkrUW1MWmd2WUFMdjFKOU5WbnVZQ2FNYWQy?=
 =?utf-8?B?cVVoYjZqcGo1cTVORVJES1hRaUozWVJqd2o3ZzVrTVozbmh2alY4T1dTTmJJ?=
 =?utf-8?B?WE11UzNJTVJjUmlpYVZJdEtXTm9DYnlnWER4Zkk1czc1NjRnc0QwWTV1bmg4?=
 =?utf-8?B?bEVrc3ZvNkZscGQ0ZXRoRjNvRGhmNkpLVTdIRzBOdWVnb1QvVDZaRGNnNVk3?=
 =?utf-8?B?eWppd2EwWkZoSkROTjF1ZDZ1eTJHU1hqbnVNVFVJazQyMEFFWVRaR1pIZThD?=
 =?utf-8?B?WnFZNG5yYW9tTkg3N21KWDA5MHZKcGwwNlduRk8weUJ0YUhEdzZxOVB0cDkw?=
 =?utf-8?B?ZVJXWXJNNzFDK1k4eC95TG1MV2dPQkQzVEcyVG5vL0s1TEtTbk5tQ1NRVWVT?=
 =?utf-8?B?ZVdmcklEdGMrNG10emV1c0hPUjVIeDFveFlkUVIrd0g3UFdTYkF5bVFLVEJs?=
 =?utf-8?B?Slo1MldaRHpYVzJ0bjFDRWJCZGZzS0cvSksyT0twbWx5L055a3JHTVNEZmU4?=
 =?utf-8?B?dmhqMGNlQWR1NURyeWtRaGRGRUVvNDVzc1NSV3ZwVzlZaUx6RlpXMkhoV3Ba?=
 =?utf-8?B?a09pc3k4dUE3bUZTc0J5S0FOWmFDazEwSlJ2UHN5NW9NT2IvZHgwZ0daZzgw?=
 =?utf-8?B?UXduVER0TGFFMUdoSG9VTVRVVXdIcEdrUThKN1dnY01EbVljcUYvSndKNU1v?=
 =?utf-8?B?Zkg0QzJsa0diMlNCVWhmNkdFY1prN2p4QVF2MC96WTlxQVJOTVNJTFpiaHdQ?=
 =?utf-8?B?dVpEQTcyNm1YbGtSR0gzaXg1ZW9oTFJaV3dRSDByVTdnOXpSdkM5WVhqbHVa?=
 =?utf-8?Q?kw2gro?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(1800799024)(36860700013)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 10:47:32.4786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2edf32-ae45-4bdb-8bba-08dd96c28f36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10719
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 10:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216833

SGkgUXVlbnRpbiwNCg0KPiBPbiAxOSBNYXkgMjAyNSwgYXQgMTE6NDMsIFF1ZW50aW4gU2NodWx6
IDxxdWVudGluLnNjaHVsekBjaGVycnkuZGU+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+
IE9uIDUvMTkvMjUgMTA6MzMgQU0sIGx1Y2EgZmFuY2VsbHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgd3JvdGU6DQo+PiBNb2RpZnkgdGhlIGNsYW5nIHJlY2lwZSB0byBwcm92aWRlIGFsc28g
dGhlIHB5dGhvbiBtb2R1bGUNCj4+ICdjbGFuZycgd2hlbiBidWlsZGluZyBsaWJjbGFuZy4NCj4+
IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+
IC0tLQ0KPj4gdjIgY2hhbmdlczoNCj4+ICAtIHVzZWQgUEFDS0FHRUNPTkZJRyBhbmQgZGVmYXVs
dCBvbg0KPj4gLS0tDQo+PiAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NsYW5nL2NsYW5nX2dpdC5i
YiB8IDcgKysrKystLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NsYW5nL2Ns
YW5nX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbGFuZy9jbGFuZ19naXQuYmINCj4+
IGluZGV4IGI0MWI3MDAyOTJjNy4uNDJmNTJhZjQwNTZlIDEwMDY0NA0KPj4gLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NsYW5nL2NsYW5nX2dpdC5iYg0KPj4gKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NsYW5nL2NsYW5nX2dpdC5iYg0KPj4gQEAgLTQ5LDcgKzQ5LDcgQEAgZGVmIGdl
dF9jbGFuZ19ob3N0X2FyY2goYmIsIGQpOg0KPj4gIGRlZiBnZXRfY2xhbmdfdGFyZ2V0X2FyY2go
YmIsIGQpOg0KPj4gICAgICByZXR1cm4gZ2V0X2NsYW5nX2FyY2goYmIsIGQsICdUQVJHRVRfQVJD
SCcpDQo+PiAgLVBBQ0tBR0VDT05GSUdfQ0xBTkdfQ09NTU9OID0gImJ1aWxkLWlkIGVoIGxpYmVk
aXQgcnR0aSBzaGFyZWQtbGlicyBcDQo+PiArUEFDS0FHRUNPTkZJR19DTEFOR19DT01NT04gPSAi
YnVpbGQtaWQgZWggbGliZWRpdCBydHRpIHNoYXJlZC1saWJzIGxpYmNsYW5nLXB5dGhvbiBcDQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1RD
X0NYWF9SVU5USU1FJywgJ2xsdm0nLCAnY29tcGlsZXItcnQgbGliY3BsdXNwbHVzIGxpYm9tcCB1
bndpbmRsaWInLCAnJywgZCl9IFwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
DQo+PiAgQEAgLTkwLDYgKzkwLDcgQEAgUEFDS0FHRUNPTkZJR1tzcGxpdC1kd2FyZl0gPSAiLURM
TFZNX1VTRV9TUExJVF9EV0FSRj1PTiwtRExMVk1fVVNFX1NQTElUX0RXQVJGPU8NCj4+ICBQQUNL
QUdFQ09ORklHW3Rlcm1pbmZvXSA9ICItRExMVk1fRU5BQkxFX1RFUk1JTkZPPU9OIC1EQ09NUElM
RVJfUlRfVEVSTUlORk9fTElCPU9OLC1ETExWTV9FTkFCTEVfVEVSTUlORk89T0ZGIC1EQ09NUElM
RVJfUlRfVEVSTUlORk9fTElCPU9GRixuY3Vyc2VzLCINCj4+ICBQQUNLQUdFQ09ORklHW3RoaW4t
bHRvXSA9ICItRExMVk1fRU5BQkxFX0xUTz1UaGluIC1ETExWTV9CSU5VVElMU19JTkNESVI9JHtT
VEFHSU5HX0lOQ0RJUn0sLGJpbnV0aWxzLCINCj4+ICBQQUNLQUdFQ09ORklHW3Vud2luZGxpYl0g
PSAiLURDTEFOR19ERUZBVUxUX1VOV0lORExJQj1saWJ1bndpbmQsLURDTEFOR19ERUZBVUxUX1VO
V0lORExJQj1saWJnY2MsLCINCj4+ICtQQUNLQUdFQ09ORklHW2xpYmNsYW5nLXB5dGhvbl0gPSAi
LURDTEFOR19QWVRIT05fQklORElOR1NfVkVSU0lPTlM9JHtQWVRIT05fQkFTRVZFUlNJT059LCwi
DQo+PiAgICBPRUNNQUtFX1NPVVJDRVBBVEggPSAiJHtTfS9sbHZtIg0KPj4gIEBAIC0zMTIsNyAr
MzEzLDcgQEAgUFJPVklERVM6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgbGx2bS1uYXRpdmUgbGli
Y2xjLW5hdGl2ZSINCj4+ICBQUk9WSURFUzphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBsbHZtIGxp
YmNsYyINCj4+ICBQUk9WSURFUzphcHBlbmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBuYXRpdmVzZGst
bGx2bSBuYXRpdmVzZGstbGliY2xjIg0KPj4gIC1QQUNLQUdFUyA9KyAiJHtQTn0tbGlibGx2bSAk
e1BOfS1sbGRiLXB5dGhvbiAke1BOfS1saWJjbGFuZy1jcHAgJHtQTn0tdGlkeSAke1BOfS1mb3Jt
YXQgJHtQTn0tdG9vbHMgJHtQTn0tY2xjIFwNCj4+ICtQQUNLQUdFUyA9KyAiJHtQTn0tbGlibGx2
bSAke1BOfS1sbGRiLXB5dGhvbiAke1BOfS1saWJjbGFuZy1weXRob24gJHtQTn0tbGliY2xhbmct
Y3BwICR7UE59LXRpZHkgJHtQTn0tZm9ybWF0ICR7UE59LXRvb2xzICR7UE59LWNsYyBcDQo+PiAg
ICAgICAgICAgICAgIGxpYmNsYW5nIGxsZGIgbGxkYi1zZXJ2ZXIgbGlibGxkYiBsbHZtLWxpbmtl
ci10b29scyINCj4+ICAgIEBAIC0zNDIsNiArMzQzLDggQEAgRklMRVM6JHtQTn0tbGliY2xhbmct
Y3BwID0gIiR7bGliZGlyfS9saWJjbGFuZy1jcHAuc28uKiINCj4+ICAgIEZJTEVTOiR7UE59LWxs
ZGItcHl0aG9uID0gIiR7bGliZGlyfS9weXRob24qL3NpdGUtcGFja2FnZXMvbGxkYi8qIg0KPj4g
ICtGSUxFUzoke1BOfS1saWJjbGFuZy1weXRob24gPSAiJHtsaWJkaXJ9L3B5dGhvbiovc2l0ZS1w
YWNrYWdlcy9jbGFuZy8qIg0KPj4gKw0KPiANCj4gV29uZGVyaW5nIGlmIHdlIGNhbm5vdCB1c2Ug
JHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vY2xhbmcvKiBoZXJlIGZyb20gcHl0aG9uMy1kaXIu
YmJjbGFzcz8gKHNhbWUgZm9yIGxsZGItcHl0aG9uIGFuZCBkb19pbnN0YWxsOmFwcGVuZCgpPyku
DQoNCml0IHdvdWxkIHN1cmVseSB3b3JrLCBJIGNhbiBkbyB0aGUgY2hhbmdlIG9uIHRoZSBiaXRz
IEnigJltIHRvdWNoaW5nLCBidXQgSeKAmW0gbm90IGNvbmZpZGVudCB0byBjaGFuZ2UgdGhlIHJl
c3QsDQppcyB0aGF0IG9rIGZvciB5b3U/DQoNCkNoZWVycywNCkx1Y2ENCg0KDQo=

