Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D897C3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 12:10:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.83])
 by mx.groups.io with SMTP id smtpd.web11.10217.1720699828241287136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 05:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nGFIbxXP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nGFIbxXP;
 spf=pass (domain: arm.com, ip: 40.107.20.83, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Fyvbbxj2c5Gkx6Rl7RuF2H3xoafZVH+ZRjSKMSQ8Z+KB8FUjMWsLHTfScyZLa9qfGYRujNkfPeVDyXxfNJq5xaYCDSmRWXfrfIHoI5TyO9STQt9p+WyJOC8+HB/D1p7t76FxhwwrEbyctaZ4DBiFdZjQlezxlIaXqsFGkw1HE9tZ3S/n1UhO9Gsj2DfhGzEariKPgetetPX91gfAqSdrui3JUzMGnfC3ITzxUHl6o1ToRGggGPXpYcFdw+qikVhD6lGvzvyZwjvoh9YsdWCyFvdKX6Om7k0RsEwqFJHm3VYkmmJBm5LWzYwTQVQsM116VdJhiTTPtIwV7wlqhWExrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkZzF/MlthFKyz3sTuobkFyDzZNQSedPzsukwfOM1hw=;
 b=kY639CfMlZzitYKvB4TAzRgMr1cKJ8KKJv2r9MFnsFf0LTcK8lw0xJTbuHzjTLWMJpoKeAIcA8Y6nWkNSVPRsIuPpAa/03YBzE1WJvnXdpNRZOkr4QcZc28x12qX3Eu/+Qsd56QqVbOmCDAUJEGzzOI9vrd1I+xnO51zbp2KuSol2SiJlvlmTQNXRynid3qAPqMOjvMYSOBus9c5KKZMjS6Ve3ENvxanirtt9b3v1/lFFz29X7AsemO+b8UT+Filf+WZw52wmY+lWAt6+9AXF62cbVLOckUmvZmRVUaeqUllwZQnDSlNHxNzT9ZZmcuCe9o6ql85kaP06Wt4dL38Iw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkZzF/MlthFKyz3sTuobkFyDzZNQSedPzsukwfOM1hw=;
 b=nGFIbxXPclosBDDFKWAhsPan0UiuyozSRtRGtjX++LC6Yce34veApVojiYQV5mLH2DcQpuje+949HVL2MRZRmQQble+E6iSusPWT3FFrImioiPlL0VKvflHh6s2dX2FQ0PJ00fFkMO7DX6NRU6laZxhVRhaloQaj+EugftIVLdE=
Received: from AM0PR03CA0009.eurprd03.prod.outlook.com (2603:10a6:208:14::22)
 by AM7PR08MB5416.eurprd08.prod.outlook.com (2603:10a6:20b:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 12:10:24 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:208:14:cafe::8a) by AM0PR03CA0009.outlook.office365.com
 (2603:10a6:208:14::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22 via Frontend
 Transport; Thu, 11 Jul 2024 12:10:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7762.17
 via Frontend Transport; Thu, 11 Jul 2024 12:10:24 +0000
Received: ("Tessian outbound 22141d90e140:v359"); Thu, 11 Jul 2024 12:10:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5d81d3e0db0426c4
X-CR-MTA-TID: 64aa7808
Received: from 46bb988412df.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9FAE0746-57B2-4340-83FB-89FE7B7E5D04.1;
	Thu, 11 Jul 2024 12:10:17 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 46bb988412df.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jul 2024 12:10:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1Yp8lMnxOLR2GqIHJ5WVQgrosL+Mv1wgUgmxlTSjNRjzqppGd4J3oAUjBzFPiXeXpGx2xQChFp9xIxZJkRDOr5kxFow8/ubPiSmj/WUX3HrELvujWQFIR8Y7kh0rjWb57fBK4P5t5q7OnX5Hg+KwTJRgoF3/5Mi2xAa7xp2Sz5mgA9NVGDclmW8e1J4v7eSM3t8qtAPKrKopUSaNuEQ7CSanBVTW06TPqqmQ61bFg7RbLEmRDNeL8XaBE2f1u46NHWdWo5cWjaXRD4ZcTFnAIfZU2hzAmlMC+NTrJn9XmEndMXW85SRg4GkclICUlY+/xRh8AhyrOjed86fsmO1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkZzF/MlthFKyz3sTuobkFyDzZNQSedPzsukwfOM1hw=;
 b=ldz4qWT+OWVyczDR4/lSmoiHtUMJU8nm80sCxj02bEIqzc/4/wTQw+EpQ8V744DEI3HCc4Byg2KVvbDfTpC7QlgHEAKoYG4M8sCEi6rFZVkh6O+PPujaIXq4gCIX2pRbcgdCw+OYOviGE2sEC8mUHzHePXRmlob0NRBRmB5+prjtSVbI7nVQmdJvqVqij6EgQR+19j9vmPXSiF+7vZ1yU5VUjumwc/spCuMcKpxrt3mnXrXiAcfLN7erHr3RMqL21Bi3NAV2GKOdNgYw+s2pxC2Ix2blSyq2jV9lA2NmEY1Eh8vfEyICY3RP3Y4H0q+/iRWTQswo3Q8Peue+pQ7k/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkZzF/MlthFKyz3sTuobkFyDzZNQSedPzsukwfOM1hw=;
 b=nGFIbxXPclosBDDFKWAhsPan0UiuyozSRtRGtjX++LC6Yce34veApVojiYQV5mLH2DcQpuje+949HVL2MRZRmQQble+E6iSusPWT3FFrImioiPlL0VKvflHh6s2dX2FQ0PJ00fFkMO7DX6NRU6laZxhVRhaloQaj+EugftIVLdE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10992.eurprd08.prod.outlook.com (2603:10a6:800:257::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 12:10:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 12:10:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] distro/include: Add yocto-space-optimize,
 disabling debugging for large components
Thread-Topic: [OE-core] [PATCH] distro/include: Add yocto-space-optimize,
 disabling debugging for large components
Thread-Index: AQHa03UTj/NsfrTKskSdumDcK63m8LHxb5kA
Date: Thu, 11 Jul 2024 12:10:13 +0000
Message-ID: <60E368D9-15B3-430C-800B-14BEF1E4614B@arm.com>
References: <20240711093045.1166613-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240711093045.1166613-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10992:EE_|AMS0EPF000001B4:EE_|AM7PR08MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bba1ee2-0f46-4619-1236-08dca1a27188
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TDhrMENUNlh4RzM1eGU5NFpHZjhKU0pPK0VPY3RkNHR5eEdqS0xhZUlMRGw1?=
 =?utf-8?B?eGhrc1poRkF1YmdVRU9mZjZuL2llUHVtME9zZGd1TE5PWHIxQW9LUy9Jb1dn?=
 =?utf-8?B?Y2lDdFVpdGNyVWpzcGVnb3Q3RmRqV0dFWjdlSVZSc2tmRmhWb3Baci9iWGVw?=
 =?utf-8?B?TENFc1o0SGVLdGJDOTFJb2Y0eVczMlQwSi9DckQwVTJONjk1M3NsWnNPY0o0?=
 =?utf-8?B?c3l4ZDZwelBYUlFqRjFBUXg3dnB3NjVCTGdQOCtTUlNPN2ZKZ0x5RXhQU0Zu?=
 =?utf-8?B?Z2Y5c1cvUGhZRzNQdk9JNDIySGZubUIvUUZPRmppVEpLNUx6K0FJdnE0VWJK?=
 =?utf-8?B?NGFVdHM4Y29HZUdSaFVnWHlVM0F4TzhjdjZORkRlSDF3N1dKZFdPeEFLbzBZ?=
 =?utf-8?B?YTlNeWtLd2t2cmhFTW11ZFZZWGtUREpDOUl5WkpPTkhCc2JwOUduU1o0MldI?=
 =?utf-8?B?VW5JUllKMWhWVUF0dkRyc2JrcGFQVlZNSzJ4Q2lQNjVZd0F6SEgwS09KWm9Y?=
 =?utf-8?B?bThvMWpweC9BVHNiVHM1VlowczdLZ0tCRk5vT2cxM0RUNmhnOXlWL3c0d1FH?=
 =?utf-8?B?Ums3ZStBMWF0TFJ4Qit1VFVwRTlEMTRuQVh2MTNVSy8rMlRZRXlhdHdOeWpo?=
 =?utf-8?B?UERCNG9KakU4REJwcXg1WElkMWRTWk9neWhNNUxzUnM4c1EvUmVjRGowWDd5?=
 =?utf-8?B?ZnJ1SkVRcjFhSkQ1YXhydllDcFlzN2dxSTBHT3E1TU1JNmt1ZGdwODk2Qnho?=
 =?utf-8?B?dkU0Y2s2YmFVZkc5WGpQYmlyOTRTMUQ0bUM3eEI3bmJ0aytRV0dzOFdrZzU4?=
 =?utf-8?B?YmgyVWRwTkd6dHlGMnhuc3RNbDZLcFRQNzFGNE9oVC9PNGN1enowOXBHdzB1?=
 =?utf-8?B?alJoVExjaHZGSmNDZHJmUlhFTGZUTTByZjQ2d2wyaFNUMlVXZkQyVEtFWER3?=
 =?utf-8?B?dERsa29TL0NzanhQUFJocHg0QjRSUEJDeTV6N0dSRm5NU05nOWtJSVlxM2tZ?=
 =?utf-8?B?UW81TUIwbCs4bjY0dmxjcE9neHN5em16NTcvek9LZnRlSGxsbW1xZ29iY2FH?=
 =?utf-8?B?TGd6THRJV3FwU1luZjRnRmVncVdZTElvWjVFL29lUUpHc1pMZ05LYWl3S1VX?=
 =?utf-8?B?VjFDTzVaM0h4WDdYYUtyNFlHTU1QdHNaeHBramxCL0hlR0FYZGNQUGV6NHNT?=
 =?utf-8?B?TWc5enlyZlVmdHE5VFJ1NGt5QUNPOU8xblBlbnBIcVFTcW5FaHJhanpOeHFO?=
 =?utf-8?B?MlY3RGJvbktSV0d0WWptMWUzaEpVdk9BTGxiM0NqWEFubHhhTjBGcUVFNEtu?=
 =?utf-8?B?OC9FYlJLSkN6N200RFJVZ3FOLzZ0aEJPZHQxRzdvU0xENEF4RDF3dk5PTzND?=
 =?utf-8?B?c2w0NEhGak5WeEs3VUJENWpmZitWdlFjWVhBb1dDdlc4SDdSZEEwYVdIQi9z?=
 =?utf-8?B?WTIxb1BxenlONTlBRXFnM3BqbWl5NTZtVmxMWFVTM0ZWRGRXTVRvaVBhRjg0?=
 =?utf-8?B?U29LUk9uTDFoeVlYaHlkOWx6N1Mya1V5Nmpva3NnczM2V2F0SkFCNkVSUzAy?=
 =?utf-8?B?ZEJYd1dmOTNFSkN6RTEwaS9DdkpLdGllYUk2RDlWK0hlRlpwenBNMm5tVDJI?=
 =?utf-8?B?bUdlNHFON1puZWVOaGdpc0QyeVlZZlQvc1c3UXlETXVKbGdUbXd4Vk5tUkFK?=
 =?utf-8?B?NFNvUjluY2J4VHYwdXZVQ0w1TGp2SjNUWXNOYm5vWUROTFhiZjdFM2FIL2Nz?=
 =?utf-8?B?ejMvUkFOMWVpQnZFUURzUGJjMzNVWWZMakV5ckVQUk9qOW1ERFNITi9IMFIw?=
 =?utf-8?B?MTYrazJqc2s4cjBaOWJaUUtVZFF6UDFwTFhyQW1LOXVOeXVtNHZHbEVHMlYx?=
 =?utf-8?B?N3lJZlhUY0hPbmlrclFTRGtzdW5ubUlTaGQ3SVNCT09WMUE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BEFD9CD3FFF7945832DF3EB57080A45@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10992
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5131fa62-2afe-4d27-0357-08dca1a26ae9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cU52SXg4Z1RFaGJMb0RTOXJheUZIay9HSktZNkdBVEdyTHhnMU1IOUUzRGl0?=
 =?utf-8?B?WXkvTVkzanYrY2NrTko5SEV6ZjRaRUVLZFo0WTJXcGtVK0RIN2JSTmExTHlw?=
 =?utf-8?B?ZVArdTZtc0pvL3JyYkdGRCtRc0xtOVRZQXBkMEpsc1dmYXB0YmdXcGdiNWJU?=
 =?utf-8?B?dmo3djA4Ym96Vkg0UlEzb3JTbnFOckgyWUM3anZLV1hDcXJHdWVQZkJuMGNQ?=
 =?utf-8?B?UWFORjZkclRrc1dZNkhVbllEdmhoNnN4cWNDaktRb254YldxMTFEdjNHRWhJ?=
 =?utf-8?B?amk2bGU3TFdpTCtYaXQvK29oNmFORlVXUFp3dnk5ZlB5UW1iL0JhOG5RQWdV?=
 =?utf-8?B?a0NZVnBRRTNRQXRUNHc4TFdPckcybFZtQjYxenZrWXBRSm9WbEZBdi9ocUUx?=
 =?utf-8?B?d3laWHYrejMzQjA2TDhOL2xyejk4VFdBRENyNGN2K25NRUhWeWszamNxem8w?=
 =?utf-8?B?MVZYeWFEQi95ajF5TFU5bHFsU1MwdUJhenIwc1lWaW52MWc1cEo5dHk2RmQ2?=
 =?utf-8?B?K3lrWjVYYzltWml1M0FweFpsS3dGNVpETDBuUWRVWU9BY1A5UlZJanljRFQ0?=
 =?utf-8?B?ZnZ6RnZFNEFvVERqb1IrUnR1cHloa3FCUWNPZE9OZ3FnVHk2WFhrZ2RHaUdD?=
 =?utf-8?B?SWhLcGZYaTRDdW9KcEZkTzhsbVdBUkttbzFhODJ4ejkraU9JR3RXc3ZyWVB2?=
 =?utf-8?B?UzQyNVhGazN4K04yZ2s2K0x0UVVJS3dBbW5xYjBzcTJTNW5HUXhkZE5LODNE?=
 =?utf-8?B?VzRhblliRSt4ZTNGNUtyR2U1ejFQTFQzR0tzbkdFU3Z5anlzQVVjSFl2NUtV?=
 =?utf-8?B?RndZQmZCSHNLRHExZzBrNHU0Wm9SMFVVMDI4dUNTWjZtU3JTb09wZllrTzZn?=
 =?utf-8?B?Tnp5ak5tMXZnbFpqL2ZuWU1PektWNWJET0hSMmRtTGZTczJYVm5WcjZmeHFp?=
 =?utf-8?B?ME1OZG1BYnhuQm1VcW1SQ1JMT3lic3hiRkJPZk82bGdCRUd0NVc2RmE5Zkxy?=
 =?utf-8?B?Rm15ejFpV28xcjlQejZCODhXc3JOSitveUplKzZJczFMUTBmUk1Tb3hIUFdJ?=
 =?utf-8?B?NXdFNDhnN0I4NjA2Y3VTM0NvRFUrZko1OU5XZXVNSSs3czVqelEvV3R3Y0x3?=
 =?utf-8?B?VFhqTmhZZC9oUEdyRG45N0V1ei9JelpXNjBreFdEUzNNS1l4QU1EdWVxT1R0?=
 =?utf-8?B?Z28zWk5JdzRjeFJXa0lvc0ZIVTBPUm1ONC9HcklNNVAzM1dPZGlrNTdVN281?=
 =?utf-8?B?cldYV2RVbzYyS1VTaUdKUTNZQnNRZlhwVG9DR1JkWGRoaXduVHJUdHJvcEhZ?=
 =?utf-8?B?Zlk4NDVpSTlHSEY1dzlIU3lzS0liekI2a01teW80WHBaTmQzL3ZOLzRzWGVT?=
 =?utf-8?B?dXRvUjRKUGNzZ3ptMzg1ODNwN2g5U3J2Qkd4MFZIQnQ4eW5sVWVGWnZwOU93?=
 =?utf-8?B?WnFpMXd4bFJEbVplcUIrWTJPTHZlb295K0drK2hNempqcHNCclA2Wmw2cGZv?=
 =?utf-8?B?YTNRcTNXWUtTTE43WlpmNFYzTWpOVFBYalFVVlRsZnRmQlh0T0hSeUlRRHdE?=
 =?utf-8?B?YWl4akRpY1VUK2ZJTWowNlZtUVFCSElaQkwyaDdIZFFJOExqWWZ5U0s2TCtN?=
 =?utf-8?B?K2JGRGQ5aWVzMUYvUHRFWU1wWFM5MEZYUjV6c0xYeFZienpqaEVPK2lLaUx1?=
 =?utf-8?B?b0hWSC9hai80WEZFUDZSbkZyK3VzK2V5RHZjT0QvT3pwQytVVWNpQU5UeWNz?=
 =?utf-8?B?OVFaR3cybVVTK2NMUEJFQzJlSlBNYVdpV0lVR2R5bUwxUFBKSVBkYU5nTmU1?=
 =?utf-8?B?ekZtaWxHNGREMFdSak1JNFlsSnVaQmgyc2JUbkpjbGNDdFhreEVWZHNGL1NT?=
 =?utf-8?B?cWJrbWY1M2o3Wm9UUWJZTWlqSFVTK2kyeVdsRUlTdzRtc1FvbzJDUTZNM0Nx?=
 =?utf-8?Q?p6SovolewkO1PhW3umDKQ/6ahQhDqDJS?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 12:10:24.0659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bba1ee2-0f46-4619-1236-08dca1a27188
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 12:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201778

T24gMTEgSnVsIDIwMjQsIGF0IDEwOjMwLCBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmljaGFyZC5wdXJkaWU9bGludXhmb3VuZGF0aW9uLm9yZ0BsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+ICtERUJVR19GTEFHUzpyZW1vdmU6cG4tbGx2bSA9
ICItZyINCj4gK0RFQlVHX0ZMQUdTOnJlbW92ZTpwbi1xZW11ID0gIi1nIg0KPiArREVCVUdfRkxB
R1M6cmVtb3ZlOnBuLW9wZW5zc2wgPSAiLWfigJ0NCg0KVGhpcyB3b3VsZCBiZSBkaWZmaWN1bHQg
dG8gdW5kbyBpZiB0aGUgdXNlciBkaWQgYWN0dWFsbHkgd2FudCBkZWJ1ZyBzeW1ib2xzLCByaWdo
dD8NCg0KVGhpcyA6cmVtb3ZlcyAtZyAoc28geW91IGNhbuKAmXQgOmFwcGVuZCBpdCBiYWNrKSBm
cm9tIHRoZSB0YXJnZXQgZmxhZ3M6DQoNCkRFQlVHX0ZMQUdTID89ICItZyAtZmVsaW1pbmF0ZS11
bnVzZWQtZGVidWctdHlwZXMgJHtERUJVR19QUkVGSVhfTUFQfSINCkZVTExfT1BUSU1JWkFUSU9O
ID0gIi1PMiAtcGlwZSAke0RFQlVHX0ZMQUdTfSINCkRFQlVHX09QVElNSVpBVElPTiA9ICItT2cg
JHtERUJVR19GTEFHU30gLXBpcGUiDQpTRUxFQ1RFRF9PUFRJTUlaQVRJT04gPSAiJHtAZC5nZXRW
YXIob2UudXRpbHMudmFydHJ1ZSgnREVCVUdfQlVJTEQnLCAnREVCVUdfT1BUSU1JWkFUSU9OJywg
J0ZVTExfT1BUSU1JWkFUSU9OJywgZCkpfeKAnQ0KVEFSR0VUX0NGTEFHUyA9ICIke1RBUkdFVF9D
UFBGTEFHU30gJHtTRUxFQ1RFRF9PUFRJTUlaQVRJT0594oCdDQoNClNvIHdpdGggdGhpcyB0aGVy
ZeKAmXMgbm8gb2J2aW91cyB3YXkgdG8gZ2V0IHN5bWJvbHMgZm9yIHRhcmdldCBsbHZtL3FlbXUv
b3BlbnNzbCwgc2V0dGluZyBERUJVR19CVUlMRD0xIHN0aWxsIHdvbuKAmXQgYWN0dWFsbHkgcGFz
cyAtZy4gVGhlIHVzZXIgd291bGQgaGF2ZSB0byBrbm93IHRvIGRvIGVnIENGTEFHUyArPSDigJwt
Z+KAnS4NCg0KSeKAmWxsIG5vdGUgdGhhdCB3ZWJraXRndGszIGhhcyBhcHByb2FjaGVkIHRoaXMg
cHJvYmxlbSBhbHJlYWR5IGFuZCBzZXR0bGVkIG9uIHRoaXM6DQoNCkRFQlVHX0ZMQUdTOmFwcGVu
ZCA9ICIke0BvZS51dGlscy52YXJ0cnVlKCdERUJVR19CVUlMRCcsICcnLCAnIC1nMScsIGQpfSIN
Cg0KU28gLWcxIChtaW5pbWFsIGJ1dCBmdW5jdGlvbmFsIGRlYnVnZ2luZyBpbmZvKSB1bmxlc3Mg
REVCVUdfQlVJTEQgZW5hYmxlZC4NCg0KSeKAmW0gZmFpcmx5IGFnYWluc3QgcmVtb3ZpbmcgX2Fs
bF8gZGVidWcgc3ltYm9scyBmb3IgdGhlc2UgcmVjaXBlcyBpbiBkZWZhdWx0IGJ1aWxkcywgYWx0
aG91Z2ggSeKAmWQgY2VydGFpbmx5IGJlIGhhcHB5IHdpdGggLWcxIGFzIGEgY29tcHJvbWlzZSBi
ZXR3ZWVuIHNwYWNlIHNhdmluZyBhbmQgdXRpbGl0eS4NCg0KUm9zcw==

