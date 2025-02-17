Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E83C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 15:41:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web10.54906.1739806853836722917
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 07:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=sLj7NQww;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=sLj7NQww;
 spf=pass (domain: arm.com, ip: 40.107.21.77, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=S0bnyqy0AxKsZ8eEGvkzwuJJU4vJ/aS7Go3RcgRQvedH8c5/+O5vvBUs9fli54mclixnCCCc2M3qTUzMPFZ6vcJZHuC0qLbPdUAc0ILAbxFD59krHG5h4QuUiTEiQfNB21vAHIuMTZbQJ3qEbDbRcRNVcG07tO4cq+JW1absVsyYg07Sp4avB7SwGm6jqlzNL446JqpF2BO92bqb5A4nbGS31uAwLrPTBkGwQHBEnigcej1UNp0LVc3dqHEplX4NaEXIHoDbk/ucv+Hct+UQpIePW890tUjkQN4nc6dSPJVedK2sTher4lhvrnl97WpL3Q06OQzbTslDTo5sE+1qaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvN+PwwLEJ6gNKnSe561kehj/XcLf4hpJbRwsjBHJ64=;
 b=uL14mjYpBUO4Cd6mikUHP2ucYDbzCgyj7FaJ4vLkqdnQR9J3QOMDiFUsvPsf5yyJ+EnQ0YjK1OppfX3iVUHdIUCWv00vuiepuoGqJrNwYTsATjfsF89/5skPuOb6rlBgeIXdRXCWoH0kxoa5/eUp80trgS0XF8DlNzocP/gmO63+1ZBJCZwp3lSIfBBl37QlMnYLq3Sb3aQ6E/GD/KfXp3sb+MtZOHwWxLwpBX0gLkkV0zkUlQUHMt9iaKSq1SRLoMyI+CpXSc1RsOQ9t3qVzoiAzIZ0rreillwILEICua+XfCkEKILSTe/vG52XkN9qM7czRIsxbVh1l/Pn7YkhxA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvN+PwwLEJ6gNKnSe561kehj/XcLf4hpJbRwsjBHJ64=;
 b=sLj7NQwwaF0K9xUAyQwR+O978NBftcmrDc3vZYd7o9vBeHn8lpDJ1gc4L7r3VEIDutr09NeOfr/69G6MCwSiqKCoeyeZDW13h7l3myyreqLfup9wI57BXbD0u6Yo9NraD/4lhPFyHwTukGSa9LHjVTQym1/Hh/bREjOYyiYbwN4=
Received: from DB9PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:1db::14)
 by GV1PR08MB7380.eurprd08.prod.outlook.com (2603:10a6:150:24::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Mon, 17 Feb
 2025 15:40:40 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::de) by DB9PR06CA0009.outlook.office365.com
 (2603:10a6:10:1db::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Mon,
 17 Feb 2025 15:40:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Mon, 17 Feb 2025 15:40:38 +0000
Received: ("Tessian outbound d73f074635d5:v567"); Mon, 17 Feb 2025 15:40:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11a0299ecb43de3b
X-TessianGatewayMetadata: K4LH+GHH4F1sly/9vauHgg9gEQFovs8kkAcRUkfMqEHn0T6BLrv/vKNUGrhHRNHiNSPAmEIs/UoanmYABQOKh8ze8WayNKcLeDJyCb0mU1DFXFOiucPTVCdfX1yUSH8M2DSXI0AepLDdo4q1gZ+O2x/W5IzZKA6I4FLH5QbQ26o=
X-CR-MTA-TID: 64aa7808
Received: from Lbac36cb21ecf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E5FC5CCD-D4C6-41EA-8C76-5718681BFB40.1;
	Mon, 17 Feb 2025 15:40:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lbac36cb21ecf.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 17 Feb 2025 15:40:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEshMxAB/SzyFYzyVsxVU/SxfdqY91iWR6l8DHNmJ8eeyKkyBaMm7IkLFNbi09yuLK2G4F6WLP1K/faMTGHUJlESAJyKlcTHJ+SKyFeoKYETHis1PVO5qydsJ2L6SVTkv8KliGmwH0xmXmSoBGg4dPhkfVz6hJuY4PyqZDwKmuPbQN1VERTMBi/cWl6LUniAR34OQ7/VK1wwyDTtt27xlPWJl6HUXTd5wcG+X+DvLIeTplrd2HRUfxrG/arb6NjXxPIv1uYAC3cAnHXbhVAvk1I9a0s0+ENTpkhPo2PgQqzZVlg2Iq8u1tEmWlZGDhd7Q6WDnvk01BI3ZKq3fhScGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvN+PwwLEJ6gNKnSe561kehj/XcLf4hpJbRwsjBHJ64=;
 b=dlKiV7MH3Oyyo8TgItvJllTPVTzIC5cXCSEcXqiZ74LvTedBbs+XvsNUJwk9QO32DY4irkl1zRHhzaFGOxPTyK/Gm5SXOlCnuWXJmr1cSzVsi1pjUmGSotN4yMOlDfaWpVvMf95of+lz95q9tnODjs5OM3PRRknnuZNOMEnbo9iQy6voPtwWzi0q710hgmCo2rLYrFj9Av8yqmmfmxq+SfST4WYpst/xcAEROgMh42t274tOojZAxQHIMvpmFm7dz3qUXb9RkAwuWiRneZrSWONv3auPZMUHvK88yB80BpaSJWo3esNOFvSETpN8LuKcUOASTzxlFnB4S5Dk8xFavg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvN+PwwLEJ6gNKnSe561kehj/XcLf4hpJbRwsjBHJ64=;
 b=sLj7NQwwaF0K9xUAyQwR+O978NBftcmrDc3vZYd7o9vBeHn8lpDJ1gc4L7r3VEIDutr09NeOfr/69G6MCwSiqKCoeyeZDW13h7l3myyreqLfup9wI57BXbD0u6Yo9NraD/4lhPFyHwTukGSa9LHjVTQym1/Hh/bREjOYyiYbwN4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5729.eurprd08.prod.outlook.com (2603:10a6:20b:1de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 15:40:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.8445.015; Mon, 17 Feb 2025
 15:40:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V3] setuptools3-base.bbclass: override default
 subprocess timeout
Thread-Topic: [OE-core] [PATCH V3] setuptools3-base.bbclass: override default
 subprocess timeout
Thread-Index: AQHbgRAN2AQo6Uwtr0e9PzB4EuEYBbNLol0A
Date: Mon, 17 Feb 2025 15:40:29 +0000
Message-ID: <DAC5A0B2-4F3D-4338-9EC0-68037A53FBBF@arm.com>
References: 
 <CAMSfU+5JFiSZXkJGWA0aGqJZO-Lz1dsXqwNw-bQEo9QCRmrxAw@mail.gmail.com>
 <20250217074619.3763528-1-hongxu.jia@windriver.com>
In-Reply-To: <20250217074619.3763528-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5729:EE_|DU6PEPF0000B61E:EE_|GV1PR08MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4c55f7-831e-44dd-6775-08dd4f696db2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?OUI3dDhRbkFpYTZZUXhOSkN4dkYyL0piUm1HY2NpZVBocUY4RFozSFlNWWNq?=
 =?utf-8?B?UGpUTjRJVVBPRmF1aVVQODNBeDNteDZ1UW1jOXRrbUtkWmwwcngwYUZhY2JX?=
 =?utf-8?B?QVk5WG16akxvbHNudms5amZlR2djeS9CM01NQVkzK1VqVFVlVE5PK0pmcms1?=
 =?utf-8?B?ekQ1T21JdkNhekdpTjBGQk4wZG51b3pKNXJSVnpPQlh3bWF5bEpnTjNTSHp0?=
 =?utf-8?B?b2VuSExPVFJ0TkpIMDY1eldTVktjRFBmTER6c1FBM3lvdEp0N3lldCtXNlRz?=
 =?utf-8?B?RElxeDNGczB0VVQ1OEw2a2hTS2hwNFJ1bjlVZUQ2dTRTdVN4VHdqYmFoTmhC?=
 =?utf-8?B?THFlcHRxN1U5dFROY0ZJWWJTcWVNZktIcW0yYlpOeSt4N3hLenM3N3FHOGdQ?=
 =?utf-8?B?YlR6eEdJSXk2OEIrWmRZM3d5VVBwSExKTWVSSHlXZUlFSDNmZjBHN09FMWpB?=
 =?utf-8?B?QlFqeW9lTVRuWDJvTWc2QWxFN21FcHBhRTY1anFqa2hLeldmOTFXSlR3V2Y3?=
 =?utf-8?B?QUlKaDBmTTJKVG9YN3R0ZDQ1VUduMjZFZ2JqVFM2Q3M3M1B2TWYwN3dpeEEz?=
 =?utf-8?B?aUFLelNlcHNYdHJCZ3VDNWd4TzBYd2FadlpnQXpUdHZ1K3VnWmZ0ajgwSWp0?=
 =?utf-8?B?SCtxYTJVc1J2RGlkUkdzbEplcnJsWi9wTzdYc0gvcm5keEx0ZVFkM2J0MmV6?=
 =?utf-8?B?VE5WekFmR2N5ek5rUUQzMk5EVHNpenlYWmxGUGFJbTNVWloxK3F3WFptMEh4?=
 =?utf-8?B?RU5IUXM5R0VkMGcvNnl4NTl0RWpLRXV5N2dUamhOZU11ZzZKSjd1WmJiZU94?=
 =?utf-8?B?elhzVnprNGVFTUJhajdZOUp5Y2VqN3FHZks0OW0yalh1bXVyVmJFZzNIYWIy?=
 =?utf-8?B?b1lEVE1nbmJaWHE4a1RVb1ZUWTFZNmNuOHV3b3RxbVNwRWtmVzJRS2FFMndM?=
 =?utf-8?B?dnNCTXZWSGQ3S3l2UDFqYWoxa244MTdMaTVDbmpGbHNEZytNakdJYlNUZ0Y2?=
 =?utf-8?B?ODJQQ25iNzZ0S3RtWnd5K0kzU2plR0pMLzZmNU5ndFAzRmJ1NDRFVGJGRDd3?=
 =?utf-8?B?UjFYSEp0Q2RJSVdrdFZPcGZqNnBOL1Z3Y01CWWVkVW55OTdEb2VPa3VLUFF5?=
 =?utf-8?B?cS9ZQlU5UTdsYk5iZUlMeks1MUlDN2gzSXJpNXEvNmlLN202YTc0akhQUTMw?=
 =?utf-8?B?TWt3Y1h6Z2xqaUh4Sys1NVFWL3p3VUFQM05kcEcvQjZDTWxTeVRDMkQ1bUgx?=
 =?utf-8?B?WFRZVFplOEJ2RW5WTjhyQ2tBVUVLM0pRNnEwVTVta01peW5WTEw5Z2FjY09N?=
 =?utf-8?B?Q0k4K0RSQXk4Rit5RWw2VTJLUEhueEU4KzNOWjF5NzNXRkNuN0RUSDlXZDd2?=
 =?utf-8?B?KytMNzBpQXN0TElxeUY5RStvNWl6RkJvU2xGZjNNSllOK0hBMDZxcnJ1cE5v?=
 =?utf-8?B?bXNlMEo0a1F2ZTJnSEFmRndMR1c5SG5LL0sxenhnUzBLUGtEQkU3V3NxL29q?=
 =?utf-8?B?NVlScDBkdjVKYmNhZnFESFBMVk8vR3hvK1pZdTdxWmJHRmVaUm92SFhIeGZx?=
 =?utf-8?B?dmFzSXlGZy85bTVlRFdZN1MxKzd3bUJBUlptWElCYkN5aUZUQWhIN3RSamNK?=
 =?utf-8?B?MkxkN0xNUkFPR2piWWxFN3pyUWlPNGtseU5va1Vzejhma0xsL0pma1JIY2RV?=
 =?utf-8?B?S1FmMStnQVExMlhRNW1la01NVUxhb3pRejMyTEFkc2pDRWFjSjlyMDNLUVFx?=
 =?utf-8?B?ZS8rNnV2ZDVHYjFvMGVGS2pveUF4WFFHSGZnTnIyZU9tampRak9iOGU4R0da?=
 =?utf-8?B?cUZUSVMwNndPTmJOWWNlaTFGNkU1TVAxUVJrZjV0Zi9pcVFEWWNkdCt0K1B0?=
 =?utf-8?B?TnhVQlNFUXJ5SUpXS3VXNDJjNFpNbWYzdGxvbHU5ZkkwQ2ZBQkdtT0l0VWxO?=
 =?utf-8?Q?z7b2aPfBW/QzrvmMOg5opQzcfCGWDazE?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <06811D9449A4484AA0ACCF6766AA8FAF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5729
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9beddebd-72c5-4de6-80cb-08dd4f69681d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|14060799003|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cm1lWEk0S0VEaFBtNWZ6ZmRXUkxVYnV2VGhtcjRtOVBKSWVUT2NBZlQvWWE2?=
 =?utf-8?B?NFVOU1JBTXUxeC95VVYvRmtUV3ZucldJbHQ0YkVhVThMeWZlT0M3Z0JmQ0g2?=
 =?utf-8?B?dVYzR3FXNDhVZGpEbzJmRHdCbkV3R3lmSnQvKzkzSlhLSjJoNkJzaCtGOWYw?=
 =?utf-8?B?MldXa0YrNmZXWHpCK2J0Qi9kSzh6dkJFYVBrOXpnM0M1eDY4am9rWDkwQmlp?=
 =?utf-8?B?SWxaWCtOQ3FoMXY4STdRTmFkR2dsVi9aSTVWcHFYdDh1WDdFZVczZUFWMDJW?=
 =?utf-8?B?Sm0vSGx4WFlwRytiY01NNUEwdU9MUWQrSU1SdE1nTGRPSmpsdVExVWpNUnVU?=
 =?utf-8?B?YXR0MCsyVUZ1SW1tVXZSU05pbmptL0k3bGxkZlNwWlVHeHEyTWJPU3FYcjhO?=
 =?utf-8?B?aWVsQVVXelpwWWFJV2h3eEVmeXRYa0NndHNwelc2MTNVdHVZb0VIWXJhUXk3?=
 =?utf-8?B?SmVITWtDelFmTk83cnpaUlJoVEdKZ2t2MkRMUkdGTkcxL3QzRjRyQlBJRWUw?=
 =?utf-8?B?Vm5VcnFiTGRTbFFsK0tKbTc5d2ZtMGUxb0hqYnN6NkhJcVBzT0tDY2JGK1Ey?=
 =?utf-8?B?aDRoY3BHZU1obktEcEZBRnFwZ1JicDVqR3JqcXdFQ2lGeDl3dW9qM0dISkZr?=
 =?utf-8?B?Vmc3ZnluN0d6b2pzNTBud2oycXc2d0ovS3Q4Qy9sS280c3FSSDdqSFg2Q1RX?=
 =?utf-8?B?bWxDang3VmRaeVMrQjViM1NJNS90QVNCM3Fsb3paU1BTUUI0ZDh6Y2NTamFK?=
 =?utf-8?B?MnMwMi90L1JFdkNPU3RWS283MFdqSGR4bFI0dW8vcFF4djBIL3lsdDRySFlK?=
 =?utf-8?B?L3dTS0NQd0lFQ3lCa3JkVldmdEp2MzhDQzlwdzJubFhKSHVhTlNaK2pIVG9E?=
 =?utf-8?B?MDJ1amwvMXQ0Uk1oZ2oyT0lSaTh0bis1eHlVbTFxelZEbExXYUViK2FKVlU5?=
 =?utf-8?B?NThJMVA4TmNXNzc3WmV3OHRyQVZacGpWSVJQQ1ZKcFhTd3Z0bDhCVWdBTlVN?=
 =?utf-8?B?VmIyT2pTV2N6MVZmYjlORCs1UEt1aXc5S3l4MVBvUXJQcTZkLzFRcHUySktG?=
 =?utf-8?B?NHFOYWJJbWlGS3BkYlFtc1c3V2lNQmh1U01laHFMMFhnSDRUMEJ6V1VUY0Jr?=
 =?utf-8?B?T1R2VDgyUkJ6ZW04YUUybVNWZGJSVlBlSjRuLy9zWVpvaEZQdWs4UGxBally?=
 =?utf-8?B?dUl4VGFOZ2FaUWVYSElPQzZUKzJINklCeCs2dGl2OG9OYkdDSjJ0TW5HTmN4?=
 =?utf-8?B?T1FZMk91bmdKZFA3MEFrUGdEdktjbmdDWW55dCtXMHJOaERtLytHbXpxZk1T?=
 =?utf-8?B?c2l1TVpxZ1AxMVA1UFp3b0JabVBzbklHL2RMWnp5R2IrVzBTVGtlcVIzYW1l?=
 =?utf-8?B?blNWUFBucW9yWndraHAwaDFoK1A4a3h2NitiM3BOdmdNRU5YNWhBYVRINk9Z?=
 =?utf-8?B?OUtHMk1ITXlGc0xoVng0M0hoN1R3SHpncllhL1NwVXZDaXhuaTBRQzFLaDNK?=
 =?utf-8?B?V2gySlJPNzZ3N3NseklKTU9nZ2ZsalNkbG56NVhwZmE3MDZycXZka2Z5bjMz?=
 =?utf-8?B?ODZHeGgxbU5BRzBTd2phejJiSVNmOHpUdEdTZDR5eGRJaldDaXkvR2NlUEw5?=
 =?utf-8?B?UkhPM3V3VFNJSXBGV2c4Y1FmMGNtTFNlSEN2MzVxQzlPbWI3Q3l4d3RuY0hm?=
 =?utf-8?B?ME9MZUkrbjFpYXhSUkxwS1pkZDQzb3FCdHRpRjVyZ1UxWjQ1REtFRHBMaFIz?=
 =?utf-8?B?cjg2Nk5mRE9IcENjMGVrV0d2bjlUYTVKdkk1UTF2cThkMmdSLzlrb0o4NUtF?=
 =?utf-8?B?OE1xVnIydUN5eUdUVnVsT0xFL0QxaFZjS3lOVEIyclM3cFdaeWlkMmpkcy9y?=
 =?utf-8?B?S1hQdkIzWDJTdEhvT0pMcVBMa1RPUlVkc3dZZVdWMHpDTnlnNGF6MnZldHVV?=
 =?utf-8?B?NXROaVNyZnJ4bTdsbFU0TVZ5NU13N0pzREU4YVZLUE9IOXJyUTNTM0RJYXl5?=
 =?utf-8?Q?UgHcpATsnE0Q+jePWnn2IdiudiAaVk=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(14060799003)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 15:40:38.6578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4c55f7-831e-44dd-6775-08dd4f696db2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 15:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211543

T24gMTcgRmViIDIwMjUsIGF0IDA3OjQ2LCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGhvbmd4dS5qaWE9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBUaGUgZW52aXJvbm1lbnQgdmFyaWFibGUgU0VUVVBUT09MU19TQ01fU1VC
UFJPQ0VTU19USU1FT1VUIGFsbG93cyB0byBvdmVycmlkZQ0KPiB0aGUgc3VicHJvY2VzcyB0aW1l
b3V0LiBUaGUgZGVmYXVsdCBpcyA0MCBzZWNvbmRzIGFuZCBzaG91bGQgd29yayBmb3IgbW9zdA0K
PiBuZWVkcy5bMV0gSG93ZXZlciwgaXQgd2FzIG5vdCBlbm91Z2ggd2hpbGUgdXNpbmcgZ2l0IHNo
YWxsb3cgdGFyYmFsbCBhbmQgc3RhcnRpbmcNCj4gbXVsdGlwbGUgWW9jdG8gd29ybGQgYnVpbGRz
IGluIG9uZSBob3N0Lg0KPiANCj4gfCAgIEZpbGUgInRtcC93b3JrL3g4Nl82NC1saW51eC9weXRo
b24zLXNjYW5jb2RlLW5hdGl2ZS8zMi4xLjAvcmVjaXBlLXN5c3Jvb3QtDQo+IG5hdGl2ZS91c3Iv
bGliL3B5dGhvbjMuMTMvc3VicHJvY2Vzcy5weSIsIGxpbmUgMTI2MywgaW4gX2NoZWNrX3RpbWVv
dXQNCj4gfCAgICAgcmFpc2UgVGltZW91dEV4cGlyZWQoDQo+IHwgICAgIC4uLjwyIGxpbmVzPi4u
Lg0KPiB8ICAgICAgICAgICAgIHN0ZGVycj1iJycuam9pbihzdGRlcnJfc2VxKSBpZiBzdGRlcnJf
c2VxIGVsc2UgTm9uZSkNCj4gfCBzdWJwcm9jZXNzLlRpbWVvdXRFeHBpcmVkOiBDb21tYW5kICdb
J2dpdCcsICctLWdpdC1kaXInLCAndG1wL3dvcmsveDg2XzY0LQ0KPiBsaW51eC9weXRob24zLXNj
YW5jb2RlLW5hdGl2ZS8zMi4xLjAvZ2l0Ly5naXQnLCAnc3RhdHVzJywgJy0tcG9yY2VsYWluJywN
Cj4gJy0tdW50cmFja2VkLWZpbGVzPW5vJ10nIHRpbWVkIG91dCBhZnRlciA0MCBzZWNvbmRzDQoN
CkNhbiB5b3UgZGVmaW5lIOKAnG11bHRpcGxl4oCdPyAgSWYgYSDigJhnaXQgc3RhdHVz4oCZIGlz
IHRha2luZyBtb3JlIHRoYW4gNDAgc2Vjb25kcyB0byBjb21wbGV0ZSB0aGVuIGl0IHNvdW5kcyBs
aWtlIHlvdXIgbWFjaGluZSBpcyBiZWluZyB1dHRlcmx5IGhhbW1lcmVkIGJleW9uZCByZWFzb25h
YmxlIG1lYXN1cmVzLg0KDQpSb3Nz

