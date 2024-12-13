Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E12DE7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 18:10:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web11.2055.1734113411695835363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 10:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nY5YGI5m;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nY5YGI5m;
 spf=pass (domain: arm.com, ip: 40.107.21.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KB2DxWwhdacJsDl9kG3ytC9I3mTrj8ri15Ed0DhcswOmVu0l21v+ATgNkXcGpimTaYzwoRtAKt+KAnZPuLh6g7thahDOzgM8+sqmi69ZvxNzC28f8SN1gr2YkQsEz64EyJt1C0Tm782aUb1kKH/7Bt0Ml8q5VxqQNrasXJ6Bs+sl5aLav7k4JV8mE9ma0vRo+HCUGTG40lQ/8EczSISdLB04PPaTAYju7n61LWS8AItJ1PuSQLpKwDAfffDjpV9FYnem9bFvZqqvMtQFSpvMTCd+HvqpI9q2B9MvFjDoAImZoLl4RQgYbdTsC96lzOpYTJaepSyXvIpDJ7mIjxcQSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L+PA5r9XTi8aKM8rE9JO0m54PDjTiw4U6QsLOnsF4M=;
 b=xvFIDqVt04hLF4d4SBRFkIJgJCS0sxPRgDzH7MCiPg+XvEnHYonlAuOmKDFibBg2i/leT0NhNSTOF0A032P5AlUBJrv8qrP0c5vwolvipZoZlprlhX4DQCQ+nf4WX1/ir24frpPDjfbAG0x1zkpDVIE+GUY/2EPZEHPEoDPlZvHR6dFAX+tIjFOyCZFc2bAN8ZXfh9lm7AuOiCRWknt8xmllCfMEdvxRLG0R39ddGXmHg0XAf+W6TrhyANDHWaQHOdaHThOw6bxRTrV8NlqR7+h/jVdMcD/Y8B7w64aqz2RlXUB3Hod/3/3J9ZAU3XVjmTj7ldK7xw04c2PwiaqpGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L+PA5r9XTi8aKM8rE9JO0m54PDjTiw4U6QsLOnsF4M=;
 b=nY5YGI5mpOEA8ehPluRTRjMOLD0lXyNoEy/BgWEgBDcUXVG9dSJl8ElB5PV2+mje4yNYhBK7c1lMhgEcQVISme5hTth3kvHK4/37liqvOvJhEYrGLiwl5/0/jkWvdUt8480aSbQoy3mbwepauMyKOOWI6/hwPQw+rVIQBiJuPK4=
Received: from DU2PR04CA0235.eurprd04.prod.outlook.com (2603:10a6:10:2b1::30)
 by PA4PR08MB6205.eurprd08.prod.outlook.com (2603:10a6:102:e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 18:10:07 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::f8) by DU2PR04CA0235.outlook.office365.com
 (2603:10a6:10:2b1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 18:10:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via
 Frontend Transport; Fri, 13 Dec 2024 18:10:06 +0000
Received: ("Tessian outbound 2d228e31de9a:v524"); Fri, 13 Dec 2024 18:10:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c53897f69c437976
X-TessianGatewayMetadata: S3PhTs6MEQQK+h2NmNGDMYYQZDApI/mTX4TJjH0qEtXNjywjBfn7v9Bb1tGrchDFkqi3yFzfYsdyt6cWdhXXXBrI58Q6U3ZvIPuwwaYEliHw5k492Nkcr+cYRALdu5/08emkMLI0Cwax6R1KvL4xVkd5DS9GhL8z9StTgB5mDJI=
X-CR-MTA-TID: 64aa7808
Received: from L8c5f519ffe2e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B44B829F-7CAF-4298-A098-D2E947BD1219.1;
	Fri, 13 Dec 2024 18:10:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L8c5f519ffe2e.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 13 Dec 2024 18:10:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqd7ShuQjDAti7l+Zm3+b8Evj7ThfHWHh2X8MqSa3f0VQVyX1RTvdraNLSIBHgRlkWHj5wfnj0MNlcM83tx7/KxdVxbLQNO+/hbwPLwhXdVvXLbT7tBMvVBmbsK8cQPS9uOG8bK535upzXrwNk4a5XEZRiP9y+Ck42bHJR9yKvVKjcdGC9dp6XMrWNQqMfPMofvLVomKp5bXVnnqHU1XDvNVPIEBgto1laCDy4J9Uz2cBJTScfvigQOaChpeGiS7evyvNbR57dSF3pSJTCQU13PpkeEMeYPmT6Z7/iFTq5AdAcBw9Ku07PIRPAfaxn+OuwpgZiHimdxyzwcJHaiyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L+PA5r9XTi8aKM8rE9JO0m54PDjTiw4U6QsLOnsF4M=;
 b=kcpHmP66eP2H2tO8dUvzbG1ujCLg/hDqk5PuNDAvVPR02L3tnfVkYaw4Mw2cVcgI0RsmUrrbW65JiZHf3g/WnTwzV239kV/mrA2S7t/I9TvsLA2iMEPGJ/XN1sTU0v+ASBVi5zEUy646msgTfEwLS1lVqvurTZn+iizRU9FwMj67RR2FR7kNZAnVx6XA7AFxRwyRTpV6CA01iSCkqGqoyGAdMDGERm7U/oXmnOaoiqcYKFhkGOwogONHqik/GQLgLwIC/16E5alnw9kBBMTc6Mlg59jmp4iINqKdwNpNcbG9kbIJdtcWU3BJVdGQuR1gLf02ia8VxR9+rbDH2p0+Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L+PA5r9XTi8aKM8rE9JO0m54PDjTiw4U6QsLOnsF4M=;
 b=nY5YGI5mpOEA8ehPluRTRjMOLD0lXyNoEy/BgWEgBDcUXVG9dSJl8ElB5PV2+mje4yNYhBK7c1lMhgEcQVISme5hTth3kvHK4/37liqvOvJhEYrGLiwl5/0/jkWvdUt8480aSbQoy3mbwepauMyKOOWI6/hwPQw+rVIQBiJuPK4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5760.eurprd08.prod.outlook.com (2603:10a6:800:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 18:09:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 18:09:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, Derek Straka
	<derek@asterius.io>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] classes/pypi: update the default
 UPSTREAM_CHECK_URI to use the simple repo API
Thread-Topic: [OE-core][PATCH] classes/pypi: update the default
 UPSTREAM_CHECK_URI to use the simple repo API
Thread-Index: AQHbTMeTzGDow6veJ0a2mfHPMKiBs7Lj2GsAgABrgwCAAAYCAIAAMBAAgAAA1QA=
Date: Fri, 13 Dec 2024 18:09:58 +0000
Message-ID: <7AA9EF0C-E9EE-4E1D-A74D-DB4C1F1B95E5@arm.com>
References: <20241212185619.1599668-1-derek@asterius.io>
 <CANNYZj8dnzzoQOcPUzMxh0mQSK5Xsd4QxAbegHFXn5fLBDmtWQ@mail.gmail.com>
 <CADNbA1puOQNd-YL3anMpdpfxGHxwYUWM803_2Ho++oNE==7vvQ@mail.gmail.com>
 <CANNYZj_bngoCTdTHjYmnptiSBu8SLV8SxVgr0ZgV1NyesmhHLg@mail.gmail.com>
 <DE3FC97A-159D-4603-9121-1A6C27FF9AEA@arm.com>
In-Reply-To: <DE3FC97A-159D-4603-9121-1A6C27FF9AEA@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5760:EE_|DU6PEPF00009525:EE_|PA4PR08MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: c18cadd7-fba4-4a1a-b9f5-08dd1ba15fc3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RTE2dlRMQWwzcjFyN0hsbnpZd2pBR2tSc3NwSUUvRG9US3M4NXF0UFV1M0Fv?=
 =?utf-8?B?TndaemFGS3Y3MHRGL2Q4cmMyeGxMRDBKR3ZXaUxXUmd2TEFGOW1qRlNqNURG?=
 =?utf-8?B?aWlmTnY4dVVjOHp6ck5Ccm9OTGM4dFBBTnR0MXVLa0g2RkIyeGxZU09odFJ2?=
 =?utf-8?B?WGU0YjBTYUFkbTRISm9DbW93REgrTWpadHlsYjhoNmlRaFYzWjVsbnFwL1FC?=
 =?utf-8?B?OUIrZDl4MW9td2oxdWg0UUM2b1F0YktUY2t3eFFxTGN2cnVmdmxEby9lRXYy?=
 =?utf-8?B?dWs1MWxidkxwb2xYdUZUMldXd2pqbTNWdWlZQi8wWUZWWVYwRXpkYWVCV0Ni?=
 =?utf-8?B?TERsd1JRWi9kMVd4T3IrOGNVUXdqNTd4NDZoUWZ1R3RiYkp4djdVcEdrM2tO?=
 =?utf-8?B?SGlRc1ZvVjZNUFhpVUFUUjBqbW5XeXNCaW5DYVZ3V2dJYXZZT04weTNSN3Vs?=
 =?utf-8?B?dW9XenhMdUgzd1BHSnAzSXczV0FaaHRqQXg4UEV1b1JybmFGZ2ptcU9QWkdQ?=
 =?utf-8?B?aitXbUZKOVFkeUV3WnB0N0pwVXFUWFk2ZTJ2Yk55NnlqSm00K25Odys0a0tl?=
 =?utf-8?B?MXkrWGJtVllkbWtpMjRKTWhlYnVZWDZlSXUrOFVtRzB1TDRKZnFWSFJIMjYx?=
 =?utf-8?B?cTcycW9Qc0NUZzFDYklBaVI3S1dkRGFwbzFnc2EvQ3NRYUNaa2UrTE9UaEt6?=
 =?utf-8?B?N2poM3NNbnJpVDdGcUNQbDhoZVl3a1kvL2Zoa3NvTzliUGczZG9pSnRDaEx3?=
 =?utf-8?B?S0tka2xXQld1ME5tK2tHWm1Yc3g0T2Z1dENiWlBybWRDUytUUXRPMWVrK2tD?=
 =?utf-8?B?c2pTbnUreEduTUhHN20xZldMM0djRUhKY285SU9NZmlHYUNqQ3JsZXZKWmhY?=
 =?utf-8?B?cUpYekRld0VydVQ3UmgrMitRNWJDdGdtREUvT0ZtcmlKS2Z4NXQzRWVWa3RB?=
 =?utf-8?B?RmpNSWNGemZuR0hTdHdGZU1nWGhhdm1pcExLTyt1ZWtnWGNCdldnRTlMN2ly?=
 =?utf-8?B?SUw4NlNvNUxuTXlEUmN2U3BQV2JzUTNPVVhnVTJJQmhPZ0w1MjlRRzZCT29T?=
 =?utf-8?B?Y2E3SVF6dVZGZ1JWNWNBQXp4bkYxYW1OWS81QnY0WmpsVFp4WVI4MnBtdjM4?=
 =?utf-8?B?NlJxcU05YmlHMXNwRDc2bTBURGhtcVI2c09WUVl3dEh1eHI2TGpBYU51WkZj?=
 =?utf-8?B?NXo3dTR2Vy96eGJxeVlXaHl2N2lUK254Q3VObCtyaDhITlFFdXRWK1Rad0Iv?=
 =?utf-8?B?cElPTC96ZjY4YVNLNkJGNE0rWTRmNVFETXJpTUZXY1BHenFNYVJqVjdlY2l2?=
 =?utf-8?B?S1JnMHZBclFzR21QdC9tQXdDaHlJbmV1dDNUQzJFUFpVcjQ3RmcrUytRaXdY?=
 =?utf-8?B?ekNFY2kvRXhmU2ZyVmd6TmtOaklnTDcrZlNIMml6WklPTlhnNEVSVmtuWWJl?=
 =?utf-8?B?UjUxVWNCK2hLSWtUR1RPVW5ZaG4zQW1acUNOTWlwR1pzNG91akFVU1FXWG5H?=
 =?utf-8?B?dGgvTU1wQSsvU3Nia1AyaGN6OHdBUngwMVpJYnMxZlNZQ3dZMnhTUU1lLyt6?=
 =?utf-8?B?MzN5ZmhvODFkV2srTjhEUjdHU1lodEFxdXhWRllpSlBBSlh4Q2RGcGdsSmtU?=
 =?utf-8?B?SWhTVDMvOU1jODNQL1dTVk5TTy9LcE96OUh5UHV4UG9zRi9VUStGOWxLMFRS?=
 =?utf-8?B?VEhqcWVXY1pQQ0plSHZXaWxQTzVBQ01wcHNGRXRHUFdjRCtMZzRqUlVldnRL?=
 =?utf-8?B?MkY1UWZUQVNZbHlRc1o2WWpNT0g5UzVKMGdzYTh1cDZ0YkN2THZpNUpXTk8z?=
 =?utf-8?B?bU1GdThDR0FxQW5Ia1dTMGVXSUczS3gydzJqWFZnMlJnd1RsZGFMUUk1SHc5?=
 =?utf-8?B?QlQvRElMeHQrK3BOcHpCblgxQ1VsSE1zRFpQdkNPY2w0YXhTb0N5VEhONktY?=
 =?utf-8?Q?+EP9C7BZ4pdgWQU7ZgRbUfZ9WZs2ye5i?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D029792D5AD59F478B3F94D6E299B0C5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5760
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35d39a71-a002-4f88-dfdf-08dd1ba15b12
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|14060799003|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RkRNVElydkZmaHpTcUhLRUVFcDlhT0h1TUZ2Z0krRjBiZ0lIYytaWE1GRzg5?=
 =?utf-8?B?Sy93UXQyRlVJVzg1UDk0VDVZaEdrK09VYzdpS1IwVytDNkEyODgrVG1DOFUz?=
 =?utf-8?B?akcvT01uQ204TUhMYWZJbWd5WmI4RlpRU3k3OGNwWm45TExrTkJoZzl5ZkpI?=
 =?utf-8?B?OXhOd1R3OVNTRjc3dmlMbnE0cFluVSt1RWtwelE1Yzh0dG9xSTZIOE1lenNw?=
 =?utf-8?B?WmVNYXR5cUFkcGExQ1R0Uk83Ty9xcEpTTy9KUTZGdVBvS2U2M1AzTlN3SEpj?=
 =?utf-8?B?MnRzdHhPNWg5VGd0d2FrUDNHcFlhQjlTWEZCb1BGLzIxTS85N29OS0VZcmJY?=
 =?utf-8?B?ZjZkTE5TMEJIMXQxalV3TlowdUxFZ2JqZHQ4WGRna3JHeXRWV0FnZXJXRHJI?=
 =?utf-8?B?V2dyM2p1K3Q2SEpLcUd5L3dMWlExYllmamhoZUh3MXoyQTAzRUFLeitEVzgx?=
 =?utf-8?B?VzhwQy9oN2R3SUc3dVNXSE0yc2l4azlhNjJ3ajlaY29mc1BiOWFQeW44RExI?=
 =?utf-8?B?ZmpiNnFWaktCVVNkSHREbTQ3b2pHbDYxN1pKOU9TVFdmcVYvMG51UHNteW5Q?=
 =?utf-8?B?OVZHbEdJc0hXTHpqcElrd3NjSjlSSmhiZUxuQURoU0ZCaUNLenhGeUowMGNB?=
 =?utf-8?B?QTV5NzBGQUtjdjN0QUsycWFFZlc4ZDQ2cXM5VkRETmZzM3U1NXpsTEJXTzda?=
 =?utf-8?B?Z3BRSnNoUVBXcWpNQXdEbzNGZ0thQ3lNcWN4UmZLR3pPMlYvMG1mQzQyeis1?=
 =?utf-8?B?NVNrNnQ1SVkzZ0xZZ2Y2K3dXdHZyVFYwVkV0bTRNUFNPT1M0NG9KTDZTRHVG?=
 =?utf-8?B?REU2ZlQzSEtRdzhGcFRjbzVxaUhya25mWmZ5QVRHYzBjbjdxb2d1WjJXVENk?=
 =?utf-8?B?TG1sVHRKaWl6K2FYUnkrODNUSVQwODZxQ0h5YzRtMWtSWDFNcElUdHJlTTdB?=
 =?utf-8?B?VEJtTC93L3luc3RWOUhCblNRWisvd3B5ejBPYVZZK2FwNUZBRjZQalRXbzI5?=
 =?utf-8?B?aGxyazFocUlqd3pRNHE1alFrTXRENU9pcW5YZjFtZS9HK2x6YnkycjE0bkFi?=
 =?utf-8?B?Mkp4SHF6dmZGYVVnYlBtTGFXckRKbTNCRGhENjZxcERlbTBTTDlYeHE0VkZO?=
 =?utf-8?B?dmV1cW5odVJjWGhqUExSYVZTR0pqb1VCSVNWQ2dUVndtVHZ1RkJ6VHNFcStK?=
 =?utf-8?B?VlF0TmhOa2xCVFVmOURGYzQ0aU1IWjFsYkFYRlQyOWd6Zms2ekk3V3U2djIw?=
 =?utf-8?B?Q0lTbXlaeWgrRFVoMVdwYVRZZE1tVWZpdndHTmErdXZZQWwzK0pOWDZjS050?=
 =?utf-8?B?WkFySE00NVlvU1UvdHVocnZEaVJoWHlzL2l1TUpkM2lpSVpvUjcrM1FnYmQz?=
 =?utf-8?B?YTZiMW9JQVlvMFVPQnpYWk16aU0yR0FSMUJoUHRjc3N3UUV5a01NR1B2WG9V?=
 =?utf-8?B?TmFuL01qWnAzVlpxYWhxSHpGY2NNY1NwTmdhcXppZG1ieS9abnBKaUlVL3JK?=
 =?utf-8?B?TEJ3bExVOFdZOTBKMjlya0c2S2JtVzV2L0I0VngrUUZEelFNTDE0REsrUDJG?=
 =?utf-8?B?R2ZNZTNoNG0wd2Ruc1MyRVVQaktwb2pHSko4LzlDK0kvSzRjTUsyKzFIZkZr?=
 =?utf-8?B?YWJMU2tRYnVrT0M1b1JsVFRiK1M0VWY1UWpQSFlqTXp3K0R1dlhkTTFWNG8w?=
 =?utf-8?B?M1NRMVhnREQ1MHZ4MTZ2ZEs2d2UvejR0Zm02Slk2VTFGM2dybzgrUDJvODUw?=
 =?utf-8?B?UkRkUlVDQTRQUDdIb3hJY3R2dGtQSzgzOGloMGFmeXZpcUoxN3ZFQy9VQVpz?=
 =?utf-8?B?d1pJdnk2NU1NczdxU2RtUlpENGN0VVpPMGlXY3JIOTNPZXdiUnJWYVZhc2tM?=
 =?utf-8?B?QWlGSFRFdVhpcUYzL25xVy9EcS9jSDI1bjZUbUdESXd1RWd5b1BsNVkyMmtq?=
 =?utf-8?B?eDdsT1I0MDZUL1J3S3ppVlF3em0zM1ZtNDY1NXhCYVQwTjBSZGo1RWpmRWY0?=
 =?utf-8?B?QnA5TXJ5WjZBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(14060799003)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 18:10:06.6669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c18cadd7-fba4-4a1a-b9f5-08dd1ba15fc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 18:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208691

T24gMTMgRGVjIDIwMjQsIGF0IDE4OjA2LCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNv
bT4gd3JvdGU6DQo+IFJhdGlvbmFsaXNpbmcgdGhpcyBpcyB0aGUgc291cmNlIG9mIGF0IGxlYXN0
IHRocmVlIHdpcCBicmFuY2hlcyBJIGhhdmUgbG9jYWxseSwgc28gSeKAmWQgbG92ZSB0byBzZWUg
aXQgc29ydGVkLg0KDQpIaXQgc2VudCB0b28gZWFybHkuDQoNCk9uZSBvZiBteSBXSVAgYnJhbmNo
ZXMgYmFzaWNhbGx5IG1hZGUgc29tZSBzZW1hbnRpYyBjaGFuZ2VzLCB3aGVyZSBQWVBJX1BBQ0tB
R0UgaXMgdGhlIGNhbm9uaWNhbCBwYWNrYWdlIG5hbWUgKGFzIGluLCB3aGF0IHlvdSB0eXBlIHdo
ZW4gcGlwLWluc3RhbGxpbmcpIGFuZCBQWVBJX0FSQ0hJVkVfTkFNRSBpcyB0aGUgbm9ybWFsaXNl
ZCBuYW1lIChmb3Igc2Rpc3QsIGV0YykuIFRoZSBmdW4gaXMgdGhlbiBidWlsZGluZyBldmVyeXRo
aW5nIGFuZCBzZXR0aW5nIHZhcmlhYmxlcyB3aGVyZSB0aGUgcGFja2FnZSBuYW1lIGNhbuKAmXQg
YmUgZGVyaXZlZCBmcm9tIHRoZSByZWNpcGUgbmFtZSAoZWcgcHl0aG9uMy1iYWJlbCBoYXMgYSBQ
WVBJX1BBQ0tBR0Ugb2YgQmFiZWwpIG9yIHdoZXJlIHRoZSBhcmNoaXZlIGlzbuKAmXQgYWN0dWFs
bHkgbm9ybWFsaXNlZCAoZWcgbW9yZS1pdGVydG9vbHMgaGFzIGEgbW9yZS1pdGVydG9vbHMgc2Rp
c3QgYnV0IG1vcmVfaXRlcnRvb2xzIHdoZWVsKS4NCg0KSSBfdGhpbmtfIHRoaXMgd2FzIHRoZSBy
aWdodCBkaXJlY3Rpb24gdG8gdGFrZSBhdCBsZWFzdOKApg0KDQpSb3Nz

