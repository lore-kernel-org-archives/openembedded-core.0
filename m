Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC68D132D1
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 14:20:33 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.60])
 by mx.groups.io with SMTP id smtpd.web10.58560.1730730029086028812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 06:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JmpAqir2;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JmpAqir2;
 spf=pass (domain: arm.com, ip: 40.107.247.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cPK8spuJk3ZO5WR2pxG+5c7ezow+c6NzFkUuDm6NNQeOLZEVqqSZtWWGT/rS56qx7nYKxkGiPTVfxLZsPjpidgVcb7Fef0uUM/jdG1obDQ0EY79ioEJYH745ANA7PPECEO8YL5aaDlK2J769dGhT5aj43TzkL3JBCkRyNftLqrLP//e3lLhgQLvqJzV/9vhzU5FMIMdT5E0QeJ1vlpeypxJuhMnoUdyLwJKAa2P1ywA9KbUPbYYNbL18wQze8+L4ZbSPbWRT+UOtPhVQjS5QCul/dMfAQJ3L82NNXB7LWHl/HC0Wq+MzgqNBBuFqpgwHnWF6E3UtRR2zG9eSiYajng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXp+LCD1c5Hw8nnyVeD7abvpXthg/1rG4pHtVdZLFu4=;
 b=pG+AxsZgriTG7gwGlVY1/YN3pCR29XR5sX9xq0y61SkfCoE3PCms58p/lmfOre/CISmsTQt+eavHEUusOyZFUWL763KtnJITOMP3+E0eg5NsbE3NkWbLqTI7HR0u6i1YNSKY/uF5MTQ361jt03dEZRbTzVzsyULtiBQ/AsWjRrnRmDoGcHt3ImNIj9R8jCtlBp3O/erveY8SXXASS7IpDvcHLNIIx+/pSbiJjQExmjb1gAMS6OHBgtPorGPi3BBn2R89kXx6Fyro/9pLT5gD2W9rURoSDcuqpRd5d7lTzUp6sO4BxtgscFuQpxPy2+pr/xvibYOIdlHnTPM+wurMHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXp+LCD1c5Hw8nnyVeD7abvpXthg/1rG4pHtVdZLFu4=;
 b=JmpAqir28XvXgPSKTLHozpwxcIbPj5I31jlKwEFd7mx6+21InAfytwQcQxE9JTS/ob72lfaEyAUU+GBQ6tgbZE1ManyiouFdw5rtDHAwN2KOGE5+c7HHlDZ5hGn0lyrwl7ANSwB7Obv1n8NsBEX73VaRNXrb3pLcuDm5z+7aBus=
Received: from DB8PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:10:110::33)
 by AM8PR08MB6516.eurprd08.prod.outlook.com (2603:10a6:20b:363::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 14:20:24 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::f5) by DB8PR04CA0023.outlook.office365.com
 (2603:10a6:10:110::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 14:20:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Mon, 4 Nov 2024 14:20:23 +0000
Received: ("Tessian outbound 0fe1877cedb7:v490"); Mon, 04 Nov 2024 14:20:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 23004022eebf7b99
X-TessianGatewayMetadata: DbOH1VrhnUBSoWMfeIMxlcrRs3gBvD41SgLFSSGvfuCBpztq2SOEUfEHgvhKLOhWH756mcfrzCFsO+KcX4vPV5xktbvL5P38+manFMw1Ldmk6KoVpj07uGDIBbdNkBlsKpg57adqF2sGSBo9fgzdaNrhjn3fOeDlH3tLUS5bGqY=
X-CR-MTA-TID: 64aa7808
Received: from Lfc54e3f7a87e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 152456A7-2DAE-482C-86AA-C17A349935A1.1;
	Mon, 04 Nov 2024 14:20:16 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lfc54e3f7a87e.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 04 Nov 2024 14:20:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+SAML25tQrZCfqGBZsMimeHZMPwnFeZdzblIoED6w/FZxM8why4vkl1O4dOlXiDOTkeq6JXBcDD8DNvpoQx2KIMMhwOxSrNMkHuxIx23heg5+NvnkSMgZlAV23+sbUjpsIx0F+IxFdK7QZFQSDRWSWKefavXQlQpA0KS4qBt1uG9NmeVXuZiE7ynIoRRkbKPYknb+Cx/yEhNYDZNpM8nap8gpLSi56CA2U3HIZVlT3WuxNL1vLtvTaQMx3sOaXFoewSrg7WEZ3w8kzYIs2Hl5SOzho7wW/ZDPp8/1MgxgHoWmAM0H1SQUfd24HnGSVSTK3SpWCtcyr+/quu6zZuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXp+LCD1c5Hw8nnyVeD7abvpXthg/1rG4pHtVdZLFu4=;
 b=Lk/IvfqGQ7RvOHcOXi7UGEeJCENEla6YK5+mhNUG0D+suX4JXTGLxSIW2PasV6hjzSiaNiyecVSTk7xCVpGp/VcrIBcPWf8HiXV2Muk6uSPsca6cH2vctVHzwUnCW2Dim+VQih+jNIB1FZVaTb5G8H0b+toZ04o/ICw1l1Pn+D5b4iBkHQBLZWZfpWpt1qvg2wKU0Irpu6CqQRAxS62Vwex3ANVelXqDOxoCeOUMR6OLyKRmuJRhLI2rQ/CqlDRiSyQCTVBFVUiSE3GlnIZq6qd+OkIS8/MvaJxHF9TzQ/5FJ46BffB0K5W3QCT+BhrY12tpIZg6y1LhOjrCnFNfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXp+LCD1c5Hw8nnyVeD7abvpXthg/1rG4pHtVdZLFu4=;
 b=JmpAqir28XvXgPSKTLHozpwxcIbPj5I31jlKwEFd7mx6+21InAfytwQcQxE9JTS/ob72lfaEyAUU+GBQ6tgbZE1ManyiouFdw5rtDHAwN2KOGE5+c7HHlDZ5hGn0lyrwl7ANSwB7Obv1n8NsBEX73VaRNXrb3pLcuDm5z+7aBus=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7938.eurprd08.prod.outlook.com (2603:10a6:150:8d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 14:20:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:20:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Trevor Gamblin
	<tgamblin@baylibre.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.1.2
Thread-Topic: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.1.2
Thread-Index: AQHbKjoSdv/YvM45x0CAs4yfwlReRbKfWfkAgALds4CAAMMZAIAEOgwA
Date: Mon, 4 Nov 2024 14:20:12 +0000
Message-ID: <13BF7241-1A92-4653-B4B9-FEA628356BE1@arm.com>
References: <20241029193745.2919129-1-tgamblin@baylibre.com>
 <ZyJBQBRRsLFov02a@bootlin-mathieu>
 <CANNYZj9wt-pmRrGYwE-RRSTX3+VtcU7h_Cug6woqs4k_9NSpNQ@mail.gmail.com>
 <53C5ACAC-FD02-457D-B24D-42DDB1568859@arm.com>
In-Reply-To: <53C5ACAC-FD02-457D-B24D-42DDB1568859@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7938:EE_|DB1PEPF00050A01:EE_|AM8PR08MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 614b0948-ad2e-4c78-10e7-08dcfcdbd1fb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?U1RIU3B2b2lVQzhoRUdjclU2cEROaEpnY3QvWXEvckxPcWdXanZ6azZXNkp3?=
 =?utf-8?B?WEEzYnNyZkNQWTlqd0wxQnZkcm5RRzVMSTk4cnQ5OS8yQUlVaEpXbXVpRHlE?=
 =?utf-8?B?RTVKODR4MFlEVHVtTHlTTGtnTnovV2Y3QTE4RWNYMXN2QzV4ZnVkM0tKY1lq?=
 =?utf-8?B?QkRRTzY2TU5EOVBLaWFpci9RM2NFME1kcXkrK1k3MVFWYjMxMzBSbHQ4KzI5?=
 =?utf-8?B?OGhLemh4bUczd3M0ZmIxUFFiUEw2NjZSZ1BXdkpKYVU4dHd6Z2xwL1o2bW15?=
 =?utf-8?B?NktJVUJmVWxvWEx3V01pVHFtK3pYS3REd05YamtWUUFQNEFwdGhmYk1iWFF0?=
 =?utf-8?B?eUNiZG42cVVFYTZnbEhVSGNiVHpuMzZqYmlLQUkyMWRGUWl1SC9GUDd3STJy?=
 =?utf-8?B?SER2N0l1bmY3aG5YZGZwdjZ6RVIwUWlPTStQUDFaMmpJTkR3WlpiRzZ1U2F4?=
 =?utf-8?B?a1h3Y3lYLy9Fbk9kQTJLaDEzd0IwNG0wOFBRakN4c3FmNEM4VmZZM01ZYWc0?=
 =?utf-8?B?aWRhbEcvRkdadDlKODZVMFFjeE9WbmFiSXliMTQ5SWZwRFVEQUQzWDN0OFl6?=
 =?utf-8?B?QzlGL1F4aVVHQmFsaFdobXRmVDB5YWZoYk1mTGdVeWdxWjJ6ZGdJWHgvSnRv?=
 =?utf-8?B?MGQrbFJvZUJuOG1INXRkOXhzY0QzOUY4S1NPK0dFQjVuNlJKSi95MnNwUTBZ?=
 =?utf-8?B?MlZidjRNRGxmRDMrNzFPbFdvVGovL0pxdDJVNnYzNTNWaGVQTm5lSmtvdElT?=
 =?utf-8?B?VTZrUVg5WnBvSUZBU3dhaC9CZnZtVDY1ZXlOSGZGN0dkTXk0WEpHRXNrYTll?=
 =?utf-8?B?UHF2Ti82cjFDV0w2eW5HSlZhK0VQaUFiNC9say9POXdXNTh0Q242TEU3dncv?=
 =?utf-8?B?c1lKWXBSd3BQOU9Ja0Yva3Y0aUs3dzN2WVdqZEZPNmlSdnpJcjJ6Yjl2V050?=
 =?utf-8?B?WlJySXRSTGhYRmZhTC9oVEcvR0E3N0JtK3N4Mld2RDg5UFJiS3Z3UVNUS2d4?=
 =?utf-8?B?N29PM3I1NDNIRk5kK21QZnBuZi9EbjBLbE5CN0M5S2lwMnpsRUxwL21abCtr?=
 =?utf-8?B?T2YvdG85cVQ2M1R0MndscmNFUlZOL3dNRk5sUWw0QlJFaFdsbzVQbmxIdFFB?=
 =?utf-8?B?cjdWTXozcWplTU44TnZacEI1b1N0VVRtQ01iY1M0ZjQ0UXFUeEh4d2dLV0ds?=
 =?utf-8?B?V3N2em9DUWExdnZYYkZKempsbHJOazBpczZCNUhMS2dnUEdnMFBKTlhYelVo?=
 =?utf-8?B?SVFxQWlwaUVFOXUzSVZFS3NTeDNIQklmOThON3lEWG9NM3liUDVXVVhXOHl3?=
 =?utf-8?B?RC95SUZtdTEwVnF3dml2Rkx2b1hGc0xybWloSGVzRFVkd1ZHN29iMCs2YUx1?=
 =?utf-8?B?OWQzWXdUTTFibUF1RDBYZlJUOG42Vnl5dDBxK013NTY4MTMxSUJ6Z2FsRERs?=
 =?utf-8?B?Vyttd2FkNkRkeG9wMVhsaFpHeHF6UEJwODJmUUV2WHZZcXRneGY1akFRZEVm?=
 =?utf-8?B?OW5KT3Z5b203d09ZN3JyQkgvckk3M0VCUjY3QTh0N2JxSzFBMXNkZTdjQWJ5?=
 =?utf-8?B?MXl0RjdQdUozTjBpbTNCMzB6NmN2UzJ1a2QwRTd4M2t5V1hBTWgwekpiSWU4?=
 =?utf-8?B?Rm5FVXMrTXlvWVI5WDdVbm9rYkFNeXc5Vnp2K1lwRTdxK3BCNEFScTNaYkI0?=
 =?utf-8?B?YkNDdHp4YUFxUjJyK0Q5dXpCcFc4Y0Zpd3pRYURVU1k5Uk84VFI2bS9mZmJs?=
 =?utf-8?B?K2hkcUQzWkY2QVJISytZcTdKWXhqc0NMUnJReEZkUmU3QU5nd2xCNXFseVIv?=
 =?utf-8?Q?EWpeYrkGiAynqtuP/B3brHArEvnP641Lwi8O0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F21C4E48A6608040BE3D22331D3BE2B2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7938
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	57544cdd-b82d-4e35-200b-08dcfcdbcbe9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|1800799024|14060799003|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aDY2aEV0NW5jTGk0NWlFamNGZFFCVEkxdGsxSjhJL0cxZGFMU3JwNHJSK3lO?=
 =?utf-8?B?VE9raDZmaVR5aWJHQUI0QktHeVFtSHNSOXl3VFRkUzkxejJqcGF1Zy9PVzdD?=
 =?utf-8?B?dUxYYzV2dHJYUEtZdmFPQkFzWFk1UlpvbE9SRUxkRkR3T0dyeG5mY2ZTTVdo?=
 =?utf-8?B?MENScnUwS01jdVVkMGIyK29xQ05QZnNFaENNM21iN3NidCt0UWhFdlh2bXQ0?=
 =?utf-8?B?QjIzbXA0NXBlc3dlMGd2QTdPbW1ML3pQSE81MlpvSjBiWTZMaElhT3ZMM1Ew?=
 =?utf-8?B?ZFpWNDNaMitXQjRNREhLVVF6bW14T2IyMXA0R0tkVTFJUVo2U1pnNmVJcE9o?=
 =?utf-8?B?ai8yb0pScjhPWkFoL25DaEdHNGZ3VXNqcnhPV1BwOGRsZ0wrVm9qZ2xaNnBj?=
 =?utf-8?B?N3cyNjJGT0dYNjU5djgrZGFBMlUvRDZlMWFzR1pLdWtDRjQzZmg4VXlKK2d2?=
 =?utf-8?B?S0VwMmRFSUNWY215bXM3QTg4WVNleUZUVjBHZkxVL3NQb1hRQ1d3VUtWM2kv?=
 =?utf-8?B?eUZmUVdpTVlPUUh0VWxJb0dVbVZHaTY0Ny9jRTVSK3M2M2NmVmU1Mm5jMEJL?=
 =?utf-8?B?ZDdwVG9KV1RDZ09UZ2drM0Y5SGNUTXM1bXdjY2JhbDJRT3UxbzVUWTN6MllQ?=
 =?utf-8?B?ZFdQd2VDRUVkVGhxOExmQTYySlhrbllNajhkU21xSEVqV1E3MHF4T01jdzA5?=
 =?utf-8?B?Q1RSN1RwS1ppYjlGeVdJeUNHQWVmQ2hpdVQrOS83RnlwNXJIWWNYTEozL2N6?=
 =?utf-8?B?aXlJR3pKay82ZWM4RlMzV2I3Y1NzMm9LRVJDUWJ1SXh6bUxzVzczMEJPSUw0?=
 =?utf-8?B?TDJIY0ZkdnJmYVdFYlNzWFNERktxZXhKdmxpdmVXVW1jaldXeHdLcWE1TVVM?=
 =?utf-8?B?eHJKWHNXUlRHUDJYY3g2Z1ZDdWdZbzdzeXdaSFBKSWpla1NwVGNvNHE1eDJO?=
 =?utf-8?B?cWxiSlFYTVRlY3F0b29FODIwRHljSTZMektCRklmbi9yV1ZsZ0w4bEhhZG9S?=
 =?utf-8?B?ckpJTVFhazBNbUVJTlNqbU55dFB1Zm1OeGdvNkcvSDRTdWVseEI2Uy8vNjR3?=
 =?utf-8?B?SnFnTzdIWG91RWpUd0FaMThXWEZ5R0l0dmIyYkkxdXZiV2FkZmdzTDYwM09O?=
 =?utf-8?B?SUpLcTZuRjRwdyt0Tm5kY0xZV1Q2VWZKbjJ3NWFDYysvSFNjcEVXNmNjNnRQ?=
 =?utf-8?B?UVBPbUk1a2NaM0ZyN1ZZbEh0MkFheDlLNTUzbm53U3FXd01meDJyWG9aZXRL?=
 =?utf-8?B?RVZnSzM3czhaeGQ1NGw1NElHVzkreHNCYXhnS2NqNUNCZGtOM1pKMWx3ci9T?=
 =?utf-8?B?ZXpGc0FxazZqV29BcHZMKzIzYWN6T1VjcXBPQkorc3p0L3d0dVVBWnhXeE8y?=
 =?utf-8?B?TjR2dkJwYUFOclk5NmQvMWRGMjJIN21Xa2VuSE9FQUY0blFoQWQ1ckExNUsy?=
 =?utf-8?B?YXdTOFQvNXdLN1Nkd3N5QStwT3k3V2NDeldFNmN3Q3NxT2NKSlJyUVNtdGJJ?=
 =?utf-8?B?emgwUVJFVVZUbHJIOGxnaDJFUmlUNm15RmJtQTM2SEEyK0wyOUloUG11QlFK?=
 =?utf-8?B?dUpBV3NIc05udWdPOVJyR1VadnhPdVFzaWh3YkVpOVJ3NzB6RnFpVldhK2xO?=
 =?utf-8?B?cjg1RGFHZ2hlUS9PeUtiNGQyL1grMklHNGdoNVFEL3BwUlNiblhFWjhSR1JL?=
 =?utf-8?B?d3Z1SHBXY3l0ZzBSWEJWaHBZemRHdkM5RjU5d2hLQ3RzVkZrYW9QUU1pZ1hM?=
 =?utf-8?B?Yks2OWx0S0xFc3RZRDhzUGRubkZGemgzSFc3MnVROTdVVzl3blE1OFBSejRP?=
 =?utf-8?B?M3NEMHIxcWdIUk9KWkRiR2hwN3lMWmtqU09qeHBieTczMVEyVFEzL01ndEpB?=
 =?utf-8?B?T2l2WVhYb1QxSWorVkYrTUNGOW53Q0FqOEhVQTBOQ0ljSkE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(14060799003)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:20:23.0540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 614b0948-ad2e-4c78-10e7-08dcfcdbd1fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6516
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 14:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206681

T24gMSBOb3YgMjAyNCwgYXQgMjE6NDcsIFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29t
PiB3cm90ZToNCj4gDQo+IE9uIDEgTm92IDIwMjQsIGF0IDEwOjA4LCBBbGV4YW5kZXIgS2FuYXZp
biB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IDIuIFRoZSBzZWNvbmQgaXNzdWUgaXMgc2xp
Z2h0bHkgdHJpY2tpZXIuIFRoZXJlJ3MgYSBudW1iZXIgb2YNCj4+IGdlbmVyYXRlZCBjIGZpbGVz
IHByb2R1Y2VkIGJ5IGN5dGhvbiBhbmQgdGhleSBjb250YWluIGxpbmVzIGxpa2U6DQo+PiANCj4+
IHN0YXRpYyBjb25zdCBjaGFyIF9fcHl4X2tfc3J2X3N0b3JhZ2VfYWxleF95b2N0b19idWlsZF82
NFtdID0NCj4+ICIvc3J2L3N0b3JhZ2UvYWxleC95b2N0by9idWlsZC02NC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L3B5dGhvbjMtbnVtcHkvMi4xLjIvbnVtcHktMi4xLjIvbnVtcHkvcmFu
ZG9tL2JpdF9nZW5lcmF0b3IucHl4IjsNCj4+IFB5T2JqZWN0ICpfX3B5eF9rcF9zX3Nydl9zdG9y
YWdlX2FsZXhfeW9jdG9fYnVpbGRfNjQ7DQo+PiBldGMuDQo+PiANCj4+IFRoaXMgbmVlZHMgdG8g
YmUgZml4ZWQgYnkgdHJhY2tpbmcgZG93biB3aGVyZSBpbiBjeXRob24gdGhpcyBzdHVmZiBpcw0K
Pj4gZ2VuZXJhdGVkLCBhbmQgcmVwbGFjaW5nIHJlYWwgcGF0aHMgKG9yIHBhcnRzIG9mIHRoZW0p
IHdpdGggc29tZXRoaW5nDQo+PiByZXByb2R1Y2libGUsIGxpa2UgJ3JlcHJvZHVjaWJsZV9idWls
ZF9wYXRoJyBvciBzaW1pbGFyLiBUaGVuIHRoaXMNCj4+IHNob3VsZCBiZSBzdWJtaXR0ZWQgb3Ig
cmFpc2VkIHdpdGggdXBzdHJlYW0uDQoNCknigJl2ZSBnb3QgYSBwcm90b3R5cGUgcGF0Y2ggdGhh
dCBmaXhlcyB0aGlzIGluIGN5dGhvbiBpdHNlbGYsIG1lYW5pbmcgYSBwcmV0dHkgbGFyZ2UgY2h1
bmsgb2YgaG9ycmlibGUgY29kZSBpbiByZWNpcGVzICh0aGF0IHNpbGVuY2VkIHRoZSBidWlsZHBh
dGggd2FybmluZ3MsICBidXQgZGlkbnQgYWN0dWFsbHkgZml4IHJlcHJvZHVjaWJsaXR5KSBjYW4g
YmUgcmVtb3ZlZC4gIEnigJlsbCBob3BlZnVsbHkgZ2V0IGl0IGdvb2QgZW5vdWdoIHRvIHBvc3Qg
dG9kYXkuDQoNClJvc3M=

