Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0189BE64AB5
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 14:36:35 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.55])
 by mx.groups.io with SMTP id smtpd.web10.21243.1733236593873811517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 06:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lxioEgAk;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lxioEgAk;
 spf=pass (domain: arm.com, ip: 40.107.105.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dCU554o7l2Y7XMp/nLqovRRXl/XKbNDDYoBQDlbfYZGTPdcJe063MecRmN3RIPG4rvWNP6pNK6CSuwmE2ITRa61slbpfmIZj9tW9YORToaNa5LTShv/30js+82MVBZmpyjYLBM5J9BqL8evEjicT2L879zZ7hb37hWSmAqizEdPRULhrYyhQcrEQK3n4WxHYPVe6bQ/c0tUVW5Usd57AGetkAtJi63UOfBZDfSaZRDJoMUCAj+hhVpLnd1YO4CrYlzkIuQ7JaqNrtRemTNDvfyGONmKlVDhXd4kbH8h11b6SNYr/Qox/ZZdOfGQk5LuXqhhKqvVl8NKpmB9bl56VBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09aUPRxhLYFOJjFkLeG3hvRq7LyhqJCnqYrLBI8rEXQ=;
 b=Jxvp7iUMQjFHweQCnrBg6vDjFSJw1MgtI8XUS0wE655is0WDR1ficiFexyaaZGGYad8awzxYgZ+rRvIvjt/iXoA2SsGw+85hZWy0Eq0fHcCUf0P1Zz17zbnLsnXnXGlLSQfn299QPFsAEokUOn/BD/4NtiqIeRR2YLYXObGZBeoXOqSvJuZ2xM0ueRDrGgppenweooh3MlW1WV4w3Oeq9fSnFmvdHEy4wzvRBKRIbIDAQA9iP0N6Vlxeq9JMHGxJb9YapTy2B/dPhcIj1zxU9Z5KPCnvhQPBAusV27XxneOahAEqLFBYRZyeO4VJnw5L17VzjnWOfvKvh5tfZ4HU6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09aUPRxhLYFOJjFkLeG3hvRq7LyhqJCnqYrLBI8rEXQ=;
 b=lxioEgAkZfLKtMN0EoVlw/PqnDc2CEgRUvaJWU2HeZYq/mbhXmuIF7iGXgi5rEx9KGkjeoda+NO56lI9ry8xyYUFKOdTKwvq2teNPgDgcI6sUIHD3UeSKrkeugBHdPdVdEPxgoFmuQmeLHlBbNrpMrOee/+5FyG71AbIFgNLAnQ=
Received: from DU2PR04CA0201.eurprd04.prod.outlook.com (2603:10a6:10:28d::26)
 by PA4PR08MB7412.eurprd08.prod.outlook.com (2603:10a6:102:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 14:36:26 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::62) by DU2PR04CA0201.outlook.office365.com
 (2603:10a6:10:28d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 14:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 14:36:25 +0000
Received: ("Tessian outbound 206fab1c37e0:v514"); Tue, 03 Dec 2024 14:36:25 +0000
X-TessianGatewayMetadata: 4lFOiRPp9jD2PTUoUrnxji+6gEOTO9CIGS8tHfWiBEhVFCk/cpNzL6IOfqXahwu33HM1DweU/bmWehPN90nRWADSXwz+whPUVYeDIc7u1IXqnnZZuSguca1fkFtqKkV0n/lumSWHH8bmZZcNHrAtc1ClUD8yCDgRoE1d45eSKTs=
X-CR-MTA-TID: 64aa7808
Received: from La6488502d501.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E64DBA5C-AD4F-4B10-9BCA-1FCB49CB2108.1;
	Tue, 03 Dec 2024 14:35:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La6488502d501.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 03 Dec 2024 14:35:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Il1JM3uvgEdap+vsUN3z7LwSPXr0k3yW303/Hxu4h0OG3/jf3itI2yjISABvurk83MdwKANGnBXMZxNTAfgcQBalztYJFEhDM2l8isK2YYJAMLTf0UBcSxpTfQqaSi+nf+bo1JPcaL+0blJp7PZJ5FbGnbgxlI9qa31OesLiR0fWPS8qWmJa6i5rMqYRA+uoM9bWNqIXUdgsAkCzVStA7ZYgETw0HLZlT5YqORrAuqRUPNHqS8RDkS4Yc+22FummrFnrWhJqGArRbV2PGxfNFKSLlPLWdogrRTGWJ5zIkRaFUSKhxb+4l8JxTKRVPhIH/gnjvx0NEjOQfiRcGvjKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09aUPRxhLYFOJjFkLeG3hvRq7LyhqJCnqYrLBI8rEXQ=;
 b=Tw5YHqlukV4cHTuXJmI+8MHvdJwNH+7YK4dMWIXvaWo6MqeUmJvUM2/GR/dQ6TBf4NOV95qaWmON0EFyB9k5tB19wHfBG/qYCnkquOXj9y6x6w6emRcTV0qBT5IiRznOx2eWIGjClVzgvdgYlt2vAsLGL74SOdKo2pAqGRHguR1c68q8aLVVTBNqKzMDXaFzVG5tLi7R1D8uSZzvS47HOpvx5Ueu5AFy2hBP6G4AzthcRuwWJi4xUSeUo4Faa+ibZnDfPNnMjzyG2j0SP9OLvsARE3oxTxx+LiW5QqYIB30PsMf/0ebtnPHo/G2vVEDc6bKwU1RdGD5t+S9CVGAGHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09aUPRxhLYFOJjFkLeG3hvRq7LyhqJCnqYrLBI8rEXQ=;
 b=lxioEgAkZfLKtMN0EoVlw/PqnDc2CEgRUvaJWU2HeZYq/mbhXmuIF7iGXgi5rEx9KGkjeoda+NO56lI9ry8xyYUFKOdTKwvq2teNPgDgcI6sUIHD3UeSKrkeugBHdPdVdEPxgoFmuQmeLHlBbNrpMrOee/+5FyG71AbIFgNLAnQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9429.eurprd08.prod.outlook.com (2603:10a6:20b:5ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 14:35:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 14:35:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe-ore][PATCHv4] libsecret: add pam support depending
 on DISTRO_FEATURES
Thread-Topic: [OE-core] [oe-ore][PATCHv4] libsecret: add pam support depending
 on DISTRO_FEATURES
Thread-Index: AQHbQwVHqNLsHiZgJ0iaS/8tZxpsGbLUe3KAgAAX9wCAAAfCAA==
Date: Tue, 3 Dec 2024 14:35:42 +0000
Message-ID: <9664D9A5-729D-4162-B930-57BA029B67D8@arm.com>
References: <20241130085222.17448-1-f_l_k@t-online.de>
 <827A4F56-2328-4ED9-9E3E-6096EAC35E46@arm.com>
 <YK8XNS.89RO2UFNG11R1@t-online.de>
In-Reply-To: <YK8XNS.89RO2UFNG11R1@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9429:EE_|DB1PEPF00050A01:EE_|PA4PR08MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 4583ff70-24b3-4a98-3464-08dd13a7ddca
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aVVGN3hrSG5CTU5oR1dKZjBGTmFJVm5VMUdFRzBHOG14a3hPRUZZTVdEWjBu?=
 =?utf-8?B?anU1YnlHamc3ZzRnZTlhaUV2dXVtWnVKOHJ4WTNHZnpuT21EV0ZRWGROd29j?=
 =?utf-8?B?Q0dTSGlTR0VCNW5NcnlVZ0VjV0pYWnBWczJTV0I1SW5IYlpJU3JkeGRyQTdp?=
 =?utf-8?B?RnNiV2tQS3RNeWFXTHI0c3k3dVcxbUdKeVhTbDJoT2ZEVC9ucENpU0cvUUpm?=
 =?utf-8?B?eXpvNmFJSVN5c3BpSnY3RTd2aE1kQ2dvWVJwTGU4WGJTR0xBQkNwaU1VcUMz?=
 =?utf-8?B?QXhXM0drQWZyYWlsV3B4Rml0VEdzME4yZEFVbmV5VVlaSU9kQXBuZHBKbnVI?=
 =?utf-8?B?K245OXkxVWZFSjh2VElML294T2c2Qk1OQ3daakFJc2g5bTRac2trR2EwN2ZB?=
 =?utf-8?B?cFo0azBDT0kxdWFtdm04ZUJzZFMyVGk0RU0wTWtuR0NnNTdKVDlwalQ1NFIz?=
 =?utf-8?B?S2hObW5IVTdRMER2LzBERGY2WFdaZjFkTFN2RmFsazl6RXA5V1pvdGhMS09X?=
 =?utf-8?B?dkdjZXM4eDRxNzRRbUdBQ1U5QVA0OUJ6RmNFNzlYSFZ0UXJSd2ZremJtOVZw?=
 =?utf-8?B?VXQ3d1Y5SlYwYnhHUU5OOFZ1Tld4TzdTZ2M3b2h5SGlLREMzc2tjcjlVRmdS?=
 =?utf-8?B?T3pabkdoQ09KVEwzSmNkQkNOOEowb3hkOWVWeVEvQ0k5K2c0SmUvc3p5VjNE?=
 =?utf-8?B?ZWtqeklVcS8vQmdpRk5TaW5rQ3lxUkF5RkoxbnlqUG9FUExSY1g0ZDNjaXNH?=
 =?utf-8?B?YjJzcmc2VUNWSzAvNHpvR0t6Vnpta3N3dnFNKzhHMTFUK2c3WWZ5VkF0NHVs?=
 =?utf-8?B?UWhreVNkdWxpemwrd3hpZ0o1MWpGK2lYUk9FL0ExaUVmVkcydm1hUlFEL3Q5?=
 =?utf-8?B?L3laWko0Q0FscVU3cHNvc2VLd1dzRWJkUGcxR044N0xsd1N5aUJxUjBzRjMz?=
 =?utf-8?B?U0pubzR4RHVCS3ZzcjJlMkJmWlJ6RExxcllGWmZsUzJhKzBRcW90dytUS2JJ?=
 =?utf-8?B?V0tKeWZCdWtCNm5GdkxPcDRqMnRNTzdzWS9zWVlBYmZTZEhBQXZpLzdHZFVq?=
 =?utf-8?B?eUZDMTRzdjhIeGlHTHFDTmwrRDg2M0s3QXRUWjB2R25CTHZIS3A4VzBHTWJZ?=
 =?utf-8?B?WWl6bGRUTi83ZHVWMmxqM0s1dlMrNkZIUHR5OVRFNG5Lb0xmaFlBWWtGeit2?=
 =?utf-8?B?Ti85aUJlQldkVDEyVmRUdCtpTk1MSnpQaStQRTFYcllPNkFuMlArRTJGMjdz?=
 =?utf-8?B?RXZRK2xhM0JKQ2toUVlJQk11aVFSL2Y5K3J5b0R5TVZrRnlENWR0TkpWaERt?=
 =?utf-8?B?cnJJZVRwcGlGMGJUL0FrditHWTNpSmkvcDhYeXNuSkpPSFVDU2w2WnBWWXU3?=
 =?utf-8?B?VVZ6Y1ViblNUSTJ5clBaUnppaEp4Y2FWSHlaUnEzdzNFdzJlb0k1U1hXUGRL?=
 =?utf-8?B?S2xuTjE0VEhtSzBBQUlFb0Q2QkxTdnBKcE9xN2h4VFc5THh0YU1EODlWaEg3?=
 =?utf-8?B?V3BkbDZrS0V4d1o4V09Xckw3UVhQTXBhUEZkbzloVXo1Z2poa2wyTW5RS09j?=
 =?utf-8?B?OFhyS0VTSzZTRjlWcHo0aWdHR01yeXlmdWVkaXRjaWdUOHhMV0lNQ0FsK1Zw?=
 =?utf-8?B?bzJJUzJYRTUzVEVMbG5tOXFESGRQWHk1dWFqalYxK0wyV2RPRGt0Y0gwZWdx?=
 =?utf-8?B?RlpmNkhFa0ZpS1htN3QxeEJ2SENnRStBb3J1bjc0dnQybUNKTmIyNGFCOE9q?=
 =?utf-8?B?b0hCc2FlSEx0SDN0cHZteExoWWU4c1ZJa21xMzlFNHFlZWEvTTg5aDJSUkx6?=
 =?utf-8?B?bWxIWGVFSzNiMzk2MEF1dXBiNEJhSUxXT29YV1B1OUtITCtFNkU2T1JNU29D?=
 =?utf-8?B?UFZuRkQ1Q0Y5SEJLNXFWNForZHFUS05SUG9HL3FSdDNDTEE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EB4E30A85CB7C418A7639BF7D384634@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9429
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a1c123bd-b852-46c4-b087-08dd13a7c40f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bGV5R1djRzFidHkzYU9RSUZkTnBiaVVON1VHdlU3MjlNRUo0V0dBTk1peVgr?=
 =?utf-8?B?dXRhNDBickVpa2xnSUw1QXRCdE5IQUYwekNQNGU2eVdMazlGUWhncDZROWNP?=
 =?utf-8?B?N3RLbEZtMEpGMDNIRmVxdytKcnhjSTRsamVIdTR2eW9XbWpTMUNMTHdxQXQw?=
 =?utf-8?B?QjZLZCtCc1Yzdy9zYmlZcFlMT2RWajRURld1SlgyeHlBTXk4anR6UnRTMmZw?=
 =?utf-8?B?OEpnOUhTNWNMMzVmSkhnQ1FDRzBHa1lkUVhUUUNBT2g0a0Q3N09hQnVZN1Ny?=
 =?utf-8?B?KzdnbXBJWkF6WXhFeTJCMHdRV1VWeDZXU1RpS0hROG1yQkxDQzdFZE1CbEg1?=
 =?utf-8?B?V251RUs4UVVUTG5HSXdnai94c3ZNVHZEN3dkRjFvM0tVZTgrMmNyYVlmSytv?=
 =?utf-8?B?ZFJqTitOUUFmV09DRHZOMHZaQ2p0TG5wUERCZ0xHcHhTNmRjK2dab3dJdjd3?=
 =?utf-8?B?UkduNk9SVmRZcHVWQmtYSUEwTEc5OHpUdDZQY3JPTHZHRkVqSE5iRk5aT3RY?=
 =?utf-8?B?UTN5b010SFdxakxpNG9ma2lNdSs0OE9xSmNFUHRMQXArYUt3UmxBbVBldXJQ?=
 =?utf-8?B?dGZLT01NZ1NQK0dWdzdXU04vekpWWG5MSTRXdVlDMjQ2dXZCZEJOZ0R1WVZU?=
 =?utf-8?B?MDkwc1FuajdlbnlBMFdseldPMzBwR3BxNCtsTmlrL1BIRjNmdUJ1c1VmRXVx?=
 =?utf-8?B?bThmVEVQR2RSekV2OVpnSWlmY0tPVDZyd1FkUms0YnptN29BcnZuN2pvTUJl?=
 =?utf-8?B?cWxncjBZNWdtWm5zMG9aOWxVMDBDaDhLUGlWNHFQWnluRDNUZ0s4Sy9oUmMy?=
 =?utf-8?B?QVNPNTMvTjFOb3RDeHcxZGJFVGJPZkU0NVdrRlJUcGJTWVVVYWhmNzkyUzY3?=
 =?utf-8?B?Z2d5M1l2RVlkekNxeWtSR1lTcE9mN0EyZnFCM2hFRC9ZS21ubEhNMkNrUjc1?=
 =?utf-8?B?bGFUZlBROGdhYXh3NDUvbFJ2RndQWldKSkFlYjBVTHJTM2t5UjcwNG5YRThS?=
 =?utf-8?B?THVFSEpZYVcvWFJGdll5MVlwZGp5Y25BTEp4NEdnRnhvQ2dMdkxQam0wTDJC?=
 =?utf-8?B?dEx4ZnZYcFljN0FGTGRqTUxpaXJxNVppQ1hhaDNGSzA5UFpwWmJxNStMbnFi?=
 =?utf-8?B?TmZ4WnNYVXRJd2RBNzhMNEhsWTZVNk9NWEY2Q2pzVjFuNEg2cE1pcHZwOWxK?=
 =?utf-8?B?OW1Kam9HdGZzc2hKQk50N2Z2bUJIT2tGQkdpa1VaNU8vTjlDS0VKR3pqVnVM?=
 =?utf-8?B?SEcyZktmTXZLZ2R6UkttdXYrYmluVktYNkZWa0tLTmxmMUNsU0Zna2ZrbGc2?=
 =?utf-8?B?czBEV1dYaXhyTWxWU092b0lHM3YxOHliMkV6Z3hRSHk1TVNScHNaMG1HU2NT?=
 =?utf-8?B?U2RwYlVkaGZndzdObGVDMnpJaXExcmxERjdiL0d3N3JlcWhUZEFlOFRhaXVN?=
 =?utf-8?B?Q2FOS1BXNG5tY2NhdzlVaDBCUnArajFkWm51eHA5QlBVWTY5NkxqcnZDTVVm?=
 =?utf-8?B?QnpoaEJRQVFoQzJhVmwvU2NoSGp6T1RFdzlycGZvUlgzbldjSFJLV1Q0MUFQ?=
 =?utf-8?B?WGw0NldnTGU5elIwdzhhMkJFNXhBRDY5Nkg1S2o0MFNCaGJJM1JlOHlFeVpS?=
 =?utf-8?B?VEZkdFZwdmpPTldjSFZCZ296WERXTFBkVUdpU3QwOENCRkJjK2VwUkQ1S3Zl?=
 =?utf-8?B?bUw5Uk5ycGRIL28wemtPdGFhTVUybjZxbDBiaVg5eFFWYld2ZVppS2FNSDhw?=
 =?utf-8?B?cVh1bnVSR2lSQWNaV2dkZGQyZWhHNldqajVnQmsydzk1WWFhRVR5UlZzTmtI?=
 =?utf-8?B?SThYMDNXdzNscC94Mi82TXFVL2VHNW9Xa0NlbGFKVVBpOXQvc2NlN3V5Nkgx?=
 =?utf-8?B?ZEN0Q21rQU5tQVFBTEFZNmtlQ2VsbkJ6alBySVExTG9VR3YxR0c4c0RIZEFi?=
 =?utf-8?Q?RQEm7kHTdPyphTtfCBEmQtfZ7eihj+yZ?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 14:36:25.7648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4583ff70-24b3-4a98-3464-08dd13a7ddca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7412
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 14:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208216

T24gMyBEZWMgMjAyNCwgYXQgMTQ6MDcsIE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4g
d3JvdGU6DQo+IA0KPiBHb3QgaXQuIEN1cnJlbnRseSBJIGhhdmUgaXNzdWVzIHRvIGFjY2VzcyB0
aGUgZ25vbWUgZ2l0bGFiLiBXaWxsIHNlbmQgYSBwYXRjaCB0aGVyZSBsYXRlcg0KDQpZZXMsIGV2
ZXJ5b25lIGRvZXPigKYuIFNob3VsZCBiZSBiYWNrIHRvIG5vcm1hbCBzZXJ2aWNlIGluIGEgd2Vl
ayBvciBzby4NCg0KVGhhbmtzIE1hcmt1cyENCg0KUm9zcw==

