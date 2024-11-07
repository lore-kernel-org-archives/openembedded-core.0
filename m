Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8A4D43369
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 14:46:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.53])
 by mx.groups.io with SMTP id smtpd.web10.73790.1730990808582635730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 06:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XAMrS+MJ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XAMrS+MJ;
 spf=pass (domain: arm.com, ip: 40.107.20.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mITxVQFsuspN7fQMfftrqhb6XSfSEVuXV163pGfbE0vFiN/PqgS5a2uhwFFlv7brvXksBEdP5FxnyNX1iXKbt7spnzDxzPBTrlGK28lmgQ5pFK5IUTCbrWk23r2ksD5AKCcI6YgRQMTaFPJNPFwIUx2LK1L27BpwAEPtmlySbEXpMp/uh0yHuZnr77eqB+PPkVxgyfWKN/wswLhulMwb2vA6458QEwUQk/2rO4SInAUOGMnm35v57hAsvLpVEHM28jHGWz+PdkwojiPKfSqV7rGFpvkevQQc7lo5Xqa45gHR6EtvUL1alyrq2q9GrCsXskeGBh6Q0a69Jn2eDk+wag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdhjRxgDteM/uV67XVLgYOI/bunitZQI7tBn4EOh4z8=;
 b=NcuLfYDnsAj/mjBg0d3MwgsMfT8cIP1m3umaLNecYpZLaBiWNRuC/hUOb1+PIcHyj2bLoW+cdm4fSbHG40e1DBbpvXdxZR/ZggfjlyN32QJEvf7mZrohGUNNZQTGIUcLbrT2TnNv6996ok2ibHVI5ZtPg7Tnm9FZt4Q+wg2uVPS2b7tCa2/ymNCRnRlzlj46N9wxJdQb34flBypCskKTzvmdACFeOHrQMsEOYr0uUadSFr3HlysATTRXcoqO9Mvb2HsvZLLaNehxVG0jaau8rcx1P/ndDPN78r8n7kO+hZkHtw4aA+TnrgnNv14w8HUGtqCNW83jezTXSUq/Ggh5RQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdhjRxgDteM/uV67XVLgYOI/bunitZQI7tBn4EOh4z8=;
 b=XAMrS+MJzG9Vs0TO8liED3A3xZOBd9Kbpe+pwZR7qSdiN5xqPsHFZmzGzEXim0gGRJ2YfMWLnB7bne0PY3qft88W/kmqzujLEITcG0vTqIr9VtnJYL87zM3/DMjKknM61uMeDzhXJiqjgllIFpRtgM2Ru0mWcPJy17hArZBLd34=
Received: from AM0PR06CA0083.eurprd06.prod.outlook.com (2603:10a6:208:fa::24)
 by AM9PR08MB5971.eurprd08.prod.outlook.com (2603:10a6:20b:2d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 14:46:44 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:208:fa:cafe::5f) by AM0PR06CA0083.outlook.office365.com
 (2603:10a6:208:fa::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Thu, 7 Nov 2024 14:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Thu, 7 Nov 2024 14:46:44 +0000
Received: ("Tessian outbound 57fa7becdebd:v490"); Thu, 07 Nov 2024 14:46:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 853bf5014e62d8b6
X-TessianGatewayMetadata: AqYwDqtwY0jDnPQ/Q1KbOBxxVxKCcT+Cjpq0C80oig+zKSAHEYsz39q8/q0zxtGZw6pRDHyTCF8gNeUchsySg/FQi57rXTdPvRXXt+S+tO92+pP8dmyOLS2S2lMMUEi9vmpc1JCUFUPRH23H7IBoIU4Fn3Z5te2CbAuQR/4LizA=
X-CR-MTA-TID: 64aa7808
Received: from La039b96ff93f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AF224AC0-43EE-413B-A687-880FF0F29D60.1;
	Thu, 07 Nov 2024 14:46:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La039b96ff93f.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 07 Nov 2024 14:46:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjMytysQ7Ay/ZTBGa67Xwo53r8lmGy5I8Dx3Y7eSxkqkxy07DWnP8QIhMarckM3vrGl8e1WbJbcAdq+mj0Lpc6qWb7qT0P0f51+RjtgPVEpHvC6gCObaLrbfHUB7kjqJWyFCxHsfxC/4t6QPeVLmRrIZuQjuAvSC0vGF1BFL4gS6g9mYaiFbfKOyZUoyNbiZNxVsq7tvbOk69/4KyQUPSr5rTYgT7rdUxhsytNBmomZ0BtqSYE1rvsompmBL10cNhrg/agUQ777Svn5oGdoXkxkpDELTWAw3bPTtZH4Y0QJRzMhN/8mBGNF1vDUiPzivoco/3EYy2Kr6AlKce9506A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdhjRxgDteM/uV67XVLgYOI/bunitZQI7tBn4EOh4z8=;
 b=klwXbRp1G2UiqtGQykN65OngiJjQnnCNZS8aqmTE0rd/adpQP2hDdMKrSgK2cJxFpWDR4LSf3W5+DAiH+H5l0BdJ1itVbya1QYqW62948KeDQ5kcK950ReXPD6u6DZNUTNphKp9jb+LH8W6Cjxwnb6oYyzyVSAtS11pOcGaBphC5f2QrAyF2qeM4FBCiQKNFEV78ju8oqmL7pyzpUPe4IwjBx7ceVT0/r65qYeWAYzKRVnLrmGxELFT/l4oHb54kUsfdVmmF50XVT+K8sXWKE8BvS+WiS/LarDvJD6593BxJTuebX2InJKsj3DfYJwlCoFkRi8hiQfVrP4G2qCaHcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdhjRxgDteM/uV67XVLgYOI/bunitZQI7tBn4EOh4z8=;
 b=XAMrS+MJzG9Vs0TO8liED3A3xZOBd9Kbpe+pwZR7qSdiN5xqPsHFZmzGzEXim0gGRJ2YfMWLnB7bne0PY3qft88W/kmqzujLEITcG0vTqIr9VtnJYL87zM3/DMjKknM61uMeDzhXJiqjgllIFpRtgM2Ru0mWcPJy17hArZBLd34=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10127.eurprd08.prod.outlook.com (2603:10a6:20b:642::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 14:46:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8114.028; Thu, 7 Nov 2024
 14:46:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes-recipe/core-image: drop debug-tweaks
 IMAGE_FEATURE
Thread-Topic: [OE-core] [PATCH] classes-recipe/core-image: drop debug-tweaks
 IMAGE_FEATURE
Thread-Index: AQHbMRu1X9RsvQPeYEmnB0QJjEK02LKr3I8AgAAI2wA=
Date: Thu, 7 Nov 2024 14:46:34 +0000
Message-ID: <A1BD609E-C2F8-4E24-964D-D82CE0034760@arm.com>
References: <20241107134752.2071720-1-ross.burton@arm.com>
 <c1ef89d4-0762-4011-b6ff-8027b4a0c367@cherry.de>
In-Reply-To: <c1ef89d4-0762-4011-b6ff-8027b4a0c367@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10127:EE_|AM2PEPF0001C70A:EE_|AM9PR08MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: ad66713b-cddb-419f-4f91-08dcff3affbb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZmFZZzhZSERsS3pSWjJkRTJaMEl4R3pYQjQrMkJYemFGbFJPWWNjcjRRYndM?=
 =?utf-8?B?QXVXK0FxalRjbUlmOE9WVFp6cEFtNE5tYkdRYVUxV016Yi8rQzNBNkJ5dUQ4?=
 =?utf-8?B?TVlFd0NQYkdIZG9ZclQ3SUpBVlFFcHdJdTF3MGlESVdxcTRHNmppYTBHVENj?=
 =?utf-8?B?YW9ZcWxVbUVwZkpNOUJTODVOaDlsMEUwTWxSZlZIeVlmSnVIUWE0NldmVVJJ?=
 =?utf-8?B?aDNqTldzVlNCRGNrdmErWWZMcUgrVEdkUlFRUUphVW96dmxCT1U5ZFdBZlhC?=
 =?utf-8?B?b1F6YmZBMHdjaWREOWEzaG1waUQ4SkUwSGF6M2F1Zk1oUjBQTVVNOWIrWDdX?=
 =?utf-8?B?MWlvczRVZUExZm44OVFtUnhGWnI0RlNlV3BkU2xPSU9pbFppOWJsUnY2N3Ax?=
 =?utf-8?B?UGdIRk1JYTAwWUgxOWJWZXgxQUlES3FJTEhHN0w3RHc4M2NZcHBlRE1OMy8x?=
 =?utf-8?B?NFpLRWJJN2RDWTdBdzRDVzR1OGhvYThsUnlodlc0M3ByZUlEd1RHUE9WREJr?=
 =?utf-8?B?M1A4L1lzNGZ4MDVLSThhMVVzZjVzeXJLMHlFams5QkFXZHN6Y0N3dXJQWXdZ?=
 =?utf-8?B?V1Y3L2diUkxEMlBFRzRneHZOU0hHZXhoQlJ5UGkzYVV3UjFOdUV5ZDBUdmNQ?=
 =?utf-8?B?ZEF5bytSVFEzMlRaRGNzMktFMDV2UUY2b3VNSlUyaUxBVjhWYWNCQUxocE5t?=
 =?utf-8?B?bytMNEd0MFVyZ2lCbHl6WDNMSS8wS0VIZ2lHczcyWVVERG93Y0hVSUFxTzV5?=
 =?utf-8?B?RythUDR1SkF2Uk5IaittUTNkMENkbTZwbnVDMm1qaVloMzJKcWRoUHpFTnVR?=
 =?utf-8?B?anZBMHRoL0pialJRZ0R5ZEpzTmZneFBXN3huV1BDQVN4YUttWGdzbmpWWm5G?=
 =?utf-8?B?WmRSS3pXR05xRDRPcHM0N2pkbk9Tbk1sSmFWM2p2NHRROE5aZmNWRDNpVjFG?=
 =?utf-8?B?eTNMV1ltN2EzeVZqbTFBeElBYjFIMXE3Z0ZpQ0Y2NXFsUnlmZzljUVc4MnFP?=
 =?utf-8?B?anYvRmhSV2VXeVRTVEQ5bVg1NTd2OE1vc1R3eHJoeHFCMzU4aGJWYmd0TXFE?=
 =?utf-8?B?WTBaSVl0VzN2UUtoWnBVeXlUUHptdUVqUzJwVXl5bms4RHV1NW81NVVEeXQ1?=
 =?utf-8?B?elBWOHdHT2lqcFNONHB0dGlXT2xCOTlqUzJaM2VsV0FiS2QycDVJSldLUkVh?=
 =?utf-8?B?bU9TT0czSzNjajh3TTcxQnU4eWhVQTI1NytDRXNzSzdSeWpBalFCSEJRd1dW?=
 =?utf-8?B?ZzdFckUrQ0plUWdHbWsvVGI4Ti9jNjI4UDBGM0F5N0tEQk9nQUxLOUtSbzNS?=
 =?utf-8?B?N0V2WVduVmJubFdHYnJSQVNSSkVHU3V6TTdSU1lRRy8xSlYxWmFQSStKQUVp?=
 =?utf-8?B?MW5rZk5MN3dKUENKTGxxV0M1eC94a1I1NUdqU0ZSTjdSeGYzSnBNcnNzYVEx?=
 =?utf-8?B?eWpTRWhKbWJnYjVjRGRDQXJtN1RxZ1FOU2hLckNqNnZTbEdMM1IycGU0Ni85?=
 =?utf-8?B?Ly93anluTytRS0dCRUxIekg4Z25vcVJkY0hucHZRbmNCN3puR25IRUFPWFlW?=
 =?utf-8?B?N2dvOFczODY4OTJnbUpIbUtReVFRRUV3REk2dVZleTd6Q1E2S3dWRjVucTBJ?=
 =?utf-8?B?VEFhc0p1cVBXMjFsMktDVEhJYlo2cmlBb2VuTCtYcWtCOW83bE5QVERZMXZw?=
 =?utf-8?B?MmhySlMreGxOMmRiNEIzRk02MmR5aFhvSmZNa1hVeStWR3l2M0ZtRnJNbUpV?=
 =?utf-8?B?L1J4NXErbm54SUsra0RpWmk0V3hxcEppdjNMbDFOZUxKU0hYd1JJMXRMTHNn?=
 =?utf-8?Q?N7HsPD3Q43eE74UbyK47Y5Aw/jWjkCmD8sVAs=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00D0E5A5F1480F44A9B3F14CEC0E10B4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10127
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0fc12f4b-138c-45ef-2dd7-08dcff3afa0d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|14060799003|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ck01SHV3dUpIM0t0ZURVQ3d3bXJpZHZFU3ZOWU11RHlZdnR4c0ttRllJdHpl?=
 =?utf-8?B?eU9xNkFsS1NyOUVQU0pjRk9tY0hYQWZRQkllYWhqZy9lblo0K1dNRmRDNk1W?=
 =?utf-8?B?bkVqbFhXZ0cxZlBBWEhBM0d4SVBmRE9QTHgwRmdiMlVoSjZrc0lRWjZwaFMy?=
 =?utf-8?B?cW03bk91WUtYLzNLWjhvVXhTQW5CeGMwMDFNK1FQVkVlVStybFA2U1Y3bCtu?=
 =?utf-8?B?RjI4SDBKWDFrNktWNUVIZEFyeXB5RnRaTjd6Um1CSStzd2lpWnZsWUttSytq?=
 =?utf-8?B?bVJZOFI0bTh3RXgzR2ZLSzg1dExQbTNzM1Q2TXArNm9PMnFiZ3YvSFowUVB4?=
 =?utf-8?B?UXZWQ0c3TWdDYzlRd05aT3ltUnVOamRqUmNIemhTdVoyd0I5UytXb1o4Q01t?=
 =?utf-8?B?NnlodUI4SU1XNG9uQ1lldFpMZjlXQXNzQTJ3NzBMcmNZeHB2eldVSG9QTlhr?=
 =?utf-8?B?dnZEdHpONU1Odk5pQ3B4dkZnZFRQaEtHbmVXMzg4akxVa2hJZzNHYm44OUVU?=
 =?utf-8?B?RUc0WldoR2NQMUZrS2ltU202YXNzeWRFNGxyelRsekxIUldZZ3ZrWFc3U01M?=
 =?utf-8?B?QTFtU3BubDlSdHVqNHdXY3RTMjQrblNXOEJqK01aOVBvd1dTSkc0b2hzbkFj?=
 =?utf-8?B?WmxjUmZwUkh0cjFwejZQUGtpLy9tREVsYzlrTnE2NE1sNFVLWHhJMW04MFlS?=
 =?utf-8?B?Rm1YZ1VzV3UwQVZFcmFWMno5dkxGTWJhSCsxaXFBbVN6V2pEcjc0YUMydyty?=
 =?utf-8?B?ZjBJQ3FkWWZIWERFTVBrblM3Slh1R2dVdmQ0NHJUb0ROS3JJc3BRc3N1UEhw?=
 =?utf-8?B?STlnRnQ0VWQwMlA0UHpJSTBPcEFvV2FzZ3AveEsweGNaU2F5ays2d1RETzgw?=
 =?utf-8?B?bHdvMytVdmh1UDlXaDVRVklqYzFOalFkamVrbU81anA4QUFHSjJTczd1VWVy?=
 =?utf-8?B?cVBEZUpMbktFYVZQWjJtNy9LY2UwOU1ZTWxzdGE0T2E5MUk4UWc3T1hPdEZL?=
 =?utf-8?B?akwzZDFnUnk1ckFMTk0xeFJWUE1PRm9MeFlqUmorbHhiNmxlZzhndE5hN1cr?=
 =?utf-8?B?alNEamsxVVN6SkZjc3hMUWc1SzZrT0YwNWRSU3hDMEczdEZSV3c2cjZaNytB?=
 =?utf-8?B?cWwweS9CcTJBYVZnenM3eDk2WFVGMUN5bjg5Y3dvK2xIZUdpd29FY3VWTStC?=
 =?utf-8?B?OEhlSHRUYktzekNwb0FMM01hd3M3bUxyUzMwUFlJK3JkbVNLYXk3ajNBQUpJ?=
 =?utf-8?B?MmhSbzIyeFNKTExJUW0vZW1GVHVaU1pBTnE2R3pVblFVM0RBcEUzWnB2MThi?=
 =?utf-8?B?L2RjUEZaNmx0Z05TWnhWYXh3d0tSTlpHZGw4cXZ1Uy9zdlNzaTJsVE1CZE9n?=
 =?utf-8?B?dldtZlNOWkQ0YytFem9VSXlTYjNSTGlWVHQzUDFBaWJjNzJkQkFuNGgwa0Nw?=
 =?utf-8?B?b2VkMUQ5ZG54NHY1UEtsdTViV0FYTFZnZ2dGUGtVbXk2MVF0MnlJbjFhV2RB?=
 =?utf-8?B?U25VUGZqWXp5NXZMcHlxY2tGc21MSGxSQnYwOCt3QldyL0lJOXM4R0w2M0FM?=
 =?utf-8?B?bnRjNHRMTURDS3VtZUJpdDROeDV3YldhdG1KZjdab3ZPRnZMeHdwaTUvUGZr?=
 =?utf-8?B?MEhGNThXLzROWCtSTUhUdy9nNXorVnNSbnhZbTB6UGRNSzhObnVJTlByV1Y1?=
 =?utf-8?B?b3liVVNaUXMzemlwOVUvR0FEK3J5ckxDcFptSFJUYk5jK0FOVS9uQUZkK3Nj?=
 =?utf-8?B?bndpOHRBQzhLditxTlFaQTZ0NWZlTy9WRVVlUEVxS3BwNEJhZjFHdzhxQlpU?=
 =?utf-8?B?RFB6Qm5RZEVnYzdXNXBuN3ZWY3pxdmhOUDVXZmVmaGNSRkw2aFIrUm42NXRV?=
 =?utf-8?B?eXlZZWFMb3lDVUd1NUptNGM4UGgwYlMyYzRoVTgrOVlSU3c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(14060799003)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 14:46:44.2794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad66713b-cddb-419f-4f91-08dcff3affbb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5971
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 14:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206837

T24gNyBOb3YgMjAyNCwgYXQgMTQ6MTQsIFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBj
aGVycnkuZGU+IHdyb3RlOg0KPiANCj4gSGkgUm9zcywNCj4gDQo+IE9uIDExLzcvMjQgMjo0NyBQ
TSwgUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+PiBSZW1v
dmUgdGhlICdkZWJ1Zy10d2Vha3MnIElNQUdFX0ZFQVRVUkUuIEl0IHNvdW5kcyBmcmllbmRseSBh
bmQga2luZCB0bw0KPj4gZGV2ZWxvcGVycywgYnV0IGl0IHJlc3VsdHMgcHJpbWFyaWx5IGluIGFu
IGltYWdlIHdoaWNoIHJvb3QgY2FuIGxvZ2luDQo+PiByZW1vdGVseSB3aXRob3V0IGEgcGFzc3dv
cmQuICBUaGlzIGlzIGluY3JlZGlibHkgdXNlZnVsIGZvciBsb2NhbA0KPj4gZGV2ZWxvcG1lbnQg
YW5kIHRlc3RpbmcgcHVycG9zZXMsIGJ1dCB3ZSByZWFsbHkgd2FudCB0byBiZSBleHBsaWNpdCB0
aGF0DQo+PiB0aGlzIGlzIHdoYXQgaXMgaGFwcGVuaW5nIGluc3RlYWQgb2YgaGlkaW5nIGl0IGJl
aGluZCBhIHZhZ3VlICJkZWJ1Zw0KPj4gdHdlYWtzIiBzdGF0ZW1lbnQuDQo+PiBUbyBwcmVzZXJ2
ZSB0aGUgZWl4c3RpbmcgYmVoYXZpb3VyLCBkZWJ1Zy10d2Vha3Mgc2hvdWxkIGJlIHJlcGxhY2Vk
IHdpdGgNCj4gDQo+IHMvZWl4c3RpbmcvZXhpc3RpbmcvDQo+IA0KPj4gdGhlc2UgZmVhdHVyZXM6
DQo+PiAgIGFsbG93LWVtcHR5LXBhc3N3b3JkIGVtcHR5LXJvb3QtcGFzc3dvcmQgYWxsb3ctcm9v
dC1sb2dpbiBwb3N0LWluc3RhbGwtbG9nZ2luZw0KPiANCj4gU291bmRzIGxpa2UgYSBnb29kIGlk
ZWEhIE1vcmUgZXhwbGljaXQsIG1vcmUgYmV0dGVyZXJlcmVyIQ0KPiANCj4gQ2FuIEkgcmVxdWVz
dCB5b3UgYXQgbGVhc3Qgbm90aWZ5IHRoZSBkb2NzIHBlb3BsZSB3aGVuIHRoaXMgZ2V0cyBtZXJn
ZWQgc28gdGhlIGNvbW11bml0eS9tYWludGFpbmVyIGNhbiB1cGRhdGUgdGhlIGRvY3MgZm9yIHRo
YXQ/DQo+IA0KPiBPciBldmVuIGJldHRlciwgc2VuZGluZyBhIHBhdGNoIGZvciBpdCA6KSA/DQoN
ClllcywgSeKAmWxsIGRlZmluaXRlbHkgYmUgZm9sbG93aW5nIHVwIHRvIGVuc3VyZSB0aGUgZG9j
cyBhcmUgZml4ZWQuDQoNClJvc3M=

